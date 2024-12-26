import '../models/character.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final character = await charactersWebServices.getAllCharacters();
    return character
        .map<Character>((character) => Character.fromJson(character))
        .toList();
  }
}
