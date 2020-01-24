Function Get-File {
    [CmdletBinding(DefaultParameterSetName = 'SingleExtension')]
    [OutputType([psobject[]])]
    param (
        [Parameter(Mandatory=$false, ParameterSetName = 'SingleExtension')]
        [string]
        $TypeName = 'All Files (*.*)',

        [Parameter(Mandatory=$false, ParameterSetName = 'SingleExtension')]
        [string]
        $TypeExtension = '*',

        [Parameter(Mandatory=$false, ParameterSetName = 'MultipleExtensions')]
        [string[]]
        $MultipleExtensions,

        [Parameter(Mandatory=$false)]
        [switch]
        $MultipleFiles,

        [Parameter(Mandatory=$false)]
        [ValidateScript({
            if (-not (Test-Path $_ )) {
                throw "The path [$_] was not found."
            } else { $true }
        })]
        [string[]]
        $InitialDirectory = $PSScriptRoot,

        [Parameter(Mandatory=$false)]
        [string]
        $Title = 'Select a file'
    )

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.Title = $Title
    $OpenFileDialog.InitialDirectory = $InitialDirectory

    if ($PSCmdlet.ParameterSetName -eq 'MultipleExtensions' ) {
        foreach ($Extension in $MultipleExtensions) {
            $TypeExtensionName += "*.$Extension, "
            $TypeExtensionFilter += "*.$Extension; "
        }
        $TypeExtensionName = $TypeExtensionName.TrimEnd(', ')
        $TypeExtension = $TypeExtension.TrimEnd('; ')
        $OpenFileDialog.Filter = "$TypeName ($TypeExtensionName)| $TypeExtensionFilter"
    } else {
        $OpenFileDialog.Filter = "$TypeName (*.$TypeExtension)| *.$TypeExtension"
    }

    $OpenFileDialog.ShowHelp = $true
    $OpenFileDialog.ShowDialog() | Out-Null

    try {
        if ($MultipleFiles) {
            foreach ($FileName in $OpenFileDialog.FileNames) { Get-Item $FileName }
        } else {
            Get-Item $OpenFileDialog.FileName
        }
    } catch { } # User closed the window or hit Cancel, return nothing
}