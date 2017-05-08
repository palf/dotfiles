#!/usr/bin/env sh

cd ~/projects               ; tmux new -s _projects -d
cd ~/projects/cove/cove-lib ; tmux new -s cove -d
cd ~/projects/drive         ; tmux new -s drive -d
cd ~/projects/habito/engine ; tmux new -s engine -d
cd ~/projects/habito/web    ; tmux new -s web -d
cd ~                        ; tmux a
