features_folder=".devcontainer/features"
repo_name="https://github.com/devcontainers/features.git"

if [[ -e $features_folder ]]; then
    echo "Remove $features_folder bevore git clone"
    rm -fr $features_folder
fi

echo "create folder, and clone repository"
mkdir $features_folder
git clone $repo_name $features_folder
