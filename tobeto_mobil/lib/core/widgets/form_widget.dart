import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.prefixIcon,
    required this.labelText,
    this.hintText,
    this.suffixIcon,
    this.isPassword,
    this.controller,
  });

  final Icon prefixIcon;
  final String labelText;

  //controller disaridan alicaz icerisine yazdigimiz degerleri yonetebilmek icin
  final TextEditingController? controller;

  //hintText optional yaptim iceride bazen hint vermek istemeyebiliriz diye dusundum daha sonra bakariz
  final String? hintText;
  final Widget? suffixIcon;

  //bunu optional yaptim gereksiz yer kaplamasina gerek yok her formWidget cagirdigimizda
  //bize isPassword vermesse false olarak ayarliyorum asagida zaten
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIconColor: Theme.of(context).inputDecorationTheme.prefixIconColor,
        prefixIcon: prefixIcon,
        labelText: labelText, //placeholder
        hintText: hintText,
        suffixIconColor: Theme.of(context).inputDecorationTheme.suffixIconColor,
        suffixIcon: suffixIcon,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
      ),
    
      //isPassword null degilse ObscureText = isPassword
      //isPassword null ise ObscureText = false
      obscureText: isPassword ?? false,
    );
  }
}
