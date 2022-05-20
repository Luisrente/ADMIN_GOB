import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tam = MediaQuery.of(context).size.height * 0.17;
    return Scaffold(
      appBar: AppBar(
      //   actions:[
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Image.asset('assets/logo.png',
      //           fit: BoxFit.cover, alignment: Alignment.center),
      //     ),
      //     SizedBox(width: tam)
      // ],
      backgroundColor: Colors.white
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.indigo
        )
      )

    );
  }
}