function onCreatePost()
makeAnimatedLuaSprite('papyrus', 'characters/paps', -298.7, -175.95)
addAnimationByPrefix('papyrus', 'idle', 'Pap idle', 24, true)
addLuaSprite('papyrus', false)
setProperty('papyrus.alpha', 0)
end

function onUpdate(elapsed)
end

function onStepHit()
if curStep == 880 then
doTweenAlpha('papyrusappearing', 'papyrus', 0.4, 0.4)
end
if curStep == 1154 then
doTweenAlpha('papyrusdisappearing', 'papyrus', 0, 0.4)
end
end

function onBeatHit()
if curBeat % 2 == 0 then
playAnim('papyrus', 'idle')
end
end