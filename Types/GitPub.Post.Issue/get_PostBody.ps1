$hasReferences = $this.Body -match '\#\d+'

if (-not $hasReferences) { return $this.Body }

$repoRoot = $this.html_url -replace '\/issues.+$'

[Regex]::Replace($this.Body, "\#(?<i>\d+)", {
    param($match)
    "[#$($match.Groups['i'].Value)]($repoRoot/issues/$(
        $match.Groups['i'].Value
    ))"
})

