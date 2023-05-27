import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_application/models/xendit_form.dart';
import 'package:event_application/models/xendit_model.dart';
import 'package:event_application/services/xendit_service.dart';

part 'xendit_event.dart';
part 'xendit_state.dart';

class XenditBloc extends Bloc<XenditEvent, XenditState> {
  XenditBloc() : super(XenditInitial()) {
    on<XenditEvent>((event, emit) async {
      if (event is XenditInvoice) {
        try {
          emit(XenditLoading());

          final res = await XenditService().invoice(event.data);

          emit(XenditSuccess(res));
        } catch (e) {
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
