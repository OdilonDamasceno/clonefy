import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RescueAccountPage extends StatefulWidget {
  @override
  _RescueAccountPageState createState() => _RescueAccountPageState();
}

class _RescueAccountPageState extends State<RescueAccountPage> {
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Colors.purple[900].withBlue(255), Colors.pink[400]],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: Modular.to.pop,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Recupere sua conta',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 70),
              Text(
                'Insira seu nome de usuário do Spotify'
                ' ou o endereço de e-mail que você '
                'usou para se registrar. Vamos enviar um'
                ' e-mail para você recuperar sua conta',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Endereço de e-mail ou nome de usuário',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (String value) {
                              if (value.isEmpty) {
                                //Error if use simple setState((){});
                                SchedulerBinding.instance
                                    .addPostFrameCallback((_) => setState(() {
                                          isValid = false;
                                        }));

                                return null;
                              }
                              SchedulerBinding.instance
                                  .addPostFrameCallback((_) => setState(() {
                                        isValid = true;
                                      }));

                              return null;
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                alignment: Alignment.center,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: isValid
                      ? () {
                          Modular.to.pushNamed('/home');
                        }
                      : null,
                  color: Colors.white,
                  disabledColor: Colors.white38,
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    child: Text(
                      'MANDAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Ainda precisa de ajuda? Clique aqui!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
