#######################################################################
# OMAgentMgmtGroup DSC Resource
# DSC Resource to manage SCOM 2012 Agent Management Group settings.
# 201401127 - Joe Thompson, Infront Consulting Group
#######################################################################

#######################################################################
# The Get-TargetResource cmdlet.
#######################################################################
function Get-TargetResource
{
	param
	(	
		[parameter(Mandatory)]
		[String] $ManagementGroupName,
		[parameter(Mandatory)]
	
  	)

	Try { $objCfg = New-Object -ComObject AgentConfigManager.MgmtSvcCfg } 
	
	Catch { Throw "Monitoring Agent not installed." }


	
	If ($objMGs -contains $ManagementGroupName) 
	{
        	$objMG = $objCfg.GetManagementGroup($ManagementGroupName)
        	$returnValue = @{
			ManagementGroupName = $objMG.ManagementGroupName
            		ManagementServerName = $objMG.ManagementServer
		}
	}
    	Else
    	{
        	$returnValue = @{
            		ManagementGroupName = $null
            		ManagementServerName = $null
	        }
    	}

	$returnValue
}

######################################################################## 
# The Set-TargetResource cmdlet.
########################################################################
function Set-TargetResource
{
	param
	(	
        [ValidateSet("Present", "Absent")]
  	)

Try

#######################################################################
# The Test-TargetResource cmdlet.
#######################################################################
function Test-TargetResource
{
    [CmdletBinding()]
	param
	(	
        [ValidateSet("Present", "Absent")]
		[parameter(Mandatory)]
  	)

   
    Write-Verbose -Message "Checking if Monitoring Agent reports to $ManagementGroupName Management Group"

    Try
}

       

Export-ModuleMember -Function *-TargetResource