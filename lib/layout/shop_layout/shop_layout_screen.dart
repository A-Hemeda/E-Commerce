

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/shop_app/search/search_screen.dart';
import '../../shared/componants/componant.dart';
import 'cubit/shop_cubit.dart';
import 'cubit/shop_states.dart';

class ShopLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer <ShopCubit,ShopStates>(
        listener: (context, state) {},
        builder: (context , state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Shop App'),
              actions: [
                IconButton(onPressed: (){
                  navigateTo(context, SearchScreen());
                }, icon:Icon( Icons.search))
              ],
            ),
            body: cubit.BottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeNavBar(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.production_quantity_limits),
                    label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            )

          );
        }
    );
  }
}
