part of 'dictionary_bloc.dart';

enum DictionaryStatus {
  initial,
  fetching,
  fetched,
  exception,
}

class DictionaryState {
  final DictionaryStatus status;
  final DictionaryModel? dictionaryModel;
  final String? audio;

  DictionaryState({
    required this.status,
    this.dictionaryModel,
    this.audio,
  });

  factory DictionaryState.initial() {
    return DictionaryState(
      status: DictionaryStatus.initial,
    );
  }
  DictionaryState copyWith({
    required DictionaryStatus status,
    DictionaryModel? dictionaryModel,
    String?audio,
  }) {
    return DictionaryState(
      status: status,
      dictionaryModel: dictionaryModel ?? this.dictionaryModel,
      audio: audio??this.audio,
    );
  }
}
