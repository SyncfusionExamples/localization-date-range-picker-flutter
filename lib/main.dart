import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(Localization());

class Localization extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('zh'),
        const Locale('he'),
        const Locale('ru'),
        const Locale('fr', 'BE'),
        const Locale('fr', 'CA'),
        const Locale('ja'),
        const Locale('de'),
        const Locale('hi'),
        const Locale('ar'),
      ],
      locale: const Locale('zh'),
      debugShowCheckedModeBanner: false,
      home: LocalizationInPicker(),
    );
  }
}

class LocalizationInPicker extends StatefulWidget {
  @override
  _LocalizationInPickerState createState() => _LocalizationInPickerState();
}

class _LocalizationInPickerState extends State<LocalizationInPicker> {
  final DateRangePickerController _controller = DateRangePickerController();
  final List<String> views = <String>['Month', 'Year', 'Decade', 'Century'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton<String>(
            icon: Icon(Icons.calendar_today),
            itemBuilder: (BuildContext context) => views.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            onSelected: (String value) {
              if (value == 'Month') {
                _controller.view = DateRangePickerView.month;
              } else if (value == 'Year') {
                _controller.view = DateRangePickerView.year;
              } else if (value == 'Decade') {
                _controller.view = DateRangePickerView.decade;
              } else if (value == 'Century') {
                _controller.view = DateRangePickerView.century;
              }
            },
          ),
        ),
        body: Card(
          margin: const EdgeInsets.fromLTRB(40, 150, 40, 150),
          child: SfDateRangePicker(
            controller: _controller,
            view: DateRangePickerView.month,
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
