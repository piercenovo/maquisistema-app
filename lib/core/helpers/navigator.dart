import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void pushToPage(BuildContext context, Widget route,
    {PageTransitionType pageTransitionType = PageTransitionType.fade}) {
  Navigator.push(
    context,
    PageTransition(
      type: pageTransitionType,
      child: route,
      fullscreenDialog: true,
    ),
  );
}

void pushAndReplaceToPage(BuildContext context, Widget route,
    {PageTransitionType pageTransitionType = PageTransitionType.fade}) {
  Navigator.pushReplacement(
    context,
    PageTransition(
      type: pageTransitionType,
      child: route,
    ),
  );
}

void pushAndRemoveUntilToPage(BuildContext context, Widget route) {
  Navigator.pushAndRemoveUntil(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: route,
    ),
    (route) => false,
  );
}

void popBack(BuildContext context) {
  Navigator.pop(context);
}
