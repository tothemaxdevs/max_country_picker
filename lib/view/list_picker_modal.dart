import 'package:flutter/material.dart';
import 'package:max_country_list/config/country_list_config.dart';
import 'package:max_country_list/max_country_picker.dart';
import 'package:max_country_list/model/country_model.dart';
import 'package:max_country_list/utils/utils.dart';
import 'package:max_country_list/view/list_picker.dart';

listPickerModal(BuildContext context,
    {required CountryListConfig countryListConfig,
    FlagMode? flagMode,
    Function(MaxCountry)? onCanged}) {
  bottomSheet(
    context,
    Expanded(
      child: ListPicker(
        mode: flagMode,
        onCanged: onCanged,
        countryListConfig: countryListConfig,
      ),
    ),
    title: countryListConfig.title,
    countryListConfig: countryListConfig,
  );
}
