import 'package:flutter/material.dart';
import 'package:pill_case/view_models/pill_list_view_model.dart';
import 'package:pill_case/view_models/pill_view_model.dart';
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
        .updatePillViewModels();
  }

  Widget getTextWidgets(List<String> strings)
  {
    return new Row(children: strings.map((item) => new Text(item)).toList());
  }

  Card _buildCard(PillViewModel pillViewModel){
      // TODO
      // Komt alle visuele zooi van de card in
      var name =  pillViewModel.name;
      var time = "${pillViewModel.dateTime.hour}:${pillViewModel.dateTime.minute}";
      var status = pillViewModel.status;

      return Card( 
        elevation: 4.0,
        child: Column(
          children: [
            title: Text(name),
            subtitle: Text(time),

            switch (status) {
              case status.completed:
                return (
                  color: Colors.green;
                );
              case status.upcoming: 
                return (
                  color: Colors.orange;
                );
              case status.failed:
                return ( 
                  color: Colors.red;
                );
            }
          ],
        )
      );
  }

  Widget _getPills() {
    //TODO
    // Komt de loop van pillcards in
    // cards = pill_list_view_model.pillViewModels.map((pill_view_model) => buildCard(pill_view_model))
  }


  Widget _buildList(PillListViewModel pill_list_view_model) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Card(title: Text(pill_list_view_model.pillViewModels.map((pill_view_model) => null))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var pill_list_view_model = Provider.of<PillListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pillen overzicht van vandaag'),
      ),
      body: _getPills(),
    );
  }
}