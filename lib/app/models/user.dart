class User {
  String firstName;
  String lastName;
  String email;
  int age;
  String phoneNumber;
  String city;
  String state;
  String country;
  String userThumbnail;
  String userLargeImage;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.age,
      this.phoneNumber,
      this.city,
      this.state,
      this.country,
      this.userThumbnail,
      this.userLargeImage});

  User.fromJson(Map<String, dynamic> json)
      : this.firstName = "${json['name']['first']}",
        this.lastName = "${json['name']['last']}",
        this.email = "${json['email']}",
        this.age = json['dob']['age'],
        this.phoneNumber = "${json['phone']}",
        this.city = "${json['location']['city']}",
        this.state = "${json['location']['state']}",
        this.country = "${json['location']['country']}",
        this.userLargeImage = "${json['picture']['large']}",
        this.userThumbnail = "${json['picture']['thumbnail']}";

  String getNomeCompleto() => '${this.firstName} ${this.lastName}';

  String getEndereco() => '${this.city}, ${this.state}, ${this.country}';
}
