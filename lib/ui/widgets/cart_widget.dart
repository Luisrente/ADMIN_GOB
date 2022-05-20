import 'package:flutter/material.dart';
import 'package:gob_cordoba/data/encryption_service.dart';
import 'package:gob_cordoba/services/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../data/AES.dart';
import '../../models/models.dart';

class CardWidget extends StatelessWidget {


  final Usuario dato;

  const CardWidget({Key? key,  required this.dato}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final carnetservice= Provider.of<CarnetService>(context);

    final EncryptionService encryptionService= new EncryptionService();
    String documentId = dato.document!;
    print(documentId);
    double height = MediaQuery.of(context).size.height* 0.70;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        decoration: _cardBordes(),
        child: Column(
          // alignment: Alignment.bottomCenter,
          children: [
            _Encabezado( usuario: dato),
            Expanded(child: Column(
              children: [
                _CodigoQR(documento: documentId),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
                        child: Row(
                          children: const [
                              Text(
                                  'Secretaria: ',
                                  style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                 overflow: TextOverflow.ellipsis,
                                  ),
                             Text(
                             'Secretaria de educacion',
                              style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 50, 49, 49)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                       ),      
                          ]
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
                        child: Row(
                          children: const [
                              Text(
                                  'Contrado: ',
                                  style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                 overflow: TextOverflow.ellipsis,
                                  ),
                          Text(
                             'Prestacion de Servicios',
                              style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 50, 49, 49)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                       ),      
                          ]
                        ),
                      ),
                      
                    ],
                  ),

                
                )

              ],
            )),
             Cargo()
          ]

        )
      ),
    );


    // return Padding(
    //   padding: const EdgeInsets.symmetric( horizontal: 20),
    //   child: Container(
    //     margin:  const EdgeInsets.only(top: 60, bottom:20 ),
    //     width: double.infinity,
    //     height: height,
    //     decoration: _cardBordes(),
    //     child: Column(
    //       children: [
    //           Container( 
    //            padding: const EdgeInsets.only(top:40,left: 10, right:10, bottom : 10),
    //             child:  Text( dato.firstname! , style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold))
    //             ),
    //            Container( 
    //            padding: const EdgeInsets.only(left: 10, right:10),
    //             child:  Text( 'CC: 550050050', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold))
    //             ),
    //           Padding(
    //            // padding: const EdgeInsets.only(top:40,left: 40, right:40 , bottom:5),
    //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //             child: Container(
    //               width: 280,
    //               height: 280,
    //               child: QrImage(data: encryptionService.encryptData(documentId))
    //               ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 40, right:40 , bottom:5),
    //             child: Row(
    //               children: [
    //                 Text("Cargo :  ", style: TextStyle( fontSize: 15,fontWeight: FontWeight.bold)),
    //                 Text("Secretaria", style: TextStyle( fontSize: 15)),
    //               ],
    //             ),
    //           ),
    //         //  const Padding(
    //         //     padding: EdgeInsets.all(15),
    //         //     child:  Center(
    //         //      child: Text(
    //         //        "Ver el carnet" ,
    //         //        style: TextStyle(
    //         //          color: Colors.blue, 
    //         //          fontWeight: FontWeight.bold, 
    //         //          fontSize: 15))
    //         //     ),
    //         //   )
    //         Padding(
    //           padding: const EdgeInsets.only(top:62),
    //           child: Container(
    //              padding: const EdgeInsets.only(top:80,left: 10, right:10, bottom : 10),
    //              height: 60,
    //              decoration: _cardBordes1(),
    //              child: Text('SECRETARIO', style: TextStyle(color: Colors.white)),

    //           ),
    //         )


    //       ],
    //   ),
    // )
    // );
  }

  BoxDecoration _cardBordes() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0,3),
        blurRadius: 10
      )
    ]
  );

}

class _Encabezado extends StatelessWidget {
  
  final Usuario usuario;
  
  const _Encabezado({
    Key? key,  required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:30, bottom: 30),
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Text(
             usuario.name! ,
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
             Text(
              usuario.document! ,
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      )
    );
  }
}

class _CodigoQR extends StatelessWidget {
  final documento;
  
  const _CodigoQR({
    Key? key, this.documento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamano = MediaQuery.of(context).size;
    final EncryptionService encryptionService= new EncryptionService();

    return Container(
      height: tamano.height*0.25 ,
      width: tamano.width*0.5,
      child: QrImage(data: encryptionService.encryptData(documento))
    );
  }
}

class Cargo extends StatelessWidget {
  const Cargo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height:60,
      decoration: _buildBoxDecoration(),
      child: const Center(
        child: Text(
          'SECRETARIO',
          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      )
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)  )


  );
}