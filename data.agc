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

			for index = 0 to 4
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
endfunction

//------------------------------------------------------------------------------------------------------------

function SaveOptionsAndHighScores ( )
	index as integer
	OpenToWrite( 1 , DataVersion )
		WriteInteger ( 1, MusicVolume )
		WriteInteger ( 1, EffectsVolume )
		WriteInteger ( 1, GameMode )
		WriteInteger ( 1, PlayingSyncRate )
  			
		for index = 0 to 5
			WriteInteger ( 1, LevelSkip[index] )
		next index

		for index = 0 to 4
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
endfunction
