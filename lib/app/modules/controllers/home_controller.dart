import 'package:get/get.dart';
import 'package:user_info/app/modules/providers/api_service_provider.dart';
class HomeController extends GetxController with StateMixin<List<dynamic>> {


  @override
  void onInit() {
    super.onInit();
    UserInfoProvider().getUserInfo().then((users) {
      change(users, status: RxStatus.success());
    }, onError: (error) {
      change(
        null,
        status: RxStatus.error(error.toString()),
      );
    });

  }

}
