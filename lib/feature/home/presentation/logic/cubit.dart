import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_pricing/core/di/service_locator.dart';
import 'package:gold_pricing/feature/home/data/repository/metal_repo.dart';
import 'package:gold_pricing/feature/home/presentation/logic/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  Future<void> getAllData() async {
    emit(GetDataLoadingState());

    final results = await Future.wait([
      getIt<MetalRepo>().getGoldPrice(),
      getIt<MetalRepo>().getSilverPrice(),
    ]);

    final goldRes = results[0];
    final silverRes = results[1];

    goldRes.fold((l) => emit(GetGoldPriceError(l)), (goldModel) {
      silverRes.fold(
        (l) => emit(GetSilverPriceError(l)),
        (silverModel) => emit(GetAllDataSuccess(goldModel, silverModel)),
      );
    });
  }

  Future<void> getGoldPrice() async {
    emit(GetGoldPriceLoadingState());
    final response = await getIt<MetalRepo>().getGoldPrice();
    response.fold(
      (l) => emit(GetGoldPriceError(l)),
      (r) => emit(GetGoldPriceSuccess(r)),
    );
  }

  Future<void> getSilverPrice() async {
    emit(GetSilverPriceLoadingState());
    final response = await getIt<MetalRepo>().getSilverPrice();
    response.fold(
      (l) => emit(GetSilverPriceError(l)),
      (r) => emit(GetSilverPriceSuccess(r)),
    );
  }
}
