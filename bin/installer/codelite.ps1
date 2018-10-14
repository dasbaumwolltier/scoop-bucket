Param($path)

# $tmpPath = "$path\_scoop_extract"

# mkdir $tmpPath -ErrorAction SilentlyContinue

# Write-Host "- 1/2 Extracting codelite 7zip archive..."

# 7z x -o"$tmpPath" $path\$installer > $null

# if($LASTEXITCODE -ne 0) 
# { 
#     exit "Exit code was $LASTEXITCODE" 
# }

# Write-Host "  done."

Write-Host "- Extracting codelite innosetup..."

Move-Item "$path\codelite*.exe" "$path\codelite.exe"
innounp -x -d"$path\_scoop_unpack" "$path\codelite.exe" > "$path\innounp.log"

if($LASTEXITCODE -ne 0)
{
    exit "Exit code was $LASTEXITCODE"
}

Get-ChildItem "$path\_scoop_unpack\{app}" -r | Move-Item -dest "$path" -force

Remove-Item -r -force "$path\_scoop_unpack"
# Remove-Item -r -force "$path\_scoop_extract"
Remove-Item -r -force "$path\innounp.log"

# Remove-Item "$path\$installer"
Write-Host "  done."

# Remove-Item $path\codelite.7z
# Move-Item $path\codelite*.exe $path\codelite.exe

