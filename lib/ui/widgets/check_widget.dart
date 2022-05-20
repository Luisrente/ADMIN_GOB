import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:rankcv/src/Providers/providers.dart';

class CheckWidget extends StatefulWidget {

  CheckWidget({
    Key? key,
   // this.check,
  }) : super(key: key);
  // LoginFromProviderNewUser? check;
  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}
class _CheckWidgetState extends State<CheckWidget> {
  @override
  Widget build(BuildContext context) {
     return AlertDialog(
                        elevation: 5,
                        title: const Text('Privacy Policy',
                            style: TextStyle(color: Colors.blue)),
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadiusDirectional.circular(10)),
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
                                  //widget.check!.terms = true;
                                  Navigator.pop(context);
                                },
                                child: const Text('Aceptar')),
                          )
                        ]);
                  }
  }

