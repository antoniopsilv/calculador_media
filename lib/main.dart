
import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculador Media',
      home: calculatorForm(),
    );
  }
}

class calculatorForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _calculatorFormState();
}

class _calculatorFormState extends State<calculatorForm> {
  String nome = "";
  String email = "";
  String nota1 = "5";
  String nota2 = "5";
  String nota3 = "5";
  String media = "";
  String resultado = "";

  TextEditingController tecNome = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecNota1 = TextEditingController();
  TextEditingController tecNota2 = TextEditingController();
  TextEditingController tecNota3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculador de Media Final"),
        backgroundColor: Colors.blue,
      ),
      body:
      // Para corrigir overhead button
      SingleChildScrollView (
      child:
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: TextField(
              controller: tecNome,
              decoration: InputDecoration(
                labelText: 'nome',
                hintText: 'Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: TextField(
              controller: tecEmail,
              decoration: InputDecoration(
                labelText: 'email',
                hintText: 'eMail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,

          ),
              // Linha para colocar as caixas de notas lado a lado
              child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: tecNota1,
                    decoration: InputDecoration(
                      labelText: 'nota1',
                      hintText: 'Nota 1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  width: 25.0,
                ),

                Expanded(
                  child: TextField(
                    controller: tecNota2,
                    decoration: InputDecoration(
                      labelText: 'nota2',
                      hintText: 'Nota 2',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),

                Container(
                  width: 25.0,
                ),

                Expanded(
                  child: TextField(
                    controller: tecNota3,
                    decoration: InputDecoration(
                      labelText: 'nota3',
                      hintText: 'Nota 3',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),

              ],
          )
          ),

         Padding(
            padding: EdgeInsets.all(5),
         ),
          // Caixa para dimensionar melhor o botão
          SizedBox(
          height: 50.0,
          width: 380.0,
          child: ElevatedButton(
            child: Text(
              'CALCULA MÉDIA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
            ),
            onPressed: () {
              setState(() {
                nome = tecNome.text;
                email = tecEmail.text;
                nota1 = tecNota1.text;
                nota2 = tecNota2.text;
                nota3 = tecNota3.text;
                media = calculaMedia();
              });
            },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
          ),
         ),
         ),
          Column(
              children: <Widget>[
                // Align individuais para alinhar a esquerda
                // Melhorar com função a parte
                Align(
                    alignment: Alignment.topLeft,
                  child: Text('Resultado: ' +resultado,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Nome:' +nome,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('eMail:' +email,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Notas:' +nota1+ '-' +nota2+ '-' +nota3,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Media:' + media,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ]
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          SizedBox(
            height: 50.0,
            width: 380.0,
            child: ElevatedButton(
              child: Text(
                'APAGAR OS CAMPOS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              onPressed: () {
                tecNome.text = '';
                nome = tecNome.text;

                tecEmail.text = '';
                email = tecEmail.text;

                tecNota1.text = '';
                nota1 = tecNota1.text;

                tecNota2.text = '';
                nota2 = tecNota2.text;

                tecNota3.text = '';
                nota3 = tecNota3.text;
                  setState(() {

                    media = '';
                    resultado = '';
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }

  String calculaMedia() {
    double n1 = double.parse(tecNota1.text);
    double n2 = double.parse(tecNota2.text);
    double n3 = double.parse(tecNota3.text);

    double media = (n1 + n2 + n3) / 3;

    if ( media >= 5.0 ) {
      resultado = 'Aprovado';
    } else {
      resultado = 'Reprovado';
    }
    String saida = media.toStringAsFixed(2);

    return saida;
  }
}

