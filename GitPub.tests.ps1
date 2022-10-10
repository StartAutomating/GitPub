#requires -Module Pester
describe GitPub {
    it 'Has Sources' {
        Get-GitPub | 
            Select-Object -ExpandProperty Sources
    }    

    it 'Has Publishers' {
        Get-GitPub | 
            Select-Object -ExpandProperty Publishers
    }

    it 'Can treat GitHub issues as sources' {
        Get-GitPubIssue -Repository GitPub -UserName StartAutomating -IssueState all |
            Select-Object -ExpandProperty Title | 
                Should -belike '*'
    }

    it 'Can treat Gists as sources' {
        Get-GitPubIssue -UserName StartAutomating |
            Select-Object -ExpandProperty PostTitle | 
                Should -belike '*'
    }

    it 'Can treat Releases as sources' {
        Get-GitPubIssue -UserName StartAutomating -Repository PipeScript |
            Select-Object -ExpandProperty Title | 
                Should -belike '*'
    }

}
