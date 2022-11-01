{% assign release = site.github.latest_release %}
{% assign winTag = release.name | append:'-win' %}
{% assign macTag = release.name | append:'-mac' %}
{% assign linuxTag = release.name | append:'-linux' %}

{% for asset in release.assets reversed %}
{% if asset.name contains '.blockmap' %}
{% continue %}
{% endif %}
{% if asset.name contains winTag and asset.name contains 'Installer' and asset.name contains '.exe' %}
{% if asset.name contains '64' %} {% assign winInstaller64 = asset.browser_download_url %}
{% elsif asset.name contains '32' %} {% assign winInstaller32 = asset.browser_download_url %} 
{% else %}{% assign winInstallerAll = asset.browser_download_url %} {% endif %}
{% continue %}
{% endif %}
{% if asset.name contains winTag and asset.name contains 'Portable' and asset.name contains '.exe' %}
{% if asset.name contains '64' %} {% assign winPortable64 = asset.browser_download_url %}
{% elsif asset.name contains '32' %} {% assign winPortable32 = asset.browser_download_url %} 
{% else %}{% assign winPortableAll = asset.browser_download_url %} {% endif %}
{% continue %}
{% endif %}

{% if asset.name contains winTag and asset.name contains '.zip' %}
{% if asset.name contains '64' %} {% assign winZip64 = asset.browser_download_url %}
{% elsif asset.name contains '32' %} {% assign winZip32 = asset.browser_download_url %} 
{% else %}{% assign winZipAll = asset.browser_download_url %} {% endif %}
{% continue %}
{% endif %}

{% if asset.name contains macTag %}
{% if asset.name contains '.dmg' %} {% assign macDmg64 = asset.browser_download_url %}
{% elsif asset.name contains '.pkg' %} {% assign macPkg64 = asset.browser_download_url %} 
{% else %}{% assign macZip64 = asset.browser_download_url %} {% endif %}
{% continue %}
{% endif %}

{% if asset.name contains linuxTag %}
{% if asset.name contains '.deb' %} {% assign linuxDeb64 = asset.browser_download_url %}
{% elsif asset.name contains '.AppImage' %} {% assign linuxApp64 = asset.browser_download_url %} 
{% else %}{% assign linuxZip64 = asset.browser_download_url %} {% endif %}
{% continue %}
{% endif %}
{% endfor %}

## Download TACT {{ release.tag_name }}

| Windows Installer | Windows Portable | Windows Compressesd |
| :---: | :----: | :---: | :---: |
| [All in One (exe)]({{winInstallerAll}}) | [All in One (exe)]({{winPortableAll}}) | [64-bit (zip)]({{winZip64}}) 
| [64-bit (exe)]({{winInstaller64}}) | [64-bit (exe)]({{winPortable64}}) | [32-bit (zip)]({{winZip32}}) |
| [32-bit (exe)]({{winInstaller32}}) | [32-bit (exe)]({{winPortable32}})

| MacOS (10.11+) | Linux (Ubuntu 14+) |
| :---: | :----: |
| [64-bit (dmg)]({{macDmg64}}) | [64-bit (deb)]({{linuxDeb64}}) |
| [64-bit (pkg)]({{macPkg64}}) | [64-bit (AppImage)]({{linuxApp64}}) |
| [64-bit (zip)]({{macZip64}}) | [64-bit (zip)]({{linuxZip64}}) |

{% assign openboard = site.data.openboard %}
## Download OpenBoard {{openboard.version}}

| Windows | MacOS (10.13+) | Linux (Ubuntu 18+) |
| :---: | :----: | :---: |
| [32-bit and 64-bit (exe)]({{openboard.win}}) | [64-bit (dmg)]({{openboard.mac}}) | [64-bit (deb)]({{openboard.linux}}) 

## [Download Open Sankoré v2.5.1 (ZIP)](https://drive.google.com/u/0/uc?id=1GLmUMq2n9anTj7CegkVUd26uJPmg4702&export=download)

## [Download Microsoft Visual C++ Redistributables (RAR)](https://drive.google.com/uc?id=1qivE7vZKDkjW5-nAH4oYiw5TXTeoRbJB&export=download)

#### [All TACT Releases]({{site.github.releases_url}})