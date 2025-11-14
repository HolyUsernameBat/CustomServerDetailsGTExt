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
        addSD(serverState, "VotingOption", GetMyVotingOption(kfgt.MapListType));
        //addSD(serverState, "CurrentMap", GetCurrentMap(kfgt.MapName));
        //addSD(serverState, "FakedPlayers", GetFakedPlayers(kfgt.MaxPlayers));
        addSD(serverState, "BotCount", GetBotCount(kfgt.NumBots));
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
        default:
            return "UNKNOWN DIFFICULTY";
    }
}
// Abbreviated Game Type - Can Easily Declare with KFMapVoteV2+
private final function string GetAbbrevGameType(string Acronym) {  
    return Acronym;
}

/*private final function string GetCurrentMap(string MapName) {
    local int DashIndex;
    
    // Find the first dash
    DashIndex = InStr(MapName, "-");
    
    // If found at position 2 (like for "KF-" or "GG-")
    if (DashIndex == 2) {
        return Mid(MapName, 3);  // Return everything after position 2
    } 
    
    // Return original if no standard prefix found
    return MapName;
} */

private final function string GetMyVotingOption(string MapListType) {
    return MapListType;
}

private final function int GetFakedPlayers(int MaxPlayers) {
    // if no faked players
    return MaxPlayers;
} 

private final function int GetBotCount(int BotCount) {
    return BotCount;
}