#!/bin/bash
# setup-labels.sh
# Script to create/update labels on a GitHub repository using the GitHub CLI (gh)
# Usage: ./setup-labels.sh <owner/repo> [--delete-default]
# Note: Ensure you make this file executable using: chmod +x scripts/setup-labels.sh

REPO=$1
DELETE_DEFAULT=$2

if [ -z "$REPO" ]; then
  echo -e "\033[0;31mError: Repository not specified.\033[0m"
  echo "Usage: $0 <owner/repo> [--delete-default]"
  exit 1
fi

echo -e "\033[0;34mSetting up labels for $REPO...\033[0m"

if [ "$DELETE_DEFAULT" == "--delete-default" ]; then
  echo -e "\033[0;33mDeleting default labels...\033[0m"
  DEFAULT_LABELS=("bug" "documentation" "duplicate" "enhancement" "good first issue" "help wanted" "invalid" "question" "wontfix")
  for label in "${DEFAULT_LABELS[@]}"; do
    gh label delete "$label" --repo "$REPO" --yes 2>/dev/null
  done
fi

echo -e "\033[0;32mCreating custom labels...\033[0m"

# Define labels: name|color|description
LABELS=(
  "idea: new|0E8A16|Newly submitted idea"
  "idea: discussing|1D76DB|Idea is being discussed"
  "idea: approved|5319E7|Idea has been approved for implementation"
  "idea: in-progress|FBCA04|Idea is being implemented"
  "idea: completed|0E8A16|Idea has been implemented and merged"
  "idea: declined|B60205|Idea was declined"
  "cat: feature|D93F0B|New feature or enhancement"
  "cat: tool|E99695|Developer tool or utility"
  "cat: design|BFD4F2|Design or UI related"
  "cat: integration|C2E0C6|Integration with external service"
  "cat: docs|0075CA|Documentation improvement"
  "priority: low|C5DEF5|Nice to have"
  "priority: medium|FBCA04|Important"
  "priority: high|B60205|Critical"
  "good first idea|7057FF|Great for newcomers"
  "help wanted|008672|Extra attention is needed"
  "needs discussion|D876E3|Needs more community input"
  "bug|D73A4A|Something isn't working"
)

for entry in "${LABELS[@]}"; do
  IFS='|' read -r name color description <<< "$entry"
  
  # Trim spaces
  name="${name#"${name%%[![:space:]]*}"}"
  name="${name%"${name##*[![:space:]]}"}"
  color="${color#"${color%%[![:space:]]*}"}"
  color="${color%"${color##*[![:space:]]}"}"
  description="${description#"${description%%[![:space:]]*}"}"
  description="${description%"${description##*[![:space:]]}"}"
  
  # Try to edit existing or create new
  if gh label edit "$name" --color "$color" --description "$description" --repo "$REPO" 2>/dev/null; then
    echo -e "\033[0;32mUpdated label:\033[0m $name"
  elif gh label create "$name" --color "$color" --description "$description" --repo "$REPO" 2>/dev/null; then
    echo -e "\033[0;32mCreated label:\033[0m $name"
  else
    echo -e "\033[0;31mFailed to create or update label:\033[0m $name"
  fi
done

echo -e "\033[0;34mLabel setup complete!\033[0m"
