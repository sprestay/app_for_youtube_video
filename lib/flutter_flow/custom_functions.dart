import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool isPhoneCorrect(String val) {
  return val.length == 12;
}

String textOnButton(
  bool isDriver,
  bool isPassenger,
) {
  if (isDriver)
    return "Создать поездку";
  else if (isPassenger)
    return "Найти поездку";
  else
    return "Выберите действие";
}

bool photoIsEmpty(String path) {
  return path.isEmpty;
}

bool stringIsEmpty(String str) {
  return str.isEmpty;
}

bool checkIfButtonShouldBeActive(
  String from,
  String to,
  bool isDriver,
  bool isPassenger,
) {
  return (isDriver || isPassenger) && !from.isEmpty && !to.isEmpty;
}

bool checkIfCarCorrect(
  String photo,
  String mark,
  String model,
  String regnumber,
) {
  return !photo.isEmpty &&
      !mark.isEmpty &&
      !model.isEmpty &&
      !regnumber.isEmpty;
}

bool checkCreateTrip(
  DocumentReference? car,
  DateTime? date,
) {
  return car != null && date != null;
}
