function onCreate()
makeAnimatedLuaSprite('dustpapsicon', 'icons/dust/paps_icons', getProperty('iconP2.x'), getProperty('iconP2.y'))
addAnimationByPrefix('dustpapsicon', 'normal', 'normal_paps', 24, false)
addAnimationByPrefix('dustpapsicon', 'losing', 'loosing_paps', 24, false)
addAnimationByPrefix('dustpapsicon', 'winning', 'winning_paps', 24, false)
setScrollFactor('dustpapsicon', 0, 0)
setObjectCamera('dustpapsicon', 'hud') -- either is under the health bar or nothing
setProperty('dustpapsicon.alpha', 0)
addLuaSprite('dustpapsicon', true)
playAnim('dustpapsicon', 'normal', false)
end
function onCreatePost()
makeLuaSprite('black', '', -500, -300)
makeGraphic('black',6000,6000,'000000')
setObjectCamera('black', 'other');
addLuaSprite('black', true)
setProperty('black.alpha', 0)

makeAnimatedLuaSprite('papyrus', 'characters/paps', -298.7, -175.95)
addAnimationByPrefix('papyrus', 'idle', 'Pap idle', 24, true)
addLuaSprite('papyrus', false)
setProperty('papyrus.alpha', 0)
end

function onUpdate(elapsed)
	setProperty('iconP2.alpha', 0)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('dustpapsicon.x', getProperty('iconP2.x')-100)
	setProperty('dustpapsicon.angle', getProperty('iconP2.angle'))
	setProperty('dustpapsicon.y', getProperty('iconP2.y')- 100)
	setProperty('dustpapsicon.scale.x', getProperty('iconP2.scale.x') - 0.6)
	setProperty('dustpapsicon.scale.y', getProperty('iconP2.scale.y') - 0.6)
end

function onBeatHit()
if curBeat % 2 == 0 then
	if getProperty('health') < 0.5 then
		playAnim('dustpapsicon', 'winning', false)
	elseif getProperty('health') > 1.6 then
		playAnim('dustpapsicon', 'losing', false)
	else
		playAnim('dustpapsicon', 'normal', false)
	end
end
end

function onStepHit()
if curStep == 1232 then
setProperty('black.alpha', 1)
end
if curStep == 1248 then
setProperty('black.alpha', 0)
end
if curStep == 1648 then
triggerEvent('Screen Shake', '7,0.025', '')
end
if curStep == 1768 then
doTweenAlpha('blackcomingin', 'black', 1, 0.1)
triggerEvent('Screen Shake', '5,0.03', '')
end
if curStep == 1821 then
doTweenAlpha('blackcomingout', 'black', 0, 0.1)
doTweenZoom('zoomingin', 'camGame', 1.2, 0.5, 'quadInOut')
end
if curStep == 1815 then
doTweenAlpha('papyrusappearing', 'papyrus', 0.4, 0.4)
doTweenAlpha('papyrusappearingicon', 'dustpapsicon', 0.4, 0.4)
end
end