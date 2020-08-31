// "logic.agc"...

function SetupForNewGame()
	indexY as integer
	indexX as integer

	for indexY = 0 to 12
		for indexX = 0 to 5
			Playfield[indexX, indexY] = 0
		next indexX
	next indexY

	for indexY = 5 to 12
		for indexX = 0 to 5
			Playfield[indexX, indexY] = Random( 1, 6 )
		next indexX
	next indexY

	Playfield[1,  5] = 5
	Playfield[1,  6] = 3
	Playfield[1,  7] = 1
	Playfield[2,  7] = 1
	Playfield[3,  7] = 2
	Playfield[4,  7] = 1
	Playfield[1,  8] = 3
	Playfield[1,  9] = 3
	Playfield[1, 10] = 5
	Playfield[1, 11] = 5

	for indexY = 0 to 12
		for indexX = 0 to 5
			PlayfieldBackup[indexX, indexY] = Playfield[indexX, indexY]
		next indexX
	next indexY

	for indexY = 0 to 11
		for indexX = 0 to 5
			PlayfieldColoredBoxIndex[indexX, indexY] = 0
		next indexX
	next indexY

	if (SecretCodeCombined = 9876)
		Score = 9548327
		Level = 9
	else
		Score = 0
		Level = StartingLevel
	endif

	if (GameMode = ChildStoryMode or GameMode = TeenStoryMode or GameMode = AdultStoryMode)
		if (Level < 3)
			PlayNewMusic(3, 1)
		elseif (Level < 6)
			PlayNewMusic(4, 1)
		else
			PlayNewMusic(5, 1)
		endif
	else
		PlayNewMusic(6, 1)
	endif

	PlayerPlayfieldX = 2
	PlayerPlayfieldY = 6

	GameOverTimer = -1

	GamePaused = -1

	PlayfieldOffsetY = 0
	PlayfieldOffsetYDelay = 0
	
	PlayerMovementDelay = 0
	
	PlayerMovePlayfieldX = -1
	PlayerMovePlayfieldY = -1

	PlayerSwapPieceOne = -1
	PlayerSwapPieceTwo = -1
	PlayerSwapPieceOneScreenX = -1
	PlayerSwapPieceTwoScreenX = -1
	PlayerSwapPiecesScreenY = -1
	PlayerSwapMovement = -1

	PlayerSwapOnePlayfieldX = -1
	PlayerSwapOnePlayfieldY = -1
	PlayerSwapTwoPlayfieldX = -1
	PlayerSwapTwoPlayfieldY = -1
	
	PlayerSwapDirection = 0
	
	PiecesFell = TRUE
	
	MatchFlashTimer = -1

	BoxRedUsed = 2
	BoxOrangeUsed = 2
	BoxYellowUsed = 2
	BoxGreenUsed = 2
	BoxBlueUsed = 2
	BoxPurpleUsed = 2
	
	BoxWhiteUsed = 2
	
	NumberOfPiecesCleared = 0
	NumberOfMatchesCleared = 0
	
	LevelAdvancePieceCounter = 0
	if (SecretCodeCombined = 9876) then LevelAdvancePieceCounter = LevelAdvancePieceCount[GameMode]-10
		
	StagingScore = 0
	StagingLevelAdvance = 0
		
	WonGame = FALSE
	
	GameQuit = FALSE
	
	PlayerRankOnGameOver = 999
	
	TimeFreezeTimer = 0
	
	NumberOfCombos = 0
	
	ComboTakenCareOf = TRUE
	
	CheckForMatches (TRUE)
endfunction

//------------------------------------------------------------------------------------------------------------

function DrawPlayfield()
	index as integer
	for index = BoxRedUsed to 2 step -1
		SetSpriteVisible ( BoxRedSprite[index], 0 ) 
	next index
	for index = BoxOrangeUsed to 2 step -1
		SetSpriteVisible ( BoxOrangeSprite[index], 0 ) 
	next index
	for index = BoxYellowUsed to 2 step -1
		SetSpriteVisible ( BoxYellowSprite[index], 0 ) 
	next index
	for index = BoxGreenUsed to 2 step -1
		SetSpriteVisible ( BoxGreenSprite[index], 0 ) 
	next index
	for index = BoxBlueUsed to 2 step -1
		SetSpriteVisible ( BoxBlueSprite[index], 0 ) 
	next index
	for index = BoxPurpleUsed to 2 step -1
		SetSpriteVisible ( BoxPurpleSprite[index], 0 ) 
	next index
	for index = BoxWhiteUsed to 2 step -1
		SetSpriteVisible ( BoxWhiteSprite[index], 0 ) 
	next index

	BoxRedUsed = 2
	BoxOrangeUsed = 2
	BoxYellowUsed = 2
	BoxGreenUsed = 2
	BoxBlueUsed = 2
	BoxPurpleUsed = 2
	
	BoxWhiteUsed = 2

	flashDelay as integer
	flashDelay = 2

	state as integer
	indexY as integer
	indexX as integer
	screenY as integer
	screenY = 83
	screenX as integer
	screenX = 67
	for indexY = 0 to 12
		for indexX = 0 to 5
			if ( (PlayerSwapOnePlayfieldX <> indexX or PlayerSwapOnePlayfieldY <> indexY) and (PlayerSwapTwoPlayfieldX <> indexX or PlayerSwapTwoPlayfieldY <> indexY) )
				state = Playfield[indexX, indexY]
                select state 
                    case 1:
						SetSpriteVisible ( BoxRedSprite[BoxRedUsed], 1 ) 
						SetSpritePositionByOffset( BoxRedSprite[BoxRedUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxRedUsed
						inc BoxRedUsed, 1
                    endcase
                    case 2:
						SetSpriteVisible ( BoxOrangeSprite[BoxOrangeUsed], 1 ) 
						SetSpritePositionByOffset( BoxOrangeSprite[BoxOrangeUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxOrangeUsed
						inc BoxOrangeUsed, 1
                    endcase
                    case 3:
						SetSpriteVisible ( BoxYellowSprite[BoxYellowUsed], 1 ) 
						SetSpritePositionByOffset( BoxYellowSprite[BoxYellowUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxYellowUsed
						inc BoxYellowUsed, 1
                    endcase
                    case 4:
						SetSpriteVisible ( BoxGreenSprite[BoxGreenUsed], 1 ) 
						SetSpritePositionByOffset( BoxGreenSprite[BoxGreenUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxGreenUsed
						inc BoxGreenUsed, 1
                    endcase
                    case 5:
						SetSpriteVisible ( BoxBlueSprite[BoxBlueUsed], 1 ) 
						SetSpritePositionByOffset( BoxBlueSprite[BoxBlueUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxBlueUsed
						inc BoxBlueUsed, 1
                    endcase
                    case 6:
						SetSpriteVisible ( BoxPurpleSprite[BoxPurpleUsed], 1 ) 
						SetSpritePositionByOffset( BoxPurpleSprite[BoxPurpleUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxPurpleUsed
						inc BoxPurpleUsed, 1
                    endcase

                    case 11:
						SetSpriteVisible ( BoxRedSprite[BoxRedUsed], 1 ) 
						SetSpritePositionByOffset( BoxRedSprite[BoxRedUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxRedUsed
						inc BoxRedUsed, 1

						if ( mod(MatchFlashTimer, flashDelay) = 0 )
							SetSpriteVisible ( BoxWhiteSprite[BoxWhiteUsed], 1 ) 
							SetSpritePositionByOffset( BoxWhiteSprite[BoxWhiteUsed], screenX, screenY-PlayfieldOffsetY )
							inc BoxWhiteUsed, 1
						endif
                    endcase
                    case 12:
						SetSpriteVisible ( BoxOrangeSprite[BoxOrangeUsed], 1 ) 
						SetSpritePositionByOffset( BoxOrangeSprite[BoxOrangeUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxOrangeUsed
						inc BoxOrangeUsed, 1

						if ( mod(MatchFlashTimer, flashDelay) = 0 )
							SetSpriteVisible ( BoxWhiteSprite[BoxWhiteUsed], 1 ) 
							SetSpritePositionByOffset( BoxWhiteSprite[BoxWhiteUsed], screenX, screenY-PlayfieldOffsetY )
							inc BoxWhiteUsed, 1
						endif
                    endcase
                    case 13:
						SetSpriteVisible ( BoxYellowSprite[BoxYellowUsed], 1 ) 
						SetSpritePositionByOffset( BoxYellowSprite[BoxYellowUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxYellowUsed
						inc BoxYellowUsed, 1

						if ( mod(MatchFlashTimer, flashDelay) = 0 )
							SetSpriteVisible ( BoxWhiteSprite[BoxWhiteUsed], 1 ) 
							SetSpritePositionByOffset( BoxWhiteSprite[BoxWhiteUsed], screenX, screenY-PlayfieldOffsetY )
							inc BoxWhiteUsed, 1
						endif
                    endcase
                    case 14:
						SetSpriteVisible ( BoxGreenSprite[BoxGreenUsed], 1 ) 
						SetSpritePositionByOffset( BoxGreenSprite[BoxGreenUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxGreenUsed
						inc BoxGreenUsed, 1

						if ( mod(MatchFlashTimer, flashDelay) = 0 )
							SetSpriteVisible ( BoxWhiteSprite[BoxWhiteUsed], 1 ) 
							SetSpritePositionByOffset( BoxWhiteSprite[BoxWhiteUsed], screenX, screenY-PlayfieldOffsetY )
							inc BoxWhiteUsed, 1
						endif
                    endcase
                    case 15:
						SetSpriteVisible ( BoxBlueSprite[BoxBlueUsed], 1 ) 
						SetSpritePositionByOffset( BoxBlueSprite[BoxBlueUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxBlueUsed
						inc BoxBlueUsed, 1

						if ( mod(MatchFlashTimer, flashDelay) = 0 )
							SetSpriteVisible ( BoxWhiteSprite[BoxWhiteUsed], 1 ) 
							SetSpritePositionByOffset( BoxWhiteSprite[BoxWhiteUsed], screenX, screenY-PlayfieldOffsetY )
							inc BoxWhiteUsed, 1
						endif
                    endcase
						case 16:
						SetSpriteVisible ( BoxPurpleSprite[BoxPurpleUsed], 1 ) 
						SetSpritePositionByOffset( BoxPurpleSprite[BoxPurpleUsed], screenX, screenY-PlayfieldOffsetY )
						PlayfieldColoredBoxIndex[indexX, indexY] = BoxPurpleUsed
						inc BoxPurpleUsed, 1

						if ( mod(MatchFlashTimer, flashDelay) = 0 )
							SetSpriteVisible ( BoxWhiteSprite[BoxWhiteUsed], 1 ) 
							SetSpritePositionByOffset( BoxWhiteSprite[BoxWhiteUsed], screenX, screenY-PlayfieldOffsetY )
							inc BoxWhiteUsed, 1
						endif
                    endcase
				endselect
			endif
				
			if (indexY = 12)
				SetSpritePositionByOffset( BoxBlackSprite[indexX], screenX, screenY-PlayfieldOffsetY )
			endif
						
			inc screenX, 45
		next indexX
		inc screenY, 45
		screenX = 67
	next indexY

	screenY = 83
	screenX = 67+22
	for indexY = 0 to 11
		for indexX = 0 to 5
			if (PlayerPlayfieldX = indexX and PlayerPlayfieldY = indexY)
				if (ShowCursor = TRUE) then SetSpritePositionByOffset( SelectorSprite, screenX, screenY-PlayfieldOffsetY )
				PlayerScreenX = screenX
				PlayerScreenY = screenY-PlayfieldOffsetY
			endif
			
			inc screenX, 45
		next indexX
		inc screenY, 45
		screenX = 67+22
	next indexY
endfunction

//------------------------------------------------------------------------------------------------------------

function ApplyGravity()
	indexY as integer
	indexX as integer
	indexTwoY as integer
	
	for indexY = 11 to 1 step -1
		for indexX = 0 to 5
			if (Playfield[indexX, indexY] = 0 and Playfield[indexX, indexY-1] > 0)
				for indexTwoY = indexY to 1 step -1
					Playfield[indexX, indexTwoY] = Playfield[indexX, indexTwoY-1]
				next indexTwoY

				Playfield[indexX, 0] = 0
			endif
		next indexX
	next indexY

	PiecesFell = TRUE
	for indexY = 11 to 1 step -1
		for indexX = 0 to 5
			if (Playfield[indexX, indexY] = 0 and Playfield[indexX, indexY-1] > 0)
				PiecesFell = FALSE
			endif
		next indexX
	next indexY

	if (PiecesFell = TRUE) then CheckForMatches (TRUE)
endfunction

//------------------------------------------------------------------------------------------------------------

function ResetMatches()
	indexY as integer
	indexX as integer
	for indexY = 0 to 11
		for indexX = 0 to 5
			if (Playfield[indexX, indexY] = 11)
				Playfield[indexX, indexY] = 1
			elseif (Playfield[indexX, indexY] = 12)
				Playfield[indexX, indexY] = 2
			elseif (Playfield[indexX, indexY] = 13)
				Playfield[indexX, indexY] = 3
			elseif (Playfield[indexX, indexY] = 14)
				Playfield[indexX, indexY] = 4
			elseif (Playfield[indexX, indexY] = 15)
				Playfield[indexX, indexY] = 5
			elseif (Playfield[indexX, indexY] = 16)
				Playfield[indexX, indexY] = 6
			endif
		next indexX
	next indexY
endfunction

//------------------------------------------------------------------------------------------------------------

function CheckForMatches(mark as integer)
	returnValue as integer
	returnValue = FALSE

	indexY as integer
	indexX as integer
	colorToCheck as integer
	consecutiveColors as integer
	startX as integer
	indexTwoX as integer
	startY as integer
	indexTwoY as integer
	thereIsMatch as integer
	thereIsMatch = FALSE
	
	ResetMatches ( )
	
	NumberOfPiecesCleared = 0
	NumberOfMatchesCleared = 0
	
	for indexY = 0 to 11
		startX = 0
		consecutiveColors = 0
		colorToCheck = Playfield[0, indexY]

		for indexX = 1 to 5
			if (colorToCheck = Playfield[indexX, indexY] and colorToCheck <> 0)
				inc consecutiveColors, 1
			endif
			
			if (Playfield[indexX, indexY] <> colorToCheck or indexX = 5)
				if (consecutiveColors > 1)
					thereIsMatch = TRUE

					inc NumberOfPiecesCleared, (1+consecutiveColors)
					inc NumberOfMatchesCleared, 1
					
					for indexTwoX = startX to (startX+consecutiveColors)
						if (Playfield[indexTwoX, indexY] = 1)
							Playfield[indexTwoX, indexY] = 11
						elseif (Playfield[indexTwoX, indexY] = 2)
							Playfield[indexTwoX, indexY] = 12
						elseif (Playfield[indexTwoX, indexY] = 3)
							Playfield[indexTwoX, indexY] = 13
						elseif (Playfield[indexTwoX, indexY] = 4)
							Playfield[indexTwoX, indexY] = 14
						elseif (Playfield[indexTwoX, indexY] = 5)
							Playfield[indexTwoX, indexY] = 15
						elseif (Playfield[indexTwoX, indexY] = 6)
							Playfield[indexTwoX, indexY] = 16
						endif
					next indexTwoX
				endif

				startX = indexX
				consecutiveColors = 0
				colorToCheck = Playfield[indexX, indexY]
			endif
		next indexX
	next indexY

	for indexX = 0 to 5
		startY = 0
		consecutiveColors = 0
		colorToCheck = Playfield[indexX, 0]
		if (colorToCheck > 10) then dec colorToCheck, 10

		for indexY = 1 to 11
			if ( (colorToCheck = Playfield[indexX, indexY] or (10+colorToCheck) = Playfield[indexX, indexY]) and colorToCheck <> 0)
				inc consecutiveColors, 1
			endif
			
			if (  ( Playfield[indexX, indexY] <> colorToCheck and Playfield[indexX, indexY] <> (10+colorToCheck) ) or indexY = 11  )
				if (consecutiveColors > 1)
					thereIsMatch = TRUE

					inc NumberOfPiecesCleared, (1+consecutiveColors)
					inc NumberOfMatchesCleared, 1

					for indexTwoY = startY to (startY+consecutiveColors)
						if (Playfield[indexX, indexTwoY] = 1 or Playfield[indexX, indexTwoY] = 11)
							Playfield[indexX, indexTwoY] = 11
						elseif (Playfield[indexX, indexTwoY] = 2 or Playfield[indexX, indexTwoY] = 12)
							Playfield[indexX, indexTwoY] = 12
						elseif (Playfield[indexX, indexTwoY] = 3 or Playfield[indexX, indexTwoY] = 13)
							Playfield[indexX, indexTwoY] = 13
						elseif (Playfield[indexX, indexTwoY] = 4 or Playfield[indexX, indexTwoY] = 14)
							Playfield[indexX, indexTwoY] = 14
						elseif (Playfield[indexX, indexTwoY] = 5 or Playfield[indexX, indexTwoY] = 15)
							Playfield[indexX, indexTwoY] = 15
						elseif (Playfield[indexX, indexTwoY] = 6 or Playfield[indexX, indexTwoY] = 16)
							Playfield[indexX, indexTwoY] = 16
						endif
					next indexTwoY
				endif

				startY = indexY
				consecutiveColors = 0
				colorToCheck = Playfield[indexX, indexY]
				if (colorToCheck > 10) then dec colorToCheck, 10
			endif
		next indexY
	next indexX
	if (mark = TRUE)
		StagingScore = 0
		speedMultiplier as integer
		if (PlayingSyncRate = 20)
			speedMultiplier = 1
		elseif (PlayingSyncRate = 30)
			speedMultiplier = 2
		elseif (PlayingSyncRate = 45)
			speedMultiplier = 3
		elseif (PlayingSyncRate = 60)
			speedMultiplier = 4
		endif
		StagingScore = (NumberOfPiecesCleared * NumberOfMatchesCleared * Level * 10 * speedMultiplier)
		
		StagingLevelAdvance = 0
		StagingLevelAdvance = NumberOfPiecesCleared
	endif
	
	if (thereIsMatch = TRUE)
		if (mark = TRUE)
			if (PerformancePercent < 1)
				MatchFlashTimer = 50
			else
				MatchFlashTimer = 50 / (PerformancePercent)
			endif
		endif
		returnValue = TRUE
	endif
endfunction returnValue

//------------------------------------------------------------------------------------------------------------

function ResetSwappingPieces()
	if (Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 1 or Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 11)
		SetSpriteScaleByOffset( BoxRedSprite[ 0 ], 1, 1 )
		SetSpriteDepth ( BoxRedSprite[ 0 ], 4 )
	elseif (Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 2 or Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 12)
		SetSpriteScaleByOffset( BoxOrangeSprite[ 0 ], 1, 1 )
		SetSpriteDepth ( BoxOrangeSprite[ 0 ], 4 )
	elseif (Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 3 or Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 13)
		SetSpriteScaleByOffset( BoxYellowSprite[ 0 ], 1, 1 )
		SetSpriteDepth ( BoxYellowSprite[ 0 ], 4 )
	elseif (Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 4 or Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 14)
		SetSpriteScaleByOffset( BoxGreenSprite[ 0 ], 1, 1 )
		SetSpriteDepth ( BoxGreenSprite[ 0 ], 4 )
	elseif (Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 5 or Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 15)
		SetSpriteScaleByOffset( BoxBlueSprite[ 0 ], 1, 1 )
		SetSpriteDepth ( BoxBlueSprite[ 0 ], 4 )
	elseif (Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 6 or Playfield[PlayerPlayfieldX, PlayerPlayfieldY] = 16)
		SetSpriteScaleByOffset( BoxPurpleSprite[ 0 ], 1, 1 )
		SetSpriteDepth ( BoxPurpleSprite[ 0 ], 4 )
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function MoveOffScreenSwappingPieces()
	SetSpritePositionByOffset( BoxRedSprite[ 0 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxYellowSprite[ 0 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxGreenSprite[ 0 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxBlueSprite[ 0 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], -9999, -9999 )

	SetSpritePositionByOffset( BoxRedSprite[ 1 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxOrangeSprite[ 1 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxYellowSprite[ 1 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxGreenSprite[ 1 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxBlueSprite[ 1 ], -9999, -9999 )
	SetSpritePositionByOffset( BoxPurpleSprite[ 1 ], -9999, -9999 )
endfunction

//------------------------------------------------------------------------------------------------------------

function ClearMatchesFromPlayfield()
	indexY as integer
	indexX as integer
	somethingCleared as integer
	somethingCleared = FALSE
	for indexY = 0 to 11
		for indexX = 0 to 5
			if (Playfield[indexX, indexY] > 10)
				Playfield[indexX, indexY] = 0
				somethingCleared = TRUE
			endif
		next indexX
	next indexY

	if (somethingCleared = TRUE)
		PlaySoundEffect(6)
		
		PiecesFell = FALSE
		
		AddScoreAndLevelAdvance ( )
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function AddScoreAndLevelAdvance()
	inc Score, StagingScore
	if (StagingScore > 0) then SetTextStringOutlined ( ScoreText, str(Score) )
	StagingScore = 0
	
	inc LevelAdvancePieceCounter, StagingLevelAdvance
	StagingLevelAdvance = 0
	
	if (MaximumFrameRate = 0 and LevelAdvancePieceCounter > LevelAdvancePieceCount[GameMode])
		inc Level, 1
		if (Level < 9 or GameMode = ChildNeverEndMode or GameMode = TeenNeverEndMode or GameMode = AdultNeverEndMode)
			SetTextStringOutlined ( LevelText, str(Level) )
		else
			SetTextStringOutlined ( LevelText, "Final Level!" )
		endif

		if (GameMode = ChildStoryMode or GameMode = TeenStoryMode or GameMode = AdultStoryMode)
			if (Level = 3)
				PlayNewMusic(4, 1)
			elseif (Level = 6)
				PlayNewMusic(5, 1)
			elseif (Level = 10)
				WonGame = TRUE
							
				StopMusicOGG(MusicTrack[CurrentlyPlayingMusicIndex])
							
				GameOverTimer = 1
				ScreenFadeStatus = FadingToBlack
			endif
		endif
		
		if ( (GameMode = ChildStoryMode or GameMode = TeenStoryMode or GameMode = AdultStoryMode) and Level > 10 )
			Level = 10
		endif
			
		if (Level < 10) then LevelSkip[GameMode] = Level
			
		LevelAdvancePieceCounter = 0
		PlaySoundEffect(9)
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function PlayfieldIsLow()
	indexX as integer
	returnValue as integer
	returnValue = TRUE
	
	for indexX = 0 to 5
		if (Playfield[indexX, 6] > 0) then returnValue = FALSE
	next indexX
	
	if (returnValue = TRUE)
		PlayfieldLow = TRUE
	else
		PlayfieldLow = FALSE
	endif	
endfunction returnValue

//------------------------------------------------------------------------------------------------------------

function ThereWillBeAnotherMatchAfterGravity()
	indexY as integer
	indexX as integer
	returnValue as integer
	returnValue = FALSE

	for indexY = 0 to 12
		for indexX = 0 to 5
			PlayfieldBackup[indexX, indexY] = Playfield[indexX, indexY]
		next indexX
	next indexY

	if ( CheckForMatches(2) = TRUE )
		for indexY = 0 to 11
			for indexX = 0 to 5
				if (Playfield[indexX, indexY] > 10)
					Playfield[indexX, indexY] = 0
				endif
			next indexX
		next indexY

		fell as integer
		fell = TRUE
		while (fell = TRUE)
			fell = FALSE
			indexTwoY as integer
			for indexY = 11 to 1 step -1
				for indexX = 0 to 5
					if (Playfield[indexX, indexY] = 0 and Playfield[indexX, indexY-1] > 0)
						for indexTwoY = indexY to 1 step -1
							Playfield[indexX, indexTwoY] = Playfield[indexX, indexTwoY-1]

							fell = TRUE
						next indexTwoY

						Playfield[indexX, 0] = 0
					endif
				next indexX
			next indexY
		endwhile

		if ( CheckForMatches(2) = TRUE ) then returnValue = TRUE
	endif

	for indexY = 0 to 12
		for indexX = 0 to 5
			Playfield[indexX, indexY] = PlayfieldBackup[indexX, indexY]
		next indexX
	next indexY
	
	if (returnValue = TRUE)
	elseif (returnValue = FALSE)
		NumberOfCombos = 0
	endif
endfunction returnValue

//------------------------------------------------------------------------------------------------------------

function RaisePlayfieldManually()
	indexY as integer
	indexX as integer

	if ( PlayfieldIsLow() = FALSE or MatchFlashTimer > -1 or ComboTakenCareOf = FALSE) then exitfunction

	ResetSwappingPieces ( )
	MoveOffScreenSwappingPieces ( )

	PlaySoundEffect(8)

	for indexY = 1 to 12
		for indexX = 0 to 5
			Playfield[indexX, indexY-1] = Playfield[indexX, indexY]
		next indexX
	next indexY

	for indexX = 0 to 5
		Playfield[indexX, 12] = Random( 1, 6 )
	next indexX
	
	inc Score, 10000 * (1+Level)
	SetTextStringOutlined ( ScoreText, str(Score) )
	
	CheckForMatches (TRUE)
	
	DelayAllUserInput = 10
endfunction

//------------------------------------------------------------------------------------------------------------

function RunGameplayCore()
	indexY as integer
	indexX as integer

	screenY as integer
	screenX as integer

	if (PiecesFell = FALSE) then ApplyGravity ( )

	if (MatchFlashTimer > 0)
		dec MatchFlashTimer, 1
	elseif (MatchFlashTimer = 0)
		ClearMatchesFromPlayfield ( )
		MatchFlashTimer = -1
	endif

	MoveOffScreenSwappingPieces ( )

	if (PiecesFell = TRUE)
		if (ComboTakenCareOf = TRUE)
			if ( ThereWillBeAnotherMatchAfterGravity() = TRUE )
				if (PerformancePercent < 1)
					MatchFlashTimer = 50
				else
					MatchFlashTimer = 50 / (PerformancePercent)
				endif
				ComboTakenCareOf = FALSE
			endif
		endif
	endif

	if (ComboTakenCareOf = FALSE and MatchFlashTimer = -1)
		ComboTakenCareOf = TRUE
		inc NumberOfCombos, 1
		PlaySoundEffect(7)
		inc TimeFreezeTimer, 150
		inc Score, (1000*NumberOfCombos)
		SetTextStringOutlined ( ScoreText, str(Score) )
	elseif (PiecesFell = TRUE and ComboTakenCareOf = TRUE)
		if ( PlayfieldIsLow() = TRUE and MatchFlashTimer = -1 )
			SetSpriteVisible( BonusSprite, 1 )
		else
			SetSpriteVisible( BonusSprite, 0 )
		endif

		if (TimeFreezeTimer > 0)
			dec TimeFreezeTimer, 1
		else
			TimeFreezeTimer = 0
			
			if (PlayfieldOffsetYDelay < PlayfieldOffsetYDelayTime[GameMode])
				inc PlayfieldOffsetYDelay, 1
			else
				PlayfieldOffsetYDelay = 0
				if (PlayfieldOffsetY < 44)
					inc PlayfieldOffsetY, 1 * (PerformancePercent)
					dec PlayerSwapPiecesScreenY, 1

					if (PlayerSwapPieceOneScreenX <> -1)
						select Playfield[PlayerPlayfieldX, PlayerPlayfieldY]
							case 1:
								SetSpritePositionByOffset( BoxRedSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 11:
								SetSpritePositionByOffset( BoxRedSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 2:
								SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 12:
								SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 3:
								SetSpritePositionByOffset( BoxYellowSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 13:
								SetSpritePositionByOffset( BoxYellowSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 4:
								SetSpritePositionByOffset( BoxGreenSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 14:
								SetSpritePositionByOffset( BoxGreenSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 5:
								SetSpritePositionByOffset( BoxBlueSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 15:
								SetSpritePositionByOffset( BoxBlueSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 6:
								SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
							case 16:
								SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], PlayerScreenX-22, PlayerScreenY )
							endcase
						endselect
					endif
										
					if (PlayfieldOffsetY > 22)	
						for indexX = 0 to 5
							if (Playfield[indexX, 0] > 0)
								if (MaximumFrameRate = 0)
									GameOverTimer = 100
								else
									topX as integer
									for topX = 0 to 5
										Playfield[indexX, 0] = 0
									next topX
								endif
								PlaySoundEffect(10)
							endif
						next indexX
					endif
				elseif (OnMobile = FALSE)
					if (PlayerSwapMovement = -1 and PlayerMovePlayfieldX = -1 and PlayerMovePlayfieldY = -1)
						for indexY = 1 to 12
							for indexX = 0 to 5
								Playfield[indexX, indexY-1] = Playfield[indexX, indexY]
							next indexX
						next indexY
						
						for indexX = 0 to 5
							Playfield[indexX, 12] = Random( 1, 6 )
						next indexX

						if (PlayerPlayfieldY > 0) then dec PlayerPlayfieldY, 1
						
						PlayfieldOffsetY = 0
						PiecesFell = FALSE
						CheckForMatches (TRUE)
					endif
				elseif (OnMobile = TRUE)
					DelayAllUserInput = 1

					for indexY = 1 to 12
						for indexX = 0 to 5
							Playfield[indexX, indexY-1] = Playfield[indexX, indexY]
						next indexX
					next indexY
					
					for indexX = 0 to 5
						Playfield[indexX, 12] = Random( 1, 6 )
					next indexX

					if (PlayerPlayfieldY > 0) then dec PlayerPlayfieldY, 1
					
					PlayfieldOffsetY = 0
					PiecesFell = FALSE
					CheckForMatches (TRUE)
				endif
			endif
		endif
//--[TOUCH Input]-------------------------------------------------------------------------------------------------------------------------------------
		if (OnMobile = TRUE)
			if (MouseButtonLeft = OFF and PlayerSwapDirection = 0)
				PlayerSwapPieceOneScreenX = -1

				ResetSwappingPieces ()

				MoveOffScreenSwappingPieces ()

			elseif (PlayerSwapPieceOneScreenX = -1 and PlayerSwapMovement = -1 and MouseButtonLeft = ON)
				screenY = 83
				screenX = 67
				for indexY = 0 to 11
					for indexX = 0 to 5
						if (  MouseScreenX > (screenX-22) and MouseScreenX < (screenX+22) and MouseScreenY > ( (screenY-22)-PlayfieldOffsetY ) and MouseScreenY < ( (screenY+22)-PlayfieldOffsetY )  )
							PlayerMovePlayfieldX = indexX
							PlayerMovePlayfieldY = indexY
							PlayerScreenX = screenX+22
							PlayerScreenY = screenY
						endif				
						inc screenX, 45
					next indexX
					inc screenY, 45
					screenX = 67
				next indexY
				
				if (PlayerMovePlayfieldX <> -1)
					PlayerPlayfieldX = PlayerMovePlayfieldX
				endif
				
				if (PlayerMovePlayfieldY <> -1)
					PlayerPlayfieldY = PlayerMovePlayfieldY
				endif
						
				select Playfield[PlayerPlayfieldX, PlayerPlayfieldY]
					case 1:
						SetSpriteScaleByOffset( BoxRedSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxRedSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxRedSprite[ 0 ], 3 )
					endcase
					case 11:
						SetSpriteScaleByOffset( BoxRedSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxRedSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxRedSprite[ 0 ], 3 )
					endcase
					case 2:
						SetSpriteScaleByOffset( BoxOrangeSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxOrangeSprite[ 0 ], 3 )
					endcase
					case 12:
						SetSpriteScaleByOffset( BoxOrangeSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxOrangeSprite[ 0 ], 3 )
					endcase
					case 3:
						SetSpriteScaleByOffset( BoxYellowSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxYellowSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxYellowSprite[ 0 ], 3 )
					endcase
					case 13:
						SetSpriteScaleByOffset( BoxYellowSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxYellowSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxYellowSprite[ 0 ], 3 )
					endcase
					case 4:
						SetSpriteScaleByOffset( BoxGreenSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxGreenSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxGreenSprite[ 0 ], 3 )
					endcase
					case 14:
						SetSpriteScaleByOffset( BoxGreenSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxGreenSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxGreenSprite[ 0 ], 3 )
					endcase
					case 5:
						SetSpriteScaleByOffset( BoxBlueSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxBlueSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxBlueSprite[ 0 ], 3 )
					endcase
					case 15:
						SetSpriteScaleByOffset( BoxBlueSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxBlueSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxBlueSprite[ 0 ], 3 )
					endcase
					case 6:
						SetSpriteScaleByOffset( BoxPurpleSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxPurpleSprite[ 0 ], 3 )
					endcase
					case 16:
						SetSpriteScaleByOffset( BoxPurpleSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], PlayerScreenX-22, PlayerScreenY-PlayfieldOffsetY )
						SetSpriteDepth ( BoxPurpleSprite[ 0 ], 3 )
					endcase
				endselect

				PlayerSwapPieceOneScreenX = MouseScreenX
			elseif (PlayerPlayfieldX = PlayerMovePlayfieldX and PlayerPlayfieldY = PlayerMovePlayfieldY and PlayerSwapMovement = -1 and MouseButtonLeft = ON)				
				select Playfield[PlayerPlayfieldX, PlayerPlayfieldY]
					case 1:
						SetSpriteScaleByOffset( BoxRedSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxRedSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxRedSprite[ 0 ], 3 )
					endcase
					case 11:
						SetSpriteScaleByOffset( BoxRedSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxRedSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxRedSprite[ 0 ], 3 )
					endcase
					case 2:
						SetSpriteScaleByOffset( BoxOrangeSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxOrangeSprite[ 0 ], 3 )
					endcase
					case 12:
						SetSpriteScaleByOffset( BoxOrangeSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxOrangeSprite[ 0 ], 3 )
					endcase
					case 3:
						SetSpriteScaleByOffset( BoxYellowSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxYellowSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxYellowSprite[ 0 ], 3 )
					endcase
					case 13:
						SetSpriteScaleByOffset( BoxYellowSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxYellowSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxYellowSprite[ 0 ], 3 )
					endcase
					case 4:
						SetSpriteScaleByOffset( BoxGreenSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxGreenSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxGreenSprite[ 0 ], 3 )
					endcase
					case 14:
						SetSpriteScaleByOffset( BoxGreenSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxGreenSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxGreenSprite[ 0 ], 3 )
					endcase
					case 5:
						SetSpriteScaleByOffset( BoxBlueSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxBlueSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxBlueSprite[ 0 ], 3 )
					endcase
					case 15:
						SetSpriteScaleByOffset( BoxBlueSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxBlueSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxBlueSprite[ 0 ], 3 )
					endcase
					case 6:
						SetSpriteScaleByOffset( BoxPurpleSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxPurpleSprite[ 0 ], 3 )
					endcase
					case 16:
						SetSpriteScaleByOffset( BoxPurpleSprite[ 0 ], 1.5, 1.5 )
						SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], MouseScreenX, PlayerScreenY )
						SetSpriteDepth ( BoxPurpleSprite[ 0 ], 3 )
					endcase
				endselect

				if ( MouseScreenX < (PlayerSwapPieceOneScreenX-22) )
					if (PlayerPlayfieldX > 0)
						PlaySoundEffect(5)

						ResetSwappingPieces ()

						PlayerSwapDirection = JoyLEFT

						PlayerSwapPieceOne = Playfield[PlayerPlayfieldX, PlayerPlayfieldY]
						PlayerSwapPieceTwo = Playfield[PlayerPlayfieldX-1, PlayerPlayfieldY]
						PlayerSwapPieceOneScreenX = PlayerScreenX-22
						PlayerSwapPieceTwoScreenX = PlayerScreenX-45-22
						PlayerSwapPiecesScreenY = PlayerScreenY
						PlayerSwapMovement = 0

						PlayerSwapOnePlayfieldX = PlayerPlayfieldX
						PlayerSwapOnePlayfieldY = PlayerPlayfieldY
						PlayerSwapTwoPlayfieldX = PlayerPlayfieldX-1
						PlayerSwapTwoPlayfieldY = PlayerPlayfieldY
					endif
				elseif ( MouseScreenX > (PlayerSwapPieceOneScreenX+22) )
					if (PlayerPlayfieldX < 5)
						PlaySoundEffect(5)

						ResetSwappingPieces ()

						PlayerSwapDirection = JoyRIGHT

						PlayerSwapPieceOne = Playfield[PlayerPlayfieldX, PlayerPlayfieldY]
						PlayerSwapPieceTwo = Playfield[PlayerPlayfieldX+1, PlayerPlayfieldY]
						PlayerSwapPieceOneScreenX = PlayerScreenX-22
						PlayerSwapPieceTwoScreenX = PlayerScreenX+45-22
						PlayerSwapPiecesScreenY = PlayerScreenY
						PlayerSwapMovement = 0

						PlayerSwapOnePlayfieldX = PlayerPlayfieldX
						PlayerSwapOnePlayfieldY = PlayerPlayfieldY
						PlayerSwapTwoPlayfieldX = PlayerPlayfieldX+1
						PlayerSwapTwoPlayfieldY = PlayerPlayfieldY
					endif
				endif
			endif
			
			if ( MouseButtonLeft = ON and MouseScreenX > (180-75) and MouseScreenX < (180+75) and MouseScreenY > (78-42) and MouseScreenY < (78+42) ) then RaisePlayfieldManually ( )
			
			if (PlayerSwapOnePlayfieldX <> -1 and PlayerSwapOnePlayfieldY <> -1)
				if (PlayerSwapMovement < 45)
					inc PlayerSwapMovement, (10*PerformancePercent)

					if (PlayerSwapDirection = JoyLEFT)						
						select PlayerSwapPieceOne
							case 1:
								SetSpritePositionByOffset( BoxRedSprite[ 0 ], PlayerSwapPieceOneScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 2:
								SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], PlayerSwapPieceOneScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 3:
								SetSpritePositionByOffset( BoxYellowSprite[ 0 ], PlayerSwapPieceOneScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 4:
								SetSpritePositionByOffset( BoxGreenSprite[ 0 ], PlayerSwapPieceOneScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 5:
								SetSpritePositionByOffset( BoxBlueSprite[ 0 ], PlayerSwapPieceOneScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 6:
								SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], PlayerSwapPieceOneScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
						endselect

						select PlayerSwapPieceTwo
							case 1:
								SetSpritePositionByOffset( BoxRedSprite[ 1 ], PlayerSwapPieceTwoScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 2:
								SetSpritePositionByOffset( BoxOrangeSprite[ 1 ], PlayerSwapPieceTwoScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 3:
								SetSpritePositionByOffset( BoxYellowSprite[ 1 ], PlayerSwapPieceTwoScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 4:
								SetSpritePositionByOffset( BoxGreenSprite[ 1 ], PlayerSwapPieceTwoScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 5:
								SetSpritePositionByOffset( BoxBlueSprite[ 1 ], PlayerSwapPieceTwoScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 6:
								SetSpritePositionByOffset( BoxPurpleSprite[ 1 ], PlayerSwapPieceTwoScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
						endselect
						
						if (PlayerSwapMovement > 44)
							PlayerSwapMovement = -1
							Playfield[PlayerSwapOnePlayfieldX, PlayerSwapOnePlayfieldY] = PlayerSwapPieceTwo
							Playfield[PlayerSwapOnePlayfieldX-1, PlayerSwapOnePlayfieldY] = PlayerSwapPieceOne
							PlayerSwapOnePlayfieldX = -1
							PlayerSwapOnePlayfieldY = -1
							PlayerSwapTwoPlayfieldX = -1
							PlayerSwapTwoPlayfieldY = -1
							PlayerSwapPieceOneScreenX = -1
							PlayerSwapDirection = 0

							PiecesFell = FALSE
							CheckForMatches (TRUE)
						endif
					elseif (PlayerSwapDirection = JoyRIGHT)
						select PlayerSwapPieceOne
							case 1:
								SetSpritePositionByOffset( BoxRedSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 2:
								SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 3:
								SetSpritePositionByOffset( BoxYellowSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 4:
								SetSpritePositionByOffset( BoxGreenSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 5:
								SetSpritePositionByOffset( BoxBlueSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 6:
								SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
						endselect

						select PlayerSwapPieceTwo
							case 1:
								SetSpritePositionByOffset( BoxRedSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 2:
								SetSpritePositionByOffset( BoxOrangeSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 3:
								SetSpritePositionByOffset( BoxYellowSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 4:
								SetSpritePositionByOffset( BoxGreenSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 5:
								SetSpritePositionByOffset( BoxBlueSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
							case 6:
								SetSpritePositionByOffset( BoxPurpleSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
							endcase
						endselect		
				
						if (PlayerSwapMovement > 44)
							PlayerSwapMovement = -1
							Playfield[PlayerSwapOnePlayfieldX, PlayerSwapOnePlayfieldY] = PlayerSwapPieceTwo
							Playfield[PlayerSwapOnePlayfieldX+1, PlayerSwapOnePlayfieldY] = PlayerSwapPieceOne
							PlayerSwapOnePlayfieldX = -1
							PlayerSwapOnePlayfieldY = -1
							PlayerSwapTwoPlayfieldX = -1
							PlayerSwapTwoPlayfieldY = -1
							PlayerSwapPieceOneScreenX = -1
							PlayerSwapDirection = 0

							PiecesFell = FALSE
							CheckForMatches (TRUE)
						endif
					endif
				endif
			endif
		elseif (OnMobile = FALSE)
//--[KEYBOARD/MOUSE Input]----------------------------------------------------------------------------------------------------------------------------
			if (PlayerMovementDelay = 0)
				moveDelay as integer
				
				if (roundedFPS > 55)
					moveDelay = 5
				elseif (roundedFPS > 40)
					moveDelay = 4
				elseif (roundedFPS > 29)
					moveDelay = 3
				elseif (roundedFPS < 26)
					moveDelay = 1
				elseif (roundedFPS < 21)
					moveDelay = 0
				endif
				
				if (JoystickDirection = JoyUP and PlayerPlayfieldY > 0)
					dec PlayerPlayfieldY, 1
					PlayerMovementDelay = moveDelay
					PlaySoundEffect(4)
				elseif (JoystickDirection = JoyDOWN and PlayerPlayfieldY < 11)
					inc PlayerPlayfieldY, 1
					PlayerMovementDelay = moveDelay
					PlaySoundEffect(4)
				elseif (JoystickDirection = JoyLEFT and PlayerPlayfieldX > 0)
					dec PlayerPlayfieldX, 1
					PlayerMovementDelay = moveDelay
					PlaySoundEffect(4)
				elseif (JoystickDirection = JoyRIGHT and PlayerPlayfieldX < 4)
					inc PlayerPlayfieldX, 1
					PlayerMovementDelay = moveDelay
					PlaySoundEffect(4)
				endif
			elseif (PlayerMovementDelay > 0)
				dec PlayerMovementDelay, 1
			endif	

			if (MouseButtonLeft = ON)
				if (PlayerMovePlayfieldX = -1 and PlayerMovePlayfieldY = -1)
					screenY = 83
					screenX = 67
					for indexY = 0 to 11
						for indexX = 0 to 4
							if (  MouseScreenX > (screenX-22) and MouseScreenX < (screenX+22) and MouseScreenY > ( (screenY-22)-PlayfieldOffsetY ) and MouseScreenY < ( (screenY+22)-PlayfieldOffsetY )  )
								PlayerMovePlayfieldX = indexX
								PlayerMovePlayfieldY = indexY
							endif				
							inc screenX, 45
						next indexX
						inc screenY, 45
						screenX = 67
					next indexY
				endif
			endif

			if (MouseButtonRight = ON) then RaisePlayfieldManually ( )

			if (PlayerPlayfieldX = PlayerMovePlayfieldX and PlayerPlayfieldY = PlayerMovePlayfieldY and PlayerSwapMovement = -1 and MouseButtonLeft = ON)
				PlaySoundEffect(5)

				PlayerSwapPieceOne = Playfield[PlayerPlayfieldX, PlayerPlayfieldY]
				PlayerSwapPieceTwo = Playfield[PlayerPlayfieldX+1, PlayerPlayfieldY]
				PlayerSwapPieceOneScreenX = PlayerScreenX-22
				PlayerSwapPieceTwoScreenX = PlayerScreenX+45-22
				PlayerSwapPiecesScreenY = PlayerScreenY
				PlayerSwapMovement = 0

				PlayerSwapOnePlayfieldX = PlayerPlayfieldX
				PlayerSwapOnePlayfieldY = PlayerPlayfieldY
				PlayerSwapTwoPlayfieldX = PlayerPlayfieldX+1
				PlayerSwapTwoPlayfieldY = PlayerPlayfieldY
			elseif (PlayerPlayfieldX = PlayerMovePlayfieldX and PlayerPlayfieldY = PlayerMovePlayfieldY)
				PlayerMovePlayfieldX = -1
				PlayerMovePlayfieldY = -1
			endif
			
			if (JoystickButtonOne = ON and PlayerSwapOnePlayfieldX = -1 and PlayerSwapOnePlayfieldY = -1)
				PlaySoundEffect(5)

				PlayerSwapPieceOne = Playfield[PlayerPlayfieldX, PlayerPlayfieldY]
				PlayerSwapPieceTwo = Playfield[PlayerPlayfieldX+1, PlayerPlayfieldY]
				PlayerSwapPieceOneScreenX = PlayerScreenX-22
				PlayerSwapPieceTwoScreenX = PlayerScreenX+45-22
				PlayerSwapPiecesScreenY = PlayerScreenY
				PlayerSwapMovement = 0

				PlayerSwapOnePlayfieldX = PlayerPlayfieldX
				PlayerSwapOnePlayfieldY = PlayerPlayfieldY
				PlayerSwapTwoPlayfieldX = PlayerPlayfieldX+1
				PlayerSwapTwoPlayfieldY = PlayerPlayfieldY
			endif

			if (JoystickButtonTwo = ON) then RaisePlayfieldManually ( )

			if (PlayerSwapOnePlayfieldX <> -1 and PlayerSwapOnePlayfieldY <> -1)
				if (PlayerSwapMovement < 45)
					inc PlayerSwapMovement, (10*PerformancePercent)

					select PlayerSwapPieceOne
						case 1:
							SetSpritePositionByOffset( BoxRedSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 2:
							SetSpritePositionByOffset( BoxOrangeSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 3:
							SetSpritePositionByOffset( BoxYellowSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 4:
							SetSpritePositionByOffset( BoxGreenSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 5:
							SetSpritePositionByOffset( BoxBlueSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 6:
							SetSpritePositionByOffset( BoxPurpleSprite[ 0 ], PlayerSwapPieceOneScreenX+PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
					endselect

					select PlayerSwapPieceTwo
						case 1:
							SetSpritePositionByOffset( BoxRedSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 2:
							SetSpritePositionByOffset( BoxOrangeSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 3:
							SetSpritePositionByOffset( BoxYellowSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 4:
							SetSpritePositionByOffset( BoxGreenSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 5:
							SetSpritePositionByOffset( BoxBlueSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
						case 6:
							SetSpritePositionByOffset( BoxPurpleSprite[ 1 ], PlayerSwapPieceTwoScreenX-PlayerSwapMovement, PlayerSwapPiecesScreenY )
						endcase
					endselect

					if (PlayerSwapMovement > 45)
						PlayerSwapMovement = -1
						Playfield[PlayerSwapOnePlayfieldX, PlayerSwapOnePlayfieldY] = PlayerSwapPieceTwo
						Playfield[PlayerSwapOnePlayfieldX+1, PlayerSwapOnePlayfieldY] = PlayerSwapPieceOne
						PlayerSwapOnePlayfieldX = -1
						PlayerSwapOnePlayfieldY = -1
						PlayerSwapTwoPlayfieldX = -1
						PlayerSwapTwoPlayfieldY = -1

						MoveOffScreenSwappingPieces ( )
						
						PiecesFell = FALSE
						CheckForMatches (TRUE)
					endif
				endif
			endif
			
			if (PlayerMovePlayfieldX <> -1)
				if (PlayerPlayfieldX < PlayerMovePlayfieldX)
					inc PlayerPlayfieldX, 1
					PlaySoundEffect(4)
				elseif (PlayerPlayfieldX > PlayerMovePlayfieldX)
					dec PlayerPlayfieldX, 1
					PlaySoundEffect(4)
				endif
			endif
			
			if (PlayerMovePlayfieldY <> -1)
				if (PlayerPlayfieldY < PlayerMovePlayfieldY)
					inc PlayerPlayfieldY, 1
					PlaySoundEffect(4)
				elseif (PlayerPlayfieldY > PlayerMovePlayfieldY)
					dec PlayerPlayfieldY, 1
					PlaySoundEffect(4)
				endif
			endif
		endif
	endif
endfunction
