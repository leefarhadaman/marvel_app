import 'package:get/get.dart';

import '../../service/marvel_api_service.dart';

class ComicsController extends GetxController {
  var comics = [].obs;
  var isLoading = true.obs;
  var error = Rx<String?>(null);

  @override
  void onInit() {
    fetchComics();
    super.onInit();
  }

  void fetchComics() async {
    try {
      final response = await MarvelApiService().getComics();
      comics.value = response.data['data']['results'];
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
