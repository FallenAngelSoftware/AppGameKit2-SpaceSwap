// "screens.agc"...

function SetDelayAllUserInput()
	DelayAllUserInput = 7
endfunction

//------------------------------------------------------------------------------------------------------------

function LoadSelectedBackground()
offset as integer
	offset = 0

	if (ScreenToDisplay <> TitleScreen)
		inc offset, 10
	endif

	LoadImage ( 10, "\media\images\backgrounds\TitleBG.png" )
	LoadImage ( 20, "\media\images\backgrounds\TitleBlurBG.png" )
	TitleBG = CreateSprite ( 10+offset )

	SetSpriteOffset( TitleBG, (GetSpriteWidth(TitleBG)/2) , (GetSpriteHeight(TitleBG)/2) ) 
	SetSpritePositionByOffset( TitleBG, -9999, -9999 )
	SetSpriteDepth ( TitleBG, 5 )

endfunction

//------------------------------------------------------------------------------------------------------------

function ApplyScreenFadeTransition ( )
	if ScreenFadeStatus = FadingFromBlack
		if ScreenFadeTransparency > 85
			dec ScreenFadeTransparency, 85
		else
			ScreenFadeTransparency = 0
			ScreenFadeStatus = FadingIdle
		endif
		
		SetSpriteColorAlpha( FadingBlackBG, ScreenFadeTransparency )
	elseif ScreenFadeStatus = FadingToBlack
		if (ScreenToDisplay = AboutScreen) then SetSpritePositionByOffset( FadingBlackBG, ScreenWidth/2, AboutScreenBackgroundY )
		if ScreenFadeTransparency < 255-85
			inc ScreenFadeTransparency, 85
			
			if (ScreenFadeTransparency = 255-85) then ScreenFadeTransparency = 254
		elseif FadingToBlackCompleted = FALSE
			ScreenFadeTransparency = 255
			FadingToBlackCompleted = TRUE
		elseif (ScreenFadeTransparency = 255)
			ScreenFadeTransparency = 255
			FadingToBlackCompleted = FALSE

			ScreenFadeStatus = FadingFromBlack
			ScreenToDisplay = NextScreenToDisplay

			DestroyAllGUI()
			
			DestroyAllTexts()
			
			DeleteAllSprites()
			
			DeleteImage(10)
			DeleteImage(20)
			
			FadingBlackBG = CreateSprite ( 1 )
			SetSpriteDepth ( FadingBlackBG, 1 )
			SetSpriteOffset( FadingBlackBG, (GetSpriteWidth(FadingBlackBG)/2) , (GetSpriteHeight(FadingBlackBG)/2) ) 
			SetSpritePositionByOffset( FadingBlackBG, ScreenWidth/2, ScreenHeight/2 )
			SetSpriteTransparency( FadingBlackBG, 1 )

			if (ScreenToDisplay <> AboutScreen and ScreenToDisplay <> IntroSceneScreen and ScreenToDisplay <> EndingSceneScreen)
				LoadInterfaceSprites()
				if (ScreenToDisplay <> PlayingScreen) then PreRenderButtonsWithTexts()
			endif
		endif
		
		SetSpriteColorAlpha( FadingBlackBG, ScreenFadeTransparency )
	endif
	
	if (SecretCodeCombined = 2777 and ScreenIsDirty = TRUE and ScreenFadeStatus = FadingIdle)
		SetSpriteColorAlpha( FadingBlackBG, 200 )
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplaySteamOverlayScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255

		ClearScreenWithColor ( 0, 0, 0 )

		BlackBG = CreateSprite ( 3 )
		SetSpriteDepth ( BlackBG, 4 )
		SetSpriteOffset( BlackBG, (GetSpriteWidth(BlackBG)/2) , (GetSpriteHeight(BlackBG)/2) ) 
		SetSpritePositionByOffset( BlackBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "TM", 999, 8, 255, 255, 255, 255, 90, 90, 90, 0, 180+110, 23-14, 3 )
		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "''Space Swap 110%''", 999, 30, 255, 255, 255, 255, 90, 90, 90, 1, ScreenWidth/2, 29, 3 )
		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Copyright 2019 By Fallen Angel Software", 999, 18, 255, 255, 255, 255, 90, 90, 90, 1, ScreenWidth/2, 29+25, 3 )
		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "www.FallenAngelSoftware.com", 999, 18, 255, 255, 255, 255, 90, 90, 90, 1, ScreenWidth/2, 29+25+25, 3 )

		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Loading Now!", 999, 30, 255, 255, 255, 255, 90, 90, 90, 1, ScreenWidth/2, ScreenHeight*.25, 3 )

		LoadPercentText = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 150, 255, 255, 255, 255, 90, 90, 90, 1, ScreenWidth/2, ScreenHeight/2, 3)

		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Please Wait!", 999, 30, 255, 255, 255, 255, 90, 90, 90, 1, ScreenWidth/2, ScreenHeight*.75, 3 )

		ScreenDisplayTimer = 275
		NextScreenToDisplay = AppGameKitScreen

		ScreenIsDirty = TRUE
	endif

	if ScreenDisplayTimer > 0
		LoadPercent = 275 / ScreenDisplayTimer
		LoadPercentFixed = LoadPercent
		if (LoadPercentFixed > 100) then LoadPercentFixed = 100
		SetText( LoadPercentText, str(LoadPercentFixed)+"%" )

		dec ScreenDisplayTimer, 1
	elseif ScreenDisplayTimer = 0
		ScreenFadeStatus = FadingToBlack
		SetText( LoadPercentText, "100%" )
	endif

	ScreenIsDirty = TRUE

	if FadingToBlackCompleted = TRUE
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayAppGameKitScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )
		
		BlackBG = CreateSprite ( 1 )
		SetSpriteDepth ( BlackBG, 4 )
		SetSpriteOffset( BlackBG, (GetSpriteWidth(BlackBG)/2) , (GetSpriteHeight(BlackBG)/2) ) 
		SetSpritePositionByOffset( BlackBG, ScreenWidth/2, ScreenHeight/2 )

		LoadImage ( 5, "\media\images\logos\AppGameKitLogo.png" )
		AppGameKitLogo = CreateSprite ( 5 )
		SetSpriteDepth ( AppGameKitLogo, 3 )
		SetSpriteOffset( AppGameKitLogo, (GetSpriteWidth(AppGameKitLogo)/2) , (GetSpriteHeight(AppGameKitLogo)/2) ) 
		SetSpritePositionByOffset( AppGameKitLogo, ScreenWidth/2, (ScreenHeight/2) )
		
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''The Best $79.99 We Ever Spent On A Game Engine!''", 999, 13, 255, 255, 255, 255, 50, 50, 50, 1, ScreenWidth/2, (ScreenHeight/2)-220, 3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''The Fallen Angel''", 999, 13, 255, 255, 255, 255, 50, 50, 50, 1, ScreenWidth/2, (ScreenHeight/2)-220+30, 3)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "www.AppGameKit.com", 999, 40, 255, 255, 255, 255, 171, 0, 62, 1, ScreenWidth/2, ScreenHeight-40, 3)
		
		ScreenDisplayTimer = 200
		NextScreenToDisplay = SixteenBitSoftScreen

		ScreenIsDirty = TRUE
	endif

	if ScreenDisplayTimer > 0
		dec ScreenDisplayTimer, 1
	elseif ScreenDisplayTimer = 0
		ScreenFadeStatus = FadingToBlack
	endif

	if ScreenDisplayTimer > 0
		if MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27
			PlaySoundEffect(1)
			SetDelayAllUserInput()
			ScreenDisplayTimer = 0
		endif
	endif

	if MouseButtonLeft = ON
		if ( MouseScreenY > (0) and MouseScreenY < (25) and MouseScreenX > (0) and MouseScreenX < (25) )
			GameUnlocked = 1
			PlaySoundEffect(9)
		endif
	endif

	if FadingToBlackCompleted = TRUE
		DeleteImage(5)
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplaySixteenBitSoftScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )
		
		BlackBG = CreateSprite ( 1 )
		SetSpriteDepth ( BlackBG, 4 )
		SetSpriteOffset( BlackBG, (GetSpriteWidth(BlackBG)/2) , (GetSpriteHeight(BlackBG)/2) ) 
		SetSpritePositionByOffset( BlackBG, ScreenWidth/2, ScreenHeight/2 )

//		LoadImage (30, "\media\images\logos\FAS-Statue.png")
//		SixteenBitSoftLogo = CreateSprite ( 30 )
//		SetSpriteDepth ( SixteenBitSoftLogo, 3 )
//		SetSpriteOffset( SixteenBitSoftLogo, (GetSpriteWidth(SixteenBitSoftLogo)/2) , (GetSpriteHeight(SixteenBitSoftLogo)/2) ) 
//		SetSpriteScaleByOffset( SixteenBitSoftLogo, .65, .65 )
//		SetSpritePositionByOffset( SixteenBitSoftLogo, ScreenWidth/2, ScreenHeight/2 )

//		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "www.FallenAngelSoftware.com", 999, 25, 0, 255, 0, 255, 0, 128, 0, 1, ScreenWidth/2, ScreenHeight-22, 3)
		
		ScreenDisplayTimer = 3200
		NextScreenToDisplay = TitleScreen

		ScreenIsDirty = TRUE
	endif

	if ScreenDisplayTimer > 0
		dec ScreenDisplayTimer, 1
	elseif ScreenDisplayTimer = 0
		ScreenFadeStatus = FadingToBlack
	endif
	
	if ScreenDisplayTimer > 0
		if MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27
//			PlaySoundEffect(1)
			SetDelayAllUserInput()
			ScreenDisplayTimer = 0
		endif
	endif

	if MouseButtonLeft = ON
		if ( MouseScreenY > (0) and MouseScreenY < (25) and MouseScreenX > (360-25) and MouseScreenX < (360) )
			if (GameUnlocked = 1)
				GameUnlocked = 0
				PlaySoundEffect(9)
			endif
		endif
	endif

	if FadingToBlackCompleted = TRUE
		DeleteImage(30)
		PlayNewMusic(0, 1)

	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayTitleScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		SaveOptionsAndHighScores()

		LoadSelectedBackground()		
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		if MusicVolume > 0 or EffectsVolume > 0
			CreateIcon(1, 18, 18 )
		else
			CreateIcon(0, 18, 18 )
		endif

		offsetY as integer
		offsetY = 10

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, GameVersion, 999, 16, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 21, 3)

		LoadImage ( 35, "\media\images\logos\Logo.png" )
		SS110Logo = CreateSprite ( 35 )
		SetSpriteOffset( SS110Logo, (GetSpriteWidth(SS110Logo)/2) , (GetSpriteHeight(SS110Logo)/2) ) 
		SetSpritePositionByOffset( SS110Logo, ScreenWidth/2, 49+offsetY+33+6 )
		SetSpriteDepth ( SS110Logo, 3 )
			
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "™", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth-12-2, 40+22, 3)
				
		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 105+offsetY+13+5+28 )
		SetSpriteColor(ScreenLine[0], 255, 255, 255, 255)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''"+HighScoreName [ GameMode, 0 ]+"''", 999, 19, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 125+offsetY+13+5+28, 3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, str(HighScoreScore [ GameMode, 0 ]), 999, 19, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 125+21+offsetY+13+5+28, 3)

		SetSpritePositionByOffset( ScreenLine[1], ScreenWidth/2, 165+offsetY+13+3+28 )
		SetSpriteColor(ScreenLine[1], 255, 255, 255, 255)

		startScreenY as integer = 244
		inc startScreenY, offsetY
		offsetScreenY as integer = 43
		if (OnMobile = TRUE) then offsetScreenY = 48
		CreateButton( 0, (ScreenWidth / 2), startScreenY + (offsetScreenY*0) )
		CreateButton( 1, (ScreenWidth / 2), startScreenY + (offsetScreenY*1) )
		CreateButton( 2, (ScreenWidth / 2), startScreenY + (offsetScreenY*2) )
		CreateButton( 3, (ScreenWidth / 2), startScreenY + (offsetScreenY*3) )
		CreateButton( 4, (ScreenWidth / 2), startScreenY + (offsetScreenY*4) )
		if (OnMobile = FALSE)
			CreateButton( 5, (ScreenWidth / 2), startScreenY + (offsetScreenY*5) )
		endif

		SetSpritePositionByOffset( ScreenLine[2], ScreenWidth/2, ScreenHeight-165+offsetY+13 )
		SetSpriteColor(ScreenLine[2], 255, 255, 255, 255)

		SetSpritePositionByOffset( ScreenLine[3], ScreenWidth/2, ScreenHeight-40+offsetY-15+13 )
		SetSpriteColor(ScreenLine[3], 255, 255, 255, 255)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "©2021 By", 999, 19, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, ScreenHeight-25+13-2-40-50, 3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Team", 999, 19, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, ScreenHeight-25+13-2-20-50, 3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''www.FallenAngelSoftware.com''", 999, 19, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, ScreenHeight-25+13-2-50, 3)


		if (SecretCodeCombined = 5432 or SecretCodeCombined = 5431) then CreateIcon(6, 360-17, 17)
		
		GameIsPlaying = FALSE

		ScreenIsDirty = TRUE
	endif

	if ThisIconWasPressed(0) = TRUE
		if MusicVolume > 0 or EffectsVolume > 0
			SetSpriteColorAlpha(Icon[IconSprite[0]], 0)
			IconSprite[0] = 0
			SetSpriteColorAlpha(Icon[IconSprite[0]], 255)
			MusicVolume = 0
			EffectsVolume = 0
			SetVolumeOfAllMusicAndSoundEffects()
			GUIchanged = TRUE
		else
			SetSpriteColorAlpha(Icon[IconSprite[0]], 0)
			IconSprite[0] = 1
			SetSpriteColorAlpha(Icon[IconSprite[0]], 255)
			MusicVolume = 100
			EffectsVolume = 100
			SetVolumeOfAllMusicAndSoundEffects()
			GUIchanged = TRUE
		endif
		SaveOptionsAndHighScores()
	elseif ThisIconWasPressed(1) = TRUE
		MusicVolume = 100
		EffectsVolume = 100
		SetVolumeOfAllMusicAndSoundEffects()
		GUIchanged = TRUE
	
		MusicPlayerScreenIndex = 0

		NextScreenToDisplay = MusicPlayerScreen
		ScreenFadeStatus = FadingToBlack
	endif

	if ThisButtonWasPressed(0) = TRUE
		if (GameMode = ChildNeverEndMode or GameMode = TeenNeverEndMode or GameMode = AdultNeverEndMode)
			NextScreenToDisplay = PlayingScreen
		else
			NextScreenToDisplay = IntroSceneScreen
		endif
		ScreenFadeStatus = FadingToBlack
	elseif ThisButtonWasPressed(1) = TRUE
		NextScreenToDisplay = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elseif ThisButtonWasPressed(2) = TRUE
		NextScreenToDisplay = HowToPlayScreen
		ScreenFadeStatus = FadingToBlack
	elseif ThisButtonWasPressed(3) = TRUE
		NextScreenToDisplay = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	elseif ThisButtonWasPressed(4) = TRUE
		NextScreenToDisplay = AboutScreen
		ScreenFadeStatus = FadingToBlack
	elseif ThisButtonWasPressed(5) = TRUE
		if (OnMobile = FALSE)
			if Platform = Web
				OpenBrowser( "http://www.fallenangelsoftware.com" )
			else
				ExitGame = 1
			endif
		endif
	elseif ThisIconWasPressed(2) = TRUE
	endif

	if FadingToBlackCompleted = TRUE
		DeleteImage(35)
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayOptionsScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		LoadSelectedBackground()
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''O P T I O N S''", 999, 30, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateArrowSet(75-17)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Music Volume:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 75-17, 3)
		ArrowSetTextStringIndex[0] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 75-17, 3)
		if MusicVolume = 100
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "100%" )
		elseif MusicVolume = 75
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "75%" )
		elseif MusicVolume = 50
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "50%" )
		elseif MusicVolume = 25
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "25%" )
		elseif MusicVolume = 0
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "0%" )
		endif

		CreateArrowSet(75+44-17)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Effects Volume:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 75+44-17, 3)
		ArrowSetTextStringIndex[1] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 75+44-17, 3)
		if EffectsVolume = 100
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "100%" )
		elseif EffectsVolume = 75
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "75%" )
		elseif EffectsVolume = 50
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "50%" )
		elseif EffectsVolume = 25
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "25%" )
		elseif EffectsVolume = 0
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "0%" )
		endif

		SetSpritePositionByOffset( ScreenLine[1], ScreenWidth/2, 150-17 )
		SetSpriteColor(ScreenLine[1], 255, 255, 255, 255)

		CreateArrowSet(180-19)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Game Mode:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 180-19, 3)
		ArrowSetTextStringIndex[2] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 180-19, 3)
		if GameMode = ChildStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Child" )
		elseif GameMode = TeenStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Teen" )
		elseif GameMode = AdultStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Adult" )
		elseif GameMode = ChildNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Child" )
		elseif GameMode = TeenNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Teen" )
		elseif GameMode = AdultNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Adult" )
		endif

		CreateArrowSet(180+44+23-38-3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Game Speed", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 180+44+23-38-3, 3)
		ArrowSetTextStringIndex[3] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 180+44+23-38-3, 3)
		if PlayingSyncRate = 20
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Slow" )
		elseif PlayingSyncRate = 30
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Normal" )
		elseif PlayingSyncRate = 45
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Fast" )
		elseif PlayingSyncRate = 60
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Turbo!" )
		endif

		CreateArrowSet(180+44+23-38+38+2)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Starting Level:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 180+44+23-38+38+2, 3)
		ArrowSetTextStringIndex[4] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 180+44+23-38+38+2, 3)
		SetTextStringOutlined ( ArrowSetTextStringIndex[4], str(StartingLevel) )

		SetSpritePositionByOffset( ScreenLine[2], ScreenWidth/2, 256+16+5 )
		SetSpriteColor(ScreenLine[2], 255, 255, 255, 255)

		if ( (Platform = Web or Platform = Android or Platform = Windows or Platform = Linux) or GameUnlocked = 0 )
			CreateArrowSet(288+16)
			CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Secret Code #1:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 288+16, 3)
			ArrowSetTextStringIndex[5] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 288+16, 3)
			SetTextStringOutlined ( ArrowSetTextStringIndex[5], str(SecretCode[0]) )

			CreateArrowSet(288+44+16)
			CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Secret Code #2:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 288+44+16, 3)
			ArrowSetTextStringIndex[6] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 288+44+16, 3)
			SetTextStringOutlined ( ArrowSetTextStringIndex[6], str(SecretCode[1]) )

			CreateArrowSet(288+44+44+16)
			CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Secret Code #3:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 288+44+44+16, 3)
			ArrowSetTextStringIndex[7] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 288+44+44+16, 3)
			SetTextStringOutlined ( ArrowSetTextStringIndex[7], str(SecretCode[2]) )

			CreateArrowSet(288+44+44+44+16)
			CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Secret Code #4:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 288+44+44+44+16, 3)
			ArrowSetTextStringIndex[8] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 288+44+44+44+16, 3)
			SetTextStringOutlined ( ArrowSetTextStringIndex[8], str(SecretCode[3]) )

			SetSpritePositionByOffset( ScreenLine[3], ScreenWidth/2, 443+19 )
			SetSpriteColor(ScreenLine[3], 255, 255, 255, 255)
		endif
		
		SetSpritePositionByOffset( ScreenLine[9], ScreenWidth/2, ScreenHeight-65+13 )
		SetSpriteColor(ScreenLine[9], 255, 255, 0, 255)

//		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "See You Again", 999, 60, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 495, 3)
//		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Next Time!", 999, 60, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 490+60, 3)
		
		CreateButton( 6, (ScreenWidth / 2), (ScreenHeight-40+15) )



		if ShowCursor = TRUE
			CreateIcon(2, (ScreenWidth/2), (ScreenHeight-100+13)-25 )
		elseif ShowCursor = FALSE
			CreateIcon(3, (ScreenWidth/2), (ScreenHeight-100+13)-25 )
		endif


				
		ChangingBackground = FALSE

		ScreenIsDirty = TRUE
	endif

	if ThisButtonWasPressed(6) = TRUE
		SetDelayAllUserInput()
		NextScreenToDisplay = TitleScreen
		ScreenFadeStatus = FadingToBlack
	endif



	if ThisIconWasPressed(0) = TRUE
		if (Platform = Android or Platform = Web or Platform = Windows or Platform = Linux)
			OpenBrowser( "https://play.google.com/store/apps/details?id=com.fallenangelsoftware.spaceswap" )
		elseif (Platform = iOS)
			OpenBrowser( "itms-apps://itunes.apple.com/app/id1394918474" )
		endif
	endif



	index as integer

	if ThisArrowWasPressed(0) = TRUE
		if MusicVolume > 0
			dec MusicVolume, 25
		else
			MusicVolume = 100
		endif

		if MusicVolume = 100
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "100%" )
		elseif MusicVolume = 75
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "75%" )
		elseif MusicVolume = 50
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "50%" )
		elseif MusicVolume = 25
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "25%" )
		elseif MusicVolume = 0
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "0%" )
		endif
		
		SetVolumeOfAllMusicAndSoundEffects()
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(.5) = TRUE
		if MusicVolume < 100
			inc MusicVolume, 25
		else
			MusicVolume = 0
		endif

		if MusicVolume = 100
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "100%" )
		elseif MusicVolume = 75
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "75%" )
		elseif MusicVolume = 50
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "50%" )
		elseif MusicVolume = 25
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "25%" )
		elseif MusicVolume = 0
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "0%" )
		endif
		
		SetVolumeOfAllMusicAndSoundEffects()
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(1) = TRUE
		if EffectsVolume > 0
			dec EffectsVolume, 25
		else
			EffectsVolume = 100
		endif

		if EffectsVolume = 100
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "100%" )
		elseif EffectsVolume = 75
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "75%" )
		elseif EffectsVolume = 50
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "50%" )
		elseif EffectsVolume = 25
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "25%" )
		elseif EffectsVolume = 0
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "0%" )
		endif
		
		SetVolumeOfAllMusicAndSoundEffects()
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(1.5) = TRUE
		if EffectsVolume < 100
			inc EffectsVolume, 25
		else
			EffectsVolume = 0
		endif

		if EffectsVolume = 100
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "100%" )
		elseif EffectsVolume = 75
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "75%" )
		elseif EffectsVolume = 50
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "50%" )
		elseif EffectsVolume = 25
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "25%" )
		elseif EffectsVolume = 0
			SetTextStringOutlined ( ArrowSetTextStringIndex[1], "0%" )
		endif
		
		SetVolumeOfAllMusicAndSoundEffects()
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(2) = TRUE
		if GameMode > 0
			dec GameMode, 1
		else
			GameMode = 5
		endif

		if (StartingLevel > LevelSkip[GameMode]) then StartingLevel = 1
		SetTextStringOutlined ( ArrowSetTextStringIndex[4], str(StartingLevel) )

		if GameMode = ChildStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Child" )
		elseif GameMode = TeenStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Teen" )
		elseif GameMode = AdultStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Adult" )
		elseif GameMode = ChildNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Child" )
		elseif GameMode = TeenNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Teen" )
		elseif GameMode = AdultNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Adult" )
		endif

		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(2.5) = TRUE
		if GameMode < 5
			inc GameMode, 1
		else
			GameMode = 0
		endif

		if (StartingLevel > LevelSkip[GameMode]) then StartingLevel = 1
		SetTextStringOutlined ( ArrowSetTextStringIndex[4], str(StartingLevel) )

		if GameMode = ChildStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Child" )
		elseif GameMode = TeenStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Teen" )
		elseif GameMode = AdultStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "Story Adult" )
		elseif GameMode = ChildNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Child" )
		elseif GameMode = TeenNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Teen" )
		elseif GameMode = AdultNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[2], "No End Adult" )
		endif

		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(3) = TRUE
		if (PlayingSyncRate = 20)
			PlayingSyncRate = 60
		elseif (PlayingSyncRate = 60)
			PlayingSyncRate = 45
		elseif (PlayingSyncRate = 45)
			PlayingSyncRate = 30
		elseif (PlayingSyncRate = 30)
			PlayingSyncRate = 20
		endif
	
		if PlayingSyncRate = 20
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Slow" )
		elseif PlayingSyncRate = 30
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Normal" )
		elseif PlayingSyncRate = 45
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Fast" )
		elseif PlayingSyncRate = 60
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Turbo!" )
		endif
	
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(3.5) = TRUE
		if (PlayingSyncRate = 20)
			PlayingSyncRate = 30
		elseif (PlayingSyncRate = 30)
			PlayingSyncRate = 45
		elseif (PlayingSyncRate = 45)
			PlayingSyncRate = 60
		elseif (PlayingSyncRate = 60)
			PlayingSyncRate = 20
		endif
	
		if PlayingSyncRate = 20
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Slow" )
		elseif PlayingSyncRate = 30
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Normal" )
		elseif PlayingSyncRate = 45
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Fast" )
		elseif PlayingSyncRate = 60
			SetTextStringOutlined ( ArrowSetTextStringIndex[3], "Turbo!" )
		endif
	
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(4) = TRUE
		if (StartingLevel > 1)
			dec StartingLevel, 1
		else
			StartingLevel = LevelSkip[GameMode]
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[4], str(StartingLevel) )

		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(4.5) = TRUE
		if (StartingLevel < LevelSkip[GameMode])
			inc StartingLevel, 1
		else
			StartingLevel = 1
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[4], str(StartingLevel) )

		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(5) = TRUE
		if SecretCode[0] > 0
			dec SecretCode[0], 1
		else
			SecretCode[0] = 9
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[5], str(SecretCode[0]) )
		SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(5.5) = TRUE
		if SecretCode[0] < 9
			inc SecretCode[0], 1
		else
			SecretCode[0] = 0
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[5], str(SecretCode[0]) )
		SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(6) = TRUE
		if SecretCode[1] > 0
			dec SecretCode[1], 1
		else
			SecretCode[1] = 9
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[6], str(SecretCode[1]) )
		SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(6.5) = TRUE
		if SecretCode[1] < 9
			inc SecretCode[1], 1
		else
			SecretCode[1] = 0
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[6], str(SecretCode[1]) )
		SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(7) = TRUE
		if SecretCode[2] > 0
			dec SecretCode[2], 1
		else
			SecretCode[2] = 9
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[7], str(SecretCode[2]) )
		SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(7.5) = TRUE
		if SecretCode[2] < 9
			inc SecretCode[2], 1
		else
			SecretCode[2] = 0
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[7], str(SecretCode[2]) )
		SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(8) = TRUE
		if SecretCode[3] > 0
			dec SecretCode[3], 1
		else
			SecretCode[3] = 9
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[8], str(SecretCode[3]) )
		SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
		SetDelayAllUserInput()
	elseif ThisArrowWasPressed(8.5) = TRUE
		if SecretCode[3] < 9
			inc SecretCode[3], 1
		else
			SecretCode[3] = 0
		endif

		SetTextStringOutlined ( ArrowSetTextStringIndex[8], str(SecretCode[3]) )
		SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
		SetDelayAllUserInput()
	endif

	if (SecretCodeCombined = 2777)
		SetSpritePositionByOffset( FadingBlackBG,  -80, -200 )
		SetSpriteColorAlpha( FadingBlackBG, 200 )
	else
		SetSpritePositionByOffset( FadingBlackBG,  ScreenWidth/2, ScreenHeight/2 )
		SetSpriteColorAlpha( FadingBlackBG, 0 )
	endif

	DrawAllArrowSets()
	
	if FadingToBlackCompleted = TRUE
	endif
endfunction
	
//------------------------------------------------------------------------------------------------------------

function DisplayHowToPlayScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		LoadSelectedBackground()
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''H O W   T O   P L A Y''", 999, 30, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)
		
		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Objective is to keep pieces", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 62+(0*25), 3 )
		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "from reaching the top.", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 62+(1*25), 3 )

		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "As you play, new pieces", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 72+(2*25), 3 )
		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "will appear at the bottom.", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 72+(3*25), 3 )

		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Rearrange the pieces horizontally", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 82+(4*25), 3 )
		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "into sets of 3 or more.", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 82+(5*25), 3 )

		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "3 or more same pieces horizontally", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 92+(6*25), 3 )
		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "or vertically will be cleared.", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 92+(7*25), 3 )

		SetSpritePositionByOffset( ScreenLine[1], ScreenWidth/2, 290 )
		SetSpriteColor(ScreenLine[1], 255, 255, 255, 255)

		if (GameMode = ChildStoryMode or GameMode = TeenStoryMode or GameMode = AdultStoryMode)
			CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Do You Have The Skills", 999, 27, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 340+(0*25), 3 )
			CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "To Clear All 9 Levels & Win?", 999, 27, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 340+(1*25), 3 )
		else
			CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Do You Have The Skills", 999, 27, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 340+(0*25), 3 )
			CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "To Get A New High Score?", 999, 27, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 340+(1*25), 3 )
		endif

		SetSpritePositionByOffset( ScreenLine[2], ScreenWidth/2, 415 )
		SetSpriteColor(ScreenLine[2], 255, 255, 255, 255)

		if (Platform = Web or Platform = Windows or Platform = Linux)
			LoadImage ( 61, "\media\images\gui\KeyboardControls.png" )
			KeyboardControls = CreateSprite ( 61 )
			SetSpriteOffset( KeyboardControls, (GetSpriteWidth(KeyboardControls)/2) , (GetSpriteHeight(KeyboardControls)/2) ) 
			SetSpritePositionByOffset( KeyboardControls, ScreenWidth/2, 500 )
			SetSpriteDepth ( KeyboardControls, 3 )
		elseif (Platform = Android or Platform = iOS)
			CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "See You", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 470, 3 )
			CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Again Soon!", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 470+60, 3 )
		endif
		
		SetSpritePositionByOffset( ScreenLine[9], ScreenWidth/2, ScreenHeight-65+13 )
		SetSpriteColor(ScreenLine[9], 255, 255, 0, 255)
		
		SetSpritePositionByOffset( ScreenLine[9], ScreenWidth/2, ScreenHeight-65+13 )
		SetSpriteColor(ScreenLine[9], 255, 255, 0, 255)

		CreateButton( 6, (ScreenWidth / 2), (ScreenHeight-40+15) )

		ScreenIsDirty = TRUE
	endif

	if ThisButtonWasPressed(6) = TRUE
		NextScreenToDisplay = TitleScreen
		ScreenFadeStatus = FadingToBlack
	endif

	if FadingToBlackCompleted = TRUE
		DeleteImage(61)
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayHighScoresScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		LoadSelectedBackground()
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''H I G H   S C O R E S''", 999, 30, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateArrowSet(75)
		ArrowSetTextStringIndex[0] = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, (ScreenWidth/2), 75, 3)
		if GameMode = ChildStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "Story Child" )
		elseif GameMode = TeenStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "Story Teen" )
		elseif GameMode = AdultStoryMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "Story Adult" )
		elseif GameMode = ChildNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "No End Child" )
		elseif GameMode = TeenNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "No End Teen" )
		elseif GameMode = AdultNeverEndMode
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "No End Adult" )
		endif

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "NAME", 999, 15, 200, 200, 200, 255, 0, 0, 0, 0, 29, 130, 3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "LEVEL", 999, 15, 200, 200, 200, 255, 0, 0, 0, 0, 29+170, 130, 3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "SCORE", 999, 15, 200, 200, 200, 255, 0, 0, 0, 0, 29+170+60, 130, 3)
		screenY as integer
		screenY = 150
		rank as integer
		blue as integer
		for rank = 0 to 9
			blue = 255
			if Score = HighScoreScore [ GameMode, rank ] and Level = HighScoreLevel [ GameMode, rank ] then blue = 0
			
			CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, str(rank+1)+".", 999, 15, 200, 200, 200, 255, 0, 0, 0, 0, 8, screenY, 3)
			CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, HighScoreName [ GameMode, rank ], 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 31, screenY, 3)
			
			if HighScoreLevel[GameMode, rank] < 10
				CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, str(HighScoreLevel [ GameMode, rank ]), 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 29+170, screenY, 3)
			elseif (GameMode = ChildStoryMode or GameMode = TeenStoryMode or GameMode = AdultStoryMode)
				CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "WON!", 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 29+170, screenY, 3)
			else
				CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, str(HighScoreLevel [ GameMode, rank ]), 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 29+170, screenY, 3)
			endif
			
			CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, str(HighScoreScore [ GameMode, rank ]), 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 29+170+60, screenY, 3)
	
			inc screenY, 40
		next rank

		SetSpritePositionByOffset( ScreenLine[9], ScreenWidth/2, ScreenHeight-65+13 )
		SetSpriteColor(ScreenLine[9], 255, 255, 0, 255)

		CreateButton( 6, (ScreenWidth / 2), (ScreenHeight-40+15) )
		
		if SecretCode[0] = 2 and SecretCode[1] = 7 and SecretCode[2] = 7 and SecretCode[3] = 7 then CreateButton( 7, (ScreenWidth/2), (ScreenHeight-85) )

		ScreenIsDirty = TRUE
	endif

	if ThisButtonWasPressed(6) = TRUE
		NextScreenToDisplay = TitleScreen
		ScreenFadeStatus = FadingToBlack
	elseif ThisButtonWasPressed(7) = TRUE
		ClearHighScores()
		NextScreenToDisplay = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	endif

	if ThisArrowWasPressed(0) = TRUE
		if GameMode > 0
			dec GameMode, 1
		else
			GameMode = 5
		endif
		
		NextScreenToDisplay = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	elseif ThisArrowWasPressed(.5) = TRUE
		if GameMode < 5
			inc GameMode, 1
		else
			GameMode = 0
		endif
		
		NextScreenToDisplay = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	endif

	DrawAllArrowSets()
	
	if FadingToBlackCompleted = TRUE
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function SetupAboutScreenTexts( )
	outline as integer
	
	outline = TRUE

	startScreenY as integer
	startScreenY = 640+15
	AboutTextsScreenY[0] = startScreenY
	StartIndexOfAboutScreenTexts = CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[0], 999, 16, 255, 255, AboutTextsBlue[0], 255, 0, 0, 0, 1, ScreenWidth/2+84, AboutTextsScreenY[0], 3)
	AboutTextVisable[0] = 0
	inc startScreenY, 25
	AboutTextsScreenY[1] = startScreenY
	CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[1], 999, 16, 255, 255, AboutTextsBlue[1], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[1], 3)
	AboutTextVisable[1] = 0

	index as integer
	for index = 2 to (NumberOfAboutScreenTexts-1)
		if AboutTextsBlue[index-1] = 0
			inc startScreenY, 30
		elseif AboutTextsBlue[index-1] = 254
			inc startScreenY, 30
		elseif AboutTextsBlue[index] = 254
			inc startScreenY, 30
		elseif AboutTextsBlue[index-1] = 255 and AboutTextsBlue[index] = 255
			inc startScreenY, 30
		else
			inc startScreenY, 80
		endif

		if index = (NumberOfAboutScreenTexts-2)
			inc startScreenY, 320-45
		endif

		AboutTextsScreenY[index] = startScreenY
		
		if (AboutTexts[index] = "Hyper-Custom ''JeZxLee'' Pro-Built Desktop")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 15, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "GIGABYTE® GA-970A-DS3P 2.0 AM3+ Motherboard")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 13, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "nVidia® GeForce GTX 970TT 4GB GDDR5 GPU")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 15, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "Western Digital® 1TB HDD Hard Drive(Personal Data)")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 13, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		else
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 16, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		endif

		AboutTextVisable[index] = 0
	next index
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayAboutScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		SetDelayAllUserInput()

		ClearScreenWithColor ( 0, 0, 0 )

		LoadSelectedBackground()
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		NextScreenToDisplay = TitleScreen

		SetupAboutScreenTexts()

		AboutScreenTextFrameSkip = 0
		
		AboutScreenOffsetY = 0
		AboutScreenBackgroundY = 320

		AboutScreenFPSY = -200

		multiplier = 3

		ScreenIsDirty = TRUE
	endif

	if AboutScreenOffsetY > (AboutTextsScreenY[NumberOfAboutScreenTexts-1]+10) or MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27
		ScreenFadeStatus = FadingToBlack
		if AboutScreenOffsetY < (AboutTextsScreenY[NumberOfAboutScreenTexts-1]+10) then PlaySoundEffect(1)
		SetDelayAllUserInput()
	endif

	multiplier = 3.0

	if (ScreenFadeStatus = FadingIdle)
		inc AboutScreenOffsetY, multiplier
		inc AboutScreenBackgroundY, multiplier
		inc AboutScreenFPSY, multiplier
		
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, AboutScreenBackgroundY )

		if (SecretCodeCombined = 2777) then SetSpritePositionByOffset( FadingBlackBG, -80, AboutScreenFPSY )

		SetViewOffset( 0, AboutScreenOffsetY )
	endif

	if FadingToBlackCompleted = TRUE
		SetViewOffset( 0, 0 )

		if (WonGame = TRUE)
			if (PlayerRankOnGameOver < 10)
				if (OnMobile = TRUE)
					NextScreenToDisplay = NewHighScoreNameInputAndroidScreen
				else
					NextScreenToDisplay = NewHighScoreNameInputScreen
				endif
			else	
				NextScreenToDisplay = HighScoresScreen
			endif
		elseif (WonGame = FALSE)
			NextScreenToDisplay = TitleScreen
		endif
		
		WonGame = FALSE
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayMusicPlayerScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		LoadSelectedBackground()
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''M U S I C   S C R E E N''", 999, 30, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "CHOOSE", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 120, 3)

		PlayNewMusic(MusicPlayerScreenIndex, 1)

		CreateArrowSet(ScreenHeight/3)
		ArrowSetTextStringIndex[0] = CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, (ScreenWidth/2), (ScreenHeight/3), 3 )
		if MusicPlayerScreenIndex = 0
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: Title" )
		elseif MusicPlayerScreenIndex = 1
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: Title 2" )
		elseif MusicPlayerScreenIndex = 2
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: Story Intro" )
		elseif MusicPlayerScreenIndex = 3
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: InGame Start" )
		elseif MusicPlayerScreenIndex = 4
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: InGame Middle" )
		elseif MusicPlayerScreenIndex = 5
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: InGame End" )
		elseif MusicPlayerScreenIndex = 6
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: Time Attack" )
		elseif MusicPlayerScreenIndex = 7
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: New High Score" )
		elseif MusicPlayerScreenIndex = 8
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: Top High Score" )
		elseif MusicPlayerScreenIndex = 9
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: Ending" )
		elseif MusicPlayerScreenIndex = 10
			SetTextStringOutlined ( ArrowSetTextStringIndex[0], "BGM: Ending Turbo" )
		endif

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "YOUR", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 300, 3)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "BGM", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 300+75, 3)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "MUSIC!", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 300+75+75, 3)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "(Not Final!)", 999, 35, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 300+75+75+80, 3)

		SetSpritePositionByOffset( ScreenLine[9], ScreenWidth/2, ScreenHeight-65+13 )
		SetSpriteColor(ScreenLine[9], 255, 255, 0, 255)

		CreateButton( 6, (ScreenWidth / 2), (ScreenHeight-40+15) )

		ScreenIsDirty = TRUE
	endif

	if ThisButtonWasPressed(6) = TRUE
		NextScreenToDisplay = TitleScreen
		ScreenFadeStatus = FadingToBlack
		MusicPlayerScreenIndex = 0
		PlayNewMusic(0, 1)
	endif

	if ThisArrowWasPressed(0) = TRUE
		if MusicPlayerScreenIndex > 0
			dec MusicPlayerScreenIndex, 1
			if (SecretCodeCombined <> 5431 and MusicPlayerScreenIndex = 1) then MusicPlayerScreenIndex = 0
		else
			if (SecretCodeCombined <> 5431)
				MusicPlayerScreenIndex = 8
			else
				MusicPlayerScreenIndex = 10
			endif

		endif
		
		NextScreenToDisplay = MusicPlayerScreen
		ScreenFadeStatus = FadingToBlack
	elseif ThisArrowWasPressed(.5) = TRUE
		if MusicPlayerScreenIndex < 10
			inc MusicPlayerScreenIndex, 1
		else
			MusicPlayerScreenIndex = 0
		endif

		if (SecretCodeCombined <> 5431 and MusicPlayerScreenIndex = 1) then MusicPlayerScreenIndex = 2

		if (SecretCodeCombined <> 5431 and MusicPlayerScreenIndex > 8) then MusicPlayerScreenIndex = 0
		
		NextScreenToDisplay = MusicPlayerScreen
		ScreenFadeStatus = FadingToBlack
	endif

	DrawAllArrowSets()
	
	if FadingToBlackCompleted = TRUE
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayPlayingScreen( )
	index as integer
	
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255

		ClearScreenWithColor ( 0, 0, 0 )

		LoadSelectedBackground()
		SetSpriteTransparency( TitleBG, 0 ) 
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )
		SetSpriteDepth ( TitleBG, 5 )
		
		LoadImage ( 36, "\media\images\playing\BoardNewerTop.png" )
		PlayfieldTopSprite = CreateSprite ( 36 )
		SetSpriteTransparency( PlayfieldTopSprite, 0 ) 
		SetSpriteOffset( PlayfieldTopSprite, (GetSpriteWidth(PlayfieldTopSprite)/2) , (GetSpriteHeight(PlayfieldTopSprite)/2) ) 
		SetSpritePositionByOffset( PlayfieldTopSprite, (ScreenWidth/2), 19 )
		SetSpriteDepth ( PlayfieldTopSprite, 3 )

		LoadImage ( 37, "\media\images\playing\BoardNewerRight.png" )
		PlayfieldRightSprite = CreateSprite ( 37 )
		SetSpriteTransparency( PlayfieldRightSprite, 0 ) 
		SetSpriteOffset( PlayfieldRightSprite, (GetSpriteWidth(PlayfieldRightSprite)/2) , (GetSpriteHeight(PlayfieldRightSprite)/2) ) 
		SetSpritePositionByOffset( PlayfieldRightSprite, (ScreenWidth-22), (ScreenHeight/2) )
		SetSpriteDepth ( PlayfieldRightSprite, 3 )

		LoadImage ( 38, "\media\images\playing\BoardNewerBottom.png" )
		PlayfieldBottomSprite = CreateSprite ( 38 )
		SetSpriteTransparency( PlayfieldBottomSprite, 0 ) 
		SetSpriteOffset( PlayfieldBottomSprite, (GetSpriteWidth(PlayfieldBottomSprite)/2) , (GetSpriteHeight(PlayfieldBottomSprite)/2) ) 
		SetSpritePositionByOffset( PlayfieldBottomSprite, (ScreenWidth/2), (ScreenHeight-19) )
		SetSpriteDepth ( PlayfieldBottomSprite, 3 )

		LoadImage ( 39, "\media\images\playing\BoardNewerLeft.png" )
		PlayfieldLeftSprite = CreateSprite ( 39 )
		SetSpriteTransparency( PlayfieldLeftSprite, 0 ) 
		SetSpriteOffset( PlayfieldLeftSprite, (GetSpriteWidth(PlayfieldLeftSprite)/2) , (GetSpriteHeight(PlayfieldLeftSprite)/2) ) 
		SetSpritePositionByOffset( PlayfieldLeftSprite, (22), (ScreenHeight/2) )
		SetSpriteDepth ( PlayfieldLeftSprite, 3 )

		LoadImage ( 51, "\media\images\playing\BoxRed.png" )
		for index = 0 to 78
			BoxRedSprite[index] = CreateSprite ( 51 )
			if (index > 1) then SetSpriteVisible ( BoxRedSprite[index], 0 )
			SetSpriteTransparency( BoxRedSprite[index], 0 ) 
			SetSpriteOffset( BoxRedSprite[index], (GetSpriteWidth(BoxRedSprite[index])/2) , (GetSpriteHeight(BoxRedSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxRedSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxRedSprite[index], 5 )
		next index

		LoadImage ( 52, "\media\images\playing\BoxOrange.png" )
		for index = 0 to 78
			BoxOrangeSprite[index] = CreateSprite ( 52 )
			if (index > 1) then SetSpriteVisible ( BoxOrangeSprite[index], 0 )
			SetSpriteTransparency( BoxOrangeSprite[index], 0 ) 
			SetSpriteOffset( BoxOrangeSprite[index], (GetSpriteWidth(BoxOrangeSprite[index])/2) , (GetSpriteHeight(BoxOrangeSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxOrangeSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxOrangeSprite[index], 5 )
		next index

		LoadImage ( 53, "\media\images\playing\BoxYellow.png" )
		for index = 0 to 78
			BoxYellowSprite[index] = CreateSprite ( 53 )
			if (index > 1) then SetSpriteVisible ( BoxYellowSprite[index], 0 )
			SetSpriteTransparency( BoxYellowSprite[index], 0 ) 
			SetSpriteOffset( BoxYellowSprite[index], (GetSpriteWidth(BoxYellowSprite[index])/2) , (GetSpriteHeight(BoxYellowSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxYellowSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxYellowSprite[index], 5 )
		next index

		LoadImage ( 54, "\media\images\playing\BoxGreen.png" )
		for index = 0 to 78
			BoxGreenSprite[index] = CreateSprite ( 54 )
			if (index > 1) then SetSpriteVisible ( BoxGreenSprite[index], 0 )
			SetSpriteTransparency( BoxGreenSprite[index], 0 ) 
			SetSpriteOffset( BoxGreenSprite[index], (GetSpriteWidth(BoxGreenSprite[index])/2) , (GetSpriteHeight(BoxGreenSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxGreenSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxGreenSprite[index], 5 )
		next index

		LoadImage ( 55, "\media\images\playing\BoxBlue.png" )
		for index = 0 to 78
			BoxBlueSprite[index] = CreateSprite ( 55 )
			if (index > 1) then SetSpriteVisible ( BoxBlueSprite[index], 0 )
			SetSpriteTransparency( BoxBlueSprite[index], 0 ) 
			SetSpriteOffset( BoxBlueSprite[index], (GetSpriteWidth(BoxBlueSprite[index])/2) , (GetSpriteHeight(BoxBlueSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxBlueSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxBlueSprite[index], 5 )
		next index

		LoadImage ( 56, "\media\images\playing\BoxPurple.png" )
		for index = 0 to 78
			BoxPurpleSprite[index] = CreateSprite ( 56 )
			if (index > 1) then SetSpriteVisible ( BoxPurpleSprite[index], 0 )
			SetSpriteTransparency( BoxPurpleSprite[index], 0 ) 
			SetSpriteOffset( BoxPurpleSprite[index], (GetSpriteWidth(BoxPurpleSprite[index])/2) , (GetSpriteHeight(BoxPurpleSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxPurpleSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxPurpleSprite[index], 5 )
		next index

		LoadImage ( 59, "\media\images\playing\BoxWhite.png" )
		for index = 0 to 78
			BoxWhiteSprite[index] = CreateSprite ( 59 )
			SetSpriteVisible ( BoxWhiteSprite[index], 0 )
			SetSpriteOffset( BoxWhiteSprite[index], (GetSpriteWidth(BoxWhiteSprite[index])/2) , (GetSpriteHeight(BoxWhiteSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxWhiteSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxWhiteSprite[index], 5 )
		next index

		LoadImage ( 58, "\media\images\playing\BoxBlack.png" )
		for index = 0 to 5
			BoxBlackSprite[index] = CreateSprite ( 58 )
			SetSpriteColorAlpha( BoxBlackSprite[index], 160 )
			SetSpriteOffset( BoxBlackSprite[index], (GetSpriteWidth(BoxBlackSprite[index])/2) , (GetSpriteHeight(BoxBlackSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxBlackSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxBlackSprite[index], 4 )
		next index

		LoadImage ( 57, "\media\images\playing\Selector.png" )
		SelectorSprite = CreateSprite ( 57 )
		SetSpriteOffset( SelectorSprite, (GetSpriteWidth(SelectorSprite)/2) , (GetSpriteHeight(SelectorSprite)/2) ) 
		SetSpritePositionByOffset( SelectorSprite, -9999, -9999 )
		SetSpriteDepth ( SelectorSprite, 3 )

		LoadImage ( 75, "\media\images\backgrounds\GameOver.png" )
		GameOverSprite = CreateSprite ( 75 )
		SetSpriteOffset( GameOverSprite, (GetSpriteWidth(GameOverSprite)/2) , (GetSpriteHeight(GameOverSprite)/2) ) 
		SetSpritePositionByOffset( GameOverSprite, (ScreenWidth/2), (ScreenHeight/2) ) rem -9999, -9999 )
		SetSpriteDepth ( GameOverSprite, 2 )
		SetSpriteVisible( GameOverSprite, 0 )

		LoadImage ( 42, "\media\images\backgrounds\GamePausedBG.png" )
		GamePausedBG = CreateSprite ( 42 )
		SetSpriteTransparency( GamePausedBG, 0 ) 
		SetSpriteOffset( GamePausedBG, (GetSpriteWidth(GamePausedBG)/2) , (GetSpriteHeight(GamePausedBG)/2) ) 
		SetSpritePositionByOffset( GamePausedBG, (ScreenWidth/2), (ScreenHeight/2) ) rem -9999, -9999 )
		SetSpriteDepth ( GamePausedBG, 2 )
		SetSpriteVisible ( GamePausedBG, 0 )

		LoadImage ( 63, "\media\images\gui\Bonus.png" )
		BonusSprite = CreateSprite ( 63 )
		SetSpriteOffset( BonusSprite, (GetSpriteWidth(BonusSprite)/2) , (GetSpriteHeight(BonusSprite)/2) ) 
		SetSpritePositionByOffset( BonusSprite, (ScreenWidth/2), (78) )
		SetSpriteDepth ( BonusSprite, 2 )
		SetSpriteVisible( BonusSprite, 0 )

		if (GameIsPlaying = FALSE)
			SetupForNewGame()
			GameIsPlaying = TRUE
		endif

		ScoreText = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 22, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 19, 3)
		LevelText = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 22, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 626, 3)

		SetTextStringOutlined ( ScoreText, str(Score) )

		if (Level < 9 or GameMode = ChildNeverEndMode or GameMode = TeenNeverEndMode or GameMode = AdultNeverEndMode)
			SetTextStringOutlined ( LevelText, str(Level) )
		else
			SetTextStringOutlined ( LevelText, "Final Level!" )
		endif

		FreezeText = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 16, 255, 255, 255, 255, 0, 0, 0, 1, 22, ScreenHeight/2, 3)
		FreezeTextTwo = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 16, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth-22, ScreenHeight/2, 3)

		DrawPlayfield ( )

		if MusicVolume > 0 or EffectsVolume > 0
			CreateIcon(1, 18+2, 18+2 )
		else
			CreateIcon(0, 18+2, 18+2 )
		endif

		CreateIcon( 4, (ScreenWidth-18-2), 18+2 )

		CreateIcon( 5, 360-18-2, (ScreenHeight-18-2) )
	endif

	if (TimeFreezeTimer > 1)
		SetTextStringOutlined ( FreezeText, str(TimeFreezeTimer/10) )
		SetTextStringOutlined ( FreezeTextTwo, str(TimeFreezeTimer/10) )
	elseif (TimeFreezeTimer = 1)
		SetTextStringOutlined ( FreezeText, " " )
		SetTextStringOutlined ( FreezeTextTwo, " " )
	endif
	
	if (GameOverTimer = -1)
		if ThisIconWasPressed(0) = TRUE
			if MusicVolume > 0 or EffectsVolume > 0
				SetSpriteColorAlpha(Icon[IconSprite[0]], 0)
				IconSprite[0] = 0
				SetSpriteColorAlpha(Icon[IconSprite[0]], 255)
				MusicVolume = 0
				EffectsVolume = 0
				SetVolumeOfAllMusicAndSoundEffects()
				GUIchanged = TRUE
			else
				SetSpriteColorAlpha(Icon[IconSprite[0]], 0)
				IconSprite[0] = 1
				SetSpriteColorAlpha(Icon[IconSprite[0]], 255)
				MusicVolume = 100
				EffectsVolume = 100
				SetVolumeOfAllMusicAndSoundEffects()
				GUIchanged = TRUE
			endif
			SaveOptionsAndHighScores()
		elseif ThisIconWasPressed(1) = TRUE
			GameQuit = TRUE
			NextScreenToDisplay = TitleScreen
			PlayNewMusic(0, 1)
			GameOverTimer = 0
			ScreenFadeStatus = FadingToBlack
		elseif ThisIconWasPressed(2) = TRUE
			if (GamePaused = -1)
				GamePaused = 50

				SetDelayAllUserInput()

				SetSpriteVisible ( GamePausedBG, 1 )

				SetSpritePositionByOffset( BonusSprite, (ScreenWidth/2), (78-9999) )
				
				SetSpriteDepth ( Icon[0], 1 )
				SetSpriteDepth ( Icon[1], 1 )
				SetSpriteDepth ( Icon[4], 1 )
				SetSpriteDepth ( Icon[5], 1 )
				PauseMusicOGG(MusicTrack[CurrentlyPlayingMusicIndex]) 
			elseif (GamePaused = 0)
				GamePaused = -50

				SetDelayAllUserInput()

				SetSpriteVisible ( GamePausedBG, 0 )

				SetSpritePositionByOffset( BonusSprite, (ScreenWidth/2), (78) )

				SetSpriteDepth ( Icon[0], 2 )
				SetSpriteDepth ( Icon[1], 2 )
				SetSpriteDepth ( Icon[4], 2 )
				SetSpriteDepth ( Icon[5], 2 )
				ResumeMusicOGG(MusicTrack[CurrentlyPlayingMusicIndex])
			endif		
		endif
	endif

	if (GamePaused > 0)
		dec GamePaused, 1
	elseif (GamePaused < -1)
		inc GamePaused, 1
	endif

	if (GameOverTimer > 1)
		dec GameOverTimer, 1
	elseif (GameOverTimer = 1)
		NextScreenToDisplay = TitleScreen
		if (WonGame = FALSE) then PlayNewMusic(0, 1)
		GameOverTimer = 0
		ScreenFadeStatus = FadingToBlack
	endif

	if (GamePaused = -1)
		if (GameOverTimer = -1)
			RunGameplayCore ()
			DrawPlayfield ()	
		endif
	endif
	
	if (GameOverTimer > -1) then SetSpriteVisible( GameOverSprite, 1 )

	if FadingToBlackCompleted = TRUE

		DeleteImage(42)
		DeleteImage(63)
		
		DeleteImage(75)
		
		DeleteImage(51)
		DeleteImage(52)
		DeleteImage(53)
		DeleteImage(54)
		DeleteImage(55)
		DeleteImage(56)
		
		DeleteImage(57)
		
		DeleteImage(58)
		DeleteImage(59)
		
		DeleteImage(36)
		DeleteImage(37)
		DeleteImage(38)
		DeleteImage(39)

		if (GameIsPlaying = TRUE and GameQuit = FALSE)
			CheckPlayerForHighScore()
			if (WonGame = FALSE)
				if (PlayerRankOnGameOver < 10)
					if (PlayerRankOnGameOver = 0)
						PlayNewMusic(8, 1)
					else
						PlayNewMusic(7, 1)
					endif

					if (OnMobile = TRUE)
						NextScreenToDisplay = NewHighScoreNameInputAndroidScreen
					else
						NextScreenToDisplay = NewHighScoreNameInputScreen
					endif
				else	
					NextScreenToDisplay = HighScoresScreen
				endif						
			elseif ( WonGame = TRUE)
				NextScreenToDisplay = EndingSceneScreen
			endif
		endif
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayNewHighScoreNameInputScreen ( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		PreRenderCharacterIconTexts()

		LoadSelectedBackground()		
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''N E W   H I G H   S C O R E''", 999, 28, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "You Achieved A New High Score!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 70, 3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Enter Your Name!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 70+25, 3)

		SetSpritePositionByOffset( ScreenLine[1], ScreenWidth/2, 130 )
		SetSpriteColor(ScreenLine[1], 255, 255, 255, 255)

		NewHighScoreCurrentName = ""
		NewHighScoreNameIndex = 0

		NewNameText = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 30, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 185, 3)
		SetTextStringOutlined ( NewNameText, NewHighScoreCurrentName )

		SetSpritePositionByOffset( ScreenLine[2], ScreenWidth/2, 240 )
		SetSpriteColor(ScreenLine[2], 255, 255, 255, 255)

		screenX as integer
		screenX = 18
		screenY as integer
		screenY = 310
		indexX as integer
		indexY as integer
		index as integer
		index = 10
		for indexY = 0 to 4
			for indexX = 0 to 12
				CreateIcon( index, (screenX+(indexX*27)), (screenY+(indexY*48)) )
				
				inc index, 1
			next indexX
		next indexY

		SetSpritePositionByOffset( ScreenLine[9], ScreenWidth/2, ScreenHeight-65+13 )
		SetSpriteColor(ScreenLine[9], 255, 255, 0, 255)

		CreateButton( 5, (ScreenWidth / 2), (ScreenHeight-40+15) )

		NextScreenToDisplay = HighScoresScreen

		CurrentIconBeingPressed = -1

		ScreenIsDirty = TRUE
	endif

	shiftAddition as integer
	shiftAddition = 0
	if ShiftKeyPressed = FALSE then inc shiftAddition, 26
	
	if DelayAllUserInput = 0
		index = LastKeyboardChar
		if (LastKeyboardChar >= 65 and LastKeyboardChar <= 90)
			IconAnimationTimer[ (index-65) + shiftAddition ] = 2
			CurrentIconBeingPressed = index

			if (CurrentKeyboardKeyPressed < 2)
				inc NewHighScoreNameIndex, 1
				NewHighScoreCurrentName = NewHighScoreCurrentName + IconText[(index-65) + 10 + shiftAddition]
				CurrentKeyboardKeyPressed = 2
			endif
		elseif (LastKeyboardChar >= 48 and LastKeyboardChar <= 57)
			IconAnimationTimer[ (index+4) ] = 2
			CurrentIconBeingPressed = index

			if (CurrentKeyboardKeyPressed < 2)
				inc NewHighScoreNameIndex, 1
				NewHighScoreCurrentName = NewHighScoreCurrentName + IconText[index+4+10]
				CurrentKeyboardKeyPressed = 2
			endif
		elseif LastKeyboardChar = 32
			IconAnimationTimer[26+37] = 2
			CurrentIconBeingPressed = 26+37

			if (CurrentKeyboardKeyPressed < 2)
				inc NewHighScoreNameIndex, 1
				NewHighScoreCurrentName = NewHighScoreCurrentName + IconText[26+37+10]
				CurrentKeyboardKeyPressed = 2
			endif
		elseif LastKeyboardChar = 107
			IconAnimationTimer[72-10] = 2
			CurrentIconBeingPressed = 72

			if (CurrentKeyboardKeyPressed < 2)
				inc NewHighScoreNameIndex, 1
				NewHighScoreCurrentName = NewHighScoreCurrentName + IconText[72]
				CurrentKeyboardKeyPressed = 2
			endif
		elseif LastKeyboardChar = 8
			IconAnimationTimer[26+38] = 2
			CurrentIconBeingPressed = 26+38

			CurrentKeyboardKeyPressed = index
		else
			if (CurrentKeyboardKeyPressed > -1) then dec CurrentKeyboardKeyPressed, 1
		endif
	endif

	for index = 0 to 63
		if ThisIconWasPressed(index) and CurrentKeyboardKeyPressed = -1
			inc NewHighScoreNameIndex, 1
			NewHighScoreCurrentName = NewHighScoreCurrentName + IconText[10+index]
		endif
	next index

	if ThisIconWasPressed(64)
		SetDelayAllUserInput()
		if NewHighScoreNameIndex > 0 then dec NewHighScoreNameIndex, 1
		NewHighScoreCurrentName = left( NewHighScoreCurrentName, len(NewHighScoreCurrentName) -1 )
	endif

	if NewHighScoreNameIndex > 9
		NewHighScoreNameIndex = 9
		NewHighScoreCurrentName= left( NewHighScoreCurrentName, len(NewHighScoreCurrentName) -1 )
	endif

	if ThisButtonWasPressed(5) = TRUE
		NextScreenToDisplay = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	endif

	SetTextStringOutlined ( NewNameText, NewHighScoreCurrentName )

	if FadingToBlackCompleted = TRUE
		HighScoreName [ GameMode, PlayerRankOnGameOver ] = NewHighScoreCurrentName
		SaveOptionsAndHighScores()
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayNewHighScoreNameInputAndroidScreen ( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		PreRenderCharacterIconTexts()

		LoadSelectedBackground()
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		NameInputCharSpriteChar = 999
		MouseButtonLeftWasReleased = FALSE

		NameInputCharSprite = CreateSprite ( 131 )
		SetSpriteDepth ( NameInputCharSprite, 2 )
		SetSpriteOffset( NameInputCharSprite, (GetSpriteWidth(NameInputCharSprite)/2) , (GetSpriteHeight(NameInputCharSprite)/2) ) 
		SetSpritePositionByOffset( NameInputCharSprite, -9999, -9999 )

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "''N E W   H I G H   S C O R E''", 999, 28, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "You Achieved A New High Score!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 70, 3)
		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "Enter Your Name!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 70+25, 3)

		SetSpritePositionByOffset( ScreenLine[1], ScreenWidth/2, 130 )
		SetSpriteColor(ScreenLine[1], 255, 255, 255, 255)

		NewHighScoreCurrentName = ""
		NewHighScoreNameIndex = 0

		NewNameText = CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, " ", 999, 30, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 185, 3)
		SetTextStringOutlined ( NewNameText, NewHighScoreCurrentName )

		SetSpritePositionByOffset( ScreenLine[2], ScreenWidth/2, 240 )
		SetSpriteColor(ScreenLine[2], 255, 255, 255, 255)

		screenX as integer
		screenX = 18
		screenY as integer
		screenY = 310
		indexX as integer
		indexY as integer
		index as integer
		index = 10
		for indexY = 0 to 4
			for indexX = 0 to 12
				CreateIcon( index, (screenX+(indexX*27)), (screenY+(indexY*48)) )
				
				inc index, 1
			next indexX
		next indexY

		SetSpritePositionByOffset( ScreenLine[9], ScreenWidth/2, ScreenHeight-65+13 )
		SetSpriteColor(ScreenLine[9], 255, 255, 0, 255)

		CreateButton( 5, (ScreenWidth / 2), (ScreenHeight-40+15) )

		NextScreenToDisplay = HighScoresScreen

		ScreenIsDirty = TRUE
	endif

	for index = 0 to 63
		if ThisIconWasPressedAndroid(index)
			SetDelayAllUserInput()
			inc NewHighScoreNameIndex, 1
			NewHighScoreCurrentName = NewHighScoreCurrentName + IconText[10+index]
		endif
	next index

	if ThisIconWasPressedAndroid(64)
		SetDelayAllUserInput()
		if NewHighScoreNameIndex > 0 then dec NewHighScoreNameIndex, 1
		NewHighScoreCurrentName = left( NewHighScoreCurrentName, len(NewHighScoreCurrentName) -1 )
	endif

	if NewHighScoreNameIndex > 9
		NewHighScoreNameIndex = 9
		NewHighScoreCurrentName= left( NewHighScoreCurrentName, len(NewHighScoreCurrentName) -1 )
	endif

	shiftAddition as integer
	shiftAddition = 0
	if ShiftKeyPressed = FALSE then inc shiftAddition, 26
		if DelayAllUserInput = 0
			
		for index = 65 to 90
			if LastKeyboardChar = index
				IconAnimationTimer[ (index-65) + shiftAddition ] = 10
				PlaySoundEffect(1)
				SetDelayAllUserInput()
			endif
		next index

		for index = 48 to 57
			if LastKeyboardChar = index
				IconAnimationTimer[ (index+4) ] = 10
				PlaySoundEffect(1)
				SetDelayAllUserInput()
			endif
		next index

		if LastKeyboardChar = 107
			IconAnimationTimer[26+36] = 10
			PlaySoundEffect(1)
			SetDelayAllUserInput()
		elseif LastKeyboardChar = 32
			IconAnimationTimer[26+37] = 10
			PlaySoundEffect(1)
			SetDelayAllUserInput()

		elseif LastKeyboardChar = 8
			IconAnimationTimer[26+38] = 10
			PlaySoundEffect(1)
			SetDelayAllUserInput()
		endif
	endif

	if ThisButtonWasPressed(5) = TRUE
		NextScreenToDisplay = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	endif

	SetTextStringOutlined ( NewNameText, NewHighScoreCurrentName )

	if FadingToBlackCompleted = TRUE
		HighScoreName [ GameMode, PlayerRankOnGameOver ] = NewHighScoreCurrentName
		SaveOptionsAndHighScores()
	endif
endfunction
	
//------------------------------------------------------------------------------------------------------------

function DisplayIntroSceneScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		PlayNewMusic(2, 1)

		ClearScreenWithColor ( 0, 0, 0 )

		LoadImage ( 200, "\media\images\story\EarthBG.png" )
		IntroEarthBGSprite = CreateSprite ( 200 )
		SetSpriteOffset( IntroEarthBGSprite, (GetSpriteWidth(IntroEarthBGSprite)/2) , (GetSpriteHeight(IntroEarthBGSprite)/2) ) 
		SetSpritePositionByOffset( IntroEarthBGSprite, (ScreenWidth/2), (ScreenHeight/2) )
		SetSpriteDepth ( IntroEarthBGSprite, 6 )

		IntroEarthScale = 1

		LoadImage ( 201, "\media\images\story\Earth.png" )
		IntroEarthSprite = CreateSprite ( 201 )
		SetSpriteOffset( IntroEarthSprite, (GetSpriteWidth(IntroEarthSprite)/2) , (GetSpriteHeight(IntroEarthSprite)/2) ) 
		SetSpriteScaleByOffset( IntroEarthSprite, IntroEarthScale, IntroEarthScale )
		SetSpritePositionByOffset( IntroEarthSprite, (ScreenWidth/2), (ScreenHeight/2) )
		SetSpriteDepth ( IntroEarthSprite, 4 )

		IntroStarsScale[0] = 0
		IntroStarsScale[1] = .5
		IntroStarsScale[2] = 1
		IntroStarsScale[3] = 1.5
		IntroStarsScale[4] = 2

		LoadImage ( 203, "\media\images\story\Stars.png" )
		starIndex as integer
		for starIndex = 0 to 4
			IntroStarsSprite[starIndex] = CreateSprite ( 203 )
			SetSpriteOffset( IntroStarsSprite[starIndex], (GetSpriteWidth(IntroStarsSprite[starIndex])/2) , (GetSpriteHeight(IntroStarsSprite[starIndex])/2) )
			SetSpriteScaleByOffset( IntroStarsSprite[starIndex], IntroStarsScale[starIndex], IntroStarsScale[starIndex] )
			SetSpritePositionByOffset( IntroStarsSprite[starIndex], (ScreenWidth/2), (ScreenHeight/2) )
			SetSpriteDepth ( IntroStarsSprite[starIndex], 5 )
		next starIndex

		IntroShuttleScale = 0
		IntroShuttleScreenX = (ScreenWidth/2)
		IntroShuttleScreenY = (ScreenHeight/2)

		LoadImage ( 202, "\media\images\story\Shuttle1.png" )
		IntroShuttleSprite = CreateSprite ( 202 )
		SetSpriteOffset( IntroShuttleSprite, (GetSpriteWidth(IntroShuttleSprite)/2) , (GetSpriteHeight(IntroShuttleSprite)/2) ) 
		SetSpriteScaleByOffset( IntroShuttleSprite, IntroShuttleScale, IntroShuttleScale )
		SetSpritePositionByOffset( IntroShuttleSprite, IntroShuttleScreenX, IntroShuttleScreenY )
		SetSpriteDepth ( IntroShuttleSprite, 3 )

		IntroAnimationStep = -1

		DelayAllUserInput = 20

		if (OnMobile = TRUE)
			IntroText = CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Tap To Continue!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, ScreenHeight-25, 3 )
		elseif (OnMobile = FALSE)
			IntroText = CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "Click To Continue!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, ScreenHeight-25, 3 )
		endif

		TextFlash = 0

		ScreenIsDirty = TRUE
	endif

	if (TextFlash < 25)
		inc TextFlash, 1
	else
		TextFlash = 0
	endif

	if (TextFlash < 20)
		if (OnMobile = TRUE)
			SetTextStringOutlined (IntroText,  "Tap To Continue!")
		elseif (OnMobile = FALSE)
			SetTextStringOutlined (IntroText,  "Click To Continue!")
		endif
	else
		SetTextStringOutlined (IntroText,  " ")
	endif

	PerformancePercent = 1.0

	for starIndex = 0 to 4
		if (IntroStarsScale[starIndex] < 0)
			IntroStarsScale[starIndex] = 2
		else
			if (PerformancePercent < 1)
				dec IntroStarsScale[starIndex], .05
			else
				dec IntroStarsScale[starIndex], .05 * PerformancePercent
			endif
		endif
		SetSpriteScaleByOffset( IntroStarsSprite[starIndex], IntroStarsScale[starIndex], IntroStarsScale[starIndex] )
	next starIndex

	if (IntroAnimationStep = -1)
		PlaySoundEffect(3)
		IntroAnimationStep = 0
	elseif (IntroAnimationStep = 0)
		if (IntroShuttleScale < 1)
			inc IntroShuttleScale, .01 * (PerformancePercent)
			SetSpriteScaleByOffset( IntroShuttleSprite, IntroShuttleScale, IntroShuttleScale )
		else
			IntroAnimationStep = 1
		endif
	elseif (IntroAnimationStep = 1)
		if (IntroShuttleScreenX < 360+160)
			inc IntroShuttleScreenX, 3 * (PerformancePercent)
			dec IntroShuttleScreenY, 2 * (PerformancePercent)
			SetSpritePositionByOffset( IntroShuttleSprite, IntroShuttleScreenX, IntroShuttleScreenY )
		else
			IntroShuttleScale = 0
			IntroShuttleScreenX = (ScreenWidth/2)
			IntroShuttleScreenY = (ScreenHeight/2)
			SetSpriteScaleByOffset( IntroShuttleSprite, IntroShuttleScale, IntroShuttleScale )
			SetSpritePositionByOffset( IntroShuttleSprite, IntroShuttleScreenX, IntroShuttleScreenY )

			PlaySoundEffect(3)

			IntroAnimationStep = 2
		endif
	elseif (IntroAnimationStep = 2)
		if (IntroShuttleScale < 1)
			inc IntroShuttleScale, .01 * (PerformancePercent)
			SetSpriteScaleByOffset( IntroShuttleSprite, IntroShuttleScale, IntroShuttleScale )
		else
			IntroAnimationStep = 3
		endif
	elseif (IntroAnimationStep = 3)
		if (IntroShuttleScreenX < 360+160)
			if (IntroEarthScale > 0)
				dec IntroEarthScale, .01 * (PerformancePercent)
				SetSpriteScaleByOffset( IntroEarthSprite, IntroEarthScale, IntroEarthScale )
			endif
					
			inc IntroShuttleScreenX, 3
			dec IntroShuttleScreenY, 2
			SetSpritePositionByOffset( IntroShuttleSprite, IntroShuttleScreenX, IntroShuttleScreenY )
		else
			NextScreenToDisplay = PlayingScreen
			SetDelayAllUserInput()
			ScreenFadeStatus = FadingToBlack
		endif
	endif
	
	if (DelayAllUserInput = 0)
		if MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27
			NextScreenToDisplay = PlayingScreen
			PlaySoundEffect(1)
			SetDelayAllUserInput()
			ScreenFadeStatus = FadingToBlack
		endif
	endif
	
	if FadingToBlackCompleted = TRUE
		DeleteImage(200)
		DeleteImage(201)
		DeleteImage(202)
		DeleteImage(203)
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayEndingSceneScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		LoadImage ( 205, "\media\images\story\MarsBG.png" )
		EndingEarthBGSprite = CreateSprite ( 205 )
		SetSpriteOffset( EndingEarthBGSprite, (GetSpriteWidth(EndingEarthBGSprite)/2) , (GetSpriteHeight(EndingEarthBGSprite)/2) ) 
		SetSpritePositionByOffset( EndingEarthBGSprite, (ScreenWidth/2), (ScreenHeight/2) )
		SetSpriteDepth ( EndingEarthBGSprite, 6 )

		EndingEarthScale = 1
		EndingEarthScreenX = -100
		EndingEarthScreenY = (ScreenHeight/2)

		LoadImage ( 206, "\media\images\story\Earth.png" )
		EndingEarthSprite = CreateSprite ( 206 )
		SetSpriteOffset( EndingEarthSprite, (GetSpriteWidth(EndingEarthSprite)/2) , (GetSpriteHeight(EndingEarthSprite)/2) ) 
		SetSpriteScaleByOffset( EndingEarthSprite, EndingEarthScale, EndingEarthScale )
		SetSpritePositionByOffset( EndingEarthSprite, EndingEarthScreenX, EndingEarthScreenY )
		SetSpriteDepth ( EndingEarthSprite, 4 )

		EndingStarsScale[0] = 0
		EndingStarsScale[1] = .5
		EndingStarsScale[2] = 1
		EndingStarsScale[3] = 1.5
		EndingStarsScale[4] = 2

		LoadImage ( 208, "\media\images\story\Stars.png" )
		starIndex as integer
		for starIndex = 0 to 4
			EndingStarsSprite[starIndex] = CreateSprite ( 208 )
			SetSpriteOffset( EndingStarsSprite[starIndex], (GetSpriteWidth(EndingStarsSprite[starIndex])/2) , (GetSpriteHeight(EndingStarsSprite[starIndex])/2) )
			SetSpriteScaleByOffset( EndingStarsSprite[starIndex], EndingStarsScale[starIndex], EndingStarsScale[starIndex] )
			SetSpritePositionByOffset( EndingStarsSprite[starIndex], (ScreenWidth/2), (ScreenHeight/2) )
			SetSpriteDepth ( EndingStarsSprite[starIndex], 5 )
		next starIndex

		EndingShuttleScale = 0
		EndingShuttleScreenX = (ScreenWidth/2)
		EndingShuttleScreenY = (ScreenHeight/2)

		LoadImage ( 207, "\media\images\story\Shuttle2.png" )
		EndingShuttleSprite = CreateSprite ( 207 )
		SetSpriteOffset( EndingShuttleSprite, (GetSpriteWidth(EndingShuttleSprite)/2) , (GetSpriteHeight(EndingShuttleSprite)/2) ) 
		SetSpriteScaleByOffset( EndingShuttleSprite, EndingShuttleScale, EndingShuttleScale )
		SetSpritePositionByOffset( EndingShuttleSprite, EndingShuttleScreenX, EndingShuttleScreenY )
		SetSpriteDepth ( EndingShuttleSprite, 3 )

		EndingAsteroidScale = .7
		EndingAsteroidScreenX = (ScreenWidth/2)
		EndingAsteroidScreenY = (ScreenHeight/2)

		LoadImage ( 209, "\media\images\story\Asteroid.png" )
		EndingAsteroidSprite = CreateSprite ( 209 )
		SetSpriteOffset( EndingAsteroidSprite, (GetSpriteWidth(EndingAsteroidSprite)/2) , (GetSpriteHeight(EndingAsteroidSprite)/2) ) 
		SetSpriteScaleByOffset( EndingAsteroidSprite, EndingAsteroidScale, EndingAsteroidScale )
		SetSpritePositionByOffset( EndingAsteroidSprite, EndingAsteroidScreenX, EndingAsteroidScreenY )
		SetSpriteDepth ( EndingAsteroidSprite, 4 )

		EndingExplosionScale = 0
		EndingExplosionAlpha = 255

		LoadImage ( 210, "\media\images\story\Explosion.png" )
		EndingExplosionSprite = CreateSprite ( 210 )
		SetSpriteOffset( EndingExplosionSprite, (GetSpriteWidth(EndingExplosionSprite)/2) , (GetSpriteHeight(EndingExplosionSprite)/2) ) 
		SetSpriteScaleByOffset( EndingExplosionSprite, EndingExplosionScale, EndingExplosionScale )
		SetSpritePositionByOffset( EndingExplosionSprite, EndingAsteroidScreenX, EndingAsteroidScreenY )
		SetSpriteColorAlpha( EndingExplosionSprite, EndingExplosionAlpha )
		SetSpriteDepth ( EndingExplosionSprite, 2 )

		EndingAnimationStep = -1

		DelayAllUserInput = 50

		ScreenIsDirty = TRUE
	endif

	PerformancePercent = 1.0

	for starIndex = 0 to 4
		if (EndingStarsScale[starIndex] < 0)
			EndingStarsScale[starIndex] = 2
		else			
			if (PerformancePercent < 1)
				dec EndingStarsScale[starIndex], .05
			else
				dec EndingStarsScale[starIndex], .05 * (PerformancePercent)
			endif
		endif
		SetSpriteScaleByOffset( EndingStarsSprite[starIndex], EndingStarsScale[starIndex], EndingStarsScale[starIndex] )
	next starIndex

	if (EndingAnimationStep = -1)
		if ( (PerformancePercent) < 1 )
		
		else
			PlaySoundEffect(3)
			EndingAnimationStep = 0
		endif
	elseif (EndingAnimationStep = 0)
		if (EndingShuttleScale < 1)
			inc EndingShuttleScale, .01 * (PerformancePercent)
			SetSpriteScaleByOffset( EndingShuttleSprite, EndingShuttleScale, EndingShuttleScale )

			inc EndingAsteroidScreenX, 3 * (PerformancePercent)
			inc EndingAsteroidScreenY, 1 * (PerformancePercent)
			SetSpritePositionByOffset( EndingAsteroidSprite, EndingAsteroidScreenX, EndingAsteroidScreenY )

			dec EndingAsteroidScale, .005 * (PerformancePercent)
			SetSpriteScaleByOffset( EndingAsteroidSprite, EndingAsteroidScale, EndingAsteroidScale )
		else
			PlaySoundEffect(11)
			SetSpritePositionByOffset( EndingExplosionSprite, EndingAsteroidScreenX, EndingAsteroidScreenY )
			EndingAnimationStep = 1
		endif
	elseif (EndingAnimationStep = 1)
		if (EndingExplosionScale < 20)
			inc EndingExplosionScale, 1 * (PerformancePercent)
			
			SetSpriteScaleByOffset( EndingExplosionSprite, EndingExplosionScale, EndingExplosionScale )
		else
			
			EndingAnimationStep = 2
		endif
	elseif (EndingAnimationStep = 2)
		if (EndingExplosionAlpha > 0)
			dec EndingExplosionAlpha, 5 * (PerformancePercent)
		
			SetSpriteColorAlpha( EndingExplosionSprite, EndingExplosionAlpha )
		else
			SetSpriteColorAlpha( EndingExplosionSprite, 0.0 )
			PlaySoundEffect(3)
			EndingAnimationStep = 3
		endif
	elseif (EndingAnimationStep = 3)
		if (EndingShuttleScale > 0)
			dec EndingShuttleScale, .01 * (PerformancePercent)
			SetSpriteScaleByOffset( EndingShuttleSprite, EndingShuttleScale, EndingShuttleScale )

			dec EndingShuttleScreenX, 1 * (PerformancePercent)
			SetSpritePositionByOffset( EndingShuttleSprite, EndingShuttleScreenX, EndingShuttleScreenY )
			
			inc EndingEarthScreenX, 2 * (PerformancePercent)
			SetSpritePositionByOffset( EndingEarthSprite, EndingEarthScreenX, EndingEarthScreenY )
		else
			SetDelayAllUserInput()
			ScreenFadeStatus = FadingToBlack
		endif
	endif

	if (DelayAllUserInput = 0)
		if MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27
			PlaySoundEffect(1)
			SetDelayAllUserInput()
			ScreenFadeStatus = FadingToBlack
		endif
	endif
	
	if FadingToBlackCompleted = TRUE
		DeleteImage(205)
		DeleteImage(206)
		DeleteImage(207)
		DeleteImage(208)
		DeleteImage(209)
		DeleteImage(210)
		
		if (PlayingSyncRate = 60)
			PlayNewMusic(10, 1)
		else
			PlayNewMusic(9, 1)
		endif
		
		NextScreenToDisplay = AboutScreen
	endif						
endfunction
