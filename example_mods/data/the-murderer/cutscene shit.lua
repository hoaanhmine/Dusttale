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
makeAnimatedLuaSprite('sans', 'dialogue/dialogue_sans_snowdin', 0, -50)
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
		startVideo('themurderer')
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
runTimer('2', 0.045, 4)--Bep.
end
if words == 2 then
doTweenAlpha('speakerswitch', 'sans', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'bf', 0.25, 0.5, 'linear')
runTimer('3', 0.045, 44)--who are you... you are not the human i know.
cancelTimer('boploop1')
playAnim('sans', 'worry')
sansanim = 'worry'
runTimer('bopreset', 0.7, 1)
end
if words == 3 then
doTweenAlpha('speakerswitch', 'bf', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'sans', 0.25, 0.5, 'linear')
runTimer('4', 0.045, 10)--Skeep bap.
end
if words == 4 then
doTweenAlpha('speakerswitch', 'sans', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'bf', 0.25, 0.5, 'linear')
runTimer('5', 0.045, 50)--..no no no.. i can’t! i’m.. i’m not ready..!
end
if words == 5 then
doTweenAlpha('speakerswitch', 'bf', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'sans', 0.25, 0.5, 'linear')
runTimer('6', 0.045, 7)--Skbeep?
end
if words == 6 then
doTweenAlpha('speakerswitch', 'sans', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'bf', 0.25, 0.5, 'linear')
runTimer('7', 0.045, 5)--..i..
end
if words == 7 then
doTweenAlpha('speakerswitch', 'sans', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'bf', 0.25, 0.5, 'linear')
runTimer('8', 0.045, 3)--...
end
if words == 8 then
doTweenAlpha('speakerswitch', 'sans', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'bf', 0.25, 0.5, 'linear')
cancelTimer('boploop1')
playAnim('sans', 'mad')
sansanim = 'mad'
runTimer('bopreset', 0.7, 1)
runTimer('9', 0.045, 32)--...i... ...don’t have enough..
end
if words == 9 then
doTweenAlpha('speakerswitch', 'bf', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'sans', 0.25, 0.5, 'linear')
runTimer('10', 0.045, 7)--...bop?
end
if words == 10 then
doTweenAlpha('speakerswitch', 'sans', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'bf', 0.25, 0.5, 'linear')
playAnim('sans', 'normal')
sansanim = 'normal'
runTimer('bopreset', 0.7, 1)
runTimer('11', 0.045, 7)--...i...
end
if words == 11 then
doTweenAlpha('speakerswitch', 'sans', 1, 0.5, 'linear')
doTweenAlpha('speakerswitch2', 'bf', 0.25, 0.5, 'linear')
playAnim('sans', 'mad')
sansanim = 'mad'
runTimer('bopreset', 0.7, 1)
runTimer('12', 0.045, 3)--...
end
if words == 12 then
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

function onEndSong()
    if not seenCutsceneend and isStoryMode then
        setProperty('inCutscene', true);
        runTimer('transition', 0.1);
        seenCutsceneend = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'openthebox' then
	setProperty('inCutscene', true);
	playMusic('cave', 0.7, true)
	setProperty('box.alpha', 1)
	setProperty('black.alpha', 0.5)
	setProperty('sans.alpha', 1)
	setProperty('bf.alpha', 0.25)
	setProperty('words.alpha', 1)
	setProperty('dustbficon.visible', false)
	setProperty('dustsansicon.visible', false)
	runTimer('boploop1', 0.5, 1)
	runTimer('1', 0.045, 4)-- wha-
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
	setTextString('words', string.sub("wha-", 0, (loops - loopsLeft)));
	if loopsLeft == 3 then
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
	if loopsLeft == 3 then
	words = 2
	setTextFont("words", "PhantomMuff.ttf")
	end
	setTextString('words', string.sub("Bep.", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "3" then
		wordsgoing = true
        playSound("sans", 0.5)
	if loopsLeft == 43 then
	words = 3
	setTextFont("words", "comic sans.ttf")
	end
	setTextString('words', string.sub("who are you... you are not the human i know.", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "4" then
		wordsgoing = true
        playSound("bf", 0.5)
	if loopsLeft == 9 then
	words = 4
	setTextFont("words", "PhantomMuff.ttf")
	end
	setTextString('words', string.sub("Skeep bap.", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "5" then
		wordsgoing = true
        playSound("sans", 0.5)
	if loopsLeft == 49 then
	words = 5
	setTextFont("words", "comic sans.ttf")
	end
	setTextString('words', string.sub("..no no no.. i can’t! i’m.. i’m not ready..!", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "6" then
		wordsgoing = true
        playSound("bf", 0.5)
	if loopsLeft == 6 then
	words = 6
	setTextFont("words", "PhantomMuff.ttf")
	end
	setTextString('words', string.sub("Skbeep?", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "7" then
		wordsgoing = true
        playSound("sans", 0.5)
	if loopsLeft == 4 then
	words = 7
	setTextFont("words", "comic sans.ttf")
	end
	setTextString('words', string.sub("..i..", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "8" then
		wordsgoing = true
        playSound("sans", 0.5)
	if loopsLeft == 2 then
	words = 8
	setTextFont("words", "comic sans.ttf")
	end
	setTextString('words', string.sub("...", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "9" then
		wordsgoing = true
        playSound("sans", 0.5)
	if loopsLeft == 31 then
	words = 9
	setTextFont("words", "comic sans.ttf")
	end
	setTextString('words', string.sub("...i... ...don’t have enough..", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "10" then
		wordsgoing = true
        playSound("bf", 0.5)
	if loopsLeft == 6 then
	words = 10
	setTextFont("words", "PhantomMuff.ttf")
	end
	setTextString('words', string.sub("...bop?", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "11" then
		wordsgoing = true
        playSound("sans", 0.5)
	if loopsLeft == 6 then
	words = 11
	setTextFont("words", "comic sans.ttf")
	end
	setTextString('words', string.sub("...i...", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == "12" then
		wordsgoing = true
        playSound("sans", 0.5)
	if loopsLeft == 2 then
	words = 12
	setTextFont("words", "comic sans.ttf")
	end
	setTextString('words', string.sub("...", 0, (loops - loopsLeft)));
    if loopsLeft == 0 then
		wordsgoing = false
		inwords = true
    end
    end

    if tag == 'transition' then
        runTimer('cuts', 27);
		runTimer('onesecond', 40.1);
        startVideo('themurderer2');
    end
	
	if tag == 'cuts' then
	setProperty('inCutscene', false);
	endSong()
	end
end