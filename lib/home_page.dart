import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<dynamic> countries = [];
  List<dynamic> countries2 = [];
  List<dynamic> states = [];

  String? country1;
  String? country2;
  String? value1;
  double? sum;
  double? result;

  final _num1 = TextEditingController();
  final _result = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.countries.add({"id": 'pak', "name": "PKR"});
    this.countries.add({"id": 'usa', "name": "USD"});

    this.countries2.add({"id": 'usa', "name": "USD"});
    this.countries2.add({"id": 'pak', "name": "PKR"});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter - Currency Converter Application"),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            FormHelper.dropDownWidgetWithLabel(
              context,
              "From",
              "Select Currency",
              this.country1,
              this.countries,

              (onChangedVal) {
                country1 = onChangedVal;
                print("Selected Country: $onChangedVal");

                setState(() {
                  this.country1 = onChangedVal;
                });
              },

              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Plese Select any Country';
                }
                return null;
              },

              borderColor: Theme.of(context).primaryColorLight,
              borderFocusColor: Theme.of(context).primaryColorLight,
              borderRadius: 10,
              // optionValue: "val",
              // optionLabel: "name",
            ),
            FormHelper.dropDownWidgetWithLabel(
              context,
              "To",
              "Select Currency",
              this.country2,
              this.countries2,

              (onChangedVal) {
                this.country2 = onChangedVal;
                print("Selected Country: $onChangedVal");

                setState(() {
                  this.country2 = onChangedVal;
                });
              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Plese Select any Country';
                }
                return null;
              },

              borderColor: Theme.of(context).primaryColorLight,
              borderFocusColor: Theme.of(context).primaryColorLight,
              borderRadius: 10,
              // optionValue: "val",
              // optionLabel: "name",
            ),
            SizedBox(
              height: 20,
            ),
            // ListView(
            // children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: _num1,
                  decoration: InputDecoration(
                    labelText: 'Enter Value',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.purple),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: loginbutton,
                  color: Colors.purple,
                  child: Text(
                    'Convert',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _result,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void loginbutton() {
    // Fluttertoast.showToast(msg: 'Login Button Clicked ' + _num1.text);

    int dollar = 184;
    double rupee = 0.0054;

    if (country1 == "sss" && country2 == "sss") {
      sum = double.parse(_num1.text) * int.parse(dollar.toString());
      Fluttertoast.showToast(msg: sum.toString() + " PKR");
    } else if (country1 == "usa" && country2 == "pak") {
      sum = int.parse(_num1.text) * double.parse(dollar.toString());
      Fluttertoast.showToast(msg: sum.toString() + " USD");
    } else if (country1 == "usa" && country2 == "usa") {
      Fluttertoast.showToast(msg: 'Conversion Not Possible');
    } else if (country1 == "pak" && country2 == "pak") {
      Fluttertoast.showToast(msg: "Conversion Not Possible");
    } else if (country1 == 'pak' && country2 == 'usa') {
      sum = int.parse(_num1.text) * double.parse(rupee.toString());
      Fluttertoast.showToast(msg: sum.toString() + " USD");
    }

    result = sum;
    _result.text = result.toString();
    // Fluttertoast.showToast(coun);
  }
}
