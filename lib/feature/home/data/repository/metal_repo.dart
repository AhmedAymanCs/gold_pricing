import 'package:dartz/dartz.dart';
import 'package:gold_pricing/core/networking/api_constants.dart';
import 'package:gold_pricing/feature/home/data/models/item_model.dart';

class MetalRepo {
  final helper;
  MetalRepo(this.helper);
  Future<Either<String, MetalModel>> getGoldPrice() async {
    try {
      final response = await helper.getData(
        endPoint: ApiConstants.goldEndPoint,
      );
      return right(MetalModel.fromJson(response.data));
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, MetalModel>> getSilverPrice() async {
    try {
      final response = await helper.getData(
        endPoint: ApiConstants.silverEndPoint,
      );
      return right(MetalModel.fromJson(response.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
