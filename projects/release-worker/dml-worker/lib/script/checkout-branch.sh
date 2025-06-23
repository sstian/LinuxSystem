#I/bin/bash
repo_path_target-${global_inputs_arr["repo_path_target"]}
git_branch-${global_inputs_arr["git_branch"]}

original_path=`pwd`
echo -e "\nchange directory to repo path: ${repo_path_target}"
cd ${repo_path_target}

echo -e "\n>> git fetch --all" && git fetch --all
echo -e "\n>> git checkout ${git_branch}" && git checkout ${git_branch}

echo -e "\nchange directory to original path: ${original_path}"
cd ${original_path}
