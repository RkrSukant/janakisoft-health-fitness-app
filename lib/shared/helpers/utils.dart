import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget addDivider({Color color = AppColors.greyE8E9F1}) {
  return Expanded(
    child: Divider(
      height: 0,
      thickness: 1,
      color: color,
    ),
  );
}

Color addWhite(Color color, double whitePercentage) {
  whitePercentage = whitePercentage.clamp(0.0, 1.0);

  int red = (color.red + ((255 - color.red) * whitePercentage)).toInt();
  int green = (color.green + ((255 - color.green) * whitePercentage)).toInt();
  int blue = (color.blue + ((255 - color.blue) * whitePercentage)).toInt();

  return Color.fromARGB(color.alpha, red, green, blue);
}

Future<String> takePicture() async {
  try {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    return pickedImage?.path ?? '';
  } on PlatformException {
    return '';
  } on Exception {
    return '';
  }
}

String getCurrentDate() {
  return DateFormat('yyyy-MM-dd').format(DateTime.now());
}
