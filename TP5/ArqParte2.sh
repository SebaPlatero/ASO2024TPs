API_KEY=9d38d43d00a3416bab7205415242306

function obtener_clima {
    ciudad="$1"
    respuesta=$(curl -s "http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$ciudad&aqi=no")

        
if command -v jq &> /dev/null; then
        local nombre_ciudad=$(echo $respuesta | jq -r '.location.name')
        local temperatura=$(echo $respuesta | jq -r '.current.temp_c')
        local condicion=$(echo $respuesta | jq -r '.current.condition.text')

        echo "Ciudad: $nombre_ciudad"
        echo "Temperatura: $temperatura °C"
        echo "Condición: $condicion"
fi
}

echo "Consulta el clima de cualquier ciudad."
read -p "Ingresa el nombre de la ciudad: " ciudad

obtener_clima "$ciudad"