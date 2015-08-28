void setup(){
  println("uitkomst: " + problem2());
}

int problem1(){
  int sum = 0;
  for(int i = 0; i < 1000; i++){
    if(i%3==0 || i%5==0)
      sum+=i;
  }
  return sum;
}

int problem2(){
  int sum = 2;
  int secondLastNumber = 1;
  int lastNumber = 2;
  while(secondLastNumber+lastNumber < 4000000){
    int term = secondLastNumber + lastNumber;
    println(term);
    if(term % 2 == 0)
      sum+=term;
    secondLastNumber = lastNumber;
    lastNumber = term;
  }
  return sum;
}

int problem7(){
  int primeCounter = 0;
  for(int i = 0; i <= 10001; i++){
    
  }
}
