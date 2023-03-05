import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryListConfig {
  // ViewMode.page backgroundColor
  final Color? backgroundColor;

  // Country list ViewMode.page and ViewMode.modal title
  final String? title;

  // Custom ViewMode.page back button
  final Widget? appBarCustomBackButtonIcon;

  // ViewMode.page appbar title textstyle
  final TextStyle? appBarTitleTextStyle;

  // ViewMode.modal title textstyle
  final TextStyle? modalTitleTextStyle;

  // Searchbar hint text
  final String? searchHintText;

  // Searchbar hint text style
  final TextStyle? searchHintTextStyle;

  // Searchbar text style
  final TextStyle? searchTextStyle;

  // Searchbar raidus
  final double? searchRadius;

  // Searchbar background color
  final Color? searchBackgroundColor;

  // Searchbar icon color
  final Color? searchIconColor;

  // Set custom icon searchbar
  final Widget? searchCustomSearchIcon;

  // Show or hide searchbar
  final bool? hideSearchBar;

  // Country name list textstyle
  final TextStyle? countryNameTextStyle;

  // Country code list textstyle
  final TextStyle? countryCodeTextStyle;

  // customize systemOverlayStyle ViewMode.page
  final SystemUiOverlayStyle? systemOverlayStyle;

  // Set appbar backbutton color
  final Color? appBarBackButtonColor;

  // Setting modal background color

  final Color? modalBackgoroundColor;

  // Setting modal indicator color
  final Color? modalIndicatorColor;

  // Customize separated country list color
  final Color? separatedColor;

  // Sizing country list flag size
  final double? flagIconSize;

  // Filtering what country you want to hide
  final List<String> filterOnlyShowingCountry;

  // Filtering what country you want to show
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
