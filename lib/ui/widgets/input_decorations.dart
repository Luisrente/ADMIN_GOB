import 'package:flutter/material.dart';


class InputDecorations{

  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixIcon
  }){
       return  InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 2, 116, 208)
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 2, 116, 208),
                    width: 2
                  )
                ),
                hintText: hinText,
                labelText: labelText,
                labelStyle: const TextStyle(
                  color: Colors.grey
                ),
                prefixIcon: prefixIcon != null
                 ? Icon( prefixIcon, color: Color.fromARGB(255, 2, 116, 208))
                 : null
              );

  }


}