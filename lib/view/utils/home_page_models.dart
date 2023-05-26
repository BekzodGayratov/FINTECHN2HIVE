class HomeDataModel {
  String task;
  bool done = false;
  String createdAt = DateTime.now().day.toString();
  String img = "";

  HomeDataModel(this.task, this.img);

  
}
