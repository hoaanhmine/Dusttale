function onUpdate(elapsed)
    if getProperty('health') > 0.3 and difficulty == 0 or getProperty('health') > 0.3 then
		if difficulty == 2 or difficulty == 1 then
        setProperty('health', getProperty('health')- 0.0003);
		end
    end
end

function onBeatHit()
if curBeat >= 64 and curBeat % 20 == 0 and difficulty == 0 or curBeat >= 64 and curBeat % 20 == 0 then
characterPlayAnim('dad','attack',false);
runTimer('delay', 0.05);
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'delay' and difficulty == 0 or tag == 'delay' then
triggerEvent('Screen Shake', '0.1, 0.035', '0.1, 0.035');
playSound('slash_effect');
if difficulty == 2 then
setProperty('health', getProperty('health')- 0.75);
elseif difficulty == 1 then 
setProperty('health', getProperty('health')- 0.25);
elseif difficulty == 0 then
end
end
end