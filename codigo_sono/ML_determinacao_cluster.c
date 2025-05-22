#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_VETORES 1000
#define N_FEATURES 11
#define N_DATA 3
#define K_CLUSTERS 3


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

     return;
}

void bpm_media(float* bpm_values, int size_bpm, float* coefs){
    int i=0;
    int media = 0;
    for(i=0; i<size_bpm; i++){
    	media += bpm_values[i];
    }
    media = media/size_bpm;
    coefs[3]= media;
    return;
}

void processar_dados(float* dados, float* coefs){
    int i;
    printf("dados %f %f %f %f %f %f %f %f %f %f %f \n", dados[0], dados[1], dados[2], dados[3], dados[4], dados[5], dados[6], dados[7], dados[8], dados[9], dados[10]);
    //para ignorar a acelaracao
    BurgCoef(dados, 10, coefs);
    bpm_media(dados, 10, coefs);
    coefs[4] = dados[10];
    printf("coeficieintes: %f, %f erro: %f, media: %f, acc: %f\n", coefs[0], coefs[1], coefs[2], coefs[3], coefs[4]);
}


void kmeans(float** coefs){
    int i = 0;
    int j, k melhor_cluster;
    int atribuicoes[N_DATA];
    float dis, min_dist;
    float centros[K_CLUSTERS][N_FEATURES];
    
    //inciializar centros
    for (k = 0; k < K_CLUSTERS; k++) {
        for (j = 0; j < N_FEATURES; j++) {
            centros[k][j] = ceofs[k][j];
        }
    }
    for (int iter = 0; iter < 100; iter++) {
        // Atribuir vetores aos clusters
        
        for (i = 0; i < N_DATA; i++) {
            min_dist = calcular_distancia_adaptativa(coefs[i], centros[0]);
            melhor_cluster = 0;
            for (k = 1; k < K_CLUSTERS; k++) {
                dist = calcular_distancia_adaptativa(dados[i], centros[k]);
                if (dist < min_dist) {
                    min_dist = dist;
                    melhor_cluster = k;
                }
            }
            atribuicoes[i] = melhor_cluster;
        }

        // Recalcular centros
        int contagem[K_CLUSTERS] = {0};
        float novos_centros[K_CLUSTERS][N_FEATURES] = {0};

        for (int i = 0; i < n_amostras; i++) {
            int cluster = atribuicoes[i];
            contagem[cluster]++;
            for (int j = 0; j < N_FEATURES; j++) {
                novos_centros[cluster][j] += dados[i][j];
            }
        }

        for (int k = 0; k < K_CLUSTERS; k++) {
            if (contagem[k] > 0) {
                for (int j = 0; j < N_FEATURES; j++) {
                    centros[k][j] = novos_centros[k][j] / contagem[k];
                }
            }
        }
    }
    
    
    
    
    

}





void ler_dados(const char* nome_ficheiro, float* dados, float** coefs) {
    FILE* dadostxt = fopen(nome_ficheiro, "r");
    if (!dadostxt) {
        printf("Erro ao abrir o ficheiro %s\n", nome_ficheiro);
        exit(1);
    }
    int i=0;

    while (fscanf(dadostxt, "%f %f %f %f %f %f %f %f %f %f %f", &dados[0], &dados[1], &dados[2], &dados[3], &dados[4], &dados[5], &dados[6], &dados[7], &dados[8], &dados[9], &dados[10]) == 11) {
    	//calcular lista de coeficientes
        processar_dados(dados, coefs[i]);
        i++;
        
    }
    kmeans(coefs);
    

    fclose(dadostxt);
}



int main(int argc, char *argv[]){
    
    float* dados = malloc(N_FEATURES * sizeof(float));
    if (dados == NULL) {
        printf("Erro a alocar memória.\n");
        return 1;
    }
    
    float** coeficientes = malloc(N_DATA * sizeof(float*));
    if (dados == NULL) {
        printf("Erro a alocar memória.\n");
        return 1;
    }
    int i;
    for (i = 0; i < N_DATA; i++) {
        coeficientes[i] = (float *)malloc(N_FEATURES * sizeof(float));
        if (coeficientes[i] == NULL) {
            fprintf(stderr, "Erro ao alocar memória  linha %d\n", i);
            return 1;
        }
    }



    ler_dados("dados_treino.txt", dados, coeficientes);
 
 
 
    //free memory
    for (i = 0; i < N_DATA; i++) {
        free(coeficientes[i]); 
    }
    free(coeficientes);
    free(dados);
    

    return 0;
}
