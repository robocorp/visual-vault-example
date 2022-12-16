*** Settings ***
Documentation       Visual Robocorp Control Room Vault example. This Robot will visually show
...                 retreival of secrets from the vault.

Library             RPA.Robocorp.Vault
Library             RPA.Dialogs


*** Tasks ***
Retrieve the specified vault item
    Add heading    Choose a vault item
    Add text input    vault_item    label=Specify vault item
    ${result}=    Run dialog
    ${secret}=    Get secret    ${result.vault_item}
    Add heading    Vault contents of '${result.vault_item}'
    ${texts}=    Evaluate    [f'{k}: {s}' for k, s in $secret.items()]
    FOR    ${msg}    IN    @{texts}
        Add text    ${msg}
    END
    Run dialog
