import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/newas.dart';
class Home extends StatelessWidget {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            GetX<Controller>(
              
                builder: (_) => Text(
                      'clicks: ${controller.temp['p']}',
                    )),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                   controller.streamListener();
;
              },
            ),
          ],
        ),
      ),
     
    );
  }
}
class Second extends StatelessWidget {
  final Controller ctrl = Get.find();
  @override
  Widget build(context){
     return Scaffold(body: Center(child: Text("${ctrl.temp['e']}")));
  }
}





