import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryListConfig {
  final Color? backgroundColor;
  final String? title;
  final Widget? appBarCustomBackButtonIcon;
  final TextStyle? appBarTitleTextStyle;
  final TextStyle? modalTitleTextStyle;
  final String? searchHintText;
  final TextStyle? searchHintTextStyle;
  final TextStyle? searchTextStyle;
  final double? searchRadius;
  final Color? searchBackgroundColor;
  final Color? searchIconColor;
  final Widget? searchCustomSearchIcon;
  final bool? hideSearchBar;
  final TextStyle? countryNameTextStyle;
  final TextStyle? countryCodeTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? appBarBackButtonColor;
  final Color? modalBackgoroundColor;
  final Color? modalIndicatorColor;
  final Color? separatedColor;
  final double? flagIconSize;
  final List<String> filterOnlyShowingCountry;
  final List<String> filterExcludeCountry;

  const CountryListConfig(
      {this.backgroundColor = Colors.white,
      this.flagIconSize = 26,
      this.title = 'Select cuntry',
      this.appBarTitleTextStyle = const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      this.searchHintText = 'Search',
      this.searchHintTextStyle = const TextStyle(fontSize: 14),
      this.searchTextStyle =
          const TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
      this.hideSearchBar = false,
      this.searchRadius = 100,
      this.searchBackgroundColor = const Color.fromRGBO(250, 250, 250, 1),
      this.countryNameTextStyle =
          const TextStyle(overflow: TextOverflow.ellipsis),
      this.countryCodeTextStyle = const TextStyle(),
      this.systemOverlayStyle = const SystemUiOverlayStyle(),
      this.appBarBackButtonColor = Colors.black,
      this.appBarCustomBackButtonIcon,
      this.modalTitleTextStyle =
          const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      this.searchIconColor = Colors.black,
      this.searchCustomSearchIcon,
      this.modalBackgoroundColor = Colors.white,
      this.modalIndicatorColor = Colors.grey,
      this.separatedColor = Colors.transparent,
      this.filterOnlyShowingCountry = const [],
      this.filterExcludeCountry = const []});
}
