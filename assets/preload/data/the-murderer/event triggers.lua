function onUpdate(elapsed)
end

function onTweenCompleted(tag)
if tag == 'zoomin' then
setProperty('defaultCamZoom', 1.2)
setProperty('opponentCameraOffset.x', 0)
end
if tag == 'zoomout' then
setProperty('defaultCamZoom', 0.65)
setProperty('opponentCameraOffset.x', 200)
end
end

function onStepHit()
if curStep == 1 then
luaDebugMode = true
end
if curStep == 442 then
setProperty('songSpeed', 2.8)
end
if curStep == 635 then
setProperty('songSpeed', 2.4)
end
if curStep == 894 then
doTweenZoom('zoomin', 'camGame', 1.2, 4, 'quadInOut')
end
if curStep == 1085 then
doTweenZoom('zoomout', 'camGame', 0.65, 8, 'quadInOut')
end
if curStep == 1146 then
setProperty('songSpeed', 2.8)
end
if curStep == 1337 then
setProperty('songSpeed', 2.4)
end
end