import 'package:get/get.dart';

import '../../service/marvel_api_service.dart';

class CreatorsController extends GetxController {
  var creators = [].obs;
  var isLoading = true.obs;
  var error = Rx<String?>(null);

  @override
  void onInit() {
    fetchCreators();
    super.onInit();
  }

  void fetchCreators() async {
    try {
      final response = await MarvelApiService().getCreators();
      creators.value = response.data['data']['results'];
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}