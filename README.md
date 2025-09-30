<!--suppress HtmlDeprecatedAttribute -->
<div style="display: flex;">
<img src="images/icon.png" align="left" style="margin: 40px 20px 0; width: 40px; height: 40px;" alt="Logo"/>
<h1>Custom VPN Controller</h1>
</div>

An [Alfred][1] workflow to manage L2TP VPN connections using macOS `scutil` command.

## Installation

1. Install the VPN Controller workflow
2. Configure your L2TP VPN connections in System Preferences > Network
3. Optionally set the `TTD_VPN_SECRET` environment variable for automatic secret handling

## Usage

In Alfred, type `vpn` to list your available VPN connections.

With the selected result, you can:

- press `⌅`(Enter) to connect or disconnect the VPN
- type to search/filter VPN connections by name

### Features

- **List VPN Connections**: Shows all configured L2TP VPN connections
- **Status Indicators**: 🔴 for connected, 🟢 for disconnected
- **Connect/Disconnect**: One-click VPN management
- **Search**: Filter connections by name
- **Secret Support**: Uses `TTD_VPN_SECRET` environment variable if set

## Dependencies

- macOS with `scutil` command (built-in)
- L2TP VPN connections configured in System Preferences

## Environment Variables

- `TTD_VPN_SECRET`: Optional VPN secret for automatic authentication

## Credits

The workflow uses macOS built-in `scutil` command for VPN management.

[OneUpdater][2] by Vítor Galvão for handling automatic updates.

[1]: https://www.alfredapp.com/
[2]: https://github.com/vitorgalvao/alfred-workflows/tree/master/OneUpdater
