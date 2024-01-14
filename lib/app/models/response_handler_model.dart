class ResponseHandlerClass {
  bool? errorFlag;
  String? errorMessage;
  dynamic values;

  ResponseHandlerClass({
    this.errorFlag,
    this.errorMessage,
    this.values,
  });

  // ResponseHandler.fromJson(Map<String, dynamic> json) {
  //   errorFlag = json['Err_Flag'];
  //   errorMessage = json['Err_Desc'];
  //   values = json['Values'];
  // }
  // Map<String, dynamic> successExeption(String errorMessage) {
  //   return {'Err_Flag': true, 'Err_Desc': errorMessage};
  // }

  // Map<String, dynamic> errorExeption(String errorMessage) {
  //   return {'Err_Flag': true, 'Err_Desc': errorMessage};
  // }

  // Map<String, dynamic> timeOutExeption() {
  //   return {'Err_Flag': true, 'Err_Desc': 'Server Timeout'};
  // }

  // Map<String, dynamic> internetConnectionExeption() {
  //   return {
  //     'Err_Flag': true,
  //     'Err_Desc': 'Please check your internet connection then try again'
  //   };
  // }
}
