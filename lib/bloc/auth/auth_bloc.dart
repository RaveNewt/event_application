import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_application/models/login_model.dart';
import 'package:event_application/models/register_model.dart';
import 'package:event_application/models/user_model.dart';
import 'package:event_application/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthRegister) {
        try {
          print('auth form register');

          emit(AuthLoading());

          final res = await AuthService().register(event.data);

          emit(AuthSuccess(res));
        } catch (e) {
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          print('auth login');

          emit(AuthLoading());

          final res = await AuthService().login(event.data);

          emit(AuthSuccess(res));
        } catch (e) {
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthGetCurrent) {
        try {
          emit(AuthLoading());

          final LoginFormModel res =
              await AuthService().getCredentialFromLocal();

          final UserModel user = await AuthService().login(res);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
