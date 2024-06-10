import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertUtils {
  static void showAlertDialog(BuildContext context, String title, String message) {
    debugPrint("Display alert");
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title),
              content: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text(message),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                    child: const Text("OK")),
              ],
            ));
  }

  static void showAutoCloseDialogue(BuildContext context, String message, int duration, String title) {
    showGeneralDialog(
      barrierLabel: "Label1",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        Future.delayed(Duration(seconds: duration), () {
          AutoRouter.of(context).pop();
        });
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 20.0.h,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(2.5.h), topRight: Radius.circular(2.5.h)),
                child: Scaffold(
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.0.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(height: 1.4, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            message,
                            style: const TextStyle(height: 1.4, fontSize: 16, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    ).then((value) => {debugPrint('Dialogue dismissed')});
  }

  static void showSimpleToast(String msg) {
    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1);
  }

  static void showNotInternetDialogue(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Label1",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 100.h,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(2.5.h), topRight: Radius.circular(2.5.h)),
                child: Scaffold(
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.0.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(0),
                        child: Text('No Internet!',
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.4, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Please check your internet connectivity',
                            style: TextStyle(height: 1.4, fontSize: 16, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    ).then((value) => {debugPrint('Dialogue dismissed')});
  }
}
