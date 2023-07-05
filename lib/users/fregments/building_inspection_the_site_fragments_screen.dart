import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

//import 'building_inspection_the_exterior_fragments_screen.dart';
import 'building_inspection_the_site_step_two_fragments_screen.dart';

class BuildingInspectionTheSiteFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheSiteFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheSiteFragments> createState() =>
      _BuildingInspectionTheSiteFragmentsState();
}

class _BuildingInspectionTheSiteFragmentsState
    extends State<BuildingInspectionTheSiteFragments> {
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

  bool viewpathsVisible = false;
  bool viewpathsVisibleTwo = false;
  bool viewpathsVisibleThree = false;

  bool viewstepsVisible = false;
  bool viewstepsVisibleTwo = false;
  bool viewstepsVisibleThree = false;

  bool viewretainingwallsVisible = false;
  bool viewretainingwallsVisibleTwo = false;
  bool viewretainingwallsVisibleThree = false;

  bool viewcaraccommodationVisible = false;
  bool viewcaraccommodationVisibleTwo = false;
  bool viewcaraccommodationVisibleThree = false;

  var safetyhazardsdrivewaysimagepath = "NA";
  var safetyhazardsdrivewaysimagename = "NA";
  var safetyhazardsdrivewaysimagedata = "NA";

  var safetyhazardsdrivewaystwoimagePath = "NA";
  var safetyhazardsdrivewaystwoimageName = "NA";
  var safetyhazardsdrivewaystwoimageData = "NA";

  var safetyhazardsdrivewaysthreeimagePath = "NA";
  var safetyhazardsdrivewaysthreeimageName = "NA";
  var safetyhazardsdrivewaysthreeimageData = "NA";

  var safetyhazardsdrivewaysfourimagePath = "NA";
  var safetyhazardsdrivewaysfourimageName = "NA";
  var safetyhazardsdrivewaysfourimageData = "NA";

  /*File? safetyhazardsdrivewaysimagepath;
  String? safetyhazardsdrivewaysimagename;
  String? safetyhazardsdrivewaysimagedata;*/

  var safetyhazardspathsimagepath = "NA";
  var safetyhazardspathsimagename = "NA";
  var safetyhazardspathsimagedata = "NA";

  var safetyhazardspathstwoimagePath = "NA";
  var safetyhazardspathstwoimageName = "NA";
  var safetyhazardspathstwoimageData = "NA";

  var safetyhazardspathsthreeimagePath = "NA";
  var safetyhazardspathsthreeimageName = "NA";
  var safetyhazardspathsthreeimageData = "NA";

  var safetyhazardspathsfourimagePath = "NA";
  var safetyhazardspathsfourimageName = "NA";
  var safetyhazardspathsfourimageData = "NA";

  var safetyhazardsstepsimagepath = "NA";
  var safetyhazardsstepsimagename = "NA";
  var safetyhazardsstepsimagedata = "NA";

  var safetyhazardsstepstwoimagePath = "NA";
  var safetyhazardsstepstwoimageName = "NA";
  var safetyhazardsstepstwoimageData = "NA";

  var safetyhazardsstepsthreeimagePath = "NA";
  var safetyhazardsstepsthreeimageName = "NA";
  var safetyhazardsstepsthreeimageData = "NA";

  var safetyhazardsstepsfourimagePath = "NA";
  var safetyhazardsstepsfourimageName = "NA";
  var safetyhazardsstepsfourimageData = "NA";

  var safetyhazardsretainingwallsimagepath = "NA";
  var safetyhazardsretainingwallsimagename = "NA";
  var safetyhazardsretainingwallsimagedata = "NA";

  var safetyhazardsretainingwallstwoimagePath = "NA";
  var safetyhazardsretainingwallstwoimageName = "NA";
  var safetyhazardsretainingwallstwoimageData = "NA";

  var safetyhazardsretainingwallsthreeimagePath = "NA";
  var safetyhazardsretainingwallsthreeimageName = "NA";
  var safetyhazardsretainingwallsthreeimageData = "NA";

  var safetyhazardsretainingwallsfourimagePath = "NA";
  var safetyhazardsretainingwallsfourimageName = "NA";
  var safetyhazardsretainingwallsfourimageData = "NA";

  var safetyhazardscaraccommodationimagepath = "NA";
  var safetyhazardscaraccommodationimagename = "NA";
  var safetyhazardscaraccommodationimagedata = "NA";

  var safetyhazardscaraccommodationtwoimagePath = "NA";
  var safetyhazardscaraccommodationtwoimageName = "NA";
  var safetyhazardscaraccommodationtwoimageData = "NA";

  var safetyhazardscaraccommodationthreeimagePath = "NA";
  var safetyhazardscaraccommodationthreeimageName = "NA";
  var safetyhazardscaraccommodationthreeimageData = "NA";

  var safetyhazardscaraccommodationfourimagePath = "NA";
  var safetyhazardscaraccommodationfourimageName = "NA";
  var safetyhazardscaraccommodationfourimageData = "NA";

  /*var safetyhazardsdetachedbuildingsimagepath = "NA";
  var safetyhazardsdetachedbuildingsimagename = "NA";
  var safetyhazardsdetachedbuildingsimagedata = "NA";*/

  /*File? safetyhazardspathsimagepath;
  String? safetyhazardspathsimagename;
  String? safetyhazardspathsimagedata;

  File? safetyhazardsstepsimagepath;
  String? safetyhazardsstepsimagename;
  String? safetyhazardsstepsimagedata;

  File? safetyhazardsretainingwallsimagepath;
  String? safetyhazardsretainingwallsimagename;
  String? safetyhazardsretainingwallsimagedata;

  File? safetyhazardscaraccommodationimagepath;
  String? safetyhazardscaraccommodationimagename;
  String? safetyhazardscaraccommodationimagedata;

  File? safetyhazardsdetachedbuildingsimagepath;
  String? safetyhazardsdetachedbuildingsimagename;
  String? safetyhazardsdetachedbuildingsimagedata;*/

  var safetyhazardsdriveways = "NA";
  var safetyhazardsdrivewaysvalue = "NA";

  var safetyhazardspaths = "NA";
  var safetyhazardspathsvalue = "NA";

  var safetyhazardssteps = "NA";
  var safetyhazardsstepsvalue = "NA";

  var safetyhazardswalls = "NA";
  var safetyhazardswallsvalue = "NA";

  var safetyhazardswaterdrainage = "NA";
  var safetyhazardswaterdrainagevalue = "NA";

  var safetyhazardscar = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsdrivewaysimagepath = File(getimage.path);
        safetyhazardsdrivewaysimagename = getimage.path.split('/').last;
        safetyhazardsdrivewaysimagedata =
            base64Encode(safetyhazardsdrivewaysimagepath.readAsBytesSync());
        print(safetyhazardsdrivewaysimagepath);
        print(safetyhazardsdrivewaysimagename);
        print(safetyhazardsdrivewaysimagedata);
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
        File safetyhazardsdrivewaysimagepath = File(getimage.path);
        safetyhazardsdrivewaysimagename = getimage.path.split('/').last;
        safetyhazardsdrivewaysimagedata =
            base64Encode(safetyhazardsdrivewaysimagepath.readAsBytesSync());
        print(safetyhazardsdrivewaysimagepath);
        print(safetyhazardsdrivewaysimagename);
        print(safetyhazardsdrivewaysimagedata);
      }
    });
  }

  Future<void> safetyhazardsdrivewaystwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsdrivewaystwoimagePath = File(getimage.path);

        safetyhazardsdrivewaystwoimageName = getimage.path.split('/').last;
        safetyhazardsdrivewaystwoimageData =
            base64Encode(safetyhazardsdrivewaystwoimagePath.readAsBytesSync());

        print(safetyhazardsdrivewaystwoimagePath);
        print(safetyhazardsdrivewaystwoimageName);
        print(safetyhazardsdrivewaystwoimageData);
      }
    });
  }

  Future<void> safetyhazardsdrivewaystwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsdrivewaystwoimagePath = File(getimage.path);

        safetyhazardsdrivewaystwoimageName = getimage.path.split('/').last;
        safetyhazardsdrivewaystwoimageData =
            base64Encode(safetyhazardsdrivewaystwoimagePath.readAsBytesSync());

        print(safetyhazardsdrivewaystwoimagePath);
        print(safetyhazardsdrivewaystwoimageName);
        print(safetyhazardsdrivewaystwoimageData);
      }
    });
  }

  Future<void> safetyhazardsdrivewaysthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsdrivewaysthreeimagePath = File(getimage.path);

        safetyhazardsdrivewaysthreeimageName = getimage.path.split('/').last;
        safetyhazardsdrivewaysthreeimageData = base64Encode(
            safetyhazardsdrivewaysthreeimagePath.readAsBytesSync());

        print(safetyhazardsdrivewaysthreeimagePath);
        print(safetyhazardsdrivewaysthreeimageName);
        print(safetyhazardsdrivewaysthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsdrivewaysthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsdrivewaysthreeimagePath = File(getimage.path);

        safetyhazardsdrivewaysthreeimageName = getimage.path.split('/').last;
        safetyhazardsdrivewaysthreeimageData = base64Encode(
            safetyhazardsdrivewaysthreeimagePath.readAsBytesSync());

        print(safetyhazardsdrivewaysthreeimagePath);
        print(safetyhazardsdrivewaysthreeimageName);
        print(safetyhazardsdrivewaysthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsdrivewaysfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsdrivewaysfourimagePath = File(getimage.path);

        safetyhazardsdrivewaysfourimageName = getimage.path.split('/').last;
        safetyhazardsdrivewaysfourimageData =
            base64Encode(safetyhazardsdrivewaysfourimagePath.readAsBytesSync());

        print(safetyhazardsdrivewaysfourimagePath);
        print(safetyhazardsdrivewaysfourimageName);
        print(safetyhazardsdrivewaysfourimageData);
      }
    });
  }

  Future<void> safetyhazardsdrivewaysfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsdrivewaysfourimagePath = File(getimage.path);

        safetyhazardsdrivewaysfourimageName = getimage.path.split('/').last;
        safetyhazardsdrivewaysfourimageData =
            base64Encode(safetyhazardsdrivewaysfourimagePath.readAsBytesSync());

        print(safetyhazardsdrivewaysfourimagePath);
        print(safetyhazardsdrivewaysfourimageName);
        print(safetyhazardsdrivewaysfourimageData);
      }
    });
  }

  Future<void> safetyhazardsPathsGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardspathsimagepath = File(getimage.path);
        safetyhazardspathsimagename = getimage.path.split('/').last;
        safetyhazardspathsimagedata =
            base64Encode(safetyhazardspathsimagepath.readAsBytesSync());
        print(safetyhazardspathsimagepath);
        print(safetyhazardspathsimagename);
        print(safetyhazardspathsimagedata);
      }
    });
  }

  Future<void> safetyhazardsPathsCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardspathsimagepath = File(getimage.path);
        safetyhazardspathsimagename = getimage.path.split('/').last;
        safetyhazardspathsimagedata =
            base64Encode(safetyhazardspathsimagepath.readAsBytesSync());
        print(safetyhazardspathsimagepath);
        print(safetyhazardspathsimagename);
        print(safetyhazardspathsimagedata);
      }
    });
  }

  Future<void> safetyhazardspathstwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardspathstwoimagePath = File(getimage.path);

        safetyhazardspathstwoimageName = getimage.path.split('/').last;
        safetyhazardspathstwoimageData =
            base64Encode(safetyhazardspathstwoimagePath.readAsBytesSync());

        print(safetyhazardspathstwoimagePath);
        print(safetyhazardspathstwoimageName);
        print(safetyhazardspathstwoimageData);
      }
    });
  }

  Future<void> safetyhazardspathstwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardspathstwoimagePath = File(getimage.path);

        safetyhazardspathstwoimageName = getimage.path.split('/').last;
        safetyhazardspathstwoimageData =
            base64Encode(safetyhazardspathstwoimagePath.readAsBytesSync());

        print(safetyhazardspathstwoimagePath);
        print(safetyhazardspathstwoimageName);
        print(safetyhazardspathstwoimageData);
      }
    });
  }

  Future<void> safetyhazardspathsthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardspathsthreeimagePath = File(getimage.path);

        safetyhazardspathsthreeimageName = getimage.path.split('/').last;
        safetyhazardspathsthreeimageData =
            base64Encode(safetyhazardspathsthreeimagePath.readAsBytesSync());

        print(safetyhazardspathsthreeimagePath);
        print(safetyhazardspathsthreeimageName);
        print(safetyhazardspathsthreeimageData);
      }
    });
  }

  Future<void> safetyhazardspathsthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardspathsthreeimagePath = File(getimage.path);

        safetyhazardspathsthreeimageName = getimage.path.split('/').last;
        safetyhazardspathsthreeimageData =
            base64Encode(safetyhazardspathsthreeimagePath.readAsBytesSync());

        print(safetyhazardspathsthreeimagePath);
        print(safetyhazardspathsthreeimageName);
        print(safetyhazardspathsthreeimageData);
      }
    });
  }

  Future<void> safetyhazardspathsfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardspathsfourimagePath = File(getimage.path);

        safetyhazardspathsfourimageName = getimage.path.split('/').last;
        safetyhazardspathsfourimageData =
            base64Encode(safetyhazardspathsfourimagePath.readAsBytesSync());

        print(safetyhazardspathsfourimagePath);
        print(safetyhazardspathsfourimageName);
        print(safetyhazardspathsfourimageData);
      }
    });
  }

  Future<void> safetyhazardspathsfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardspathsfourimagePath = File(getimage.path);

        safetyhazardspathsfourimageName = getimage.path.split('/').last;
        safetyhazardspathsfourimageData =
            base64Encode(safetyhazardspathsfourimagePath.readAsBytesSync());

        print(safetyhazardspathsfourimagePath);
        print(safetyhazardspathsfourimageName);
        print(safetyhazardspathsfourimageData);
      }
    });
  }

  Future<void> safetyhazardsStepsGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsstepsimagepath = File(getimage.path);
        safetyhazardsstepsimagename = getimage.path.split('/').last;
        safetyhazardsstepsimagedata =
            base64Encode(safetyhazardsstepsimagepath.readAsBytesSync());
        print(safetyhazardsstepsimagepath);
        print(safetyhazardsstepsimagename);
        print(safetyhazardsstepsimagedata);
      }
    });
  }

  Future<void> safetyhazardsStepsCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsstepsimagepath = File(getimage.path);
        safetyhazardsstepsimagename = getimage.path.split('/').last;
        safetyhazardsstepsimagedata =
            base64Encode(safetyhazardsstepsimagepath.readAsBytesSync());
        print(safetyhazardsstepsimagepath);
        print(safetyhazardsstepsimagename);
        print(safetyhazardsstepsimagedata);
      }
    });
  }

  Future<void> safetyhazardsstepstwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsstepstwoimagePath = File(getimage.path);

        safetyhazardsstepstwoimageName = getimage.path.split('/').last;
        safetyhazardsstepstwoimageData =
            base64Encode(safetyhazardsstepstwoimagePath.readAsBytesSync());

        print(safetyhazardsstepstwoimagePath);
        print(safetyhazardsstepstwoimageName);
        print(safetyhazardsstepstwoimageData);
      }
    });
  }

  Future<void> safetyhazardsstepstwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsstepstwoimagePath = File(getimage.path);

        safetyhazardsstepstwoimageName = getimage.path.split('/').last;
        safetyhazardsstepstwoimageData =
            base64Encode(safetyhazardsstepstwoimagePath.readAsBytesSync());

        print(safetyhazardsstepstwoimagePath);
        print(safetyhazardsstepstwoimageName);
        print(safetyhazardsstepstwoimageData);
      }
    });
  }

  Future<void> safetyhazardsstepsthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsstepsthreeimagePath = File(getimage.path);

        safetyhazardsstepsthreeimageName = getimage.path.split('/').last;
        safetyhazardsstepsthreeimageData =
            base64Encode(safetyhazardsstepsthreeimagePath.readAsBytesSync());

        print(safetyhazardsstepsthreeimagePath);
        print(safetyhazardsstepsthreeimageName);
        print(safetyhazardsstepsthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsstepsthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsstepsthreeimagePath = File(getimage.path);

        safetyhazardsstepsthreeimageName = getimage.path.split('/').last;
        safetyhazardsstepsthreeimageData =
            base64Encode(safetyhazardsstepsthreeimagePath.readAsBytesSync());

        print(safetyhazardsstepsthreeimagePath);
        print(safetyhazardsstepsthreeimageName);
        print(safetyhazardsstepsthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsstepsfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsstepsfourimagePath = File(getimage.path);

        safetyhazardsstepsfourimageName = getimage.path.split('/').last;
        safetyhazardsstepsfourimageData =
            base64Encode(safetyhazardsstepsfourimagePath.readAsBytesSync());

        print(safetyhazardsstepsfourimagePath);
        print(safetyhazardsstepsfourimageName);
        print(safetyhazardsstepsfourimageData);
      }
    });
  }

  Future<void> safetyhazardsstepsfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsstepsfourimagePath = File(getimage.path);

        safetyhazardsstepsfourimageName = getimage.path.split('/').last;
        safetyhazardsstepsfourimageData =
            base64Encode(safetyhazardsstepsfourimagePath.readAsBytesSync());

        print(safetyhazardsstepsfourimagePath);
        print(safetyhazardsstepsfourimageName);
        print(safetyhazardsstepsfourimageData);
      }
    });
  }

  Future<void> safetyhazardsretainingWallsGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsretainingwallsimagepath = File(getimage.path);
        safetyhazardsretainingwallsimagename = getimage.path.split('/').last;
        safetyhazardsretainingwallsimagedata = base64Encode(
            safetyhazardsretainingwallsimagepath.readAsBytesSync());
        print(safetyhazardsretainingwallsimagepath);
        print(safetyhazardsretainingwallsimagename);
        print(safetyhazardsretainingwallsimagedata);
      }
    });
  }

  Future<void> safetyhazardsretainingWallsCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsretainingwallsimagepath = File(getimage.path);
        safetyhazardsretainingwallsimagename = getimage.path.split('/').last;
        safetyhazardsretainingwallsimagedata = base64Encode(
            safetyhazardsretainingwallsimagepath.readAsBytesSync());
        print(safetyhazardsretainingwallsimagepath);
        print(safetyhazardsretainingwallsimagename);
        print(safetyhazardsretainingwallsimagedata);
      }
    });
  }

  Future<void> safetyhazardsretainingwallstwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsretainingwallstwoimagePath = File(getimage.path);

        safetyhazardsretainingwallstwoimageName = getimage.path.split('/').last;
        safetyhazardsretainingwallstwoimageData = base64Encode(
            safetyhazardsretainingwallstwoimagePath.readAsBytesSync());

        print(safetyhazardsretainingwallstwoimagePath);
        print(safetyhazardsretainingwallstwoimageName);
        print(safetyhazardsretainingwallstwoimageData);
      }
    });
  }

  Future<void> safetyhazardsretainingwallstwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsretainingwallstwoimagePath = File(getimage.path);

        safetyhazardsretainingwallstwoimageName = getimage.path.split('/').last;
        safetyhazardsretainingwallstwoimageData = base64Encode(
            safetyhazardsretainingwallstwoimagePath.readAsBytesSync());

        print(safetyhazardsretainingwallstwoimagePath);
        print(safetyhazardsretainingwallstwoimageName);
        print(safetyhazardsretainingwallstwoimageData);
      }
    });
  }

  Future<void> safetyhazardsretainingwallsthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsretainingwallsthreeimagePath = File(getimage.path);

        safetyhazardsretainingwallsthreeimageName =
            getimage.path.split('/').last;
        safetyhazardsretainingwallsthreeimageData = base64Encode(
            safetyhazardsretainingwallsthreeimagePath.readAsBytesSync());

        print(safetyhazardsretainingwallsthreeimagePath);
        print(safetyhazardsretainingwallsthreeimageName);
        print(safetyhazardsretainingwallsthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsretainingwallsthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsretainingwallsthreeimagePath = File(getimage.path);

        safetyhazardsretainingwallsthreeimageName =
            getimage.path.split('/').last;
        safetyhazardsretainingwallsthreeimageData = base64Encode(
            safetyhazardsretainingwallsthreeimagePath.readAsBytesSync());

        print(safetyhazardsretainingwallsthreeimagePath);
        print(safetyhazardsretainingwallsthreeimageName);
        print(safetyhazardsretainingwallsthreeimageData);
      }
    });
  }

  Future<void> safetyhazardsretainingwallsfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsretainingwallsfourimagePath = File(getimage.path);

        safetyhazardsretainingwallsfourimageName =
            getimage.path.split('/').last;
        safetyhazardsretainingwallsfourimageData = base64Encode(
            safetyhazardsretainingwallsfourimagePath.readAsBytesSync());

        print(safetyhazardsretainingwallsfourimagePath);
        print(safetyhazardsretainingwallsfourimageName);
        print(safetyhazardsretainingwallsfourimageData);
      }
    });
  }

  Future<void> safetyhazardsretainingwallsfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsretainingwallsfourimagePath = File(getimage.path);

        safetyhazardsretainingwallsfourimageName =
            getimage.path.split('/').last;
        safetyhazardsretainingwallsfourimageData = base64Encode(
            safetyhazardsretainingwallsfourimagePath.readAsBytesSync());

        print(safetyhazardsretainingwallsfourimagePath);
        print(safetyhazardsretainingwallsfourimageName);
        print(safetyhazardsretainingwallsfourimageData);
      }
    });
  }

  Future<void> safetyhazardscarAccommodationGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardscaraccommodationimagepath = File(getimage.path);
        safetyhazardscaraccommodationimagename = getimage.path.split('/').last;
        safetyhazardscaraccommodationimagedata = base64Encode(
            safetyhazardscaraccommodationimagepath.readAsBytesSync());
        print(safetyhazardscaraccommodationimagepath);
        print(safetyhazardscaraccommodationimagename);
        print(safetyhazardscaraccommodationimagedata);
      }
    });
  }

  Future<void> safetyhazardscarAccommodationCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardscaraccommodationimagepath = File(getimage.path);
        safetyhazardscaraccommodationimagename = getimage.path.split('/').last;
        safetyhazardscaraccommodationimagedata = base64Encode(
            safetyhazardscaraccommodationimagepath.readAsBytesSync());
        print(safetyhazardscaraccommodationimagepath);
        print(safetyhazardscaraccommodationimagename);
        print(safetyhazardscaraccommodationimagedata);
      }
    });
  }

  Future<void> safetyhazardscaraccommodationtwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardscaraccommodationtwoimagePath = File(getimage.path);

        safetyhazardscaraccommodationtwoimageName =
            getimage.path.split('/').last;
        safetyhazardscaraccommodationtwoimageData = base64Encode(
            safetyhazardscaraccommodationtwoimagePath.readAsBytesSync());

        print(safetyhazardscaraccommodationtwoimagePath);
        print(safetyhazardscaraccommodationtwoimageName);
        print(safetyhazardscaraccommodationtwoimageData);
      }
    });
  }

  Future<void> safetyhazardscaraccommodationtwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardscaraccommodationtwoimagePath = File(getimage.path);

        safetyhazardscaraccommodationtwoimageName =
            getimage.path.split('/').last;
        safetyhazardscaraccommodationtwoimageData = base64Encode(
            safetyhazardscaraccommodationtwoimagePath.readAsBytesSync());

        print(safetyhazardscaraccommodationtwoimagePath);
        print(safetyhazardscaraccommodationtwoimageName);
        print(safetyhazardscaraccommodationtwoimageData);
      }
    });
  }

  Future<void> safetyhazardscaraccommodationthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardscaraccommodationthreeimagePath = File(getimage.path);

        safetyhazardscaraccommodationthreeimageName =
            getimage.path.split('/').last;
        safetyhazardscaraccommodationthreeimageData = base64Encode(
            safetyhazardscaraccommodationthreeimagePath.readAsBytesSync());

        print(safetyhazardscaraccommodationthreeimagePath);
        print(safetyhazardscaraccommodationthreeimageName);
        print(safetyhazardscaraccommodationthreeimageData);
      }
    });
  }

  Future<void> safetyhazardscaraccommodationthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardscaraccommodationthreeimagePath = File(getimage.path);

        safetyhazardscaraccommodationthreeimageName =
            getimage.path.split('/').last;
        safetyhazardscaraccommodationthreeimageData = base64Encode(
            safetyhazardscaraccommodationthreeimagePath.readAsBytesSync());

        print(safetyhazardscaraccommodationthreeimagePath);
        print(safetyhazardscaraccommodationthreeimageName);
        print(safetyhazardscaraccommodationthreeimageData);
      }
    });
  }

  Future<void> safetyhazardscaraccommodationfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardscaraccommodationfourimagePath = File(getimage.path);

        safetyhazardscaraccommodationfourimageName =
            getimage.path.split('/').last;
        safetyhazardscaraccommodationfourimageData = base64Encode(
            safetyhazardscaraccommodationfourimagePath.readAsBytesSync());

        print(safetyhazardscaraccommodationfourimagePath);
        print(safetyhazardscaraccommodationfourimageName);
        print(safetyhazardscaraccommodationfourimageData);
      }
    });
  }

  Future<void> safetyhazardscaraccommodationfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardscaraccommodationfourimagePath = File(getimage.path);

        safetyhazardscaraccommodationfourimageName =
            getimage.path.split('/').last;
        safetyhazardscaraccommodationfourimageData = base64Encode(
            safetyhazardscaraccommodationfourimagePath.readAsBytesSync());

        print(safetyhazardscaraccommodationfourimagePath);
        print(safetyhazardscaraccommodationfourimageName);
        print(safetyhazardscaraccommodationfourimageData);
      }
    });
  }

  safetyhazardsdrivewaysCheck() {
    if (safetyhazardsdriveways == "Defects/Safety Hazards found were") {
      setState(() {
        safetyhazardsdrivewaysvalue =
            "Movement Cracking to driveway was observed. This does not have any impact on the building.";
      });

      return Text(
          'Movement Cracking to driveway was observed. This does not have any impact on the building.');
    } else {
      setState(() {
        safetyhazardsdrivewaysvalue = " ";
      });
    }
  }

  safetyhazardspathsCheck() {
    if (safetyhazardspaths == "Defects/Safety Hazards found were") {
      setState(() {
        safetyhazardspathsvalue =
            "Gaps were found between brickwork and concreting due to lose soil under the concrete. It is recommended to contact a certified concreter for further advise.";
      });

      return Text(
          'Gaps were found between brickwork and concreting due to lose soil under the concrete. It is recommended to contact a certified concreter for further advise.');
    } else {
      setState(() {
        safetyhazardspathsvalue = " ";
      });
    }
  }

  safetyhazardsstepsCheck() {
    if (safetyhazardssteps == "Defects/Safety Hazards found were") {
      setState(() {
        safetyhazardsstepsvalue =
            "Cracking to steps found due to General movement.";
      });

      return Text('Cracking to steps found due to General movement.');
    } else {
      setState(() {
        safetyhazardsstepsvalue = " ";
      });
    }
  }

  safetyhazardswallsCheck() {
    if (safetyhazardswalls == "Defects/Safety Hazards found were") {
      setState(() {
        safetyhazardswallsvalue =
            "Retaining wall was weathered. It is recommended to contact a certified carpenter for further advise.";
      });

      return Text(
          'Retaining wall was weathered. It is recommended to contact a certified carpenter for further advise.');
    } else {
      setState(() {
        safetyhazardswallsvalue = " ";
      });
    }
  }

  safetyhazardswaterdrainageCheck() {
    if (safetyhazardswaterdrainage == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: safetyhazardswaterdrainagevalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text(
                'Natural slope of the ground is towards \nthe dwelling. It is recommended to contact\n a licensed plumber to install adequate\n drainage.\n'),
            value:
                "Natural slope of the ground is towards the dwelling. It is recommended to contact a licensed plumber to install adequate drainage.",
          ),
          DropdownMenuItem(
            child: Text(
                'Natural slope of the ground is towards \nthe dwelling. It is recommended to make\n sure that slope must be going away \nfrom the dwelling.'),
            value:
                "Natural slope of the ground is towards the dwelling. It is recommended to make sure that slope must be going away from the dwelling.",
          ),
        ],
        onChanged: (safetyhazardswaterdrainagevalue) {
          setState(() {
            this.safetyhazardswaterdrainagevalue =
                safetyhazardswaterdrainagevalue!;
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
      var res =
          await http.post(Uri.parse(API.prepurchasethesitedetails), body: {
        "id": id,
        //"safetyhazardsdriveways": drivewaysController.text.trim(),
        "safetyhazardsdriveways": safetyhazardsdriveways,
        "safetyhazardsdrivewaysvalue": safetyhazardsdrivewaysvalue,
        //"safetyhazardspaths": pathsController.text.trim(),
        "safetyhazardspaths": safetyhazardspaths,
        "safetyhazardspathsvalue": safetyhazardspathsvalue,
        //"safetyhazardssteps": stepsController.text.trim(),
        "safetyhazardssteps": safetyhazardssteps,
        "safetyhazardsstepsvalue": safetyhazardsstepsvalue,
        //"safetyhazardswalls": retainingWallsController.text.trim(),
        "safetyhazardswalls": safetyhazardswalls,
        "safetyhazardswallsvalue": safetyhazardswallsvalue,
        /*"safetyhazardswaterdrainage":
            surfaceWaterDrainageController.text.trim(),*/
        "safetyhazardswaterdrainage": safetyhazardswaterdrainage,
        "safetyhazardswaterdrainagevalue": safetyhazardswaterdrainagevalue,
        //"safetyhazardscar": carAccommodationController.text.trim(),
        "safetyhazardscar": safetyhazardscar,
        "safetyhazardsdrivewaysimagedata": safetyhazardsdrivewaysimagedata,
        "safetyhazardsdrivewaysimagename": safetyhazardsdrivewaysimagename,
        "safetyhazardsdrivewaystwoimagedata":
            safetyhazardsdrivewaystwoimageData,
        "safetyhazardsdrivewaystwoimagename":
            safetyhazardsdrivewaystwoimageName,
        "safetyhazardsdrivewaysthreeimagedata":
            safetyhazardsdrivewaysthreeimageData,
        "safetyhazardsdrivewaysthreeimagename":
            safetyhazardsdrivewaysthreeimageName,
        "safetyhazardsdrivewaysfourimagedata":
            safetyhazardsdrivewaysfourimageData,
        "safetyhazardsdrivewaysfourimagename":
            safetyhazardsdrivewaysfourimageName,
        "safetyhazardspathsimagedata": safetyhazardspathsimagedata,
        "safetyhazardspathsimagename": safetyhazardspathsimagename,
        "safetyhazardspathstwoimagedata": safetyhazardspathstwoimageData,
        "safetyhazardspathstwoimagename": safetyhazardspathstwoimageName,
        "safetyhazardspathsthreeimagedata": safetyhazardspathsthreeimageData,
        "safetyhazardspathsthreeimagename": safetyhazardspathsthreeimageName,
        "safetyhazardspathsfourimagedata": safetyhazardspathsfourimageData,
        "safetyhazardspathsfourimagename": safetyhazardspathsfourimageName,
        "safetyhazardsstepsimagedata": safetyhazardsstepsimagedata,
        "safetyhazardsstepsimagename": safetyhazardsstepsimagename,
        "safetyhazardsstepstwoimagedata": safetyhazardsstepstwoimageData,
        "safetyhazardsstepstwoimagename": safetyhazardsstepstwoimageName,
        "safetyhazardsstepsthreeimagedata": safetyhazardsstepsthreeimageData,
        "safetyhazardsstepsthreeimagename": safetyhazardsstepsthreeimageName,
        "safetyhazardsstepsfourimagedata": safetyhazardsstepsfourimageData,
        "safetyhazardsstepsfourimagename": safetyhazardsstepsfourimageName,
        "safetyhazardsretainingwallsimagedata":
            safetyhazardsretainingwallsimagedata,
        "safetyhazardsretainingwallsimagename":
            safetyhazardsretainingwallsimagename,
        "safetyhazardsretainingwallstwoimagedata":
            safetyhazardsretainingwallstwoimageData,
        "safetyhazardsretainingwallstwoimagename":
            safetyhazardsretainingwallstwoimageName,
        "safetyhazardsretainingwallsthreeimagedata":
            safetyhazardsretainingwallsthreeimageData,
        "safetyhazardsretainingwallsthreeimagename":
            safetyhazardsretainingwallsthreeimageName,
        "safetyhazardsretainingwallsfourimagedata":
            safetyhazardsretainingwallsfourimageData,
        "safetyhazardsretainingwallsfourimagename":
            safetyhazardsretainingwallsfourimageName,
        "safetyhazardscaraccommodationimagedata":
            safetyhazardscaraccommodationimagedata,
        "safetyhazardscaraccommodationimagename":
            safetyhazardscaraccommodationimagename,
        "safetyhazardscaraccommodationtwoimagedata":
            safetyhazardscaraccommodationtwoimageData,
        "safetyhazardscaraccommodationtwoimagename":
            safetyhazardscaraccommodationtwoimageName,
        "safetyhazardscaraccommodationthreeimagedata":
            safetyhazardscaraccommodationthreeimageData,
        "safetyhazardscaraccommodationthreeimagename":
            safetyhazardscaraccommodationthreeimageName,
        "safetyhazardscaraccommodationfourimagedata":
            safetyhazardscaraccommodationfourimageData,
        "safetyhazardscaraccommodationfourimagename":
            safetyhazardscaraccommodationfourimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheSiteStepTwoFragments(reportId: id)));
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

        safetyhazardsdrivewaystwoimagePath = "NA";
        safetyhazardsdrivewaystwoimageName = "NA";
        safetyhazardsdrivewaystwoimageData = "NA";

        safetyhazardsdrivewaysthreeimagePath = "NA";
        safetyhazardsdrivewaysthreeimageName = "NA";
        safetyhazardsdrivewaysthreeimageData = "NA";

        safetyhazardsdrivewaysfourimagePath = "NA";
        safetyhazardsdrivewaysfourimageName = "NA";
        safetyhazardsdrivewaysfourimageData = "NA";
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

        safetyhazardsdrivewaysthreeimagePath = "NA";
        safetyhazardsdrivewaysthreeimageName = "NA";
        safetyhazardsdrivewaysthreeimageData = "NA";

        safetyhazardsdrivewaysfourimagePath = "NA";
        safetyhazardsdrivewaysfourimageName = "NA";
        safetyhazardsdrivewaysfourimageData = "NA";
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

        safetyhazardsdrivewaysfourimagePath = "NA";
        safetyhazardsdrivewaysfourimageName = "NA";
        safetyhazardsdrivewaysfourimageData = "NA";
      });
    } else {
      setState(() {
        viewVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidepathsWidget() {
    if (viewpathsVisible == true) {
      setState(() {
        viewpathsVisible = false;
        viewpathsVisibleTwo = false;
        viewpathsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewpathsVisible.toString());

        safetyhazardspathstwoimagePath = "NA";
        safetyhazardspathstwoimageName = "NA";
        safetyhazardspathstwoimageData = "NA";

        safetyhazardspathsthreeimagePath = "NA";
        safetyhazardspathsthreeimageName = "NA";
        safetyhazardspathsthreeimageData = "NA";

        safetyhazardspathsfourimagePath = "NA";
        safetyhazardspathsfourimageName = "NA";
        safetyhazardspathsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewpathsVisible = true;
        viewpathsVisibleTwo = false;
        viewpathsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewpathsVisible.toString());
      });
    }
  }

  void hidepathstwoWidget() {
    if (viewpathsVisibleTwo == true) {
      setState(() {
        viewpathsVisibleTwo = false;
        viewpathsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewpathsVisibleTwo.toString());

        safetyhazardspathsthreeimagePath = "NA";
        safetyhazardspathsthreeimageName = "NA";
        safetyhazardspathsthreeimageData = "NA";

        safetyhazardspathsfourimagePath = "NA";
        safetyhazardspathsfourimageName = "NA";
        safetyhazardspathsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewpathsVisibleTwo = true;
        viewpathsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewpathsVisibleTwo.toString());
      });
    }
  }

  void hidepathsthreeWidget() {
    if (viewpathsVisibleThree == true) {
      setState(() {
        viewpathsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewpathsVisibleTwo.toString());

        safetyhazardspathsfourimagePath = "NA";
        safetyhazardspathsfourimageName = "NA";
        safetyhazardspathsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewpathsVisibleThree = true;
        //Fluttertoast.showToast(msg: viewpathsVisibleTwo.toString());
      });
    }
  }

  void hidestepsWidget() {
    if (viewstepsVisible == true) {
      setState(() {
        viewstepsVisible = false;
        viewstepsVisibleTwo = false;
        viewstepsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewstepsVisible.toString());

        safetyhazardsstepstwoimagePath = "NA";
        safetyhazardsstepstwoimageName = "NA";
        safetyhazardsstepstwoimageData = "NA";

        safetyhazardsstepsthreeimagePath = "NA";
        safetyhazardsstepsthreeimageName = "NA";
        safetyhazardsstepsthreeimageData = "NA";

        safetyhazardsstepsfourimagePath = "NA";
        safetyhazardsstepsfourimageName = "NA";
        safetyhazardsstepsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewstepsVisible = true;
        viewstepsVisibleTwo = false;
        viewstepsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewstepsVisible.toString());
      });
    }
  }

  void hidestepstwoWidget() {
    if (viewstepsVisibleTwo == true) {
      setState(() {
        viewstepsVisibleTwo = false;
        viewstepsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewstepsVisibleTwo.toString());

        safetyhazardsstepsthreeimagePath = "NA";
        safetyhazardsstepsthreeimageName = "NA";
        safetyhazardsstepsthreeimageData = "NA";

        safetyhazardsstepsfourimagePath = "NA";
        safetyhazardsstepsfourimageName = "NA";
        safetyhazardsstepsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewstepsVisibleTwo = true;
        viewstepsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewstepsVisibleTwo.toString());
      });
    }
  }

  void hidestepsthreeWidget() {
    if (viewstepsVisibleThree == true) {
      setState(() {
        viewstepsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewstepsVisibleTwo.toString());

        safetyhazardsstepsfourimagePath = "NA";
        safetyhazardsstepsfourimageName = "NA";
        safetyhazardsstepsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewstepsVisibleThree = true;
        //Fluttertoast.showToast(msg: viewstepsVisibleTwo.toString());
      });
    }
  }

  void hideretainingwallsWidget() {
    if (viewretainingwallsVisible == true) {
      setState(() {
        viewretainingwallsVisible = false;
        viewretainingwallsVisibleTwo = false;
        viewretainingwallsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewretainingwallsVisible.toString());

        safetyhazardsretainingwallstwoimagePath = "NA";
        safetyhazardsretainingwallstwoimageName = "NA";
        safetyhazardsretainingwallstwoimageData = "NA";

        safetyhazardsretainingwallsthreeimagePath = "NA";
        safetyhazardsretainingwallsthreeimageName = "NA";
        safetyhazardsretainingwallsthreeimageData = "NA";

        safetyhazardsretainingwallsfourimagePath = "NA";
        safetyhazardsretainingwallsfourimageName = "NA";
        safetyhazardsretainingwallsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewretainingwallsVisible = true;
        viewretainingwallsVisibleTwo = false;
        viewretainingwallsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewretainingwallsVisible.toString());
      });
    }
  }

  void hideretainingwallstwoWidget() {
    if (viewretainingwallsVisibleTwo == true) {
      setState(() {
        viewretainingwallsVisibleTwo = false;
        viewretainingwallsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        safetyhazardsretainingwallsthreeimagePath = "NA";
        safetyhazardsretainingwallsthreeimageName = "NA";
        safetyhazardsretainingwallsthreeimageData = "NA";

        safetyhazardsretainingwallsfourimagePath = "NA";
        safetyhazardsretainingwallsfourimageName = "NA";
        safetyhazardsretainingwallsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewretainingwallsVisibleTwo = true;
        viewretainingwallsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hideretainingwallsthreeWidget() {
    if (viewretainingwallsVisibleThree == true) {
      setState(() {
        viewretainingwallsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        safetyhazardsretainingwallsfourimagePath = "NA";
        safetyhazardsretainingwallsfourimageName = "NA";
        safetyhazardsretainingwallsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewretainingwallsVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidecaraccommodationWidget() {
    if (viewcaraccommodationVisible == true) {
      setState(() {
        viewcaraccommodationVisible = false;
        viewcaraccommodationVisibleTwo = false;
        viewcaraccommodationVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        safetyhazardscaraccommodationtwoimagePath = "NA";
        safetyhazardscaraccommodationtwoimageName = "NA";
        safetyhazardscaraccommodationtwoimageData = "NA";

        safetyhazardscaraccommodationthreeimagePath = "NA";
        safetyhazardscaraccommodationthreeimageName = "NA";
        safetyhazardscaraccommodationthreeimageData = "NA";

        safetyhazardscaraccommodationfourimagePath = "NA";
        safetyhazardscaraccommodationfourimageName = "NA";
        safetyhazardscaraccommodationfourimageData = "NA";
      });
    } else {
      setState(() {
        viewcaraccommodationVisible = true;
        viewcaraccommodationVisibleTwo = false;
        viewcaraccommodationVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidecaraccommodationtwoWidget() {
    if (viewcaraccommodationVisibleTwo == true) {
      setState(() {
        viewcaraccommodationVisibleTwo = false;
        viewcaraccommodationVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        safetyhazardscaraccommodationthreeimagePath = "NA";
        safetyhazardscaraccommodationthreeimageName = "NA";
        safetyhazardscaraccommodationthreeimageData = "NA";

        safetyhazardscaraccommodationfourimagePath = "NA";
        safetyhazardscaraccommodationfourimageName = "NA";
        safetyhazardscaraccommodationfourimageData = "NA";
      });
    } else {
      setState(() {
        viewcaraccommodationVisibleTwo = true;
        viewcaraccommodationVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidecaraccommodationthreeWidget() {
    if (viewcaraccommodationVisibleThree == true) {
      setState(() {
        viewcaraccommodationVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        safetyhazardscaraccommodationfourimagePath = "NA";
        safetyhazardscaraccommodationfourimageName = "NA";
        safetyhazardscaraccommodationfourimageData = "NA";
      });
    } else {
      setState(() {
        viewcaraccommodationVisibleThree = true;
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
                'THE SITE (STEP 1)',
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
            //Driveways

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Driveways'),
                ),
                value: safetyhazardsdriveways,
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
                onChanged: (safetyhazardsdriveways) {
                  setState(() {
                    this.safetyhazardsdriveways = safetyhazardsdriveways!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsdrivewaysCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsdrivewaysimagepath != "NA"
                  ? Image.memory(base64Decode(safetyhazardsdrivewaysimagedata))
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
                        child: safetyhazardsdrivewaystwoimageData != "NA"
                            ? Image.memory(base64Decode(
                                safetyhazardsdrivewaystwoimageData))
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
                                    safetyhazardsdrivewaystwocaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    safetyhazardsdrivewaystwogetImage();
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
                      child: safetyhazardsdrivewaysthreeimageData != "NA"
                          ? Image.memory(base64Decode(
                              safetyhazardsdrivewaysthreeimageData))
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
                                  safetyhazardsdrivewaysthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsdrivewaysthreegetImage();
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
                      child: safetyhazardsdrivewaysfourimageData != "NA"
                          ? Image.memory(
                              base64Decode(safetyhazardsdrivewaysfourimageData))
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
                                  safetyhazardsdrivewaysfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsdrivewaysfourgetImage();
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
            //Paths

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Paths'),
                ),
                value: safetyhazardspaths,
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
                onChanged: (safetyhazardspaths) {
                  setState(() {
                    this.safetyhazardspaths = safetyhazardspaths!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardspathsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardspathsimagepath != "NA"
                  ? Image.memory(base64Decode(safetyhazardspathsimagepath))
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
                          safetyhazardsPathsCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          safetyhazardsPathsGetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st Paths Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hidepathsWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st Paths Add More Image
            Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: viewpathsVisible,
                replacement: const SizedBox.shrink(),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: safetyhazardspathstwoimageData != "NA"
                            ? Image.memory(
                                base64Decode(safetyhazardspathstwoimageData))
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
                                    safetyhazardspathstwocaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    safetyhazardspathstwogetImage();
                                  },
                                  child: Text('Choose Image')),
                            ),
                          ],
                        ),
                      ),

                      //2nd Paths Add More Button
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidepathstwoWidget();
                            },
                            child: Text('Add or Delete More Image')),
                      ),
                    ],
                  ),
                )),

            //2nd Paths Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewpathsVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardspathsthreeimageData != "NA"
                          ? Image.memory(
                              base64Decode(safetyhazardspathsthreeimageData))
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
                                  safetyhazardspathsthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardspathsthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd Paths Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidepathsthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd Paths Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewpathsVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardspathsfourimageData != "NA"
                          ? Image.memory(
                              base64Decode(safetyhazardspathsfourimageData))
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
                                  safetyhazardspathsfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardspathsfourgetImage();
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
                              hidepathspathstwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
                ),
              ),
            ),

            //Steps

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Steps'),
                ),
                value: safetyhazardssteps,
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
                onChanged: (safetyhazardssteps) {
                  setState(() {
                    this.safetyhazardssteps = safetyhazardssteps!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsstepsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsstepsimagepath != "NA"
                  ? Image.memory(base64Decode(safetyhazardsstepsimagepath))
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
                          safetyhazardsStepsCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          safetyhazardsStepsGetImage();
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
                    hidestepsWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st steps Add More Image
            Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: viewstepsVisible,
                replacement: const SizedBox.shrink(),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: safetyhazardsstepstwoimageData != "NA"
                            ? Image.memory(
                                base64Decode(safetyhazardsstepstwoimageData))
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
                                    safetyhazardsstepstwocaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    safetyhazardsstepstwogetImage();
                                  },
                                  child: Text('Choose Image')),
                            ),
                          ],
                        ),
                      ),

                      //2nd steps Add More Button
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidestepstwoWidget();
                            },
                            child: Text('Add or Delete More Image')),
                      ),
                    ],
                  ),
                )),

            //2nd steps Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewstepsVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardsstepsthreeimageData != "NA"
                          ? Image.memory(
                              base64Decode(safetyhazardsstepsthreeimageData))
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
                                  safetyhazardsstepsthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsstepsthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd steps Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidestepsthreeWidget();
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
              visible: viewstepsVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardsstepsfourimageData != "NA"
                          ? Image.memory(
                              base64Decode(safetyhazardsstepsfourimageData))
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
                                  safetyhazardsstepsfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsstepsfourgetImage();
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

            //Retaining Walls

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Retaining Walls'),
                ),
                value: safetyhazardswalls,
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
                onChanged: (safetyhazardswalls) {
                  setState(() {
                    this.safetyhazardswalls = safetyhazardswalls!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardswallsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsretainingwallsimagepath != "NA"
                  ? Image.memory(
                      base64Decode(safetyhazardsretainingwallsimagepath))
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
                          safetyhazardsretainingWallsCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          safetyhazardsretainingWallsGetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st retaining walls Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hideretainingwallsWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st retaining walls Add More Image
            Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: viewretainingwallsVisible,
                replacement: const SizedBox.shrink(),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: safetyhazardsretainingwallstwoimageData != "NA"
                            ? Image.memory(base64Decode(
                                safetyhazardsretainingwallstwoimageData))
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
                                    safetyhazardsretainingwallstwocaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    safetyhazardsretainingwallstwogetImage();
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
                              hideretainingwallstwoWidget();
                            },
                            child: Text('Add or Delete More Image')),
                      ),
                    ],
                  ),
                )),

            //2nd retaining walls Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewretainingwallsVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardsretainingwallsthreeimageData != "NA"
                          ? Image.memory(base64Decode(
                              safetyhazardsretainingwallsthreeimageData))
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
                                  safetyhazardsretainingwallsthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsretainingwallsthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd retaining walls Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hideretainingwallsthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd retaining walls Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewretainingwallsVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardsretainingwallsfourimageData != "NA"
                          ? Image.memory(base64Decode(
                              safetyhazardsretainingwallsfourimageData))
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
                                  safetyhazardsretainingwallsfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardsretainingwallsfourgetImage();
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

            //Surface Water Drainage

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Surface Water Drainage'),
                ),
                value: safetyhazardswaterdrainage,
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
                onChanged: (safetyhazardswaterdrainage) {
                  setState(() {
                    this.safetyhazardswaterdrainage =
                        safetyhazardswaterdrainage!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardswaterdrainageCheck(),
            ),
            //Car Accommodation

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Car Accommodation'),
                ),
                value: safetyhazardscar,
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
                onChanged: (safetyhazardscar) {
                  setState(() {
                    this.safetyhazardscar = safetyhazardscar!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardscaraccommodationimagepath != "NA"
                  ? Image.memory(
                      base64Decode(safetyhazardscaraccommodationimagepath))
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
                          safetyhazardscarAccommodationCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          safetyhazardscarAccommodationGetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st car accommodation Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hidecaraccommodationWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st car accommodation Add More Image
            Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: viewcaraccommodationVisible,
                replacement: const SizedBox.shrink(),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: safetyhazardscaraccommodationtwoimageData != "NA"
                            ? Image.memory(base64Decode(
                                safetyhazardscaraccommodationtwoimageData))
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
                                    safetyhazardscaraccommodationtwocaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    safetyhazardscaraccommodationtwogetImage();
                                  },
                                  child: Text('Choose Image')),
                            ),
                          ],
                        ),
                      ),

                      //2nd car accommodation Add More Button
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidecaraccommodationtwoWidget();
                            },
                            child: Text('Add or Delete More Image')),
                      ),
                    ],
                  ),
                )),

            //2nd car accommodation Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewcaraccommodationVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardscaraccommodationthreeimageData != "NA"
                          ? Image.memory(base64Decode(
                              safetyhazardscaraccommodationthreeimageData))
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
                                  safetyhazardscaraccommodationthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardscaraccommodationthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd car accommodation Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidecaraccommodationthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd car accommodation Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewcaraccommodationVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: safetyhazardscaraccommodationfourimageData != "NA"
                          ? Image.memory(base64Decode(
                              safetyhazardscaraccommodationfourimageData))
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
                                  safetyhazardscaraccommodationfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  safetyhazardscaraccommodationfourgetImage();
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
