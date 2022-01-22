

$contenidosCarpeta = Get-Childitem E:\Archivos\Escritorio\Notas* -recurse -force 

Write-Host "ARCHIVOS A ABRIR" + $contenidosCarpeta + "\n" -ForegroundColor Green

foreach ($contenido in $contenidosCarpeta) {

    Write-Host "Abriendo archivo" + $contenido -ForegroundColor Yellow   
    Invoke-Item $contenido

}

$contenidosCarpeta = Get-Childitem E:\Archivos\Escritorio\La_Frecuencia_Kirlian* -recurse -force 

foreach ($contenido in $contenidosCarpeta) {

    Write-Host "Abriendo archivo" + $contenido -ForegroundColor Yellow   
    Invoke-Item $contenido

}



