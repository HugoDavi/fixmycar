import 'package:flutter/material.dart';
import 'validation.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with Validation {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size.width / 400;
    return new Scaffold(
      resizeToAvoidBottomPadding:
          false, //redefine o tamanho quando o teclado sobre
      body: SafeArea(
        top: true,
        child: new Container(
            padding:
                new EdgeInsets.symmetric(horizontal: 65.0), //padding horizontal
            child: Center(
              child: Form(
                key: formKey,
                child: new Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // alinhamento vertical
                  children: <Widget>[
                    //chamando os widgets criados abaixo
                    welcomeText(),
                    new SizedBox(height: mediaQueryData * 20),
                    inputFormFields(),
                    new SizedBox(height: mediaQueryData * 40),
                    buttonContainer(mediaQueryData * 45),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget welcomeText() {
    // widget do welcome text
    return new Column(
      children: <Widget>[
        new Text(
          'Welcome to',
          style: new TextStyle(color: Colors.black38, fontSize: 18.0),
        ),
        new SizedBox(height: 15.0),
        new Text(
          'Fix my Car',
          style: new TextStyle(color: Colors.black54, fontSize: 36.0),
        ),
      ],
    );
  }

  Widget inputFormFields() {
    //formField do email
    final mediaQueryData = MediaQuery.of(context).size.width /
        400; //definindo os parâmetros de tamanho na tela pelo mediaquery
    return new Column(
      children: <Widget>[
        new TextFormField(
          validator: validateEmail, //chamando a validação (validation.dart)
          onSaved: (String value) {
            email = value;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
            labelText: 'Email', //aparece antes de clicar no FormField
            hintText: 'you@example.com', //aparece quando clia no FormField
          ),
        ),
        new SizedBox(
            height: mediaQueryData *
                20), //sized box para ajuste de espaçamento entre os FormFields
        new TextFormField(
          validator: validatePassword,
          onSaved: (String value) {
            password = value;
          },
          obscureText: true,
          decoration: new InputDecoration(
            labelText: 'Password',
            hintText: 'Type your password',
          ),
        )
      ],
    );
  }

  Widget buttonContainer(double height) {
    final mediaQueryData = MediaQuery.of(context).size.width / 400;
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            height: mediaQueryData * 45, //altura do botão
            width: double.infinity, //ajuste de largura do botão
            child: new RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                if (formKey.currentState.validate()) {
                  //Permite seguir a rota caso a validação seja aceita
                  Navigator
                      .of(context)
                      .pushNamed("/homeScreen"); //rota definida para "HomePage"
                }
              },
              child: new Text(
                'SIGN IN',
                style: new TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(
                    25.0), //ajuste da forma circular do botão
              ),
            ),
          ),
          new SizedBox(height: 10.0),
          new Container(
            height: mediaQueryData * 45,
            width: double.infinity,
            child: new RaisedButton(
              color: Colors.redAccent,
              onPressed: () {},
              child: new Text(
                'SIGN UP',
                style: new TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0)),
            ),
          ),
        ],
      ),
    );
  }
}
