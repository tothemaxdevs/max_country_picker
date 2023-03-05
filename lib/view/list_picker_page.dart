import 'package:flutter/material.dart';
import 'package:max_country_picker/config/country_list_config.dart';
import 'package:max_country_picker/model/country_model.dart';
import 'package:max_country_picker/view/country_picker.dart';
import 'package:max_country_picker/view/list_picker.dart';

class ListPickerPage extends StatefulWidget {
  final FlagMode? mode;
  final CountryListConfig countryListConfig;
  final Function(MaxCountry)? onCanged;

  const ListPickerPage(
      {Key? key,
      this.mode = FlagMode.circle,
      required this.countryListConfig,
      this.onCanged})
      : super(key: key);

  @override
  State<ListPickerPage> createState() => _ListPickerPageState();
}

class _ListPickerPageState extends State<ListPickerPage> {
  String? title;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: widget.countryListConfig.systemOverlayStyle,
          title: Text(widget.countryListConfig.title!,
              style: widget.countryListConfig.appBarTitleTextStyle),
          elevation: 0.0,
          backgroundColor: widget.countryListConfig.backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: widget.countryListConfig.appBarCustomBackButtonIcon ??
                Icon(Icons.arrow_back_ios_new_rounded,
                    color: widget.countryListConfig.appBarBackButtonColor!,
                    size: 20),
          )),
      body: ListPicker(
          mode: widget.mode,
          countryListConfig: widget.countryListConfig,
          onCanged: (value) {
            widget.onCanged!(value);
          }),
    );
  }
}
