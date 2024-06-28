// views/events/event_controller.dart
import 'package:get/get.dart';

import '../../service/marvel_api_service.dart';

class EventController extends GetxController {
  var events = [].obs;
  var isLoading = true.obs;
  var error = Rx<String?>(null);

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  void fetchEvents() async {
    try {
      final response = await MarvelApiService().getEvents();
      events.value = response.data['data']['results'];
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
