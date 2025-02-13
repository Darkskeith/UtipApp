import 'package:flutter/material.dart';
import 'package:utip/widgets/person_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});
  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;

  //Metodos

  void _decrement() {
    setState(() {
      if (_personCount > 0) {
        _personCount--;
      }
    });
  }

  void _increment() {
    setState(() {
      _personCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium?.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('UTip'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text("Total Per Person", style: style),
                      Text("\$0.00",
                          style: style!.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontSize:
                                  theme.textTheme.displaySmall?.fontSize)),
                    ],
                  )),
            ),
            //Form
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                        labelText: 'Bill Amount',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        print("The value is $value");
                      },
                    ),
                    //Split
                    PersonCount(
                        theme: theme,
                        personCount: _personCount,
                        onIncrement: _increment,
                        onDecrement: _decrement),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
