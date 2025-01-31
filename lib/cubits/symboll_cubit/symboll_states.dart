abstract class SymbolState {}

class InitialState extends SymbolState {}

class LoadingState extends SymbolState {}

class SuccessStatae extends SymbolState {}

class ErrorState extends SymbolState {
  String msgError;
  ErrorState(this.msgError);
}
class ChagngeStatae extends SymbolState {}
class ChagnedStatae extends SymbolState {}

