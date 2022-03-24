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
  var _sliderValue = 1;
  var _currentSize = "Small";
  var _sizes = ['Small', 'Medium', 'Large'];
  var _currentFlavor = "Vanilla";
  var _flavors = ['Vanilla', 'Chocolate', 'Strawberry'];

  var fudge_label = "1 oz";
  var total = 0.00;
  var size_cost = 2.99;
  var toppings_cost = 0.00;
  var fudge_cost = 0.15;
  var total_dollars = "";

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
      updateUI();
    });
  }

  void updateUI() {
    setState(() {
      fudge_cost = 0.00;
      switch (_sliderValue) {
        case 0:
          fudge_label = "0 oz";
          fudge_cost = 0.00;
          break;
        case 1:
          fudge_label = "1 oz";
          fudge_cost = 0.15;
          break;
        case 2:
          fudge_label = "2 oz";
          fudge_cost = 0.25;
          break;
        case 3:
          fudge_label = "3 oz";
          fudge_cost = 0.30;
          break;
      }
      size_cost = 0.00;
      switch (_currentSize) {
        case "Small":
          size_cost = 2.99;
          break;
        case "Medium":
          size_cost = 3.99;
          break;
        case "Large":
          size_cost = 4.99;
          break;
      }
      toppings_cost = 0.00;
      if (_peanuts) {
        toppings_cost += 0.15;
      }
      if (_almonds) {
        toppings_cost += 0.15;
      }
      if (_strawberries) {
        toppings_cost += 0.20;
      }
      if (_gummybears) {
        toppings_cost += 0.20;
      }
      if (_mandms) {
        toppings_cost += 0.25;
      }
      if (_brownies) {
        toppings_cost += 0.20;
      }
      if (_oreos) {
        toppings_cost += 0.20;
      }
      if (_marshmallows) {
        toppings_cost += 0.15;
      }
      total = size_cost + toppings_cost + fudge_cost;
      total_dollars = total.toString();
    });
  }
  // should have everything
  void theWorks() {
    setState(() {
      _currentSize = "Large";
      _sliderValue = 3;
      _peanuts = true;
      _almonds = true;
      _strawberries = true;
      _gummybears = true;
      _mandms = true;
      _brownies = true;
      _oreos = true;
      _marshmallows = true;
      updateUI();
    });
  }
  //should have everything
  void reset() {
    setState(() {
      _currentFlavor = "Vanilla";
      _currentSize = "Small";
      _sliderValue = 1;
      _peanuts = false;
      _almonds = false;
      _strawberries = false;
      _gummybears = false;
      _mandms = false;
      _brownies = false;
      _oreos = false;
      _marshmallows = false;
      updateUI();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sundae Maker',
                      style: TextStyle(
                        fontSize: 32.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      total_dollars,
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton(
                          value: _currentSize,
                          items: buildSizeMenu(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _currentSize = newValue!;
                              //just added
                              updateUI();
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
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
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
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Hot Fudge",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
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
                          //just added
                          updateUI();
                        });
                      },
                    ),
                    Text(
                      fudge_label,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          theWorks();
                        },
                        child: Text('The Works',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        )
                    ),
                    TextButton(
                        onPressed: () {
                          reset();
                        },
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
