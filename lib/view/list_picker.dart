import 'package:flutter/material.dart';
import 'package:max_country_picker/config/country_list_config.dart';
import 'package:max_country_picker/model/country_model.dart';
import 'package:max_country_picker/src/max_country_list.dart';
import 'package:max_country_picker/view/country_picker.dart';
import 'package:max_country_picker/view/search_bar.dart';
import 'package:max_country_picker/utils/utils.dart';

class ListPicker extends StatefulWidget {
  final Function(MaxCountry)? onCanged;
  final FlagMode? mode;
  final CountryListConfig countryListConfig;
  const ListPicker(
      {Key? key,
      this.onCanged,
      this.mode = FlagMode.circle,
      required this.countryListConfig})
      : super(key: key);

  @override
  State<ListPicker> createState() => _ListPickerState();
}

class _ListPickerState extends State<ListPicker> {
  String? title;

  final searchController = TextEditingController();

  List<MaxCountry> countryList = MaxCountryList.list;
  List<MaxCountry> dataList = [];

  @override
  void initState() {
    setState(() {
      if (widget.countryListConfig.filterOnlyShowingCountry.isNotEmpty) {
        dataList = countryList
            .where((element) => widget
                .countryListConfig.filterOnlyShowingCountry
                .contains(element.code))
            .toList()
            .where((element) => !widget.countryListConfig.filterExcludeCountry
                .contains(element.code))
            .toList();
      } else {
        dataList = countryList
            .where((element) => !widget.countryListConfig.filterExcludeCountry
                .contains(element.code))
            .toList();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.countryListConfig.backgroundColor,
      body: Column(
        children: [
          if (widget.countryListConfig.hideSearchBar == false)
            SearchBar(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  if (widget
                      .countryListConfig.filterOnlyShowingCountry.isNotEmpty) {
                    dataList = countryList
                        .where((element) => widget
                            .countryListConfig.filterOnlyShowingCountry
                            .contains(element.code))
                        .toList()
                        .where((element) => !widget
                            .countryListConfig.filterExcludeCountry
                            .contains(element.code))
                        .toList()
                        .where((e) => e.name!
                            .toLowerCase()
                            .startsWith(value.toLowerCase()))
                        .toList();
                  } else {
                    dataList = countryList
                        .where((element) => !widget
                            .countryListConfig.filterExcludeCountry
                            .contains(element.code))
                        .toList()
                        .where((e) => e.name!
                            .toLowerCase()
                            .startsWith(value.toLowerCase()))
                        .toList();
                  }
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
                  Navigator.pop(context);
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
