import 'package:expenses_app/pages/adicionar_despesa/adicionar_despesa_controller.dart';
import 'package:expenses_app/pages/pagina_inicial/pagina_inicial_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void customInjection() {
  getIt.registerLazySingleton<PaginaInicialController>(
      () => PaginaInicialController());

  getIt.registerLazySingleton<AdicionarDespesaController>(
      () => AdicionarDespesaController());
}
