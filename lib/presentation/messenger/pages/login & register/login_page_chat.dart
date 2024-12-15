import 'package:faleh_hafez/application/authentiction/authentication_bloc.dart';
import 'package:faleh_hafez/domain/user_reginster_login_dto.dart';
import 'package:faleh_hafez/presentation/messenger/pages/login%20&%20register/register_page_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/chat_theme_changer/chat_theme_changer_bloc.dart';
import '../messenger_pages/home_page_chats.dart';
import 'package:flash/flash_helper.dart';

class LoginPageMessenger extends StatefulWidget {
  const LoginPageMessenger({super.key});

  @override
  State<LoginPageMessenger> createState() => _LoginPageMessengerState();
}

class _LoginPageMessengerState extends State<LoginPageMessenger> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _mobileNumberFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ورود به اکانت',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // mobileNumber feild
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            size: 40,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          title: TextFormField(
                            focusNode: _mobileNumberFocusNode,
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.white,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'شماره تلفن',
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // password feild
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            size: 40,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          title: TextFormField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            focusNode: _passwordFocusNode,
                            controller: _passwordController,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'رمز عبور',
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            onEditingComplete: () {
                              if (_mobileNumberController.text.length != 11) {
                                context.showErrorBar(
                                  content:
                                      const Text("شماره باید 11 رقم باشد."),
                                );

                                return;
                              }

                              if (_mobileNumberController.text == "" ||
                                  _passwordController.text == "") {
                                context.showErrorBar(
                                  content: const Text(
                                      "فیلدهای موبایل و پسورد الزامی هستند."),
                                );

                                return;
                              }

                              context.read<AuthenticationBloc>().add(
                                    LoginUser(
                                      user: UserRegisterLoginDTO(
                                        password: _passwordController.text,
                                        mobileNumber:
                                            _mobileNumberController.text,
                                      ),
                                    ),
                                  );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                    BlocConsumer<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) async {
                        if (state is AuthenticationLoginSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocBuilder<
                                  ChatThemeChangerBloc, ChatThemeChangerState>(
                                builder: (context, themeChanger) {
                                  if (themeChanger is ChatThemeChangerLoaded) {
                                    return MaterialApp(
                                      theme: themeChanger.theme,
                                      home: HomePageChats(
                                        user: state.user,
                                      ),
                                    );
                                  }
                                  return MaterialApp(
                                    theme: themeChanger.theme,
                                    home: HomePageChats(
                                      user: state.user,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );

                          context.showSuccessBar(
                            content: const Text("خوش آمدید"),
                          );
                        }
                        if (state is AuthenticationError) {
                          context.showErrorBar(content: Text(state.errorText));
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthenticationLoading) {
                          return MaterialButton(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 25,
                            ),
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {},
                            child: const CircularProgressIndicator(),
                          );
                        }
                        return MaterialButton(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 25,
                          ),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () async {
                            if (_mobileNumberController.text.length != 11) {
                              context.showErrorBar(
                                content: const Text("شماره باید 11 رقم باشد."),
                              );

                              return;
                            }

                            if (_mobileNumberController.text == "" ||
                                _passwordController.text == "") {
                              context.showErrorBar(
                                content: const Text(
                                    "فیلدهای موبایل و پسورد الزامی هستند."),
                              );

                              return;
                            }

                            context.read<AuthenticationBloc>().add(
                                  LoginUser(
                                    user: UserRegisterLoginDTO(
                                      password: _passwordController.text,
                                      mobileNumber:
                                          _mobileNumberController.text,
                                    ),
                                  ),
                                );
                          },
                          child: Text(
                            'ورود',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 25),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPageMessenger(),
                          ),
                        );
                      },
                      child: const Text(
                        "تا به حال اکانت نداشته اید؟ / ثبت نام کنید",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
