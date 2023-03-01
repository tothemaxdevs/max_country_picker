import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:max_country_list/config/country_list_config.dart';
import 'package:max_country_list/max_country_picker.dart';
import 'package:max_country_list/model/country_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// IconViewMode
countryFlag(
    {required MaxCountry country,
    required FlagMode mode,
    required double flagIconSize}) {
  if (mode == FlagMode.circle) {
    return SvgPicture.asset(
      country.flagIconCircle!,
      package: 'max_country_list',
      width: flagIconSize,
    );
  } else if (mode == FlagMode.square) {
    return SvgPicture.asset(
      country.flagIconSquare!,
      width: flagIconSize,
      package: 'max_country_list',
    );
  } else if (mode == FlagMode.emoji) {
    return Text(
      country.flagEmoji!,
      style: TextStyle(fontSize: flagIconSize),
    );
  }
}

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
    double? height,
    required CountryListConfig countryListConfig}) {
  return showCupertinoModalBottomSheet(
      backgroundColor: countryListConfig.modalBackgoroundColor,
      context: context,
      builder: (BuildContext context) {
        return Material(
          child: Container(
            color: countryListConfig.modalBackgoroundColor,
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                indicatorModal(color: countryListConfig.modalIndicatorColor!),
                const SizedBox(height: 6),
                if (title != null)
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: countryListConfig.modalTitleTextStyle,
                    ),
                  ),
                if (title != null) const SizedBox(height: 16),
                // // if (title != null) divideThick(),
                // const SizedBox(height: 6),
                child,
              ],
            ),
          ),
        );
      });
}

Widget indicatorModal({Color? color}) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 40,
      height: 8,
      decoration: roundedDecoration(color: color ?? Colors.grey.shade200),
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
