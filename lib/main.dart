import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _peanuts = false;
  var _almonds = false;
  var _strawberries = false;
  var _gummybears = false;
  var _mandms = false;
  var _brownies = false;
  var _oreos = false;
  var _marshmallows = false;
  var _sliderValue = 2;
  var _currentSize = "Small";
  var _sizes = ['Small', 'Medium', 'Large'];
  var _currentFlavor = "Vanilla";
  var _flavors = ['Vanilla', 'Chocolate', 'Strawberry'];

  void handleCheckBox(String name, bool value) {
    setState(() {
      switch (name) {
        case 'Peanuts':
          _peanuts = value;
          break;
        case 'Almonds':
          _almonds = value;
          break;
        case 'Strawberries':
          _strawberries = value;
          break;
        case 'Gummy Bears':
          _gummybears = value;
          break;
        case 'M&Ms':
          _mandms = value;
          break;
        case 'Brownies':
          _brownies = value;
          break;
        case 'Oreos':
          _oreos = value;
          break;
        case 'Marshmallows':
          _marshmallows = value;
          break;
      }
    });
  }

  List<DropdownMenuItem<String>> buildSizeMenu() {
    List<DropdownMenuItem<String>> sizeItems = [];
    for (String size in _sizes) {
      var newSize = DropdownMenuItem(
          child: Text(size),
          value: size,
      );
      sizeItems.add(newSize);
    }
    return sizeItems;
  }

  List<DropdownMenuItem<String>> buildFlavorMenu() {
    List<DropdownMenuItem<String>> flavorItems = [];
    for (String flavor in _flavors) {
      var newFlavor = DropdownMenuItem(
        child: Text(flavor),
        value: flavor,
      );
      flavorItems.add(newFlavor);
    }
    return flavorItems;
  }

  void choiceAction(String choice) {
    print(choice);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ice Cream Sundae'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (choice) {
                choiceAction(choice);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Order History'),
                    value: 'Order History',
                  ),
                  PopupMenuItem(
                    child: Text('About'),
                    value: 'About',
                  ),
                ];
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Sundae Maker',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                Column(
                  children: [
                    DropdownButton(
                      value: _currentSize,
                      items: buildSizeMenu(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentSize = newValue!;
                        });
                      },
                    ),
                    DropdownButton(
                      value: _currentFlavor,
                      items: buildFlavorMenu(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentFlavor = newValue!;
                        });
                      },
                    ),
                  ]
                ),
                CheckboxListTile(
                  value: _peanuts,
                  onChanged: (bool? val) {
                    handleCheckBox('Peanuts', val!);
                  },
                  title: Text('Peanuts'),
                ),
                CheckboxListTile(
                  value: _almonds,
                  onChanged: (bool? val) {
                    handleCheckBox('Almonds', val!);
                  },
                  title: Text('Almonds'),
                ),
                CheckboxListTile(
                  value: _strawberries,
                  onChanged: (bool? val) {
                    handleCheckBox('Strawberries', val!);
                  },
                  title: Text('Strawberries'),
                ),
                CheckboxListTile(
                  value: _gummybears,
                  onChanged: (bool? val) {
                    handleCheckBox('Gummy Bears', val!);
                  },
                  title: Text('Gummy Bears'),
                ),
                CheckboxListTile(
                  value: _mandms,
                  onChanged: (bool? val) {
                    handleCheckBox('M&Ms', val!);
                  },
                  title: Text('M&Ms'),
                ),
                CheckboxListTile(
                  value: _brownies,
                  onChanged: (bool? val) {
                    handleCheckBox('Brownies', val!);
                  },
                  title: Text('Brownies'),
                ),
                CheckboxListTile(
                  value: _oreos,
                  onChanged: (bool? val) {
                    handleCheckBox('Oreos', val!);
                  },
                  title: Text('Oreos'),
                ),
                CheckboxListTile(
                  value: _marshmallows,
                  onChanged: (bool? val) {
                    handleCheckBox('Marshmallows', val!);
                  },
                  title: Text('Marshmallows'),
                ),
                Slider(
                  value: _sliderValue.toDouble(),
                  min: 0.0,
                  max: 3.0,
                  label: _sliderValue.toString(),
                  divisions: 3,
                  onChanged: (double val) {
                    setState(() {
                      _sliderValue = val.toInt();
                    });
                  }
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {  },
                        child: Text('The Works',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        )
                      ),
                      TextButton(
                        onPressed: () {  },
                        child: Text('Reset',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        )
                      ),
                      TextButton(
                        onPressed: () {  },
                        child: Text('Order',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
