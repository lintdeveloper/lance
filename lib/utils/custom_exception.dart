class CustomException implements Exception {
  String msg = "Something Went wrong, pls try again!";

  CustomException(this.msg);

  @override
  String toString(){
    return msg;
  }
}