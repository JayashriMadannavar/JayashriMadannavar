$ie = New-Object -ComObject 'internetExplorer.Application'
$ie.Visible= $true # Make it visible

$myshell = New-Object -com "Wscript.Shell" 

$username="username/mobileNo."

$password="password"

$ie.Navigate("https://www.amazon.in/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.in%2F%3Fref_%3Dnav_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=inflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&")

While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;}

$usernamefield = $ie.document.getElementByID('ap_email') 
$usernamefield.value = "$username"

$passwordfield = $ie.document.getElementByID('ap_password')
$passwordfield.value = "$password"
  Start-Sleep -Seconds 5;
$myshell.sendkeys("{ENTER}")
  Start-Sleep -Seconds 5;
  

$message=($ie.Document.getElementsByTagName('h2') | Where{ $_.className -eq ‘a-color-base headline truncate-2line’ } ).innertext

#$message=($ie.Document.getElementsByTagName('div') | Where{ $_.className -eq "a-cardui fluid-fat-image-link fluid-card fluid-fat-image-link" -and $_.Id -eq "Hj4BAmwGr0J-x_vgvaeDuA"  } ).outertext

$Link = $ie.document.getElementByID('ysi_btn_login')
$Link.click()

$ie.Quit()