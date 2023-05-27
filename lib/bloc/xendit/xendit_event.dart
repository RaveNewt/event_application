part of 'xendit_bloc.dart';

abstract class XenditEvent extends Equatable {
  const XenditEvent();

  @override
  List<Object> get props => [];
}

class XenditInvoice extends XenditEvent {
  final XenditForm data;
  const XenditInvoice(this.data);

  @override
  List<Object> get props => [data];
}
