import 'dart:async';

import 'package:form_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
  // BehaviorSubject es un equivalente a Stream Controllers, nos permite combinar Streams y obtener el valor de cada Stream
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  Stream<bool> get formValidStream => Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // obtener el último valor ingresado a los Streams
  String get email => _emailController.value;
  String get password => _passwordController.value;



  dispose(){
    _emailController?.close();
    _passwordController?.close(); 
  }
}