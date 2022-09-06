gettingblasted = false
-- Event notes hooks
function onCreatePost()
makeAnimatedLuaSprite('blastma', 'gasterBlaster', -600, 255)
addAnimationByPrefix('blastma', 'shoot', 'shoot', 24, false)
scaleObject('blastma', 0.7, 0.7)
addLuaSprite('blastma', true)
setObjectCamera('blastma', 'other')
setProperty('blastma.alpha', 0)
end
function onEvent(name, value1, value2)
	if name == 'Blaster' then
	setProperty('blastma.alpha', 1)
	objectPlayAnimation('blastma', 'shoot', true)
	runTimer('blastmanuts', 0.25)
	runTimer('blasted', 0.35)
	end
end

function onUpdate(elapsed)
if gettingblasted == true then
if difficulty == 2 then
setProperty('health', 0.1)
elseif difficulty == 1 then
setProperty('health', getProperty('health')-0.1)
elseif difficulty == 0 then
end
end
end

function onTimerCompleted(tag)
	if tag == 'blastmanuts' then
	playSound('blaster_shoot', 1)
	gettingblasted = true
	end

	if tag == 'blasted' then
	gettingblasted = false
	end
end