import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color PRIMARY_COLOR = Colors.blueAccent;
const Color BACKGROUND_COLOR = Color(0xffE2E7F2);

class CustomBottomNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int)? onChange;
  final int currentIndex;


  CustomBottomNavigationBar({this.backgroundColor = BACKGROUND_COLOR, this.itemColor = PRIMARY_COLOR, this.currentIndex = 0, required this.children, this.onChange});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange!(index);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes the position of the shadow
            ),
          ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          var color = item.color;
          var icon = item.icon;
          var label = item.label;
          int index = widget.children.indexOf(item);
          return InkWell(
            onTap: () {
              _changeIndex(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: widget.currentIndex == index ? MediaQuery.of(context).size.width / widget.children.length + 20 : 50,
              //padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              //alignment: Alignment.center,
              decoration: BoxDecoration(color: widget.currentIndex == index ? Colors.grey.shade200 : Colors.transparent, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    key: widget.children[index].keys,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.currentIndex == index ? Colors.black : Colors.transparent,
                      ),
                      child: Icon(
                        icon,
                        size: 22,
                        color: widget.currentIndex == index ? Colors.white : Colors.black,
                      ).paddingAll(7),
                    ),
                  ),
                  widget.currentIndex == index
                      ? Expanded(
                          flex: 2,
                          child: Text(

                            // label ?? '',
                            label ,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: widget.currentIndex == index ? color : color.withOpacity(0.5),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String label;
  final Color color;
  final Key? keys;

  CustomBottomNavigationItem( {required this.icon, required this.label, required this.color, this.keys,});
}
