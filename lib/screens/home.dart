import 'dart:async';
import 'package:dictionary/bloc/dictionary_bloc.dart';
import 'package:dictionary/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    const Duration debounceDuration = Duration(milliseconds: 500);
    Timer? debounceTimer;
    return BlocBuilder<DictionaryBloc, DictionaryState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      hintText: 'Search here',
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff9f6dcd),
                      ),
                      onChanged: (String value) {
                        if (debounceTimer != null) {
                          debounceTimer!.cancel();
                        }
                        debounceTimer = Timer(debounceDuration, () {
                          context
                              .read<DictionaryBloc>()
                              .add(Search(searchQUery: value));
                        });
                      },
                    ),
                    if (state.status == DictionaryStatus.fetching)
                      SizedBox(
                        height: screenHeight,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (state.dictionaryModel != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.dictionaryModel!.word,
                                      style: const TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      state.dictionaryModel?.phonetic ?? '',
                                      style: const TextStyle(
                                        color: Color(0xff9f6dcd),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<DictionaryBloc>()
                                          .add(const AudioEvent());
                                    },
                                    icon: const Icon(
                                      Icons.play_arrow,
                                      color: Color(0xff9f6dcd),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...state.dictionaryModel!.meanings.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.partOfSpeech,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 13),
                                      const Expanded(
                                        child: Divider(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Meaning',
                                    style: TextStyle(
                                      color: Color(0xffaaaaaa),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ...e.definitions.map(
                                    (e) => Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          '•',
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(child: Text(e.definition)),
                                      ],
                                    ),
                                  ),
                                  if (e.synonyms != null &&
                                      e.synonyms!.isNotEmpty)
                                    Row(
                                      children: [
                                        const Text(
                                          'Synonyms',
                                          style: TextStyle(
                                            color: Color(0xffaaaaaa),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 25),
                                        Text(
                                          e.synonyms![0],
                                          style: const TextStyle(
                                            color: Color(0xff9f6dcd),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const Text(
                            'Source',
                            style: TextStyle(
                              color: Color(0xffaaaaaa),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(state.dictionaryModel!.sourceUrls[0]),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
