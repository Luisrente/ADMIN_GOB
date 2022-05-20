import 'package:flutter/material.dart';
import 'package:gob_cordoba/ui/widgets/style_fondo_widget.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: height * 0.7,
          width: width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // gradient: LinearGradient(
            //   colors: [
            //     Color.fromARGB(255, 200, 228, 244),
            //     Color.fromARGB(255, 255, 255, 255)
            //   ],
            // ),
            boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0,3),
        blurRadius: 10
      )
    ],
            color: Colors.white
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CustomPaint(
              size: Size(width, height),
              painter: CardCustomPainter(),
              child: Stack(
                children: [
                  // Positioned(
                  //   bottom: 10,
                  //   left: 10,
                  //   child: Image.asset(
                  //     'assets/img.png',
                  //     color: Colors.purpleAccent.withOpacity(0.3),
                  //     width: width * 0.7,
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 30,
                  //   left: 20,
                  //   child: Image.asset(
                  //     'assets/2.png',
                  //     width: width * 0.7,
                  //     color: Colors.white70,
                  //   ),
                  // ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // Center(
                      //   child: Image.asset(
                      //     'assets/eye.png',
                      //     color: Colors.deepPurple[700],
                      //     width: width * 0.4,
                      //   ),
                      // ),
                      // Text(
                      //   'Cylon Coder',
                      //   style: TextStyle(
                      //     color: Colors.deepPurple[700],
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      SizedBox(
                        height: 110,
                      ),
                      // detailWidget(
                      //   icon: Icons.phone,
                      //   text: '+94765555777',
                      // ),
                      // detailWidget(
                      //   icon: Icons.email,
                      //   text: 'coderofceylon@gmail.com',
                      // ),
                      // detailWidget(
                      //   icon: Icons.location_on,
                      //   text: 'Galle, Sri Lanka',
                      // )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget detailWidget({IconData icon, String text}) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 30),
  //     child: Column(
  //       children: [
  //         Row(
  //           children: [
  //             Icon(
  //               icon,
  //               size: 30,
  //               color: Colors.white70,
  //             ),
  //             SizedBox(
  //               width: 20,
  //             ),
  //             Expanded(
  //               child: Text(
  //                 text,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white70,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         Divider(),
  //       ],
  //     ),
  //   );
  // }
}