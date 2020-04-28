import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  final key = GlobalKey<FormState>();
  bool isValid = false;
  bool passIsValid = false;
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..forward();
    _offsetAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool obscure = true;
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
                  'Entrar',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 70),
              SlideTransition(
                position: _offsetAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'E-mail ou nome de usuário',
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
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Form(
                        key: key,
                        autovalidate: true,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (String value) {
                                var regex = RegExp(
                                    r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
                                if (!regex.hasMatch(value)) {
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
                                isDense: true,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Form(
                            autovalidate: true,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: obscure,
                              validator: (String value) {
                                if (value.length < 8) {
                                  SchedulerBinding.instance
                                      .addPostFrameCallback((_) => setState(() {
                                            passIsValid = false;
                                          }));
                                  return null;
                                }
                                SchedulerBinding.instance
                                    .addPostFrameCallback((_) => setState(() {
                                          passIsValid = true;
                                        }));
                                return null;
                              },
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(17),
                                isDense: true,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscure = !obscure;
                                    });
                                  },
                                  child: obscure
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: Colors.black45,
                                          size: 25,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: Colors.black45,
                                          size: 25,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                alignment: Alignment.center,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: passIsValid && isValid
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
                      'ENTRAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17),
              GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('/rescue');
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Não consegue fazer login? Toque aqui para obter ajuda.',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
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
