// views/character_list/character_list_controller.dart
import 'package:get/get.dart';
import 'package:marvel_app/app/model/character.dart';
import 'package:marvel_app/app/service/marvel_api_service.dart';

class CharacterListController extends GetxController {
  var isLoading = true.obs;
  var characters = <Character>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  void fetchCharacters() async {
    try {
      isLoading(true);
      var response = await MarvelApiService().getCharacters();
      if (response.statusCode == 200) {
        var data = response.data['data']['results'] as List;
        characters.value = data.map((character) => Character.fromJson(character)).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
