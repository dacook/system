Attribute VB_Name = "NewMacros"
Sub Paste_Unformatted()
'
' Paste_Unformatted Macro
' dcook 2013-11-21
' Assign a keyboard shortcut like Command+Shift+V in Tools>Customize Keyboard... Macros
'
    Selection.PasteAndFormat (wdFormatPlainText)
End Sub
