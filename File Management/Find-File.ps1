function Find-File {
	[CmdletBinding(
		SupportsShouldProcess = $true
	)]
	Param (
		[Parameter(
			Mandatory = $false,
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true
		)]
		[string[]]$ComputerName = $env:COMPUTERNAME,
		
		[Parameter(
			Mandatory = $true
		)]
		[string[]]$FileName
	)
	
	foreach ($Computer in $ComputerName) {
		foreach ($Name in $FileName) {
			Write-Verbose "Searching $Computer for $Name..."
			Get-ChildItem -Path "\\$Computer\c$" -File -Recurse -Force -ErrorAction Continue | Where-Object {
				$_.Name -like $Name
			} | Select-Object FullName
		}
	}
}

Find-File -FileName '*maid*' -Verbose