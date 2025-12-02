# Files Host Project

This project sets up a file hosting server using Nginx, secured with Cloudflare Tunnel, and includes Qbittorrent for downloading files.

## Prerequisites

### Cloudflare Tunnel Setup

Before running this project, you need to set up a Cloudflare Tunnel to expose your local service securely.

1. **Log in to Cloudflare Zero Trust Dashboard**: Go to [one.dash.cloudflare.com](https://one.dash.cloudflare.com/).
2. **Create a Tunnel**: Navigate to **Access** > **Tunnels** and click **Create a Tunnel**.
3. **Name your Tunnel**: Give it a recognizable name (e.g., `files-host`).
4. **Choose Environment**: Select **Docker**.
5. **Get the Token**: You will see a command like `docker run ... --token <YOUR_TOKEN_HERE> ...`. **Copy only the token string** (the long string after `--token`). You will need this for the `.env` file.
6. **Configure Public Hostname**:
   * After saving the tunnel, go to the **Public Hostname** tab.
   * Add a public hostname (e.g., `files.yourdomain.com`).
   * **Service**: Choose `HTTP` and set the URL to `nginx-files-server:80` (this matches the container name in `docker-compose.yml`).

## Installation & Setup

1. **Clone the repository** (if you haven't already).
2. **Create the Environment File**:
   Copy the example environment file to creating your own `.env` file:

   ```bash
   cp .env.example .env
   ```
3. **Configure `.env`**:
   Open the `.env` file and update the values:

   * `DOMAIN`: Your domain name (e.g., `files.yourdomain.com`).
   * `CLOUDFLARE_TUNNEL_TOKEN`: Paste the Cloudflare Tunnel token you copied earlier.
   * `QBITTORRENT_USERNAME`: Desired username for Qbittorrent (see note below).
   * `QBITTORRENT_PASSWORD`: Desired password for Qbittorrent.
   * `USERNAME`: Username for Nginx Basic Authentication.
   * `PASSWORD`: Password for Nginx Basic Authentication.

   > **Note on Qbittorrent Credentials**: The `linuxserver/qbittorrent` image usually generates a random password on the first run which acts as a temporary password. Check the container logs (`docker-compose logs qbittorrent`) to find it. You can then change it in the Web UI. The variables in `.env` are provided for reference or if you choose to use a custom startup script/image.
   >

## Running the Project

Start the services using Docker Compose:

```bash
docker-compose up -d
```

## Usage

* **Files Server**: Access your configured domain (e.g., `https://files.yourdomain.com`).
* **Qbittorrent Web UI**: Access via `http://localhost:8080` (or map it through Cloudflare Tunnel as well if desired).

## Troubleshooting

* **Cloudflare Tunnel**: Check logs with `docker-compose logs cloudflared`.
* **Nginx**: Check logs with `docker-compose logs nginx`.
