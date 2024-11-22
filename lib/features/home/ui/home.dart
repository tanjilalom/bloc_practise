import 'package:bloc_practise/features/cart/ui/cart.dart';
import 'package:bloc_practise/features/home/bloc/home_bloc.dart';
import 'package:bloc_practise/features/wishlist/ui/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigatetoCartState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        }
        else if(state is HomeNavigatetoWishlistState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Store'),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){
                homeBloc.add(HomeWishlistButtonNavigateEvent());
              }, icon: Icon(Icons.favorite_border)),
              IconButton(onPressed: (){
                homeBloc.add(HomeCartButtonNavigateEvent());
              }, icon: const Icon(CupertinoIcons.shopping_cart)),
            ],
          ),
        );
      },
    );
  }
}
