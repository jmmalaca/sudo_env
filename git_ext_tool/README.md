##Git Diff/Merge Tool
This tool is used so we can have and different look when doing `git diff` or `git merge`. Instead of using `vim` where I think is good but not good enought, with this external tool we have a good visualization of the changes on the files.

On this repository I already have the `P4V.dmg` for the instalation process but still, if you want you can download the latest version from [here](https://www.perforce.com/product/components/perforce-visual-merge-and-diff-tools) or even check from where I got the ideia, [here](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#External-Merge-and-Diff-Tools).

####Install
````bash
./make.sh
````

Note:
I left here the P4V.dmg file to try out the new [Git Large File Storage](https://github.com/tOOnPT/git-lfs). Using this I can have this `.dmg` file on the repo without spending 100MB os space because of it.To use it too don't forget to install it:
````bash
brew install git-lfs
````
and to start it:
````bash
git lfs init
````
You just need to do it once so having this the Git LFS is all setup. Just to make sure you can see that on this repo we have the `P4V.dmg` file track by it using this command `git lfs track`.