import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

Future<String> uploadFile(File image) async {
  String fileName = basename(image.path);
  StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
  StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

  return await taskSnapshot.ref.getDownloadURL();

}