import 'dart:ui';
import 'package:flutter/material.dart';
import 'side_sheet_scaffold.dart';

/// Opens a side-sheet drawer and returns a value when it closes.
Future<T?> showDrawer<T>(
  BuildContext context, {
  required Widget header,
  required Widget body,
  double widthFactor = 0.4,
}) {
  return Navigator.of(context).push<T>(
    PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      pageBuilder: (_, __, ___) {
        return Stack(
          children: [
            // 1) Tap outside to close
            GestureDetector(onTap: () => Navigator.pop(context)),

            // 2) Blurred, dark backdrop
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black54),
            ),

            // 3) Side sheet with header/body/footer
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: widthFactor,
                child: SideSheetScaffold(
                  header: header,
                  body: body,
                ),
              ),
            ),
          ],
        );
      },
      transitionsBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    ),
  );
}