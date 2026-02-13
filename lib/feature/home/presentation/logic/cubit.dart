import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_pricing/core/di/service_locator.dart';
import 'package:gold_pricing/feature/home/data/repository/metal_repo.dart';
import 'package:gold_pricing/feature/home/presentation/logic/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  Future<void> getGoldPrice() async {
    emit(GetDataLoadingState());
    final response = await getIt<MetalRepo>().getGoldPrice();
    response.fold(
      (l) => emit(GetGoldPriceError(l)),
      (r) => emit(GetGoldPriceSuccess(r)),
    );
  }
}
