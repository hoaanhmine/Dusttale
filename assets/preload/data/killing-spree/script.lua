singing = false
idleoffsets = {'0', '0'}
leftoffsets = {'-199', '-5'}
downoffsets = {'-270', '-30'}
upoffsets = {'-141', '120'}
rightoffsets = {'20', '-23'}
function onCreatePost()
makeAnimatedLuaSprite('papyrus', 'characters/dusttalepaps', -300, 250)
addAnimationByPrefix('papyrus', 'idle', 'idle', 24, false)
addAnimationByPrefix('papyrus', 'left', 'left', 24, false)
addAnimationByPrefix('papyrus', 'right', 'right', 24, false)
addAnimationByPrefix('papyrus', 'down', 'down', 24, false)
addAnimationByPrefix('papyrus', 'up', 'up', 24, false)
setProperty('papyrus.offset.x', leftoffsets[1])
setProperty('papyrus.offset.y', leftoffsets[2])
addLuaSprite('papyrus', true)
setProperty('papyrus.alpha', 0)
end

function onBeatHit()
if curBeat % 2 == 0 and singing == false then
setProperty('papyrus.offset.x', idleoffsets[1])
setProperty('papyrus.offset.y', idleoffsets[2])
playAnim('papyrus', 'idle', false)
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Papyrus Note' then
	singing = true
	runTimer('nomoresing', 0.4, 0)
	if direction == 0 then
	setProperty('papyrus.offset.x', leftoffsets[1])
	setProperty('papyrus.offset.y', leftoffsets[2])
	playAnim('papyrus', 'left', false)
	end
	if direction == 1 then
	setProperty('papyrus.offset.x', downoffsets[1])
	setProperty('papyrus.offset.y', downoffsets[2])
	playAnim('papyrus', 'down', false)
	end
	if direction == 2 then
	setProperty('papyrus.offset.x', upoffsets[1])
	setProperty('papyrus.offset.y', upoffsets[2])
	playAnim('papyrus', 'up', false)
	end
	if direction == 3 then
	setProperty('papyrus.offset.x', rightoffsets[1])
	setProperty('papyrus.offset.y', rightoffsets[2])
	playAnim('papyrus', 'right', false)
	end
    end
end

function onTimerCompleted(tag)
if tag == 'nomoresing' then
singing = false
end
end