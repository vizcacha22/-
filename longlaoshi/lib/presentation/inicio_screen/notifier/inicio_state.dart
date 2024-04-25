part of 'inicio_notifier.dart';

/// Represents the state of Inicio in the application.

// ignore_for_file: must_be_immutable
class InicioState extends Equatable {
  InicioState({this.inicioModelObj});

  InicioModel? inicioModelObj;

  @override
  List<Object?> get props => [inicioModelObj];
  InicioState copyWith({InicioModel? inicioModelObj}) {
    return InicioState(
      inicioModelObj: inicioModelObj ?? this.inicioModelObj,
    );
  }
}
