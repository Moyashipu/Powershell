Function Test-Credential {
    [OutputType([Bool])]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeLine = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias('PSCredential')] 
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [String]
        $Domain = $Credential.GetNetworkCredential().Domain
    )

    Begin {
        [System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices.AccountManagement") |
            Out-Null

        $principalContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext(
            [System.DirectoryServices.AccountManagement.ContextType]::Domain, $Domain
        )
    }

    Process {
        foreach ($item in $Credential) {
            $networkCredential = $Credential.GetNetworkCredential()

            Write-Output -InputObject $(
                $principalContext.ValidateCredentials(
                    $networkCredential.UserName, $networkCredential.Password
                )
            )
        }
    }

    End {
        $principalContext.Dispose()
    }
}