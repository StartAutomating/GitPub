Write-FormatView -TypeName YamlHeader -Action {
    @("---"
    Format-YAML -InputObject $_
    "---") -join [Environment]::NewLine
}
