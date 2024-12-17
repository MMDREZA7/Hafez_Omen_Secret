import 'dart:convert';

import 'package:faleh_hafez/domain/models/group.dart';
import 'package:faleh_hafez/domain/models/group_chat_dto%20copy.dart';
import 'package:faleh_hafez/domain/models/massage_dto.dart';
import 'package:faleh_hafez/domain/models/user.dart';
import 'package:faleh_hafez/domain/models/user_chat_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl = "http://130.185.76.18:3030";

  //* Authentication
  Future<String> registerUser(String mobileNumber, String password) async {
    final box = Hive.box('mybox');

    final url = Uri.parse('$baseUrl/api/Authentication/Register');

    try {
      var bodyRequest = {
        "mobileNumber": mobileNumber,
        "password": password,
      };

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(bodyRequest),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> loginUser(String mobileNumber, String password) async {
    final box = Hive.box('mybox');

    final url = Uri.parse('$baseUrl/api/Authentication/Login');
    try {
      var bodyRequest = {"mobileNumber": mobileNumber, "password": password};

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(bodyRequest),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var bodyContent = json.decode(response.body);
        var user = User(
          id: bodyContent["id"],
          mobileNumber: bodyContent["mobileNumber"],
          token: bodyContent["token"],
          type: userTypeConvertToEnum[bodyContent["type"]]!,
        );

        box.delete('userID');
        box.delete('userMobile');
        box.delete('userToken');
        box.delete('userType');

        box.put('userID', user.id);
        box.put('userMobile', user.mobileNumber);
        box.put('userToken', user.token);
        box.put('userType', bodyContent['type'].toString());

        return user;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  //* Chat
  Future<List<UserChatItemDTO>> getUserChats({required String token}) async {
    final url = Uri.parse('$baseUrl/api/Chat/GetUserChats');

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var bodyContent = json.decode(response.body);

        final List<UserChatItemDTO> userChatItems = [];

        for (var item in bodyContent) {
          userChatItems.add(
            UserChatItemDTO(
              id: item['id'],
              participant1ID: item['participant1ID'],
              participant1MobileNumber: item['participant1MobileNumber'],
              participant2ID: item['participant2ID'],
              participant2MobileNumber: item['participant2MobileNumber'],
              lastMessageTime: item['lastMessageTime'],
            ),
          );
        }

        return userChatItems;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  //* Group
  Future<List<groupChatItemDTO>> getGroupChats({required String token}) async {
    final url = Uri.parse('$baseUrl/api/Group/GetUserGroups');

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var bodyContent = json.decode(response.body);

        final List<groupChatItemDTO> userChatItems = [];

        for (var item in bodyContent) {
          userChatItems.add(
            groupChatItemDTO(
              id: item["id"],
              groupName: item["groupName"],
              lastMessageTime: item["lastMessageTime"],
              createdByID: item["createdByID"],
            ),
          );
        }

        return userChatItems;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Group> createGroup({
    required String groupName,
    required String token,
  }) async {
    final box = Hive.box('mybox');

    final url = Uri.parse('$baseUrl/api/Group/CreateGroup');
    try {
      var bodyRequest = {"groupName": groupName};

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: json.encode(bodyRequest),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var bodyContent = json.decode(response.body);
        var group = Group(
          id: bodyContent["id"],
          groupName: bodyContent["groupName"],
          lastMessageTime: bodyContent["lastMessageTime"],
          createdByID: bodyContent["createdByID"],
        );

        print(group);

        return group;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  //* Message
  Future<List<MessageDTO>> getChatMessages({
    required String chatID,
    required String token,
  }) async {
    final url = Uri.parse('$baseUrl/api/Message/GetMessages');

    var bodyRequest = {
      "id": chatID,
    };

    List<MessageDTO> messagesList = [];

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: json.encode(bodyRequest),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var messages = json.decode(response.body);

        for (var message in messages) {
          messagesList.add(
            MessageDTO(
              reciverID: message["receiverID"],
              senderID: message["senderID"],
              text: message["text"],
              chatID: message["chatID"],
              groupID: message["groupID"],
              senderMobileNumber: message["senderMobileNumber"],
              receiverID: message["receiverID"],
              receiverMobileNumber: message["receiverMobileNumber"],
              sentDateTime: message["sentDateTime"],
              isRead: message["isRead"],
            ),
          );
        }

        return messagesList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendMessage({
    required String token,
    required String receiverID,
    required String text,
  }) async {
    final url = Uri.parse('$baseUrl/api/Message/SendMessage');

    var bodyRequest = {
      "receiverID": receiverID,
      "text": text,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: json.encode(bodyRequest),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var message = json.decode(response.body);

        return message;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  //* User
  Future<String> getUserID({
    required String token,
    required String mobileNumber,
  }) async {
    final url = Uri.parse('$baseUrl/api/User/GetUserID');

    var bodyRequest = {
      "mobileNumber": mobileNumber,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: json.encode(bodyRequest),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var id = json.decode(response.body);
        return id;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
