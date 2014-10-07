int countBetween(float[] arr, int min, int max){
  int out = 0;
  for(int i = 0; i < arr.length; i++)
    if(arr[i] > min && arr[i] <= max)
      out++;
  return out;
}

float[] toFloatArr(String[] stringArr){
  float[] out = new float[stringArr.length];
  for(int i = 0; i < out.length; i++){
    out[i] = int(stringArr[i]);
  }
  return out;
}

float getMax(float[] arr){
  float max = arr[0];
  for(int i = 1; i < arr.length; i++)
    max = arr[i] > max ? arr[i] : max;
  return max;
}

float getMin(float[] arr){
  float min = arr[0];
  for(int i = 1; i < arr.length; i++)
    min = arr[i] < min ? arr[i] : min;
  return min;
}

float getAvg(float[] arr){
  float total = arr[0];
  for(int i = 1; i < arr.length; i++)
    total+= arr[i];
  return total/arr.length;
}

int getVoldoendes(float[] arr){
  int out = 0;
  for(int i = 0; i < arr.length; i++)
    if(arr[i] >= 5.5)
      out++;
  return out;
}

int getOnvoldoendes(float[] arr){
  int out = 0;
  for(int i = 0; i < arr.length; i++)
    if(arr[i] < 5.5)
      out++;
  return out;
}
