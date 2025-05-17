#include <math.h>


void ClassificarSono(float *vetor, float acc){

    


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
void Cluster_kmeans(float *vetor){



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
    
    
    //só para testar
    //vetor com a1, a2 e accelaração
    float vetor[3] = {1.5, 0.76, 10};
    

    return 0;
}


