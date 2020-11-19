# Setting up an Azure Data Science VM to use with the Fast.ai course

Instructions are [here](https://course.fast.ai/start_azure_dsvm).  The standard [script](https://raw.githubusercontent.com/Azure/DataScienceVM/master/Samples/fastai2/fastai2onAzureSpotDSVM.sh) sets the machine up in the `westus2` region.  So first order is to figure out if it's possible to use a european location instead.

First off, [install the azure cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).

## Select the right subscription

    az account list --output table

        $ Name                                     CloudName    SubscriptionId                        State    IsDefault
    ---------------------------------------  -----------  ------------------------------------  -------  -----------
    PREVIEWWhiteLabelNonProduction           AzureCloud   31bb935b-6ac7-4443-bbe9-5148c83a3706  Enabled  True
    Production                               AzureCloud   bec86261-92ca-4455-b5ed-6d711c52d1f0  Enabled  False
    PREVIEWWhiteLabelProduction              AzureCloud   518a10bf-6433-4c4f-9076-b2ec59c9dc47  Enabled  False
    Production1                              AzureCloud   dce8da4f-3c5e-4fc1-bc9d-f96f13ed9845  Enabled  False
    NonProduction1                           AzureCloud   710bb86e-dbe4-4fd3-ba4d-8bebbbc8c735  Enabled  False
    Shared Tools                             AzureCloud   8e952301-5aca-411e-8a33-9598e5293731  Enabled  False
    GO Modeller - Production                 AzureCloud   701a1e29-5049-4150-bcb8-5062d8d84c15  Enabled  False
    RandD1                                   AzureCloud   96bd129c-7acf-4fef-850e-7bb36026ed10  Enabled  False
    IT Applications Development              AzureCloud   06e458f3-42fa-47fe-8bc6-4e55fe6edbce  Enabled  False
    IT Applications UAT                      AzureCloud   a5f6a52e-965e-491f-a054-a803e701c85f  Enabled  False
    IaaS - Non Production                    AzureCloud   508cfa75-32e7-4f73-bc29-a5bf43910a82  Enabled  False
    GO Modeller - Development                AzureCloud   ecbd75ef-6a1b-4fe7-921f-c91cdcd2aa51  Enabled  False
    GO - Development                         AzureCloud   526a405c-9f96-4793-96ff-d6604272a9fa  Enabled  False
    Visual Studio Professional Subscription  AzureCloud   bd89a416-ecb1-4627-8f87-fb5e61eb47c7  Enabled  False

To select the visual studio subscription:

    az account set --subscription "bd89a416-ecb1-4627-8f87-fb5e61eb47c7"


## How to list azure regions?

    az login
    az account list-locations -o table

    $ DisplayName           Latitude    Longitude    Name
    --------------------  ----------  -----------  ------------------
    East Asia             22.267      114.188      eastasia
    East US 2             36.6681     -78.3889     eastus2
    West US               37.783      -122.417     westus
    North Central US      41.8819     -87.6278     northcentralus
    North Europe          53.3478     -6.2597      northeurope
    West Europe           52.3667     4.9          westeurope
    UK South              50.941      -0.799       uksouth
    UK West               53.427      -3.084       ukwest
    West US 2             47.233      -119.852     westus2

There's more than that, but it gives the idea.

## Selecting VM type & location

Next is to figure out what region(s) are both acceptable to me (europe) and have appropriate data science VMs available.  This was not easy to do.  The [installation script](https://raw.githubusercontent.com/Azure/DataScienceVM/master/Samples/fastai2/fastai2onAzureSpotDSVM.sh) suggests using `Standard_NC6` as a spot instance (so cheaper).  [This page](https://azure.microsoft.com/en-gb/global-infrastructure/services/?products=virtual-machines&regions=europe-north,europe-west,united-kingdom-south,united-kingdom-west) lists which virtual machine types are available in which regions.

At time of writing, it looks like the `NC` class of machines are available in North Europe, West Europe and Uk South.

OK, let's try `Standard_NC6` in `northeurope`.
