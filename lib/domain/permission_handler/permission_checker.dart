import 'package:permission_handler/permission_handler.dart';

class PermissionChecker {
  const PermissionChecker();

  // Future checkLocationPermission() async {
  //   if (!await _permission.isGranted) await _permission.request();
  // }

  Future<PermissionStatus> checkPermission(Permission permission) async {
    if (!await permission.isGranted) {
      return await permission.request();
    } else {
      return PermissionStatus.granted;
    }
  }
}
