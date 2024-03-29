programa {
    //Corrigir menu do A (Op��o E)
    inclua biblioteca Util-->u
    inteiro resultado, soma 
    inteiro limite=0
    caracter operadorCalculadora='Z'
    /*                                  -------------------------------  
                                                                                        MEN� PRINCIPAL!!!*/ 
    funcao cadeia menuPrincipal(){                                                              
        cadeia listaOpcao= "\n>>> CALCULADORA MULTIFUNCIONAL <<<\n"+"A - Calculadora tradicional\n"+
                                                 "B - Validador de CPF\n"+"C - Validador de CNPJ\n"+
                                           "D - Gerador de Matriz Transposta\n"+"E - Quero sair!\n"+
                                                                "\n    Digite a op��o desejada: \n"
        retorne listaOpcao
    } 
    /*                                  -------------------------------  
                                                                                CALCULADORA TRADICIONAL - L 106*/ 
    funcao inteiro calculadoraTradicional(inteiro digito1, inteiro digito2){
        
        /*se (operadorCalculadora=='+' ou operadorCalculadora=='-' ou operadorCalculadora=='/' ou operadorCalculadora=='*'){*/
            escolha(operadorCalculadora){
                caso '-':
		            resultado=digito1-digito2
		            digito1=0
		            digito2=0
		        retorne resultado
                caso '+':
		            resultado=digito1+digito2
		            digito1=0
		            digito2=0
		        retorne resultado
                caso '/':
		            resultado=digito1/digito2
		            digito1=0
		            digito2=0
		        retorne resultado
                caso '*':
		            resultado=digito1*digito2
		            digito1=0
		            digito2=0
		        retorne resultado
            }
      retorne resultado
    }
       /*                                  -------------------------------  
                                                                                     VALIDADOR DE CPF - L 147*/
    funcao inteiro validaCPF(inteiro CPF[],inteiro multiplicador){
        //Gerador de CPF: https://www.4devs.com.br/gerador_de_cpf
        //087.602.791-55
        //la�o pra calcular os digitos base do CPF
        
        se(multiplicador==11){
            limite=1
            soma=0
        }senao{
            limite=2
            soma=0
        }
        
        para(inteiro i=0; i<u.numero_elementos(CPF)-limite; i++){
                soma+=CPF[i]*multiplicador
                multiplicador-=1
                }
                
        inteiro restoDivisao=(soma)%11
        se (restoDivisao>=2){
            resultado=11-restoDivisao
        }senao{
            resultado=0
        }
        retorne resultado
        }
    /*                                  -------------------------------  
                                                                                    VALIDADOR DE CNPJ - L 186*/
    funcao inteiro validaCNPJ(inteiro CNPJ[],inteiro multiplicador){
        //Gerador de CNPJ: https://www.4devs.com.br/gerador_de_cnpj
        //la�o pra calcular os digitos base do CNPJ
        
        se(multiplicador==6){
            limite=1
            soma=0
        }senao{
            limite=2
            soma=0
        }
        para(inteiro i=0; i<u.numero_elementos(CNPJ)-limite; i++){
                soma+=CNPJ[i]*multiplicador
                multiplicador-=1
                se(multiplicador<2){
                    multiplicador=9
                }
            }

        inteiro restoDivisao=(soma)%11
        se (restoDivisao>=2){
            resultado=11-restoDivisao
        }
        retorne resultado
        }
    
    
    
    
    
    
    
	funcao inicio() {
	    inteiro digito1, digito2
	    caracter opcaoMenuPrincipal,  opcaoRepete
	    cadeia repete="zzz"
	    caracter opcaoIniciar='M'
	    cadeia opcaoErrada="Voc� informou uma op��o incorreta!\n"
	    
		escreva (menuPrincipal())
		leia (opcaoMenuPrincipal)
		
		enquanto (opcaoMenuPrincipal!='E'){
		    escolha (opcaoMenuPrincipal){
		        
		        //                                                                    CALCULADORA TRADICIONAL - L 17
		        caso ('A'):
		            limpa()
		            
		            
		            escreva("\nVoc� escolheu a calculadora tradicional!\n")
		            cadeia opcaoOperadorCalculadora=("Escolha a opera��o ideal:\n (+) Soma\t (-) Subtra��o\n (/) Divis�o\t (*) Multiplica��o\n (S) Voltar ao menu principal\n")
		            escreva(opcaoOperadorCalculadora)
                    leia(operadorCalculadora)
                    

                        enquanto(operadorCalculadora=='+' ou operadorCalculadora=='-' ou operadorCalculadora=='/' ou operadorCalculadora=='*'){
                            digito1=0
                            digito2=0
                            escreva("Informe o primeiro digito:\t")
                            leia(digito1)
                
                            escreva("Informe o segundo digito:\t")
                            leia(digito2)
                        
                            escreva("O resultado para o c�lculo solicitado �:\t"+(calculadoraTradicional(digito1, digito2))+"\n"+"\n")
                            //                                                           MODELO DE REPETI��O DE FUN��O!
                            repete=("Deseja realizar mais algum calculo?\t (S) Sim\t (N) N�o\n")
                            //PADR�O REPETI��O!!!
                            escreva(repete)
                            leia(opcaoRepete)
                            enquanto (opcaoRepete!='S' e opcaoRepete!='N'){
                                limpa()
                                escreva(opcaoErrada)
                                escreva(repete)
                                leia(opcaoRepete)
                                }
                            se(opcaoRepete=='S' e opcaoRepete!='N'){
                                limpa()
                                escreva(opcaoOperadorCalculadora)//Adaptar
                                leia(operadorCalculadora)//Adaptar
                                }senao se (opcaoRepete=='N'){
                                    limpa()
                                    escreva (menuPrincipal())
		                            leia (opcaoMenuPrincipal)
                                    pare
                                }
                            
                        }   
                    
                        se(operadorCalculadora!='S' e operadorCalculadora!='E' e operadorCalculadora!='+' e operadorCalculadora!='-' e operadorCalculadora!='/' e operadorCalculadora!='*'){
                            limpa()
                            escreva(opcaoErrada)
                            escreva(opcaoOperadorCalculadora)
                            leia(operadorCalculadora)
                            pare
                            
                        }senao se (operadorCalculadora=='S'){
                            escreva (menuPrincipal())
		                    leia (opcaoMenuPrincipal)
                            pare
                        }
                    pare
                        
                    
		        
		        //                                                                             VALIDADOR DE CPF - L 38
		        caso ('B'):
		            limpa()
		            escreva ("Voc� escolheu o Validador de CPF!\n")
		            
		            enquanto(opcaoIniciar=='M'){
		                inteiro CPF[11]={0,0,0,0,0,0,0,0,0,0,0}
		                para(inteiro i=0; i<11;i++){
	   	                    escreva("Informe o "+(i+1)+"� n�mero do CPF:\n")
	   	                    leia(CPF[i])
	   	                }
	   	            
    		            //verificador(CPF,multiplicador)
		                digito1=validaCPF(CPF,10)
		                digito2=validaCPF(CPF,11)
		
		                escreva ("Primeiro digito verificador:"+digito1+"\n")
	    	            escreva ("Segundo digito verificador:"+digito2+"\n")
		
		
		                se (CPF[9]==digito1 e CPF[10]==digito2){
		                    escreva("CPF v�lido!\n")
		                }senao{
		                    escreva("CPF inv�lido!\n")
		                }
		                repete=("Deseja verificar mais algum CPF?\t (S) Sim\t (N) N�o\n")
                        //PADR�O REPETI��O!!!
                            escreva(repete)
                            leia(opcaoRepete)
                            enquanto (opcaoRepete!='S' e opcaoRepete!='N'){
                                limpa()
                                escreva(opcaoErrada)
                                escreva(repete)
                                leia(opcaoRepete)
                                }
                            se(opcaoRepete=='S' e opcaoRepete!='N'){
                                limpa()
                                opcaoIniciar='M'//Adaptar
                                }senao se (opcaoRepete=='N'){
                                    limpa()
                                    escreva (menuPrincipal())
		                            leia (opcaoMenuPrincipal)
                                    pare
                                }
		            }
		            pare
		        
		        //                                                                              VALIDADOR DE CNPJ - L 62
		        caso ('C'):
		            limpa()
		            escreva("Voc� escolheu o validador de CNPJ!\n")
		            //Gerador de CNPJ: https://www.4devs.com.br/gerador_de_cnpj
		            /*inteiro CNPJ[]={1,8,5,1,0,4,3,5,0,0,0,1,4,1}*/

		            enquanto(opcaoIniciar=='M'){
		                inteiro CNPJ[14]={0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	   	                para(inteiro i=0; i<14;i++){
	   	                    escreva("Informe o "+(i+1)+"� n�mero do CNPJ:\n")
	   	                    leia(CNPJ[i])
	   	                    }

	                    //verificador(CNPJ,multiplicador)
		                digito1=validaCNPJ(CNPJ,5)
		                digito2=validaCNPJ(CNPJ,6)
		                escreva ("Primeiro digito verificador:"+digito1+"\n")
	    	            escreva ("Segundo digito verificador:"+digito2+"\n")
		
		                se (CNPJ[12]==digito1 e CNPJ[13]==digito2){
		                    escreva("CNPJ v�lido!\n")
		                }senao{
		                    escreva("CNPJ inv�lido!\n")
		                }
		                repete=("Deseja verificar mais algum CNPJ?\t (S) Sim\t (N) N�o\n")
                        //PADR�O REPETI��O!!!
                            escreva(repete)
                            leia(opcaoRepete)
                            enquanto (opcaoRepete!='S' e opcaoRepete!='N'){
                                limpa()
                                escreva(opcaoErrada)
                                escreva(repete)
                                leia(opcaoRepete)
                                }
                            se(opcaoRepete=='S' e opcaoRepete!='N'){
                                limpa()
                                opcaoIniciar='M'//Adaptar
                                }senao se (opcaoRepete=='N'){
                                    limpa()
                                    escreva (menuPrincipal())
		                            leia (opcaoMenuPrincipal)
                                    pare
                                }
		            }
		            pare
		        
		        //                                                                      GERADOR DE MATRIZ TRANSPOSTA - SEM FUN��O CORRESPONDENTE
		        caso ('D'):
		            limpa()
		            escreva ("Voc� escolheu o Gerador de Matriz Transposta!\n")
		            
		            enquanto(opcaoIniciar=='M'){
		            /*inteiro vetorMatriz[6]={0,0,0,0,0,0}*/
		            inteiro c, l
		            inteiro matrizO[2][3]={{0,0,0},
	   	                                       {0,0,0}}
	   	            para(l=0;l<2;l++){
		              para (c=0;c<3;c++){
		                  escreva("Informe o "+(c+1)+"� n�mero para a "+(l+1)+"� linha:\n")
		                  leia(matrizO[l][c])
		              }escreva("\n")
                    }
		            
		            
		            
		                /*para(inteiro i=0; i<6;i++){
	   	                    escreva("Informe o "+(c+1)+"� n�mero para a "+(l+1)+"� linha:\n")
	   	                    leia(vetorMatriz[i])
	   	                    c++
	   	                    se(i==2){
	   	                        l++
	   	                        c=0
	   	                    }
	   	                }*/


	   	                escreva("A matriz original informada �:\n")
	   	                para(l=0;l<2;l++){
		                    para (c=0;c<3;c++){
		                        escreva(matrizO[l][c]+"\t")
		                    }escreva("\n")
                        }
	   
	   	                escreva("\nMatriz transposta:\n")
	   	                escreva("A matriz transposta correspondente �:\n")
	   	                inteiro matrizT[3][2]={{0,0},
                                               {0,0},
                                               {0,0}}
                        inteiro i=0
           	   	        para(l=0;l<3;l++){
		                    para (c=0;c<2;c++){
		                        matrizT[l][c]=matrizO[c][l]
		                        escreva (matrizT[l][c]+"\t")
		                        i++
		                    }escreva("\n")
                        }
                            repete=("Deseja gerar mais alguma matriz transposta?\t (S) Sim\t (N) N�o\n")
                            //PADR�O REPETI��O!!!
                            escreva(repete)
                            leia(opcaoRepete)
                            enquanto (opcaoRepete!='S' e opcaoRepete!='N'){
                                limpa()
                                escreva(opcaoErrada)
                                escreva(repete)
                                leia(opcaoRepete)
                                }
                            se(opcaoRepete=='S' e opcaoRepete!='N'){
                                limpa()
                                opcaoIniciar='M'//Adaptar
                                }senao se (opcaoRepete=='N'){
                                    limpa()
                                    escreva (menuPrincipal())
		                            leia (opcaoMenuPrincipal)
                                    pare
                                }
		            }
		            pare
		        
		        caso contrario:
		            limpa()
		            escreva(opcaoErrada + "Tente novamente...\n")
                    escreva (menuPrincipal())
		            leia (opcaoMenuPrincipal)
		            pare
		        
		    }
		}
	}
}
