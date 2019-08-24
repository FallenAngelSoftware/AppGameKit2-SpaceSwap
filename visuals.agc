// "visuals.agc"...

function ClearScreenWithColor ( red as integer, green as integer, blue as integer )
	SetClearColor( red, green, blue ) 
	ClearScreen()
endfunction

//------------------------------------------------------------------------------------------------------------

function LoadAboutScreenTexts ( )
	StartIndexOfAboutScreenTexts = 0
	ATindex = 0
	AboutTexts    [ATindex] = " "
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Space Swap™''"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1

	AboutTexts    [ATindex] = "©2019 By Fallen Angel Software"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	
	AboutTexts    [ATindex] = "www.FallenAngelSoftware.com"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Made With ''AppGameKit Classic''"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "(www.AppGameKit.com)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Game Built On:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	if (Platform = Web or Platform = Windows or Platform = Android)
		AboutTexts    [ATindex] = "Genuine ''Kubuntu 18.04 64Bit L.T.S.'' Linux"
		AboutTextsBlue[ATindex] = 255
		inc ATindex, 1
		AboutTexts    [ATindex] = "(www.Kubuntu.org)"
		AboutTextsBlue[ATindex] = 255
		inc ATindex, 1
		AboutTexts    [ATindex] = "Real Programmers Use Linux!"
		AboutTextsBlue[ATindex] = 255
		inc ATindex, 1
	elseif (Platform = iOS)
		AboutTexts    [ATindex] = "''Apple® macOS v10.13.5 High Sierra''"
		AboutTextsBlue[ATindex] = 255
		inc ATindex, 1
		AboutTexts    [ATindex] = "(https://www.apple.com/macos/high-sierra/)"
		AboutTextsBlue[ATindex] = 255
		inc ATindex, 1
	endif

	AboutTexts    [ATindex] = "Original Game Idea By:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Project Directed By:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "''AppGameKit'' 2-D Game Engine:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "The ''NightRider™'' Engine"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Lead Game Designer:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Lead Game Programmer:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Lead Game Tester:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Game Engine TurboCharger By:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''smallg''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Lead Game Engine Optimization By:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Markus''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Support Game Engine Optimization By:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Support Game Programmers:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1

	AboutTexts    [ATindex] = "''Daotheman''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''theweirdn8''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''mattmatteh''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Lead Graphic Artist:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Oshi Bobo''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "www.OshiBobo.com"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "(For Hire Graphic Artist)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Support Graphic Artist:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	
	AboutTexts    [ATindex] = "Lead Music Artist:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''D.J. Fading Twilight''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "''Neo's Kiss™'' Graphical User Interface By:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''The Fallen Angel''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Bengismo''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Sound Effects Compiled & Edited By:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "The Fallen Angel"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "PNG Graphics Edited In:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''NeoPaint''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "(www.NeoSoftware.com/NPW.html)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "PNG Graphics Optimized Using:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''TinyPNG''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "(www.TinyPNG.com)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "OGG Audio Edited In:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''GoldWave''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "(www.GoldWave.com)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "OGG Audio Optimized Using:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''OGGResizer''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "(www.SkyShape.com)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "''Space Swap™'' Logo Created In:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "Genuine M.S. Office 365 Publisher"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "(www.Office.com)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "95% Of Game Developed On A:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "Hyper-Custom Thin Client Desktop"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Desktop Code Name: ''BumbleBee''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Genuine ''Kubuntu 18.04 64Bit L.T.S.'' Linux"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "ASRock® Q1900-ITX Motherboard"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Intel® Celeron 2GHz 4-Core CPU"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "16GB 1333MHz DDR3 RAM"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Intel® ''Baytrail'' 7th Gen GPU"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Samsung® EVO 850 500GB SSD"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "100 Watt Power Supply"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Last 5% Of Game Developed On A:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "Pro-Built Custom Desktop"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Desktop Code Name: ''JetFire''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Genuine ''Kubuntu 18.04 64Bit L.T.S.'' Linux"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "GigaByte® Mid-Range Motherboard"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Intel® Core i5 3GHz 4-Core CPU"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "16GB 1333MHz DDR3 RAM"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "nVidia® GeForce GTX 750TI 2GB GDDR5 GPU"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Western Digital® 1TB HDD"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "500 Watt Power Supply"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "''Doom4'' Played on Linux On A:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "Pro-Built Custom Super Desktop"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Desktop Code Name: ''Optimus Prime''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Genuine ''Kubuntu 18.04 64Bit L.T.S.'' Linux"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "ASUS® 990FX SaberTooth r2.0 Motherboard"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "AMD® FX 4GHz 8-Core CPU"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "32GB 1333MHz DDR3 RAM"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "nVidia® GeForce GTX 970TT 4GB GDDR5 GPU"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Western Digital® 1TB HDD"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "850 Watt Power Supply"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Studio Hardware Protected By:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "Untangle™ Linux Firewall On Dell® Desktop"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "(www.Untangle.com/Untangle-NG-Firewall/)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "HTML5 Version Tested On:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "Genuine Windows® 10 Pro 64Bit"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Edge''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Firefox''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Chrome''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Opera''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Internet Explorer''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Android Version Tested On:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "Samsung® Galaxy S7 Edge Smartphone"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "Eken® Tablet"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "ASUS® Nexus 7 Tablet"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "iOS Version Tested On:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "Apple® iPad Air Gen1 Tablet"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "Original Game Engine Testers:"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1
	AboutTexts    [ATindex] = "''blink0k''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''easter bunny''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Phaelax''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''NGP''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Jerry McGuire''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''BatVink''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''programming is ace''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Ranietz''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''MikeHart''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Wilf''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''PSY''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''JohnnyMeek''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''=PRoF=''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Blendman''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''29 games''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''nz0''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Stab in the Dark software''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''JLMoondog''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''janbo''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Kevin Picone''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Preben''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Dybing''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''CJB''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''xCept''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''MikeMax''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''smallg''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Kevin Cross''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Markus''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Mobiius''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''fubarpk''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Conjured Entertainment''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''DavidAGK''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''puzzler2018''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''cyberleon''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''claydog72''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Bengismo''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Crazy Programmer''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''Carharttguy''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	AboutTexts    [ATindex] = "''linuxluvuback''"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "You!"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1

	AboutTexts    [ATindex] = "''A 110% By Team Fallen Angel Software!''"
	AboutTextsBlue[ATindex] = 0
	inc ATindex, 1

	AboutTexts    [ATindex] = "(Admin@FallenAngelSoftware.com)"
	AboutTextsBlue[ATindex] = 255
	inc ATindex, 1
	
	NumberOfAboutScreenTexts = ATindex
endfunction

//------------------------------------------------------------------------------------------------------------

function CreateAndInitializeOutlinedText (outline as integer, index as integer, text as string, font as integer, size as integer, red as integer, green as integer, blue as integer, alpha as integer, outRed as integer, outGreen as integer, outBlue as integer, horizontalJustification as integer, screenX as integer, screenY as integer, depth as integer )
	size = (size+7)

	outlineIndex as integer
	outlineIndex = 1

	if outline = TRUE
		posX as integer
		posY as integer
		for posX = -2 to 2 step 1
			for posY = -2 to 2 step 1
				CreateText( index+outlineIndex, text )
				SetTextFont( index+outlineIndex, font ) 
				SetTextSize(index+outlineIndex, size)

				if posX = -2 and posY = -2
					dec screenY, ( GetTextTotalHeight(index+outlineIndex)/2 )
				endif

				SetTextColor(index+outlineIndex, outRed, outGreen, outBlue, alpha)
				SetTextAlignment(index+outlineIndex, horizontalJustification)
				SetTextPosition(index+outlineIndex, screenX+posX, screenY+posY)
				SetTextDepth(index+outlineIndex, depth)
				inc outlineIndex, 1
			next posY
		next posX
	else
		outlineIndex = 26
	endif

	CreateText( index, text )
	SetTextFont( index, font ) 
	SetTextSize(index, size)
	if outline = FALSE then dec screenY, ( GetTextTotalHeight(index)/2 )
	SetTextColor(index, red, green, blue, alpha)
	SetTextAlignment(index, horizontalJustification)
	SetTextPosition(index, screenX, screenY)
	SetTextDepth(index, depth)
	
	inc CurrentMinTextIndex, outlineIndex
endfunction index

//------------------------------------------------------------------------------------------------------------

function SetTextStringOutlined (index as integer, textString as string)
	textIndex as integer
	textIndex = index
	for textIndex = index to (index+25)
		if GetTextExists(textIndex) then SetTextString ( textIndex, textString )
	next textIndex
endfunction

//------------------------------------------------------------------------------------------------------------

function SetText (index as integer, textString as string)
	if GetTextExists(index) then SetTextString (index, textString)
endfunction

//------------------------------------------------------------------------------------------------------------

function DestroyAllTexts ()
	textIndex as integer
	for textIndex = 1 to (CurrentMinTextIndex-1)
		if GetTextExists(textIndex) then DeleteText( textIndex ) 
	next textIndex

	for textindex = 10000 to 29999
		if GetTextExists(textIndex) then SetTextVisible( textIndex, 0 )
	next textIndex
	
	CurrentMinTextIndex = 27
endfunction
