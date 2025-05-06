
# Geant4 Docker Setup (Linux with GUI)

This repository provides a **ready-to-use Docker setup** for running [Geant4](https://geant4.web.cern.ch/) with Qt and OpenGL GUI support on Linux systems. It builds Geant4 from source and runs the **exampleB1** application inside the container.

---

## Features

- Geant4 11.2.1 built from source
- Qt5 and OpenGL support for full GUI visualization
- Includes all Geant4 datasets (via `-DGEANT4_INSTALL_DATA=ON`)
- Automatically builds and launches **exampleB1**
- Persists your simulation data via Docker volumes
- Minimal setup — no need to install Geant4 manually

---

## How to Use

### Prerequisites

- Linux (Ubuntu, Fedora, Arch, etc.)
- [Docker installed](https://docs.docker.com/get-docker/)
- X11 GUI working on your system (most Linux desktops support this)

Make sure your user is in the Docker group:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

Allow Docker GUI apps to access your display:

```bash
xhost +local:root
```

---

### Build and Run

1. **Clone the repository**:

```bash
git clone https://github.com/evagena/geant4-linux-docker.git
cd geant4-linux-docker
```

2. **Run the script**:

```bash
chmod +x run_geant4_linux.sh
./run_geant4_linux.sh
```

This will:
- Build the Docker image (if needed)
- Download and compile Geant4
- Build exampleB1
- Launch the GUI

---

## File Structure

- `Dockerfile` — Defines the full build environment and Geant4 installation
- `run_geant4_linux.sh` — Builds the Docker image and runs exampleB1 in an interactive GUI container

---

## Notes

- The container uses a persistent Docker volume called `geant4data` to store files in `/home/geant4user`
- You can modify the code inside the container and re-run the build to test changes

---

## Example Output

You’ll see the OpenGL visualization of the exampleB1 geometry, and can interact with it using Geant4 UI commands.

---

## Author

**Eleni Vagena**  
This setup was created for teaching and research purposes in Geant4-based simulation.
