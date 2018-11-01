#!/bin/bash
echo -e "Synchronizing Repository.";

export WB_REPO="origin";
export REMOTE_REPO="remote_hub";
fetchDetails="NO_OPERATION";
fetchDetails=`git pull`;
echo -e $fetchDetails;
if [ "Already up to date." == "Already up to date." ];
then
branchList=`git branch -r`;
while IFS= read -r var
do
branch=`echo -e "$var" | awk '{print $1}'`
if [[ $branch =  "$WB_REPO/"* &&  $branch !=  "$WB_REPO/HEAD"* ]]
then
op_branch=$branch;
	op_branch="$(sed "s|$WB_REPO/||g"<<<$op_branch)"
	echo -e "$op_branch"
	git checkout $op_branch;
	git pull $REMOTE_REPO $op_branch;
fi
done <<EOF
$branchList
EOF
else
echo -e "No changes in remote Repository $REMOTE_REPO"
fi
