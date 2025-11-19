Like stated in its description, the purpose of this fork is to extend functionality of the custom server details mod. Specifically adding key variables such as: Map VotingOption, GameType Acronym/Abbreviation.

**Do note any of the default server details variables can be accessed without building on this extension, you just need to add their names** (which can be found in Engine.GameReplicationInfo) **to your customserverdetails.ini**
Examples of interest may be 

`displayedServerDetails=(name="Voting Option",keyTag="^b",valTag="^b",bChangeName=True,newName="Game Mode:")`

& `displayedServerDetails=(name="Mutator",keyTag="^nc",valTag="^o",bChangeName=False,newName="")`


This is a simple fork so attached is their readme below, but i'll edit the package name to reflect my files (you might not need to rename in this case if you make changes too but it's good practice!):


[Custom Server Details]: https://github.com/InsultingPros/CustomServerDetails

# CustomServerDetails Extension

[![GitHub all releases](https://img.shields.io/github/downloads/InsultingPros/CustomServerDetailsExtension/total)](https://github.com/InsultingPros/CustomServerDetailsExtension/releases)

This is a template-example repo to show how to add your own server details, without recompiling [Custom Server Details].

## Installation

0. Make sure you have installed [Custom Server Details] 1.4.0 or higher. Open your [CustomServerDetails.ini](https://github.com/InsultingPros/CustomServerDetails/blob/main/Configs/CustomServerDetails.ini)'s `[CustomServerDetails.CSDMasterServerUplink]` section:

1. Add your *packageName.className*:

    ```ini
    extendedServerDetailsClassName=CSD_GTExt.CustomServerDetailsExtension
    ```

2. Add your new variable to `infoBlockKeys`:

    ```ini
    infoBlockKeys=(detail="Difficulty",key="DIFF")
    ```

3. Finally edit the server state (`infoBlockPatterns`) where you want to see your new variable:

    ```ini
    infoBlockPatterns=(state="LOBBY",pattern="^w^[Current state: ^g^LOBBY^w^], Difficulty: %DIFF%")
    ```

## Building

Use [KF Compile Tool](https://github.com/InsultingPros/KFCompileTool) for easy compilation.

```ini
EditPackages=CustomServerDetails
EditPackages=CSD_GTExt
```
