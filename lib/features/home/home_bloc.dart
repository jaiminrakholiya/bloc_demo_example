import 'package:bloc/bloc.dart';
import 'package:bloc_demo_exmaple/data/cart_items.dart';
import 'package:bloc_demo_exmaple/data/grocery_data.dart';
import 'package:bloc_demo_exmaple/data/wishlist_items.dart';
import 'package:bloc_demo_exmaple/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClikedEvent>(
        homeProductWishlistButtonClikedEvent);
    on<HomeProductCartButtonClikedEvent>(homeProductCartButtonClikedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2)); // Simulating delay
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
            id: e["id"] ?? '',
            name: e["name"] ?? '',
            price: e["price"]?? '',
            description: e[" description"] ?? '',
            imageUrl: e["imageUrl"] ?? ''))
            .toList()
    ));
  }


  // Asynchronous function to handle wishlist button click event
  Future<void> homeProductWishlistButtonClikedEvent(
      HomeProductWishlistButtonClikedEvent event,
      Emitter<HomeState> emit) async {
    print('Wishlist clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  // Asynchronous function to handle cart button click event
  Future<void> homeProductCartButtonClikedEvent(
      HomeProductCartButtonClikedEvent event, Emitter<HomeState> emit) async {
    print('Cart clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  // Asynchronous function to handle wishlist button navigate event
  Future<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) async {
    print('Navigating to wishlist');
    emit(HomeNavigateToWishlistPageActionState());
  }

  // Asynchronous function to handle cart button navigate event
  Future<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) async {
    print('Navigating to cart');
    emit(HomeNavigateToCartPageActionState());
  }
}
