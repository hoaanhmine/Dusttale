function onCreate()

	makeLuaSprite('bg', 'dusttale_background/bg', -2150, -500);
	scaleObject('bg', 1, 1);
	setScrollFactor('bg', 1, 1);

	makeLuaSprite('bgi', 'dusttale_background/light', -2150, -500);
	scaleObject('bgi', 1, 1);
	setScrollFactor('bgi', 1, 1);
	
	addLuaSprite('bg', false);
	addLuaSprite('bgi', true);
end

function onStepHit()
if curStep == 1648 then
doTweenColor('bloodred', 'bg', 'FF0000', 0.5, 'linear')
doTweenColor('bloodredi', 'bgi', 'FF0000', 0.5, 'linear')
doTweenColor('bloodredbf', 'boyfriend', 'FF0000', 0.5, 'linear')
doTweenColor('bloodredsans', 'dad', 'FF0000', 0.5, 'linear')
doTweenColor('bloodredgf', 'gf', 'FF0000', 0.5, 'linear')
doTweenColor('bloodredpapyrus', 'papyrus', 'FF0000', 0.5, 'linear')
end
if curStep == 1751 then
doTweenAlpha('papscomingin', 'papyrus', 0.7, 0.5)
end
end