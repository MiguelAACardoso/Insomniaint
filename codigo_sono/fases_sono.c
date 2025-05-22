#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "Functions.h"

//ESTES VALORES PODEM (E VÃO) SOFRER ALTERAÇÕES!!
float Cluster[3][5] = {
    {0.0, 0.0, 0.0, 45.0, 0.03},
    {0.608558, 0.390305, 15.694570, 79.849998, 0.166000},
    {0.799536, 0.200074, 0.935187, 61.318180, 0.081364}
    };
    

void ClassificarSono(float *bpm_values){

    float *coefs = (float *)malloc(5 * sizeof(float));
    if (coefs == NULL) {
    	fprintf(stderr, "Erro ao alocar memória\n");
        return;
    }
    
    BurgCoef(bpm_values, 10, coefs);
    Cluster_kmeans(coefs);

    printf("coeficieintes: %f, %f erro: %f, media: %f, acc: %f\n", coefs[0], coefs[1], coefs[2], coefs[3], coefs[4]);
   



    return;
}


//idk if i wont need data training??
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
void Cluster_kmeans(float *coefs){



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


void Atualizacao_fase_passado(){




}

int main(int argc, char *argv[]){
    
    
    float dados[11] = {80.0, 81.0, 82.0, 84.0, 87.0, 83.0, 85.0, 86.0, 88.0, 85.0, 0.2};
    ClassificarSono(dados);
    

    return 0;
}


