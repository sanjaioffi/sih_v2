import 'package:fluttertoast/fluttertoast.dart';

showToast(String toastContent) {
  Fluttertoast.showToast(
    msg: toastContent,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0,
  );
}
