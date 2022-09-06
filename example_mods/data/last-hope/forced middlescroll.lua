local keepScroll = false

function onCreate()
	keepScroll = getPropertyFromClass('ClientPrefs', 'middleScroll');
	setPropertyFromClass('ClientPrefs', 'middleScroll', true); --Because we always want Middlescroll to be turned on, remove the unnessecary if statement. No matter what keepScroll is, this should always be true.
end

function onUpdatePost()

if not inGameOver then
setPropertyFromGroup('opponentStrums',0,'alpha',0)
setPropertyFromGroup('opponentStrums',1,'alpha',0)
setPropertyFromGroup('opponentStrums',2,'alpha',0)
setPropertyFromGroup('opponentStrums',3,'alpha',0)
end


end


function onDestroy()
	if not keepScroll then -- Checking if true directly? Very, very cringe.
	        setPropertyFromClass('ClientPrefs', 'middleScroll', false);
        end
end