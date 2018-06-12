// "screens.agc"...

function SetDelayAllUserInput()
	DelayAllUserInput = 5
endfunction

//------------------------------------------------------------------------------------------------------------

function LoadSelectedBackground()
offset as integer
	offset = 0

	if (ScreenToDisplay <> TitleScreen)
		inc offset, 10
	endif

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
		if ScreenFadeTransparency < 255-85
			inc ScreenFadeTransparency, 85
			
			if (ScreenFadeTransparency = 255-85) then ScreenFadeTransparency = 254
		elseif ScreenFadeTransparency = 254
			ScreenFadeTransparency = 255
		elseif (ScreenFadeTransparency = 255)
			ScreenFadeTransparency = 255

			ScreenFadeStatus = FadingFromBlack
			ScreenToDisplay = NextScreenToDisplay

			DestroyAllGUI()
			
			DestroyAllTexts()
			
			DeleteAllSprites()
			
			FadingBlackBG = CreateSprite ( 1 )
			SetSpriteDepth ( FadingBlackBG, 1 )
			SetSpriteOffset( FadingBlackBG, (GetSpriteWidth(FadingBlackBG)/2) , (GetSpriteHeight(FadingBlackBG)/2) ) 
			SetSpritePositionByOffset( FadingBlackBG, ScreenWidth/2, ScreenHeight/2 )
			SetSpriteTransparency( FadingBlackBG, 1 )

			LoadSelectedBackground()

			LoadInterfaceSprites()
			
			PreRenderButtonsWithTexts()
		endif
		
		SetSpriteColorAlpha( FadingBlackBG, ScreenFadeTransparency )
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayTestDescriptionScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		BlackBG = CreateSprite ( 3 )
		SetSpriteDepth ( BlackBG, 4 )
		SetSpriteOffset( BlackBG, (GetSpriteWidth(BlackBG)/2) , (GetSpriteHeight(BlackBG)/2) ) 
		SetSpritePositionByOffset( BlackBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "For Hire Game Programmer!", 999, 20, 0, 0, 0, 255, 220, 220, 220, 1, ScreenWidth/2, 15, 3 )

		ScreenDisplayTimer = 200
		NextScreenToDisplay = AppGameKitScreen

		CreateAndInitializeOutlinedText( TRUE, CurrentMinTextIndex, "JeZxLee@16BitSoft.com", 999, 30, 0, 0, 0, 255, 220, 220, 220, 1, ScreenWidth/2, ScreenHeight-22, 3 )

		ScreenIsDirty = TRUE
	endif

	if (MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27)
		PlaySoundEffect(1)
		SetDelayAllUserInput()	
		NextScreenToDisplay = AppGameKitScreen
		ScreenFadeStatus = FadingToBlack
	endif

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
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

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
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

		SixteenBitSoftLogo = CreateSprite ( 30 )
		SetSpriteDepth ( SixteenBitSoftLogo, 3 )
		SetSpriteOffset( SixteenBitSoftLogo, (GetSpriteWidth(SixteenBitSoftLogo)/2) , (GetSpriteHeight(SixteenBitSoftLogo)/2) ) 
		SetSpriteScaleByOffset( SixteenBitSoftLogo, .65, .65 )
		SetSpritePositionByOffset( SixteenBitSoftLogo, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "www.FallenAngelSoftware.com", 999, 25, 0, 255, 0, 255, 0, 128, 0, 1, ScreenWidth/2, ScreenHeight-22, 3)
		
		ScreenDisplayTimer = 200
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
			PlaySoundEffect(1)
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

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayTitleScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		SaveOptionsAndHighScores()
		
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		if MusicVolume > 0 or EffectsVolume > 0
			CreateIcon(1, 18, 18 )
		else
			CreateIcon(0, 18, 18 )
		endif

		offsetY as integer
		offsetY = 10

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, GameVersion, 999, 16, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 21, 3)

		LF110Logo = CreateSprite ( 35 )
		SetSpriteOffset( LF110Logo, (GetSpriteWidth(LF110Logo)/2) , (GetSpriteHeight(LF110Logo)/2) ) 
		SetSpritePositionByOffset( LF110Logo, ScreenWidth/2, 49+offsetY+33+6 )
		SetSpriteDepth ( LF110Logo, 3 )
			
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
		CreateButton( 0, (ScreenWidth / 2), startScreenY + (offsetScreenY*0) )
		CreateButton( 1, (ScreenWidth / 2), startScreenY + (offsetScreenY*1) )
		CreateButton( 2, (ScreenWidth / 2), startScreenY + (offsetScreenY*2) )
		CreateButton( 3, (ScreenWidth / 2), startScreenY + (offsetScreenY*3) )
		CreateButton( 4, (ScreenWidth / 2), startScreenY + (offsetScreenY*4) )
		CreateButton( 5, (ScreenWidth / 2), startScreenY + (offsetScreenY*5) )

		SetSpritePositionByOffset( ScreenLine[2], ScreenWidth/2, ScreenHeight-165+offsetY+13 )
		SetSpriteColor(ScreenLine[2], 255, 255, 255, 255)

		if ShowCursor = TRUE
			CreateIcon(2, (ScreenWidth/2), (ScreenHeight-100+13) )
		elseif ShowCursor = FALSE
			CreateIcon(3, (ScreenWidth/2), (ScreenHeight-100+13) )
		endif

		SetSpritePositionByOffset( ScreenLine[3], ScreenWidth/2, ScreenHeight-40+offsetY-15+13 )
		SetSpriteColor(ScreenLine[3], 255, 255, 255, 255)

		CreateAndInitializeOutlinedText(TRUE, CurrentMinTextIndex, "©2018 By www.FallenAngelSoftware.com", 999, 19, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, ScreenHeight-25+13-2, 3)

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
		if (Platform = Android)
			OpenBrowser( "https://play.google.com/store/apps/details?id=com.fallenangelsoftware.spaceswap" )
		elseif (Platform = iOS)
			OpenBrowser( "itms-apps://itunes.apple.com/app/id1394918474" )
		endif
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
		if (Platform = Android or Platform = iOS)
			ExitGame = 1
		else
			OpenBrowser( "http://www.fallenangelsoftware.com" )
		endif
	elseif ThisIconWasPressed(2) = TRUE
		MusicVolume = 100
		EffectsVolume = 100
		SetVolumeOfAllMusicAndSoundEffects()
		GUIchanged = TRUE
		
		MusicPlayerScreenIndex = 0

		NextScreenToDisplay = MusicPlayerScreen
		ScreenFadeStatus = FadingToBlack
	endif

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayOptionsScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "''O P T I O N S''", 999, 30, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateArrowSet(75-17)
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Music Volume:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 75-17, 3)
		ArrowSetTextStringIndex[0] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 75-17, 3)
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
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Effects Volume:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 75+44-17, 3)
		ArrowSetTextStringIndex[1] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 75+44-17, 3)
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
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Game Mode:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 180-19, 3)
		ArrowSetTextStringIndex[2] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 180-19, 3)
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
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Game Speed", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 180+44+23-38-3, 3)
		ArrowSetTextStringIndex[3] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 180+44+23-38-3, 3)
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
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Starting Level:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 180+44+23-38+38+2, 3)
		ArrowSetTextStringIndex[4] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 180+44+23-38+38+2, 3)
		SetTextStringOutlined ( ArrowSetTextStringIndex[4], str(StartingLevel) )

		SetSpritePositionByOffset( ScreenLine[2], ScreenWidth/2, 256+16+5 )
		SetSpriteColor(ScreenLine[2], 255, 255, 255, 255)

		if ( (Platform = Web or Platform = Android) or GameUnlocked = 0 )
			CreateArrowSet(288+16)
			CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Secret Code #1:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 288+16, 3)
			ArrowSetTextStringIndex[5] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 288+16, 3)
			SetTextStringOutlined ( ArrowSetTextStringIndex[5], str(SecretCode[0]) )

			CreateArrowSet(288+44+16)
			CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Secret Code #2:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 288+44+16, 3)
			ArrowSetTextStringIndex[6] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 288+44+16, 3)
			SetTextStringOutlined ( ArrowSetTextStringIndex[6], str(SecretCode[1]) )

			CreateArrowSet(288+44+44+16)
			CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Secret Code #3:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 288+44+44+16, 3)
			ArrowSetTextStringIndex[7] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 288+44+44+16, 3)
			SetTextStringOutlined ( ArrowSetTextStringIndex[7], str(SecretCode[2]) )

			CreateArrowSet(288+44+44+44+16)
			CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Secret Code #4:", 999, 20, 255, 255, 255, 255, 0, 0, 0, 0, 56, 288+44+44+44+16, 3)
			ArrowSetTextStringIndex[8] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 2, (ScreenWidth-56), 288+44+44+44+16, 3)
			SetTextStringOutlined ( ArrowSetTextStringIndex[8], str(SecretCode[3]) )

			SetSpritePositionByOffset( ScreenLine[3], ScreenWidth/2, 443+19 )
			SetSpriteColor(ScreenLine[3], 255, 255, 255, 255)
		endif
		
		SetSpritePositionByOffset( ScreenLine[9], ScreenWidth/2, ScreenHeight-65+13 )
		SetSpriteColor(ScreenLine[9], 255, 255, 0, 255)

		if (Platform = Web or Platform = Android) then CreateIcon(7, (ScreenWidth/2), ((ScreenHeight/2)+190+17) )
		
		CreateButton( 6, (ScreenWidth / 2), (ScreenHeight-40+15) )
				
		ChangingBackground = FALSE

		ScreenIsDirty = TRUE
	endif

	if ThisButtonWasPressed(6) = TRUE
		SetDelayAllUserInput()
		NextScreenToDisplay = TitleScreen
		ScreenFadeStatus = FadingToBlack
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

	if ( ThisIconWasPressed(0) = TRUE and GetDeviceBaseName() <> "ios" )
		if (OnMobile = TRUE)
			OpenBrowser( "http://fallenangelsoftware.com/stuff/files/SpaceSwap/Source/SS-Source.txt" )
		else
			OpenBrowser( "http://fallenangelsoftware.com/stuff/files/LettersFall/HTML5/index.html" )
		endif
	endif

	DrawAllArrowSets()
	
	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
	endif
endfunction
	
//------------------------------------------------------------------------------------------------------------

function DisplayHowToPlayScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "''H O W   T O   P L A Y''", 999, 30, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)
		
		CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "Objective is to keep pieces", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 62+(0*25), 3 )
		CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "from reaching the top.", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 62+(1*25), 3 )

		CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "As you play, new pieces", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 72+(2*25), 3 )
		CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "will appear at the bottom.", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 72+(3*25), 3 )

		CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "Rearrange the pieces horizontally", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 82+(4*25), 3 )
		CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "into sets or 3 or more.", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 82+(5*25), 3 )

		CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "3 or more same pieces horizontally", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 92+(6*25), 3 )
		CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "or vertically will be cleared.", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 92+(7*25), 3 )

		SetSpritePositionByOffset( ScreenLine[1], ScreenWidth/2, 290 )
		SetSpriteColor(ScreenLine[1], 255, 255, 255, 255)

		if (GameMode = ChildStoryMode or GameMode = TeenStoryMode or GameMode = AdultStoryMode)
			CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "Do You Have The Skills", 999, 27, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 340+(0*25), 3 )
			CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "To Clear All 9 Levels & Win?", 999, 27, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 340+(1*25), 3 )
		else
			CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "Do You Have The Skills", 999, 27, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 340+(0*25), 3 )
			CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "To Get A New High Score?", 999, 27, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 340+(1*25), 3 )
		endif

		SetSpritePositionByOffset( ScreenLine[2], ScreenWidth/2, 415 )
		SetSpriteColor(ScreenLine[2], 255, 255, 255, 255)

		if (Platform = Web)
			KeyboardControls = CreateSprite ( 61 )
			SetSpriteOffset( KeyboardControls, (GetSpriteWidth(KeyboardControls)/2) , (GetSpriteHeight(KeyboardControls)/2) ) 
			SetSpritePositionByOffset( KeyboardControls, ScreenWidth/2, 500 )
			SetSpriteDepth ( KeyboardControls, 3 )
		elseif (Platform = Android or Platform = iOS)
			CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "See You", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 470, 3 )
			CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, "Again Soon!", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 470+60, 3 )
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

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayHighScoresScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "''H I G H   S C O R E S''", 999, 30, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateArrowSet(75)
		ArrowSetTextStringIndex[0] = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, (ScreenWidth/2), 75, 3)
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

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "NAME", 999, 15, 200, 200, 200, 255, 0, 0, 0, 0, 29, 130, 3)
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "LEVEL", 999, 15, 200, 200, 200, 255, 0, 0, 0, 0, 29+170, 130, 3)
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "SCORE", 999, 15, 200, 200, 200, 255, 0, 0, 0, 0, 29+170+60, 130, 3)
		screenY as integer
		screenY = 150
		rank as integer
		blue as integer
		for rank = 0 to 9
			blue = 255
			if Score = HighScoreScore [ GameMode, rank ] and Level = HighScoreLevel [ GameMode, rank ] then blue = 0
			
			CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, str(rank+1)+".", 999, 15, 200, 200, 200, 255, 0, 0, 0, 0, 8, screenY, 3)
			CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, HighScoreName [ GameMode, rank ], 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 31, screenY, 3)
			
			if HighScoreLevel[GameMode, rank] < 10
				CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, str(HighScoreLevel [ GameMode, rank ]), 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 29+170, screenY, 3)
			elseif (GameMode = ChildStoryMode or GameMode = TeenStoryMode or GameMode = AdultStoryMode)
				CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "WON!", 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 29+170, screenY, 3)
			else
				CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, str(HighScoreLevel [ GameMode, rank ]), 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 29+170, screenY, 3)
			endif
			
			CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, str(HighScoreScore [ GameMode, rank ]), 999, 18, 255, 255, blue, 255, 0, 0, 0, 0, 29+170+60, screenY, 3)
	
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
	
	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function SetupAboutScreenTexts( )
	outline as integer
	outline = FALSE

	startScreenY as integer
	startScreenY = 640+15
	AboutTextsScreenY[0] = startScreenY
	StartIndexOfAboutScreenTexts = CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[0], 999, 19, 255, 255, AboutTextsBlue[0], 255, 0, 0, 0, 1, ScreenWidth/2+100-30, AboutTextsScreenY[0], 3)
	inc startScreenY, 25
	AboutTextsScreenY[1] = startScreenY
	CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[1], 999, 19, 255, 255, AboutTextsBlue[1], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[1], 3)

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
		
		if (AboutTexts[index] = "''Neo's Kiss™'' Graphical User Interface By:")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 17, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "nVidia® GeForce GTX 750TI 2GB GDDR5 GPU")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 16, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "ASUS® 990FX SaberTooth r2.0 Motherboard")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 17, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "nVidia® GeForce GTX 970TT 4GB GDDR5 GPU")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 16, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "Untangle™ Linux Firewall On Dell® Desktop")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 17, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "(www.Untangle.com/Untangle-NG-Firewall/)")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 17, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "''A 110% By Team Fallen Angel Software!''")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 17, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "(https://www.apple.com/macos/high-sierra/)")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 17, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		elseif (AboutTexts[index] = "Genuine ''Kubuntu 18.04 64Bit L.T.S.'' Linux")
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 17, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		else
			CreateAndInitializeOutlinedText(outline, CurrentMinTextIndex, AboutTexts[index], 999, 19, 255, 255, AboutTextsBlue[index], 255, 0, 0, 0, 1, ScreenWidth/2, AboutTextsScreenY[index], 3)
		endif
	next index
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayAboutScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		SetDelayAllUserInput()

		ClearScreenWithColor ( 0, 0, 0 )

		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		NextScreenToDisplay = TitleScreen

		SetupAboutScreenTexts()

		AboutScreenTextFrameSkip = 0

		ScreenIsDirty = TRUE
	endif

	if AboutTextsScreenY[NumberOfAboutScreenTexts-1] < -25 or MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27
		ScreenFadeStatus = FadingToBlack
		if AboutTextsScreenY[NumberOfAboutScreenTexts-1] > -25 then PlaySoundEffect(1)
		SetDelayAllUserInput()
	endif
	
	if (ScreenFadeStatus = FadingIdle)
		index as integer
		indexTwo as integer
		textMovement as integer
		for index = 0 to (NumberOfAboutScreenTexts-1)
			if AboutTextsScreenY[index] > -50
				textMovement = 3 + ( (30 / roundedFPS) - 1)
					
				dec AboutTextsScreenY[index], textMovement
				
				textScreenYTemp as integer
				if GetTextExists(StartIndexOfAboutScreenTexts+(index*26)+0) then textScreenYTemp = GetTextY(StartIndexOfAboutScreenTexts+(index*26)+0)
				dec textScreenYTemp, textMovement
				if GetTextExists(StartIndexOfAboutScreenTexts+(index*26)+0) then SetTextPosition( StartIndexOfAboutScreenTexts+(index*26)+0, GetTextX(StartIndexOfAboutScreenTexts+(index*26)+0), textScreenYTemp )
			endif
		next index
	endif

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
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

		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "''M U S I C   S C R E E N''", 999, 30, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "CHOOSE", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 120, 3)

		PlayNewMusic(MusicPlayerScreenIndex, 1)

		CreateArrowSet(ScreenHeight/3)
		ArrowSetTextStringIndex[0] = CreateAndInitializeOutlinedText( FALSE, CurrentMinTextIndex, " ", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, (ScreenWidth/2), (ScreenHeight/3), 3 )
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

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "YOUR", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 300, 3)

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "BGM", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 300+75, 3)

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "MUSIC!", 999, 65, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 300+75+75, 3)

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "(Not Final!)", 999, 35, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 300+75+75+80, 3)

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
	
	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayPlayingScreen( )
	index as integer
	
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		SetSyncRate( PlayingSyncRate, 0 )

		ClearScreenWithColor ( 0, 0, 0 )

		SetSpriteTransparency( TitleBG, 0 ) 
		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )
		SetSpriteDepth ( TitleBG, 5 )
		
		PlayfieldTopSprite = CreateSprite ( 36 )
		SetSpriteTransparency( PlayfieldTopSprite, 0 ) 
		SetSpriteOffset( PlayfieldTopSprite, (GetSpriteWidth(PlayfieldTopSprite)/2) , (GetSpriteHeight(PlayfieldTopSprite)/2) ) 
		SetSpritePositionByOffset( PlayfieldTopSprite, (ScreenWidth/2), 19 )
		SetSpriteDepth ( PlayfieldTopSprite, 3 )

		PlayfieldRightSprite = CreateSprite ( 37 )
		SetSpriteTransparency( PlayfieldRightSprite, 0 ) 
		SetSpriteOffset( PlayfieldRightSprite, (GetSpriteWidth(PlayfieldRightSprite)/2) , (GetSpriteHeight(PlayfieldRightSprite)/2) ) 
		SetSpritePositionByOffset( PlayfieldRightSprite, (ScreenWidth-22), (ScreenHeight/2) )
		SetSpriteDepth ( PlayfieldRightSprite, 3 )

		PlayfieldBottomSprite = CreateSprite ( 38 )
		SetSpriteTransparency( PlayfieldBottomSprite, 0 ) 
		SetSpriteOffset( PlayfieldBottomSprite, (GetSpriteWidth(PlayfieldBottomSprite)/2) , (GetSpriteHeight(PlayfieldBottomSprite)/2) ) 
		SetSpritePositionByOffset( PlayfieldBottomSprite, (ScreenWidth/2), (ScreenHeight-19) )
		SetSpriteDepth ( PlayfieldBottomSprite, 3 )

		PlayfieldLeftSprite = CreateSprite ( 39 )
		SetSpriteTransparency( PlayfieldLeftSprite, 0 ) 
		SetSpriteOffset( PlayfieldLeftSprite, (GetSpriteWidth(PlayfieldLeftSprite)/2) , (GetSpriteHeight(PlayfieldLeftSprite)/2) ) 
		SetSpritePositionByOffset( PlayfieldLeftSprite, (22), (ScreenHeight/2) )
		SetSpriteDepth ( PlayfieldLeftSprite, 3 )

		for index = 0 to 78
			BoxRedSprite[index] = CreateSprite ( 51 )
			if (index > 1) then SetSpriteVisible ( BoxRedSprite[index], 0 )
			SetSpriteTransparency( BoxRedSprite[index], 0 ) 
			SetSpriteOffset( BoxRedSprite[index], (GetSpriteWidth(BoxRedSprite[index])/2) , (GetSpriteHeight(BoxRedSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxRedSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxRedSprite[index], 5 )
		next index

		for index = 0 to 78
			BoxOrangeSprite[index] = CreateSprite ( 52 )
			if (index > 1) then SetSpriteVisible ( BoxOrangeSprite[index], 0 )
			SetSpriteTransparency( BoxOrangeSprite[index], 0 ) 
			SetSpriteOffset( BoxOrangeSprite[index], (GetSpriteWidth(BoxOrangeSprite[index])/2) , (GetSpriteHeight(BoxOrangeSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxOrangeSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxOrangeSprite[index], 5 )
		next index

		for index = 0 to 78
			BoxYellowSprite[index] = CreateSprite ( 53 )
			if (index > 1) then SetSpriteVisible ( BoxYellowSprite[index], 0 )
			SetSpriteTransparency( BoxYellowSprite[index], 0 ) 
			SetSpriteOffset( BoxYellowSprite[index], (GetSpriteWidth(BoxYellowSprite[index])/2) , (GetSpriteHeight(BoxYellowSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxYellowSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxYellowSprite[index], 5 )
		next index

		for index = 0 to 78
			BoxGreenSprite[index] = CreateSprite ( 54 )
			if (index > 1) then SetSpriteVisible ( BoxGreenSprite[index], 0 )
			SetSpriteTransparency( BoxGreenSprite[index], 0 ) 
			SetSpriteOffset( BoxGreenSprite[index], (GetSpriteWidth(BoxGreenSprite[index])/2) , (GetSpriteHeight(BoxGreenSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxGreenSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxGreenSprite[index], 5 )
		next index

		for index = 0 to 78
			BoxBlueSprite[index] = CreateSprite ( 55 )
			if (index > 1) then SetSpriteVisible ( BoxBlueSprite[index], 0 )
			SetSpriteTransparency( BoxBlueSprite[index], 0 ) 
			SetSpriteOffset( BoxBlueSprite[index], (GetSpriteWidth(BoxBlueSprite[index])/2) , (GetSpriteHeight(BoxBlueSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxBlueSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxBlueSprite[index], 5 )
		next index

		for index = 0 to 78
			BoxPurpleSprite[index] = CreateSprite ( 56 )
			if (index > 1) then SetSpriteVisible ( BoxPurpleSprite[index], 0 )
			SetSpriteTransparency( BoxPurpleSprite[index], 0 ) 
			SetSpriteOffset( BoxPurpleSprite[index], (GetSpriteWidth(BoxPurpleSprite[index])/2) , (GetSpriteHeight(BoxPurpleSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxPurpleSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxPurpleSprite[index], 5 )
		next index

		for index = 0 to 78
			BoxWhiteSprite[index] = CreateSprite ( 59 )
			SetSpriteVisible ( BoxWhiteSprite[index], 0 )
			SetSpriteOffset( BoxWhiteSprite[index], (GetSpriteWidth(BoxWhiteSprite[index])/2) , (GetSpriteHeight(BoxWhiteSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxWhiteSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxWhiteSprite[index], 5 )
		next index

		for index = 0 to 5
			BoxBlackSprite[index] = CreateSprite ( 58 )
			SetSpriteColorAlpha( BoxBlackSprite[index], 160 )
			SetSpriteOffset( BoxBlackSprite[index], (GetSpriteWidth(BoxBlackSprite[index])/2) , (GetSpriteHeight(BoxBlackSprite[index])/2) ) 
			SetSpritePositionByOffset( BoxBlackSprite[index], -9999, -9999 )
			SetSpriteDepth ( BoxBlackSprite[index], 4 )
		next index

		SelectorSprite = CreateSprite ( 57 )
		SetSpriteOffset( SelectorSprite, (GetSpriteWidth(SelectorSprite)/2) , (GetSpriteHeight(SelectorSprite)/2) ) 
		SetSpritePositionByOffset( SelectorSprite, -9999, -9999 )
		SetSpriteDepth ( SelectorSprite, 3 )

		GameOverSprite = CreateSprite ( 75 )
		SetSpriteOffset( GameOverSprite, (GetSpriteWidth(GameOverSprite)/2) , (GetSpriteHeight(GameOverSprite)/2) ) 
		SetSpritePositionByOffset( GameOverSprite, (ScreenWidth/2), (ScreenHeight/2) ) rem -9999, -9999 )
		SetSpriteDepth ( GameOverSprite, 2 )
		SetSpriteVisible( GameOverSprite, 0 )

		GamePausedBG = CreateSprite ( 42 )
		SetSpriteTransparency( GamePausedBG, 0 ) 
		SetSpriteOffset( GamePausedBG, (GetSpriteWidth(GamePausedBG)/2) , (GetSpriteHeight(GamePausedBG)/2) ) 
		SetSpritePositionByOffset( GamePausedBG, (ScreenWidth/2), (ScreenHeight/2) ) rem -9999, -9999 )
		SetSpriteDepth ( GamePausedBG, 2 )
		SetSpriteVisible ( GamePausedBG, 0 )

		BonusSprite = CreateSprite ( 63 )
		SetSpriteOffset( BonusSprite, (GetSpriteWidth(BonusSprite)/2) , (GetSpriteHeight(BonusSprite)/2) ) 
		SetSpritePositionByOffset( BonusSprite, (ScreenWidth/2), (78) )
		SetSpriteDepth ( BonusSprite, 2 )
		SetSpriteVisible( BonusSprite, 0 )

		if (GameIsPlaying = FALSE)
			SetupForNewGame()
			GameIsPlaying = TRUE
		endif

		ScoreText = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 22, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 19, 3)
		LevelText = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 22, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 626, 3)

		SetText ( ScoreText, str(Score) )

		if (Level < 9 or GameMode = ChildNeverEndMode or GameMode = TeenNeverEndMode or GameMode = AdultNeverEndMode)
			SetText ( LevelText, str(Level) )
		else
			SetText ( LevelText, "Final Level!" )
		endif

		FreezeText = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 16, 255, 255, 255, 255, 0, 0, 0, 1, 22, ScreenHeight/2, 3)
		FreezeTextTwo = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 16, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth-22, ScreenHeight/2, 3)

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
		SetText ( FreezeText, str(TimeFreezeTimer/10) )
		SetText ( FreezeTextTwo, str(TimeFreezeTimer/10) )
	elseif (TimeFreezeTimer = 1)
		SetText ( FreezeText, " " )
		SetText ( FreezeTextTwo, " " )
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
			NextScreenToDisplay = TitleScreen
			PlayNewMusic(0, 1)
			GameOverTimer = 0
			ScreenFadeStatus = FadingToBlack
		elseif ThisIconWasPressed(2) = TRUE
			if (GamePaused = -1)
				GamePaused = 50

				SetDelayAllUserInput()

				SetSpriteVisible ( GamePausedBG, 1 )
				
				SetSpriteDepth ( Icon[0], 1 )
				SetSpriteDepth ( Icon[1], 1 )
				SetSpriteDepth ( Icon[4], 1 )
				SetSpriteDepth ( Icon[5], 1 )
			elseif (GamePaused = 0)
				GamePaused = -50

				SetDelayAllUserInput()

				SetSpriteVisible ( GamePausedBG, 0 )

				SetSpriteDepth ( Icon[0], 2 )
				SetSpriteDepth ( Icon[1], 2 )
				SetSpriteDepth ( Icon[4], 2 )
				SetSpriteDepth ( Icon[5], 2 )
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

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
		SetSyncRate( 30, 0 )
		if (GameIsPlaying = TRUE)
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

		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "''N E W   H I G H   S C O R E''", 999, 28, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "You Achieved A New High Score!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 70, 3)
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Enter Your Name!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 70+25, 3)

		SetSpritePositionByOffset( ScreenLine[1], ScreenWidth/2, 130 )
		SetSpriteColor(ScreenLine[1], 255, 255, 255, 255)

		NewHighScoreCurrentName = ""
		NewHighScoreNameIndex = 0

		NewNameText = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 30, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 185, 3)
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
		if ThisIconWasPressed(index)
			SetDelayAllUserInput()
			inc NewHighScoreNameIndex, 1
			NewHighScoreCurrentName = NewHighScoreCurrentName + IconText[10+index]
		endif
	next index

	if ThisIconWasPressed(64)
		SetDelayAllUserInput()
		if NewHighScoreNameIndex > 0 then dec NewHighScoreNameIndex, 1
		NewHighScoreCurrentName = left( NewHighScoreCurrentName, len(NewHighScoreCurrentName) -1 )
	endif

	if NewHighScoreNameIndex > 13
		NewHighScoreNameIndex = 13
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

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
		HighScoreName [ GameMode, PlayerRankOnGameOver ] = NewHighScoreCurrentName
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayNewHighScoreNameInputAndroidScreen ( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		PreRenderCharacterIconTexts()

		SetSpritePositionByOffset( TitleBG, ScreenWidth/2, ScreenHeight/2 )

		NameInputCharSpriteChar = 999
		MouseButtonLeftWasReleased = FALSE

		NameInputCharSprite = CreateSprite ( 131 )
		SetSpriteDepth ( NameInputCharSprite, 2 )
		SetSpriteOffset( NameInputCharSprite, (GetSpriteWidth(NameInputCharSprite)/2) , (GetSpriteHeight(NameInputCharSprite)/2) ) 
		SetSpritePositionByOffset( NameInputCharSprite, -9999, -9999 )

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "''N E W   H I G H   S C O R E''", 999, 28, 255, 255, 0, 255, 0, 0, 0, 1, ScreenWidth/2, 20-5, 3)

		SetSpritePositionByOffset( ScreenLine[0], ScreenWidth/2, 41-10 )
		SetSpriteColor(ScreenLine[0], 255, 255, 0, 255)

		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "You Achieved A New High Score!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 70, 3)
		CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, "Enter Your Name!", 999, 20, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 70+25, 3)

		SetSpritePositionByOffset( ScreenLine[1], ScreenWidth/2, 130 )
		SetSpriteColor(ScreenLine[1], 255, 255, 255, 255)

		NewHighScoreCurrentName = ""
		NewHighScoreNameIndex = 0

		NewNameText = CreateAndInitializeOutlinedText(FALSE, CurrentMinTextIndex, " ", 999, 30, 255, 255, 255, 255, 0, 0, 0, 1, ScreenWidth/2, 185, 3)
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

	if NewHighScoreNameIndex > 13
		NewHighScoreNameIndex = 13
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

	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
		HighScoreName [ GameMode, PlayerRankOnGameOver ] = NewHighScoreCurrentName
	endif
endfunction
	
//------------------------------------------------------------------------------------------------------------

function DisplayIntroSceneScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		PlayNewMusic(2, 1)

		ClearScreenWithColor ( 0, 0, 0 )

		IntroEarthBGSprite = CreateSprite ( 200 )
		SetSpriteOffset( IntroEarthBGSprite, (GetSpriteWidth(IntroEarthBGSprite)/2) , (GetSpriteHeight(IntroEarthBGSprite)/2) ) 
		SetSpritePositionByOffset( IntroEarthBGSprite, (ScreenWidth/2), (ScreenHeight/2) )
		SetSpriteDepth ( IntroEarthBGSprite, 6 )

		IntroEarthScale = 1

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

		IntroShuttleSprite = CreateSprite ( 202 )
		SetSpriteOffset( IntroShuttleSprite, (GetSpriteWidth(IntroShuttleSprite)/2) , (GetSpriteHeight(IntroShuttleSprite)/2) ) 
		SetSpriteScaleByOffset( IntroShuttleSprite, IntroShuttleScale, IntroShuttleScale )
		SetSpritePositionByOffset( IntroShuttleSprite, IntroShuttleScreenX, IntroShuttleScreenY )
		SetSpriteDepth ( IntroShuttleSprite, 3 )

		IntroAnimationStep = 0

		PlaySoundEffect(3)

		ScreenIsDirty = TRUE
	endif

	for starIndex = 0 to 4
		if (IntroStarsScale[starIndex] < 0)
			IntroStarsScale[starIndex] = 2
		else
			dec IntroStarsScale[starIndex], .05
		endif
		SetSpriteScaleByOffset( IntroStarsSprite[starIndex], IntroStarsScale[starIndex], IntroStarsScale[starIndex] )
	next starIndex

	if (IntroAnimationStep = 0)
		if (IntroShuttleScale < 1)
			inc IntroShuttleScale, .01
			SetSpriteScaleByOffset( IntroShuttleSprite, IntroShuttleScale, IntroShuttleScale )
		else
			IntroAnimationStep = 1
		endif
	elseif (IntroAnimationStep = 1)
		if (IntroShuttleScreenX < 360+160)
			inc IntroShuttleScreenX, 3
			dec IntroShuttleScreenY, 2
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
			inc IntroShuttleScale, .01
			SetSpriteScaleByOffset( IntroShuttleSprite, IntroShuttleScale, IntroShuttleScale )
		else
			IntroAnimationStep = 3
		endif
	elseif (IntroAnimationStep = 3)
		if (IntroShuttleScreenX < 360+160)
			if (IntroEarthScale > 0)
				dec IntroEarthScale, .01
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
	
	if MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27
		NextScreenToDisplay = PlayingScreen
		PlaySoundEffect(1)
		SetDelayAllUserInput()
		ScreenFadeStatus = FadingToBlack
	endif
	
	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
		
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function DisplayEndingSceneScreen( )
	if ScreenFadeStatus = FadingFromBlack and ScreenFadeTransparency = 255
		ClearScreenWithColor ( 0, 0, 0 )

		EndingEarthBGSprite = CreateSprite ( 205 )
		SetSpriteOffset( EndingEarthBGSprite, (GetSpriteWidth(EndingEarthBGSprite)/2) , (GetSpriteHeight(EndingEarthBGSprite)/2) ) 
		SetSpritePositionByOffset( EndingEarthBGSprite, (ScreenWidth/2), (ScreenHeight/2) )
		SetSpriteDepth ( EndingEarthBGSprite, 6 )

		EndingEarthScale = 1
		EndingEarthScreenX = -100
		EndingEarthScreenY = (ScreenHeight/2)

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

		EndingShuttleSprite = CreateSprite ( 207 )
		SetSpriteOffset( EndingShuttleSprite, (GetSpriteWidth(EndingShuttleSprite)/2) , (GetSpriteHeight(EndingShuttleSprite)/2) ) 
		SetSpriteScaleByOffset( EndingShuttleSprite, EndingShuttleScale, EndingShuttleScale )
		SetSpritePositionByOffset( EndingShuttleSprite, EndingShuttleScreenX, EndingShuttleScreenY )
		SetSpriteDepth ( EndingShuttleSprite, 3 )

		EndingAsteroidScale = .7
		EndingAsteroidScreenX = (ScreenWidth/2)
		EndingAsteroidScreenY = (ScreenHeight/2)

		EndingAsteroidSprite = CreateSprite ( 209 )
		SetSpriteOffset( EndingAsteroidSprite, (GetSpriteWidth(EndingAsteroidSprite)/2) , (GetSpriteHeight(EndingAsteroidSprite)/2) ) 
		SetSpriteScaleByOffset( EndingAsteroidSprite, EndingAsteroidScale, EndingAsteroidScale )
		SetSpritePositionByOffset( EndingAsteroidSprite, EndingAsteroidScreenX, EndingAsteroidScreenY )
		SetSpriteDepth ( EndingAsteroidSprite, 4 )

		EndingExplosionScale = 0
		EndingExplosionAlpha = 255

		EndingExplosionSprite = CreateSprite ( 210 )
		SetSpriteOffset( EndingExplosionSprite, (GetSpriteWidth(EndingExplosionSprite)/2) , (GetSpriteHeight(EndingExplosionSprite)/2) ) 
		SetSpriteScaleByOffset( EndingExplosionSprite, EndingExplosionScale, EndingExplosionScale )
		SetSpritePositionByOffset( EndingExplosionSprite, EndingAsteroidScreenX, EndingAsteroidScreenY )
		SetSpriteColorAlpha( EndingExplosionSprite, EndingExplosionAlpha )
		SetSpriteDepth ( EndingExplosionSprite, 2 )

		EndingAnimationStep = 0

		PlaySoundEffect(3)

		ScreenIsDirty = TRUE
	endif

	for starIndex = 0 to 4
		if (EndingStarsScale[starIndex] < 0)
			EndingStarsScale[starIndex] = 2
		else
			dec EndingStarsScale[starIndex], .05
		endif
		SetSpriteScaleByOffset( EndingStarsSprite[starIndex], EndingStarsScale[starIndex], EndingStarsScale[starIndex] )
	next starIndex

	if (EndingAnimationStep = 0)
		if (EndingShuttleScale < 1)
			inc EndingShuttleScale, .01
			SetSpriteScaleByOffset( EndingShuttleSprite, EndingShuttleScale, EndingShuttleScale )

			inc EndingAsteroidScreenX, 3
			inc EndingAsteroidScreenY, 1
			SetSpritePositionByOffset( EndingAsteroidSprite, EndingAsteroidScreenX, EndingAsteroidScreenY )

			dec EndingAsteroidScale, .005
			SetSpriteScaleByOffset( EndingAsteroidSprite, EndingAsteroidScale, EndingAsteroidScale )
		else
			PlaySoundEffect(11)
			SetSpritePositionByOffset( EndingExplosionSprite, EndingAsteroidScreenX, EndingAsteroidScreenY )
			EndingAnimationStep = 1
		endif
	elseif (EndingAnimationStep = 1)
		if (EndingExplosionScale < 20)
			inc EndingExplosionScale, 1
			
			SetSpriteScaleByOffset( EndingExplosionSprite, EndingExplosionScale, EndingExplosionScale )
		else
			
			EndingAnimationStep = 2
		endif
	elseif (EndingAnimationStep = 2)
		if (EndingExplosionAlpha > 0)
			dec EndingExplosionAlpha, 5
		
			SetSpriteColorAlpha( EndingExplosionSprite, EndingExplosionAlpha )
		else
			
			EndingAnimationStep = 3
		endif
	elseif (EndingAnimationStep = 3)
		if (EndingShuttleScale > 0)
			dec EndingShuttleScale, .01
			SetSpriteScaleByOffset( EndingShuttleSprite, EndingShuttleScale, EndingShuttleScale )

			dec EndingShuttleScreenX, 1
			SetSpritePositionByOffset( EndingShuttleSprite, EndingShuttleScreenX, EndingShuttleScreenY )
			
			inc EndingEarthScreenX, 2
			SetSpritePositionByOffset( EndingEarthSprite, EndingEarthScreenX, EndingEarthScreenY )
		else
			NextScreenToDisplay = AboutScreen
			SetDelayAllUserInput()
			ScreenFadeStatus = FadingToBlack
		endif
	endif

	if MouseButtonLeft = ON or LastKeyboardChar = 32 or LastKeyboardChar = 13 or LastKeyboardChar = 27
		NextScreenToDisplay = PlayingScreen
		PlaySoundEffect(1)
		SetDelayAllUserInput()
		ScreenFadeStatus = FadingToBlack
	endif
	
	if ScreenFadeStatus = FadingToBlack and ScreenFadeTransparency = 254
		if (PlayerRankOnGameOver < 10)
			if (OnMobile = TRUE)
				NextScreenToDisplay = NewHighScoreNameInputAndroidScreen
			else
				NextScreenToDisplay = NewHighScoreNameInputScreen
			endif
		else	
			NextScreenToDisplay = HighScoresScreen
		endif
	endif						
endfunction
