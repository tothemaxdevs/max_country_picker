import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:max_country_picker/config/country_list_config.dart';
import 'package:max_country_picker/model/country_model.dart';
import 'package:max_country_picker/src/max_country_list.dart';
import 'package:max_country_picker/utils/utils.dart';
import 'package:max_country_picker/view/list_picker_modal.dart';
import 'package:max_country_picker/view/list_picker_page.dart';

// Mode config
enum FlagMode { circle, square, emoji }

enum ViewMode { page, modal }

class MaxCountryPicker extends StatefulWidget {
  MaxCountryPicker(
      {Key? key,
      this.countryCodeStyle,
      this.countryNameStyle,
      this.countryListConfig = const CountryListConfig(),
      this.initialCountryCode,
      this.flagIconSize = 26,
      this.showDropDown = true,
      this.showCountryName = false,
      this.showFlagIcon = true,
      this.dropDownColor,
      this.flagMode = FlagMode.circle,
      this.viewMode = ViewMode.modal,
      required this.onCanged})
      : super(key: key);

  TextStyle? countryCodeStyle;
  TextStyle? countryNameStyle;
  bool? showDropDown;
  bool? showFlagIcon;
  bool? showCountryName;
  Color? dropDownColor;
  double? flagIconSize;
  FlagMode? flagMode;
  ViewMode? viewMode;
  String? initialCountryCode;
  CountryListConfig countryListConfig;
  Function(MaxCountry) onCanged;
  @override
  _MaxCountryPickerState createState() => _MaxCountryPickerState();
}

class _MaxCountryPickerState extends State<MaxCountryPicker> {
  String? title;
  late MaxCountry initialCountry;
  @override
  void initState() {
    try {
      initialCountry = widget.initialCountryCode != null
          ? MaxCountryList.list[MaxCountryList.list.indexWhere(
              (element) => element.code == widget.initialCountryCode)]
          : MaxCountryList.list.first;
    } on Exception catch (_) {
      print('Country code not found');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        onTap: () {
          openOption(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showFlagIcon!)
                const SizedBox(
                  width: 6,
                ),
              if (widget.showFlagIcon!)
                countryFlag(
                    country: initialCountry,
                    mode: widget.flagMode!,
                    flagIconSize: widget.flagIconSize!),
              if (widget.showFlagIcon!)
                const SizedBox(
                  width: 6,
                ),
              Text(
                initialCountry.dialCode!,
                style: widget.countryCodeStyle ??
                    const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
              ),
              if (widget.showCountryName!)
                const SizedBox(
                  width: 8,
                ),
              if (widget.showCountryName!)
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    initialCountry.name!,
                    maxLines: 1,
                    style: widget.countryNameStyle ??
                        const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              if (widget.showDropDown!)
                const SizedBox(
                  width: 4,
                ),
              if (widget.showDropDown!)
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: widget.dropDownColor ?? Colors.grey,
                  size: 20,
                )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openOption(BuildContext context) async {
    switch (widget.viewMode) {
      case ViewMode.page:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListPickerPage(
                      mode: widget.flagMode,
                      countryListConfig: widget.countryListConfig,
                      onCanged: (value) {
                        setState(() {
                          initialCountry = value;
                          widget.onCanged(value);
                        });
                      },
                    )));
        break;
      case ViewMode.modal:
        listPickerModal(
          context,
          flagMode: widget.flagMode,
          countryListConfig: widget.countryListConfig,
          onCanged: (value) {
            setState(() {
              initialCountry = value;
              widget.onCanged(value);
            });
          },
        );
        break;
      default:
    }
  }
}
