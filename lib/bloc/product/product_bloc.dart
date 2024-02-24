import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example_api_1/consts/consts.dart';
import 'package:example_api_1/product_model.dart/product_model.dart';
import 'package:http/http.dart' as http;

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductsEvent>(gettingProducts);
  }

  void gettingProducts(event, emit) async {
    emit(ProductLoading());

    try {
      Uri uri = Uri.parse(Urls.allProdcuts);

      http.Response response =
          await http.get(uri, headers: {'content-type': 'application/json'});

      if (response.statusCode == 200) {
        String json = response.body;
        List<Product> products = fromJsonToProducts(json);
        emit(ProductSuccess(products: products));
      }
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }
}
