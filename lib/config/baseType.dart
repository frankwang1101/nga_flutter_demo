// 性别
enum Gender{
  male, female
}

// 用户
class User {
  int uid;
  String username;
  int level;
  int levelExp;
  double reputation;
  int posts;
  Gender gender;
  DateTime createTime;

  User(this.uid, this.username, this.level, this.levelExp, this.reputation, this.posts, this.gender, this.createTime);

}

// 帖子(详情)
class PostType {
  int uid;
  String title;
  DateTime createTime;
  DateTime updateTime;
  String content;
  String tag;
  User user;
  int up;
  int down;

  String floor;

  PostType(this.uid, this.title, this.createTime, this.updateTime, this.content, this.tag, this.user, this.up, this.down, [this.floor]);

}

// 帖子(列表)
class PostRecord{
  int uid;
  String title;
  User user;
  String username;
  DateTime updateTime;
  int replyNum;
  // String tag;

  PostRecord(this.uid, this.title, this.user, this.updateTime, this.replyNum);

}

// 评分
class RateType {
  int rank;
  double rate;
  String name;
  String url;
  String releaseTime;
  List<int> consoles;

  RateType(this.rank, this.rate, this.name, this.url, this.releaseTime,
      this.consoles);
}

// 推荐资源
class RecommandItem {
  int uid;
  String title;
  String desc;
  String imgSrc;
  String userName;

  RecommandItem(this.uid, this.title, this.userName, this.desc, this.imgSrc);
}