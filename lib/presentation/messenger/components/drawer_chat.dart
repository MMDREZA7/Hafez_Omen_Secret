import 'package:faleh_hafez/application/chat_theme_changer/chat_theme_changer_bloc.dart';
import 'package:faleh_hafez/application/theme_changer/theme_changer_bloc.dart';
import 'package:faleh_hafez/domain/user.dart';
import 'package:faleh_hafez/presentation/home/home_page.dart';
import 'package:faleh_hafez/presentation/messenger/components/drawer_chat_item.dart';
import 'package:faleh_hafez/presentation/messenger/pages/login%20&%20register/login_page_chat.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerHomeChat extends StatefulWidget {
  final User user;

  const DrawerHomeChat({
    super.key,
    required this.user,
  });

  @override
  State<DrawerHomeChat> createState() => _DrawerHomeChatState();
}

class _DrawerHomeChatState extends State<DrawerHomeChat> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                title: Text(
                  widget.user.mobileNumber,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: widget.user.id,
                      ),
                    ).then((_) {
                      context.showInfoBar(
                        content: const Text('Your ID copied to clipboard ;)'),
                      );
                    });
                  },
                  icon: Icon(
                    Icons.copy,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                // Icon(
                //   Icons.person,
                //   color: Theme.of(context).colorScheme.onPrimary,
                // ),
                title: Text(
                  widget.user.id,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            DrawerItemChat(
              boxColor: Colors.blue,
              text: 'Profile',
              onTap: () {},
              icon: Icons.person,
            ),
            const SizedBox(height: 25),
            DrawerItemChat(
              boxColor: Colors.grey,
              text: 'Settings',
              onTap: () async {
                context.read<ChatThemeChangerBloc>().add(ChangeChatPageTheme());
              },
              icon: Icons.settings,
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPageMessenger(),
                  ),
                );
              },
              onDoubleTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BlocBuilder<ThemeChangerBloc, ThemeChangerState>(
                      builder: (context, state) {
                        if (state is ThemeChangerLoaded) {
                          return MaterialApp(
                            theme: state.theme,
                            home: const HomePage(),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
