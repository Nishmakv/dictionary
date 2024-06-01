import 'package:json_annotation/json_annotation.dart';

part 'dictionary_model.g.dart';

@JsonSerializable()
class DictionaryModel {
  @JsonKey(name: "word")
  final String word;
  @JsonKey(name: "phonetic")
  final String? phonetic;
  @JsonKey(name: "phonetics")
  final List<Phonetic> phonetics;
  @JsonKey(name: "meanings")
  final List<Meaning> meanings;
  @JsonKey(name: "license")
  final License license;
  @JsonKey(name: "sourceUrls")
  final List<String> sourceUrls;

  DictionaryModel({
    required this.word,
     this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
     required this.sourceUrls,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      _$DictionaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DictionaryModelToJson(this);
}

@JsonSerializable()
class Phonetic {
  @JsonKey(name: "text")
  final String? text;
  @JsonKey(name: "audio")
  final String? audio;
  @JsonKey(name: "sourceUrl")
  final String? sourceUrl;
  @JsonKey(name: "license")
  final License? license;

  Phonetic({
     this.text,
     this.audio,
     this.sourceUrl,
     this.license,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) =>
      _$PhoneticFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticToJson(this);
}

@JsonSerializable()
class Meaning {
  @JsonKey(name: "partOfSpeech")
  final String partOfSpeech;
  @JsonKey(name: "definitions")
  final List<Definition> definitions;
  @JsonKey(name: "synonyms")
  final List? synonyms;
  @JsonKey(name: "antonyms")
  final List? antonyms;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
      this.synonyms,
      this.antonyms,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningToJson(this);
}

@JsonSerializable()
class Definition {
  @JsonKey(name: "definition")
  final String definition;
  @JsonKey(name: "example")
  final String? example;
  @JsonKey(name: "synonyms")
  final List? synonyms;
  @JsonKey(name: "antonyms")
  final List? antonyms;

  Definition({
    required this.definition,
    this.example,
      this.synonyms,
     this.antonyms,
  });

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);
}

@JsonSerializable()
class License {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "url")
  final String url;

  License({
    required this.name,
    required this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}
