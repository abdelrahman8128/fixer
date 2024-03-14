import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'component_details.dart' show ComponentDetails;
import 'package:flutter/material.dart';

class ComponentDetailsModel extends FlutterFlowModel<ComponentDetails> {
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
