import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../permission_handler/permission_checker.dart';

class FileHandler {
  final permissionChecker = const PermissionChecker();

  Future<File?> attachFileCaching({
    required List<int> data,
    required String fileName,
    required String fileID,
    required int fileSize,
    required String fileType,
  }) async {
    permissionChecker.checkPermission(Permission.manageExternalStorage);

    Directory appDocDir = await getApplicationSupportDirectory();
    Directory sp = Directory('${appDocDir.path}/faale_haafez');
    if (!await sp.exists()) {
      await sp.create(recursive: true);
    }
    sp = Directory('${sp.path}/files');
    if (!await sp.exists()) {
      await sp.create(recursive: true);
    }
    sp = Directory('${sp.path}/$fileID$fileType');
    File file = File(sp.path);

    if (!await file.exists()) {
      await file.create();
    }

    if (await file.length() == data.length) {
      return file;
    } else {
      await file.writeAsBytes(data);
      return file;
    }
  }

  Future<File?> getFile({
    required String fileID,
    required String fileType,
  }) async {
    permissionChecker.checkPermission(Permission.manageExternalStorage);

    Directory appDocDir = await getApplicationSupportDirectory();
    Directory sp = Directory('${appDocDir.path}/faale_haafez');

    if (!await sp.exists()) {
      await sp.create(recursive: true);
    }

    sp = Directory('${sp.path}/files');
    if (!await sp.exists()) {
      await sp.create(recursive: true);
    }

    sp = Directory('${sp.path}/$fileID$fileType');
    File file = File(sp.path);

    if (await file.exists()) {
      return file;
    } else {
      return null;
    }
  }

  /// null -> Success
  ///
  /// String -> Failure
  // Future<String> saveAsFile({
  //   required File file,
  //   required entity.File
  // }) async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //   late final PermissionStatus permission;
  //   if (androidInfo.version.sdkInt >= 33) {
  //     final videoPermisssion =
  //         await permissionChecker.checkPermission(Permission.videos);
  //     final photoPermisssion =
  //         await permissionChecker.checkPermission(Permission.photos);
  //     final externalStoragePermission = await permissionChecker
  //         .checkPermission(Permission.manageExternalStorage);

  //     permission = videoPermisssion == PermissionStatus.granted &&
  //             photoPermisssion == PermissionStatus.granted &&
  //             externalStoragePermission == PermissionStatus.granted
  //         ? PermissionStatus.granted
  //         : PermissionStatus.denied;
  //   } else if (androidInfo.version.sdkInt >= 30) {
  //     final storagePermission =
  //         await permissionChecker.checkPermission(Permission.storage);
  //     final externalStoragePermission = await permissionChecker
  //         .checkPermission(Permission.manageExternalStorage);

  //     permission = storagePermission == PermissionStatus.granted &&
  //             externalStoragePermission == PermissionStatus.granted
  //         ? PermissionStatus.granted
  //         : PermissionStatus.denied;
  //   } else {
  //     permission = await permissionChecker.checkPermission(Permission.storage);

  //     // Get the downloads directory
  //     Directory? directory = Directory('/storage/emulated/0/Download');

  //     if (!await directory.exists()) {
  //       directory = await getExternalStorageDirectory();
  //     }
  //     if (directory == null) {
  //       // User canceled directory picking
  //       throw const UnknowFail(
  //           message:
  //               "An error occured in saving file into downloads directory.");
  //     }

  //     File destFile = File('${directory.path}/$fileName');

  //     await destFile.writeAsBytes(file.readAsBytesSync());

  //     return 'File saved to: ${destFile.path}';
  //   }

  //   if (permission.isGranted) {
  //     // Get the directory for saving the file
  //     String? directory = await FilePicker.platform.getDirectoryPath();
  //     if (directory == null) {
  //       // User canceled directory picking
  //       throw const UnknowFail(message: "Directory picking canceled.");
  //     }

  //     // Create a File instance for the destination path
  //     File destFile = File('$directory/$fileName');

  //     // Write the file content to the destination file
  //     await destFile.writeAsBytes(file.readAsBytesSync());

  //     return 'File saved at: ${destFile.path}';
  //   } else {
  //     throw const UnknowFail(message: "Permission Needed for this operation.");
  //   }
  // }
}
