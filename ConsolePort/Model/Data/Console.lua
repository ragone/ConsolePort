-- Consts
local MOTION_SICKNESS_CHARACTER_CENTERED = MOTION_SICKNESS_CHARACTER_CENTERED or 'Keep Character Centered';
local MOTION_SICKNESS_REDUCE_CAMERA_MOTION = MOTION_SICKNESS_REDUCE_CAMERA_MOTION or 'Reduce Camera Motion';
local unpack, _, db = unpack, ...; local Console = {}; db('Data')();
------------------------------------------------------------------------------------------------------------
-- Blizzard console variables
------------------------------------------------------------------------------------------------------------
db:Register('Console', setmetatable({
	--------------------------------------------------------------------------------------------------------
	Emulation = {
	--------------------------------------------------------------------------------------------------------
		{	cvar = 'GamePadEmulateShift';
			type = Button;
			name = 'Emulate Shift';
			desc = 'Button that emulates the Shift key. Hold this button to swap your binding set.';
			note = 'Recommended as first choice modifier.';
		};
		{	cvar = 'GamePadEmulateCtrl';
			type = Button;
			name = 'Emulate Ctrl';
			desc = 'Button that emulates the Ctrl key. Hold this button to swap your binding set.';
			note = 'Recommended as second choice modifier.';
		};
		{ 	cvar = 'GamePadEmulateAlt';
			type = Button;
			name = 'Emulate Alt';
			desc = 'Button that emulates the Alt key.';
			note = 'Only recommended for super users.';
		};
		{	cvar = 'GamePadCursorLeftClick';
			type = Button;
			name = KEY_BUTTON1;
			desc = 'Button that emulates Left Click while controlling the mouse cursor.';
			note = 'Frees your mouse cursor when used, if the cursor is currently center-fixed or hidden.';
		};
		{	cvar = 'GamePadCursorRightClick';
			type = Button;
			name = KEY_BUTTON2;
			desc = 'Button that emulates Right Click while controlling the mouse cursor.';
			note = 'Used for interacting with the world, at a center-fixed position.';
		};
		{	cvar = 'GamePadEmulateTapWindowMs';
			type = Number(350, 25);
			name = 'Emulated Modifier Tap Window';
			desc = 'Buttons emulating modifiers will instead trigger bindings when pressed and released within the time span.';
			note = 'Expressed in milliseconds. Pressing any combination of modifier and button will cancel the effect.';
		};
	};
	--------------------------------------------------------------------------------------------------------
	Cursor = {
	--------------------------------------------------------------------------------------------------------
		{	cvar = 'GamePadCursorAutoDisableJump';
			type = Bool(true);
			name = 'Hide Cursor on Jump';
			desc = 'Disable free-roaming mouse cursor when you jump.';
		};
		{	cvar = 'GamePadCursorAutoDisableSticks';
			type = Select(2, 2):SetRawOptions({[0] = NONE, [1] = TUTORIAL_TITLE2, [2] = STATUS_TEXT_BOTH});
			name = 'Hide Cursor on Stick Input';
			desc = 'Disable free-roaming mouse cursor when you use your sticks.';
			note = 'When set to both sticks, cursor only disables when both sticks are used together.';
		};
		{	cvar = 'CursorCenteredYPos';
			type = Range(0.6, 0.025, 0, 1);
			name = 'Cursor Center Position';
			desc = 'Vertical position of centered cursor & targeting, as fraction of screen height.';
		};
		{	cvar = 'GamePadCursorSpeedStart';
			type = Number(0.1, 0.05);
			name = 'Cursor Start Speed';
			desc = 'Speed of cursor when it starts moving.';
		};
		{	cvar = 'GamePadCursorSpeedAccel';
			type = Number(2, 0.1);
			name = 'Cursor Acceleration';
			desc = 'Acceleration of cursor per second as it continues to move.';
		};
		{	cvar = 'GamePadCursorSpeedMax';
			type = Number(1, 0.1);
			name = 'Cursor Max Speed';
			desc = 'Top speed of cursor movement.';
		};
	};
	--------------------------------------------------------------------------------------------------------
	Controls = {
	--------------------------------------------------------------------------------------------------------
		{	cvar = 'GamePadAnalogMovement';
			type = Bool(true);
			name = 'Analog Movement';
			desc = 'Movement is analog, translated from your movement stick angle.';
			note = 'Disable to use discrete legacy movement controls.';
		};
		{	cvar = 'GamePadFaceMovementMaxAngle';
			type = Range(115, 5, 0, 180);
			name = 'Face Movement Max Angle';
			desc = 'Controls when your character transitions from strafing to facing your movement stick angle. Expressed in degrees, from looking straight forward.';
			note = 'When set to zero, always face your movement stick.\nWhen set to max, never face your movement stick.';
		};
		{	cvar = 'GamePadFaceMovementMaxAngleCombat';
			type = Range(115, 5, 0, 180);
			name = 'Face Movement Max Angle (Combat)';
			desc = 'Controls when your character transitions from strafing to facing your movement stick angle in combat. Expressed in degrees, from looking straight forward.';
			note = 'When set to zero, always face your movement stick.\nWhen set to max, never face your movement stick.';
		};
		{	cvar = 'GamePadRunThreshold';
			type = Range(0.5, 0.1, 0, 1);
			name = 'Run / Walk Threshold';
			desc = 'Amount of stick movement before transitioning from walk to run.';
		};
		{	cvar = 'GamePadTurnWithCamera';
			type = Select(2, 2):SetRawOptions({[0] = NEVER, [1] = 'In Combat', [2] = ALWAYS});
			name = 'Turn Character With Camera';
			desc = 'Turn your character facing when you turn your camera angle.';
		};
	};
	--------------------------------------------------------------------------------------------------------
	Camera = {
	--------------------------------------------------------------------------------------------------------
		{	cvar = 'CameraKeepCharacterCentered';
			type = Bool(true);
			name = MOTION_SICKNESS_CHARACTER_CENTERED;
			desc = 'Keeps your character centered to reduce motion sickness.';
		};
		{	cvar = 'CameraReduceUnexpectedMovement';
			type = Bool(true);
			name = MOTION_SICKNESS_REDUCE_CAMERA_MOTION;
			desc = 'Reduces unexpected camera movement to reduce motion sickness.';
		};
		{	cvar = 'test_cameraDynamicPitch';
			type = Bool(false);
			name = 'Dynamic Pitch';
			desc = 'Pitches the camera upwards as you zoom out.';
			note = ('Incompatible with %s.'):format(MOTION_SICKNESS_CHARACTER_CENTERED);
		};
		{	cvar = 'test_cameraOverShoulder';
			type = Range(0, 0.5, -1.0, 1.0);
			name = 'Over Shoulder';
			desc = 'Offsets the camera horizontally from your character, for a more cinematic view.';
			note = ('Incompatible with %s.'):format(MOTION_SICKNESS_CHARACTER_CENTERED);
		};
		{	cvar = 'CameraFollowOnStick';
			type = Bool(false);
			name = 'Follow On A Stick (FOAS)';
			desc = 'Auto-adjusts your camera, allowing you to control movement with a single stick.';
			note = ('|T%s:128:128:0|t'):format([[Interface\AddOns\ConsolePort_Config\Assets\jose.blp]]);
		};
		{	cvar = 'CameraFollowGamepadAdjustDelay';
			type = Number(1, 0.25);
			name = 'FOAS Adjust Delay';
			desc = 'Delay before starting to adjust angle when camera control is idle, in seconds.';
		};
		{	cvar = 'CameraFollowGamepadAdjustEaseIn';
			type = Number(1, 0.25);
			name = 'FOAS Adjust Ease In';
			desc = 'The time it takes to transition from idle camera control to auto-adjustment (FOAS).';
		};
		{
			cvar = 'GamePadCameraLookMaxYaw';
			type = Range(0, 15, 0, 45);
			name = 'Camera Look Max Yaw';
			desc = 'Maximum Yaw adjust for the camera "look" feature.';
			note = 'Camera Look is a temporary turn of the camera based on the current analog input.';
		};
		{
			cvar = 'GamePadCameraLookMaxPitch';
			type = Range(0, 15, 0, 30);
			name = 'Camera Look Max Pitch';
			desc = 'Maximum Pitch adjust for the camera "look" feature.';
			note = 'Camera Look is a temporary turn of the camera based on the current analog input.';
		};
		{	cvar = 'GamePadCameraYawSpeed';
			type = Range(1, 0.25, -4.0, 4.0);
			name = 'Camera Yaw Speed';
			desc = 'Yaw speed of camera - turning left/right.';
			note = 'Choose a negative value to invert the axis.';
		};
		{	cvar = 'GamePadCameraPitchSpeed';
			type = Range(1, 0.25, -4.0, 4.0);
			name = 'Camera Pitch Speed';
			desc = 'Pitch speed of camera - moving up/down.';
			note = 'Choose a negative value to invert the axis.';
		};
	};
	--------------------------------------------------------------------------------------------------------
	-- Interact (NYI)
	--------------------------------------------------------------------------------------------------------
	System = {
	--------------------------------------------------------------------------------------------------------
		{	cvar = 'synchronizeSettings';
			type = Bool(true);
			name = 'Synchronize Settings';
			desc = 'Whether client settings should be saved to the server.';
			note = 'Master setting for Synchronize Bindings, Synchronize Config and Synchronize Macros.';
		};
		{	cvar = 'synchronizeBindings';
			type = Bool(true);
			name = 'Synchronize Bindings';
			desc = 'Whether client keybindings should be saved to the server.';
		};
		{	cvar = 'synchronizeConfig';
			type = Bool(true);
			name = 'Synchronize Config';
			desc = 'Whether to save character- and account-scoped variables to the server.';
		};
		{	cvar = 'synchronizeMacros';
			type = Bool(true);
			name = 'Synchronize Macros';
			desc = 'Whether client macros should be saved to the server.';
		};
		{	cvar = 'GamePadUseWinRTForXbox';
			type = Bool(true);
			name = 'Use WinRT Gamepad Mapping (Xbox)';
			desc = 'Uses a Microsoft API to map Xbox controllers to the game.';
			note = 'Disable if you are experiencing movement and binding issues.';
		};
		{	cvar = 'GamePadEmulateEsc';
			type = Button;
			name = 'Emulate Esc';
			desc = 'Button that emulates the Esc key.';
			note = 'This key can be replaced by binding Toggle Game Menu. This emulation is not necessary with ConsolePort.';
		};
		{	cvar = 'GamePadOverlapMouseMs';
			type = Number(2000, 100);
			name = 'Combined Input Overlap Time';
			desc = 'Duration after using gamepad and mouse at the same time before switching to just one or the other, in milliseconds.';
		};
	};
	--------------------------------------------------------------------------------------------------------
	Touchpad = {
	--------------------------------------------------------------------------------------------------------
		{	cvar = 'GamePadTouchCursorEnable';
			type = Bool(false);
			name = 'Enable Touchpad Cursor';
			desc = 'Allows the use of the touchpad to control cursor movement.';
		};
		{	cvar = 'GamePadTouchCursorMoveThreshold';
			type = Number(0.042, 0.002, true);
			name = 'Cursor Move Threshold';
			desc = 'Change before touchpad moves the cursor.';
			note = 'Larger value for easier taps.';
		};
		{	cvar = 'GamePadTouchCursorAccel';
			type = Number(1.0, 0.25, true);
			name = 'Cursor Acceleration';
			desc = 'Cursor acceleration for touchpad control.';
		};
		{	cvar = 'GamePadTouchCursorSpeed';
			type = Number(1.0, 0.25, true);
			name = 'Cursor Speed';
			desc = 'Cursor speed for touchpad control.';
		};
		{	cvar = 'GamePadTouchTapButtons';
			type = Bool(false);
			name = 'Touch Tap Buttons';
			desc = 'Enable touch tap to press touchpad buttons.';
			note = 'When enabled, a tap will act as a button press.';
		};
		{	cvar = 'GamePadTouchTapMaxMs';
			type = Number(200, 50, true);
			name = 'Touch Tap Max Time';
			desc = 'Max time for a touch to register a tap/click, in milliseconds.';
		};
		{	cvar = 'GamePadTouchTapOnlyClick';
			type = Bool(false);
			name = 'Touch Tap Exclusive Click';
			desc = 'Only use taps for cursor clicks, do not use tap presses.';
			note = 'When disabled, a button press will also act as a cursor click.';
		};
		{	cvar = 'GamePadTouchTapRightClick';
			type = Bool(false);
			name = 'Touch Tap Right Click';
			desc = 'Taps for cursor clicks are right clicks instead of left.';
		};
	};
}, {
	__index = Console;
}))

function Console:GetMetadata(key)
	for set, cvars in pairs(self) do
		for i, data in ipairs(cvars) do
			if (data.cvar == key) then
				return data;
			end
		end
	end
end

function Console:GetEmulationForButton(button)
	if (button == 'none') then return end
	for i, data in ipairs(self.Emulation) do
		if (GetCVar(data.cvar) == button) then
			return data;
		end
	end
end

--[[ unhandled:
	
	GamePadCursorCentering = "When using GamePad, center the cursor",
	GamePadCursorOnLogin = "Enable GamePad cursor control on login and character screens",
	GamePadCursorAutoEnable = "",

	GamePadCursorCenteredEmulation = "When cursor is centered for GamePad movement, also emulate mouse clicks",
	GamePadTankTurnSpeed = "If non-zero, character turns like a tank from GamePad movement",
	GamePadForceXInput = "Force game to use XInput, rather than a newer, more advanced api",
	GamePadSingleActiveID = "ID of single GamePad device to use. 0 = Use all devices' combined input",
	GamePadAbbreviatedBindingReverse = "Display main binding button first so it's visible even if truncated on action bar",
	GamePadListDevices = "List all connected GamePad devices in the console",
]]--