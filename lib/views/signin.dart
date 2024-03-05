import 'package:flutter/material.dart';
import 'package:senaflutterapp/constants/constants.dart';
import 'package:senaflutterapp/ui/widgets/custom_shape.dart';
import 'package:senaflutterapp/ui/widgets/responsive_ui.dart';
import 'package:senaflutterapp/ui/widgets/textformfield.dart';
import 'package:senaflutterapp/views/entradaSena.dart';
import 'package:senaflutterapp/services/login_auth_services.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      await LoginAuthServices.loginUser(email, password,
          context); // Realizar la solicitud de inicio de sesión.
    } catch (e) {
      print('Error al iniciar sesión: $e');
      // Aquí puedes mostrar un mensaje de error en la interfaz de usuario o manejar la excepción de otra manera.
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    print('_height: $_height');
    print('_width: $_width');
    print('_pixelRatio: $_pixelRatio');
    print('_large: $_large');
    print('_medium: $_medium');
    return Material(
      child: Container(
        height: _height,
        width: _width,
        //padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              clipShape(),
              welcomeTextRow(),
              signInTextRow(),
              form(),
              forgetPassTextRow(),
              SizedBox(height: _height / 12),
              button(),
              signUpTextRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height:
                  _large ? _height / 4 : (_medium ? _height / 3 : _height / 3),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 28, 221, 86),
                    Color.fromARGB(255, 12, 116, 34)
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 28, 221, 86),
                    Color.fromARGB(255, 12, 116, 34)
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20)),
          child: Image.asset(
            'assets/images/logo-sena-blanco.png',
            height: _height / 4,
            width: _width / 2,
          ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              color: Color.fromARGB(255, 28, 221, 86),
              fontWeight: FontWeight.bold,
              fontSize: _large ? 60 : (_medium ? 50 : 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Sign in to your account",
            style: TextStyle(
              color: Color.fromARGB(255, 28, 221, 86),
              fontWeight: FontWeight.w500,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: passwordController,
      icon: (Icons.lock),
      obscureText: true,
      hint: "Password",
    );
  }

  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              print("Routing");
            },
            child: Text(
              "Recover",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 28, 221, 86)),
            ),
          )
        ],
      ),
    );
  }

Widget button() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      padding: EdgeInsets.all(0.0),
      textStyle: TextStyle(color: Colors.white),
    ),
    onPressed: _login,
    child: Container(
      alignment: Alignment.center,
      width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromARGB(255, 28, 221, 86),
            Color.fromARGB(255, 12, 116, 34)
          ],
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Text('SIGN IN',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
    ),
  );
}

    // onPressed: () {

      // print("Routing to your account");
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('Login Successful'))); //
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => EntradaSena()),
      // );

      // },
  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SIGN_UP);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 28, 221, 86),
                  fontSize: _large ? 19 : (_medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }
}
