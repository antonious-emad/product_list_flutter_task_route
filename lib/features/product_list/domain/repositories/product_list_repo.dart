import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/ProductModel.dart';
@injectable
abstract class ProductListRepo {
  Future<Either<Failures, ProductModel>> getProductList();
}
