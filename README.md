
# Max Country Picker


###### Country picker with three icon mode Circle, Square, and Emoji, and also have two view mode Page and Modal Bottom Sheet.
## Screenshots

<!-- ![App Screenshot](https://www.easygifanimator.net/images/samples/video-to-gif-sample.gif) -->


## Installation

Installing

```bash
  flutter pub add max_country_picker
```
    
Import

```bash
  import 'package:max_country_picker/max_country_picker.dart';
```
    

## Usage

```javascript
MaxCountryPicker(
  flagMode: FlagMode.square,
  viewMode: ViewMode.page,
  initialCountryCode: 'ID',
  onCanged: (value) {
      print(value.name);
  },
)
```


## Parameters

| Field | Type |  Description |
| -------- | --------- |--------- |
| initialCountryCode | String |  Set initial country code |
| countryCodeStyle | TextStyle |  Customize main button country code textstyle |
| countryNameStyle | TextStyle |  Customize main button country name textstyle |
| showDropDown | bool |  Show or hide button dropdown icon |
| showFlagIcon | bool |  Show or hide button flag icon  |
| showCountryName | bool |  Show or hide button flag name |
| dropDownColor | Color |  Set dropdown icon color | 
| flagIconSize | double |  Set flag icon size |
| flagMode | FlagMode |  Change flag mode emoji, circle, or square |
| viewMode | ViewMode |  Change country view mode page or modal bottom sheet |
| countryListConfig | CountryListConfig |  Configure country list |


### CountryListConfig Parameters

| Field | Type |  Description |
| -------- | --------- |--------- |
| title | String |  Country list ViewMode.page and ViewMode.modal title |
| appBarBackButtonColor | Color | Set appbar backbutton color|
| appBarCustomBackButtonIcon | Widget | Custom ViewMode.page back button |
| appBarTitleTextStyle | TextStyle | ViewMode.page appbar title textstyle |
| backgroundColor | Color | ViewMode.page backgroundColor |
| countryCodeTextStyle | TextStyle |Country code list textstyle|
| countryNameTextStyle | TextStyle |Country name list textstyle |
| filterExcludeCountry | List<String> |Filtering what country you want to hide|
| filterOnlyShowingCountry | List<String> | Filtering what country you want to show|
| flagIconSize | double |Sizing country list flag size|
| hideSearchBar | bool | Show or hide searchbar|
| modalBackgoroundColor | Color | Setting modal background color|
| modalIndicatorColor | Color |Setting modal indicator color|
| modalTitleTextStyle | TextStyle | ViewMode.modal title textstyle |
| searchBackgroundColor | Color | Searchbar background color|
| searchCustomSearchIcon | Widget | Set custom icon searchbar |
| searchHintText | String |Searchbar hint text|
| searchHintTextStyle | TextStyle |Searchbar hint text style|
| searchIconColor | Color | Searchbar icon color|
| searchRadius | double | Searchbar raidus|
| searchTextStyle | TextStyle | Searchbar text style|
| separatedColor | Color |Customize separated country list color|
| systemOverlayStyle | SystemUiOverlayStyle | customize systemOverlayStyle ViewMode.page|

## Support us

Your support can make us grow up :)

[![Support via PayPal](https://cdn.rawgit.com/twolfson/paypal-github-button/1.0.0/dist/button.svg)](https://paypal.me/tothemaxdev/)


