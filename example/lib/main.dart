import 'package:flutter/material.dart';
import 'package:rrule_generator/rrule_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: Builder(builder: (context) {
          return Center(
            child: ElevatedButton(
              child: Text('Open'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: RRuleGenerator(
                        config: RRuleGeneratorConfig(),
                        initialRRule:
                            'RRULE:FREQ=WEEKLY;UNTIL=20231211T000000;INTERVAL=1;BYDAY=MO',
                        textDelegate: const EnglishRRuleTextDelegate(),
                        withExcludeDates: true,
                        onChange: print,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
