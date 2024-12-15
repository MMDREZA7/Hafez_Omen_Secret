import 'package:faleh_hafez/application/chat_items/chat_items_bloc.dart';
import 'package:faleh_hafez/application/chat_theme_changer/chat_theme_changer_bloc.dart';
import 'package:faleh_hafez/domain/user.dart';
import 'package:faleh_hafez/domain/user_chat_dto.dart';
import 'package:faleh_hafez/presentation/messenger/components/drawer_chat.dart';
import 'package:faleh_hafez/presentation/messenger/pages/messenger_pages/chat/chat_page.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePageChats extends StatefulWidget {
  final User user;

  const HomePageChats({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageChatsState createState() => _HomePageChatsState();
}

class _HomePageChatsState extends State<HomePageChats> {
  final TextEditingController _receiverUserIDController =
      TextEditingController();
  final box = Hive.box('mybox');
  var userProfile = User(
    id: 'id',
    mobileNumber: 'mobileNumber',
    token: 'token',
    type: UserType.Guest,
  );
  @override
  void initState() {
    super.initState();

    final String id = box.get('userID');
    final String mobileNumber = box.get('userMobile');
    final String token = box.get('userToken');
    // ignore: unused_local_variable
    final String type = box.get('userType');

    // var typeInt = int.tryParse(type);

    var userType = int.parse(type);

    userProfile = User(
      id: id,
      mobileNumber: mobileNumber,
      token: token,
      type: userTypeConvertToEnum[userType]!,
      // type: typeInt[userTypeConvertToEnum],
      // type: typeInt[userTypeConvertToEnum],
    );
  }

  // @override
  // void dispose() {
  //   _receiverUserIDController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatItemsBloc()
        ..add(ChatItemsGetItemsEvent(token: widget.user.token)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Messenger',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () => context
                    .read<ChatItemsBloc>()
                    .add(ChatItemsGetItemsEvent(token: widget.user.token)),
                icon: Icon(
                  Icons.refresh,
                  color: Theme.of(context).primaryColor,
                ),
              );
            }),
          ],
        ),
        drawer: DrawerHomeChat(user: userProfile),
        body: BlocBuilder<ChatItemsBloc, ChatItemsState>(
          builder: (context, state) {
            if (state is ChatItemsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ChatItemsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () => context.read<ChatItemsBloc>().add(
                          ChatItemsGetItemsEvent(token: widget.user.token)),
                      child: const Text("Try Again"),
                    ),
                  ],
                ),
              );
            }
            if (state is ChatItemsLoaded) {
              return ListView.builder(
                itemCount: state.userChatItems.length,
                itemBuilder: (context, index) {
                  final chatItem = state.userChatItems[index];
                  final isHost = widget.user.id == chatItem.participant1ID;
                  final hostID = isHost
                      ? chatItem.participant1ID
                      : chatItem.participant2ID;
                  final guestID = isHost
                      ? chatItem.participant2ID
                      : chatItem.participant1ID;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(
                            chatID: chatItem.id,
                            token: widget.user.token,
                            hostPublicID: hostID,
                            guestPublicID: guestID,
                            isGuest: true,
                            name: '',
                            myID: widget.user.id,
                            userChatItemDTO: chatItem,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 7.5,
                        horizontal: 15,
                      ),
                      child: ListTile(
                        title: Text(
                          isHost
                              ? chatItem.participant2MobileNumber
                              : chatItem.participant1MobileNumber,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text("No Chats available"));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _receiverUserIDController.clear();

            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add New Message To New User',
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Receiver ID'),
                        controller: _receiverUserIDController,
                        onEditingComplete: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                token: widget.user.token,
                                chatID: '',
                                hostPublicID: widget.user.id,
                                guestPublicID: _receiverUserIDController.text,
                                name: '',
                                isGuest: true,
                                myID: widget.user.id,
                                userChatItemDTO: UserChatItemDTO(
                                  id: "",
                                  participant1ID: widget.user.id,
                                  participant1MobileNumber:
                                      widget.user.mobileNumber,
                                  participant2ID:
                                      _receiverUserIDController.text,
                                  participant2MobileNumber: "",
                                  lastMessageTime: "",
                                ),
                                isNewChat: true,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          if (_receiverUserIDController.text.isEmpty) {
                            context.showErrorBar(
                              content: const Text(
                                "The Receiver ID field is required.",
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  token: widget.user.token,
                                  chatID: '',
                                  hostPublicID: widget.user.id,
                                  guestPublicID: _receiverUserIDController.text,
                                  name: '',
                                  isGuest: true,
                                  myID: widget.user.id,
                                  userChatItemDTO: UserChatItemDTO(
                                    id: "",
                                    participant1ID: widget.user.id,
                                    participant1MobileNumber:
                                        widget.user.mobileNumber,
                                    participant2ID:
                                        _receiverUserIDController.text,
                                    participant2MobileNumber: "",
                                    lastMessageTime: "",
                                  ),
                                  isNewChat: true,
                                ),
                              ),
                            );

                            // _receiverUserIDController.clear();
                          }
                        },
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
