import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:max_country_list/max_country_list.dart';
import 'package:max_country_list/model/country_model.dart';
import 'package:max_country_list/utils/utils.dart';

class MaxCountryPicker extends StatefulWidget {
  MaxCountryPicker({Key? key, this.textStyle, this.listTextStyle})
      : super(key: key);

  TextStyle? textStyle;
  TextStyle? listTextStyle;

  @override
  _MaxCountryPickerState createState() => _MaxCountryPickerState();
}

class _MaxCountryPickerState extends State<MaxCountryPicker> {
  String? title;
  late MaxCountry initialCountry;
  @override
  void initState() {
    initialCountry = MaxCountryList.list[
        MaxCountryList.list.indexWhere((element) => element.code == 'ID')];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        onTap: () {
          // showModal(initialCountry);

          setState(() {
            bottomSheet(
                context,
                Expanded(
                  child: ListPicker(
                    mode: FlagMode.emoji,
                    onCanged: (p0) {
                      setState(() {
                        initialCountry = p0;
                      });
                    },
                  ),
                ));
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                initialCountry.flagIconCircle!,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                initialCountry.dialCode!,
                style: widget.textStyle ??
                    const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                initialCountry.name!,
                style: widget.textStyle ??
                    const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showModal(MaxCountry initialCountry) {
    bottomSheet(context, Expanded(
      child: ListPicker(
        onCanged: (p0) {
          setState(() {
            initialCountry = p0;
          });
        },
      ),
    ));
  }
}

enum FlagMode { circle, square, emoji }

class ListPicker extends StatefulWidget {
  Function(MaxCountry)? onCanged;
  FlagMode? mode;
  ListPicker({Key? key, this.onCanged, this.mode = FlagMode.circle})
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SearchBar(
            controller: searchController,
            onChanged: (p0) {
              setState(() {
                dataList = countryList
                    .where((e) =>
                        e.name!.toLowerCase().startsWith(p0.toLowerCase()))
                    .toList();
              });
            },
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
                    flag(country),
                    // SvgPicture.asset(
                    //   country.flagIconCircle!,
                    //   width: 30,
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Text(
                      country.name!,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    )),
                  ],
                ),
                trailing: Text(country.dialCode!),
                onTap: () {
                  Navigator.pop(context);
                  widget.onCanged!(country);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return divideThick(color: Colors.transparent);
            },
          ))
        ],
      ),
    );
  }

  flag(MaxCountry country) {
    if (widget.mode == FlagMode.circle) {
      return SvgPicture.asset(
        country.flagIconCircle!,
        width: 30,
      );
    } else if (widget.mode == FlagMode.square) {
      return SvgPicture.asset(
        country.flagIconSquare!,
        width: 30,
      );
    } else if (widget.mode == FlagMode.emoji) {
      return Text(country.flagEmoji!);
    }
  }
}

class SearchBar extends StatelessWidget {
  String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  SearchBar({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initSizeConfig(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: controller,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.normal,
          ),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              // vertical: 6,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: hintText ?? 'Search',
            hintStyle: const TextStyle(
              // color: Pallete.textPlaceholder,
              fontSize: 14,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}

void initSizeConfig(context) {
  SizeConfig().init(context);
}

class SizeConfig {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}
