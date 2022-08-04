#!/bin/bash

control=5

echo "====================================="
echo "Solucionador de equações completas do 2º grau"
echo "====================================="
echo ""
echo "Este script resolve equações do 2º grau no formato f(x) = ax^2 + bx + c"

while [ "$control" -ne 4 ]; do

    control=5
    echo ""
    echo "====================================="
    echo ""
    echo -n "Insira o valor do coeficiente a: "
    coefa=a

    while [[ !("$coefa" =~ ^-?[0-9]+([.][0-9]+)?$) ]]; do

        read coefa

        if [[ !("$coefa" =~ ^-?[0-9]+([.][0-9]+)?$) ]]; then
            echo "Por favor insira um coeficiente válido"
            echo -n "Insira o valor do coeficiente a: "
        fi
    done

    if [ "$coefa" -eq 0 ]; then
        while [ "$coefa" -eq 0 ]; do

            echo "Por favor insira um coeficiente válido"
            echo -n "Insira o valor do coeficiente a: "
            read coefa

            if [ "$coefa" -ne 0 ]; then
                if [[ ("$coefa" =~ ^-?[0-9]+([.][0-9]+)?$) ]]; then
                break
                fi
            fi
        done
    fi

    echo -n "Insira o valor do coeficiente b: "
    coefb=b

    while [[ !("$coefb" =~ ^-?[0-9]+([.][0-9]+)?$) ]]; do
        read coefb
        if [[ !("$coefb" =~ ^-?[0-9]+([.][0-9]+)?$) ]]; then
            echo "Por favor insira um coeficiente válido"
            echo -n "Insira o valor do coeficiente b: "
        fi
    done

    echo -n "Insira o valor do coeficiente c: "
    coefc=c

    while [[ !("$coefc" =~ ^-?[0-9]+([.][0-9]+)?$) ]]; do

        read coefc

        if [[ !("$coefc" =~ ^-?[0-9]+([.][0-9]+)?$) ]]; then
            echo "Por favor insira um coeficiente válido"
            echo -n "Insira o valor do coeficiente c: "
        fi
    done

    echo ""
    echo "====================================="
    echo ""
    echo "Coeficientes aceitos."
    echo "Equação correspondente: f(x) = ($coefa) x^2 + ($coefb) x + ($coefc)"
    echo "Calculando raízes..."
    echo ""
    echo -n "Valor de delta: "
    echo "$coefb*$coefb-4*$coefa*$coefc" | bc -l

    if [ $(echo "$coefb*$coefb-4*$coefa*$coefc" | bc -l) -gt 0 ]; then
        echo "A equação possui duas raízes distintas, de valores:"
        echo -n "X1 = "
        echo "scale=3; (-1*$coefb+sqrt($coefb*$coefb4*$coefa*$coefc))/(2*$coefa)" | bc -l | awk '{printf "%.3f\n", $0}'
        echo -n "X2 = "
        echo "scale=3; (-1*$coefb-sqrt($coefb*$coefb4*$coefa*$coefc))/(2*$coefa)" | bc -l | awk '{printf "%.3f\n", $0}'

    elif [ $(echo "$coefb*$coefb-4*$coefa*$coefc" | bc -l) -eq 0 ]; then
        echo "A equação possui uma raiz de multiplicidade 2, de valor:"
        echo -n "X1 = "
        echo "scale=3; (-1*$coefb)/(2*$coefa)" | bc -l | awk '{printf "%.3f\n", $0}'
        echo -n "X2 = "
        echo "scale=3; (-1*$coefb)/(2*$coefa)" | bc -l | awk '{printf "%.3f\n", $0}'

    elif [ $(echo "$coefb*$coefb-4*$coefa*$coefc" | bc -l) -lt 0 ]; then
        echo "Como o valor de delta é menor que 0, a equação não apresenta nenhuma raiz real."
    fi

    echo ""
    echo "====================================="
    echo ""
    echo "Por favor, selecione uma opção para continuar:"
    echo "1) Exibir derivada de primeira ordem da equação"
    echo "2) Exibir integral indefinida da equação"
    echo "3) Resolver outra equação"
    echo "4) Sair"

    while [[ !("$control" =~ ^[3-4]$) ]]; do
        read control
        echo ""
        echo "====================================="
        echo ""
        case "$control" in
            1)
                termod1=$(echo "2*$coefa" | bc -l | awk '{printf "%.3f\n", $0}')
                echo "Calculando derivada de primeira ordem..."
                echo "f'(x) = ($termod1)x + ($coefb)"
                echo ""
                echo "====================================="
                echo ""
                echo "Por favor, selecione uma opção para continuar:"
                echo "1) Exibir derivada de primeira ordem da equação"
                echo "2) Exibir integral indefinida da equação"
                echo "3) Resolver outra equação"
                echo "4) Sair"
                ;;

            2)
                termoi1=$(echo "scale=3; $coefa/3" | bc -l | awk '{printf "%.3f\n", $0}')
                termoi2=$(echo "scale=3; $coefb/2" | bc -l | awk '{printf "%.3f\n", $0}')
                echo "Calculando integral indefinida..."
                echo "∫f(x)dx = ($termoi1)x^3 + ($termoi2)x^2 + ($coefc)x + C"
                echo ""
                echo "====================================="
                echo ""
                echo "Por favor, selecione uma opção para continuar:"
                echo "1) Exibir derivada de primeira ordem da equação"
                echo "2) Exibir integral indefinida da equação"
                echo "3) Resolver outra equação"
                echo "4) Sair"
                ;;

            3)
                echo "Próxima equação..."
                ;;

            4)
                echo "Fechando o programa..."
                ;;

            *)
                echo "Por favor, selecione uma opção válida"
                ;;

        esac
    done
done

echo "Status de saída: $?"
