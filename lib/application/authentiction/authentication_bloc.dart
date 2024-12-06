import 'package:bloc/bloc.dart';
import 'package:omen/Service/APIService.dart';
import 'package:omen/domain/user.dart';
import 'package:omen/domain/user_reginster_login_dto.dart';
import 'package:flutter/widgets.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

List<UserRegisterLoginDTO> userList = [];

late final String? errorText;

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // ignore: unused_field
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<RegisterUser>((event, emit) async {
      emit(AuthenticationLoading());

      try {
        await APIService().registerUser(
          event.user.mobileNumber,
          event.user.password,
        );

        add(
          LoginUser(
            user: UserRegisterLoginDTO(
              password: event.user.password,
              mobileNumber: event.user.mobileNumber,
            ),
          ),
        );

        // emit(
        //   AuthenticationRegisterSuccess(responseMessage: "RsgisterSuccse"),
        // );
      } catch (e) {
        emit(
          AuthenticationError(errorText: e.toString().split(":")[1]),
        );
      }
    });

    on<LoginUser>((event, emit) async {
      emit(AuthenticationLoading());

      try {
        final response = await APIService().loginUser(
          event.user.mobileNumber,
          event.user.password,
        );

        emit(
          AuthenticationLoginSuccess(user: response),
        );
      } catch (e) {
        emit(
          AuthenticationError(errorText: e.toString().split(":")[1]),
        );
      }
    });
  }
}
