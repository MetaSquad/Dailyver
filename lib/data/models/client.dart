class Client {
  late String name;
  late String email;
  late String location;
  late List<String> cart;

  //TODO uncomment when ShoppingCart is done
  //late List<ShoppingCart> history;
  late String favoriteListId;

  Client(this.name, this.email, this.location) {
    cart = [];
    //TODO initialize history
    //history =[];
    favoriteListId = "";
  }

  Client.fromJSON(Map<String, dynamic> json) {
    name = (json['name'] != null) ? json['name'] : "";
    email = (json['email'] != null) ? json['email'] : "";
    location = (json['location'] != null) ? json['location'] : "";
    cart = ((json['cart'] as List<dynamic>).isNotEmpty) ? json['cart'] : [];
    //TODO gethistory from json
    favoriteListId =
        (json['favoriteListId'] != null) ? json['favoriteListId'] : "";
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'cart': cart,
      //TODO convert history to JSON
      'favoriteListId': favoriteListId,
    };
  }
}
