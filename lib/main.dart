import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  List _buttonList = ['ADD', 'SUB', 'MUL', 'DIV'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = new List.empty(growable: true);
  String? _buttonText;
  var icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Widget Example')
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Text('RESULT : $sum', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: value1),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: value2),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                    child: Row(
                      children: <Widget>[
                        if(_buttonText == 'ADD')Icon(Icons.add),
                        if(_buttonText == 'SUB')Icon(Icons.arrow_back),
                        if(_buttonText == 'MUL')Icon(Icons.waves),
                        if(_buttonText == 'DIV')Icon(Icons.ac_unit_outlined),
                        Text(_buttonText!)
                      ],
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                    onPressed: (){
                      setState(() {
                        var value1Int = double.parse(value1.value.text);
                        var value2Int = double.parse(value2.value.text);
                        var result;

                        if(_buttonText == 'ADD'){
                          result = value1Int + value2Int;
                        } else if(_buttonText == 'SUB'){
                          result = value1Int - value2Int;
                        } else if(_buttonText == 'MUL'){
                          result = value1Int * value2Int;
                        } else {
                          result = value1Int / value2Int;
                        }
                        sum = '$result';
                      });
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButton(
                    items: _dropDownMenuItems,
                    onChanged: (String? value){
                    setState(() {
                      _buttonText = value;
                  });
                }, value: _buttonText),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    for(var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }
}