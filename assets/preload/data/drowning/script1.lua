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
if curStep == 252 then
doTweenZoom('zoominonce', 'camGame', 1.2, 1, 'quadInOut')
end
if curStep == 528 then
doTweenZoom('zoomin', 'camGame', 1.2, 15, 'quadInOut')
end
if curStep == 656 then
doTweenZoom('zoomout', 'camGame', 0.65, 15, 'quadInOut')
end
end