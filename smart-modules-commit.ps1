Write-Host "Starting Smart Terraform Commit for environment + modules..."

# 1️⃣ Commit environment changes together
git add environment

$envStatus = git status --porcelain environment
if ($envStatus) {
    git commit -m "chore(terraform): update environment configuration"
}
else {
    Write-Host "No environment changes detected."
}

# 2️⃣ Commit each module separately
$modulesPath = "modules"
$moduleFolders = Get-ChildItem -Path $modulesPath -Directory

foreach ($module in $moduleFolders) {

    $path = "$modulesPath\$($module.Name)"
    Write-Host "Processing module: $($module.Name)"

    git add $path

    $status = git status --porcelain $path
    if ($status) {
        $msg = "feat(terraform): update $($module.Name) module"
        git commit -m $msg
    }
    else {
        Write-Host "No changes in $($module.Name), skipping."
    }
}

# 3️⃣ Push everything once
git push

Write-Host "All environment and module changes pushed successfully!"
