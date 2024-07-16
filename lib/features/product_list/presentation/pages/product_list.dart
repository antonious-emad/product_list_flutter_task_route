import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list_flutter_task_route/features/product_list/presentation/pages/product_details.dart';
import '../../../../config.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/use_cases/product_list_use_case.dart';
import '../bloc/product_list_bloc.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return
      BlocProvider(
        create: (context) => ProductListBloc(
            getIt<ProductListUseCase>(),)..add(GetAllProducts()),
        child: BlocConsumer<ProductListBloc,ProductListState>(
          listener: (context, state) {
        state.screenStatus == ScreenStatus.loading?const Center(child: CircularProgressIndicator()): const SizedBox();
          },
          builder: (context,state) {
        return state.screenStatus == ScreenStatus.loading?const Center(child: CircularProgressIndicator()):  Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(
              padding: EdgeInsets.only(left: 15.w),
              height: 26.h,
              width: 70.w,
              child: Image.asset(
                "assets/images/blueroute.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 5.h),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFF004182)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFF004182)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xFF06004E),
                            ),
                            hintText: 'what do you search for?',
                            hintStyle: TextStyle(
                              color: const Color(0x9906004E),
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                        Icons.shopping_cart,
                        size: 30.0.sp,
                        color: AppColors.blueColor,
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: state.productModel?.products?.length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (192 / 237),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w),
                  itemBuilder: (context, index) {
                    return ProductItem(
                        productModel:state.productModel,
                        index: index,
                        fav: fav
                    );
                  },
                ),
              )
            ],
          ),
        );
        },
        ),
        );
  }
}