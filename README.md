# refresh-repo

This repository contains a script (`refresh-repo.sh`) to refresh a local Git repository. The script takes a directory location as input, verifies the directory and its Git configuration, removes the directory and its contents, and then clones the repository again from the remote origin.

## Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/zaagsys/refresh-repo.git
    cd refresh-repo
    ```

2. Make the script executable:
    ```bash
    chmod +x refresh-repo.sh
    ```

3. Run the script with the directory path as an argument:
    ```bash
    ./refresh-repo.sh relative/path/to/directory
    ```

## Script Explanation

The script performs the following steps:

1. **Check if the directory path is provided**: If not, it exits with an error message.
2. **Verify if the directory exists**: If not, it exits with an error message.
3. **Resolve the absolute path of the directory**: This ensures correct operations regardless of the current working directory.
4. **Check if the directory is a Git repository**: If not, it exits with an error message.
5. **Get the Git remote URL**: If no remote URL is found, it exits with an error message.
6. **Remove the directory and its contents**: It uses the absolute path to ensure the correct directory is removed.
7. **Clone the repository again**: It clones the repository from the saved remote URL back into the original directory location.

## Example

To refresh a directory `my-repo` located in the current directory, use:

```bash
./refresh-repo.sh my-repo
```
If the directory does not exist, is not a Git repository, or has no remote URL configured, the script will exit with an appropriate error message.
