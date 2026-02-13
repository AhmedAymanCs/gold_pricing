import 'package:gold_pricing/feature/home/data/models/item_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class GetDataLoadingState extends AppStates {}

class GetAllDataSuccess extends AppStates {
  final MetalModel gold;
  final MetalModel silver;

  GetAllDataSuccess(this.gold, this.silver);
}

class GetGoldPriceLoadingState extends AppStates {}

class GetGoldPriceSuccess extends AppStates {
  final MetalModel gold;

  GetGoldPriceSuccess(this.gold);
}

class GetGoldPriceError extends AppStates {
  final error;

  GetGoldPriceError(this.error);
}

class GetSilverPriceLoadingState extends AppStates {}

class GetSilverPriceSuccess extends AppStates {
  final MetalModel silver;

  GetSilverPriceSuccess(this.silver);
}

class GetSilverPriceError extends AppStates {
  final error;

  GetSilverPriceError(this.error);
}
