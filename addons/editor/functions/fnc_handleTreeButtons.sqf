/*
 * Author: mharis001
 * Handles clicking the tree collapse and expand all buttons.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Expand <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY, false] call zen_editor_fnc_handleTreeButtons
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_display", "_expand"];

// Determine currently active tree
RscDisplayCurator_sections params ["_mode", "_side"];

// Cant collapse marker or recent trees
if (_mode > 2) exitWith {};

private _treeIDC = switch (_mode) do {
    case 0: {
        IDCS_UNIT_TREES select _side;
    };
    case 1: {
        IDCS_GROUP_TREES select _side;
    };
    case 2: {
        IDC_RSCDISPLAYCURATOR_CREATE_MODULES;
    };
};

// Collapse or expand current tree
private _ctrlTree = _display displayCtrl _treeIDC;

if (_expand) then {
    tvExpandAll _ctrlTree;
} else {
    _ctrlTree call EFUNC(common,collapseTree);
};
