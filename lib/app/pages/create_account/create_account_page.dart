import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _key = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  bool isValid = false;
  bool passIsValid = false;
  final _pageController = PageController(initialPage: 0);
  final _passwordController = TextEditingController();

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Criar conta',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: Modular.to.pop,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          allowImplicitScrolling: false,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 40, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Qual é o seu e-mail?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      autovalidate: true,
                      key: _key,
                      child: TextFormField(
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

                          _pageController.animateToPage(1,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeIn);

                          return null;
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Você vai ter que confirmar esse e-mail mais tarde.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    alignment: Alignment.center,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: isValid
                          ? () {
                              _pageController.jumpToPage(1);
                            }
                          : null,
                      color: Colors.white,
                      disabledColor: Colors.white38,
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 50,
                        child: Text(
                          'AVANÇAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 40, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Crie uma senha',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: _passwordController.text.length >= 8 && passIsValid
                          ? Colors.white38
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      autovalidate: true,
                      key: _key2,
                      child: TextFormField(
                        controller: _passwordController,
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
                          color: _passwordController.text.length >= 8 &&
                                  passIsValid
                              ? Colors.white
                              : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
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
                                    color: Colors.black26,
                                    size: 25,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.black26,
                                    size: 25,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    _passwordController.text.length >= 8 && passIsValid
                        ? ''
                        : 'Use pelo menos 8 caracteres.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    alignment: Alignment.center,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: passIsValid ? () {} : null,
                      color: Colors.white,
                      disabledColor: Colors.white38,
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 50,
                        child: Text(
                          'AVANÇAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
