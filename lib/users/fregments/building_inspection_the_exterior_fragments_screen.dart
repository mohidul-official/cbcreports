import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_exterior_step_two_fragments_screen.dart';

class BuildingInspectorTheExteriorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectorTheExteriorFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectorTheExteriorFragments> createState() =>
      _BuildingInspectorTheExteriorFragmentsState();
}

class _BuildingInspectorTheExteriorFragmentsState
    extends State<BuildingInspectorTheExteriorFragments> {
  /*TextEditingController wallsController = TextEditingController();
  TextEditingController externalCladdingController = TextEditingController();
  TextEditingController lintelsController = TextEditingController();
  TextEditingController doorsController = TextEditingController();

  TextEditingController windowsController = TextEditingController();*/

  bool viewVisible = false;
  bool viewVisibleTwo = false;
  bool viewVisibleThree = false;

  bool viewcladdingVisible = false;
  bool viewcladdingVisibleTwo = false;
  bool viewcladdingVisibleThree = false;

  bool viewlintelsVisible = false;
  bool viewlintelsVisibleTwo = false;
  bool viewlintelsVisibleThree = false;

  var wallsimagePath = "NA";
  var wallsimageName = "NA";
  var wallsimageData = "NA";

  var wallstwoimagePath = "NA";
  var wallstwoimageName = "NA";
  var wallstwoimageData = "NA";

  var wallsthreeimagePath = "NA";
  var wallsthreeimageName = "NA";
  var wallsthreeimageData = "NA";

  var wallsfourimagePath = "NA";
  var wallsfourimageName = "NA";
  var wallsfourimageData = "NA";

  var claddingimagePath = "NA";
  var claddingimageName = "NA";
  var claddingimageData = "NA";

  var claddingtwoimagePath = "NA";
  var claddingtwoimageName = "NA";
  var claddingtwoimageData = "NA";

  var claddingthreeimagePath = "NA";
  var claddingthreeimageName = "NA";
  var claddingthreeimageData = "NA";

  var claddingfourimagePath = "NA";
  var claddingfourimageName = "NA";
  var claddingfourimageData = "NA";

  var lintelsimagePath = "NA";
  var lintelsimageName = "NA";
  var lintelsimageData = "NA";

  var lintelstwoimagePath = "NA";
  var lintelstwoimageName = "NA";
  var lintelstwoimageData = "NA";

  var lintelsthreeimagePath = "NA";
  var lintelsthreeimageName = "NA";
  var lintelsthreeimageData = "NA";

  var lintelsfourimagePath = "NA";
  var lintelsfourimageName = "NA";
  var lintelsfourimageData = "NA";

  var doorsimagePath = "NA";
  var doorsimageName = "NA";
  var doorsimageData = "NA";

  var windowsimagePath = "NA";
  var windowsimageName = "NA";
  var windowsimageData = "NA";

  /*File? wallsimagePath;
  String? wallsimageName;
  String? wallsimageData;

  File? claddingimagePath;
  String? claddingimageName;
  String? claddingimageData;

  File? lintelsimagePath;
  String? lintelsimageName;
  String? lintelsimageData;

  File? doorsimagePath;
  String? doorsimageName;
  String? doorsimageData;

  File? windowsimagePath;
  String? windowsimageName;
  String? windowsimageData;*/

  var exteriordefectswalls = "NA";
  var exteriordefectswallsvalue = "NA";

  var exteriordefectscladding = "NA";
  var exteriordefectscladdingvalue = "NA";

  var exteriordefectslintels = "NA";

  var exteriordefectsdoors = "NA";
  var exteriordefectsdoorsvalue = "NA";

  var exteriordefectswindows = "NA";
  var exteriordefectswindowsvalue = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> wallsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallsimagePath = File(getimage.path);
        wallsimageName = getimage.path.split('/').last;
        wallsimageData = base64Encode(wallsimagePath.readAsBytesSync());
        print(wallsimagePath);
        print(wallsimageName);
        print(wallsimageData);
      }
    });
  }

  Future<void> wallscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallsimagePath = File(getimage.path);
        wallsimageName = getimage.path.split('/').last;
        wallsimageData = base64Encode(wallsimagePath.readAsBytesSync());
        print(wallsimagePath);
        print(wallsimageName);
        print(wallsimageData);
      }
    });
  }

  Future<void> wallstwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallstwoimagePath = File(getimage.path);

        wallstwoimageName = getimage.path.split('/').last;
        wallstwoimageData = base64Encode(wallstwoimagePath.readAsBytesSync());

        print(wallstwoimagePath);
        print(wallstwoimageName);
        print(wallstwoimageData);
      }
    });
  }

  Future<void> wallstwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallstwoimagePath = File(getimage.path);

        wallstwoimageName = getimage.path.split('/').last;
        wallstwoimageData = base64Encode(wallstwoimagePath.readAsBytesSync());

        print(wallstwoimagePath);
        print(wallstwoimageName);
        print(wallstwoimageData);
      }
    });
  }

  Future<void> wallsthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallsthreeimagePath = File(getimage.path);

        wallsthreeimageName = getimage.path.split('/').last;
        wallsthreeimageData =
            base64Encode(wallsthreeimagePath.readAsBytesSync());

        print(wallsthreeimagePath);
        print(wallsthreeimageName);
        print(wallsthreeimageData);
      }
    });
  }

  Future<void> wallsthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallsthreeimagePath = File(getimage.path);

        wallsthreeimageName = getimage.path.split('/').last;
        wallsthreeimageData =
            base64Encode(wallsthreeimagePath.readAsBytesSync());

        print(wallsthreeimagePath);
        print(wallsthreeimageName);
        print(wallsthreeimageData);
      }
    });
  }

  Future<void> wallsfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallsfourimagePath = File(getimage.path);

        wallsfourimageName = getimage.path.split('/').last;
        wallsfourimageData = base64Encode(wallsfourimagePath.readAsBytesSync());

        print(wallsfourimagePath);
        print(wallsfourimageName);
        print(wallsfourimageData);
      }
    });
  }

  Future<void> wallsfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallsfourimagePath = File(getimage.path);

        wallsfourimageName = getimage.path.split('/').last;
        wallsfourimageData = base64Encode(wallsfourimagePath.readAsBytesSync());

        print(wallsfourimagePath);
        print(wallsfourimageName);
        print(wallsfourimageData);
      }
    });
  }

  Future<void> claddinggetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingimagePath = File(getimage.path);
        claddingimageName = getimage.path.split('/').last;
        claddingimageData = base64Encode(claddingimagePath.readAsBytesSync());
        print(claddingimagePath);
        print(claddingimageName);
        print(claddingimageData);
      }
    });
  }

  Future<void> claddingcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingimagePath = File(getimage.path);
        claddingimageName = getimage.path.split('/').last;
        claddingimageData = base64Encode(claddingimagePath.readAsBytesSync());
        print(claddingimagePath);
        print(claddingimageName);
        print(claddingimageData);
      }
    });
  }

  Future<void> claddingtwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingtwoimagePath = File(getimage.path);

        claddingtwoimageName = getimage.path.split('/').last;
        claddingtwoimageData =
            base64Encode(claddingtwoimagePath.readAsBytesSync());

        print(claddingtwoimagePath);
        print(claddingtwoimageName);
        print(claddingtwoimageData);
      }
    });
  }

  Future<void> claddingtwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingtwoimagePath = File(getimage.path);

        claddingtwoimageName = getimage.path.split('/').last;
        claddingtwoimageData =
            base64Encode(claddingtwoimagePath.readAsBytesSync());

        print(claddingtwoimagePath);
        print(claddingtwoimageName);
        print(claddingtwoimageData);
      }
    });
  }

  Future<void> claddingthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingthreeimagePath = File(getimage.path);

        claddingthreeimageName = getimage.path.split('/').last;
        claddingthreeimageData =
            base64Encode(claddingthreeimagePath.readAsBytesSync());

        print(claddingthreeimagePath);
        print(claddingthreeimageName);
        print(claddingthreeimageData);
      }
    });
  }

  Future<void> claddingthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingthreeimagePath = File(getimage.path);

        claddingthreeimageName = getimage.path.split('/').last;
        claddingthreeimageData =
            base64Encode(claddingthreeimagePath.readAsBytesSync());

        print(claddingthreeimagePath);
        print(claddingthreeimageName);
        print(claddingthreeimageData);
      }
    });
  }

  Future<void> claddingfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingfourimagePath = File(getimage.path);

        claddingfourimageName = getimage.path.split('/').last;
        claddingfourimageData =
            base64Encode(claddingfourimagePath.readAsBytesSync());

        print(claddingfourimagePath);
        print(claddingfourimageName);
        print(claddingfourimageData);
      }
    });
  }

  Future<void> claddingfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingfourimagePath = File(getimage.path);

        claddingfourimageName = getimage.path.split('/').last;
        claddingfourimageData =
            base64Encode(claddingfourimagePath.readAsBytesSync());

        print(claddingfourimagePath);
        print(claddingfourimageName);
        print(claddingfourimageData);
      }
    });
  }

  Future<void> lintelsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelsimagePath = File(getimage.path);
        lintelsimageName = getimage.path.split('/').last;
        lintelsimageData = base64Encode(lintelsimagePath.readAsBytesSync());
        print(lintelsimagePath);
        print(lintelsimageName);
        print(lintelsimageData);
      }
    });
  }

  Future<void> lintelscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelsimagePath = File(getimage.path);
        lintelsimageName = getimage.path.split('/').last;
        lintelsimageData = base64Encode(lintelsimagePath.readAsBytesSync());
        print(lintelsimagePath);
        print(lintelsimageName);
        print(lintelsimageData);
      }
    });
  }

  Future<void> lintelstwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelstwoimagePath = File(getimage.path);

        lintelstwoimageName = getimage.path.split('/').last;
        lintelstwoimageData =
            base64Encode(lintelstwoimagePath.readAsBytesSync());

        print(lintelstwoimagePath);
        print(lintelstwoimageName);
        print(lintelstwoimageData);
      }
    });
  }

  Future<void> lintelstwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelstwoimagePath = File(getimage.path);

        lintelstwoimageName = getimage.path.split('/').last;
        lintelstwoimageData =
            base64Encode(lintelstwoimagePath.readAsBytesSync());

        print(lintelstwoimagePath);
        print(lintelstwoimageName);
        print(lintelstwoimageData);
      }
    });
  }

  Future<void> lintelsthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelsthreeimagePath = File(getimage.path);

        lintelsthreeimageName = getimage.path.split('/').last;
        lintelsthreeimageData =
            base64Encode(lintelsthreeimagePath.readAsBytesSync());

        print(lintelsthreeimagePath);
        print(lintelsthreeimageName);
        print(lintelsthreeimageData);
      }
    });
  }

  Future<void> lintelsthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelsthreeimagePath = File(getimage.path);

        lintelsthreeimageName = getimage.path.split('/').last;
        lintelsthreeimageData =
            base64Encode(lintelsthreeimagePath.readAsBytesSync());

        print(lintelsthreeimagePath);
        print(lintelsthreeimageName);
        print(lintelsthreeimageData);
      }
    });
  }

  Future<void> lintelsfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelsfourimagePath = File(getimage.path);

        lintelsfourimageName = getimage.path.split('/').last;
        lintelsfourimageData =
            base64Encode(lintelsfourimagePath.readAsBytesSync());

        print(lintelsfourimagePath);
        print(lintelsfourimageName);
        print(lintelsfourimageData);
      }
    });
  }

  Future<void> lintelsfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelsfourimagePath = File(getimage.path);

        lintelsfourimageName = getimage.path.split('/').last;
        lintelsfourimageData =
            base64Encode(lintelsfourimagePath.readAsBytesSync());

        print(lintelsfourimagePath);
        print(lintelsfourimageName);
        print(lintelsfourimageData);
      }
    });
  }

  Future<void> doorsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File doorsimagePath = File(getimage.path);
        doorsimageName = getimage.path.split('/').last;
        doorsimageData = base64Encode(doorsimagePath.readAsBytesSync());
        print(doorsimagePath);
        print(doorsimageName);
        print(doorsimageData);
      }
    });
  }

  Future<void> doorscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File doorsimagePath = File(getimage.path);
        doorsimageName = getimage.path.split('/').last;
        doorsimageData = base64Encode(doorsimagePath.readAsBytesSync());
        print(doorsimagePath);
        print(doorsimageName);
        print(doorsimageData);
      }
    });
  }

  Future<void> windowsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File windowsimagePath = File(getimage.path);
        windowsimageName = getimage.path.split('/').last;
        windowsimageData = base64Encode(windowsimagePath.readAsBytesSync());
        print(windowsimagePath);
        print(windowsimageName);
        print(windowsimageData);
      }
    });
  }

  Future<void> windowscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File windowsimagePath = File(getimage.path);
        windowsimageName = getimage.path.split('/').last;
        windowsimageData = base64Encode(windowsimagePath.readAsBytesSync());
        print(windowsimagePath);
        print(windowsimageName);
        print(windowsimageData);
      }
    });
  }

  exteriordefectswallsCheck() {
    if (exteriordefectswalls == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectswallsvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('General movement cracking was found.'),
            value: "General movement cracking was found.",
          ),
          DropdownMenuItem(
            child: Text(
                'General movement cracking was found.\nRegardless of the appearance of the cracks\na Pre-Purchase Building Inspector carrying\nout a Pre-Purchase Inspection within the\nscope of a visual inspection is unable to\ndetermine the expected consequences of\nthe cracks.\n '),
            value:
                "General movement cracking was found. Regardless of the appearance of the cracks a Pre-Purchase Building Inspector carrying out a Pre-Purchase Inspection within the scope of a visual inspection is unable to determine the expected consequences of the cracks. ",
          ),
          DropdownMenuItem(
            child: Text(
                'Cracking was found to the external cladding.\nRegardless of the appearance of the\ncracks a Pre-Purchase Building Inspector\ncarrying out a Pre-Purchase Inspection within\nthe scope of a visual inspection is unable to\ndetermine the expected consequences of the\ncracks. A Structural Engineer is required to\ndetermine the significance of the cracking\nprior to a decision to purchase.'),
            value:
                "Cracking was found to the external cladding. Regardless of the appearance of the cracks a Pre-Purchase Building Inspector carrying out a Pre-Purchase Inspection within the scope of a visual inspection is unable to determine the expected consequences of the cracks. A Structural Engineer is required to determine the significance of the cracking prior to a decision to purchase.",
          ),
        ],
        onChanged: (exteriordefectswallsvalue) {
          setState(() {
            this.exteriordefectswallsvalue = exteriordefectswallsvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  exteriordefectscladdingCheck() {
    if (exteriordefectscladding == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectscladdingvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('General movement cracking was found.'),
            value: "General movement cracking was found.",
          ),
          DropdownMenuItem(
            child: Text(
                'General movement cracking was found.\nRegardless of the appearance of the cracks\na Pre-Purchase Building Inspector carrying\nout a Pre-Purchase Inspection within the\nscope of a visual inspection is unable to\ndetermine the expected consequences of\nthe cracks.\n '),
            value:
                "General movement cracking was found. Regardless of the appearance of the cracks a Pre-Purchase Building Inspector carrying out a Pre-Purchase Inspection within the scope of a visual inspection is unable to determine the expected consequences of the cracks. ",
          ),
          DropdownMenuItem(
            child: Text(
                'Cracking was found to the external cladding.\nRegardless of the appearance of the\ncracks a Pre-Purchase Building Inspector\ncarrying out a Pre-Purchase Inspection within\nthe scope of a visual inspection is unable to\ndetermine the expected consequences of the\ncracks. A Structural Engineer is required to\ndetermine the significance of the cracking\nprior to a decision to purchase.'),
            value:
                "Cracking was found to the external cladding. Regardless of the appearance of the cracks a Pre-Purchase Building Inspector carrying out a Pre-Purchase Inspection within the scope of a visual inspection is unable to determine the expected consequences of the cracks. A Structural Engineer is required to determine the significance of the cracking prior to a decision to purchase.",
          ),
        ],
        onChanged: (exteriordefectscladdingvalue) {
          setState(() {
            this.exteriordefectscladdingvalue = exteriordefectscladdingvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  exteriordefectsdoorsCheck() {
    if (exteriordefectsdoors == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectsdoorsvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('Door is damaged.'),
            value: "Door is damaged.",
          ),
          DropdownMenuItem(
            child: Text('Door is jammed.'),
            value: "Door is jammed.",
          ),
          DropdownMenuItem(
            child: Text(
                'It is recommended to contact a certified\ncarpenter to fix it.'),
            value:
                "It is recommended to contact a certified carpenter to fix it.",
          ),
        ],
        onChanged: (exteriordefectsdoorsvalue) {
          setState(() {
            this.exteriordefectsdoorsvalue = exteriordefectsdoorsvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  exteriordefectswindowsCheck() {
    if (exteriordefectswindows == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectswindowsvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child:
                Text('Gaps around windows and brick\nwork needs to be sealed.'),
            value: "Gaps around windows and brick work needs to be sealed.",
          ),
          DropdownMenuItem(
            child: Text('Window is damaged.'),
            value: "Window is damaged.",
          ),
          DropdownMenuItem(
            child: Text('External window frame is damaged.'),
            value: "External window frame is damaged.",
          ),
          DropdownMenuItem(
            child: Text('Internal windowsill is damaged due\nto moisture.'),
            value: "Internal windowsill is damaged due to moisture.",
          ),
        ],
        onChanged: (exteriordefectswindowsvalue) {
          setState(() {
            this.exteriordefectswindowsvalue = exteriordefectswindowsvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  Future<void> updateTheExteriorDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res =
          await http.post(Uri.parse(API.prepurchasetheexteriordetails), body: {
        "id": id,
        //"exteriordefectswalls": wallsController.text.trim(),
        "exteriordefectswalls": exteriordefectswalls,
        "exteriordefectswallsvalue": exteriordefectswallsvalue,
        //"exteriordefectscladding": externalCladdingController.text.trim(),
        "exteriordefectscladding": exteriordefectscladding,
        "exteriordefectscladdingvalue": exteriordefectscladdingvalue,
        //"exteriordefectslintels": lintelsController.text.trim(),
        "exteriordefectslintels": exteriordefectslintels,
        //"exteriordefectsdoors": doorsController.text.trim(),
        "exteriordefectsdoors": exteriordefectsdoors,
        "exteriordefectsdoorsvalue": exteriordefectsdoorsvalue,
        //"exteriordefectswindows": windowsController.text.trim(),
        "exteriordefectswindows": exteriordefectswindows,
        "exteriordefectswindowsvalue": exteriordefectswindowsvalue,
        "wallsimagedata": wallsimageData,
        "wallsimagename": wallsimageName,
        "wallstwoimagedata": wallstwoimageData,
        "wallstwoimagename": wallstwoimageName,
        "wallsthreeimagedata": wallsthreeimageData,
        "wallsthreeimagename": wallsthreeimageName,
        "wallsfourimagedata": wallsfourimageData,
        "wallsfourimagename": wallsfourimageName,
        "claddingimagedata": claddingimageData,
        "claddingimagename": claddingimageName,
        "claddingtwoimagedata": claddingtwoimageData,
        "claddingtwoimagename": claddingtwoimageName,
        "claddingthreeimagedata": claddingthreeimageData,
        "claddingthreeimagename": claddingthreeimageName,
        "claddingfourimagedata": claddingfourimageData,
        "claddingfourimagename": claddingfourimageName,
        "lintelsimagedata": lintelsimageData,
        "lintelsimagename": lintelsimageName,
        "lintelstwoimagedata": lintelstwoimageData,
        "lintelstwoimagename": lintelstwoimageName,
        "lintelsthreeimagedata": lintelsthreeimageData,
        "lintelsthreeimagename": lintelsthreeimageName,
        "lintelsfourimagedata": lintelsfourimageData,
        "lintelsfourimagename": lintelsfourimageName,
        "doorsimagedata": doorsimageData,
        "doorsimagename": doorsimageName,
        "windowsimagedata": windowsimageData,
        "windowsimagename": windowsimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectorTheExteriorStepTwoFragments(reportId: id)));
      } else {
        Navigator.of(context).pop();
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      Navigator.of(context).pop();
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void hideWidget() {
    if (viewVisible == true) {
      setState(() {
        viewVisible = false;
        viewVisibleTwo = false;
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        wallstwoimagePath = "NA";
        wallstwoimageName = "NA";
        wallstwoimageData = "NA";

        wallsthreeimagePath = "NA";
        wallsthreeimageName = "NA";
        wallsthreeimageData = "NA";

        wallsfourimagePath = "NA";
        wallsfourimageName = "NA";
        wallsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewVisible = true;
        viewVisibleTwo = false;
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidetwoWidget() {
    if (viewVisibleTwo == true) {
      setState(() {
        viewVisibleTwo = false;
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        wallsthreeimagePath = "NA";
        wallsthreeimageName = "NA";
        wallsthreeimageData = "NA";

        wallsfourimagePath = "NA";
        wallsfourimageName = "NA";
        wallsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewVisibleTwo = true;
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidethreeWidget() {
    if (viewVisibleThree == true) {
      setState(() {
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        wallsfourimagePath = "NA";
        wallsfourimageName = "NA";
        wallsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidecladdingWidget() {
    if (viewcladdingVisible == true) {
      setState(() {
        viewcladdingVisible = false;
        viewcladdingVisibleTwo = false;
        viewcladdingVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        claddingtwoimagePath = "NA";
        claddingtwoimageName = "NA";
        claddingtwoimageData = "NA";

        claddingthreeimagePath = "NA";
        claddingthreeimageName = "NA";
        claddingthreeimageData = "NA";

        claddingfourimagePath = "NA";
        claddingfourimageName = "NA";
        claddingfourimageData = "NA";
      });
    } else {
      setState(() {
        viewcladdingVisible = true;
        viewcladdingVisibleTwo = false;
        viewcladdingVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidecladdingtwoWidget() {
    if (viewcladdingVisibleTwo == true) {
      setState(() {
        viewcladdingVisibleTwo = false;
        viewcladdingVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        claddingthreeimagePath = "NA";
        claddingthreeimageName = "NA";
        claddingthreeimageData = "NA";

        claddingfourimagePath = "NA";
        claddingfourimageName = "NA";
        claddingfourimageData = "NA";
      });
    } else {
      setState(() {
        viewcladdingVisibleTwo = true;
        viewcladdingVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidecladdingthreeWidget() {
    if (viewcladdingVisibleThree == true) {
      setState(() {
        viewcladdingVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        claddingfourimagePath = "NA";
        claddingfourimageName = "NA";
        claddingfourimageData = "NA";
      });
    } else {
      setState(() {
        viewcladdingVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidelintelsWidget() {
    if (viewlintelsVisible == true) {
      setState(() {
        viewlintelsVisible = false;
        viewlintelsVisibleTwo = false;
        viewlintelsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        lintelstwoimagePath = "NA";
        lintelstwoimageName = "NA";
        lintelstwoimageData = "NA";

        lintelsthreeimagePath = "NA";
        lintelsthreeimageName = "NA";
        lintelsthreeimageData = "NA";

        lintelsfourimagePath = "NA";
        lintelsfourimageName = "NA";
        lintelsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewlintelsVisible = true;
        viewlintelsVisibleTwo = false;
        viewlintelsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidelintelstwoWidget() {
    if (viewlintelsVisibleTwo == true) {
      setState(() {
        viewlintelsVisibleTwo = false;
        viewlintelsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        lintelsthreeimagePath = "NA";
        lintelsthreeimageName = "NA";
        lintelsthreeimageData = "NA";

        lintelsfourimagePath = "NA";
        lintelsfourimageName = "NA";
        lintelsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewlintelsVisibleTwo = true;
        viewlintelsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidelintelsthreeWidget() {
    if (viewlintelsVisibleThree == true) {
      setState(() {
        viewlintelsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        lintelsfourimagePath = "NA";
        lintelsfourimageName = "NA";
        lintelsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewlintelsVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre Purchase Reports'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'EXTERIOR OF THE BUILDING (STEP 1)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Description of the Defects/Safety Hazards, Location and the Inspector’s Recommendations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            //Report id

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Report Id:${widget.reportId}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            //Walls

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Walls'),
                ),
                value: exteriordefectswalls,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectswalls) {
                  setState(() {
                    this.exteriordefectswalls = exteriordefectswalls!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectswallsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: wallsimagePath != "NA"
                  ? Image.memory(base64Decode(wallsimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          wallscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          wallsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hideWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisible,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: wallstwoimageData != "NA"
                          ? Image.memory(base64Decode(wallstwoimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  wallstwocaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  wallstwogetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //2nd Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidetwoWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //2nd Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: wallsthreeimageData != "NA"
                          ? Image.memory(base64Decode(wallsthreeimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  wallsthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  wallsthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidethreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: wallsfourimageData != "NA"
                          ? Image.memory(base64Decode(wallsfourimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  wallsfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  wallsfourgetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //4th Add More Button
                    /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidetwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
                ),
              ),
            ),

            //External Cladding

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('External Cladding'),
                ),
                value: exteriordefectscladding,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectscladding) {
                  setState(() {
                    this.exteriordefectscladding = exteriordefectscladding!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectscladdingCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: claddingimagePath != "NA"
                  ? Image.memory(base64Decode(claddingimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          claddingcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          claddinggetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st cladding Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hidecladdingWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st cladding Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewcladdingVisible,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: claddingtwoimageData != "NA"
                          ? Image.memory(base64Decode(claddingtwoimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  claddingtwocaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  claddingtwogetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //2nd cladding Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidecladdingtwoWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //2nd claddingAdd More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewcladdingVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: claddingthreeimageData != "NA"
                          ? Image.memory(base64Decode(claddingthreeimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  claddingthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  claddingthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd cladding Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidecladdingthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd cladding Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewcladdingVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: claddingfourimageData != "NA"
                          ? Image.memory(base64Decode(claddingfourimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  claddingfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  claddingfourgetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //4th Add More Button
                    /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidetwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
                ),
              ),
            ),

            //Lintels

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Lintels'),
                ),
                value: exteriordefectslintels,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectslintels) {
                  setState(() {
                    this.exteriordefectslintels = exteriordefectslintels!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: lintelsimagePath != "NA"
                  ? Image.memory(base64Decode(lintelsimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          lintelscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          lintelsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st lintels Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hidelintelsWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st lintels Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewlintelsVisible,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: lintelstwoimageData != "NA"
                          ? Image.memory(base64Decode(lintelstwoimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  lintelstwocaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  lintelstwogetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //2nd lintels Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidelintelstwoWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //2nd lintels Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewlintelsVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: lintelsthreeimageData != "NA"
                          ? Image.memory(base64Decode(lintelsthreeimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  lintelsthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  lintelsthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd lintels Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidelintelsthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd lintels Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewlintelsVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: lintelsfourimageData != "NA"
                          ? Image.memory(base64Decode(lintelsfourimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  lintelsfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  lintelsfourgetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //4th Add More Button
                    /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidetwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
                ),
              ),
            ),

            //Doors

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Doors'),
                ),
                value: exteriordefectsdoors,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectsdoors) {
                  setState(() {
                    this.exteriordefectsdoors = exteriordefectsdoors!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectsdoorsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: doorsimagePath != "NA"
                  ? Image.memory(base64Decode(doorsimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          doorscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          doorsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Windows

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Windows'),
                ),
                value: exteriordefectswindows,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectswindows) {
                  setState(() {
                    this.exteriordefectswindows = exteriordefectswindows!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectswindowsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: windowsimagePath != "NA"
                  ? Image.memory(base64Decode(windowsimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          windowscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          windowsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Back')),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          updateTheExteriorDetails(widget.reportId);
                        },
                        child: Text('Save & Next')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
