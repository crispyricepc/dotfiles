# Source the contents of .vscodeenv when using the integrated VSCode terminal
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  [ -f .vscodeenv ] && source .vscodeenv
fi