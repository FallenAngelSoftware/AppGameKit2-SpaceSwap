// "data.agc"...

function ClearHighScores( )
	mode as integer
	for mode = 0 to 5
		HighScoreName [ mode, 0 ] = "The Fallen Angel"
		HighScoreName [ mode, 1 ] = "John B."
		HighScoreName [ mode, 2 ] = "Denise T."
		HighScoreName [ mode, 3 ] = "Mike Q."
		HighScoreName [ mode, 4 ] = "Carl D."
		HighScoreName [ mode, 5 ] = "Daotheman"
		HighScoreName [ mode, 6 ] = "theweirdn8"
		HighScoreName [ mode, 7 ] = "mattmatteh"
		HighScoreName [ mode, 8 ] = "Oshi Bobo"
		HighScoreName [ mode, 9 ] = "AppGameKit v2"
		
		HighScoreLevel [ mode, 0 ] = 10
		HighScoreLevel [ mode, 1 ] = 9
		HighScoreLevel [ mode, 2 ] = 8
		HighScoreLevel [ mode, 3 ] = 7
		HighScoreLevel [ mode, 4 ] = 6
		HighScoreLevel [ mode, 5 ] = 5
		HighScoreLevel [ mode, 6 ] = 4
		HighScoreLevel [ mode, 7 ] = 3
		HighScoreLevel [ mode, 8 ] = 2
		HighScoreLevel [ mode, 9 ] = 1

		HighScoreScore [ mode, 0 ] = 10000
		HighScoreScore [ mode, 1 ] = 9000
		HighScoreScore [ mode, 2 ] = 8000
		HighScoreScore [ mode, 3 ] = 7000
		HighScoreScore [ mode, 4 ] = 6000
		HighScoreScore [ mode, 5 ] = 5000
		HighScoreScore [ mode, 6 ] = 4000
		HighScoreScore [ mode, 7 ] = 3000
		HighScoreScore [ mode, 8 ] = 2000
		HighScoreScore [ mode, 9 ] = 1000
	next mode
endfunction

//------------------------------------------------------------------------------------------------------------

function CheckPlayerForHighScore ( )
	PlayerRankOnGameOver = 999

	index as integer
	for index = 9 to 0 step -1
		if Score > HighScoreScore[GameMode, index] then PlayerRankOnGameOver = index
	next index

	if PlayerRankOnGameOver < 10
		if PlayerRankOnGameOver < 9
			for index = 9 to (PlayerRankOnGameOver) step -1
				if index > 0
					HighScoreName[GameMode, index] = HighScoreName[GameMode, index-1]
					HighScoreLevel[GameMode, index] = HighScoreLevel[GameMode, index-1]
					HighScoreScore[GameMode, index] = HighScoreScore[GameMode, index-1]
				endif
			next index
		endif

		HighScoreName[GameMode, PlayerRankOnGameOver] = ""
		HighScoreLevel[GameMode, PlayerRankOnGameOver] = Level
		HighScoreScore[GameMode, PlayerRankOnGameOver] = Score
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function LoadOptionsAndHighScores ( )
	if (Platform <> Web)
		index as integer
		if GetFileExists( DataVersion ) = 0
		else
			OpenToRead(1, DataVersion)
				MusicVolume = readInteger( 1 )
				EffectsVolume = readInteger( 1 )
				GameMode = readInteger( 1 )
				PlayingSyncRate = readInteger( 1 )
				
				for index = 0 to 5
					LevelSkip[index] = ReadInteger( 1 )
				next index

				for index = 0 to 3
					SecretCode[index] = readInteger( 1 )
				next index

				mode as integer
				rank as integer
				for mode = 0 to 5
					for rank = 0 to 9
						HighScoreName [ mode, rank ] = readString( 1 )
						HighScoreLevel [ mode, rank ] = ReadInteger( 1 )
						HighScoreScore [ mode, rank ] = ReadInteger( 1 )
					next rank
				next mode
			CloseFile ( 1 )
		endif
	else		
		currentToken as integer
		currentToken = 1
		maxTokens as integer
		cookieValue as string
		cookieValue = LoadSharedVariable(HTML5DataVersion+"Data", "No Value")
		if (cookieValue <> "No Value")
			maxTokens = CountStringTokens(cookieValue, "*")
			MusicVolume = Val(  GetStringToken( cookieValue, "*", (currentToken) )  )
			inc currentToken, 1
			EffectsVolume = Val(  GetStringToken( cookieValue, "*", (currentToken) )  )
			inc currentToken, 1
			GameMode = Val(  GetStringToken( cookieValue, "*", (currentToken) )  )
			inc currentToken, 1
			PlayingSyncRate = Val(  GetStringToken( cookieValue, "*", (currentToken) )  )
			inc currentToken, 1

			for index = 0 to 5
				LevelSkip[index]= Val(  GetStringToken( cookieValue, "*", (currentToken) )  )
				inc currentToken, 1
			next index

			for index = 0 to 3
				SecretCode[index]= Val(  GetStringToken( cookieValue, "*", (currentToken) )  )
				inc currentToken, 1
			next index

			agk_i as integer
			agk_i = currentToken
			for mode = 0 to 5
				for rank = 0 to 9
					HighScoreName [ mode, rank ] = GetStringToken( cookieValue, "*", (agk_i) )
					HighScoreLevel [ mode, rank ] = Val(  GetStringToken( cookieValue, "*", (agk_i+1) )  )
					HighScoreScore [ mode, rank ] = Val(  GetStringToken( cookieValue, "*", (agk_i+2) )  )
					inc agk_i, 3
				next rank
			next mode
		endif
	endif
endfunction

//------------------------------------------------------------------------------------------------------------

function SaveOptionsAndHighScores ( )
	if (Platform <> Web)
		index as integer
		OpenToWrite( 1 , DataVersion )
			WriteInteger ( 1, MusicVolume )
			WriteInteger ( 1, EffectsVolume )
			WriteInteger ( 1, GameMode )
			WriteInteger ( 1, PlayingSyncRate )
				
			for index = 0 to 5
				WriteInteger ( 1, LevelSkip[index] )
			next index

			for index = 0 to 3
				WriteInteger ( 1, SecretCode[index] )
			next index
	 
			mode as integer
			rank as integer
			for mode = 0 to 5
				for rank = 0 to 9
					WriteString ( 1, HighScoreName [ mode, rank ] )
					WriteInteger ( 1, HighScoreLevel [ mode, rank ] )
					WriteInteger ( 1, HighScoreScore [ mode, rank ] )
				next rank
			next mode
		CloseFile ( 1 )
	else
		optionsScoresString as String
		optionsScoresString = ""
		
		optionsScoresString = optionsScoresString+str(MusicVolume)
		optionsScoresString = optionsScoresString+'*'
		optionsScoresString = optionsScoresString+str(EffectsVolume)
		optionsScoresString = optionsScoresString+'*'
		optionsScoresString = optionsScoresString+str(GameMode)
		optionsScoresString = optionsScoresString+'*'
		optionsScoresString = optionsScoresString+str(PlayingSyncRate)
		optionsScoresString = optionsScoresString+'*'
		
		for index = 0 to 5
			optionsScoresString = optionsScoresString+str(LevelSkip[index])
			optionsScoresString = optionsScoresString+'*'
		next index

		for index = 0 to 3
			optionsScoresString = optionsScoresString+str(SecretCode[index])
			optionsScoresString = optionsScoresString+'*'
		next index
		
		for mode = 0 to 5
			for rank = 0 to 9
				optionsScoresString = optionsScoresString+HighScoreName[mode, rank]
				optionsScoresString = optionsScoresString+'*'
				optionsScoresString = optionsScoresString+str(HighScoreLevel[mode, rank])
				optionsScoresString = optionsScoresString+'*'
				optionsScoresString = optionsScoresString+str(HighScoreScore[mode, rank])
				if (mode < 5 or rank < 9) then optionsScoresString = optionsScoresString+'*'
			next rank
			
		next mode
		SaveSharedVariable( HTML5DataVersion+"Data", optionsScoresString )
	endif
endfunction
