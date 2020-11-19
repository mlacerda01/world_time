import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTimeService.dart';

class ChangeLocation extends StatefulWidget {
  @override
  _ChangeLocationState createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {

  List<WorldTimeService> locations = [
    WorldTimeService(location: 'Berlin', flagImage: 'assets/flags/germany.png', url: 'Europe/Berlin'),
    WorldTimeService(location: 'Madri', flagImage: 'assets/flags/germany.png', url: 'Europe/Berlin'),
    WorldTimeService(location: 'Espain', flagImage: 'assets/flags/germany.png', url: 'Europe/Berlin'),
    WorldTimeService(location: 'Brazil', flagImage: 'assets/flags/germany.png', url: 'Europe/Berlin'),
    WorldTimeService(location: 'Canada', flagImage: 'assets/flags/germany.png', url: 'Europe/Berlin')
  ];

  void updateTime(int index) async{
    var worldTime = locations[index];
    await worldTime.getTime();
    //send the selected data
    Navigator.pop(context, worldTime);
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Change Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0 ),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text('${locations[index].location}'),
                  leading: CircleAvatar(
                    backgroundImage: new AssetImage('${locations[index].flagImage}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
