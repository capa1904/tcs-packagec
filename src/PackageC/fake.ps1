$skipPackageInstallion = $false

$dir = $pwd.Path
if ((Get-Variable MyInvocation -Scope Script).Value.MyCommand.Path -ne $null) {
  $dir = split-path (Get-Variable MyInvocation -Scope Script).Value.MyCommand.Path
}

$nuget = "$dir\.nuget\nuget.exe"
if (!(test-path $nuget)) { (new-object System.Net.WebClient).DownloadFile("https://nuget.org/nuget.exe", $nuget) }

if (!($skipPackageInstallion))
{
    dir $dir -recurse -filter packages.config |
    % { & $nuget install $_.FullName -o "$dir\packages" }
}

$fake = resolve-path $dir\packages\FAKE.*\tools\Fake.exe | select -last 1

$encodingSpecified = $False;
for ( $i = 0; ($i -lt $args.count) -and (!$encodingSpecified); $i++ ) {
        if(([string]$args[ $i ]).ToLower().StartsWith("encoding=")){ $encodingSpecified = $True}
}

if ($encodingSpecified){ & $fake @args }
else { & $fake @args encoding="UTF-8" }

exit $LASTEXITCODE