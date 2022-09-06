stopspinning = false
function onUpdate(elapsed)
end

function onTweenCompleted(tag)
if tag == 'flipleft' and stopspinning == false then
doTweenAngle('flipright', 'camGame', 20, 1, 'quadInOut')
doTweenAngle('fliprightH', 'camHUD', 20, 1, 'quadInOut')
doTweenAngle('fliprightO', 'camOther', 20, 1, 'quadInOut')
end
if tag == 'flipright' and stopspinning == false then
doTweenAngle('flipleft', 'camGame', -20, 1, 'quadInOut')
doTweenAngle('flipleftH', 'camHUD', -20, 1, 'quadInOut')
doTweenAngle('flipleftO', 'camOther', -20, 1, 'quadInOut')
end
end

function onStepHit()
if curStep == 570 then
triggerEvent('Screen Shake', '3.6,0.025', '3.6,0.005')
doTweenAngle('flipleft', 'camGame', -20, 1, 'quadInOut')
doTweenAngle('flipleftH', 'camHUD', -20, 1, 'quadInOut')
doTweenAngle('flipleftO', 'camOther', -20, 1, 'quadInOut')
end
if curStep == 938 then
doTweenZoom('zoominonce', 'camGame', 1.2, 1.5, 'quadInOut')
end
if curStep == 970 then
stopspinning = true
doTweenAngle('normal', 'camGame', 0, 1, 'quadInOut')
doTweenAngle('normalH', 'camHUD', 0, 1, 'quadInOut')
doTweenAngle('normalO', 'camOther', 0, 1, 'quadInOut')
end
if curStep == 1231 then
doTweenZoom('zoominonce', 'camGame', 1.2, 1.5, 'quadInOut')
end
if curStep == 1747 then
doTweenZoom('zoominonce', 'camGame', 1.2, 1.5, 'quadInOut')
end
if curStep == 1241 then
stopspinning = false
doTweenAngle('flipleft', 'camGame', -20, 1, 'quadInOut')
doTweenAngle('flipleftH', 'camHUD', -20, 1, 'quadInOut')
doTweenAngle('flipleftO', 'camOther', -20, 1, 'quadInOut')
end
if curStep == 1728 then
stopspinning = true
doTweenAngle('normal', 'camGame', 0, 1, 'quadInOut')
doTweenAngle('normalH', 'camHUD', 0, 1, 'quadInOut')
doTweenAngle('normalO', 'camOther', 0, 1, 'quadInOut')
end
if curStep == 1800 then
doTweenAlpha('allinthehead', 'dad', 0, 10)
doTweenAlpha('allintheheadicon', 'dustpapsicon', 0, 10)
end
end