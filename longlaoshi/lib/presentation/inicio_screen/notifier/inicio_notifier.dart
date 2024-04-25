import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/inicio_model.dart';
part 'inicio_state.dart';

final inicioNotifier = StateNotifierProvider<InicioNotifier, InicioState>(
  (ref) => InicioNotifier(InicioState(
    inicioModelObj: InicioModel(),
  )),
);

/// A notifier that manages the state of a Inicio according to the event that is dispatched to it.
class InicioNotifier extends StateNotifier<InicioState> {
  InicioNotifier(InicioState state) : super(state);
}
