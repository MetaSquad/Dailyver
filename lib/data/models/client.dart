class Client{
  late String _name;
  late String _email;
  late String _location;
  late List<String> _cart;
  //late List<ShoppingCart> _history;
  late String _favoriteListId;

  Client(String name, String email, String location){
    _name = name;
    _email = email;
    _location = location;
    _cart = [];
    //_history =[];
    _favoriteListId = "";
  }

  String get favoriteListId => _favoriteListId;

  set favoriteListId(String value) {
    _favoriteListId = value;
  }

  List<String> get cart => _cart;

  set cart(List<String> value) {
    _cart = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}