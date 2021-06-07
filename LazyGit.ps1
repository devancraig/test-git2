$branch = Read-Host "Please enter your branch name: "
$commitMessage = Read-Host "Please enter your commit message: "

function LoopLazyGitByFolder {
    $folderPathArray = "test-git", "test-git2"

    foreach ($gitFolder in $folderPathArray)
    {
        Set-Location -Path "~\Documents\LocalRepo\$gitFolder"
        LazyGit
    }
}

function GitCommands {
    $spaceRemovedBranch = $branch -replace '\s', '' 
    # Git Commands #
    git pull
    git checkout -b $spaceRemovedBranch
    git checkout $spaceRemovedBranch
    git add .
    git commit -a -m "$commitMessage"
    git push --set-upstream origin $spaceRemovedBranch
}

function LazyGit {
    git status
    Write-Host 'Press q to quit or press any other key to continue...';
    $keyPressed = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

    if($keyPressed.Character -notlike 'q') {
        GitCommands
    }
}

LoopLazyGitByFolder