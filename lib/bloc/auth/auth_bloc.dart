import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:split_free/utils/enum_utils.dart';

import '../model/UserDetail.dart';
import 'api/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final   AuthRepository authRepository;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignupEvent>(_signup);
    on<AddUserDetailEvent>(_addUserDetails);
    on<LoginEvent>(_login);
  }

  void _signup(SignupEvent event, Emitter<AuthState> emit) async{
    emit(Loading());
    try{
      final credential = await _auth.createUserWithEmailAndPassword(email: event.emailId, password: event.password);
      _auth.currentUser!.updateEmail(event.emailId);
      _auth.currentUser!.updateDisplayName(event.phoneNumber);

      emit(Success());
    }catch(_){
      print(_);
      emit(Failure());
    }
  }

  void _login(LoginEvent event, Emitter<AuthState> emit) async{
    emit(Loading());
    try{
      final UserCredential credential = await _auth.signInWithEmailAndPassword(email: event.emailId, password: event.password);
      credential.user!.email;
      emit(Success());
    }catch(_){
      print(_);
      emit(Failure());
    }
  }

  void _addUserDetails(AddUserDetailEvent event, Emitter<AuthState> emit) async{
    emit(Loading());
    try{
      print("val: "+event.fullName+event.email+event.phone);
      final dynamic response = await authRepository.addUserDetail(
        fullName: event.fullName,
        email: _auth.currentUser!.email!,
        phoneNumber: _auth.currentUser!.displayName!,
        registrationStatus: event.registrationStatus,
        locale: event.locale
      );
      if(response is UserDetail){
        emit(Added(response));
      }else if(response == "Error"){
        emit(Failure());
      }else{
        emit(Failure());
      }
    }catch(_){ print(_);
    emit(Failure());
    }
  }

}
