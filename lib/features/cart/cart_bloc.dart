  import 'package:bloc/bloc.dart';
import 'package:bloc_demo_exmaple/data/cart_items.dart';
  import 'package:bloc_demo_exmaple/models/home_product_data_model.dart';
  import 'package:meta/meta.dart';

  part 'cart_event.dart';
  part 'cart_state.dart';

  class CartBloc extends Bloc<CartEvent, CartState> {
    CartBloc() : super(CartInitial()) {
      on<CartInitialEvent>(cartInitialEvent);
    }

    Future<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit)async{
      emit(CartSuccessState(cartItems: cartItems));

    }
  }
