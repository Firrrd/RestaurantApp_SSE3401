import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploaderController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  var imageOne = Rxn<File>();
  var imageTwo = Rxn<File>();
  var imageThree = Rxn<File>();
  var imageFour = Rxn<File>();
  var logo = Rxn<File>();
  var cover = Rxn<File>();

  final RxList<String> _images = <String>[].obs;

  List<String> get images => _images;

  set setImages(String newValue) {
    _images.add(newValue);
  }

  final RxString _imageOneUrl = ''.obs;
  final RxString _imageTwoUrl = ''.obs;
  final RxString _imageThreeUrl = ''.obs;
  final RxString _imageFourUrl = ''.obs;
  final RxString _logoUrl = ''.obs;
  final RxString _coverUrl = ''.obs;

  String get imageOneUrl => _imageOneUrl.value;
  String get imageTwoUrl => _imageTwoUrl.value;
  String get imageThreeUrl => _imageThreeUrl.value;
  String get imageFourUrl => _imageFourUrl.value;
  String get logoUrl => _logoUrl.value;
  String get coverUrl => _coverUrl.value;

  set setLogoUrl(String newValue) {
    _logoUrl.value = newValue;
  }

  set setCoverUrl(String newValue) {
    _coverUrl.value = newValue;
  }

  set setImageOneUrl(String newValue) {
    _imageOneUrl.value = newValue;
    images.add(newValue);
  }

  set setImageTwoUrl(String newValue) {
    _imageTwoUrl.value = newValue;
    images.add(newValue);
  }

  set setImageThreeUrl(String newValue) {
    _imageThreeUrl.value = newValue;
    images.add(newValue);
  }

  set setImageFourUrl(String newValue) {
    _imageFourUrl.value = newValue;
    images.add(newValue);
  }

  Future<void> pickImage(String type) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      if (type == 'one') {
        imageOne.value = File(pickedImage.path);
        uploadImageToFirebase('one');
        return;
      } else if (type == 'two') {
        imageTwo.value = File(pickedImage.path);
        uploadImageToFirebase('two');
        return;
      } else if (type == 'three') {
        imageThree.value = File(pickedImage.path);
        uploadImageToFirebase('three');
        return;
      } else if (type == 'four') {
        imageFour.value = File(pickedImage.path);
        uploadImageToFirebase('four');
        return;
      } else if (type == 'logo') {
        logo.value = File(pickedImage.path);
        uploadImageToFirebase('logo');
        return;
      } else if (type == 'cover') {
        cover.value = File(pickedImage.path);
        uploadImageToFirebase('cover');
        return;
      }
    }
  }

  Future<void> uploadImageToFirebase(String type) async {
    if (type == 'one') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${imageOne.value!.path.split('/').last}';

        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(imageOne.value!, SettableMetadata());

        setImageOneUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'two') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${imageTwo.value!.path.split('/').last}';

        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(imageTwo.value!, SettableMetadata());

        setImageTwoUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'three') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${imageThree.value!.path.split('/').last}';

        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(imageThree.value!, SettableMetadata());

        setImageThreeUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'four') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${imageFour.value!.path.split('/').last}';

        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(imageFour.value!, SettableMetadata());

        setImageFourUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'logo') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${logo.value!.path.split('/').last}';

        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(logo.value!, SettableMetadata());

        setLogoUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'cover') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${cover.value!.path.split('/').last}';

        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(cover.value!, SettableMetadata());

        setCoverUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
