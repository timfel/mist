support
compile: program andWriteTo: filename
	"Compile the given Fog program and write it to an ELF file with the given name.
	Answer the disassembly of the compiled program."

	| elfFile seg nativeCode |
	nativeCode := FogX64Compiler new compile: program.
	elfFile := ElfFile new.
	elfFile entryAddress: 16r00400000.	"default"
	seg := ElfSegment new.
	seg bytes: nativeCode.
	elfFile addSegment: seg.
	elfFile writeToFileNamed: filename.	"self halt."
	"^ X64Disassembler disassemble: nativeCode startAddress: 16r00400078"