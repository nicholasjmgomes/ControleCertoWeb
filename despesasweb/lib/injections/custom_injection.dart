import 'package:expenses_app/modules/controllers/despesas_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void customInjection() {
  getIt.registerLazySingleton<DespesasController>(() => DespesasController());
}
