import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_states.dart';
import 'package:shop_app/modules/shop_app/categorey/categorey_screen.dart';
import 'package:shop_app/modules/shop_app/settings/settings_screen.dart';
import '../../../models/shop_app/home_model.dart';
import '../../../modules/shop_app/favorites/favorites_screen.dart';
import '../../../modules/shop_app/proudcts/products_screen.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit <ShopStates> {

  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  List <Widget> BottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ] ;

  void changeNavBar (index) {
    currentIndex = index ;
    emit(ShopChangeNavBarState());
  }

  HomeModel? homeModel ;

  void getHomeData (){
    emit(ShopLoadingGetHomeDataState());
    DioHelper.getData(url: HOME).then((value){

      homeModel = HomeModel.fromJson(value.data);

      print(homeModel.toString());

      emit(ShopSuccessGetHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetHomeDataState());
    });
  }

}