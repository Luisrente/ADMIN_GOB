import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gob_cordoba/data/encryption_service.dart';
import 'package:gob_cordoba/models/carnet_model.dart';
import 'package:gob_cordoba/models/models.dart';
import 'package:gob_cordoba/provider/db_provider.dart';
import 'package:gob_cordoba/provider/provider.dart';
import 'package:gob_cordoba/services/check_internet.dart';
import 'package:gob_cordoba/services/services.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class ControlScreen extends StatelessWidget {
   
  const ControlScreen({Key? key}) : super(key: key);
  void displayDialono (BuildContext context){
    showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        elevation: 5,
                        title:  Center(
                          child: const Text( 'Usuario no encontrado',
                              style: TextStyle(color: Colors.black)),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                            ]),
                        actions: [
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orange.shade500),
                                onPressed: () {
                                 // widget.check!.terms = true;
                                  Navigator.pop(context);
                                },
                                child: const Text('Aceptar')),
                          )
                        ]);
                  });
  }
  
  void displayDialog (BuildContext context , Usuario model){
    showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        elevation: 5,
                        title:  Center(
                          child: Text( model.name!,
                              style: TextStyle(color: Colors.black)),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:[
                              Row(
                                children:  [
                                  Text('Documento  : ', style: TextStyle(fontWeight: FontWeight.bold) ),
                                  Text(model.document!)
                                ]
                              ),

                               SizedBox(height: 10),

                              Row(
                                children: const [
                                  Text('Dependencia : ', style: TextStyle(fontWeight: FontWeight.bold) ),
                                  Text('Sec Educacion')
                                ]
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: const [
                                  Text('Cargo : ', style: TextStyle(fontWeight: FontWeight.bold) ),
                                  Text('Contador publico',  maxLines: 2)
                                ]
                              )
                            ]
                            
                            ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                    icon: const  Icon(Icons.close),
                                    style: ElevatedButton. styleFrom(
                                    primary: Colors.red),
                                    onPressed: () {
                                     // widget.check!.terms = true;
                                      Navigator.pop(context);
                                    },
                                    label: const Text('Cancelar', style: TextStyle(fontSize: 15))
                                ),
                                SizedBox(width: 10),
                                ElevatedButton.icon(
                                    icon: const Icon(Icons.check),
                                    style: ElevatedButton. styleFrom(
                                    primary: Colors.green),
                                    onPressed: () {
                                     // widget.check!.terms = true;
                                      Navigator.pop(context);
                                    },
                                    label: const Text('Aceptar ', style: TextStyle(fontSize: 15))
                                ),
                              ],
                            ),
                          )
                        ]);
                  });
  }
  
  @override
  Widget build(BuildContext context) {
   final EncryptionService encryptionService= new EncryptionService();  

   final carnetservice= Provider.of<CarnetService>(context);
   final loginForm= Provider.of<InputsDocumentForms>(context);
   final double tam = MediaQuery.of(context).size.height * 0.17;
   final authService= Provider.of<AuthService>(context , listen: false);

// final  Usuario dato = Usuario(
//                   document: '1',
//                   email: 'luisa@gmail.com',
//                   name: 'Luisa',
//                   password : '12345678',
//                );
    // print('----------REspuesta-----------');
    // print( DBProvider.db.nuevoScan(dato));
    // print('---------------------');
    print( DBProvider.db.getScanById('1'));
    return  Scaffold(
      appBar: AppBar(
         actions:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png',
                fit: BoxFit.cover, alignment: Alignment.center),
          ),
          SizedBox(width: tam)
      ], 
      leading: IconButton(
          icon: const  Icon( Icons.login_outlined , color: Colors.black),
          onPressed: () async{
            await authService.logunt();
            await DBProvider.db.deleteAllScan();
            Navigator.pushReplacementNamed(context, 'login');
          }
        ),
        backgroundColor: Colors.white,
        elevation: 1
      ),
      body: Padding(
      padding: const EdgeInsets.only(top: 60 , right: 40, left: 40, bottom: 40 ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 250,
        decoration: _buildBoxDecoration(),
        child: Column(
          children: [
            Form(
              key: loginForm.formKey1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [            
                  const SizedBox(height: 30),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecorations.authInputDecoration(
                      hinText: '12134', 
                      labelText: 'Numero de identificacion' 
                      ),
                    onChanged: (value) => loginForm.documento= value,
                   ),
                  const SizedBox(height: 30),             
                ]
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 ),
                  child: Center(
                         child: ElevatedButton.icon(
                                icon: const Icon(Icons.search),
                                style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.orange),
                                onPressed:  loginForm.isLoading ? null : () async {
                //FocusScope.of(context).unfocus();
             final authService= Provider.of<AuthService>(context, listen:false);    
                if(!loginForm.isValidForm()) return ;
                loginForm.isLoading= true;
                await Future.delayed( const Duration(seconds: 2));
                //Validar si el login es correc
                final Usuario scans= await carnetservice.loadCarstAdmin(loginForm.documento);
                 if(scans.document==null){
                   loginForm.isLoading= false;
                    displayDialono(context);
                    }else{
                    loginForm.isLoading= false;
                    displayDialog(context,scans);
                    }
                 },
                label: const Text('Consultar ', style: TextStyle(fontSize: 20))
                   ),
                 ),
              ),
          ],
        )
      ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child:  const Icon(Icons.qr_code_2_outlined),
        onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);       
        try {
           if(barcodeScanRes == '-1'){
             //no hace nada y sale
           }else{
            //En caso tal que la respuesta sea nula
             if(await encryptionService.descrypData(barcodeScanRes)==null){
           NotificationsService.showSnackbar('Codigo QR Invalido encryption');
             }else{
                final Usuario scans= await carnetservice.loadCarstAdmin(await encryptionService.descrypData(barcodeScanRes));
                 if(scans.document ==null){
                   displayDialono(context);
                   }else{
                   displayDialog(context,scans);
                    }
             }
           }
        } catch (e) {

          print(e);
          NotificationsService.showSnackbar('$e');
        } 
      },
      )
    );
  }

  BoxDecoration _buildBoxDecoration() =>  BoxDecoration(
      color: Colors.white,
      borderRadius: const  BorderRadius.all( Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.009),
          offset:  const Offset(0,5),
          blurRadius: 5
        )
      ]
  );
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

 void displayDialog (BuildContext context, int documento){
    showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        elevation: 5,
                        title:  Text('${documento}',
                            style: TextStyle(color: Colors.blue)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                  'Qui aute reprehenderit dolor ipsum occaecat reprehenderit. Ullamco ex ad dolore voluptate occaecat non ea laborum et Lorem eiusmod eu magna aliquip. Enim minim et laborum nostrud consequat velit est cupidatat tempor. Ad exercitation incididunt laboris magna consectetur adipisicing voluptate eu consequat velit ad. Minim esse et culpa aute amet ullamco.')
                            ]),
                        actions: [
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orange.shade500),
                                onPressed: () {
                                 // widget.check!.terms = true;
                                  Navigator.pop(context);
                                },
                                child: const Text('Aceptar')),
                          )
                        ]);
                  });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 20, left: 40, bottom: 40  ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 250,
        decoration: _buildBoxDecoration(),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [            
              const SizedBox(height: 30),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hinText: '12134', 
                  labelText: 'Numero de identificacion' 
                  ),
               ),
              const SizedBox(height: 30),
             
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom( primary: Colors.orange.shade500),
                    onPressed: () { 
                      print('entros');
                      int documentId= 111 ;      
                      displayDialog(context, documentId);
                      Navigator.pop(context);
                      print('paso');
                       },
                    child: const Text('Consultar', style: TextStyle(fontSize: 20))),
              ),
            ]
          )
        )
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() =>  BoxDecoration(
      color: Colors.white,
      borderRadius: const  BorderRadius.all( Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.009),
          offset:  const Offset(0,5),
          blurRadius: 5
        )
      ]
  );

}



