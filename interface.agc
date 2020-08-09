// "interface.agc"...

function LoadInterfaceSprites()
	titleInteface as integer
	titleInteface = 0
	if (ScreenToDisplay <> PlayingScreen) then titleInteface = 1
		
	LeftArrow = CreateSprite ( 100 )
	SetSpriteDepth ( LeftArrow, 3 )
	SetSpriteOffset( LeftArrow, (GetSpriteWidth(LeftArrow)/2) , (GetSpriteHeight(LeftArrow)/2) ) 
	SetSpritePositionByOffset( LeftArrow, -9999, -9999 )
	SetSpriteVisible( LeftArrow, titleInteface )

	RightArrow = CreateSprite ( 101 )
	SetSpriteDepth ( RightArrow, 3 )
	SetSpriteOffset( RightArrow, (GetSpriteWidth(RightArrow)/2) , (GetSpriteHeight(RightArrow)/2) ) 
	SetSpritePositionByOffset( RightArrow, -9999, -9999 )
	SetSpriteVisible( RightArrow, titleInteface )

	SelectorLine = CreateSprite ( 122 )
	SetSpriteDepth ( SelectorLine, 4 )
	SetSpriteOffset( SelectorLine, (GetSpriteWidth(SelectorLine)/2) , (GetSpriteHeight(SelectorLine)/2) ) 
	SetSpritePositionByOffset( SelectorLine, -9999, -9999 )
	SetSpriteVisible( SelectorLine, titleInteface )

	index as integer
	for index = 0 to 9
		LeftArrowSet[index] = CreateSprite ( 120 )
		SetSpriteDepth ( LeftArrowSet[index], 3 )
		SetSpriteOffset( LeftArrowSet[index], (GetSpriteWidth(LeftArrowSet[index])/2) , (GetSpriteHeight(LeftArrowSet[index])/2) ) 
		SetSpritePositionByOffset( LeftArrowSet[index], -9999, -9999 )
		SetSpriteVisible( LeftArrowSet[index], titleInteface )

		RightArrowSet[index] = CreateSprite ( 121 )
		SetSpriteDepth ( RightArrowSet[index], 3 )
		SetSpriteOffset( RightArrowSet[index], (GetSpriteWidth(RightArrowSet[index])/2) , (GetSpriteHeight(RightArrowSet[index])/2) ) 
		SetSpritePositionByOffset( RightArrowSet[index], -9999, -9999 )
		SetSpriteVisible( RightArrowSet[index], titleInteface )
	next index

	Icon[0] = CreateSprite ( 300 )
	SetSpriteDepth ( Icon[0], 2 )
	SetSpriteOffset( Icon[0], (GetSpriteWidth(Icon[0])/2) , (GetSpriteHeight(Icon[0])/2) ) 
	SetSpritePositionByOffset( Icon[0], -9999, -9999 )
	SetSpriteVisible( Icon[0], 1 )

	Icon[1] = CreateSprite ( 301 )
	SetSpriteDepth ( Icon[1], 2 )
	SetSpriteOffset( Icon[1], (GetSpriteWidth(Icon[1])/2) , (GetSpriteHeight(Icon[1])/2) ) 
	SetSpritePositionByOffset( Icon[1], -9999, -9999 )
	SetSpriteVisible( Icon[1], 1 )

	Icon[2] = CreateSprite ( 302 )
	SetSpriteDepth ( Icon[2], 2 )
	SetSpriteOffset( Icon[2], (GetSpriteWidth(Icon[2])/2) , (GetSpriteHeight(Icon[2])/2) ) 
	SetSpritePositionByOffset( Icon[2], -9999, -9999 )
	SetSpriteVisible( Icon[2], 1 )

	Icon[3] = CreateSprite ( 303 )
	SetSpriteDepth ( Icon[3], 2 )
	SetSpriteOffset( Icon[3], (GetSpriteWidth(Icon[3])/2) , (GetSpriteHeight(Icon[3])/2) ) 
	SetSpritePositionByOffset( Icon[3], -9999, -9999 )
	SetSpriteVisible( Icon[3], 1 )

	Icon[4] = CreateSprite ( 304 )
	SetSpriteDepth ( Icon[4], 2 )
	SetSpriteOffset( Icon[4], (GetSpriteWidth(Icon[4])/2) , (GetSpriteHeight(Icon[4])/2) ) 
	SetSpritePositionByOffset( Icon[4], -9999, -9999 )
	SetSpriteVisible( Icon[4], 1 )

	Icon[5] = CreateSprite ( 305 )
	SetSpriteDepth ( Icon[5], 2 )
	SetSpriteOffset( Icon[5], (GetSpriteWidth(Icon[5])/2) , (GetSpriteHeight(Icon[5])/2) ) 
	SetSpritePositionByOffset( Icon[5], -9999, -9999 )
	SetSpriteVisible( Icon[5], 1 )

	Icon[6] = CreateSprite ( 306 )
	SetSpriteDepth ( Icon[6], 2 )
	SetSpriteOffset( Icon[6], (GetSpriteWidth(Icon[6])/2) , (GetSpriteHeight(Icon[6])/2) ) 
	SetSpritePositionByOffset( Icon[6], -9999, -9999 )
	SetSpriteVisible( Icon[6], 1 )

	NameInputCharSprite = CreateSprite ( 130 )
	SetSpriteDepth ( NameInputCharSprite, 3 )
	SetSpriteOffset( NameInputCharSprite, (GetSpriteWidth(NameInputCharSprite)/2) , (GetSpriteHeight(NameInputCharSprite)/2) ) 
	SetSpritePositionByOffset( NameInputCharSprite, -9999, -9999 )
	SetSpriteVisible( NameInputCharSprite, 1 )

	for index = 0 to 9
		ScreenLine[index] = CreateSprite ( 140 )
		SetSpriteDepth ( ScreenLine[index], 3 )
		SetSpriteOffset( ScreenLine[index], (GetSpriteWidth(ScreenLine[index])/2) , (GetSpriteHeight(ScreenLine[index])/2) ) 
		SetSpritePositionByOffset( ScreenLine[index], -9999, -9999 )
		SetSpriteVisible( ScreenLine[index], titleInteface )
	next index	
endfunction

//------------------------------------------------------------------------------------------------------------

function PreRenderButtonsWithTexts()
	index as integer = 10000
	text as string = " "
	font as integer = 999
	size as integer = 25
	red as integer = 0
	green as integer = 0
	blue as integer = 0
	alpha as integer = 0
	outRed as integer = 232
	outGreen as integer = 166
	outBlue as integer = 0
	horizontalJustification as integer = 1
	screenX as integer
	screenX = (251 / 2)
	screenY as integer
	screenY = (38 / 2)

	buttonTextIndex as integer
	for buttonTextIndex = 0 to 7	
		ButtonSprite[buttonTextIndex] = CreateSprite ( 103 )
		SetSpriteTransparency( ButtonSprite[buttonTextIndex], 1 )
		SetSpriteDepth ( ButtonSprite[buttonTextIndex], 2 )
		SetSpriteOffset( ButtonSprite[buttonTextIndex], (GetSpriteWidth(ButtonSprite[buttonTextIndex])/2) , (GetSpriteHeight(ButtonSprite[buttonTextIndex])/2) ) 
		SetSpritePositionByOffset( ButtonSprite[buttonTextIndex], screenX, screenY )

		text = ButtonText[buttonTextIndex]

		outlineIndex as integer = 1
		posX as integer
		posY as integer
		for posX = -2 to 2 step 1
			for posY = -2 to 2 step 1
				if GetTextExists(index+outlineIndex) = 0 then CreateText( index+outlineIndex, text )
				SetTextFont( index+outlineIndex, font ) 
				SetTextSize(index+outlineIndex, size)
				SetTextDepth(index+outlineIndex, 2)

				if posX = -2 and posY = -2 and buttonTextIndex = 0
					dec screenY, ( GetTextTotalHeight(index+outlineIndex)/2 )
				endif

				SetTextColor(index+outlineIndex, outRed, outGreen, outBlue, alpha)
				SetTextAlignment(index+outlineIndex, horizontalJustification)
				SetTextPosition(index+outlineIndex, screenX+posX, screenY+posY)
				if GetTextExists(index+outlineIndex) then SetTextVisible( index+outlineIndex, 1 )
				inc outlineIndex, 1
			next posY
		next posX

		if GetTextExists(index) = 0 then CreateText( index, text )
		SetTextFont( index, font ) 
		SetTextSize(index, size)
		SetTextDepth(index, 2)
		SetTextColor(index, red, green, blue, alpha)
		SetTextAlignment(index, horizontalJustification)
		SetTextPosition(index, screenX, screenY)
		if GetTextExists(index) then SetTextVisible( index, 1 )
		
		inc index, 26
		
		SetSpritePositionByOffset( ButtonSprite[buttonTextIndex], -9999, -9999 )
	next buttonTextIndex
endfunction

//------------------------------------------------------------------------------------------------------------

function CreateButton ( index as integer, screenX as integer, screenY as integer)
	ButtonSelectedByKeyboard = 0

	ButtonIndex[NumberOfButtonsOnScreen] = index
	ButtonScreenX[NumberOfButtonsOnScreen] = screenX
	ButtonScreenY[NumberOfButtonsOnScreen] = screenY
	ButtonAnimationTimer[NumberOfButtonsOnScreen] = 0
	ButtonScale[NumberOfButtonsOnScreen] = 1

	inc NumberOfButtonsOnScreen, 1
	
	GUIchanged = TRUE
endfunction

//------------------------------------------------------------------------------------------------------------

function DrawAllButtons()
	if (NumberOfButtonsOnScreen = 0) then exitfunction
		
	textStartIndex as integer
	textStartIndex = 10000
	index as integer
	for index = 0 to (NumberOfButtonsOnScreen-1)
		if (  GetSpriteExists( ButtonSprite[ ButtonIndex[index] ] ) = 1  )
			SetSpriteScaleByOffset(ButtonSprite[ ButtonIndex[index] ], ButtonScale[index], ButtonScale[index])
			SetSpritePositionByOffset( ButtonSprite[ ButtonIndex[index] ], ButtonScreenX[index], ButtonScreenY[index] )

			textStartIndex = ( 10000 + (ButtonIndex[index] * 26) )

			screenY as integer
			screenY = ButtonScreenY[index]
			outlineIndex as integer = 1
			posX as integer
			posY as integer
			for posX = -2 to 2 step 1
				for posY = -2 to 2 step 1
					if ButtonScale[index] = 1
						SetTextSize(textStartIndex+outlineIndex, 25+5+7)
					else
						SetTextSize(textStartIndex+outlineIndex, 21+5+7)
					endif

					if posX = -2 and posY = -2
						dec screenY, ( GetTextTotalHeight(textStartIndex+outlineIndex)/2 )
					endif

					SetTextPosition(textStartIndex+outlineIndex, ButtonScreenX[index]+posX, screenY+posY)
					inc outlineIndex, 1
				next posY
			next posX

			if ButtonScale[index] = 1
				SetTextSize(textStartIndex, 25+5+7)
			else
				SetTextSize(textStartIndex, 21+5+7)
			endif

			SetTextColorAlpha(textStartIndex, 255)
			SetTextPosition(textStartIndex, ButtonScreenX[index], screenY)

			if NumberOfButtonsOnScreen > 1 and ButtonSelectedByKeyboard = index and ShowCursor = TRUE
				SetSpritePositionByOffset( LeftArrow, (ScreenWidth/2)-150, ButtonScreenY[index] )

				SetSpritePositionByOffset( RightArrow, (ScreenWidth/2)+150, ButtonScreenY[index] )
			endif
			inc textStartIndex, 26
		endif
	next index
endfunction

//------------------------------------------------------------------------------------------------------------

function ThisButtonWasPressed(buttonToCheck as integer)
	returnValue as integer
	returnValue = FALSE
	
	index as integer
	for index = 0 to (NumberOfButtonsOnScreen-1)
		if (  GetSpriteExists( ButtonSprite[ ButtonIndex[index] ] ) = 1  )
			if ButtonIndex[index] = buttonToCheck
			
				if ButtonAnimationTimer[index] > 0
					if ButtonAnimationTimer[index] = 3
						ButtonScale[index] = .9
						GUIchanged = TRUE
					elseif ButtonAnimationTimer[index] = 1
						ButtonScale[index] = 1
						GUIchanged = TRUE
					endif
					
					if buttonToCheck = ButtonIndex[index]
						if ButtonAnimationTimer[index] > 1
							dec ButtonAnimationTimer[index], 1
						elseif ButtonAnimationTimer[index] = 1
							returnValue = TRUE
							ButtonAnimationTimer[index] = 0
						endif
					endif
					
					exitfunction returnValue
				endif

				if ScreenFadeStatus = FadingIdle
					if DelayAllUserInput = 0
						if NumberOfButtonsOnScreen > 1
							if JoystickDirection = JoyUP
								if ButtonSelectedByKeyboard > 0
									dec ButtonSelectedByKeyboard, 1
								else
									ButtonSelectedByKeyboard = NumberOfButtonsOnScreen-1
								endif

								PlaySoundEffect(0)
								GUIchanged = TRUE	
								SetDelayAllUserInput()
							elseif JoystickDirection = JoyDOWN
								if ButtonSelectedByKeyboard < (NumberOfButtonsOnScreen-1)
									inc ButtonSelectedByKeyboard, 1
								else
									ButtonSelectedByKeyboard = 0
								endif

								PlaySoundEffect(0)
								GUIchanged = TRUE	
								SetDelayAllUserInput()
							endif
						endif

						if (LastKeyboardChar = 32 and ScreenToDisplay <> NewHighScoreNameInputScreen) or LastKeyboardChar = 13
							ButtonAnimationTimer[ButtonSelectedByKeyboard] = 3
							
							PlaySoundEffect(1)
							
							SetDelayAllUserInput()
						endif

						if MouseButtonLeft = ON
							buttonWidthHalf as integer
							buttonWidthHalf = GetSpriteWidth(ButtonSprite[index])/2
							buttonHeightHalf as integer
							buttonHeightHalf = GetSpriteHeight(ButtonSprite[index])/2
							index = 0
							for index = 0 to (NumberOfButtonsOnScreen-1)
								if (  ( MouseScreenY > (ButtonScreenY[index]-buttonHeightHalf) ) and ( MouseScreenY < (ButtonScreenY[index]+buttonHeightHalf) ) and ( MouseScreenX > (ButtonScreenX[index]-buttonWidthHalf) ) and ( MouseScreenX < (ButtonScreenX[index]+buttonWidthHalf) )  )
									ButtonSelectedByKeyboard = index
									
									ButtonAnimationTimer[ButtonSelectedByKeyboard] = 3
							
									PlaySoundEffect(1)
									GUIchanged = TRUE
									SetDelayAllUserInput()
								endif
							next index
						endif
					endif
				endif
			endif
		endif
	next index
endfunction returnValue

//------------------------------------------------------------------------------------------------------------

function DestroyAllButtons()
	NumberOfButtonsOnScreen = 0
	ButtonSelectedByKeyboard = 0
	index as integer
	for index = 0 to 6
		ButtonIndex[index] = -1
		ButtonScreenX[index] = 320
		ButtonScreenY[index] = 240
		ButtonAnimationTimer[index] = 0
		ButtonScale[index] = 1
	next index
endfunction

//------------------------------------------------------------------------------------------------------------

function CreateArrowSet(index as integer)
	if ChangingBackground = FALSE or (ScreenToDisplay <> OptionsScreen)
		ArrowSetSelectedByKeyboard = 0
	endif

	ArrowSetScreenY[NumberOfArrowSetsOnScreen] = index
	ArrowSetLeftAnimationTimer[NumberOfArrowSetsOnScreen] = 0
	ArrowSetRightAnimationTimer[NumberOfArrowSetsOnScreen] = 0
	ArrowSetLeftScale[NumberOfArrowSetsOnScreen] = 1
	ArrowSetRightScale[NumberOfArrowSetsOnScreen] = 1

	inc NumberOfArrowSetsOnScreen, 1
	
	GUIchanged = TRUE
endfunction

//------------------------------------------------------------------------------------------------------------

function DrawAllArrowSets()
	index as integer
	for index = 0 to (NumberOfArrowSetsOnScreen-1)
		if index = ArrowSetSelectedByKeyboard
			SetSpriteOffset( SelectorLine, (GetSpriteWidth(SelectorLine)/2) , (GetSpriteHeight(SelectorLine)/2) ) 
			SetSpritePositionByOffset( SelectorLine, ScreenWidth/2, ArrowSetScreenY[index] )
			SetSpriteColorAlpha(SelectorLine, 100)
		endif

		SetSpriteScale(LeftArrowSet[index], ArrowSetLeftScale[index], ArrowSetLeftScale[index])
		SetSpriteOffset( LeftArrowSet[index], (GetSpriteWidth(LeftArrowSet[index])/2) , (GetSpriteHeight(LeftArrowSet[index])/2) ) 
		SetSpritePositionByOffset( LeftArrowSet[index], (ScreenWidth/2)-154, ArrowSetScreenY[index] )
		SetSpriteColorAlpha(LeftArrowSet[index], 255)

		SetSpriteScale(RightArrowSet[index], ArrowSetRightScale[index], ArrowSetRightScale[index])
		SetSpriteOffset( RightArrowSet[index], (GetSpriteWidth(RightArrowSet[index])/2) , (GetSpriteHeight(RightArrowSet[index])/2) ) 
		SetSpritePositionByOffset( RightArrowSet[index], (ScreenWidth/2)+154, ArrowSetScreenY[index] )
		SetSpriteColorAlpha(RightArrowSet[index], 255)
	next index
endfunction

//------------------------------------------------------------------------------------------------------------

function ThisArrowWasPressed(arrowToCheck as float)
	returnValue as integer
	returnValue = FALSE

	index as integer
	index = floor(arrowToCheck)

	if index = arrowToCheck and ArrowSetLeftAnimationTimer[index] > 0
		if ArrowSetLeftAnimationTimer[index] = 3
			ArrowSetLeftScale[index] = .75
			GUIchanged = TRUE
		elseif ArrowSetLeftAnimationTimer[index] = 1
			ArrowSetLeftScale[index] = 1
			GUIchanged = TRUE
		endif

		if index = arrowToCheck
			if ArrowSetLeftAnimationTimer[index] > 1
				dec ArrowSetLeftAnimationTimer[index], 1
			elseif ArrowSetLeftAnimationTimer[index] = 1
				returnValue = TRUE
				ArrowSetLeftAnimationTimer[index] = 0
			endif
		endif
		
		exitfunction returnValue
	endif

	if (index + .5) = arrowToCheck and ArrowSetRightAnimationTimer[index] > 0
		if ArrowSetRightAnimationTimer[index] = 3
			ArrowSetRightScale[index] = .75
			GUIchanged = TRUE
		elseif ArrowSetRightAnimationTimer[index] = 1
			ArrowSetRightScale[index] = 1
			GUIchanged = TRUE
		endif

		if (index + .5) = arrowToCheck
			if ArrowSetRightAnimationTimer[index] > 1
				dec ArrowSetRightAnimationTimer[index], 1
			elseif ArrowSetRightAnimationTimer[index] = 1
				returnValue = TRUE
				ArrowSetRightAnimationTimer[index] = 0
			endif
		endif
		
		exitfunction returnValue
	endif

	if ScreenFadeStatus = FadingIdle
		if DelayAllUserInput = 0
			if NumberOfArrowSetsOnScreen > 1
				if JoystickDirection = JoyUP
					if ArrowSetSelectedByKeyboard > 0
						dec ArrowSetSelectedByKeyboard, 1
					else
						ArrowSetSelectedByKeyboard = (NumberOfArrowSetsOnScreen-1)
					endif
				
					PlaySoundEffect(0)
					GUIchanged = TRUE
					SetDelayAllUserInput()
				elseif JoystickDirection = JoyDOWN
					if ArrowSetSelectedByKeyboard < (NumberOfArrowSetsOnScreen-1)
						inc ArrowSetSelectedByKeyboard, 1
					else
						ArrowSetSelectedByKeyboard = 0
					endif
				
					PlaySoundEffect(0)
					GUIchanged = TRUE
					SetDelayAllUserInput()
				endif
			endif

			if JoystickDirection = JoyLEFT
				ArrowSetLeftAnimationTimer[ArrowSetSelectedByKeyboard] = 3
				PlaySoundEffect(1)
				GUIchanged = TRUE
				SetDelayAllUserInput()
			elseif JoystickDirection = JoyRIGHT
				ArrowSetRightAnimationTimer[ArrowSetSelectedByKeyboard] = 3
				PlaySoundEffect(1)
				GUIchanged = TRUE
				SetDelayAllUserInput()
			endif
		endif

		if MouseButtonLeft = ON and DelayAllUserInput = 0
			arrowWidthHalf as integer
			arrowWidthHalf = (GetSpriteWidth(LeftArrowSet[0]) / 2)
			arrowHeightHalf as integer
			arrowHeightHalf = (GetSpriteHeight(LeftArrowSet[0]) / 2)
			for index = 0 to (NumberOfArrowSetsOnScreen-1)
				if (  ( MouseScreenY > (ArrowSetScreenY[index]-arrowHeightHalf) ) && ( MouseScreenY < (ArrowSetScreenY[index]+arrowHeightHalf) ) && ( MouseScreenX > ((ScreenWidth/2)-154-arrowWidthHalf) ) && ( MouseScreenX < ((ScreenWidth/2)-154+arrowWidthHalf) )  )
					ArrowSetSelectedByKeyboard = index
					ArrowSetLeftAnimationTimer[ArrowSetSelectedByKeyboard] = 3
					PlaySoundEffect(1)
					GUIchanged = TRUE
					SetDelayAllUserInput()
				elseif (  ( MouseScreenY > (ArrowSetScreenY[index]-arrowHeightHalf) ) && ( MouseScreenY < (ArrowSetScreenY[index]+arrowHeightHalf) ) && ( MouseScreenX > ((ScreenWidth/2)+154-arrowWidthHalf) ) && ( MouseScreenX < ((ScreenWidth/2)+154+arrowWidthHalf) )  )
					ArrowSetSelectedByKeyboard = index
					ArrowSetRightAnimationTimer[ArrowSetSelectedByKeyboard] = 3
					PlaySoundEffect(1)
					GUIchanged = TRUE
					SetDelayAllUserInput()
				endif
			next index
		endif
	endif
endfunction returnValue

//------------------------------------------------------------------------------------------------------------

function DestroyAllArrowSets()
	NumberOfArrowSetsOnScreen = 0

	index as integer
	for index = 0 to 9
		ArrowSetScreenY[index] = 240
		ArrowSetLeftAnimationTimer[index] = 0
		ArrowSetRightAnimationTimer[index] = 0
		ArrowSetLeftScale[index] = 1
		ArrowSetRightScale[index] = 1
		ArrowSetTextStringIndex[index] = -1
	next index
endfunction

//------------------------------------------------------------------------------------------------------------

function PreRenderCharacterIconTexts ( )
	for index = 8 to 76
		Icon[index] = CreateSprite ( 130 )
		SetSpriteDepth ( Icon[index], 3 )
		SetSpriteOffset( Icon[index], (GetSpriteWidth(Icon[index])/2) , (GetSpriteHeight(Icon[index])/2) ) 
		SetSpritePositionByOffset( Icon[index], -9999, -9999 )
	next index
	
	index as integer = 20000
	text as string = " "
	font as integer = 999
	size as integer = 25
	red as integer = 0
	green as integer = 0
	blue as integer = 0
	alpha as integer = 255
	outRed as integer = 200
	outGreen as integer = 200
	outBlue as integer = 200
	horizontalJustification as integer = 1
	screenX as integer
	screenX = -9999
	screenY as integer
	screenY = -9999
	depth as integer = 3

	IconText[10] = "A"
	IconText[11] = "B"
	IconText[12] = "C"
	IconText[13] = "D"
	IconText[14] = "E"
	IconText[15] = "F"
	IconText[16] = "G"
	IconText[17] = "H"
	IconText[18] = "I"
	IconText[19] = "J"
	IconText[20] = "K"
	IconText[21] = "L"
	IconText[22] = "M"
	IconText[23] = "N"
	IconText[24] = "O"
	IconText[25] = "P"
	IconText[26] = "Q"
	IconText[27] = "R"
	IconText[28] = "S"
	IconText[29] = "T"
	IconText[30] = "U"
	IconText[31] = "V"
	IconText[32] = "W"
	IconText[33] = "X"
	IconText[34] = "Y"
	IconText[35] = "Z"
	IconText[36] = "a"
	IconText[37] = "b"
	IconText[38] = "c"
	IconText[39] = "d"
	IconText[40] = "e"
	IconText[41] = "f"
	IconText[42] = "g"
	IconText[43] = "h"
	IconText[44] = "i"
	IconText[45] = "j"
	IconText[46] = "k"
	IconText[47] = "l"
	IconText[48] = "m"
	IconText[49] = "n"
	IconText[50] = "o"
	IconText[51] = "p"
	IconText[52] = "q"
	IconText[53] = "r"
	IconText[54] = "s"
	IconText[55] = "t"
	IconText[56] = "u"
	IconText[57] = "v"
	IconText[58] = "w"
	IconText[59] = "x"
	IconText[60] = "y"
	IconText[61] = "z"
	IconText[62] = "0"
	IconText[63] = "1"
	IconText[64] = "2"
	IconText[65] = "3"
	IconText[66] = "4"
	IconText[67] = "5"
	IconText[68] = "6"
	IconText[69] = "7"
	IconText[70] = "8"
	IconText[71] = "9"
	IconText[72] = "+"
	IconText[73] = " "
	IconText[74] = "<"

	iconTextIndex as integer
	for iconTextIndex = 0 to 75
		screenY = IconScreenY[iconTextIndex]
		screenX = IconScreenX[iconTextIndex]

		text = IconText[iconTextIndex]

		if GetTextExists(index) = 0 then CreateText( index, text )
		SetTextFont( index, font ) 
		SetTextSize(index, size)
		SetTextColor(index, red, green, blue, alpha)
		SetTextAlignment(index, horizontalJustification)
		SetTextPosition(index, screenX, screenY)
		SetTextDepth(index, depth)
		SetTextVisible( index, 1 )
		
		inc index, 26
	next iconTextIndex

endfunction

//------------------------------------------------------------------------------------------------------------

function CreateIcon(spriteIndex as integer, screenX as integer, screenY as integer)
	IconIndex[NumberOfIconsOnScreen] = NumberOfIconsOnScreen
	IconSprite[NumberOfIconsOnScreen] = spriteIndex
	IconScreenX[NumberOfIconsOnScreen] = screenX
	IconScreenY[NumberOfIconsOnScreen] = screenY
	IconAnimationTimer[NumberOfIconsOnScreen] = 0
	IconScale[NumberOfIconsOnScreen] = 1

	inc NumberOfIconsOnScreen, 1
	GUIchanged = TRUE

	CurrentIconBeingPressed = -1
endfunction

//------------------------------------------------------------------------------------------------------------

function DrawAllIcons()
	if NumberOfIconsOnScreen = 0 then exitfunction
	
	index as integer
	textStartIndex  as integer
	textStartIndex = 20000
	for index = 0 to NumberOfIconsOnScreen
		if IconSprite[index] > -1
			SetSpriteScale(Icon[IconSprite[index]], IconScale[index], IconScale[index])
			SetSpriteOffset( Icon[IconSprite[index]], (GetSpriteWidth(Icon[IconSprite[index]])/2) , (GetSpriteHeight(Icon[IconSprite[index]])/2) ) 
			SetSpritePositionByOffset( Icon[IconSprite[index]], IconScreenX[index], IconScreenY[index] )

			if (ScreenToDisplay = NewHighScoreNameInputScreen or ScreenToDisplay = NewHighScoreNameInputAndroidScreen)
				textStartIndex = ( 20000 + (IconSprite[index] * 26) )

				screenY as integer
				screenY = IconScreenY[index] 
				screenX as integer
				screenx = IconScreenX[index]
				outlineIndex as integer = 1
				posX as integer
				posY as integer

				if iconScale[index] = 1
					SetTextSize(textStartIndex, 25)
				else
					SetTextSize(textStartIndex, 21)
				endif

				iconWidthHalf as integer
				iconWidthHalf = GetSpriteWidth(Icon[IconSprite[1]])/2
				iconHeightHalf as integer
				iconHeightHalf = GetSpriteHeight(Icon[IconSprite[1]])/2

				if (ScreenToDisplay = NewHighScoreNameInputAndroidScreen and MouseButtonLeft = OFF)
					SetSpritePositionByOffset( NameInputCharSprite, -9999, -9999 )

					SetTextDepth(textStartIndex, 3)
					dec screenY, ( GetTextTotalHeight(textStartIndex)/2 )
					SetTextPosition(textStartIndex, IconScreenX[index], screenY)

					inc textStartIndex, 26
				elseif (  ScreenToDisplay = NewHighScoreNameInputAndroidScreen and MouseButtonLeft = ON and ( MouseScreenY > (IconScreenY[index]-iconHeightHalf) ) and ( MouseScreenY < (IconScreenY[index]+iconHeightHalf) ) and ( MouseScreenX > (IconScreenX[index]-iconWidthHalf) ) and ( MouseScreenX < (IconScreenX[index]+iconWidthHalf) )  )
					SetSpritePositionByOffset( NameInputCharSprite, IconScreenX[index], IconScreenY[index]-45 )

					SetTextDepth(textStartIndex, 1)
					SetTextPosition(textStartIndex, IconScreenX[index], IconScreenY[index]-45)
				
					dec screenY, ( GetTextTotalHeight(textStartIndex)/2 )
					SetTextPosition(textStartIndex, IconScreenX[index], screenY-45)

					inc textStartIndex, 26
				else
					SetTextDepth(textStartIndex, 3)
					dec screenY, ( GetTextTotalHeight(textStartIndex)/2 )
					SetTextPosition(textStartIndex, IconScreenX[index], screenY)

					inc textStartIndex, 26
				endif
			endif
		endif	
	next index
	
	if (ScreenToDisplay = NewHighScoreNameInputAndroidScreen)
		fingerOnChar as integer
		fingerOnChar = FALSE
		for index = 0 to NumberOfIconsOnScreen
			if IconSprite[index] > -1
				if (  ( MouseScreenY > (IconScreenY[index]-iconHeightHalf) ) and ( MouseScreenY < (IconScreenY[index]+iconHeightHalf) ) and ( MouseScreenX > (IconScreenX[index]-iconWidthHalf) ) and ( MouseScreenX < (IconScreenX[index]+iconWidthHalf) )  )
					fingerOnChar = TRUE
				endif
			endif
		next index
		
		if (fingerOnChar = FALSE)
			SetSpritePositionByOffset( NameInputCharSprite, -9999, -9999 )
		endif
	endif	
endfunction

//------------------------------------------------------------------------------------------------------------

function ThisIconWasPressed(iconIndexToCheck as integer)
	if (NumberOfIconsOnScreen = 0) then exitfunction(-1)

	returnValue as integer
	returnValue = FALSE

	if (CurrentIconBeingPressed > -1)
		index as integer
		for index = 0 to (NumberOfIconsOnScreen-1)
			if IconAnimationTimer[index] > 0 and iconIndexToCheck = IconIndex[index]
				if IconAnimationTimer[index] = 2
					IconScale[index] = .9
					GUIchanged = TRUE
				elseif IconAnimationTimer[index] = 1
					IconScale[index] = 1
					GUIchanged = TRUE
				endif
				
				if IconAnimationTimer[index] > 1
					dec IconAnimationTimer[index], 1
				elseif IconAnimationTimer[index] = 1
					if iconIndexToCheck = IconIndex[index] then returnValue = TRUE

					CurrentIconBeingPressed = -1

					IconAnimationTimer[index] = 0
				endif
				
				exitfunction returnValue
			endif
		next index
	endif

	if (CurrentIconBeingPressed = -1)
		if DelayAllUserInput = 0
			if MouseButtonLeft = ON
			for index = 0 to (NumberOfIconsOnScreen-1)
					iconWidthHalf as integer
					iconWidthHalf = GetSpriteWidth(Icon[IconSprite[index]])/2
					iconHeightHalf as integer
					iconHeightHalf = GetSpriteHeight(Icon[IconSprite[index]])/2
					if (  ( MouseScreenY > (IconScreenY[index]-iconHeightHalf) ) and ( MouseScreenY < (IconScreenY[index]+iconHeightHalf) ) and ( MouseScreenX > (IconScreenX[index]-iconWidthHalf) ) and ( MouseScreenX < (IconScreenX[index]+iconWidthHalf) )  )
						IconAnimationTimer[index] = 2
				
						if (IconSprite[index] = 80)
							
						elseif (IconSprite[index] = 81)
						
						else
							PlaySoundEffect(1)
						endif
						GUIchanged = TRUE
						
						CurrentIconBeingPressed = index
						
						SetDelayAllUserInput()
					endif
				next index
			endif
		endif
	endif
endfunction returnValue

//------------------------------------------------------------------------------------------------------------

function ThisIconWasPressedAndroid(iconIndexToCheck as integer)
	returnValue as integer
	returnValue = FALSE

	index as integer
	for index = 0 to (NumberOfIconsOnScreen-1)
		if IconAnimationTimer[index] > 0 and iconIndexToCheck = IconIndex[index]
			if IconAnimationTimer[index] = 3
				IconScale[index] = .9
				GUIchanged = TRUE
			elseif IconAnimationTimer[index] = 1
				IconScale[index] = 1
				GUIchanged = TRUE
			endif
			
			if IconAnimationTimer[index] > 1
				dec IconAnimationTimer[index], 1
			elseif IconAnimationTimer[index] = 1
				if iconIndexToCheck = IconIndex[index] then returnValue = TRUE

				IconAnimationTimer[index] = 0
			endif
			
			exitfunction returnValue
		endif
	next index

	if DelayAllUserInput = 0
		for index = 0 to (NumberOfIconsOnScreen-1)
			if MouseButtonLeft = ON
				iconWidthHalf as integer
				iconWidthHalf = GetSpriteWidth(Icon[IconSprite[index]])/2
				iconHeightHalf as integer
				iconHeightHalf = GetSpriteHeight(Icon[IconSprite[index]])/2
				if ( MouseButtonLeft = ON and ( MouseScreenY > (IconScreenY[index]-iconHeightHalf) ) and ( MouseScreenY < (IconScreenY[index]+iconHeightHalf) ) and ( MouseScreenX > (IconScreenX[index]-iconWidthHalf) ) and ( MouseScreenX < (IconScreenX[index]+iconWidthHalf) )  )
					NameInputCharSpriteChar = index
					MouseButtonLeftWasReleased = FALSE
				endif
			endif
		next index
	endif
	
	if (MouseButtonLeftWasReleased = FALSE)
		if (MouseButtonLeft = OFF)
			MouseButtonLeftWasReleased = TRUE
		endif
	endif
	
	if (MouseButtonLeftWasReleased = TRUE)
		if (NameInputCharSpriteChar <> 999)
			IconAnimationTimer[NameInputCharSpriteChar] = 3

			PlaySoundEffect(1)
			GUIchanged = TRUE
			SetDelayAllUserInput()
			
			NameInputCharSpriteChar = 999
		endif
	endif	
endfunction returnValue

//------------------------------------------------------------------------------------------------------------

function DestroyAllIcons()
	NumberOfIconsOnScreen = 0
	index as integer
	textStartIndex as integer
	for index = 0 to 75
		IconIndex[index] = -1
		IconSprite[index] = -1
		IconScreenX[index] = (ScreenWidth/2)
		IconScreenY[index] = (ScreenHeight/2)
		IconAnimationTimer[index] = 0
		IconScale[index] = 1
		IconText[index] = " "	
	next index
endfunction

//------------------------------------------------------------------------------------------------------------

function DestroyAllGUI()
	DestroyAllButtons()
	DestroyAllArrowSets()
	DestroyAllIcons()
endfunction
