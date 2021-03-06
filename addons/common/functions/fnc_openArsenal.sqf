/*
 * Author: mharis001
 * Opens the preferred arsenal type on the given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call zen_common_fnc_openArsenal
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (GVAR(preferredArsenal) == 1 && {isClass (configFile >> "CfgPatches" >> "ace_arsenal")}) then {
    player remoteControl _unit;
    ace_arsenal_moduleUsed = true;

    [_unit, _unit, true] call ace_arsenal_fnc_openBox;
} else {
    ["Open", [true, nil, _unit]] call BIS_fnc_arsenal;
};
