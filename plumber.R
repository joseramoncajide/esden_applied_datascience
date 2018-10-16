# plumber.R

#' @apiTitle Modelo predictivo de impagos de deuda
#' @apiDescription Esta API toma los datos de un cliente y estima la propabilidad de que incurra en impago
#' 
#' 
#' @param balance:numeric Deuda pendiente del cliente
#' @param income:numeric Ingresos del cliente
#' @param student:character ¿Es el cliente un estudiante?: Yes/No

#* @get /predict
default <- function(student, balance, income){
  student <- as.character(student)
  balance <- as.numeric(balance)
  income <- as.numeric(income)
  new.df <- data.frame(balance = balance, income = income, student = student)
  if (any(is.na(new.df))) {
    res$status <- 400
    res$body <- "Faltan parámetros"
  }
  trained_model <- readRDS('model.Rds') 
  predict(trained_model, new.df, type = "response")
}

