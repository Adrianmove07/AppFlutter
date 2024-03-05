import 'package:flutter/material.dart';
import 'package:senaflutterapp/models/infraestructuras_models.dart';
import 'package:senaflutterapp/services/infraestructuras_services.dart';
import 'package:senaflutterapp/ui/widgets/custom_shape.dart';
import 'package:senaflutterapp/ui/widgets/customappbar.dart';
import 'package:senaflutterapp/ui/widgets/responsive_ui.dart';
import 'package:senaflutterapp/views/twoViews.dart';
import 'package:http/http.dart' as http;

class EntradaSena extends StatefulWidget {
  const EntradaSena({super.key});

  @override
  _EntradaSenaState createState() => _EntradaSenaState();
}

class _EntradaSenaState extends State<EntradaSena> {
  List<InfraestructurasModels>? _infraList;

  String? _selectedSede;
  String? _selectedArea;
  String? _selectedInfraestructura;
  var isLoaded = false;

  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  @override
  void initState() {
    super.initState();

    // Fetch data from API
    getData();
  }

  getData() async {
    _infraList = await infraestructurasServices().getInfraestructura();
    if (_infraList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        floatingActionButton: null,
        body: Container(
          height: _height,
          width: _width,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                listPrincipal(),
                signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      Opacity(
        opacity: 0.75,
        child: ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            // margin: EdgeInsets.only(bottom:_height/120),
            height:
                _large ? _height / 4 : (_medium ? _height / 7 : _height / 3),
            decoration: const BoxDecoration(
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
            // margin: EdgeInsets.only(bottom:_height/120),
            height: _large
                ? _height / 4.5
                : (_medium ? _height / 11.3 : _height / 4),
            decoration: const BoxDecoration(
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
        height: _height / 7,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(bottom: 10),
        child: Image.asset(
          'assets/images/logo-sena-blanco.png',
        ),
      )
    ]);
  }

  Widget listPrincipal() {
    return Container(
      margin: EdgeInsets.only(
        left: _width / 12.0,
        right: _width / 12.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              'Principal',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 12, 116, 34)),
            ),
            SizedBox(height: _height / 30.0),
            sedeText(),
            SizedBox(height: _height / 60.0),
            areaText(),
            SizedBox(height: _height / 60.0),
            infraestructuraText(),
          ],
        ),
      ),
    );
  }

  Widget sedeText() {
    Set<String> nombresSedeUnicos = Set();
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (final infraestructura in _infraList ?? []) {
      final nombreSede = infraestructura.sede.nombreSede;
      if (!nombresSedeUnicos.contains(nombreSede)) {
        nombresSedeUnicos.add(nombreSede);
        dropdownItems.add(
          DropdownMenuItem<String>(
            value: nombreSede,
            child: Text(nombreSede),
          ),
        );
      }
    }

    return Container(
      child: DropdownButtonFormField<String>(
        value: _selectedSede,
        hint: const Text(
          'Selecciona una sede',
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedSede = newValue;
            // Al seleccionar una sede, reseteamos el área seleccionada
            _selectedArea = null;
          });
        },
        items: dropdownItems,
      ),
    );
  }

  Widget areaText() {
    Set<String> nombresAreaUnicos = Set();
    List<DropdownMenuItem<String>> dropdownItems = [];

    // Filtrar las infraestructuras basadas en la sede seleccionada
    final infraestructurasFiltradas = _infraList
        ?.where((infraestructura) =>
            infraestructura.sede.nombreSede == _selectedSede)
        .toList();

    if (_selectedSede != null) {
      for (final infraestructura in infraestructurasFiltradas ?? []) {
        final nombreArea = infraestructura.area.nombreArea;
        if (!nombresAreaUnicos.contains(nombreArea)) {
          nombresAreaUnicos.add(nombreArea);
          dropdownItems.add(
            DropdownMenuItem<String>(
              value: nombreArea,
              child: Text(nombreArea),
            ),
          );
        }
      }
    }

    return Container(
      child: DropdownButtonFormField<String>(
        value: _selectedArea,
        hint: const Text(
          'Selecciona un área',
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedArea = newValue;
            _selectedInfraestructura = null;
          });
        },
        items: dropdownItems,
      ),
    );
  }

  Widget infraestructuraText() {
    Set<String> nombresInfraUnicos = Set();
    List<DropdownMenuItem<String>> dropdownItems = [];

    // Filtrar las infraestructuras basadas en la area seleccionada
    final infraestructurasFiltradas = _infraList
        ?.where((infraestructura) =>
            infraestructura.area.nombreArea == _selectedArea)
        .toList();
    if (_selectedArea != null) {
      for (final infraestructura in infraestructurasFiltradas ?? []) {
        final nombreInfra = infraestructura.nombreInfraestructura;
        if (!nombresInfraUnicos.contains(nombreInfra)) {
          nombresInfraUnicos.add(nombreInfra);
          dropdownItems.add(
            DropdownMenuItem<String>(
              value: nombreInfra,
              child: Text(nombreInfra),
            ),
          );
        }
      }
    }
    return Container(
      child: DropdownButtonFormField<String>(
        value: _selectedInfraestructura,
        hint: const Text(
          'Selecciona una infraestructura',
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedInfraestructura = newValue;
          });
        },
        items: dropdownItems,
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          if (_selectedInfraestructura != null)
            Text(
              'Infraestructura : $_selectedInfraestructura',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          SizedBox(height: 50),
          if (_selectedInfraestructura != null)
            Container(
              width: 150,
              height: 150,
              child: Image.asset(
                  'assets/images/qrcode-generado.png'), // Cambia el nombre del archivo de imagen según tu configuración
            ),
          SizedBox(height: 50),
          if (_selectedInfraestructura != null) button(context),
        ],
      ),
    );
  }
}

Widget button(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      padding: EdgeInsets.all(0.0),
      textStyle: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TwoViews(), // Reemplaza vista
        ),
      );
    },
    child: Container(
      alignment: Alignment.center,
      width: 100,
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
      child: Text(
        'DETALLES',
      ),
    ),
  );
}
