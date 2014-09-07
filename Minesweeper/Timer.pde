
int timerStart = -1;

void startTimer(){
  timerStart = (int)System.currentTimeMillis() / 1000;
}

void stopTimer(){
  timerStart = -1*((int)System.currentTimeMillis() / 1000 - timerStart);
}

int getTime(){
  if(timerStart < 0)
    return -1*timerStart;
  return (int)System.currentTimeMillis() / 1000 - timerStart;
}
