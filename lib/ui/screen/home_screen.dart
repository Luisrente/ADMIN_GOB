import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gob_cordoba/services/services.dart';
import 'package:gob_cordoba/ui/screen/screens.dart';
import 'package:gob_cordoba/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  final tam = MediaQuery.of(context).size.height * 0.17;
  final carnetservice= Provider.of<CarnetService>(context);
 final dato= carnetservice.loadCartUser();

   
  final authService= Provider.of<AuthService>(context , listen: false);
  final storage = new FlutterSecureStorage();


  final  t= authService.readToken();

   


  if(carnetservice.isLoading) return const LoadingScreen();
    return  Scaffold(
       appBar: 
      AppBar(
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
            Navigator.pushReplacementNamed(context, 'login');
          }
        ),
        backgroundColor: Colors.white,
        elevation: 1
      ),
      body: FutureBuilder<Usuario>(
        future: carnetservice.loadCartUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return CardWidget(dato: snapshot.data!);
          }else{
            return const Center(
              child:  CircularProgressIndicator(
                color: Colors.black12
              ),
            );
          }
        }
      ),
      // bottomNavigationBar: const CustomNavigatonBar (),
    );
  }
}