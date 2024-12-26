import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/character.dart';
import '../../data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
