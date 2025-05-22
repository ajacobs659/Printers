###############################
#Brother#
################################
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$drivername = "Brother HL-L2350DW series"
$portName = "IP_192.168.81.254-2"
$PortAddress = "192.168.81.254"

###################
#Staging Drivers   #
###################
C:\Windows\System32\pnputil.exe /add-driver "$psscriptroot\gdi\BROHL17A.INF" /install

#######################
#Installing Drivers   #
#######################

Add-PrinterDriver -Name $drivername

##########################################################
#Install Printerport | check if the port already exist   #
##########################################################
$checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
if (-not $checkPortExists) 
{
Add-PrinterPort -name $portName -PrinterHostAddress $PortAddress
}

####################################
#Check if PrinterDriver Exists     #
####################################
$printDriverExists = Get-PrinterDriver -name $DriverName -ErrorAction SilentlyContinue


##################
#Install Printer #
##################
if ($printDriverExists)
{
Add-Printer -Name "Nurse-Station-Stickers" -PortName $portName -DriverName $DriverName
}
else
{
Write-Warning "Printer Driver not installed"
}

