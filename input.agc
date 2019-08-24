// "input.agc"...

function GetAllUserInput ( )
	MouseButtonLeft = OFF
	MouseButtonRight = OFF
	LastKeyboardChar = -1
	ShiftKeyPressed = FALSE
	JoystickDirection = JoyCENTER
	JoystickButtonOne = OFF
	JoystickButtonTwo = OFF
	
	if (DelayAllUserInput > 0)
		dec DelayAllUserInput, 1
		exitfunction
	endif

	if GetRawKeyState(16) = 1 then ShiftKeyPressed = TRUE

	if (OnMobile = FALSE)
		MouseScreenX = GetRawMouseX()
		MouseScreenY = GetRawMouseY()

		if ( GetRawMouseLeftState() )
			if (MouseButtonLeftReleased = TRUE)
				MouseButtonLeft = ON
				MouseButtonLeftJustClicked = 0
				MouseButtonLeftReleased = FALSE
			endif
		else
			MouseButtonLeftReleased = TRUE
		endif

		if ( GetRawMouseRightState() )
			if (MouseButtonRightReleased = TRUE)
				MouseButtonRight = ON
				MouseButtonRightJustClicked = 0
				MouseButtonRightReleased = FALSE
			endif
		else
			MouseButtonRightReleased = TRUE
		endif
	else
		MouseScreenX = GetPointerX()
		MouseScreenY = GetPointerY()

		if ( GetPointerState() = 1 )
			MouseButtonLeft = ON
			MouseButtonLeftJustClicked = 0
		else
			MouseButtonLeft = OFF
		endif
	endif

	if (MouseButtonLeft = OFF and MouseButtonLeftJustClicked = 0)
		MouseButtonLeftJustClicked = 1
	elseif (MouseButtonLeft = OFF and MouseButtonLeftJustClicked = 1)
		MouseButtonLeftJustClicked = -1
	endif

	index as integer
	for index = 1 to 255
		if GetRawKeyState(index) = 1
			LastKeyboardChar = index
		endif
	next index

	select LastKeyboardChar
		case 32:
			if (ScreenToDisplay = PlayingScreen)
				if (GamePaused = -1)
					GamePaused = 50

					SetDelayAllUserInput()

					SetSpriteVisible ( GamePausedBG, 1 )
					
					SetSpriteDepth ( Icon[0], 1 )
					SetSpriteDepth ( Icon[1], 1 )
					SetSpriteDepth ( Icon[4], 1 )
					SetSpriteDepth ( Icon[5], 1 )
					PauseMusicOGG(MusicTrack[CurrentlyPlayingMusicIndex]) 

				elseif (GamePaused = 0)
					GamePaused = -50

					SetDelayAllUserInput()

					SetSpriteVisible ( GamePausedBG, 0 )
					
					SetSpriteDepth ( Icon[0], 2 )
					SetSpriteDepth ( Icon[1], 2 )
					SetSpriteDepth ( Icon[4], 2 )
					SetSpriteDepth ( Icon[5], 2 )
					ResumeMusicOGG(MusicTrack[CurrentlyPlayingMusicIndex]) 
				endif		
			endif
		endcase
		case 38:
			JoystickDirection = JoyUP
		endcase
		case 39:
			JoystickDirection = JoyRIGHT
		endcase
		case 40:
			JoystickDirection = JoyDOWN
		endcase
		case 37:
			JoystickDirection = JoyLEFT
		endcase
	endselect
	
	if ( GetRawKeyPressed(90) )
		if (JoyButtonOneReleased = TRUE)
			JoystickButtonOne = ON
			JoyButtonOneReleased = FALSE
		endif
	else
		JoyButtonOneReleased = TRUE
	endif

	if ( GetRawKeyPressed(88) )
		if (JoyButtonTwoReleased = TRUE)
			JoystickButtonTwo = ON
			JoyButtonTwoReleased = FALSE
		endif
	else
		JoyButtonTwoReleased = TRUE
	endif
	
	JoyButtonOneReleased = TRUE
	JoyButtonTwoReleased = TRUE
	
	if LastKeyboardChar = 27
		SetDelayAllUserInput()
		PlayNewMusic(0, 1)
		QuitPlaying = TRUE
		GameIsPlaying = FALSE
		NextScreenToDisplay = TitleScreen
		ScreenFadeStatus = FadingToBlack
	endif
endfunction
