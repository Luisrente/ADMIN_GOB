import 'package:flutter/material.dart';

class AuthBackGround extends StatelessWidget {

  final Widget child;

  const AuthBackGround({ 
    Key? key, 
    required this.child
     }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children:  [
          //_PurpleBox(),
          _HeaderIcon(),
          this.child
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width:  double.infinity,
        margin: const EdgeInsets.only(top : 40),
        // child: const Icon(Icons.person_pin, color: Colors.white, size: 100 )
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: Image.asset('assets/logo.png',
                  fit: BoxFit.cover, alignment: Alignment.center),
        ),
          )
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child:  Stack(
        children: const [
          Positioned(child: _Bubble(), top:90, left:30),
          Positioned(child: _Bubble(), top:40, left:-30),
          Positioned(child: _Bubble(), top:-50, left: -20),
          Positioned(child: _Bubble(), bottom:-50, left:10),
          Positioned(child: _Bubble(), bottom: 120, right:50)
        ],
        ),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63,63,156,1),
        Color.fromRGBO(90, 70, 178, 1)

      ]
    )
  );
}


class _Bubble extends StatelessWidget {
  const _Bubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255,255,255, 0.05)
      )
    );
  }
}