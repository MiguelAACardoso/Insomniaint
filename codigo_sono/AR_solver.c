
#include <stdio.h>
#include <math.h>



/********************************************************

	        CALCULA OS 5 COEFICIENTES
	     K1, K2, ERRO PELO METODO DE BURG
		+ MEDIA BPM E A ACELERAÇÃO


*******************************************************/

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
    coefs[4] = bpm_values[size_bpm];

     return;
}


/********************************************************

	      CALCULA DISTANCIA AOS CLUSTERS
	ADAPTADA CERTOS VALORES DE FORMA A REDUZIR
		      EFEITO DO RUIDO
		  (ir testando os valores)

*******************************************************/


float calcular_distancia_adaptativa(float* coefs, float* centro){
    float k1_p = 1, k2_p =1, e_p = 1, bpm_p = 1, acc_p = 1;
    float distancia;
    
    //mudar estes valores -> ir ajustando!!
    
    //erro baixo -> serie mais constante(tipo sono pesado)
    if(coefs[2] < 2){
    	k1_p= 0;
    	k2_p = 0;
    	e_p = 2;
    }
    
    //bpm altos, alta aceleração -> probably acordado, dar apenas valor a isso!
    if(coefs[3] > 80 || coefs[4] > 1){
        k1_p = 0;
        k2_p = 0;
        e_p = 0;
        acc_p = 0.5;
    
    }
    
    //aceleração moderada, valorizar bpms medios
    if(coefs[4] < 0.05){
    	bpm_p = 2;
    	acc_p = 0.5;
    }
    
    distancia = 0;
   
    distancia += k1_p * (coefs[0] - centro[0])*(coefs[0] - centro[0]); // k1
    distancia += k2_p * (coefs[1] - centro[1])*(coefs[1] - centro[1]); // k2
    distancia += e_p * (coefs[2] - centro[2])*(coefs[2] - centro[2]); // erro
    distancia += bpm_p * (coefs[3] - centro[3])*(coefs[3] - centro[3]); // bpm
    distancia += acc_p * (coefs[4] - centro[4])*(coefs[4] - centro[4]); // acc
    
    //printf("cluster_bpm: %f, coefs_bpm: %f, dist: %f\n", centro[3], coefs[3], distancia);

    return sqrt(distancia);



}


