import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'transfer.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Truc {

  Truc();

  String name = "";
  int playcount = 0;

  factory Truc.fromJson(Map<String, dynamic> json) => _$TrucFromJson(json);
  Map<String, dynamic> toJson() => _$TrucToJson(this);
}

// flutter pub run build_runner build