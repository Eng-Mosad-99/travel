import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customReplacementNavigate(BuildContext context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
void customNavigate(BuildContext context, String path) {
  GoRouter.of(context).push(path);
}
