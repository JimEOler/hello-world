# 🌍 Hello World — Containerized Web Site
# Version 1.1

A simple Hello World HTML page served by Nginx, containerized with Docker, and automatically published to Docker Hub via GitHub Actions.

---

## 📁 Project Structure

```
hello-world/
├── index.html                    # The web page
├── Dockerfile                    # Container definition
├── docker-compose.yml            # Local dev shortcut
└── .github/
    └── workflows/
        └── deploy.yml            # CI/CD: auto-push to Docker Hub on merge to main
```

---

## 🚀 Quick Start

### 1. Create the GitHub Repository

```bash
# On github.com → New Repository → Name: hello-world → Public → Create
# Then clone it:
git clone https://github.com/jimeoler/hello-world.git
cd hello-world
```

### 2. Add the Files

Copy all files from this repo into your local clone, then:

```bash
git add .
git commit -m "Initial Hello World container"
git push origin main
```

### 3. Add GitHub Secrets for Docker Hub

In your GitHub repo → **Settings → Secrets and variables → Actions → New repository secret**, add:

| Secret Name          | Value                                      |
|---------------------|--------------------------------------------|
| `DOCKERHUB_USERNAME` | `jimeoler`                                 |
| `DOCKERHUB_TOKEN`    | Your Docker Hub Access Token (see below)   |

**To get a Docker Hub token:**
1. Log in at [hub.docker.com](https://hub.docker.com)
2. Go to **Account Settings → Security → New Access Token**
3. Copy the token and paste it as `DOCKERHUB_TOKEN` in GitHub

### 4. Create the Docker Hub Repository

On [hub.docker.com](https://hub.docker.com):
1. Click **Create Repository**
2. Name it `hello-world`
3. Set to **Public**
4. Click **Create**

### 5. Trigger the Pipeline

Every push to `main` will automatically build and push the image. You can also trigger it manually from the **Actions** tab in GitHub.

---

## 🖥️ Run Locally

### Option A — Docker Compose (easiest)

```bash
docker compose up --build
```

Then open [http://localhost:8080](http://localhost:8080)

### Option B — Plain Docker

```bash
docker build -t hello-world .
docker run -p 8080:80 hello-world
```

### Option C — Pull from Docker Hub (after CI runs)

```bash
docker pull jimeoler/hello-world:latest
docker run -p 8080:80 jimeoler/hello-world:latest
```

---

## 🔄 CI/CD Flow

```
git push → GitHub Actions → docker build → docker push → Docker Hub
```

Every commit to `main` produces two tags:
- `jimeoler/hello-world:latest`
- `jimeoler/hello-world:<git-sha>`

---

## 🛠️ Tech Stack

- **HTML5** — static page
- **Nginx Alpine** — lightweight web server (~25MB image)
- **Docker** — containerization
- **GitHub Actions** — CI/CD pipeline
- **Docker Hub** — container registry
