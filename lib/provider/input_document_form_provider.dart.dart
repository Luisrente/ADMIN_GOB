import 'package:flutter/material.dart';

class InputsDocumentForms extends ChangeNotifier{

  GlobalKey<FormState> formKey1 = new GlobalKey<FormState>();

  String documento = '';

  bool _isLoading= false;
  bool get isLoading => _isLoading;
  
  set isLoading( bool value){
    _isLoading= value;
    notifyListeners();
  }


  bool isValidForm(){
    print( formKey1.currentState?.validate());
    return formKey1.currentState?.validate() ?? false;
  }

}