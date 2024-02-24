import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example_api_1/consts/consts.dart';
import 'package:example_api_1/product_model.dart/product_model.dart';
import 'package:http/http.dart' as http;

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditInitial()) {
    on<EditEvent>(updatingProduct);
  }

  void updatingProduct(event, emit) async {
    emit(EditLoading(id: event.product.id));
    try {
      Uri uri = Uri.parse("${Urls.allProdcuts}/7");
      String json = fromProductToJson(event.product);
      http.Response response = await http
          .put(uri, body: json, headers: {'content-type': 'application/json'});
      if (response.statusCode == 200) {
        emit(EditNotLoading());
      }
    } catch (e) {
      emit(EditError(error: e.toString()));
    }
  }
}
