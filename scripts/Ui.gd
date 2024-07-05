extends Node2D

const SAVE_PATH:= "res://savegame.dat"
var datas = {}

var vocalSession = 3
var instrumentGuitarSes = 2
var instrumentPianoSes = 2

var expValue: float = 0
var restValue: float = 0

var bottomText = ""
var bottomText2 = ""
var bottomText3 = ""

var activateV = false
var activateG = false
var ActivateP = false

var piano = 0
var guitar = 0
var vocal = 0
var music = 0

var passedGuitar = 0
var passedPiano = 0
var passedTitle = 0

func _physics_process(delta):
	if expValue > 100:
		expValue = 100
	elif restValue > 100:
		restValue = 100
	elif restValue < 0:
		restValue = 0
		
	if vocalSession <= 0:
		vocalSession = 0
	
	if instrumentGuitarSes <= 0:
		instrumentGuitarSes = 0
		
	if instrumentPianoSes <= 0:
		instrumentPianoSes = 0

	if vocalSession == 0:
		vocal = 1
	if instrumentGuitarSes == 0:
		guitar = 1
	if instrumentPianoSes == 0:
		piano = 1

func save_game():
	var file = File.new()
	if file.open(SAVE_PATH, File.WRITE) == OK:
		file.store_var(expValue)
		file.store_var(restValue)
		file.store_var(vocalSession)
		file.store_var(instrumentGuitarSes)
		file.store_var(instrumentPianoSes)
		file.store_var(activateV)
		file.store_var(activateG)
		file.store_var(ActivateP)
		file.store_var(piano)
		file.store_var(guitar)
		file.store_var(vocal)
		file.store_var(passedGuitar)
		file.store_var(passedPiano)
		file.store_var(passedTitle)
		file.close()
	
func load_game():
	var file = File.new()
	if file.open(SAVE_PATH, File.READ) == OK:
		expValue = file.get_var()
		restValue = file.get_var()
		vocalSession = file.get_var()
		instrumentGuitarSes = file.get_var()
		instrumentPianoSes = file.get_var()
		activateV = file.get_var()
		activateG = file.get_var()
		ActivateP = file.get_var()
		piano = file.get_var()
		guitar = file.get_var()
		vocal = file.get_var()
		passedGuitar = file.get_var()
		passedPiano = file.get_var()
		passedTitle = file.get_var()
		file.close()
		
