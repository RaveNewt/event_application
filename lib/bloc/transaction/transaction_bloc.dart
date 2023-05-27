import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_application/models/checkout_form.dart';
import 'package:event_application/models/transaction_model.dart';
import 'package:event_application/services/transaction_service.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TrasactionCheckout) {
        try {
          emit(TransactionLoading());

          final res = await TransactionService().checkout(event.data);

          emit(TransactionSuccess(res));
        } catch (e) {
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
