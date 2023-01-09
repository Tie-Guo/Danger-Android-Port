
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 700;
local yy = -2000;
local xx2 = 1634.05;
local yy2 = -54.3;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()

	makeLuaSprite('sky', 'airship/sky', -1000, -2300);  
	scaleObject('sky', 1.5, 1.5);
	addLuaSprite('sky', false);
	setProperty('sky.visible', true);

	makeLuaSprite('farclouds', 'airship/farthestClouds', -800, -450);
	scaleObject('farclouds', 1, 1);
	addLuaSprite('farclouds', false);
	setProperty('farclouds.visible', true);

	makeLuaSprite('backclouds', 'airship/backClouds', -800, -250);
	scaleObject('backclouds', 1, 1);
	addLuaSprite('backclouds', false);
	setProperty('baclclouds.visible', true);

	makeLuaSprite('fclouds', 'airship/frontClouds', -800, 50);    
	scaleObject('fclouds', 1, 1);
	addLuaSprite('fclouds', false);
	setProperty('fclouds.visible', true);

	makeLuaSprite('ship', 'airship/airship', 1900, -1250);    
	scaleObject('ship', 1, 1);
	addLuaSprite('ship', false);
	setProperty('ship.visible', true);

	makeAnimatedLuaSprite('fan', 'airship/airshipFan', 2900, -150);
	addAnimationByPrefix('fan', 'fan', 'ala avion instance', 24, true);
	setProperty('fan.alpha', 1)
	addLuaSprite('fan', false);
	scaleLuaSprite('fan', 1, 1)

	makeLuaSprite('bigcloud3', 'airship/bigCloud', 3900, -950);    
	scaleObject('bigcloud3', 1, 1);
	addLuaSprite('bigcloud3', false);
	setProperty('bigcloud3.visible', true);

	makeLuaSprite('bigcloud2', 'airship/bigCloud', 3900, 50);    
	scaleObject('bigcloud2', 1, 1);
	addLuaSprite('bigcloud2', false);
	setProperty('bigcloud2.visible', true);

	makeLuaSprite('bigcloud1', 'airship/bigCloud', 3900, 50);    
	scaleObject('bigcloud1', 1, 1);
	addLuaSprite('bigcloud1', false);
	setProperty('bigcloud1.visible', true);

	makeAnimatedLuaSprite('scream', 'airship/screamsky', -1000, -900);
	addAnimationByPrefix('scream', 'scream', 'scream sky', 12, false);
	setProperty('scream.alpha', 0)
	addLuaSprite('scream', false);
	scaleLuaSprite('scream', 1.5, 1.5)

	makeLuaSprite('dangerbg1', 'airship/fgPlatform', -800, 250);
	width = getProperty("dangerbg1.width")    
	setLuaSpriteScrollFactor('dangerbg1', 1, 1);
	scaleObject('dangerbg1', 1, 1);
	addLuaSprite('dangerbg1', false);
	setProperty('dangerbg1.visible', true);
  
  	makeLuaSprite('dangerbg2', 'airship/fgPlatform', 5050, 250);
 	width = getProperty("dangerbg2.width")    
	setLuaSpriteScrollFactor('dangerbg2', 1, 1);
	scaleObject('dangerbg2', 1, 1);
	addLuaSprite('dangerbg2', false);
	setProperty('dangerbg2.visible', true);
end

function onCreatePost()
doTweenX('floor1', 'dangerbg1', -5600, 1.5, 'linear'); 
doTweenX('floor2', 'dangerbg2', -1000, 1.5, 'linear');
doTweenX('cloud1', 'bigcloud1', -3300, 14.5, 'linear');
doTweenX('cloud2', 'bigcloud2', -3300, 28.5, 'linear');
doTweenX('cloud3', 'bigcloud3', -3300, 60.5, 'linear');
end

function onTweenCompleted(tag)
if tag == 'floor1' then
setProperty("dangerbg1.x", -800)
setProperty("dangerbg2.x", 5050)
doTweenX('floor1', 'dangerbg1', -5600, 1.5, 'linear'); 
doTweenX('floor2', 'dangerbg2', -1000, 1.5, 'linear'); 
end
if tag == 'cloud1' then
setProperty("bigcloud1.x", 3900)
doTweenX('cloud1', 'bigcloud1', -3300, 14.5, 'linear');
end
if tag == 'cloud2' then
setProperty("bigcloud2.x", 3900)
doTweenX('cloud2', 'bigcloud2', -3300, 28.5, 'linear');
end
if tag == 'cloud3' then
setProperty("bigcloud3.x", 3900)
doTweenX('cloud3', 'bigcloud3', -3300, 60.5, 'linear');
end
if tag == 'moveasidegf' then
doTweenX('byegfp1', 'gf', -1660, 2.5, 'linear');
end
end

function onStepHit()
if curStep == 678 then
doTweenX('moveasidegf', 'gf', 830, .5, 'linear');
end
if curStep == 632 then
setProperty('scream.alpha', 1)
objectPlayAnimation('scream', 'scream', false)
end
if curStep == 640 then
setProperty('scream.alpha', 0)
end
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
           
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curStep == 1 then
        setProperty('defaultCamZoom',0.3)
		followchars = true
        xx = 1634.05
        yy = -54.3
        xx2 = 1634.05
        yy2 = -54.3
    end
    if curBeat == 64 then
        setProperty('defaultCamZoom', 0.4)
        followchars = true
        xx = 800
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 96 then
        setProperty('defaultCamZoom', 0.6)
        followchars = true
        xx = 700
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 128 then
        setProperty('defaultCamZoom', 0.4)
        xx = 800
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 155 then
        setProperty('defaultCamZoom', 0.8)
        followchars = true
        xx = 450
        yy = 150
        xx2 = 450
        yy2 = 150
    end
    if curBeat == 160 then
        setProperty('defaultCamZoom', 0.4)
        followchars = true
        xx = 800
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 192 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 700
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 256 then
        setProperty('defaultCamZoom', 0.4)
        followchars = true
        xx = 800
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 288 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 700
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 320 then
        setProperty('defaultCamZoom', 0.3)
        followchars = true
        xx = 1634.05
        yy = -54.3
        xx2 = 1634.05
        yy2 = -54.3
    end
    if curBeat == 384 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 700
        yy = 150
        xx2 = 1200
        yy2 = 150
    end

    
end

