# Files Host Project

This project sets up a file hosting server using Nginx, secured with Cloudflare Tunnel, and includes a file manager and qBittorrent for downloading files.

## Prerequisites

### Cloudflare Tunnel Setup

Before running this project, you need to set up a Cloudflare Tunnel to expose your services securely.

1. **Log in to Cloudflare Zero Trust Dashboard**: Go to [one.dash.cloudflare.com](https://one.dash.cloudflare.com/).
2. **Create a Tunnel**: Navigate to **Networks** > **Tunnels** and click **Create a Tunnel**.
3. **Name your Tunnel**: Give it a recognizable name (e.g., `files-host`).
4. **Choose Environment**: Select **Docker**.
5. **Get the Token**: Copy only the token string from the provided docker command. You will need this for the `.env` file.
6. **Configure Public Hostnames**:
   You should set up hostnames for each service:
   
   | Service | Public Hostname (Example) | Service URL (Internal) | Auth |
   | :--- | :--- | :--- | :--- |
   | **Public Files** | `files.yourdomain.com` | `http://nginx-files-server:80` | Public |
   | **File Manager** | `manage.yourdomain.com` | `http://filebrowser:80` | App Login |
   | **Downloader** | `download.yourdomain.com` | `http://qbittorrent:8080` | App Login |

## Installation & Setup

1. **Clone the repository**.
2. **Create the Environment File**:
   ```bash
   cp .env.example .env
   ```
3. **Configure `.env`**:
   Update these values:
   * `CLOUDFLARE_TUNNEL_TOKEN`: Your Cloudflare Tunnel token.
   * `USERNAME`: Your desired username for both FileBrowser and qBittorrent.
   * `PASSWORD`: Your desired password.

## Running the Project

Start the services using Docker Compose:

```bash
docker-compose up -d
```

## Usage

* **Public File List**: Access via your main domain (e.g., `https://files.yourdomain.com`). This is read-only and public.
* **File Manager (FileBrowser)**: Access via your management domain. 
    * **Default Login**: `admin` / `admin` (Please change this in settings immediately!).
* **Downloader (qBittorrent)**: Access via your download domain.
    * **Login**: Use the `USERNAME` and `PASSWORD` you set in `.env`.