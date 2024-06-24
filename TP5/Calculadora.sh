function suma {
        resultado=$(echo "$1 + $2" | bc)

}

function resta {
        resultado=$(echo "$1 - $2" | bc)

}

function multiplicacion {
        resultado=$(echo "$1 * $2" | bc)

}

function division {
    if (( $(echo "$2 == 0" | bc -l) )); then
        echo "Error: No puedes dividir por cero."
        resultado="Indefinido"
    else
        resultado=$(echo "scale=2; $1 / $2" | bc)
    fi
}

echo "Bienvenido a la calculadora simple!"
echo "Elige la operación que deseas realizar:"
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicación"
echo "4. División"
read -p "Elige tu opcion: " opcion

read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

case $opcion in
    1)
        suma $num1 $num2
        resultado=$(( num1 + num2 ))
	echo "Resultado de la suma: $resultado"
        ;;
    2)
        resta $num1 $num2
        resultado=$(( num1 - num2 ))
	echo "Resultado de la resta: $resultado"
        ;;
    3)
        multiplicacion $num1 $num2
        resultado=$(( num1 * num2 ))
	echo "Resultado de la multiplicacion: $resultado"
        ;;
    4)
        division $num1 $num2
        resultado=$(( num1 / num2 ))
	echo "Resultado de la division: $resultado"
        ;;

esac
