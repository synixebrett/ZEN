/*
 * Author: mharis001
 * Initializes the EDIT content control.
 *
 * Arguments:
 * 0: Controls Group <CONTROL>
 * 1: Row Index <NUMBER>
 * 2: Current Value <STRING>
 * 3: Row Settings <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 0, "123"] call zen_dialog_fnc_gui_edit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controlsGroup", "_rowIndex", "_currentValue", "_rowSettings"];
_rowSettings params ["_fnc_sanitizeValue"];

private _ctrlEdit = _controlsGroup controlsGroupCtrl IDC_ROW_EDIT;
_ctrlEdit ctrlSetText _currentValue;

_ctrlEdit setVariable [QGVAR(params), [_rowIndex, _fnc_sanitizeValue]];

_ctrlEdit ctrlAddEventHandler ["KeyDown", {
    params ["_ctrlEdit"];
    (_ctrlEdit getVariable QGVAR(params)) params ["", "_fnc_sanitizeValue"];

    private _value = ctrlText _ctrlEdit;
    _value = _value call _fnc_sanitizeValue;
    _ctrlEdit ctrlSetText _value;
}];

_ctrlEdit ctrlAddEventHandler ["KeyUp", {
    params ["_ctrlEdit"];
    (_ctrlEdit getVariable QGVAR(params)) params ["_rowIndex", "_fnc_sanitizeValue"];

    private _value = ctrlText _ctrlEdit;
    _value = _value call _fnc_sanitizeValue;
    _ctrlEdit ctrlSetText _value;

    private _display = ctrlParent _ctrlEdit;
    private _values = _display getVariable QGVAR(values);
    _values set [_rowIndex, _value];
}];
