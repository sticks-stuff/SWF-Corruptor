Option Explicit

Dim objFSO, oFolder, counter, oFile, i, j, fi, fso, folder, file, ext, latest, objArgs
Set objArgs = Wscript.Arguments

createobject("wscript.shell").Run "java -jar ffdec.jar -format shape:png -export shape out " + chr(34) + objArgs(0) + chr(34), 1, true

Set objFSO = Createobject("Scripting.FileSystemObject")
Set oFolder = objFSO.GetFolder("out")

For Each oFile in oFolder.Files

Dim fs, f, f1, fc, s

Set fs = CreateObject("Scripting.FileSystemObject")

Set f = fs.GetFolder("out")

Randomize
i = CInt((Rnd() * f.Files.Count) + 1)
j = 1

For Each fi In f.Files

If j >= i Then
Dim randomFile
randomFile = CreateObject("Scripting.FileSystemObject").GetBaseName(fi)
Exit For
End If
j = j + 1
Next

Dim charName
charName = CreateObject("Scripting.FileSystemObject").GetBaseName(oFile)

Dim longCommand
longCommand = longCommand + charName + " out/" + randomFile + ".png "

Next 
Dim oShell
Set oShell = WScript.CreateObject ("WScript.Shell")

Set objFSO=CreateObject("Scripting.FileSystemObject")

Dim outFile, objFile

outFile="corrupt.bat"
Set objFile = objFSO.CreateTextFile(outFile,True)
objFile.Write "java -jar ffdec.jar -replace " + chr(34) + objArgs(0) + chr(34) + " " + chr(34) + objArgs(0) + "-corrupted.swf" + chr(34) + " " + longCommand & vbCrLf
objFile.Close

' oShell.run "cmd.exe /k java -jar ffdec.jar -replace " + chr(34) + objArgs(0) + chr(34) + ".swf" + " " + objArgs(0) + "-corrupted" + ".swf " + longCommand + " && cmd /k"
createobject("wscript.shell").Run "corrupt.bat", 1, true

' CLEAN UP
dim filesys
Set filesys = CreateObject("Scripting.FileSystemObject") 

filesys.DeleteFolder "out"
filesys.DeleteFile "corrupt.bat"  