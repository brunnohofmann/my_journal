import 'package:image_picker/image_picker.dart';

Future getImageFromGallery() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}