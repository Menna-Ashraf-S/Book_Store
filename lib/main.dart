import 'package:flutter/material.dart';
import 'package:flutter_pro/book.dart';
import 'package:flutter_pro/dbHelper.dart';
import 'package:flutter_pro/test%20.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:flutter/services.dart';





void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      
      home: Home(),
        
    );
  }
}

class Home  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Home > {

  late DbHelper helper  ;
  String ? name ;
  String ? author ;
  String ? url ;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }   



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true ,
         title: Text('Available Books', 
      style: TextStyle(
        color: Colors.white , fontWeight: FontWeight.bold,fontSize: 28 ,),
        ),
        ),

        floatingActionButton: FloatingActionButton(
          child:
           Icon(Icons.add , size: 28, color: Colors.white,),

          onPressed: (){
           showModalBottomSheet(

            shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),

              isScrollControlled: true,
                      
            context: context, 
            builder: (BuildContext bc) {
                      return 
                      Padding(
                         padding: MediaQuery.of(context).viewInsets ,
                         child:
                          Wrap(
                          children:
                           <Widget>[
                            Column(
                              children:
                               <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10 , right: 20 , left: 20),

                                  child:
                                   TextFormField(
                                    
                                    decoration: InputDecoration(
                                          hintText: 'Book Title' ,
                                          hintStyle: TextStyle(fontWeight: FontWeight.bold ,fontSize: 25 ,color: Colors.grey),
                                      ),

                                      onChanged: (value){
                                        name = value ;
                                      },
                                  )
                                   ),

                                   SizedBox(height: 5,),

                                   Padding(
                                  padding: const EdgeInsets.only( right: 20 , left: 20),

                                  child:
                                   TextFormField(
                                    
                                    decoration: InputDecoration(
                                          hintText: 'Book Author' ,
                                          hintStyle: TextStyle(fontWeight: FontWeight.bold ,fontSize: 25 ,color: Colors.grey),
                                      ),

                                      onChanged: (value){
                                        author = value ;
                                      },
                                  )
                                   ),

                                   SizedBox(height: 5,),

                                   Padding(
                                  padding: const EdgeInsets.only( right: 20 , left: 20),

                                  child:
                                   TextFormField(
                                    
                                    decoration: InputDecoration(
                                          hintText: 'Book Cover URL' ,
                                          hintStyle: TextStyle(fontWeight: FontWeight.bold ,fontSize: 25 ,color: Colors.grey),
                                      ),

                                      onChanged: (value){
                                        url = value ;
                                      },
                                  )
                                   ),

                                   SizedBox(height: 20,),

                                  


                              ],
                              ),
                               Padding(
                                 padding: const EdgeInsets.all(20.0),
                                 child: Container(
                                      width: double.infinity,
                                      height: 45,
                               
                                      child: 
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          )
                                        ),
                                        child: Text('ADD' ,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold ,color: Colors.white, fontSize: 25 ,
                                        ),
                                        )
                                         ,
                               
                                        onPressed: ()async{
                                          Book book = Book({'name': name , 'author' : author , 'url' : url });
                                              int id = await helper.createBook(book);
                                              Navigator.of(context).pop() ;
                                        },

                                         ),
                                     ),
                               ),
                          ],
                          ), 
                         );
                      
                      }
          );
          }
          ),
       body: FutureBuilder(
                 future: helper.allTasks(),
                builder: ((context,
                AsyncSnapshot snapshot) {
                  if(snapshot.hasError)
                    return Center(child: Text(snapshot.error.toString()),);
                  if (! snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  else {
                    return ListView.builder(
                      itemCount: snapshot.data.length ,
                      itemBuilder: (context , index){
                        Book book = Book.fromMap(snapshot.data[index]);


                        return Padding(
                          padding: const EdgeInsets.only(top: 10 , bottom: 10 ,),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 10 , right: 10),
                        
                                child: Container(
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
                                  child: Image.network('${book.url}' ,
                                fit: BoxFit.cover, width: 120,height: 130 ,),
                                )
                               ),
                        
                                ),
                                SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${book.name} ',
                            style: TextStyle(
                              fontWeight:FontWeight.bold , fontSize: 21,
                            ),
                            ),
                        
                            SizedBox(height: 5,),
                        
                            Text('Author : ${book.author} ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 126, 126, 126),fontSize: 18 ,
                          ),
                          ) ,
                        
                                  ],
                                  ),
                        
                                  SizedBox(width: 15,) ,
                        
                                  IconButton(
                            icon: Icon( Icons.delete , color: Color.fromARGB(255, 126, 126, 126), size: 35,),
                            onPressed: (){
                              showDialog(
                          context: context, 
                          builder: (BuildContext context){
                            return AlertDialog(
                              title:
                               Text ('Delete Book',style: TextStyle(fontSize: 25)),
                              content:
                               Text('Are you sure you want to delete this book ?',
                               style: TextStyle(
                                fontSize: 20,color: Colors.grey[700],
                                ),
                                ),
                              actions: 
                              <Widget>[
                                TextButton( 
                                  child: 
                                  Text('Cancel',
                                  style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold ,
                                    ),
                                    ), 
                        
                                onPressed: (){Navigator.of(context).pop();
                                },
                        
                                ),
                        
                                TextButton( 
                                  child: 
                                  Text('Yes',
                                  style: TextStyle(
                                    color: Colors.red,fontSize: 20, fontWeight: FontWeight.bold ,
                                    ),
                                    ),
                                onPressed: (){
                                   if (book.id !=null){
                                  helper.delete(book.id??-1);
                                }
                                },
                                ),
                              ],
                            );
                          }
                          );
                            },
                           ),
                        
                            ],
                            ),
                        );

                      }
                      );
                  }
                })
                ),
    );

  }
  
  }
  

  
	