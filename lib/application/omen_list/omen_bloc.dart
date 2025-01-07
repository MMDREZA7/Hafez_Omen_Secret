import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:faleh_hafez/application/omen_list/omens.dart';
import 'package:faleh_hafez/domain/models/omen_model.dart';
import 'package:flutter/material.dart';

part 'omen_event.dart';
part 'omen_state.dart';

class OmenBloc extends Bloc<OmenEvent, OmenState> {
  OmenBloc() : super(OmenInitial()) {
    on<OmenSearchedEvent>((event, emit) {
      emit(OmenLoading());

      var searchIndex = int.parse(event.searchIndex);

      final selectedOmen = omens[searchIndex - 1];

      if (searchIndex < 0) {
        emit(
          OmenError(
            errorMessage: 'عدد باید بیشتر از 0 باشد',
          ),
        );
      }

      if (searchIndex > omens.length - 1) {
        emit(
          OmenError(
            errorMessage:
                "عدد وارد شده از تعداد غزل ها بیشتر است مجددا امتحان کنین",
          ),
        );
      } else {
        emit(
          OmenLoaded(
            omen: Omen(
              poemText: selectedOmen["ghazal"]!,
              omenText: selectedOmen["tabir_content"]!,
            ),
          ),
        );
      }
    });

    on<OmenGetRandomEvent>((event, emit) async {
      emit(OmenLoading());

      final Random random = Random();
      final int randomIndex = random.nextInt(omens.length);
      final selectedOmen = omens[randomIndex];

      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );

      emit(
        OmenLoaded(
          omen: Omen(
            poemText: selectedOmen["ghazal"]!,
            omenText: selectedOmen["tabir_content"]!,
          ),
        ),
      );
    });
  }

  FutureOr<void> _getOmen(
    OmenEvent emit,
    Emitter<OmenState> event,
  ) {}

  FutureOr<void> _searchOmen(
    OmenEvent emit,
    Emitter<OmenState> event,
  ) {}
}
