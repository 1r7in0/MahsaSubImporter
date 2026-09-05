# MahsaSubImporter

Automatically import the latest MahsaNet (MahsaNG) free subscriptions into v2rayN.

## Overview

MahsaNG (the popular Android client) has a built-in “Get Config” feature that fetches public free configurations from the MahsaNet community repository.  

This project provides a simple desktop script that does the same thing for **v2rayN** on Windows (PowerShell), with Linux/macOS support planned later.

It automates the manual process of:
1. Fetching the latest public configs from [mahsanet/MahsaFreeConfig](https://github.com/mahsanet/MahsaFreeConfig)
2. Importing them into v2rayN

## Features

- Fetches the latest community-donated free configs
- Imports them directly into v2rayN
- Simple one-command usage
- PowerShell version (Windows) first
- Bash version planned

## Requirements

- Windows 10/11
- [v2rayN](https://github.com/2dust/v2rayN) installed and running
- PowerShell 5.1 or newer (pre-installed on modern Windows)

## Usage

1. Make sure v2rayN is installed and open.
2. Download or clone this repository.
3. Run the script:

```powershell
.\MahsaSubImporter.ps1
```

The script will fetch the latest configs and import them into v2rayN.

> **Note:** Exact usage instructions will be updated once the script is released.

## How it works

The public free configurations are maintained in the [mahsanet/MahsaFreeConfig](https://github.com/mahsanet/MahsaFreeConfig) repository.  
These are the same configs that MahsaNG uses.

The script retrieves the latest subscription data and feeds it into v2rayN (via clipboard import or direct config handling), so you no longer need to manually copy-paste Base64 links.

## Disclaimer

- This project is **not** affiliated with MahsaNet or the MahsaNG developers.
- It only automates access to already public community configurations.
- Use at your own risk. The availability and quality of free configs depend on the upstream repository.
- This is not a VPN client itself — it only helps import configs into v2rayN.

## Contributing

Contributions are welcome.  
Please open an issue first if you want to propose significant changes.

## License

MIT

## Related

- [MahsaFreeConfig](https://github.com/mahsanet/MahsaFreeConfig) – Source of the free configurations
- [v2rayN](https://github.com/2dust/v2rayN) – Desktop client
- [MahsaNG](https://github.com/GFW-knocker/MahsaNG) – Android client
