import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Widget divideThick({height, color, margin}) {
  return Container(
    height: height ?? 2,
    color: color ?? Colors.grey.shade50,
    margin: margin ?? EdgeInsets.zero,
  );
}

bottomSheet(BuildContext context, Widget child,
    {String? subtitle,
    String? title,
    // Function()? onTapOk,
    // Function()? onTapCancel,
    // String? textOkButton,
    // String? textCancelButton,
    // bool? backButton = false,
    double? height}) {
  return showCupertinoModalBottomSheet(
      backgroundColor: Theme.of(context).cardColor,
      context: context,
      builder: (BuildContext context) {
        return Material(
          child: Container(
            color: Theme.of(context).cardColor,
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                indicatorModal(),
                if (title != null)
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                divideThick(),
                const SizedBox(height: 10),
                child,
                // Column(
                //   children: [
                //     divideThick(),
                //     Material(
                //       color: Colors.transparent,
                //       child: InkWell(
                //         onTap: () {
                //           Navigator.pop(context);
                //           if (onTapOk != null) {
                //             onTapOk();
                //           }
                //         },
                //         child: Container(
                //             // color: Theme.of(context).cardColor,
                //             width: double.infinity,
                //             padding: const EdgeInsets.symmetric(vertical: 20),
                //             alignment: Alignment.center,
                //             child: Text(
                //               textOkButton ?? 'Close',
                //             )

                //             // Row(
                //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //   children: [
                //             //     Expanded(
                //             //       flex: 1,
                //             //       child: RoundedButton(
                //             //           color: Colors.transparent,
                //             //           text: textOkButton ?? 'Close',
                //             //           press: () {
                //             //             Navigator.pop(context);
                //             //             if (onTapOk != null) {
                //             //               onTapOk();
                //             //             }
                //             //           }),
                //             //     ),
                //             //   ],
                //             // ),
                //             ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        );
      });
}

Widget indicatorModal() {
  return Align(
    alignment: Alignment.center,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 40,
      height: 8,
      decoration: roundedDecoration(color: Colors.grey.shade200),
    ),
  );
}

BoxDecoration roundedDecoration({color, borderColor, radius}) {
  return BoxDecoration(
      color: color ?? Colors.white,
      border: Border.all(color: borderColor ?? Colors.white, width: 1),
      borderRadius: radius ??
          const BorderRadius.all(
            Radius.circular(16),
          ));
}
