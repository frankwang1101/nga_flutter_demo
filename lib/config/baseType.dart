// 性别
enum Gender{
  male, female
}

// 用户
class User {
  int uid;
  String username;
  int level;
  double reputaion;
  int posts;
  Gender gender;
  DateTime createTime;
  DateTime updateTime;
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
}

// 帖子(列表)
class Info{
  String title;
  int id;
  int uid;
  String username;
  DateTime updateTime;
  int replyNum;
  String tag;

  Info(this.id, this.title, this.tag, this.uid, this.username, this.updateTime, this.replyNum);

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