function Get-RelativePath {
    param($path, $relativeTo)
    # strip trailing slash
    $relativeTo = Join-Path `
                      (Split-Path -Parent $relativeTo) `
                      (Split-Path -Leaf $relativeTo)
    $relPath = Split-Path -Leaf $path
    $path = Split-Path -Parent $path
    do {    
        $leaf = Split-Path -Leaf $path
        $relPath = Join-Path $leaf $relPath
        $path = Split-Path -Parent $path
    } until (($path -eq $relativeTo) -Or ($path.Length -eq 0))
    $relPath
}


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




$root = "C:\"
$current = "C:\"
$tmp = Get-Location
Set-Location $root
Resolve-Path -relative $current
Set-Location $tmp

Write-Host "Viendo ruta"  $tmp\settings.json -ForegroundColor DarkMagenta 


#Buscar el archivo de settings en el path relativo
# $relativePath = $PWD.Path.Trim() 

# Write-Host "Viendo ruta"  $relativePath\settings.json -ForegroundColor DarkMagenta 

#Buscar en el json
 $arrayRutas = Get-Content $tmp\settings.json | ConvertFrom-Json  

 foreach ($ruta in $arrayRutas) {
     abrirArchivosEnCarpeta($ruta)
 }

