import 'package:bloc/bloc.dart';
import 'package:dictionary/model/dictionary_model.dart';
import 'package:dictionary/repositories/dictionary_repo.dart';
import 'package:dictionary/services/audio_service.dart';

import '../core/network/base_result.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  DictionaryBloc() : super(DictionaryState.initial()) {
    on<Search>(searchDictionary);
    on<AudioEvent>(audio);
  }

  DictionaryRepo dictionaryRepo = DictionaryRepo();

  AudioService audioServices = AudioService();

  Future<void> searchDictionary(
    Search event,
    Emitter<DictionaryState> emit,
  ) async {
    emit(state.copyWith(status: DictionaryStatus.fetching));
    try {
      final Result response = await dictionaryRepo.search(event.searchQUery);
      if (response.success ?? false) {
        final aud = response.data as DictionaryModel;
        final res =
            aud.phonetics.firstWhere((element) => element.audio!.isNotEmpty);
        emit(state.copyWith(
          status: DictionaryStatus.fetched,
          dictionaryModel: response.data,
          audio: res.audio,
        ));
      } else {
        emit(state.copyWith(status: DictionaryStatus.exception));
      }
    } catch (e) {
      emit(state.copyWith(status: DictionaryStatus.exception));
    }
  }

//function for playing audio
  Future<void> audio(
    AudioEvent event,
    Emitter<DictionaryState> emit,
  ) async {
    try {
      if (state.audio != null && state.audio!.isNotEmpty) {
        await audioServices.audioService(state.audio!);
        emit(state.copyWith(status: DictionaryStatus.fetched));
      } else {
        emit(state.copyWith(status: DictionaryStatus.exception));
      }
    } catch (e) {
      emit(state.copyWith(
        status: DictionaryStatus.exception,
      ));
    }
  }
}
