import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'my_car.dart' show MyCar;
import 'package:flutter/material.dart';

class EditCarModel extends FlutterFlowModel<MyCar> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for carName widget.
  FocusNode? carNameFocusNode;
  TextEditingController? carNameController;
  String? Function(BuildContext, String?)? carNameControllerValidator;
  // State field(s) for carColor widget.
  FocusNode? carColorFocusNode;
  TextEditingController? carColorController;
  String? Function(BuildContext, String?)? carColorControllerValidator;
  // State field(s) for carMileage widget.
  FocusNode? carMileageFocusNode;
  TextEditingController? carMileageController;
  String? Function(BuildContext, String?)? carMileageControllerValidator;
  // State field(s) for tempDefault widget.
  FocusNode? tempDefaultFocusNode1;
  TextEditingController? tempDefaultController1;
  String? Function(BuildContext, String?)? tempDefaultController1Validator;
  // State field(s) for tempDefault widget.
  FocusNode? tempDefaultFocusNode2;
  TextEditingController? tempDefaultController2;
  // State field(s) for tempDefault widget.
  FocusNode? tempDefaultFocusNode3;
  TextEditingController? tempDefaultController3;
  String? Function(BuildContext, String?)? tempDefaultController2Validator;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode1;
  TextEditingController? emailFieldController1;
  String? Function(BuildContext, String?)? emailFieldController1Validator;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode2;
  TextEditingController? emailFieldController2;
  String? Function(BuildContext, String?)? emailFieldController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    carNameFocusNode?.dispose();
    carNameController?.dispose();

    carColorFocusNode?.dispose();
    carColorController?.dispose();

    carMileageFocusNode?.dispose();
    carMileageController?.dispose();

    tempDefaultFocusNode1?.dispose();
    tempDefaultController1?.dispose();

    tempDefaultFocusNode2?.dispose();
    tempDefaultController2?.dispose();

    emailFieldFocusNode1?.dispose();
    emailFieldController1?.dispose();

    emailFieldFocusNode2?.dispose();
    emailFieldController2?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
