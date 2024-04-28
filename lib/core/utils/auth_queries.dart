class AuthQueries {
  String signup(String name, String email, String password) {
    return '''
        mutation{
          register(user: {name: "$name", credentials: {email: "$email", password: "$password"}})
          {
            _id
            name
            email
          }
        }
    ''';
  }

  String login(String email, String password) {
    return '''
mutation{
  login(credentials: {email: "$email", password: "$password})

}
''';
  }
}
