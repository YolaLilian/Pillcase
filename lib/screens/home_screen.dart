import 'package:flutter/material.dart';
import 'package:pill_case/view_models/pill_list_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PillListViewModel>(context, listen: false)
        .retrievePillViewModels();
  }

  Widget _buildList(PillListViewModel pill_list_view_model) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(title: Text(pill_list_view_model.pillViewModels[0].name)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var pill_list_view_model = Provider.of<PillListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pillen overzicht van de dag'),
      ),
      body: _buildList(pill_list_view_model),
    );
  }
}
