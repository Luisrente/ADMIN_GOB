import 'package:flutter/material.dart';
import 'package:gob_cordoba/provider/provider.dart';
import 'package:gob_cordoba/services/services.dart';
import 'package:gob_cordoba/ui/screen/screens.dart';
import 'package:gob_cordoba/ui/widgets/style_widget.dart';
import 'package:provider/provider.dart';
void main() => runApp( const AppState());
class AppState extends StatelessWidget {
  const  AppState({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => CarnetService()),
        ChangeNotifierProvider( create: ( _ ) => AuthService()),
        ChangeNotifierProvider( create: ( _ ) => InputsDocumentForms()),
      ],
       child:  MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ControlGob',
      debugShowCheckedModeBanner: false,
      initialRoute: 'check',
      routes: {
        'home'  : (_) =>  const HomeScreen(),
        'login'  : (_) =>  const LoginScreen(),
        'control'  : (_) =>  const ControlScreen(),
        'check'  : (_) =>  const  CheckAuthScreen(),
        'register'  : (_) =>  const  RegisterScreen(),
        'q'  : (_) =>    Home(),
        
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }

}