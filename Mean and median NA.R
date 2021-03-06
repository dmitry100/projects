#замена пустых значений на среднее или медиану, в зависимости от распределения
my_na_rm <- function(x){
  if(is.numeric(x)){
    stat_test <- shapiro.test(x)
    
    if(stat_test$p.value>0.05){
      x[is.na(x)] <- mean(x,na.rm=T)
      print("Na заменены на среднее")
    }
    else{
      x[is.na(x)] <- median(x,na.rm=T)
      print("Na заменены на медиану")
    }
    hist(x)
    return(x)
  }
  else{
    print("X не числовой формат")
  }
}