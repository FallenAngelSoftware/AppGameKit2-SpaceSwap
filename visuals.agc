// "visuals.agc"...

function ClearScreenWithColor ( red as integer, green as integer, blue as integer )
	SetClearColor( red, green, blue ) 
	ClearScreen()
endfunction

//------------------------------------------------------------------------------------------------------------

function AddAboutScreenText ( text as string, blue as integer )
	AboutTexts    [ATindex] = text
	AboutTextsBlue[ATindex] = blue
	inc ATindex, 1
endfunction

//------------------------------------------------------------------------------------------------------------

function LoadAboutScreenTexts ( )
	StartIndexOfAboutScreenTexts = 0
	ATindex = 0
	
	AddAboutScreenText("TM", 0)
	AddAboutScreenText("''Space Swap 110%''", 0)
	AddAboutScreenText("©2021 By Team Fallen Angel Software", 255)
	AddAboutScreenText("www.FallenAngelSoftware.com", 255)
	AddAboutScreenText("Made With ''AppGameKit Classic''", 0)
	AddAboutScreenText("(www.AppGameKit.com)", 255)
	AddAboutScreenText("Game Built On:", 0)
	AddAboutScreenText("Genuine ''Kubuntu 18.04 L.T.S. 64Bit'' Linux", 255)
	AddAboutScreenText("(www.Kubuntu.org)", 255)
	AddAboutScreenText("Real Programmers Use Linux!", 255)
	AddAboutScreenText("Original Game Idea By:", 0)
	AddAboutScreenText("''Nintendo®''", 255)
	AddAboutScreenText("Project Directed By:", 0)
	AddAboutScreenText("''The Fallen Angel''", 255)
	AddAboutScreenText("''AppGameKit'' 2-D Game Engine:", 0)
	AddAboutScreenText("The ''NightRider'' Engine[TM]", 255)
	AddAboutScreenText("''The Fallen Angel''", 255)
	AddAboutScreenText("Lead Game Designer:", 0)
	AddAboutScreenText("''The Fallen Angel''", 255)
	AddAboutScreenText("Lead Game Programmer:", 0)
	AddAboutScreenText("''The Fallen Angel''", 255)
	AddAboutScreenText("Lead Game Tester:", 0)
	AddAboutScreenText("''The Fallen Angel''", 255)
	AddAboutScreenText("Optimizations Tested Using:", 0)
	AddAboutScreenText("''BES – Battle Encoder Shirase'''", 255)
	AddAboutScreenText("(http://mion.faireal.net/BES/)", 255)
	AddAboutScreenText("Support Game Programmers:", 0)
	AddAboutScreenText("''Daotheman''", 255)
	AddAboutScreenText("''theweirdn8''", 255)
	AddAboutScreenText("''mattmatteh''", 255)
	AddAboutScreenText("Lead Graphic Artist:", 0)
	AddAboutScreenText("''Oshi Bobo''", 255)
	AddAboutScreenText("''www.OshiBobo.com''", 255)
	AddAboutScreenText("(For Hire Graphic Artist)", 255)
	AddAboutScreenText("Support Graphic Artist:", 0)
	AddAboutScreenText("''The Fallen Angel''", 255)
	AddAboutScreenText("Lead Music Artist:", 0)
	AddAboutScreenText("''D.J. Fading Twilight''", 255)
	AddAboutScreenText("''Neo's Kiss'' Graphical User Interface By:", 0)
	AddAboutScreenText("''The Fallen Angel''", 255)
	AddAboutScreenText("Sound Effects Compiled & Edited By:", 0)
	AddAboutScreenText("''The Fallen Angel''", 255)
	AddAboutScreenText("PNG Graphics Edited In:", 0)
	AddAboutScreenText("''NeoPaint''", 255)
	AddAboutScreenText("(www.NeoSoftware.com/NPW.html)", 255)
	AddAboutScreenText("PNG Graphics Optimized Using:", 0)
	AddAboutScreenText("''TinyPNG''", 255)
	AddAboutScreenText("(www.TinyPNG.com)", 255)
	AddAboutScreenText("OGG Audio Edited In:", 0)
	AddAboutScreenText("''GoldWave''", 255)
	AddAboutScreenText("(www.GoldWave.com)", 255)
	AddAboutScreenText("OGG Audio Optimized Using:", 0)
	AddAboutScreenText("''OGGResizer''", 255)
	AddAboutScreenText("(www.SkyShape.com)", 255)
	AddAboutScreenText("''Space Swap 110%'' Logo Created In:", 0)
	AddAboutScreenText("Genuine M.S. Office 365 Publisher", 255)
	AddAboutScreenText("(www.Office.com)", 255)
		
	AddAboutScreenText("Game Created On A:", 0)
	AddAboutScreenText("Hyper-Custom ''JeZxLee'' Pro-Built Desktop", 255)
	AddAboutScreenText("Desktop Code Name: ''Optimus Prime''", 255)
	AddAboutScreenText("Genuine ''Kubuntu 18.04 L.T.S. 64Bit'' Linux", 255)
	AddAboutScreenText("Corsair® 750watt Modular Power Supply", 255)
	AddAboutScreenText("GIGABYTE® GA-970A-DS3P 2.0 AM3+ Motherboard", 255)
	AddAboutScreenText("AMD® FX 3.5GHz(4GHz Turbo) 8-Core CPU", 255)
	AddAboutScreenText("Corsair® 32GB DDR3 RAM Memory", 255)
	AddAboutScreenText("nVidia® GeForce GTX 970TT 4GB GDDR5 GPU", 255)
	AddAboutScreenText("ADATA® 1TB SSD Hard Drive(OS/Apps)", 255)
	AddAboutScreenText("Western Digital® 1TB HDD Hard Drive(Personal Data)", 255)
		
	AddAboutScreenText("HTML5 Version Tested On:", 0)
	AddAboutScreenText("Genuine Windows® 10 Pro 64Bit", 255)
	AddAboutScreenText("Edge", 255)
	AddAboutScreenText("Firefox", 255)
	AddAboutScreenText("Chrome", 255)
	AddAboutScreenText("Opera", 255)
	AddAboutScreenText("Android Version Tested On:", 0)
	AddAboutScreenText("Samsung® Galaxy S7 Edge Smartphone", 255)
	AddAboutScreenText("Onn® Android 10.1'' 16GB Tablet", 255)
	AddAboutScreenText("Big Thank You To People Who Helped:", 0)
	AddAboutScreenText("''blink0k''", 255)
	AddAboutScreenText("''easter bunny''", 255)
	AddAboutScreenText("''Phaelax''", 255)
	AddAboutScreenText("''NGP''", 255)
	AddAboutScreenText("''Jerry McGuire''", 255)
	AddAboutScreenText("''BatVink''", 255)
	AddAboutScreenText("''programming is ace''", 255)
	AddAboutScreenText("''Ranietz''", 255)
	AddAboutScreenText("''MikeHart''", 255)
	AddAboutScreenText("''Wilf''", 255)
	AddAboutScreenText("''PSY''", 255)
	AddAboutScreenText("''JohnnyMeek''", 255)
	AddAboutScreenText("''=PRoF=''", 255)
	AddAboutScreenText("''Xaron''", 255)
	AddAboutScreenText("''AjiMundi''", 255)
	AddAboutScreenText("''nz0''", 255)
	AddAboutScreenText("''Blendman''", 255)
	AddAboutScreenText("''29 games''", 255)
	AddAboutScreenText("''Stab in the Dark software''", 255)
	AddAboutScreenText("''JLMoondog''", 255)
	AddAboutScreenText("''janbo''", 255)
	AddAboutScreenText("''Kevin Picone''", 255)
	AddAboutScreenText("''Preben''", 255)
	AddAboutScreenText("''Dybing''", 255)
	AddAboutScreenText("''MikeHart''", 255)
	AddAboutScreenText("''PartTimeCoder''", 255)
	AddAboutScreenText("''mash''", 255)
	AddAboutScreenText("''MikeMax''", 255)
	AddAboutScreenText("''xCept''", 255)
	AddAboutScreenText("''smallg''", 255)
	AddAboutScreenText("''Markus''", 255)
	AddAboutScreenText("''Kevin Cross''", 255)
	AddAboutScreenText("''Mobiius''", 255)
	AddAboutScreenText("''CJB''", 255)
	AddAboutScreenText("''puzzler2018''", 255)
	AddAboutScreenText("''fubarpk''", 255)
	AddAboutScreenText("''Conjured Entertainment''", 255)
	AddAboutScreenText("''DavidAGK''", 255)
	AddAboutScreenText("''LillyByte''", 255)
	AddAboutScreenText("''Midget Blaster''", 255)
	AddAboutScreenText("''basicFanatic''", 255)
	AddAboutScreenText("''nonom''", 255)
	AddAboutScreenText("''Alex_Peres''", 255)
	AddAboutScreenText("''Riusz''", 255)
	AddAboutScreenText("''Rick Nasher''", 255)
	AddAboutScreenText("''Scraggle''", 255)
	AddAboutScreenText("''Bengismo''", 255)
	AddAboutScreenText("''IronManhood''", 255)
	AddAboutScreenText("''Xaby''", 255)
	AddAboutScreenText("''Jack''", 255)
	AddAboutScreenText("''Ortu''", 255)
	AddAboutScreenText("''Crazy Programmer''", 255)
	AddAboutScreenText("''Carharttguy''", 255)
	AddAboutScreenText("''linuxluvuback''", 255)
	AddAboutScreenText("''Cliff Mellangard 3DEGS''", 255)
	AddAboutScreenText("''TomToad''", 255)
	AddAboutScreenText("''Supertino''", 255)
	AddAboutScreenText("''Golelorn''", 255)
	AddAboutScreenText("''hoyoyo80''", 255)
	AddAboutScreenText("''Sh4d0xx''", 255)
	AddAboutScreenText("''Zigi''", 255)
	AddAboutScreenText("''Tristanlogd''", 255)
	AddAboutScreenText("''Rich Dersheimer''", 255)
	AddAboutScreenText("''PHeMoX''", 255)
	AddAboutScreenText("''JokerZ''", 255)
	AddAboutScreenText("''Takis76''", 255)
	AddAboutScreenText("''Tobias_Ripper''", 255)
	AddAboutScreenText("''GarBenjamin''", 255)
	AddAboutScreenText("''Mac''", 255)
	AddAboutScreenText("''The Next''", 255)
	AddAboutScreenText("''fraktal77''", 255)
	AddAboutScreenText("''Maverick_LSC''", 255)
	AddAboutScreenText("''GH69''", 255)
	AddAboutScreenText("''Santman''", 255)
	AddAboutScreenText("''adambiser''", 255)
	AddAboutScreenText("''BraindeaD''", 255)
	AddAboutScreenText("''Lee Rayson''", 255)
	AddAboutScreenText("''Parry''", 255)
	AddAboutScreenText("''AliceSim1''", 255)
	AddAboutScreenText("''Qugurun''", 255)
	AddAboutScreenText("''Bored of the Rings''", 255)
	AddAboutScreenText("''Bubba''", 255)
	AddAboutScreenText("''Pfaber1''", 255)
	AddAboutScreenText("''Onomatopoesie''", 255)
	AddAboutScreenText("''tiresius''", 255)
	AddAboutScreenText("''Sph!nx''", 255)
	AddAboutScreenText("''Captain Ouais''", 255)
	AddAboutScreenText("''NPNPNPNPNPNP''", 255)
	AddAboutScreenText("''LucidWhite''", 255)
	AddAboutScreenText("''Dark Raven''", 255)
	AddAboutScreenText("''Qube_''", 255)
	AddAboutScreenText("''smerf''", 255)
	AddAboutScreenText("''Loktofeit''", 255)
	AddAboutScreenText("''EdzUp''", 255)
	AddAboutScreenText("''SFSW''", 255)
	AddAboutScreenText("''DannyD''", 255)
	AddAboutScreenText("''Virtual Nomad''", 255)
	AddAboutScreenText("''george++''", 255)
	AddAboutScreenText(" ", 255)
	AddAboutScreenText("''You!''", 255)
	AddAboutScreenText("''A 110% By Team Fallen Angel Software!''", 0)
	AddAboutScreenText("(Admin@FallenAngelSoftware.com)", 255)

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
		for posX = -2 to 2 step 2
			for posY = -2 to 2 step 2
				if (posX = 0 and posY = 0)
					
				else
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
				endif
			next posY
		next posX
	endif
	outlineIndex = 26

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
