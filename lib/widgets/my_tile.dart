import 'package:example_api_1/bloc/delete/delete_bloc.dart';
import 'package:example_api_1/bloc/edit/edit_bloc.dart';
import 'package:example_api_1/product_model.dart/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTile extends StatelessWidget {
  final Product product;
  const MyTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image,
          width: MediaQuery.of(context).size.width * 0.2),
      title: Text("${product.id}: ${product.title}"),
      subtitle: Column(
        children: [
          Text(product.description),
          Row(
            children: [
              UpdateButton(id: product.id),
              DeleteButton(id: product.id)
            ],
          )
        ],
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  final int id;
  const UpdateButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBloc, EditState>(
      builder: (context, state) {
        if (state is EditLoading && id == state.id) {
          return const SizedBox(
              height: 15, width: 15, child: CircularProgressIndicator());
        }
        return TextButton(
            onPressed: () {
              Product product = Product(
                  id: id,
                  title: 'aaa',
                  price: 100,
                  description: 'bbb',
                  category: 'ccc',
                  image: 'https://i.pravatar.cc',
                  rating: Rating(rate: 5, count: 100));

              BlocProvider.of<EditBloc>(context)
                  .add(UpdateProductEvent(product: product));
            },
            child: const Text('update'));
      },
    );
  }
}

class DeleteButton extends StatelessWidget {
  final int id;
  const DeleteButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteBloc, DeleteState>(
      builder: (context, state) {
        if (state is DeleteLoading && id == state.id) {
          return const SizedBox(
              height: 15, width: 15, child: CircularProgressIndicator());
        }
        return TextButton(
            onPressed: () {
              BlocProvider.of<DeleteBloc>(context)
                  .add(DeleteProductEvent(id: id));
            },
            child: const Text('delete'));
      },
    );
  }
}
