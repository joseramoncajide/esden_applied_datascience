// https://docs.google.com/spreadsheets/d/1wZuuCS0RE5T4LeYioDU8j3hvdltjHw1O6hRr7ooUzHc/edit#gid=0


function onOpen() {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu('Customer scoring')
      .addItem('Predicción','callApi')
      .addToUi();
}

function callApi() {
  
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getActiveSheet();
  
  var student = sheet.getRange(2,2).getValue();
  Logger.log(student);
  
  var income = sheet.getRange(2,3).getValue();
  Logger.log(income);
  
  var balance = sheet.getRange(2,4).getValue();
  Logger.log(balance);
  
  // Llamada a la API
  var response = UrlFetchApp.fetch("http://178.128.240.218/model/predict?student=" + student + "&income=" + income + "&balance=" + balance + "");
  //Logger.log(response.getContentText());
  
  // Respuesta
  var json = response.getContentText();
  var data = JSON.parse(json);
  
  Logger.log(data);
  
  sheet.getRange(2,5).setValue(data);

}