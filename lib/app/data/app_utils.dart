
import 'package:e_commerce/app/data/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';

Future<bool?> showToast({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget showLoader() {
  return Center(
      child: CircularProgressIndicator(
        color: primary,
        strokeWidth: 1.5,
      ));
}

Widget showBottomLoader() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
        child: CircularProgressIndicator(
          color: primary,
          strokeWidth: 1.5,
        )),
  );
}

Widget showNoData({required String message, String? icon}) {
  return Center(
      child: Wrap(
        children: [
          Column(
            children: [
              SvgPicture.asset(
                icon ?? "",
              ),
              SizedBox(
                height: icon != null ? 20 : 0,
              ),
              Text(
                message,
                style: fontRegularStyle(color: textColor, fontSize: 16.0),
              ),
            ],
          ),
        ],
      ));
}

void showCustomSnackBar(
    {required String title,
      required String message,
      required bool isError,
      int? duration}) {
  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: duration ?? 3),
    icon: Icon(
      isError
          ? CupertinoIcons.xmark_shield_fill
          : CupertinoIcons.checkmark_circle,
      color: Colors.white,
    ),
    backgroundColor: isError ? Colors.red : Colors.green,
    snackPosition: SnackPosition.TOP,
  );
}


Future<void> showDateChooser(BuildContext context, String currentDOB,
    Function(DateTime date) onDateSelect) async {
  DateTime currentDate = DateTime.now();
  try {
    currentDate = DateFormat("dd MMMM yyyy").parse(currentDOB);
  } catch (e) {
    print('error caught: $e');
  }

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2200),
    builder: (context, child) {
      return Column(
        children: [
          SizedBox(height: 535, child: child),
        ],
      );
    },
  );
  onDateSelect(pickedDate ?? DateTime.now());
}

String changeDateFormat(String date, String oldFormat, String newFormat) {
  String formattedDate = "";
  try {
    DateTime reqDate = DateFormat(oldFormat).parse(date);
    formattedDate = DateFormat(newFormat).format(reqDate);
  } catch (e) {
    debugPrint('error caught: $e');
  }
  return formattedDate;
}

void showCustomDialog(
    {required BuildContext context,
      required String title,
      required String message,
      required String btnName,
      required Function() onButtonClick}) {
  AlertDialog alert = AlertDialog(
    backgroundColor: whiteColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    insetPadding: const EdgeInsets.all(20),
    title: Text(title,
        textAlign: TextAlign.center,
        style: fontMediumStyle(fontSize: 14, color: redColor)),
    content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message,
                textAlign: TextAlign.center,
                style: fontRegularStyle(fontSize: 14, color: textColor)),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton(
                // <-- OutlinedButton
                onPressed: () {
                  onButtonClick();
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: redColor,
                ),
                child: Text(
                  btnName,
                  style: fontRegularStyle(color: whiteColor, fontSize: 13),
                ),
              ),
            )
          ],
        )),
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



String getTodayDate(String newFormat) {
  String formattedDate = "";
  try {
    DateTime reqDate = DateTime.now();
    formattedDate = DateFormat(newFormat).format(reqDate);
  } catch (e) {
    debugPrint('error caught: $e');
  }
  return formattedDate;
}



void redirectToUri({required String scheme, required String data}) async {
  final Uri launchUri = Uri(scheme: scheme, path: data);
  await launchUrl(launchUri);
}

void launchWhatsapp({required String number}) async {
  var whatsapp = number;
  var whatsappAndroid = Uri.parse("whatsapp://send?phone=$whatsapp&text=");
  if (!await launchUrl(whatsappAndroid)) {
    throw 'Could not launch $whatsappAndroid';
  }
}

bool isEmailValid(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

bool isValidaMobile({String? countryCode, required String mobileNumber}) {
  String pattern = r'(^(?:[+0]9)?[0-9]{8,14}$)';
  if(countryCode == '+91'){
    pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
  }
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(mobileNumber);
}
