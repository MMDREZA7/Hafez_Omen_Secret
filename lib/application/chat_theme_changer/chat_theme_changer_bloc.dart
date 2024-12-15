import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../presentation/themes/theme.dart';

part 'chat_theme_changer_event.dart';
part 'chat_theme_changer_state.dart';

ThemeData mainTheme = lightChatTheme;

class ChatThemeChangerBloc
    extends Bloc<ChatThemeChangerEvent, ChatThemeChangerState> {
  final _myBox = Hive.box('mybox');
  ChatThemeChangerBloc()
      : super(ChatThemeChangerInitial(theme: darkChatTheme)) {
    on<ChangeChatPageTheme>((event, emit) async {
      // emit(ChatThemeChangerLoading(theme: darkChatTheme));

      var val = _myBox.get('chatTheme');

      if (val == 'lightChatTheme') {
        mainTheme = darkChatTheme;
        _myBox.put('chatTheme', 'darkChatTheme');
      } else if (val == 'darkChatTheme') {
        mainTheme = lightChatTheme;
        _myBox.put('chatTheme', 'lightChatTheme');
      }

      emit(
        ChatThemeChangerLoaded(theme: mainTheme),
      );
    });

    // -----

    on<FirstTimeOpenChat>((event, emit) async {
      // emit(ChatThemeChangerLoading(theme: lightChatTheme));

      mainTheme = darkChatTheme;
      _myBox.put('chatTheme', 'darkChatTheme');

      emit(ChatThemeChangerLoaded(theme: mainTheme));
    });
  }
}
