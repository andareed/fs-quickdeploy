import_forwarded_key() {

    # Get forwarded SSH keys
    mapfile -t KEYS < <(ssh-add -L 2>/dev/null)

    if [ ${#KEYS[@]} -eq 0 ]; then
        echo "No forwarded SSH keys found via ssh-agent."
        return 1
    fi

    # Display keys with numbers
    echo "Available forwarded SSH public keys:"
    for i in "${!KEYS[@]}"; do
        echo "[$i] ${KEYS[$i]}" | cut -c1-100
    done

    echo
    echo "Enter the number of the key to import, or 'q' to quit without importing."

    # Prompt user
    read -p "Your choice: " choice

    # Handle quit option
    if [[ "$choice" == "q" || "$choice" == "Q" ]]; then
        echo "No key imported. Exiting."
        return 0
    fi

    # Validate input
    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 0 ] && [ "$choice" -lt "${#KEYS[@]}" ]; then
        echo "${KEYS[$choice]}" >> ~/.ssh/authorized_keys
        echo "Key #$choice added to ~/.ssh/authorized_keys."
    else
        echo "Invalid selection."
        return 1
    fi
}

# If you have added your pubkeys to your sshagent, this will allow you easily import one to authorized keys.
# Easier method to stop having to add pub keys via github.
import_forwarded_key





