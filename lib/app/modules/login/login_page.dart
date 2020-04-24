import 'package:flutter/material.dart';
import 'package:spotify_clone/app/utils/widgets/buttom_custom/buttom_custom_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, bottom: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Colors.purple[900].withBlue(255), Colors.pink[400]],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // TODO: Add logo of Spotify
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                ),
                SizedBox(width: 10),
                Text(
                  'Spotify',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Milhões de músicas à sua escolha.\nGrátis no Spotify',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                ButtonCustomWidget(
                  color: Colors.green,
                  onPressed: () {},
                  text: 'Inscreva-se Grátis',
                ),
                ButtonCustomWidget(
                  color: Colors.lightBlue[900],
                  onPressed: () {},
                  text: 'continuar com o facebook',
                ),
                ButtonCustomWidget(
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {},
                  text: 'entrar',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
