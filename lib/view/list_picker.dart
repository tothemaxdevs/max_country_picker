import 'package:flutter/material.dart';
import 'package:max_country_list/config/country_list_config.dart';
import 'package:max_country_list/src/max_country_list.dart';
import 'package:max_country_list/max_country_picker.dart';
import 'package:max_country_list/model/country_model.dart';
import 'package:max_country_list/view/search_bar.dart';
import 'package:max_country_list/utils/utils.dart';

class ListPicker extends StatefulWidget {
  Function(MaxCountry)? onCanged;
  FlagMode? mode;
  CountryListConfig countryListConfig;
  ListPicker(
      {Key? key,
      this.onCanged,
      this.mode = FlagMode.circle,
      required this.countryListConfig})
      : super(key: key);

  @override
  _ListPickerState createState() => _ListPickerState();
}

class _ListPickerState extends State<ListPicker> {
  String? title;

  final searchController = TextEditingController();

  List<MaxCountry> countryList = MaxCountryList.list;
  List<MaxCountry> dataList = [];

  @override
  void initState() {
    setState(() {
      dataList = countryList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.countryListConfig.backgroundColor,
      body: Column(
        children: [
          SearchBar(
            controller: searchController,
            onChanged: (value) {
              setState(() {
                dataList = countryList
                    .where((e) =>
                        e.name!.toLowerCase().startsWith(value.toLowerCase()))
                    .toList();
              });
            },
            countrtyListConfig: widget.countryListConfig,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              var country = dataList[index];
              return ListTile(
                title: Row(
                  children: [
                    countryFlag(
                        country: country,
                        mode: widget.mode!,
                        flagIconSize: widget.countryListConfig.flagIconSize!),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Text(country.name!,
                            style:
                                widget.countryListConfig.countryNameTextStyle)),
                  ],
                ),
                trailing: Text(
                  country.dialCode!,
                  style: widget.countryListConfig.countryCodeTextStyle,
                ),
                onTap: () {
                  Navigator.pop(context, country);
                  widget.onCanged!(country);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return divideThick(
                  color: widget.countryListConfig.separatedColor);
            },
          ))
        ],
      ),
    );
  }
}
