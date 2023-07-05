import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_exterior_fragments_screen.dart';

class BuildingInspectionTheSiteStepTwoFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheSiteStepTwoFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheSiteStepTwoFragments> createState() =>
      _BuildingInspectionTheSiteStepTwoFragmentsState();
}

class _BuildingInspectionTheSiteStepTwoFragmentsState
    extends State<BuildingInspectionTheSiteStepTwoFragments> {
  TextEditingController drivewaysController = TextEditingController();
  TextEditingController pathsController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController retainingWallsController = TextEditingController();

  TextEditingController surfaceWaterDrainageController =
      TextEditingController();

  TextEditingController carAccommodationController = TextEditingController();

  TextEditingController detachedBuildingsController = TextEditingController();

  TextEditingController gardenShedsFencesController = TextEditingController();

  TextEditingController otherIfApplicableController = TextEditingController();

  bool viewVisible = false;
  bool viewVisibleTwo = false;
  bool viewVisibleThree = false;

  bool viewgardenVisible = false;
  bool viewgardenVisibleTwo = false;
  bool viewgardenVisibleThree = false;

  bool viewotherVisible = false;
  bool viewotherVisibleTwo = false;
  bool viewotherVisibleThree = false;

  var imagePath = "NA";
  var imageName = "NA";
  var imageData = "NA";

  var safetyhazardsbuildingstwoimagePath = "NA";
  var safetyhazardsbuildingstwoimageName = "NA";
  var safetyhazardsbuildingstwoimageData = "NA";

  var safetyhazardsbuildingsthreeimagePath = "NA";
  var safetyhazardsbuildingsthreeimageName = "NA";
  var safetyhazardsbuildingsthreeimageData = "NA";

  var safetyhazardsbuildingsfourimagePath = "NA";
  var safetyhazardsbuildingsfourimageName = "NA";
  var safetyhazardsbuildingsfourimageData = "NA";

  var gardenimagePath = "NA";
  var gardenimageName = "NA";
  var gardenimageData = "NA";

  var safetyhazardsgardentwoimagePath = "NA";
  var safetyhazardsgardentwoimageName = "NA";
  var safetyhazardsgardentwoimageData = "NA";

  var safetyhazardsgardenthreeimagePath = "NA";
  var safetyhazardsgardenthreeimageName = "NA";
  var safetyhazardsgardenthreeimageData = "NA";

  var safetyhazardsgardenfourimagePath = "NA";
  var safetyhazardsgardenfourimageName = "NA";
  var safetyhazardsgardenfourimageData = "NA";

  var otherimagePath = "NA";
  var otherimageName = "NA";
  var otherimageData = "NA";

  var afetyhazardsothertwoimagePath = "NA";
  var afetyhazardsothertwoimageName = "NA";
  var afetyhazardsothertwoimageData = "NA";

  var afetyhazardsotherthreeimagePath = "NA";
  var afetyhazardsotherthreeimageName = "NA";
  var afetyhazardsotherthreeimageData = "NA";

  var afetyhazardsotherfourimagePath = "NA";
  var afetyhazardsotherfourimageName = "NA";
  var afetyhazardsotherfourimageData = "NA";

  /*File? imagePath;
  String? imageName;
  String? imageData;

  File? gardenimagePath;
  String? gardenimageName;
  String? gardenimageData;

  File? otherimagePath;
  String? otherimageName;
  String? otherimageData;*/

  var safetyhazardsbuildings = "NA";

  var safetyhazardsgarden = "NA";
  var safetyhazardsgardenvalue = "NA";

  var safetyhazardsother = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File imagePath = File(getimage.path);
        imageName = getimage.path.split('/').last;
        imageData = base64Encode(imagePath.readAsBytesSync());
        print(imagePath);
        print(imageName);
        print(imageData);
      }
    });
  }

  Future<void> captureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File imagePath = File(getimage.path);
        imageName = getimage.path.split('/').last;
        imageData = base64Encode(imagePath.readAsBytesSync());
        print(imagePath);
        print(imageName);
        print(imageData);
      }
    });
  }

  Future<void> safetyhazardsbuildingstwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsbuildingstwoimagePath = File(getimage.path);

        safetyhazardsbuildingstwoimageName = getimage.path.split('/').last;
        safetyhazardsbuildingstwoimageData =
            base64Encode(safetyhazardsbuildingstwoimagePath.readAsBytesSync());

        print(safetyhazardsbuildingstwoimagePath);
        print(safetyhazardsbuildingstwoimageName);
        print(safetyhazardsbuildingstwoimageData);
      }
    });
  }

  Future<void> safetyhazardsbuildingstwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsbuildingstwoimagePath = File(getimage.path);

        safetyhazardsbuildingstwoimageName = getimage.path.split('/').last;
        safetyhazardsbuildingstwoimageData =
            base64Encode(safetyhazardsbuildingstwoimagePath.readAsBytesSync());

        print(safetyhazardsbuildingstwoimagePath);
        print(safetyhazardsbuildingstwoimageName);
        print(safetyhazardsbuildingstwoimageData);
      }
    });
  }

  Future<void> safetyhazardsbuildingsthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsbuildingsthreeimagePath = File(getimage.path);

        safetyhazardsbuildingsthreeimageName = getimage.path.split('/').last;
        safetyhazardsbuildingsthreeimageData = base64Encode(
            safetyhazardsbuildingsthreeimagePath.readAsBytesSync());

        print(safetyhazardsbuildingsthreeimagePath);
        print(safetyhazardsbuildingsthreeimageName);
        print(safetyhazardsbuildingsthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsbuildingsthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsbuildingsthreeimagePath = File(getimage.path);

        safetyhazardsbuildingsthreeimageName = getimage.path.split('/').last;
        safetyhazardsbuildingsthreeimageData = base64Encode(
            safetyhazardsbuildingsthreeimagePath.readAsBytesSync());

        print(safetyhazardsbuildingsthreeimagePath);
        print(safetyhazardsbuildingsthreeimageName);
        print(safetyhazardsbuildingsthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsbuildingsfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsbuildingsfourimagePath = File(getimage.path);

        safetyhazardsbuildingsfourimageName = getimage.path.split('/').last;
        safetyhazardsbuildingsfourimageData =
            base64Encode(safetyhazardsbuildingsfourimagePath.readAsBytesSync());

        print(safetyhazardsbuildingsfourimagePath);
        print(safetyhazardsbuildingsfourimageName);
        print(safetyhazardsbuildingsfourimageData);
      }
    });
  }

  Future<void> safetyhazardsbuildingsfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsbuildingsfourimagePath = File(getimage.path);

        safetyhazardsbuildingsfourimageName = getimage.path.split('/').last;
        safetyhazardsbuildingsfourimageData =
            base64Encode(safetyhazardsbuildingsfourimagePath.readAsBytesSync());

        print(safetyhazardsbuildingsfourimagePath);
        print(safetyhazardsbuildingsfourimageName);
        print(safetyhazardsbuildingsfourimageData);
      }
    });
  }

  Future<void> gardengetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File gardenimagePath = File(getimage.path);
        gardenimageName = getimage.path.split('/').last;
        gardenimageData = base64Encode(gardenimagePath.readAsBytesSync());
        print(gardenimagePath);
        print(gardenimageName);
        print(gardenimageData);
      }
    });
  }

  Future<void> gardencaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File gardenimagePath = File(getimage.path);
        gardenimageName = getimage.path.split('/').last;
        gardenimageData = base64Encode(gardenimagePath.readAsBytesSync());
        print(gardenimagePath);
        print(gardenimageName);
        print(gardenimageData);
      }
    });
  }

  Future<void> safetyhazardsgardentwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsgardentwoimagePath = File(getimage.path);

        safetyhazardsgardentwoimageName = getimage.path.split('/').last;
        safetyhazardsgardentwoimageData =
            base64Encode(safetyhazardsgardentwoimagePath.readAsBytesSync());

        print(safetyhazardsgardentwoimagePath);
        print(safetyhazardsgardentwoimageName);
        print(safetyhazardsgardentwoimageData);
      }
    });
  }

  Future<void> safetyhazardsgardentwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsgardentwoimagePath = File(getimage.path);

        safetyhazardsgardentwoimageName = getimage.path.split('/').last;
        safetyhazardsgardentwoimageData =
            base64Encode(safetyhazardsgardentwoimagePath.readAsBytesSync());

        print(safetyhazardsgardentwoimagePath);
        print(safetyhazardsgardentwoimageName);
        print(safetyhazardsgardentwoimageData);
      }
    });
  }

  Future<void> safetyhazardsgardenthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsgardenthreeimagePath = File(getimage.path);

        safetyhazardsgardenthreeimageName = getimage.path.split('/').last;
        safetyhazardsgardenthreeimageData =
            base64Encode(safetyhazardsgardenthreeimagePath.readAsBytesSync());

        print(safetyhazardsgardenthreeimagePath);
        print(safetyhazardsgardenthreeimageName);
        print(safetyhazardsgardenthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsgardenthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsgardenthreeimagePath = File(getimage.path);

        safetyhazardsgardenthreeimageName = getimage.path.split('/').last;
        safetyhazardsgardenthreeimageData =
            base64Encode(safetyhazardsgardenthreeimagePath.readAsBytesSync());

        print(safetyhazardsgardenthreeimagePath);
        print(safetyhazardsgardenthreeimageName);
        print(safetyhazardsgardenthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsgardenfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsgardenfourimagePath = File(getimage.path);

        safetyhazardsgardenfourimageName = getimage.path.split('/').last;
        safetyhazardsgardenfourimageData =
            base64Encode(safetyhazardsgardenfourimagePath.readAsBytesSync());

        print(safetyhazardsgardenfourimagePath);
        print(safetyhazardsgardenfourimageName);
        print(safetyhazardsgardenfourimageData);
      }
    });
  }

  Future<void> safetyhazardsgardenfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsgardenfourimagePath = File(getimage.path);

        safetyhazardsgardenfourimageName = getimage.path.split('/').last;
        safetyhazardsgardenfourimageData =
            base64Encode(safetyhazardsgardenfourimagePath.readAsBytesSync());

        print(safetyhazardsgardenfourimagePath);
        print(safetyhazardsgardenfourimageName);
        print(safetyhazardsgardenfourimageData);
      }
    });
  }

  Future<void> othergetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File otherimagePath = File(getimage.path);
        otherimageName = getimage.path.split('/').last;
        otherimageData = base64Encode(otherimagePath.readAsBytesSync());
        print(otherimagePath);
        print(otherimageName);
        print(otherimageData);
      }
    });
  }

  Future<void> othercaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File otherimagePath = File(getimage.path);
        otherimageName = getimage.path.split('/').last;
        otherimageData = base64Encode(otherimagePath.readAsBytesSync());
        print(otherimagePath);
        print(otherimageName);
        print(otherimageData);
      }
    });
  }

  Future<void> afetyhazardsothertwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File afetyhazardsothertwoimagePath = File(getimage.path);

        afetyhazardsothertwoimageName = getimage.path.split('/').last;
        afetyhazardsothertwoimageData =
            base64Encode(afetyhazardsothertwoimagePath.readAsBytesSync());

        print(afetyhazardsothertwoimagePath);
        print(afetyhazardsothertwoimageName);
        print(afetyhazardsothertwoimageData);
      }
    });
  }

  Future<void> afetyhazardsothertwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File afetyhazardsothertwoimagePath = File(getimage.path);

        afetyhazardsothertwoimageName = getimage.path.split('/').last;
        afetyhazardsothertwoimageData =
            base64Encode(afetyhazardsothertwoimagePath.readAsBytesSync());

        print(afetyhazardsothertwoimagePath);
        print(afetyhazardsothertwoimageName);
        print(afetyhazardsothertwoimageData);
      }
    });
  }

  Future<void> afetyhazardsotherthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File afetyhazardsotherthreeimagePath = File(getimage.path);

        afetyhazardsotherthreeimageName = getimage.path.split('/').last;
        afetyhazardsotherthreeimageData =
            base64Encode(afetyhazardsotherthreeimagePath.readAsBytesSync());

        print(afetyhazardsotherthreeimagePath);
        print(afetyhazardsotherthreeimageName);
        print(afetyhazardsotherthreeimageData);
      }
    });
  }

  Future<void> afetyhazardsotherthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File afetyhazardsotherthreeimagePath = File(getimage.path);

        afetyhazardsotherthreeimageName = getimage.path.split('/').last;
        afetyhazardsotherthreeimageData =
            base64Encode(afetyhazardsotherthreeimagePath.readAsBytesSync());

        print(afetyhazardsotherthreeimagePath);
        print(afetyhazardsotherthreeimageName);
        print(afetyhazardsotherthreeimageData);
      }
    });
  }

  Future<void> afetyhazardsotherfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File afetyhazardsotherfourimagePath = File(getimage.path);

        afetyhazardsotherfourimageName = getimage.path.split('/').last;
        afetyhazardsotherfourimageData =
            base64Encode(afetyhazardsotherfourimagePath.readAsBytesSync());

        print(afetyhazardsotherfourimagePath);
        print(afetyhazardsotherfourimageName);
        print(afetyhazardsotherfourimageData);
      }
    });
  }

  Future<void> afetyhazardsotherfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File afetyhazardsotherfourimagePath = File(getimage.path);

        afetyhazardsotherfourimageName = getimage.path.split('/').last;
        afetyhazardsotherfourimageData =
            base64Encode(afetyhazardsotherfourimagePath.readAsBytesSync());

        print(afetyhazardsotherfourimagePath);
        print(afetyhazardsotherfourimageName);
        print(afetyhazardsotherfourimageData);
      }
    });
  }

  safetyhazardsgardenCheck() {
    if (safetyhazardsgarden == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: safetyhazardsgardenvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child:
                Text('Fence is in bad condition and\n needs to be replaced.\n'),
            value: "Fence is in bad condition and needs to be replaced.",
          ),
          DropdownMenuItem(
            child: Text(
                'Fence is leaning. It is recommended to\n contact a certified fencer to fix it.'),
            value:
                "Fence is leaning. It is recommended to contact a certified fencer to fix it.",
          ),
        ],
        onChanged: (safetyhazardsgardenvalue) {
          setState(() {
            this.safetyhazardsgardenvalue = safetyhazardsgardenvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  Future<void> updateTheSiteDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res = await http
          .post(Uri.parse(API.prepurchasethesitesteptwodetails), body: {
        "id": id,
        //"safetyhazardsbuildings": detachedBuildingsController.text.trim(),
        "safetyhazardsbuildings": safetyhazardsbuildings,
        //"safetyhazardsgarden": gardenShedsFencesController.text.trim(),
        "safetyhazardsgarden": safetyhazardsgarden,
        "safetyhazardsgardenvalue": safetyhazardsgardenvalue,
        //"safetyhazardsother": otherIfApplicableController.text.trim(),
        "safetyhazardsother": safetyhazardsother,
        "data": imageData,
        "name": imageName,
        "safetyhazardsbuildingstwoimagedata":
            safetyhazardsbuildingstwoimageData,
        "safetyhazardsbuildingstwoimagename":
            safetyhazardsbuildingstwoimageName,
        "safetyhazardsbuildingsthreeimagedata":
            safetyhazardsbuildingsthreeimageData,
        "safetyhazardsbuildingsthreeimagename":
            safetyhazardsbuildingsthreeimageName,
        "safetyhazardsbuildingsfourimagedata":
            safetyhazardsbuildingsfourimageData,
        "safetyhazardsbuildingsfourimagename":
            safetyhazardsbuildingsfourimageName,
        "gardendata": gardenimageData,
        "gardenname": gardenimageName,
        "safetyhazardsgardentwoimagedata": safetyhazardsgardentwoimageData,
        "safetyhazardsgardentwoimagename": safetyhazardsgardentwoimageName,
        "safetyhazardsgardenthreeimagedata": safetyhazardsgardenthreeimageData,
        "safetyhazardsgardenthreeimagename": safetyhazardsgardenthreeimageName,
        "safetyhazardsgardenfourimagedata": safetyhazardsgardenfourimageData,
        "safetyhazardsgardenfourimagename": safetyhazardsgardenfourimageName,
        "otherdata": otherimageData,
        "othername": otherimageName,
        "afetyhazardsothertwoimagedata": afetyhazardsothertwoimageData,
        "afetyhazardsothertwoimagename": afetyhazardsothertwoimageName,
        "afetyhazardsotherthreeimagedata": afetyhazardsotherthreeimageData,
        "afetyhazardsotherthreeimagename": afetyhazardsotherthreeimageName,
        "afetyhazardsotherfourimagedata": afetyhazardsotherfourimageData,
        "afetyhazardsotherfourimagename": afetyhazardsotherfourimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectorTheExteriorFragments(reportId: id)));
        /*drivewaysController.clear();
        pathsController.clear();
        stepsController.clear();
        retainingWallsController.clear();
        piersCommentsController.clear();
        flooringCommentsController.clear();*/
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

        safetyhazardsbuildingstwoimagePath = "NA";
        safetyhazardsbuildingstwoimageName = "NA";
        safetyhazardsbuildingstwoimageData = "NA";

        safetyhazardsbuildingsthreeimagePath = "NA";
        safetyhazardsbuildingsthreeimageName = "NA";
        safetyhazardsbuildingsthreeimageData = "NA";

        safetyhazardsbuildingsfourimagePath = "NA";
        safetyhazardsbuildingsfourimageName = "NA";
        safetyhazardsbuildingsfourimageData = "NA";
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

        safetyhazardsbuildingsthreeimagePath = "NA";
        safetyhazardsbuildingsthreeimageName = "NA";
        safetyhazardsbuildingsthreeimageData = "NA";

        safetyhazardsbuildingsfourimagePath = "NA";
        safetyhazardsbuildingsfourimageName = "NA";
        safetyhazardsbuildingsfourimageData = "NA";
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

        safetyhazardsbuildingsfourimagePath = "NA";
        safetyhazardsbuildingsfourimageName = "NA";
        safetyhazardsbuildingsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidegardenWidget() {
    if (viewgardenVisible == true) {
      setState(() {
        viewgardenVisible = false;
        viewgardenVisibleTwo = false;
        viewgardenVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        safetyhazardsgardentwoimagePath = "NA";
        safetyhazardsgardentwoimageName = "NA";
        safetyhazardsgardentwoimageData = "NA";

        safetyhazardsgardenthreeimagePath = "NA";
        safetyhazardsgardenthreeimageName = "NA";
        safetyhazardsgardenthreeimageData = "NA";

        safetyhazardsgardenfourimagePath = "NA";
        safetyhazardsgardenfourimageName = "NA";
        safetyhazardsgardenfourimageData = "NA";
      });
    } else {
      setState(() {
        viewgardenVisible = true;
        viewgardenVisibleTwo = false;
        viewgardenVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidegardentwoWidget() {
    if (viewgardenVisibleTwo == true) {
      setState(() {
        viewgardenVisibleTwo = false;
        viewgardenVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        safetyhazardsgardenthreeimagePath = "NA";
        safetyhazardsgardenthreeimageName = "NA";
        safetyhazardsgardenthreeimageData = "NA";

        safetyhazardsgardenfourimagePath = "NA";
        safetyhazardsgardenfourimageName = "NA";
        safetyhazardsgardenfourimageData = "NA";
      });
    } else {
      setState(() {
        viewgardenVisibleTwo = true;
        viewgardenVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidegardenthreeWidget() {
    if (viewgardenVisibleThree == true) {
      setState(() {
        viewgardenVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        safetyhazardsgardenfourimagePath = "NA";
        safetyhazardsgardenfourimageName = "NA";
        safetyhazardsgardenfourimageData = "NA";
      });
    } else {
      setState(() {
        viewgardenVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hideotherWidget() {
    if (viewotherVisible == true) {
      setState(() {
        viewotherVisible = false;
        viewotherVisibleTwo = false;
        viewotherVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        afetyhazardsothertwoimagePath = "NA";
        afetyhazardsothertwoimageName = "NA";
        afetyhazardsothertwoimageData = "NA";

        afetyhazardsotherthreeimagePath = "NA";
        afetyhazardsotherthreeimageName = "NA";
        afetyhazardsotherthreeimageData = "NA";

        afetyhazardsotherfourimagePath = "NA";
        afetyhazardsotherfourimageName = "NA";
        afetyhazardsotherfourimageData = "NA";
      });
    } else {
      setState(() {
        viewotherVisible = true;
        viewotherVisibleTwo = false;
        viewotherVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hideothertwoWidget() {
    if (viewotherVisibleTwo == true) {
      setState(() {
        viewotherVisibleTwo = false;
        viewotherVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        afetyhazardsotherthreeimagePath = "NA";
        afetyhazardsotherthreeimageName = "NA";
        afetyhazardsotherthreeimageData = "NA";

        afetyhazardsotherfourimagePath = "NA";
        afetyhazardsotherfourimageName = "NA";
        afetyhazardsotherfourimageData = "NA";
      });
    } else {
      setState(() {
        viewotherVisibleTwo = true;
        viewotherVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hideotherthreeWidget() {
    if (viewotherVisibleThree == true) {
      setState(() {
        viewotherVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        afetyhazardsotherfourimagePath = "NA";
        afetyhazardsotherfourimageName = "NA";
        afetyhazardsotherfourimageData = "NA";
      });
    } else {
      setState(() {
        viewotherVisibleThree = true;
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
                'THE SITE (STEP 2)',
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
            //Detached Buildings

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Detached Buildings'),
                ),
                value: safetyhazardsbuildings,
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
                onChanged: (safetyhazardsbuildings) {
                  setState(() {
                    this.safetyhazardsbuildings = safetyhazardsbuildings!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: imagePath != "NA"
                  ? Image.memory(base64Decode(imagePath))
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
                          captureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          getImage();
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
                        child: safetyhazardsbuildingstwoimageData != "NA"
                            ? Image.memory(base64Decode(
                                safetyhazardsbuildingstwoimageData))
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
                                    safetyhazardsbuildingstwocaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    safetyhazardsbuildingstwogetImage();
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
                )),

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
                      child: safetyhazardsbuildingsthreeimageData != "NA"
                          ? Image.memory(base64Decode(
                              safetyhazardsbuildingsthreeimageData))
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
                                  safetyhazardsbuildingsthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsbuildingsthreegetImage();
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
                      child: safetyhazardsbuildingsfourimageData != "NA"
                          ? Image.memory(
                              base64Decode(safetyhazardsbuildingsfourimageData))
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
                                  safetyhazardsbuildingsfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsbuildingsfourgetImage();
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

            //Garden Sheds and Fences

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Garden Sheds and Fences'),
                ),
                value: safetyhazardsgarden,
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
                onChanged: (safetyhazardsgarden) {
                  setState(() {
                    this.safetyhazardsgarden = safetyhazardsgarden!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsgardenCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: gardenimagePath != "NA"
                  ? Image.memory(base64Decode(gardenimagePath))
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
                          gardencaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          gardengetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st garden Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hidegardenWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st garden Add More Image
            Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: viewgardenVisible,
                replacement: const SizedBox.shrink(),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: safetyhazardsgardentwoimageData != "NA"
                            ? Image.memory(
                                base64Decode(safetyhazardsgardentwoimageData))
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
                                    safetyhazardsgardentwocaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    safetyhazardsgardentwogetImage();
                                  },
                                  child: Text('Choose Image')),
                            ),
                          ],
                        ),
                      ),

                      //2nd garden Add More Button
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidegardentwoWidget();
                            },
                            child: Text('Add or Delete More Image')),
                      ),
                    ],
                  ),
                )),

            //2nd garden Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewgardenVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardsgardenthreeimageData != "NA"
                          ? Image.memory(
                              base64Decode(safetyhazardsgardenthreeimageData))
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
                                  safetyhazardsgardenthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsgardenthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd garden Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidegardenthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd garden Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewgardenVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardsgardenfourimageData != "NA"
                          ? Image.memory(
                              base64Decode(safetyhazardsgardenfourimageData))
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
                                  safetyhazardsgardenfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsgardenfourgetImage();
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

            //Other if Applicable

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other if Applicable'),
                ),
                value: safetyhazardsother,
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
                onChanged: (safetyhazardsother) {
                  setState(() {
                    this.safetyhazardsother = safetyhazardsother!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: otherimagePath != "NA"
                  ? Image.memory(base64Decode(otherimagePath))
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
                          othercaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          othergetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st other Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hideotherWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st other Add More Image
            Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: viewotherVisible,
                replacement: const SizedBox.shrink(),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: afetyhazardsothertwoimageData != "NA"
                            ? Image.memory(
                                base64Decode(afetyhazardsothertwoimageData))
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
                                    afetyhazardsothertwocaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    afetyhazardsothertwogetImage();
                                  },
                                  child: Text('Choose Image')),
                            ),
                          ],
                        ),
                      ),

                      //2nd other Add More Button
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hideothertwoWidget();
                            },
                            child: Text('Add or Delete More Image')),
                      ),
                    ],
                  ),
                )),

            //2nd other Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewotherVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: afetyhazardsotherthreeimageData != "NA"
                          ? Image.memory(
                              base64Decode(afetyhazardsotherthreeimageData))
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
                                  afetyhazardsotherthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  afetyhazardsotherthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd other Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hideotherthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd other Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewotherVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: afetyhazardsotherfourimageData != "NA"
                          ? Image.memory(
                              base64Decode(afetyhazardsotherfourimageData))
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
                                  afetyhazardsotherfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  afetyhazardsotherfourgetImage();
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
                          updateTheSiteDetails(widget.reportId);
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
