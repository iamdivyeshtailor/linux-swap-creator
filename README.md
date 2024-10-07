# Linux Swap Creator

## Description
`Linux Swap Creator` is a bash script that automates the process of creating swap memory on Linux systems. It first detects the Linux distribution and version, then prompts the user for the desired amount of swap memory (in GB) to be created. The script sets up the swap file and ensures that it's persistent across reboots by adding it to `/etc/fstab`.

## Features:
- Detects the Linux distribution and version.
- Prompts the user to specify the amount of swap to create (in GB).
- Sets up the swap file, activates it, and ensures it's permanent.
  
## Usage:
1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/linux-swap-creator.git
    ```

2. Navigate to the project directory:
    ```bash
    cd linux-swap-creator
    ```

3. Run the script (requires sudo):
    ```bash
    sudo ./create-swap.sh
    ```

4. Follow the prompts to create swap memory on your system.

## Requirements:
- Linux system with root access (sudo privileges).
