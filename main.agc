// "main.agc"...

remstart
---------------------------------------------------------------------------------------------------
                                                              TM
                                AppGameKit "NightRider" Engine
             _________                             _________                       
            /   _____/__________    ____  ____    /   _____/_  _  _______  ______TM
            \_____  \\____ \__  \ _/ ___\/ __ \   \_____  \\ \/ \/ /\__  \ \____ \ 
            /        \  |_> > __ \\  \__\  ___/   /        \\     /  / __ \|  |_> >
           /_______  /   __(____  /\___  >___  > /_______  / \/\_/  (____  /   __/ 
                   \/|__|       \/     \/    \/          \/              \/|__|    

                                     Retail1 110% v1.1.4
                                        
---------------------------------------------------------------------------------------------------     

          Google Android SmartPhones/Tablets & HTML5 Desktop/Notebook Internet Browsers

---------------------------------------------------------------------------------------------------                       

                     (C)opyright 2019, By Team "www.FallenAngelSoftware.com"

---------------------------------------------------------------------------------------------------
remend

#include "audio.agc"
#include "data.agc"
#include "input.agc"
#include "interface.agc"
#include "logic.agc"
#include "screens.agc"
#include "visuals.agc"

global GameVersion as string
GameVersion = "''Retail1 110% - Turbo! - v1.1.4''"
global DataVersion as string
DataVersion = "SS110-Retail1-110-Turbo-v1_1_4.cfg"

#option_explicit
SetErrorMode(2)

global ScreenWidth = 360
global ScreenHeight = 640
global ExitGame as integer
ExitGame = 0

SetWindowTitle( "Space Swap 110%[TM]" )
SetWindowSize( ScreenWidth, ScreenHeight, 0 )
SetWindowAllowResize( 1 )

SetScreenResolution( ScreenWidth, ScreenHeight ) 
SetVirtualResolution( ScreenWidth, ScreenHeight )
SetOrientationAllowed( 1, 0, 0, 0 )

#constant FALSE		0
#constant TRUE		1

global DEBUG = FALSE

#constant Web		0
#constant Android	1
#constant iOS		2
#constant Windows	3
#constant Linux		4
global Platform as integer

global OnMobile as integer
global ShowCursor as integer
if ( GetDeviceBaseName() = "android" or GetDeviceBaseName() = "ios" )
	if ( GetDeviceBaseName() = "android" )
		Platform = Android
	elseif ( GetDeviceBaseName() = "ios" )
		Platform = iOS
	endif

	SetSyncRate( 30, 0 )
	SetScissor( 0,0,0,0 )
	OnMobile = TRUE
	ShowCursor = FALSE
else
	Platform = Web
	SetSyncRate( 30, 1 )
//	SetVSync( 1 ) 
	SetScissor( 0, 1, ScreenWidth, ScreenHeight )
	OnMobile = FALSE
	ShowCursor = TRUE
endif

if (GetDeviceBaseName() = "windows")
	Platform = Windows
	SetSyncRate( 30, 1 )
elseif (GetDeviceBaseName() = "linux")
	Platform = Linux
	SetSyncRate( 30, 0 ) rem 30, 1 )
endif

global GameUnlocked as integer
GameUnlocked = 2

global LoadPercent as float
global LoadPercentFixed as integer

// Uncomment below three lines to test Android version on desktop																			
// Platform = Android
// OnMobile = TRUE
// ShowCursor = FALSE

global PlayingSyncRate as integer
PlayingSyncRate = 30

SetClearColor( 0, 0, 0 ) 
ClearScreen()

global FingerPlayfieldX as integer
global FingerPlayfieldY as integer

global GameIsPlaying as integer
GameIsPlaying = FALSE

global GameOverTimer as integer

global GameOverSprite as integer

global PlayfieldIsDirty as integer

global WonGame as integer
WonGame = FALSE

global MouseScreenX = 0
global MouseScreenY = 0
#constant OFF						0
#constant ON						1
global MouseButtonLeft = OFF
global MouseButtonLeftJustClicked as integer
global MouseButtonLeftReleased as integer
MouseButtonLeftReleased = TRUE
global MouseButtonRight = OFF
global MouseButtonRightJustClicked as integer
global MouseButtonRightReleased as integer
MouseButtonRightReleased = TRUE

global ShiftKeyPressed as integer
ShiftKeyPressed = FALSE

#constant JoyCENTER			0
#constant JoyUP				1
#constant JoyRIGHT			2
#constant JoyDOWN     		3
#constant JoyLEFT			4
global JoystickDirection as integer
JoystickDirection = JoyCENTER

global JoystickButtonOne as integer
JoystickButtonOne = OFF
global JoyButtonOneReleased as integer
JoyButtonOneReleased = TRUE
global JoystickButtonTwo as integer
JoystickButtonTwo = OFF
global JoyButtonTwoReleased as integer
JoyButtonTwoReleased = TRUE

global KeyboardControls as integer

global LastKeyboardChar = -1

global DelayAllUserInput as integer
DelayAllUserInput = 0

#constant FadingIdle				-1
#constant FadingFromBlack			0
#constant FadingToBlack				1
global ScreenFadeStatus as integer
ScreenFadeStatus = FadingFromBlack
global ScreenFadeTransparency as integer
ScreenFadeTransparency = 255

global BlackBG as integer
global FadingBlackBG as integer
LoadImage ( 1, "\media\images\backgrounds\FadingBlackBG.png" )
FadingBlackBG = CreateSprite ( 1 )
SetSpriteDepth ( FadingBlackBG, 1 )
SetSpriteOffset( FadingBlackBG, (GetSpriteWidth(FadingBlackBG)/2) , (GetSpriteHeight(FadingBlackBG)/2) ) 
SetSpritePositionByOffset( FadingBlackBG, ScreenWidth/2, ScreenHeight/2 )
SetSpriteTransparency( FadingBlackBG, 1 )
global FadingToBlackCompleted as integer
FadingToBlackCompleted = FALSE

UseNewDefaultFonts( 1 )
LoadFont( 999, "\media\fonts\StardosStencil-Bold.ttf" )
global CurrentMinTextIndex = 1

global AppGameKitLogo as integer

global TitleBG as integer

global SixteenBitSoftLogo as integer

global SS110Logo as integer

global NewNameText as integer
global NewHighScoreCurrentName as String
NewHighScoreCurrentName = " "
global NewHighScoreNameIndex as integer
NewHighScoreNameIndex = 1

global PauseGame as integer
PauseGame = FALSE

#constant SteamOverlayScreen						0
#constant AppGameKitScreen							1
#constant SixteenBitSoftScreen						2
#constant TitleScreen								3
#constant OptionsScreen								4
#constant HowToPlayScreen							5
#constant HighScoresScreen							6
#constant AboutScreen								7
#constant IntroSceneScreen							8
#constant PlayingScreen								9
#constant EndingSceneScreen							10
#constant NewHighScoreNameInputScreen				11
#constant NewHighScoreNameInputAndroidScreen		12
#constant MusicPlayerScreen							13
global ScreenToDisplay = 3
global NextScreenToDisplay = 4
global ScreenDisplayTimer as integer

if (Platform <> Windows)
	ScreenToDisplay = 3
	NextScreenToDisplay = 4
endif
	
global MusicPlayerScreenIndex as integer
MusicPlayerScreenIndex = 0

global LeftArrow
LoadImage ( 100, "\media\images\gui\ButtonSelectorLeft.png" )
global RightArrow
LoadImage ( 101, "\media\images\gui\ButtonSelectorRight.png" )

LoadImage ( 103, "\media\images\gui\Button.png" )
global ButtonText as string[8]
ButtonText[0] = "START!"
ButtonText[1] = "Options"
ButtonText[2] = "How To Play"
ButtonText[3] = "High Scores"
ButtonText[4] = "About"
ButtonText[5] = "Exit"
ButtonText[6] = "Back"
ButtonText[7] = "Clear Scores"

global ButtonSprite as integer[8]
for index = 0 to 7
	ButtonSprite[index] = 680+index
next index

global ButtonIndex as integer[8]
global ButtonScreenX as integer[8]
global ButtonScreenY as integer[8]
global ButtonAnimationTimer as integer[8]
global ButtonScale as float[8]
global NumberOfButtonsOnScreen = 0
global ButtonSelectedByKeyboard = 0
index as integer
for index = 0 to 7
    ButtonIndex[index] = -1
    ButtonScreenX[index] = (ScreenWidth/2)
    ButtonScreenY[index] = (ScreenHeight/2)
    ButtonAnimationTimer[index] = 0
    ButtonScale[index] = 1
next index

LoadImage ( 120, "\media\images\gui\ButtonSelectorRight.png" )
LoadImage ( 121, "\media\images\gui\ButtonSelectorLeft.png" )
global LeftArrowSet as integer[10]
global RightArrowSet as integer[10]

LoadImage ( 122, "\media\images\gui\SelectorLine.png" )
global SelectorLine as integer

LoadImage ( 130, "\media\images\gui\NameInputButton.png" )

LoadImage ( 131, "\media\images\gui\NameInputChar.png" )
global NameInputCharSprite as integer
global NameInputCharSpriteChar as integer
global MouseButtonLeftWasReleased as integer

global NumberOfArrowSetsOnScreen as integer = 0
global ArrowSetSelectedByKeyboard as integer = 0
global ArrowSetScreenY as integer[10]
global ArrowSetLeftAnimationTimer as integer[10]
global ArrowSetRightAnimationTimer as integer[10]
global ArrowSetLeftScale as float[10]
global ArrowSetRightScale as float[10]
global ArrowSetTextStringIndex as integer[10]
for index = 0 to 9
    ArrowSetScreenY[index] = (ScreenHeight/2)
    ArrowSetLeftAnimationTimer[index] = 0
    ArrowSetRightAnimationTimer[index] = 0
    ArrowSetLeftScale[index] = 1
    ArrowSetRightScale[index] = 1
    ArrowSetTextStringIndex[index] = -1
next index

LoadImage ( 140, "\media\images\gui\ScreenLine.png" )
global ScreenLine as integer[10]

global Icon as integer[100]
LoadImage ( 300, "\media\images\gui\SpeakerOFF.png" )
LoadImage ( 301, "\media\images\gui\SpeakerON.png" )
LoadImage ( 302, "\media\images\logos\GooglePlayLogo.png" )
LoadImage ( 303, "\media\images\logos\ReviewGooglePlayLogo.png" )
LoadImage ( 304, "\media\images\gui\Exit.png" )
LoadImage ( 305, "\media\images\gui\Pause.png" )
LoadImage ( 306, "\media\images\gui\Play.png" )

global IconIndex as integer[100]
global IconSprite as integer[100]
global IconScreenX as integer[100]
global IconScreenY as integer[100]
global IconAnimationTimer as integer[100]
global IconScale as float[100]
global IconText as string[100]
global NumberOfIconsOnScreen as integer
NumberOfIconsOnScreen = 0
for index = 0 to 99
	IconIndex[index] = -1
    IconSprite[index] = -1
    IconScreenX[index] = (ScreenWidth/2)
    IconScreenY[index] = (ScreenHeight/2)
    IconAnimationTimer[index] = 0
    IconScale[index] = 1
    IconText[index] = " "
next index

LoadInterfaceSprites()
PreRenderButtonsWithTexts()

global CurrentlyPlayingMusicIndex = -1
#constant MusicTotal						11
global MusicTrack as integer[MusicTotal]
LoadAllMusic()

#constant EffectsTotal						12
global SoundEffect as integer[EffectsTotal]
LoadAllSoundEffects()

global MusicSoundtrack	as integer
MusicSoundtrack = 0

#constant ChildStoryMode				0
#constant TeenStoryMode					1
#constant AdultStoryMode				2
#constant ChildNeverEndMode				3
#constant TeenNeverEndMode				4
#constant AdultNeverEndMode				5
global GameMode = AdultStoryMode

global MusicVolume as integer
MusicVolume = 100
global EffectsVolume as integer
EffectsVolume = 100

global SecretCode as integer[4]
SecretCode[0] = 0
SecretCode[1] = 0
SecretCode[2] = 0
SecretCode[3] = 0
global SecretCodeCombined as integer
SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )
global HowToPlayLegend as integer
global HowToPlayFingerTouch as integer[4]

global PlayerLostALife as integer
PlayerLostALife = FALSE

global GameOver as integer
GameOver = 0

global PlayerRankOnGameOver as integer
PlayerRankOnGameOver = 999

mode as integer
global HighScoreName as string[5, 10]
global HighScoreLevel as integer[5, 10]
global HighScoreScore as integer[5, 10]

global LevelSkip as integer[5]
LevelSkip[0] = 1
LevelSkip[1] = 1
LevelSkip[2] = 1
LevelSkip[3] = 1
LevelSkip[4] = 1
LevelSkip[5] = 1
global StartingLevel as integer
StartingLevel = 1

ClearHighScores()

global AboutTexts as string[99999]
global AboutTextsScreenY as integer[99999]
global AboutTextsBlue as integer[99999]
global AboutTextVisable as integer[99999]
for index = 0 to 99998
	AboutTexts[index] = "Should Not See"
	AboutTextsScreenY[index] = 99999
	AboutTextsBlue[index] = 255
	AboutTextVisable[index] = 0
next index

global ATindex = 0

global NumberOfAboutScreenTexts
NumberOfAboutScreenTexts = ATindex
global StartIndexOfAboutScreenTexts
StartIndexOfAboutScreenTexts = 0

global AboutScreenTextFrameSkip as integer

LoadAboutScreenTexts()

global ChangingBackground as integer
ChangingBackground = FALSE
global GameSpeed as integer
GameSpeed = 30

global Score as integer
global ScoreText as integer
global Level as integer
global LevelText as integer
global LevelTextTwo as integer

global FreezeText as integer
global FreezeTextTwo as integer

global Playfield as integer[6, 13]
global PlayfieldBackup as integer[6, 13]

global PlayfieldColoredBoxIndex as integer[6, 13]
global BoxRedSprite as integer[82]
global BoxRedUsed as integer
global BoxOrangeSprite as integer[82]
global BoxOrangeUsed as integer
global BoxYellowSprite as integer[82]
global BoxYellowUsed as integer
global BoxGreenSprite as integer[82]
global BoxGreenUsed as integer
global BoxBlueSprite as integer[82]
global BoxBlueUsed as integer
global BoxPurpleSprite as integer[82]
global BoxPurpleUsed as integer

global SelectorSprite as integer
global PlayerScreenX as integer
global PlayerScreenY as integer
global PlayerPlayfieldX as integer
global PlayerPlayfieldY as integer

global PlayfieldOffsetY as integer
global PlayfieldOffsetYDelay as integer
global PlayfieldOffsetYDelayTime as integer[6]
PlayfieldOffsetYDelayTime[0] = 3
PlayfieldOffsetYDelayTime[1] = 1
PlayfieldOffsetYDelayTime[2] = 2
PlayfieldOffsetYDelayTime[3] = 3
PlayfieldOffsetYDelayTime[4] = 1
PlayfieldOffsetYDelayTime[5] = 2

global BoxBlackSprite as integer[6]

global BoxWhiteSprite as integer[82]
global BoxWhiteUsed as integer

global PlayerMovementDelay as integer

global PlayerMovePlayfieldX as integer
global PlayerMovePlayfieldY as integer

global PlayerSwapPieceOne as integer
global PlayerSwapPieceTwo as integer
global PlayerSwapPieceOneScreenX as integer
global PlayerSwapPieceTwoScreenX as integer
global PlayerSwapPiecesScreenY as integer
global PlayerSwapMovement as integer

global PlayerSwapOnePlayfieldX as integer
global PlayerSwapOnePlayfieldY as integer
global PlayerSwapTwoPlayfieldX as integer
global PlayerSwapTwoPlayfieldY as integer

global PlayerSwapDirection as integer

global PiecesFell as integer

global MatchFlashTimer as integer

global NumberOfPiecesCleared as integer
global NumberOfMatchesCleared as integer

global TimeFreezeTimer as integer

global NumberOfCombos as integer

global ComboTakenCareOf as integer

global LevelAdvancePieceCounter as integer
global LevelAdvancePieceCount as integer[6]
LevelAdvancePieceCount[0] = 30
LevelAdvancePieceCount[1] = 60
LevelAdvancePieceCount[2] = 45
LevelAdvancePieceCount[3] = 30
LevelAdvancePieceCount[4] = 60
LevelAdvancePieceCount[5] = 45

global StagingScore as integer
global StagingLevelAdvance as integer

global PlayfieldTopSprite as integer
global PlayfieldRightSprite as integer
global PlayfieldBottomSprite as integer
global PlayfieldLeftSprite as integer

global IntroEarthBGSprite as integer
global IntroEarthSprite as integer
global IntroShuttleSprite as integer
global IntroStarsSprite as integer[5]

global IntroAnimationStep as integer
global IntroEarthScale as float
global IntroShuttleScale as float
global IntroShuttleScreenX as integer
global IntroShuttleScreenY as integer
global IntroStarsScale as float[5]

global EndingEarthBGSprite as integer
global EndingEarthSprite as integer
global EndingShuttleSprite as integer
global EndingStarsSprite as integer[5]
global EndingAsteroidSprite as integer
global EndingExplosionSprite as integer

global EndingAnimationStep as integer
global EndingEarthScale as float
global EndingEarthScreenX as integer
global EndingEarthScreenY as integer
global EndingShuttleScale as float
global EndingShuttleScreenX as integer
global EndingShuttleScreenY as integer
global EndingStarsScale as float[5]
global EndingAsteroidScale as float
global EndingAsteroidScreenX as integer
global EndingAsteroidScreenY as integer
global EndingExplosionScale as float
global EndingExplosionAlpha as integer

global GamePausedBG as integer
global GamePaused as integer

global BonusSprite as integer
global PlayfieldLow as integer

global FrameCount as integer
FrameCount = 0
global SecondsSinceStart as integer
SecondsSinceStart = 0

global QuitPlaying as integer
QuitPlaying = FALSE

global GUIchanged as integer
GUIchanged = TRUE

global roundedFPS as integer

SetPrintColor ( 255, 255, 255 )
SetPrintSize(17)

global PrintColor as integer
PrintColor = 255
global PrintColorDir as integer
PrintColorDir = 0

global FPSChangeDelay as integer

global FramesPerSecond as integer
FramesPerSecond = 30

LoadOptionsAndHighScores()
SetVolumeOfAllMusicAndSoundEffects()

if (DEBUG = TRUE)
	SecretCode[0] = 2
	SecretCode[1] = 7
	SecretCode[2] = 7
	SecretCode[3] = 7
endif

SecretCodeCombined = ( (SecretCode[0]*1000) + (SecretCode[1]*100) + (SecretCode[2]*10) + (SecretCode[3]) )

global ScreenIsDirty as integer
ScreenIsDirty = TRUE

global LoadPercentText as integer

global GameQuit as integer

PlayNewMusic(0, 1)

do
	inc FrameCount, 1
		
	GetAllUserInput()
	
	select ScreenToDisplay
		case SteamOverlayScreen:
			DisplaySteamOverlayScreen()
		endcase

		case AppGameKitScreen:
			DisplayAppGameKitScreen()
		endcase

		case SixteenBitSoftScreen:
			DisplaySixteenBitSoftScreen()
		endcase

		case TitleScreen:
			DisplayTitleScreen()
		endcase

		case OptionsScreen:
			DisplayOptionsScreen()
		endcase

		case HowToPlayScreen:
			DisplayHowToPlayScreen()
		endcase

		case HighScoresScreen:
			DisplayHighScoresScreen()
		endcase

		case AboutScreen:
			DisplayAboutScreen()
		endcase

		case IntroSceneScreen:
			DisplayIntroSceneScreen()
		endcase

		case PlayingScreen:
			DisplayPlayingScreen()
		endcase

		case EndingSceneScreen:
			DisplayEndingSceneScreen()
		endcase

		case NewHighScoreNameInputScreen:
			DisplayNewHighScoreNameInputScreen()
		endcase

		case NewHighScoreNameInputAndroidScreen:
			DisplayNewHighScoreNameInputAndroidScreen()
		endcase

		case MusicPlayerScreen:
			DisplayMusicPlayerScreen()
		endcase
	endselect

	if (GUIchanged = TRUE or ScreenToDisplay = NewHighScoreNameInputAndroidScreen)
		if NumberOfButtonsOnScreen > 0 then DrawAllButtons()
		if NumberOfIconsOnScreen > 0 then DrawAllIcons()
	
		ScreenIsDirty = TRUE
		GUIchanged = FALSE
	endif

	if ScreenFadeStatus <> FadingIdle
		ScreenIsDirty = TRUE
		ApplyScreenFadeTransition()
	endif

	roundedFPS = Round( ScreenFPS() )

	if (FrameCount > roundedFPS)
		FrameCount = 0
		inc SecondsSinceStart, 1
	endif

	if (SecretCodeCombined = 2777 and ScreenIsDirty = TRUE)
		if (ScreenFadeStatus = FadingIdle)
			SetSpritePositionByOffset( FadingBlackBG,  -80, -200 )
			SetSpriteColorAlpha( FadingBlackBG, 200 )
		else
			SetSpritePositionByOffset( FadingBlackBG,  ScreenWidth/2, ScreenHeight/2 )
		endif

		if (PrintColorDir = 0)
			if (PrintColor > 0)
				dec PrintColor, 51
			else
				PrintColor = 0
				PrintColorDir = 1
			endif
		elseif (PrintColorDir = 1)
			if (PrintColor < 255)
				inc PrintColor, 51
			else
				PrintColor = 255
				PrintColorDir = 0
			endif
		endif
		
		SetPrintColor (PrintColor, PrintColor, PrintColor)
		Print ( "FPS="+str(roundedFPS) )
		print (  "Sprite(s): "+str( GetManagedSpriteCount() )  )
		print ( "Pieces="+str(NumberOfPiecesCleared) )
		print ( "Matches="+str(NumberOfMatchesCleared) )
		print ( "MTimer="+str(MatchFlashTimer) )
		print ( "#Combos="+str(NumberOfCombos) )
	endif

	if (ScreenIsDirty = TRUE)
		Sync()
		ScreenIsDirty = TRUE
	endif

	if ExitGame = 1
		exit
	endif
loop
rem                                      [TM]
rem "A 110% By Team Fallen Angel Software!"
