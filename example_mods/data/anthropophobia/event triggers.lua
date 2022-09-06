canHit = false
isAttacking = false
attackedSans = false
function onCreate()
makeLuaSprite('pressSpace', 'press', 350, 200)
setObjectCamera('pressSpace', 'hud');
scaleObject('pressSpace', 0.55, 0.55)
addLuaSprite('pressSpace', true)
setProperty('pressSpace.visible', false)

makeLuaSprite('attack', 'attack', 100, 0)
scaleObject('attack', 1, 1)
addLuaSprite('attack', true)
setProperty('attack.visible', false)

makeLuaSprite('miss', 'miss', 100, 0)
scaleObject('miss', 1, 1)
addLuaSprite('miss', true)
setProperty('miss.alpha', 0)

makeLuaSprite('hit', '-20', 100, 0)
scaleObject('hit', 1, 1)
addLuaSprite('hit', true)
setProperty('hit.alpha', 0)
end

function onStepHit()
if curStep == 1 then
setProperty('pressSpace.visible', true)
end
if curStep == 90 then
setProperty('pressSpace.visible', false)
end
if curStep == 114 then
canHit = true
setProperty('attack.visible', true)
playSound('warning', 1)
end
if curStep == 134 then
canHit = false
setProperty('attack.visible', false)
end
if curStep == 452 then
canHit = true
setProperty('attack.visible', true)
playSound('warning', 1)
end
if curStep == 472 then
canHit = false
setProperty('attack.visible', false)
end
if curStep == 681 then
canHit = true
setProperty('attack.visible', true)
playSound('warning', 1)
end
if curStep == 701 then
canHit = false
setProperty('attack.visible', false)
end
if curStep == 1184 then
canHit = true
setProperty('attack.visible', true)
playSound('warning', 1)
end
if curStep == 1204 then
canHit = false
setProperty('attack.visible', false)
end
if curStep == 1216 then
canHit = true
setProperty('attack.visible', true)
playSound('warning', 1)
end
if curStep == 1236 then
canHit = false
setProperty('attack.visible', false)
end
if curStep == 1280 then
canHit = true
setProperty('attack.visible', true)
playSound('warning', 1)
end
if curStep == 1300 then
canHit = false
setProperty('attack.visible', false)
end
if curStep == 2080 then
canHit = true
setProperty('attack.visible', true)
playSound('warning', 1)
end
if curStep == 2100 then
canHit = false
setProperty('attack.visible', false)
end
if curStep == 544 then
triggerEvent('Screen Shake', '8.35,0.010', '')
end
end

function onUpdate(elapsed)
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
attack()
end
end

function attack()
if isAttacking == false then
isAttacking = true
setProperty('attack.visible', false)
playAnim('boyfriend', 'attack')
setProperty('boyfriend.specialAnim', true);
runTimer('nomorespecialanim', 1, 1)
playSound('snd_laz', 1)
if canHit == false then
setProperty('miss.alpha', 1)
doTweenAlpha('thisdudemissedlol', 'miss', 0, 2)
end
if canHit == true then
attackedSans = true
runTimer('playthesoundONEFUCKINGTIME', 0.1, 1)
setProperty('health', getProperty('health')+4)
setProperty('hit.alpha', 1)
doTweenAlpha('owmyballs=(', 'hit', 0, 2)
end
end
end

function onTimerCompleted(tag)
if tag == 'nomorespecialanim' then
setProperty('boyfriend.specialAnim', false);
isAttacking = false
end
if tag == 'playthesoundONEFUCKINGTIME' then
playSound('slash_effect', 1)
triggerEvent('Screen Shake', '0.1,0.025', '')
end
if tag == 'transition' then
	if attackedSans == false then
    runTimer('cuts', 10);
    startVideo('pacifist');
	end
	if attackedSans == true then
    runTimer('cuts', 27);
    startVideo('genocide');
	end
    end
	
	if tag == 'cuts' then
	if attackedSans == false then
	loadSong('Last Hope')
	end
	if attackedSans == true then
	loadSong('Hallucinations')
	end
	end
end

function onEndSong()
    if not seenCutsceneend and isStoryMode then
        setProperty('inCutscene', true);
        runTimer('transition', 0.1);
        seenCutsceneend = true;
        return Function_Stop;
    end
    return Function_Continue;
end