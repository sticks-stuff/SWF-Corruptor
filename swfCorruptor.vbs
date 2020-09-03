Option Explicit

Dim objFSO, oFolder, counter, oFile, i, j, fi, fso, folder, file, ext, latest, objArgs, fs, f, f1, fc, s, randomFile, charName, longCommand, oShell, outFile, objFile, filesys, nameAddition
Set objArgs = Wscript.Arguments

nameAddition = "-corrupted.swf"
If objArgs.count > 1 Then
If objArgs(1) = "--overwrite" Then
nameAddition = ""
End If
End If

createobject("wscript.shell").Run "java -jar ffdec.jar -format shape:png -export shape out " + chr(34) + objArgs(0) + chr(34), 1, true

Set objFSO = Createobject("Scripting.FileSystemObject")
Set oFolder = objFSO.GetFolder("out")

For Each oFile in oFolder.Files

Set fs = CreateObject("Scripting.FileSystemObject")

Set f = fs.GetFolder("out")

Randomize
i = CInt((Rnd() * f.Files.Count) + 1)
j = 1

For Each fi In f.Files

If j >= i Then
randomFile = CreateObject("Scripting.FileSystemObject").GetBaseName(fi)
Exit For
End If
j = j + 1
Next

charName = CreateObject("Scripting.FileSystemObject").GetBaseName(oFile)

longCommand = longCommand + charName + " out/" + randomFile + ".png "

Next 
Set oShell = WScript.CreateObject ("WScript.Shell")

Set objFSO=CreateObject("Scripting.FileSystemObject")

outFile="corrupt.bat"
Set objFile = objFSO.CreateTextFile(outFile,True)
objFile.Write "java -jar ffdec.jar -replace " + chr(34) + objArgs(0) + chr(34) + " " + chr(34) + objArgs(0) + nameAddition + chr(34) + " " + longCommand & vbCrLf
objFile.Close

' oShell.run "cmd.exe /k java -jar ffdec.jar -replace " + chr(34) + objArgs(0) + chr(34) + ".swf" + " " + objArgs(0) + "-corrupted" + ".swf " + longCommand + " && cmd /k"
createobject("wscript.shell").Run "corrupt.bat", 1, true

' CLEAN UP
Set filesys = CreateObject("Scripting.FileSystemObject") 

filesys.DeleteFolder "out"
filesys.DeleteFile "corrupt.bat"
