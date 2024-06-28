// views/stories/stories_controller.dart
import 'package:get/get.dart';
import 'package:marvel_app/app/service/marvel_api_service.dart';

class StoriesController extends GetxController {
  var stories = [].obs;
  var isLoading = true.obs;
  var error = Rx<String?>(null);

  @override
  void onInit() {
    fetchStories();
    super.onInit();
  }

  void fetchStories() async {
    try {
      final response = await MarvelApiService().getStories();
      stories.value = response.data['data']['results'];
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
