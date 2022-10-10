if (-not $this.Files) { return '' }
if (-not $this.cachedBody) {
    $g = $this
    $firstFile = @(
        foreach ($prop in $this.files.psobject.Properties) {
            if ($prop.MemberType -eq 'ScriptProperty') { continue }        
            $prop;break
        }
    ).Value
    if ($firstFile.type -ne 'text/markdown') { return '' }
    if (-not $firstFile.raw_url) { return '' }    
    $bodyToCache = Invoke-RestMethod $firstFile.raw_url
    $bodyToCache
    $this | Add-Member NoteProperty cachedBody $bodyToCache -Force
} else {
    $this.cachedBody
}


