import 'package:flutter/material.dart';
import 'package:senaflutterapp/ui/widgets/responsive_ui.dart';
import 'package:senaflutterapp/ui/widgets/customappbar.dart';

class TwoViews extends StatefulWidget {
  const TwoViews({Key? key}) : super(key: key);

  @override
  State<TwoViews> createState() => _TwoViewsState();
}

class _TwoViewsState extends State<TwoViews> {
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 28, 221, 86),
                  Color.fromARGB(255, 12, 116, 34)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/logo-sena-blanco.png',
                  width: 50,
                  height: 50,
                ),
              ),
              Text(
                'Disponible',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    // Agrega aquí la navegación a la pantalla de notificaciones
                  },
                  icon: Icon(Icons.notifications),
                ),
              ),
            ],
          ),
        ),
        body: Container(
            height: _height,
            width: _width,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                contenedor1(),
                SizedBox(height: 30),
                Text(
                  'Observaciones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                contenedor2(),

                // Espacio entre contenedores
              ],
            ))));
  }

  Widget contenedor1() {
    return Container(
      margin: EdgeInsets.only(
        left: _width / 40.0,
        right: _width / 40.0,
      ),
      child: const Column(
        children: [
          Text(
            'Infraestructura',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Área: Área 1'),
                      Text('Hora de inicio: 08:00 AM'),
                      Text('Hora final: 12:00 PM'),
                      Text('Fecha: 23 de Agosto de 2023'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'assets/images/login.png'), // Cambia la ruta de la imagen
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Instructor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget contenedor2() {
    return Container(
      margin: EdgeInsets.only(
        left: _width / 12.0,
        right: _width / 12.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID: 12345',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Observación:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac luctus libero.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
