class Book {

  int ? id ;
  String ? name ;
  String ? author ;
  String ? url ;

  Book (dynamic obj){
     if (obj['id']!= null) {
      id = obj['id'];
     }
  name = obj['name'];
  author = obj['author'];
  url = obj['url'];
  }

  Book.fromMap (Map <String , dynamic> data ){
  if (data['id']!= null){
    id = data['id'];
  }
  name = data['name'];
  author = data['author'];
  url = data['url'];
 }

  Map <String , dynamic> toMap () {
 Map <String , dynamic> Data = { 
  'name' : name  ,
   'author':author ,
    'url': url ,
    };
 if (id != null){
  Data ['id'] = id ;
 }
 return Data ; 
 } 

}