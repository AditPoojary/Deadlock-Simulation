# 3D Deadlock Detection Simulator

An interactive Operating Systems educational visualizer that models a **Wait-For Graph** in Three.js and detects deadlock with Tarjan's strongly connected components (SCC) algorithm.

## Run

This package includes a local copy of Three.js and does not need an internet connection. Serve the directory with a local web server (opening the file directly can prevent JavaScript modules from loading). On Windows, double-click `START_SERVER.bat`, or run:

```bash
cd deadlock-simulator
python -m http.server 8000
```

Open `http://localhost:8000`.

## Architecture

`script.js` stores process vertices and wait-for edges, renders them as genuine 3D meshes/tubes in Three.js, produces a granular Tarjan DFS trace, and applies each trace event to the scene and log. The orbit camera supports pan, zoom, and rotation. Nodes are positioned deterministically in x/y/z space.

P1 → P2 means P1 is waiting for a resource held by P2. Tarjan identifies SCCs with discovery indices, low-link values, and a DFS stack. An SCC of size > 1, or a singleton with a self-loop, is reported as a deadlock group under the modeled assumptions.

## Features

- Six predefined scenarios: no deadlock, simple/two-node, three-node, multiple, self-loop, and complex system
- Add/remove processes and dependencies; duplicate dependencies are rejected
- Run, step, previous/next, autoplay/pause and reset execution controls
- Live execution log, process inspector, measured detection time, SCC/deadlock statistics
- 3D deadlocked node styling, directional 3D arrows, animated SCC group rings, labels, floor grid and camera views

## Complexity and limitations

Tarjan runs in **O(V + E)** time and **O(V)** auxiliary space. This is an educational simulator: it represents waits between processes rather than full resource allocation/availability semantics, and it is inspired by—not an exact reproduction of—the referenced paper.

## Research basis

“An Enhanced Deadlock Detection Methodology Using Tarjan’s Algorithm”, Adhi Neeraja et al., IEEE CSITSS 2024. DOI: [10.1109/CSITSS64042.2024.10816916](https://doi.org/10.1109/CSITSS64042.2024.10816916).

Future work could add import/export, force-directed layout, resource allocation graphs, and recorded execution traces.
