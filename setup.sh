#!/bin/bash
# rc install - uncomment and adjust below to run all tests on a CLI release candidate
# az extension remove -n ml

# <az_ml_install>
az extension add -n ml -y
# </az_ml_install>

# Use a daily build
# az extension add --source https://azuremlsdktestpypi.blob.core.windows.net/wheels/sdk-cli-v2-public/ml-2.9.0-py3-none-any.whl --yes
# remove ml extension if it is installed
# if az extension show -n ml &>/dev/null; then
#     echo -n 'Removing ml extension...'
#     if ! az extension remove -n ml -o none --only-show-errors &>/dev/null; then
#         echo 'Error failed to remove ml extension' >&2
#     fi
#     echo -n 'Re-installing ml...'
# fi

# if ! az extension add --yes --source "https://azuremlsdktestpypi.blob.core.windows.net/wheels/sdk-cli-v2-public/ml-2.10.0-py3-none-any.whl" -o none --only-show-errors &>/dev/null; then
#     echo 'Error failed to install ml azure-cli extension' >&2
#     exit 1
# fi

# az version

## For backward compatibility - running on old subscription
# <set_variables>
## =======================================================
## MDC:  My specific data on AZure
## 
## Provide your subscription ID as shown in the above screenshot
## subscription_id="bc053bfe-d0db-4441-a3c5-b72dd779b219"
## Provide your Resource Group as shown in the above screenshot
## resource_group_name="BONINC-DSAZURE-LEARN" 
## Worksapace 
## workspace_name="DSAZURE_LEARN"
## =======================================================
## Linkage between Azure - GitHub
## =======================================================
GROUP="BONINC-DSAZURE-LEARN"
LOCATION="easus"
## Azure workspace
WORKSPACE="DSAZURE_LEARN"
# </set_variables>

# If RESOURCE_GROUP_NAME is empty, the az configure is pending.
RESOURCE_GROUP_NAME=${RESOURCE_GROUP_NAME:-}
if [[ -z "$RESOURCE_GROUP_NAME" ]]
then
    echo "No resource group name [RESOURCE_GROUP_NAME] specified, defaulting to ${GROUP}."
    # Installing extension temporarily assuming the run is on old subscription
    # without bootstrap script.

    # <az_configure_defaults>
    az configure --defaults group=$GROUP workspace=$WORKSPACE location=$LOCATION
    # </az_configure_defaults>
    echo "Default resource group set to $GROUP"
else
    echo "Workflows are using the new subscription."
fi
