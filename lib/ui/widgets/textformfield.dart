import 'package:flutter/material.dart';
import 'package:senaflutterapp/ui/widgets/responsive_ui.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData icon;
  late double _width ;
  late double _pixelRatio ;
  late bool large ;
  late bool medium ;


  CustomTextField(
    {super.key, 
      this.hint = '',
      this.textEditingController,
      this.keyboardType,
      required this.icon,
      this.obscureText = false,
      }
    
    );

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: const Color.fromARGB(255, 28, 221, 86),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color.fromARGB(255, 28, 221, 86), size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
