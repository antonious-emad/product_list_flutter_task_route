part of 'product_list_bloc.dart';

enum ScreenStatus {
  init,
  loading,
  successfully,
  failures,
}

class ProductListState {
  final ScreenStatus? screenStatus;
  final ProductModel? productModel;
  final Failures? failures;
  bool? isFav;
  List<String>? iDs;

  ProductListState(
      {this.screenStatus,
      this.productModel,
      this.failures,
      this.isFav,
      this.iDs});

  ProductListState copyWith(
      {ScreenStatus? screenStatus,
      ProductModel? ProductModel,
      Failures? failures,
      bool? isFav,
      List<String>? iDs}) {
    return ProductListState(
      screenStatus: screenStatus ?? this.screenStatus,
      productModel: ProductModel ?? this.productModel,
      failures: failures,
      isFav: isFav,
      iDs: iDs ?? this.iDs,
    );
  }
}

class ProductListInitial extends ProductListState {
  ProductListInitial() : super(screenStatus: ScreenStatus.init);
}
