import 'package:omen/application/authentiction/authentication_bloc.dart';
import 'package:omen/application/chat_theme_changer/chat_theme_changer_bloc.dart';
import 'package:omen/application/omen_list/omen_list_bloc.dart';
import 'package:omen/application/theme_changer/theme_changer_bloc.dart';
import 'package:omen/presentation/home/home_page.dart';
import 'package:omen/presentation/home/components/splash_page.dart';
import 'package:omen/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open box
  // ignore: unused_local_variable
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //

      //! load splash page

      future: Future.delayed(
        const Duration(seconds: 0),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: darkTheme,
            home: const SplashPage(),
          );
        } else {
          //

          //! load menu page

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ChatThemeChangerBloc()),
              BlocProvider(
                create: (context) =>
                    ThemeChangerBloc()..add(FirstTimeToOpenApp()),
              ),
              BlocProvider(
                create: (context) => OmenListBloc(),
              ),
              BlocProvider(
                create: (context) => AuthenticationBloc(),
              ),
            ],
            child: BlocBuilder<ThemeChangerBloc, ThemeChangerState>(
              builder: (context, state) {
                if (state is ThemeChangerLoaded) {
                  // return MaterialApp(
                  //   debugShowCheckedModeBanner: false,
                  //   theme: state.theme,
                  //   home: const HomePage(),
                  // );

                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: state.theme,
                    home: BlocProvider(
                      create: (context) =>
                          ChatThemeChangerBloc()..add(FirstTimeOpenChat()),
                      child: const HomePage(),
                      // HomePageChats(
                      //   user: User(
                      //     id: "0c2c6453-98a2-4360-d591-08dd11e3d775",
                      //     mobileNumber: "09000000000",
                      //     token:
                      //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIwYzJjNjQ1My05OGEyLTQzNjAtZDU5MS0wOGRkMTFlM2Q3NzUiLCJ1bmlxdWVfbmFtZSI6IjA5MTAwNTU2MDkyIiwibmJmIjoxNzMzMTQ5OTg2LCJleHAiOjE3MzMxNTc3ODYsImlhdCI6MTczMzE0OTk4NiwiaXNzIjoiWW91ckFQSSIsImF1ZCI6IllvdXJBUElVc2VycyJ9.SyrH7LeOO2tFxJmRdJJur27oG2OXPR5Dq3wxn9ESkWY",
                      //     type: 1,
                      //   ),
                      // ),
                    ),
                  );
                } else {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: darkTheme,
                    home: const SplashPage(),
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
