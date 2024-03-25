import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'productmodel.g.dart';

@JsonSerializable()
class productmodel{
  final String pname;
  final String pprice;
  final String pdesc;
  final String pid;
  final String sid;
  final String pcategory;
  final bool status;
  final List registeredusers;
  final String dateAdded;

  const productmodel({
    required this.pname,
    required this.pprice,
    required this.pdesc,
    required this.pid,
    required this.sid,
    required this.pcategory,
    required this.status,
    required this.registeredusers,
    required this.dateAdded,
  });

  factory productmodel.fromJson(Map<String,dynamic>json)=>_$productmodelFromJson(json);
  Map<String,dynamic>toJson()=>{
    'pname':pname,
    'pprice':pprice,
    'pdesc':pdesc,
    'pid':pid,
    'sid':sid,
    'pcategory':pcategory,
    'status':status,
    'registeredusers':registeredusers,
    'dateAdded':dateAdded,
  };
}