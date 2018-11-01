#!/bin/bash
echo -e "Synchronizing Repository.";

export WB_REPO="origin";
export REMOTE_REPO="remote_hub";
fetchDetails=`git pull`;
if [ ${#fetchDetails} -ge 1 ]
then
branchList=`git branch -r`;
while IFS= read -r var
do
branch=`echo -e "$var" | awk '{print $1}'`
if [[ $branch =  "$WB_REPO/"* &&  $branch !=  "$WB_REPO/HEAD"* ]]
then
op_branch=$branch;
	echo -e "$op_branch"
	op_branch="$(sed "s|$WB_REPO/||g"<<<$op_branch)"
	echo -e "$op_branch"
fi
done <<EOF
$branchList
EOF
else
echo -e "No changes in remote Repository $REMOTE_REPO"
fi
