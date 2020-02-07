<#
   
 Powershell Advanced Function
    
#>

function export-vcrolesreport

{
    
# Parameters
    [CmdletBinding()]
    param
    (
        #[Parameter(Mandatory=$true)]
        #[string]$Server,

        [Parameter(Mandatory=$false)]
        [string]$Path = '.\vcrolessreport.csv'
    )

BEGIN {
    $roles = @()

}
PROCESS{

    $roles += Get-VIRole | Select-Object @{N='VCENTER';E={$_.server}},Name,PrivilegeList
}

END{
    $roles | export-csv $Path -NoTypeInformation

}

}