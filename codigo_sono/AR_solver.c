
#include <stdio.h>
#include <math.h>



/********************************************************
/
/ AR(2)
/ Função verificada pelo cálculo matlab!
/
/*******************************************************/

void BurgCoef(float* bpm_values, int size_bpm, float* coefs){

     //vetor de erros para frente e para trás
     float fe[size_bpm];
     float be[size_bpm];
     int i;
     float k1, k2;
     float num, den;
     float placeholder;
    
    
     for(i = 0; i<size_bpm; i++){
    	fe[i] = bpm_values[i];
    	be[i] = bpm_values[i];

     }
    
     //cálculo k1
     num = 0;
     den = 0;
     for(i = 1; i < size_bpm; i++){
    	num += fe[i]*be[i-1];
    	den += fe[i]*fe[i] + be[i-1]*be[i-1];
     }
    
     k1 = -2*num/den;
     //atualizar vetores  
     
     for(i = 1; i < size_bpm; i++){
    	placeholder = fe[i] + k1*be[i-1];
    	be[i-1] = be[i-1] + k1*fe[i];
    	fe[i] = placeholder;
     }
     
     
     //EVENTUALMENTE FAZER VERIFICAÇÃO COM TAMANHO DE VETOR PARA N DAR PORCARIA!!
     
     
     //calcular k2
     num = 0;
     den = 0;
     for(i = 2; i < size_bpm; i++){
    	num += fe[i]*be[i-2];
    	den += fe[i]*fe[i] + be[i-2]*be[i-2];
     }
     
     k2 = -2*num/den;  
     k1 = k1 + k2*k1;
     
     k1 = -k1;
     k2 = -k2;
     //calcular erro
     placeholder = 0;
     for(i = 2; i < size_bpm; i++){
    	placeholder += (bpm_values[i] - (k1*bpm_values[i-1] + k2*bpm_values[i-2]))*(bpm_values[i] - (k1*bpm_values[i-1] + k2*bpm_values[i-2]));
     }
     
     placeholder = placeholder/(size_bpm-2);
     coefs[0] = k1;
     coefs[1] = k2;
     coefs[2] = placeholder;
     
     
    i=0;
    placeholder = 0;
    for(i=0; i<size_bpm; i++){
    	placeholder += bpm_values[i];
    }
    placeholder = placeholder/size_bpm;
    coefs[3]= placeholder;
    coefs[4] = bpm_values[10];

     return;
}

/*
void bpm_media(float* bpm_values, int size_bpm, float* coefs){
    int i=0;
    int media = 0;
    for(i=0; i<size_bpm; i++){
    	media += bpm_values[i];
    }
    media = media/size_bpm;
    coefs[3]= media;
    return;
}*/


/*
int main(int argc, char *argv[]){
    float vetor[10] = {70, 71, 72, 72, 73, 73, 74, 75, 75, 75};
    printf("tamanho vetor = %ld\n", sizeof(vetor));
    BurgCoef(vetor, 10);

    return 0;
}*/


