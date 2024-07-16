import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:product_list_flutter_task_route/features/product_list/data/data_sources/remote_ds/product_list_ds.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/error/failures.dart';
import '../../models/ProductModel.dart';

@Injectable(as: ProductRemoteDS)
class ProductRemoteDSImpl implements ProductRemoteDS {
  ApiManager apiManager;
  ProductRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.productList, data: null);
      ProductModel ProductsModel = ProductModel.fromJson(response.data);

      return Right(ProductsModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }


}
