part of 'dictionary_bloc.dart';

abstract class DictionaryEvent {
  const DictionaryEvent();

  List<Object?> get props => [];
}

class Search extends DictionaryEvent {
  final String searchQUery;
  const Search({
    required this.searchQUery,
  });

  @override
  List<Object?> get props => [searchQUery];
}

class AudioEvent extends DictionaryEvent {
 
  const AudioEvent();
}
