// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

productmodel _$productmodelFromJson(Map<String, dynamic> json) => productmodel(
      pname: json['pname'] as String,
      pprice: json['pprice'] as String,
      pdesc: json['pdesc'] as String,
      pid: json['pid'] as String,
      sid: json['sid'] as String,
      pcategory: json['pcategory'] as String,
      pimage: json['pimage'] as String,
      status: json['status'] as bool,
      registeredusers: json['registeredusers'] as List<dynamic>,
      dateAdded: json['dateAdded'] as String,
      location: json['location'] as String,
      ptime: json['ptime'] as int,
    );

Map<String, dynamic> _$productmodelToJson(productmodel instance) =>
    <String, dynamic>{
      'pname': instance.pname,
      'pprice': instance.pprice,
      'pdesc': instance.pdesc,
      'pid': instance.pid,
      'sid': instance.sid,
      'pimage': instance.pimage,
      'pcategory': instance.pcategory,
      'status': instance.status,
      'registeredusers': instance.registeredusers,
      'dateAdded': instance.dateAdded,
      'location': instance.location,
      'ptime': instance.ptime,
    };
