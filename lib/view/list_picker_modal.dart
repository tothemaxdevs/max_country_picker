import 'package:flutter/material.dart';
import 'package:max_country_picker/config/country_list_config.dart';
import 'package:max_country_picker/model/country_model.dart';
import 'package:max_country_picker/utils/utils.dart';
import 'package:max_country_picker/view/country_picker.dart';
import 'package:max_country_picker/view/list_picker.dart';

listPickerModal(BuildContext context,
    {required CountryListConfig countryListConfig,
    FlagMode? flagMode,
    Function(MaxCountry)? onCanged}) {
  maxBottomSheet(
    context,
    Expanded(
      child: MaxListPicker(
        mode: flagMode,
        onCanged: onCanged,
        countryListConfig: countryListConfig,
      ),
    ),
    title: countryListConfig.title,
    countryListConfig: countryListConfig,
  );
}
