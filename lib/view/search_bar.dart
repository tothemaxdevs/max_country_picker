import 'package:flutter/material.dart';
import 'package:max_country_list/config/country_list_config.dart';

class SearchBar extends StatelessWidget {
  String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  CountryListConfig countrtyListConfig;
  SearchBar({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    required this.countrtyListConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initSizeConfig(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: countrtyListConfig.searchBackgroundColor,
          borderRadius: BorderRadius.circular(countrtyListConfig.searchRadius!),
        ),
        child: TextField(
          controller: controller,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          style: countrtyListConfig.searchTextStyle,
          onChanged: onChanged,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                // vertical: 6,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: countrtyListConfig.searchHintText,
              hintStyle: countrtyListConfig.searchHintTextStyle,
              prefixIcon: countrtyListConfig.searchCustomSearchIcon),
        ),
      ),
    );
  }
}

void initSizeConfig(context) {
  SizeConfig().init(context);
}

class SizeConfig {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}
