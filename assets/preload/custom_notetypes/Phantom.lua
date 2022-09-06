cantseeshit = false
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Phantom' then --Check if the note on the chart is a Dust Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NotesKR/NOTE_assets_phantom'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 314); --wanted a custom splash, but it looks weird on KR, so i just removed the splashes for both.
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', 100);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 100);
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.hue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.saturation', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Phantom' then
	playSound('idk', 1)
	if difficulty == 2 then
	doTweenAlpha('bitchicantsee', 'camHUD', 0.05, 5, 'linear')
	doTweenAlpha('bitchicantseemyicons', 'camOther', 0.05, 5, 'linear')
	elseif difficulty == 1 then
	doTweenAlpha('bitchicantsee', 'camHUD', 0.05, 3, 'linear')
	doTweenAlpha('bitchicantseemyicons', 'camOther', 0.05, 3, 'linear')
	elseif difficulty == 0 then
	end
    end
end

function onUpdate(elapsed)
if cantseeshit == true then
cantseeshit = false
if difficulty == 2 then
doTweenAlpha('hudiscomingback', 'camHUD', 1, 10, 'linear')
doTweenAlpha('iconsarecomingback', 'camOther', 1, 10, 'linear')
elseif difficulty == 1 then
doTweenAlpha('hudiscomingback', 'camHUD', 1, 5, 'linear')
doTweenAlpha('iconsarecomingback', 'camOther', 1, 5, 'linear')
elseif difficulty == 0 then
end
end
end

function noteMiss(id, direction, noteType, isSustainNote)
end

function onTweenCompleted(tag)
if tag == 'bitchicantsee' then
cantseeshit = true
end
end