function onStepHit()
if curStep == 272 then
-- there's supposed to be a glitch effet here too, but it's a shader. i don't know how to port shaders and this was made on version 0.6.2, which is before shaders were added, they're only in action builds at the time of porting this.
triggerEvent('Screen Shake', '16,0.010', '')
end
end