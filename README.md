# Scripts for a GregTech: New Horizons server

To use these scripts for a GTNH server rooted in \<root\>, clone this repository into \<root\>/scripts (the subdirectory can have an arbitraty name, all are viable except *run*).

## Script overview

Scripts retreival:

- get_scripts.sh: Script for retreiving the whole repository

Server setup:
- config.sh: Common configuration for all scripts
- install_gtnh.sh: Create a GTNH server installation based on a given server files ZIP archive URL
- run_container.sh: Start a docker container for running the server

Running the actual server:
- run_server.sh: Run the actual server

## Procedure

Install:
1. curl https://raw.githubusercontent.com/maboxi/gtnh-server-scripts/refs/heads/main/get_scripts.sh | bash
2. scripts/install_gtnh.sh \<GTNH Server Files ZIP archive URL\>

Run:
scripts/run_container.sh \<memory for JVM\>