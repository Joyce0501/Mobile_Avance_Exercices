// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Truc _$TrucFromJson(Map<String, dynamic> json) {
  return Truc()
    ..jour = json['jour'] as int
    ..mois = json['mois'] as int
    ..annee = json['annee'] as int
    ..jourDeLaSemaine = json['jourDeLaSemaine'] as String;
}

Map<String, dynamic> _$TrucToJson(Truc instance) => <String, dynamic>{
      'jour': instance.jour,
      'mois': instance.mois,
      'annee': instance.annee,
      'jourDeLaSemaine': instance.jourDeLaSemaine,
    };
