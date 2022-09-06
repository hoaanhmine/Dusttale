function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Papyrus Note' then --Check if the note on the chart is a Dust Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PAPNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 314); --wanted a custom splash, but it looks weird on KR, so i just removed the splashes for both.
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', 100);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 100);
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.hue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.saturation', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function onUpdate(elapsed)
end

function noteMiss(id, direction, noteType, isSustainNote)
end