// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @author: wearecobalt.co

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

///////////////////////////////////////////////////////////////////////////////////////
//                                                                                   //
//   ,m                             ▄▄█                    ▄                  ╓      //
// ▄███▄▄▄   ,▄P═R▄▄      ╓4══▄▄,    ██    ╓Æⁿ═▄        ╓███▄▄▄  N▄▄P  ▄▄M  ▄███▄▄▄  //
//  ▐█▌     ▄█     ██▄  ╔█▌    ▀██   ██   ▐█▄   `        ▐██      ╙██ ,▀     ██L     //
//  ▐█▌    ▐██     ▐██  ██      ██L  ██    ▀███w         ▐██        ███      ██L     //
//  ▐█▌    ▐██     ▐██  ██▌     ██   ██   ,   ▀██   ,    ▐██      ,█ '██     ██L     //
//   ██▄▄m   ▀█▄,,▄█`    ▀█▄,,╓█▀  ,▄██▄, █▄,,▄█   ███    ███▄m ,▄█, ,▄██▄,  ╙██▄▄P  //
//                                                                                   // 
///////////////////////////////////////////////////////////////////////////////////////

contract Tool01 is ERC721Enumerable, ReentrancyGuard, Ownable {

    string[] private hammer = [
        "45 oz. Deadblow Hammer",
        "20 oz. Straight-claw Hammer",
        "22 oz. Milled Face Framing Hammer",
        "16 oz. Fiberglass Claw Hammer",
        "8 lb. Sledge Hammer with 34 in. Fiberglass Handle",
        "16 oz. White Rubber Mallet",
        "4 lb. Fiberglass Blacksmith Hammer",
        "12 oz. Double-Face Soft Hammer",
        "10 lb. Forged Steel Sledge Hammer with 36 in. Fiberglass Handle"
    ];
    
    string[] private cuttingTool = [
        "Machete (24 in.)",
        "24 in. Bolt Cutters",
        "69 in. San Angelo Bar",
        "10 in. Straight-Cut Aviation Snips",
        "15 in. Tooth Saw with Aluminum Handle",
        "14 in. Bolt Cutter",
        "8.5 in. All-Purpose Utility Shears",
        "26 in. Camper's Nylon-Vinyl Grip Handle Axe",
        "Steel Clearing Hatchet (18 in. )",
        "12 in. Hack Saw with Rubber Handle",
        "22 oz. Steel Multi-Utility Axe",
        "8 in. Long Nose Pliers"
    ];
    
    string[] private pliers = [
        "9.5 in. and 6.5 in. Tongue and Groove Pliers Set",
        "6.5 in. Long Nose 7 in. and 10 in. Locking Plier Set",
        "9 in. Leverage Side Cutting Pliers",
        "6 in. Torque Locking C-Clamp with Regular Jaws",
        "7.5 in. Compound Action Diagonal Pliers",
        "10 in. Straight Jaw Groove Joint Pliers",
        "Combination Electricians 6-in-1 Wire Strippers"
    ];
    
    string[] private screwdriver = [
        "1/4 in. Flip-Blade Insulated Screwdriver",
        "9-in-1 Square Drive Ratcheting Multi-Bit Screwdriver",
        "7-Piece Assorted Screwdriver Set",
        "4-Piece Precision Screwdriver Set",
        "Assorted Screwdriver Set with Cushion Grip Handles (8-Piece)",
        "Stubby Multi-Bit Screwdriver/Nut Driver - Cushion Grip Handle",
        "Universal Tap Handle"
    ];
    
    string[] private ratchet = [
        "3/8 in. 72 Tooth Ratchet",
        "1/2 in. 72 Tooth Ratchet",
        "1/2 in. Drive 15 in. Breaker Bar",
        "3/8 in. Flex-Head, Extendable Ratchet",
        "1/2 in. Drive 100-Position Low-Profile Long Handle Ratchet",
        "3/8 in. Drive 100-Position Low-Profile Long Handle Ratchet",
        "1/4 in. Drive 90-Tooth 3 in. Stubby Ratchet"
    ];
    
    string[] private measuringTool = [
        "25 ft. Compact Auto Lock Tape Measure",
        "12-1/2 in. Contractors Measuring Wheel",
        "30 ft. Cross Line Laser Self Leveling Level",
        "9 in. Magnetic Torpedo Level",
        "65 ft. Laser Distance Tape Measuring Tool",
        "72 in. Aluminum Box Level",
        "Protractor"
    ];
    
    string[] private powerTool = [
        "20-Volt Cordless Compact 1/2 in. Drill/Driver",
        "20-Volt Cordless 3-Speed 1/4 in. Impact Driver",
        "18V Cordless 3/8 in. Drill/Driver Kit",
        "20-Volt Cordless 1 in. Masonry Hammer Drill",
        "15 Amp Corded 12 in. Double Bevel Sliding Compound Miter Saw",
        "20-Volt Cordless Jigsaw",
        "15 Amp 7-1/4 in. Corded Circular Saw with Carbide Blade",
        "20-Volt Cordless 6-1/2 in. Circular Saw",
        "20-Volt Cordless Deep Cut Band Saw",
        "18-Volt Cordless Reciprocating Saw",
        "18V Cordless Compact One-Handed Reciprocating Saw"
    ];
    
    string[] private heavyDuty = [
        "6 Gal. 150 PSI Electric Air Compressor",
        "20 Gal. 200 PSI Oil Free Vertical Electric Air Compressor",
        "4 Gal. Pontoon Air Compressor with 5 HP Gas Engine",
        "9 Gal. Wheelbarrow Air Compressor with 9 HP Gas Engine",
        "230 Amp Precision TIG Welder, 460V/575V",
        "160 Amp TIG Stick Arc DC Inverter Welder",
        "125 Amp Flux-Cored Welder with Magnum 100L Gun, 115V",
        "255 Amp Wire Feed MIG Wire Feed Welder with 250L Magnum Gun, 230V"
    ];
    
    string[] private suffixes = [
        "of Power",
        "of Giants",
        "of Titans",
        "of Skill",
        "of Perfection",
        "of Brilliance",
        "of Enlightenment",
        "of Protection",
        "of Anger",
        "of Rage",
        "of Fury",
        "of Vitriol",
        "of the Fox",
        "of Detection",
        "of Reflection",
        "of the Twins"
    ];
    
    string[] private namePrefixes = [
        "Agony", "Apocalypse", "Armageddon", "Beast", "Behemoth", "Blight", "Blood", "Bramble", 
        "Brimstone", "Brood", "Carrion", "Cataclysm", "Chimeric", "Corpse", "Corruption", "Damnation", 
        "Death", "Demon", "Dire", "Dragon", "Dread", "Doom", "Dusk", "Eagle", "Empyrean", "Fate", "Foe", 
        "Gale", "Ghoul", "Gloom", "Glyph", "Golem", "Grim", "Hate", "Havoc", "Honour", "Horror", "Hypnotic", 
        "Kraken", "Loath", "Maelstrom", "Mind", "Miracle", "Morbid", "Oblivion", "Onslaught", "Pain", 
        "Pandemonium", "Phoenix", "Plague", "Rage", "Rapture", "Rune", "Skull", "Sol", "Soul", "Sorrow", 
        "Spirit", "Storm", "Tempest", "Torment", "Vengeance", "Victory", "Viper", "Vortex", "Woe", "Wrath",
        "Light's", "Shimmering"  
    ];
    
    string[] private nameSuffixes = [
        "Bane",
        "Root",
        "Bite",
        "Song",
        "Roar",
        "Grasp",
        "Instrument",
        "Glow",
        "Bender",
        "Shadow",
        "Whisper",
        "Shout",
        "Growl",
        "Tear",
        "Peak",
        "Form",
        "Sun",
        "Moon"
    ];
    
    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }
    
    function getHammer(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "HAMMER", hammer);
    }
    
    function getCuttingTool(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "CUTTING-TOOL", cuttingTool);
    }
    
    function getScrewdriver(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "SCREWDRIVER", screwdriver);
    }
    
    function getRatchet(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "RATCHET", ratchet);
    }

    function getMeasuringTool(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "MEASURING-TOOL", measuringTool);
    }
    
    function getPowerTool(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "POWER-TOOL", powerTool);
    }
    
    function getHeavyDutyTool(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "HEAVY-DUTY-TOOL", heavyDuty);
    }
    
    function getPliers(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "PLIERS", pliers);
    }
    
    function pluck(uint256 tokenId, string memory keyPrefix, string[] memory sourceArray) internal view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked(keyPrefix, toString(tokenId))));
        string memory output = sourceArray[rand % sourceArray.length];
        uint256 greatness = rand % 51;
        if (greatness > 40) {
            output = string(abi.encodePacked(output, " ", suffixes[rand % suffixes.length]));
        }
        if (greatness >= 49) {
            string[2] memory name;
            name[0] = namePrefixes[rand % namePrefixes.length];
            name[1] = nameSuffixes[rand % nameSuffixes.length];
            if (greatness == 49) {
                output = string(abi.encodePacked('"', name[0], ' ', name[1], '" ', output));
            } else {
                output = string(abi.encodePacked('"', name[0], ' ', name[1], '" ', output, " +1"));
            }
        }
        return output;
    }

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string[17] memory parts;
        parts[0] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: black; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="white" /><text x="10" y="20" class="base">';

        parts[1] = getHammer(tokenId);

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = getCuttingTool(tokenId);

        parts[4] = '</text><text x="10" y="60" class="base">';

        parts[5] = getPliers(tokenId);

        parts[6] = '</text><text x="10" y="80" class="base">';

        parts[7] = getScrewdriver(tokenId);

        parts[8] = '</text><text x="10" y="100" class="base">';

        parts[9] = getRatchet(tokenId);

        parts[10] = '</text><text x="10" y="120" class="base">';

        parts[11] = getMeasuringTool(tokenId);

        parts[12] = '</text><text x="10" y="140" class="base">';

        parts[13] = getHeavyDutyTool(tokenId);

        parts[14] = '</text><text x="10" y="160" class="base">';

        parts[15] = getPowerTool(tokenId);

        parts[16] = '</text></svg>';

        string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8]));
        output = string(abi.encodePacked(output, parts[9], parts[10], parts[11], parts[12], parts[13], parts[14], parts[15], parts[16]));
        
        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "Toolbox #', toString(tokenId), '", "description": "tooL is randomized builder gear generated and stored on chain. Stats, images, and other functionality are intentionally omitted for others to interpret. Feel free to use tooL in any way you want.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }

    function claim(uint256 tokenId) public nonReentrant {
        require(tokenId > 0 && tokenId < 7801, "Token ID invalid");
        _safeMint(_msgSender(), tokenId);
    }
    
    function ownerClaim(uint256 tokenId) public nonReentrant onlyOwner {
        require(tokenId > 7800 && tokenId < 8001, "Token ID invalid");
        _safeMint(owner(), tokenId);
    }
    
    function toString(uint256 value) internal pure returns (string memory) {
    // Inspired by OraclizeAPI's implementation - MIT license
    // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
    
    constructor() ERC721("Tool", "TOOL") Ownable() {}
}

/// [MIT License]
/// @title Base64
/// @notice Provides a function for encoding some bytes in base64
/// @author Brecht Devos <brecht@loopring.org>
library Base64 {
    bytes internal constant TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    /// @notice Encodes some bytes to the base64 representation
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";

        // multiply by 4/3 rounded up
        uint256 encodedLen = 4 * ((len + 2) / 3);

        // Add some extra buffer at the end
        bytes memory result = new bytes(encodedLen + 32);

        bytes memory table = TABLE;

        assembly {
            let tablePtr := add(table, 1)
            let resultPtr := add(result, 32)

            for {
                let i := 0
            } lt(i, len) {

            } {
                i := add(i, 3)
                let input := and(mload(add(data, i)), 0xffffff)

                let out := mload(add(tablePtr, and(shr(18, input), 0x3F)))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(12, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(6, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(input, 0x3F))), 0xFF))
                out := shl(224, out)

                mstore(resultPtr, out)

                resultPtr := add(resultPtr, 4)
            }

            switch mod(len, 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }

            mstore(result, encodedLen)
        }

        return string(result);
    }
}
