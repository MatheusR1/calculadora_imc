import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "calculadora IMC",
    home:
        new Home(), // passarei uma statefull porq a tela da home é intereativa.
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _infotext = "informe seus dados ";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infotext = "informe seus dados";
    });

  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infotext = " Abaixo do peso ideal (${imc.toStringAsPrecision(3)})";
      }else if (imc >= 18.6 && imc<= 24.9 ) {
        _infotext = " Peso ideal (${imc.toStringAsPrecision(3)})";
      }else if (imc >= 24.9 && imc<= 29.9 ) {
        _infotext = " Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      }else if (imc >= 29.9 && imc<= 34.9 ) {
        _infotext = " Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      }else if (imc >= 34.9 && imc<= 39.9 ) {
        _infotext = " Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      }else if (imc >= 40.0 ) {
        _infotext = " Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.black38,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.indigoAccent,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // manipula o eixo cuzado
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 120,
                color: Colors.white,
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black38, fontSize: 25.00),
                  controller: weightController),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altua (cm)",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black38, fontSize: 25.00),
                  controller: heightController),
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Container(
                    height: 50.00,
                    child: RaisedButton(
                      onPressed: calculate,
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                      color: Colors.white,
                    )),
              ),
              Text(
                _infotext,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.00),
              )
            ],
          ),
        ));
  }
}
