import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:max_country_list/max_country_list.dart';
import 'package:max_country_list/max_country_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: ListView.builder(
//           itemCount: MaxCountryList.list.length,
//           itemBuilder: (BuildContext context, int index) {
//             var country = MaxCountryList.list[index];

//             return ListTile(
//               title: Row(
//                 children: [
//                   SvgPicture.asset(
//                     country.flagIconSquare!,
//                     width: 30,
//                   ),
//                   SizedBox(
//                     width: 40,
//                   ),
//                   SvgPicture.asset(
//                     country.flagIconCircle!,
//                     width: 30,
//                   ),
//                   SizedBox(
//                     width: 40,
//                   ),
//                   Text(country.flagEmoji!),
//                 ],
//               ),
//               subtitle: Text('${country.code!} ${country.name!}'),
//             );
//           },
//         ));
//   }
// }

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [MaxCountryPicker()],
          ),
        ));
  }
}
