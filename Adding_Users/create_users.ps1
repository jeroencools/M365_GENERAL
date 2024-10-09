Connect-MgGraph -Scopes "User.ReadWrite.All"

# Import CSV
$data = Import-Csv -Path "$PSScriptRoot\users.csv"

# Loop through the csv
foreach ($row in $data) {
    $upn = $row.upn
    $displayName = $row.displayname
    $passwordProfile = @{ Password = $row.password; ForceChangePasswordNextSignIn = $false }
    $mailNickname = $row.mailnickname
    $companyName = $row.companyname
    $department = $row.department
    $jobTitle = $row.jobtitle

    # Creation of users
    New-MgUser -UserPrincipalName $upn -MailNickname $mailNickname -DisplayName $displayName -PasswordProfile $passwordProfile -AccountEnabled -CompanyName $companyName -Department $department -JobTitle $jobTitle
}

Read-Host -Prompt "Press Enter to exit"
