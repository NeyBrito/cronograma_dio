import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/modules/home/home_controller.dart';
import 'package:meu_cronograma/app/modules/home/home_module.dart';

void main() {
  initModules([AppModule(), HomeModule()]);
  HomeController home;

  setUp(() {
        home = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
      test("First Test", () {
        expect(home, isInstanceOf<HomeController>());
      });

      test("Set Value", () {
        expect(home.filter, isNull);
        home.setFilter("filter");
        expect(home.filter, equals("filter"));
      });
  });
}
