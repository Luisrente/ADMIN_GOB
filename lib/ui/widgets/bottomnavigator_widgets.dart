import 'package:flutter/material.dart';

class CustomNavigatonBar extends StatelessWidget {
  const CustomNavigatonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      items: const [
         BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'luis'
         ),
         BottomNavigationBarItem(
          icon: Icon(Icons.numbers_outlined),
                    label: 'luis'
         )
      ]
    );
  }
}