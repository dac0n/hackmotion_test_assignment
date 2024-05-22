import 'package:json_annotation/json_annotation.dart';

part 'swing_model.g.dart';

@JsonSerializable()
class Swing {
  final String captureType;
  final Parameters parameters;

  Swing({required this.captureType, required this.parameters});

  factory Swing.fromJson(Map<String, dynamic> json) => _$SwingFromJson(json);
  Map<String, dynamic> toJson() => _$SwingToJson(this);
}

@JsonSerializable()
class Parameters {
  final FlexionExtension HFA_crWrFlexEx;
  final UlnarRadial HFA_crWrRadUln;

  Parameters({required this.HFA_crWrFlexEx, required this.HFA_crWrRadUln});

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);
  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}

@JsonSerializable()
class FlexionExtension {
  final List<double> values;

  FlexionExtension({required this.values});

  factory FlexionExtension.fromJson(Map<String, dynamic> json) =>
      _$FlexionExtensionFromJson(json);
  Map<String, dynamic> toJson() => _$FlexionExtensionToJson(this);
}

@JsonSerializable()
class UlnarRadial {
  final List<double> values;

  UlnarRadial({required this.values});

  factory UlnarRadial.fromJson(Map<String, dynamic> json) =>
      _$UlnarRadialFromJson(json);
  Map<String, dynamic> toJson() => _$UlnarRadialToJson(this);
}
