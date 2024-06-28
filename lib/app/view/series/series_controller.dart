// views/series/series_controller.dart
import 'package:get/get.dart';
import 'package:marvel_app/app/service/marvel_api_service.dart';

class SeriesController extends GetxController {
  var series = [].obs;
  var isLoading = true.obs;
  var error = Rx<String?>(null);

  @override
  void onInit() {
    fetchSeries();
    super.onInit();
  }

  void fetchSeries() async {
    try {
      final response = await MarvelApiService().getSeries();
      series.value = response.data['data']['results'];
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
