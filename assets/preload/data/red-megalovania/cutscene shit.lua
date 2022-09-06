wordsgoing = false
inwords = false
words = 0
sansanim = 'normal'
bfanim = 'normal'
function onCreatePost()
makeLuaSprite('black', '', -500, -300)
makeGraphic('black',6000,6000,'000000')
addLuaSprite('black', true)
setProperty('black.alpha', 0)
makeAnimatedLuaSprite('sans', 'dialogue/dialogue_sans_waterfall', 0, -50)
addAnimationByPrefix('sans', 'normal', 'normal', 24, false)
addAnimationByPrefix('sans', 'worry', 'worry', 24, false)
addAnimationByPrefix('sans', 'mad', 'mad', 24, false)
scaleObject('sans', 1, 1);
addLuaSprite('sans', true);
setProperty('sans.alpha', 0)
setObjectCamera('sans', 'hud');
makeAnimatedLuaSprite('bf', 'dialogue/bf_dia', 700, 175)
addAnimationByPrefix('bf', 'normal', 'BF_normal', 24, false)
addAnimationByPrefix('bf', 'chara', 'bf_chara', 24, false)
scaleObject('bf', 1, 1);
addLuaSprite('bf', true);
setProperty('bf.alpha', 0)
setObjectCamera('bf', 'hud');
makeLuaSprite('box', 'dialogue/box', 225, 400)
addLuaSprite('box', true);
setProperty('box.alpha', 0)
setObjectCamera('box', 'hud');
makeLuaText("words", "blahblahblahblahblahblahblahblahblahblahblah", 700, 280, 425)
setTextSize("words", 45)
setTextBorder("words", 0, FFFFFF)
setTextColor("words", "FFFFFF")
setTextFont("words", "comic sans.ttf")
setTextAlignment("words", "left")
addLuaText("words")
setProperty('words.alpha', 0)
end

local allowCountdown = false
local playDialogue = false
function onStartCountdown()
	if isStoryMode and not allowCountdown and not seenCutscene then --Block the first countdown
		allowCountdown = true;
		startVideo('redmegalovania')
		playDialogue = true
		return Function_Stop;
	elseif playDialogue then
	runTimer('openthebox', 0.75, 1)
	playDialogue = false
	return Function_Stop;
	end
	return Function_Continue;
end

function onUpdate(elapsed)
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
if inwords == true and getProperty('words.alpha') == 1 then
if words == 1 then
doTweenAlpha('speakerswitch', 'bf', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'sans', 0.25, 0.5, 'linear')
runTimer('2', 0.045, 5)--Beep!
end
if words == 2 then
doTweenAlpha('speakerswitch', 'sans', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'bf', 0.25, 0.5, 'linear')
cancelTimer('boploop1')
playAnim('sans', 'normal')
sansanim = 'normal'
runTimer('bopreset', 0.7, 1)
runTimer('3', 0.045, 42)--i...well..., guess i don’t got a choice.
end
if words == 3 then
doTweenAlpha('endingdialsans', 'sans', 0, 0.5, 'linear')
doTweenAlpha('endingdialbf', 'bf', 0, 0.5, 'linear')
doTweenAlpha('endingdialbox', 'box', 0, 0.5, 'linear')
doTweenAlpha('endingdialblack', 'black', 0, 0.5, 'linear')
doTweenAlpha('endingdialwords', 'words', 0, 0.5, 'linear')
soundFadeOut('', 0.5, 0)
end
end
end
end

function onTweenCompleted(tag)
if tag == 'endingdialblack' then
startCountdown()
setProperty('dustbficon.visible', true)
setProperty('dustsansicon.visible', true)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'openthebox' then
	setProperty('inCutscene', true);
	playMusic('spook', 0.7, true)
	setProperty('box.alpha', 1)
	setProperty('black.alpha', 0.5)
	setProperty('sans.alpha', 1)
	setProperty('bf.alpha', 0.25)
	setProperty('words.alpha', 1)
	setProperty('dustbficon.visible', false)
	setProperty('dustsansicon.visible', false)
	runTimer('boploop1', 0.5, 1)
	runTimer('1', 0.045, 13)-- ...you again?
	cancelTimer('boploop1')
	playAnim('sans', 'mad')
	sansanim = 'mad'
	runTimer('bopreset', 0.7, 1)
	words = 1
	end

	if tag == 'boploop1' then
	playAnim('sans', sansanim)
	playAnim('bf', bfanim)
	runTimer('boploop1', 0.5, 1)
	end

	if tag == 'bopreset' then
	runTimer('boploop1', 0.5, 1)
	end

    if tag == "1" then
		wordsgoing = true
        playSound("sans", 0.5)
	setTextString('words', string.sub("...you again?", 0, (loops - loopsLeft)));
	if loopsLeft == 12 then
	setTextFont("words", "comic sans.ttf")
	end
	if loopsLeft == 0 then
	wordsgoing = false
	inwords = true
    end
    end

    if tag == "2" then
		wordsgoing = true
        playSound("bf", 0.5)
	if loopsLeft == 4 then
	words = 2
	setTextFont("words", "PhantomMuff.ttf")
	end
	setTextString('words', string.sub("Beep!", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "3" then
		wordsgoing = true
        playSound("sans", 0.5)
	if loopsLeft == 41 then
	words = 3
	setTextFont("words", "comic sans.ttf")
	end
	setTextString('words', string.sub("i...well..., guess i don’t got a choice.", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end
end