  part of 'home_bloc.dart';

  @immutable
  sealed class HomeEvent {}

  class HomeInitialEvent extends HomeEvent{}

  class HomeProductWishlistButtonClikedEvent extends HomeEvent {
    final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClikedEvent({required this.clickedProduct});
  }

  class HomeProductCartButtonClikedEvent extends HomeEvent {
    final ProductDataModel clickedProduct;

  HomeProductCartButtonClikedEvent({required this.clickedProduct});
  }

  class HomeWishlistButtonNavigateEvent extends HomeEvent {}

  class HomeCartButtonNavigateEvent extends HomeEvent {}
