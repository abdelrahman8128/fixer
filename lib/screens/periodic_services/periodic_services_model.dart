import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'periodic_services.dart' show PeriodicServices;
import 'package:flutter/material.dart';

class PeriodicServicesModel extends FlutterFlowModel<PeriodicServices> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
