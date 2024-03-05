import 'package:flutter/material.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart'; librería para que funcionen los clippers

// clipper; son figuras que le dan alas paginas para que se vea mejor , hay varios,
//body: ListView(
        // padding: EdgeInsets.all(20.0),
        // children: <Widget>[
        //    ClipPath(
        //     clipper: SideCutClipper(), <----- asi se usa los clippers
        //     child: Container(
        //       height: 600,
        //       width: 500  ,
        //       color: Colors.pink,
        //       child: Center(child: Text("SideCutClipper()")),
        //     ),
        //   ),
        //<--------- estos son algunos clipper ya establecidos ---->
        // clipper: SideCutClipper(),
        // clipper: MultipleRoundedCurveClipper(),
        // clipper: MultiplePointedEdgeClipper(),
        // clipper: OctagonalClipper(),
        // clipper: HexagonalClipper(),
        // clipper: HexagonalClipper(reverse: true),
        // . . .
        // clipper: ParallelogramClipper(),
        // clipper: DiagonalPathClipperOne(),
        // clipper: WavyCircleClipper(32),
class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height-70);

    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 50.0);
    var secondControlPoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true; //eta en true para que se actualice cada que haya un cambio


}

class CustomShapeClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstControlpoint.dx, firstControlpoint.dy, firstEndPoint.dx,
        firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height-5);
    var secondControlPoint = Offset(size.width * .75, size.height - 20);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx,
        secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;


}