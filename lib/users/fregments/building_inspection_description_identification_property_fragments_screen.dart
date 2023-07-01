import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiselect/multiselect.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_other_inspections_reports_fragments_screen.dart';

class BuildingInspetionDescriptionIdentificationPropertyFragments
    extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspetionDescriptionIdentificationPropertyFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspetionDescriptionIdentificationPropertyFragments>
      createState() =>
          _BuildingInspetionDescriptionIdentificationPropertyFragmentsState();
}

class _BuildingInspetionDescriptionIdentificationPropertyFragmentsState
    extends State<BuildingInspetionDescriptionIdentificationPropertyFragments> {
  TextEditingController typeInspectedController = TextEditingController();
  TextEditingController styleInspectedController = TextEditingController();
  TextEditingController constructionTypeInspectedInspectedController =
      TextEditingController();
  TextEditingController interiorController = TextEditingController();
  TextEditingController piersCommentsController = TextEditingController();
  TextEditingController flooringCommentsController = TextEditingController();
  TextEditingController verandahsController = TextEditingController();
  TextEditingController patioController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  TextEditingController roofingController = TextEditingController();
  TextEditingController roofCoveringController = TextEditingController();
  TextEditingController outStructuresController = TextEditingController();
  TextEditingController flooringintrriorcommentsspace = TextEditingController();

  var typeinspected = "NA";
  var styleinspected = "NA";
  var piersinspected = "NA";
  var roofinginspected = "NA";
  var roofcoveringinspected = "NA";

  List<String> flooringintrriorselected = [];
  var flooringintrrior = "NA";

  var flooringintrriorcomments = "NA";
  //var flooringintrriorcommentsspace = "NA";

  conditionCheck() {
    if (flooringintrriorcomments == "Writing Space") {
      return TextFormField(
        controller: flooringintrriorcommentsspace,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Writing Space'),
        ),
      );
    }
  }

  Future<void> updateDescriptionIdentificationPropertyDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasedescriptionpropertydetails), body: {
        "id": id,
        //"propertyinspectedtype": typeInspectedController.text.trim(),
        "propertyinspectedtype": typeinspected,
        //"propertyinspectedstyle": styleInspectedController.text.trim(),
        "propertyinspectedstyle": styleinspected,
        "constructiontype":
            constructionTypeInspectedInspectedController.text.trim(),
        "interior": interiorController.text.trim(),
        //"piers": piersCommentsController.text.trim(),
        "piers": piersinspected,
        "pierscomments": piersCommentsController.text.trim(),
        //"flooring": flooringCommentsController.text.trim(),
        "flooring": flooringintrrior,
        "flooringcomments": flooringintrriorcommentsspace.text.trim(),
        //"flooringcomments": flooringintrrior,
        "verandahs": verandahsController.text.trim(),
        "patio": patioController.text.trim(),
        "patioother": otherController.text.trim(),
        //"roofing": roofingController.text.trim(),
        "roofing": roofinginspected,
        "roofingdescription": roofingController.text.trim(),
        //"roofcovering": roofCoveringController.text.trim(),
        "roofcovering": roofcoveringinspected,
        "roofcoveringdescription": roofCoveringController.text.trim(),
        "outstructures": outStructuresController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionOtherInspectionsReportFragments(
                    reportId: id)));
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      print(e);

      Fluttertoast.showToast(msg: e.toString());
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
                'Description and Identification of the Property Inspected',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

            //Type
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Type'),
                ),
                value: typeinspected,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Free Standing Domestic House'),
                    value: "Free Standing Domestic House",
                  ),
                  DropdownMenuItem(
                    child: Text('Duplex Construction'),
                    value: "Duplex Construction",
                  ),
                  DropdownMenuItem(
                    child: Text('Home Unit/Apartment/Flat'),
                    value: "Home Unit/Apartment/Flat",
                  ),
                  DropdownMenuItem(
                    child: Text('Terraced House'),
                    value: "Terraced House",
                  ),
                  DropdownMenuItem(
                    child: Text('Terraced House Detached One Side'),
                    value: "Terraced House Detached One Side",
                  ),
                  DropdownMenuItem(
                    child: Text('Queenslander'),
                    value: "Queenslander",
                  ),
                  DropdownMenuItem(
                    child: Text('Queenslander Modified'),
                    value: "Queenslander Modified",
                  ),
                  DropdownMenuItem(
                    child: Text('Commercial Building'),
                    value: "Commercial Building",
                  ),
                ],
                onChanged: (typeinspected) {
                  setState(() {
                    this.typeinspected = typeinspected!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //Style
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Style'),
                ),
                value: styleinspected,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Single Storey'),
                    value: "Single Storey",
                  ),
                  DropdownMenuItem(
                    child: Text('Split Level'),
                    value: "Split Level",
                  ),
                  DropdownMenuItem(
                    child: Text('Two Storey'),
                    value: "Two Storey",
                  ),
                  DropdownMenuItem(
                    child: Text('Multistorey'),
                    value: "Multistorey",
                  ),
                  DropdownMenuItem(
                    child: Text(
                        'Raised above single level on poles/\nstaunchions'),
                    value: "Raised above single level on poles/staunchions",
                  ),
                ],
                onChanged: (styleinspected) {
                  setState(() {
                    this.styleinspected = styleinspected!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //Construction Type
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: constructionTypeInspectedInspectedController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Construction Type'),
                ),
              ),
            ),
            //Interior
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: interiorController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Interior'),
                ),
              ),
            ),
            //Piers
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Piers'),
                ),
                value: piersinspected,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Brick'),
                    value: "Brick",
                  ),
                  DropdownMenuItem(
                    child: Text('Concrete'),
                    value: "Concrete",
                  ),
                  DropdownMenuItem(
                    child: Text('Hardwood Stumps'),
                    value: "Hardwood Stumps",
                  ),
                  DropdownMenuItem(
                    child: Text('Treated Timber Stumps'),
                    value: "Treated Timber Stumps",
                  ),
                  DropdownMenuItem(
                    child: Text('Metal Posts'),
                    value: "Metal Posts",
                  ),
                  DropdownMenuItem(
                    child: Text('Brick/Concrete Combination'),
                    value: "Brick/Concrete Combination",
                  ),
                  DropdownMenuItem(
                    child:
                        Text('Not applicable as slab on ground\n construction'),
                    value: "Not applicable as slab on ground construction",
                  ),
                  DropdownMenuItem(
                    child: Text('Sandstone Blocks'),
                    value: "Sandstone Blocks",
                  ),
                  DropdownMenuItem(
                    child: Text('Timber Brick/ Concrete Combination'),
                    value: "Timber Brick/ Concrete Combination",
                  ),
                ],
                onChanged: (piersinspected) {
                  setState(() {
                    this.piersinspected = piersinspected!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            //Piers Comments
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: piersCommentsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Comments'),
                ),
              ),
            ),

            //Flooring

            Container(
              margin: EdgeInsets.all(10),
              child: DropDownMultiSelect(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Flooring Interior'),
                ),
                options: [
                  'Carpet',
                  'Timber',
                  'Tiles',
                  'Vinyl',
                ],
                selectedValues: flooringintrriorselected,
                onChanged: (List<String> flooringintrriorx) {
                  setState(() {
                    flooringintrriorselected = flooringintrriorx;
                    flooringintrrior = flooringintrriorselected.join(", ");
                  });
                },
              ),
            ),
            //Comments
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Comments'),
                ),
                value: flooringintrriorcomments,
                items: [
                  DropdownMenuItem(
                    child: Text('NA'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Writing Space'),
                    value: "Writing Space",
                  ),
                ],
                onChanged: (flooringintrriorcomments) {
                  setState(() {
                    this.flooringintrriorcomments = flooringintrriorcomments!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: conditionCheck(),
            ),
            //Verandahs
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: verandahsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Verandahs'),
                ),
              ),
            ),
            //Other
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: otherController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other'),
                ),
              ),
            ),
            //Patio
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: patioController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Patio'),
                ),
              ),
            ),
            //Roofing
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roofing'),
                ),
                value: roofinginspected,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Skillion Roof'),
                    value: "Skillion Roof",
                  ),
                  DropdownMenuItem(
                    child: Text('Pitched Roof Hardwood'),
                    value: "Pitched Roof Hardwood",
                  ),
                  DropdownMenuItem(
                    child: Text('Pitched Roof Pine'),
                    value: "Pitched Roof Pine",
                  ),
                  DropdownMenuItem(
                    child: Text('Pitched Roof Treated Pine Trusses'),
                    value: "Pitched Roof Treated Pine Trusses",
                  ),
                  DropdownMenuItem(
                    child: Text('Pitched Roof Combination Hardwood & Pine'),
                    value: "Pitched Roof Combination Hardwood & Pine",
                  ),
                  DropdownMenuItem(
                    child: Text('Timber Truss Roof'),
                    value: "Timber Truss Roof",
                  ),
                  DropdownMenuItem(
                    child: Text('Mental Truss Roof'),
                    value: "Mental Truss Roof",
                  ),
                ],
                onChanged: (roofinginspected) {
                  setState(() {
                    this.roofinginspected = roofinginspected!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //Roofing Description
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: roofingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Description'),
                ),
              ),
            ),
            //Roof covering
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof covering'),
                ),
                value: roofcoveringinspected,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Concrete Tile'),
                    value: "Concrete Tile",
                  ),
                  DropdownMenuItem(
                    child: Text('Terracotta Tile'),
                    value: "Terracotta Tile",
                  ),
                  DropdownMenuItem(
                    child: Text('Slate Tile'),
                    value: "Slate Tile",
                  ),
                  DropdownMenuItem(
                    child: Text('Shingle'),
                    value: "Shingle",
                  ),
                  DropdownMenuItem(
                    child: Text('Metal Roofing'),
                    value: "Metal Roofing",
                  ),
                  DropdownMenuItem(
                    child: Text('Polcarbonate'),
                    value: "Polcarbonate",
                  ),
                  DropdownMenuItem(
                    child: Text('Combination Tile and Mental'),
                    value: "Combination Tile and Mental",
                  ),
                ],
                onChanged: (roofcoveringinspected) {
                  setState(() {
                    this.roofcoveringinspected = roofcoveringinspected!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //Roof covering Description
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: roofCoveringController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Description'),
                ),
              ),
            ),
            //Out Structures
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: outStructuresController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Out Structures'),
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
                          updateDescriptionIdentificationPropertyDetails(
                              widget.reportId);
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
