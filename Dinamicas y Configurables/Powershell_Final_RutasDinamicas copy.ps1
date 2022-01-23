
function abrirArchivosEnCarpeta($ubicacion) {
    
    #Si la ubicacion/directorio de la carpeta no es vacia, Vuamos 
    if (![string]::IsNullOrWhiteSpace($ubicacion)) {   

        $contenidosCarpeta = Get-Childitem $ubicacion -recurse -force 

        Write-Host "ARCHIVOS A ABRIR" + $contenidosCarpeta + "\n" -ForegroundColor Green

        foreach ($contenido in $contenidosCarpeta) {

            Write-Host "Abriendo archivo" + $contenido -ForegroundColor Yellow   
            Invoke-Item $contenido

        }
    }
}

function verRuta($rutaNombre) {
    Write-Host "Viendo ruta"  $rutaNombre -ForegroundColor Blue   
}

function verContenidoRuta($rutaNombre) {

    $contenidosCarpeta = Get-Childitem $rutaNombre -recurse -force 

    foreach ($contenido in $contenidosCarpeta) {

        Write-Host "Viendo Contenido Ruta " $contenido -ForegroundColor Blue   

    }

}

function verContenidoArray($rutaNombre) {

    foreach ($r in $rutaNombre) {

        Write-Host "Viendo Contenido Array: " $r -ForegroundColor Blue   

    }

}


#Buscar el archivo de settings en el path relativo
$relativePath = $PWD.Path.Trim() 


#Buscar el archivo de settings en el path relativo
$configs = Get-Content $relativePath\settings.json | ConvertFrom-Json

Write-Host "Viendo ruta"  $relativePath\settings.json -ForegroundColor DarkMagenta 

#Buscar el archivo de files en el path relativo
Write-Host "Viendo ruta"  $relativePath\files.json -ForegroundColor DarkMagenta 

#Buscar en el json
 $arrayRutas = Get-Content $relativePath\files.json | ConvertFrom-Json  


$ingnorarExecutables = $configs.ignorarExe


# Todo, Implementar filtrado de elementos del array por 
# medio de filtrar los elementos con . exe 

#volverlo modular y expandible
if (ingnorarExecutables) {

    

}




foreach ($ruta in $arrayRutas) {
     abrirArchivosEnCarpeta($ruta)
}

