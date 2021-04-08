import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
 * Created by riyadi rb on 2/5/2020.
 * link  : https://github.com/xrb21/flutter-html-editor
 */

typedef void CallbackValue(dynamic value);

class PickImage extends StatelessWidget {
  final CallbackValue callbackFile;
  final Color color;

  PickImage({this.callbackFile, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(10.0),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        getImage(true);
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Icon(
                              Icons.linked_camera,
                              color: color ?? Colors.black45,
                              size: 44,
                            ),
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(color: color ?? Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(10.0),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        getImage(false);
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Icon(
                              Icons.image,
                              color: color ?? Colors.black45,
                              size: 44,
                            ),
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(color: color ?? Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage(bool isKamera) async {
    final _picker = ImagePicker();

    var image = await _picker.getImage(
      source: isKamera ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 800.0,
      maxHeight: 600.0,
    );

    if (image != null) {
      callbackFile(image);
    }
  }
}
