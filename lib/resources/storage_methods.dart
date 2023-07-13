import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  //getting the user id
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //adding image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref = _storage.ref().child(childName).child(_auth.currentUser!
        .uid); //ref method is a pointer to the file in the storage. This can be a refernce to a file that exist or does not exist. The first child can be a folder that exist or a folder that does not exist. If it exist it will go into that respective folder and if it does not exist then it will create a new folder for us. Another child that we are goiing to have is the user id

    //uploading a task
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref
        .getDownloadURL(); //this will fetch us the download URL to the file that is being uploded in the above lines.
    return downloadUrl;
  }
}
