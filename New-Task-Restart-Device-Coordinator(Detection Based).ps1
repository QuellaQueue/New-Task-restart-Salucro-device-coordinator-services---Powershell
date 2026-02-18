
#This Script is designed to create a trio of scheduled tasks, each of which is listening for an error event from 
#each of the services supporting the Salucro device, so it can reset the device Coordinator Service in response.

#Variables
$Service= "Salucro_Device_Coordinator_Service"
$Trigger= New-ScheduledTaskTrigger -Once
$User= "NT AUTHORITY\SYSTEM"
$action=New-ScheduledTaskAction -Execute "Restart-Service $Service"
$EventID= "254"

#Below is the trigger subscribing to listening for the event with an ID matching our EventID Variable overrrrrrrrrrrrrrrrrr here vvvvvv
$Trigger.Subscription = 
@"
<QueryList><Query Id="0" Path="System"><Select Path="System">*[System[Provider[@Name='Microsoft-Windows-Eventlog'] and EventID=$EventID]]</Select></Query></QueryList>
"@



$Trigger.Enabled = $True 

Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "  Startup"  -Description 'test' -User $User -Force 