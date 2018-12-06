class Member{
  String login;
  String avatarUrl;


  Member.login(this.login);

  Member(this.login, this.avatarUrl){
    if (avatarUrl == null) {
      throw new ArgumentError("avatarUrl of Member cannot be null. "
          "Received: '$avatarUrl'");
    }

  }

}