import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();

  String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mascaras e Validações")
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // CPF
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              decoration: InputDecoration(
                hintText: "Digite o CPF"
              ),
            ),
            // CPF
            
            Padding(
              padding: EdgeInsets.all(20),
            ),

            // CNPJ
            TextField(
              controller: _cnpjController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CnpjInputFormatter()
              ],
              decoration: InputDecoration(
                  hintText: "Digite o CNPJ"
              ),
            ),
            // CNPJ

            Padding(
              padding: EdgeInsets.all(20),
            ),

            // CEP
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
              decoration: InputDecoration(
                  hintText: "Digite o CEP"
              ),
            ),
            // CEP

            Padding(
              padding: EdgeInsets.all(20),
            ),

            // Telefone
            TextField(
              controller: _telefoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                TelefoneInputFormatter()
              ],
              decoration: InputDecoration(
                  hintText: "Digite o Telefone"
              ),
            ),
            // Telefone

            Padding(
              padding: EdgeInsets.all(20),
            ),

            // Data
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                DataInputFormatter()
              ],
              decoration: InputDecoration(
                  hintText: "Digite o Data"
              ),
            ),
            // Data

            Padding(
              padding: EdgeInsets.all(20),
            ),

            // Moeda
            TextField(
              controller: _moedaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true)
              ],
              decoration: InputDecoration(
                  hintText: "Digite a Modea"
              ),
            ),
            // Moeda


            RaisedButton(
              child: Text("Recuperar valor"),
              onPressed: (){
                setState(() {
                  _valorRecuperado = _cpfController.text.toString();
                  _valorRecuperado = _cnpjController.text.toString();
                  _valorRecuperado = _cepController.text.toString();
                  _valorRecuperado = _telefoneController.text.toString();
                  _valorRecuperado = _dataController.text.toString();
                  _valorRecuperado = _moedaController.text.toString();

                  // Converter a moeda
                  String moedaBD = _moedaController.text.toString();
                  moedaBD = moedaBD.replaceAll(".", "");
                  moedaBD = moedaBD.replaceAll(",", ".");

                  double valorBouble = double.parse(moedaBD);

                  var formatador = NumberFormat("#,##0.00", "pt_BR");
                  var resultado = formatador.format(valorBouble);

                  for(var item in Estados.listaEstados){
                    print("Estado: ${item}");
                  }

                  for(var item in Meses.listaMeses){
                    print("Mês: ${item}");
                  }

                  for(var item in Semana.listaDiasSemanaOrdenada){
                    print("Semana: ${item}");
                  }
                });
              },
            ),

            Text(
              "Valor: ${_valorRecuperado}",
              style: TextStyle(
                fontSize: 25
              ),
            )
          ],
        ),
      )
    );
  }
}
