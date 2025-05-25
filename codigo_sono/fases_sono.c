#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Functions.h"

//ESTES VALORES PODEM (E VÃO) SOFRER ALTERAÇÕES!!
float Cluster[3][5] = {
    {0.0, 0.0, 0.0, 45.0, 0.03},
    {0.799536, 0.200074, 0.935187, 61.318180, 0.081364},
    {0.608558, 0.390305, 15.694570, 79.849998, 0.166000}
    };
//pesado -> leve-> acordado


//fase atual, fase anterior, fase anterior2
//fase atual não tem que ser necessáriamente a fase calculado de forma termos trasnsição mais suave;

int Fases_Sono[2] = {-1, -1};
    




/*******************************************************
		Metodos de Classificação

Coeficientes AR:
   -> a1: variabilidade consecutiva na série (quanto maior, menor a variabilide) SENSÍVEL AO RUÍDO[?]
   -> a2: variabilidade de 2 em 2
   -> erro: estabilidade da série total [testar consoante o tamanho da janela de dados]
   
Media de BPM da serie:
   -> verificar se para coeficientes indicadores de estabilidade não está associado um valor cardíaco elevado
 
 
Accelarometro:
   -> Valores elevados => acordado [o oposto não é válido]


*******************************************************/
int Cluster_kmeans(float *coefs){
    int i=0, cluster_atr=0;
    float dist = 0, min_dist = 0;

    min_dist = calcular_distancia_adaptativa(coefs, Cluster[0]);

    for (i = 1; i < 3; i++) {
    	dist = calcular_distancia_adaptativa(coefs, Cluster[i]);

    	if (dist < min_dist) {
            min_dist = dist;
            cluster_atr= i;
   	}
   }
   
   
   //DEBUGGING
   if(cluster_atr==0){
   	printf("sono pesado\n");
   }
   else if(cluster_atr==1){
   	printf("sono leve\n");
   }
   else{
   	printf("acordado\n");
   }
   
   return cluster_atr;



}

/*******************************************************

Atualizar fase atual consoante fases passadas -> permite corrigir erros de ruido etc
Evitar passar de profundo -> acordado -> profundo 

Guarda as ultimas fases de sono CALCULADAS 

ex:
fase atual calculada = acordada;
fase anterior calculada_2 = sono leve;
fase anterior calculada_1 = acordada;
PREVISÃO ESTÁVEL

fase atual calculada = acordada;
fase anterior calculada_2 = sono profundo;
fase anterior calculada_1 = sono leve;
PREVISÃO DUVIDOSA -> atualizar para sono leve esperar pelo próximo cálculo antes de atualizar

*******************************************************/


int Atualizacao_fase_passado(int fase_atual){
    
    //ainda nenhuma fase foi definida
    if(Fases_Sono[0] == -1){
    	Fases_Sono[0] = fase_atual;
    }
    else{
	Fases_Sono[1] = Fases_Sono[0];
    	if((Fases_Sono[1] - fase_atual) == -2){
    	    	Fases_Sono[0] = 1;    
    	}
    	else{
    	    Fases_Sono[0] = fase_atual;    
    	}
    
    
    }
    return Fases_Sono[0];




}

/*******************************************************

Classificar Sono

*******************************************************/


int ClassificarSono(float *bpm_values, int size){

    int fase;
    float coefs[5];
    
    BurgCoef(bpm_values, size-1, &coefs[0]);
    fase = Cluster_kmeans(&coefs[0]);
    fase = Atualizacao_fase_passado(fase);

    //printf("coeficieintes: %f, %f erro: %f, media: %f, acc: %f\n", coefs[0], coefs[1], coefs[2], coefs[3], coefs[4]);
   

    return fase;
}


//receber cenas e retornar aqui!!
//vetores pls do tamanho 10 e aceleração apenas uma média no fim tipo assim:
// {61.0, 62.0, 60.0, 61.0, 60.0, 62.0, 61.0, 60.0, 62.0, 60.0, 0.05}

int main(int argc, char *argv[]){
    
    
    float dados[11] = {61.0, 62.0, 60.0, 61.0, 60.0, 62.0, 61.0, 60.0, 62.0, 60.0, 0.05};
    int fase = 0;
    fase = ClassificarSono(dados, sizeof(dados)/sizeof(dados[0]));
    

    return fase+1;
}


