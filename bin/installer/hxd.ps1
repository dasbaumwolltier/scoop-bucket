Param($path, $installer, $version)

& "$path\_scoop_unpack\HxDSetup.exe" "/VERYSILENT /NOICONS /NORESTART /SUPPRESSMSGBOXES /TYPE=portable /DIR=$path"

if($LASTEXITCODE -ne 0)
{
    exit "Exit code was $LASTEXITCODE"
}

Remove-Item -r -force "$path\_scoop_unpack"