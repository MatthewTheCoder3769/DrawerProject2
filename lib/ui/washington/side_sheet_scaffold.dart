import 'package:drawer_advanced_implementation2/colorComponents.dart';
import 'package:flutter/material.dart';

/// A panel with header, scrollable body, and footer.
class SideSheetScaffold extends StatelessWidget {
  final Widget header;
  final Widget body;

  const SideSheetScaffold({
    Key? key,
    required this.header,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Colorcomponents.borderColor, width: 1.0),
          ),
        ),
        child:Column(
          children: [
            // HEADER (fixed height)
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: header,
            ),

            // BODY (scrollable)
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(0),
                child: body,
              ),
            ),

          ],
      ),),
    );
  }
}