# raton_script.ps1
param()
$imageUrl = 'https://www.swissinno.com/files/user_upload/Waldmaus_Mobile.jpg'
$dest = Join-Path $env:USERPROFILE 'Desktop\raton.jpg'
$lnkName = 'R.lnk'

Write-Host "Descargando imagen..."
Try {
    Invoke-WebRequest -Uri $imageUrl -OutFile $dest -ErrorAction Stop
    Write-Host "Descargada en: $dest"
} Catch {
    Write-Host ("ERROR al descargar: {0}" -f $_.Exception.Message)
    Exit 1
}

Start-Sleep -Seconds 1

$lnkPath = Join-Path $env:USERPROFILE ("Desktop\" + $lnkName)
If (Test-Path $lnkPath) {
    try {
        Remove-Item -LiteralPath $lnkPath -Force -ErrorAction Stop
        Write-Host "$lnkName borrado."
    } catch {
        Write-Host ("No se pudo borrar {0}: {1}" -f $lnkName, $_.Exception.Message)
    }
} else {
    Write-Host "$lnkName no encontrado en el Escritorio."
}

Start-Sleep -Seconds 1
Exit 0

