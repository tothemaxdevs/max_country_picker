import 'package:flutter/material.dart';
import 'package:max_country_list/config/country_list_config.dart';
import 'package:max_country_list/max_country_picker.dart';
import 'package:max_country_list/view/list_picker.dart';

class ListPickerPage extends StatefulWidget {
  FlagMode? mode;
  CountryListConfig countryListConfig;
  ListPickerPage(
      {Key? key, this.mode = FlagMode.circle, required this.countryListConfig})
      : super(key: key);

  @override
  _ListPickerPageState createState() => _ListPickerPageState();
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
              icon: widget.countryListConfig.appBarCustomBackButtonIcon!)),
      body: ListPicker(
        mode: widget.mode,
        countryListConfig: widget.countryListConfig,
        // onCanged: widget.onCanged,
      ),
    );
  }
}
