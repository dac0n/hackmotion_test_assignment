// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Swing _$SwingFromJson(Map<String, dynamic> json) => Swing(
      captureType: json['captureType'] as String,
      parameters:
          Parameters.fromJson(json['parameters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SwingToJson(Swing instance) => <String, dynamic>{
      'captureType': instance.captureType,
      'parameters': instance.parameters,
    };

Parameters _$ParametersFromJson(Map<String, dynamic> json) => Parameters(
      HFA_crWrFlexEx: FlexionExtension.fromJson(
          json['HFA_crWrFlexEx'] as Map<String, dynamic>),
      HFA_crWrRadUln:
          UlnarRadial.fromJson(json['HFA_crWrRadUln'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParametersToJson(Parameters instance) =>
    <String, dynamic>{
      'HFA_crWrFlexEx': instance.HFA_crWrFlexEx,
      'HFA_crWrRadUln': instance.HFA_crWrRadUln,
    };

FlexionExtension _$FlexionExtensionFromJson(Map<String, dynamic> json) =>
    FlexionExtension(
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$FlexionExtensionToJson(FlexionExtension instance) =>
    <String, dynamic>{
      'values': instance.values,
    };

UlnarRadial _$UlnarRadialFromJson(Map<String, dynamic> json) => UlnarRadial(
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$UlnarRadialToJson(UlnarRadial instance) =>
    <String, dynamic>{
      'values': instance.values,
    };
