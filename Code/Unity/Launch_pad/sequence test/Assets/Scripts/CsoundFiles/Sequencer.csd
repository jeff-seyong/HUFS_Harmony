<Cabbage>
form caption("Character Sounds"), size(300, 200)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -m0d
</CsOptions>
<CsInstruments>
sr 	= 	48000 
ksmps 	= 	32
nchnls 	= 	2
0dbfs	=	1 



instr SEQ
	kNotes[] fillarray 0, 0, 0, 0, 0, 0, 0, 0
	kBeat init 0 
	kTempo chnget "tempo"

	if metro(kTempo) == 1 then
		if kNotes[kBeat] == 1 then
			event "i", "SYNTH", 0, 5, kBeat
		endif
		chnset kBeat, "beat"
		kBeat = (kBeat<7 ? kBeat+1 : 0)
	endif

	kUpdateIndex chnget "updateTable"

	if changed(kUpdateIndex) == 1 then
		kNotes[kUpdateIndex] = kNotes[kUpdateIndex]==1 ? 0 : 1
	endif

endin

instr SYNTH	
	a1 expon .1, p3, 0.001
	aOut oscili a1, p4*100
	outs aOut, aOut
endin
 
</CsInstruments>
<CsScore>
i"SEQ" 0 [3600*12]
</CsScore>
</CsoundSynthesizer>