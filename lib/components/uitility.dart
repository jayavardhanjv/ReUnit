import 'dart:html';

import 'package:image_picker/image_picker.dart';

MyImagPicker(ImageSource source) async {
  final ImagePicker _imagepicker = ImagePicker();
  final pickedFile = await _imagepicker.pickImage(source: source);
  File image = new File(pickedFile.path);
  if (pickedFile != null) {
    return await pickedFile.readAsBytes();
  } else {
    print("Image Not Selected");
  }
}
