//----------------------------
// Default view is with ChangeNotifierProvider
// Don't change this file
//----------------------------

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_model_structure/model/view_model.dart';

class View extends StatelessWidget{


  final Widget Function(
      BuildContext context,
      ViewModel viewModel,
      Widget ?child,
      ) _builder;
  final ViewModel _viewModel;

  const View({
    super.key,
    required builder,
    required viewModel,
}) : _builder = builder,
  _viewModel = viewModel;


  Widget _baseBuilder(BuildContext context, ViewModel viewModel, Widget ?child){
    if(_viewModel.busy){
      return const Scaffold(
        body: const Center(child: CircularProgressIndicator(),),
      );
    }
    return _builder(context, viewModel, child);
  }



  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(value: _viewModel, child:  Consumer<ViewModel>(builder: _baseBuilder),);
}