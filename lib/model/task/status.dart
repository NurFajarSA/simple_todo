class Status {
  String current = "TO DO";

  Status();

  @override
  String toString() {
    // TODO: implement toString
    return current;
  }

  void setTodo() {
    current = "TO DO";
  }

  void setInprogress() {
    current = "IN PROGRESS";
  }

  void setComplete() {
    current = "COMPLETE";
  }
}
