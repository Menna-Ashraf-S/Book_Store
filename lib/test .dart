import 'package:flutter/material.dart';


class Test  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Test > {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          children: [
            Container(
                              width: 120,
                              height: 130 ,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey ,width: 1 ,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  ),
      
                              child: Image.network('https://thumbs.dreamstime.com/z/collection-take-away-foil-boxes-healthy-food-set-containers-meals-top-view-free-copy-space-164637874.jpg'),
                             ),

                             SizedBox(height: 30,),
                             Container( child: ClipRRect(borderRadius: BorderRadius.circular (20),
                child: Image.network('https://thumbs.dreamstime.com/z/collection-take-away-foil-boxes-healthy-food-set-containers-meals-top-view-free-copy-space-164637874.jpg',fit: BoxFit.fill,),
              ),  
              ),

              SizedBox(height: 30,),

              Container(
                width: 120,
                              height: 130 ,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey ,width: 1 ,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  ),

                child: FittedBox(
                child: Image.network('https://thumbs.dreamstime.com/z/collection-take-away-foil-boxes-healthy-food-set-containers-meals-top-view-free-copy-space-164637874.jpg'),
                fit: BoxFit.fill,
                  ),
            ) ,
              SizedBox(height: 30,),
               Container(
                              width: 120,
                              height: 130 ,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey ,width: 1 ,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  ),
      
                              child: ClipRRect( borderRadius: BorderRadius.circular (20),
                                child: Image.network('https://thumbs.dreamstime.com/z/collection-take-away-foil-boxes-healthy-food-set-containers-meals-top-view-free-copy-space-164637874.jpg' ,
                              fit: BoxFit.cover, width: 120,height: 130 ,),
                              )
                             ),
          ],
        ),
                         
      ) ,
     );
     }
    }