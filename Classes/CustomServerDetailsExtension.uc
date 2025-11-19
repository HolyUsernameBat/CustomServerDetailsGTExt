// CustomServerDetails Extension example
// Author        : Shtoyan
// Home Repo     : https://github.com/InsultingPros/CustomServerDetailsExtension
// License       : https://www.gnu.org/licenses/gpl-3.0.en.html
class CustomServerDetailsExtension extends base_GR;

function getServerDetails(out GameInfo.serverResponseLine serverState) {
    // let's inject game difficulty to server info
    if (kfgt != none) {
        addSD(serverState, "Difficulty", GetDifficultyName(kfgt.GameDifficulty));
        addSD(serverState, "GameType", GetAbbrevGameType(kfgt.Acronym));
        addSD(serverState, "VoteClassOption", GetMyVotingOption(kfgt.MapListType));
        addSD(serverState, "Game", kfgt.GameName);
        addSD(serverState, "GameTimer", kfgt.ElapsedTime $ "s");
        addSD(serverState, "Whitelisted", "False");
        addSD(serverState, "VAC", isVAC(kfgt.bVACSecured));
        addSD(serverState, "LineBreaker", "");
        addSD(serverState, "LineBreaker2", "");
        //addSD(serverState, "MaxPlayers", "" $ kfgt.MaxPlayers);
        //addSD(serverState, "CurrentPlayers", "" $ kfgt.NumPlayers);
        //addSD(serverState, "FakedPlayers", GetFakedPlayers(kfgt.MaxPlayers));
    }
}

private final function string GetDifficultyName(float GameDifficulty) {
    switch (GameDifficulty) {
        case 1.0:
            return "Beginner";
        case 2.0:
            return "Normal";
        case 4.0:
            return "Hard";
        case 5.0:
            return "Suicidal";
        case 7.0:
            return "HOE";
        case 0:
            return "Custom";
        default:
            return "UNKNOWN DIFFICULTY";
    }
}
// Abbreviated Game Type - Theoretically can Declare with KFMapVoteV2+
private final function string GetAbbrevGameType(string Acronym) {  
    switch (Acronym) {
        case "KFS":
            return "Trials";
        case "GG":
            return "GunGame";
        case "KF":
            return "KF";
        case "KFO":
            return "KFO";
        case "DOWN TO BLYAT":
            return "DTB";
        case "???":
            return "DTB";
        default:
            return "IDFK";
    }
}

private final function string GetMyVotingOption(string MapListType) {
     switch (MapListType) {
        case "KFStoryGame.KFOMapList":
            return "KFStoryGame (unstable pow)";
        case "KFMod.KFMapList":
            return "KFMod (Survival in a Blender)";
        case "TrialsMod.TRMapList":
            return "TrialsMod (Parkour shi)";
        case "KFGunGame.GGMapList":
            return "KFGunGame (Crash Simulator)";
        case "DTBx.��@DOWN TO BLYAT":
            return "DTBx (Diaper Simulator)";
        case "DTBx.DOWNTOBLYAT":
            return "DTBx (Diaper Simulator)";
        case "DTBx.DTBMapList":
            return "DTBx (Diaper Simulator)";
        default:
            return "Too Damn Custom to Recognize";
    }
}

private final function int GetFakedPlayers(int MaxPlayers) {
    // if no faked players
    return MaxPlayers;
} 

private final function string isVAC(bool bVACSecured) {
    if (bVACSecured) {
        return "Enabled";
    } else {
        return "Disabled";
    }
}