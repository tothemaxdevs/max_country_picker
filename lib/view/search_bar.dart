import 'package:flutter/material.dart';
import 'package:max_country_picker/config/country_list_config.dart';

class MaxSearchBar extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final CountryListConfig countrtyListConfig;
  const MaxSearchBar({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    required this.countrtyListConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: countrtyListConfig.searchHintText,
            hintStyle: countrtyListConfig.searchHintTextStyle,
            prefixIcon: countrtyListConfig.searchCustomSearchIcon ??
                Icon(Icons.search,
                    color: countrtyListConfig.searchIconColor, size: 22),
          ),
        ),
      ),
    );
  }
}
