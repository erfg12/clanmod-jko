VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Clan Mod - Emote Bitvalue Calculator"
   ClientHeight    =   3600
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7050
   Icon            =   "emote_calc.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3600
   ScaleWidth      =   7050
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   1440
      Locked          =   -1  'True
      TabIndex        =   30
      Text            =   "Select the emotes you want to allow."
      Top             =   960
      Width           =   3855
   End
   Begin VB.CheckBox Check22 
      BackColor       =   &H00000000&
      Caption         =   "Shake"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   4320
      TabIndex        =   29
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CheckBox Check21 
      BackColor       =   &H00000000&
      Caption         =   "Nod"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   28
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CheckBox Check20 
      BackColor       =   &H00000000&
      Caption         =   "Dance2"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   27
      Top             =   2520
      Width           =   1095
   End
   Begin VB.CheckBox Check19 
      BackColor       =   &H00000000&
      Caption         =   "Dance"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   26
      Top             =   2280
      Width           =   1095
   End
   Begin VB.CheckBox Check18 
      BackColor       =   &H00000000&
      Caption         =   "Draw"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   25
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CheckBox Check17 
      BackColor       =   &H00000000&
      Caption         =   "ThumbsDown"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   24
      Top             =   1800
      Width           =   1335
   End
   Begin VB.CheckBox Check16 
      BackColor       =   &H00000000&
      Caption         =   "Shrug"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   23
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CheckBox Check15 
      BackColor       =   &H00000000&
      Caption         =   "Throw3"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   22
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CheckBox Check14 
      BackColor       =   &H00000000&
      Caption         =   "Throw2"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1440
      TabIndex        =   21
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CheckBox Check13 
      BackColor       =   &H00000000&
      Caption         =   "Throw"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1440
      TabIndex        =   20
      Top             =   2520
      Width           =   1095
   End
   Begin VB.CheckBox Check12 
      BackColor       =   &H00000000&
      Caption         =   "Lol"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1440
      TabIndex        =   19
      Top             =   2280
      Width           =   1095
   End
   Begin VB.CheckBox Check11 
      BackColor       =   &H00000000&
      Caption         =   "Power"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1440
      TabIndex        =   18
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CheckBox Check10 
      BackColor       =   &H00000000&
      Caption         =   "Dunno"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1440
      TabIndex        =   17
      Top             =   1800
      Width           =   1095
   End
   Begin VB.CheckBox Check9 
      BackColor       =   &H00000000&
      Caption         =   "Scratch"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1440
      TabIndex        =   16
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CheckBox Check8 
      BackColor       =   &H00000000&
      Caption         =   "Kiss"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1440
      TabIndex        =   15
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CheckBox Check7 
      BackColor       =   &H00000000&
      Caption         =   "Kneel"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CheckBox Check6 
      BackColor       =   &H00000000&
      Caption         =   "BreakDance"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   13
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CheckBox Check5 
      BackColor       =   &H00000000&
      Caption         =   "Bounce"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   2280
      Width           =   1095
   End
   Begin VB.CheckBox Check4 
      BackColor       =   &H00000000&
      Caption         =   "Cocky"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CheckBox Check3 
      BackColor       =   &H00000000&
      Caption         =   "Flip"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   1800
      Width           =   1095
   End
   Begin VB.CheckBox Check2 
      BackColor       =   &H00000000&
      Caption         =   "Beg"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   1560
      Width           =   1095
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000008&
      BorderStyle     =   0  'None
      Height          =   735
      Left            =   1320
      Picture         =   "emote_calc.frx":08CA
      ScaleHeight     =   735
      ScaleWidth      =   3375
      TabIndex        =   8
      Top             =   120
      Width           =   3375
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   4680
      Top             =   3720
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   120
      TabIndex        =   5
      Top             =   3240
      Width           =   6855
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00000000&
      Caption         =   "Sit"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   1320
      Width           =   1095
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   3
      Height          =   255
      Left            =   5880
      Top             =   2760
      Width           =   855
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackColor       =   &H00404040&
      Caption         =   "ALL"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   5880
      TabIndex        =   7
      Top             =   2760
      Width           =   855
   End
   Begin VB.Label Label5 
      Caption         =   " "
      Height          =   375
      Left            =   2400
      TabIndex        =   6
      Top             =   3720
      Width           =   255
   End
   Begin VB.Label Label4 
      Caption         =   """"
      Height          =   255
      Left            =   2760
      TabIndex        =   4
      Top             =   3720
      Width           =   255
   End
   Begin VB.Label Label3 
      Caption         =   "0"
      Height          =   255
      Left            =   3120
      TabIndex        =   3
      Top             =   3720
      Width           =   1455
   End
   Begin VB.Label Label2 
      Caption         =   "set cm_emoteControl "
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   3720
      Width           =   2175
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H000000FF&
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   3
      Height          =   255
      Left            =   4920
      Top             =   2760
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00404040&
      Caption         =   "Reset"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   4920
      TabIndex        =   1
      Top             =   2760
      Width           =   855
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   3
      X1              =   0
      X2              =   7080
      Y1              =   3120
      Y2              =   3120
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 1
Else
Label3.Caption = Label3 + 1
End If
End Sub

Private Sub Check10_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 512
Else
Label3.Caption = Label3 + 512
End If
End Sub

Private Sub Check11_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 1024
Else
Label3.Caption = Label3 + 1024
End If
End Sub

Private Sub Check12_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 2048
Else
Label3.Caption = Label3 + 2048
End If
End Sub

Private Sub Check13_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 4096
Else
Label3.Caption = Label3 + 4096
End If
End Sub

Private Sub Check14_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 8192
Else
Label3.Caption = Label3 + 8192
End If
End Sub

Private Sub Check15_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 16384
Else
Label3.Caption = Label3 + 16384
End If
End Sub

Private Sub Check16_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 32768
Else
Label3.Caption = Label3 + 32768
End If
End Sub

Private Sub Check17_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 65536
Else
Label3.Caption = Label3 + 65536
End If
End Sub

Private Sub Check18_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 131072
Else
Label3.Caption = Label3 + 131072
End If
End Sub

Private Sub Check19_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 262144
Else
Label3.Caption = Label3 + 262144
End If
End Sub

Private Sub Check2_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 2
Else
Label3.Caption = Label3 + 2
End If
End Sub

Private Sub Check20_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 524288
Else
Label3.Caption = Label3 + 524288
End If
End Sub

Private Sub Check21_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 1048576
Else
Label3.Caption = Label3 + 1048576
End If
End Sub

Private Sub Check22_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 2097152
Else
Label3.Caption = Label3 + 2097152
End If
End Sub

Private Sub Check3_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 4
Else
Label3.Caption = Label3 + 4
End If
End Sub

Private Sub Check4_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 8
Else
Label3.Caption = Label3 + 8
End If
End Sub

Private Sub Check5_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 16
Else
Label3.Caption = Label3 + 16
End If
End Sub

Private Sub Check6_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 32
Else
Label3.Caption = Label3 + 32
End If
End Sub

Private Sub Check7_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 64
Else
Label3.Caption = Label3 + 64
End If
End Sub

Private Sub Check8_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 128
Else
Label3.Caption = Label3 + 128
End If
End Sub

Private Sub Check9_Click()
If Check1.Value = 0 Then
Label3.Caption = Label3 - 256
Else
Label3.Caption = Label3 + 256
End If
End Sub

Private Sub Label1_Click()
Check1.Value = 0
Check2.Value = 0
Check3.Value = 0
Check4.Value = 0
Check5.Value = 0
Check6.Value = 0
Check7.Value = 0
Check8.Value = 0
Check9.Value = 0
Check10.Value = 0
Check11.Value = 0
Check12.Value = 0
Check13.Value = 0
Check14.Value = 0
Check15.Value = 0
Check16.Value = 0
Check17.Value = 0
Check18.Value = 0
Check19.Value = 0
Check20.Value = 0
Check21.Value = 0
Check22.Value = 0
Label3.Caption = "0"
End Sub

Private Sub Label6_Click()
Check1.Value = 1
Check2.Value = 1
Check3.Value = 1
Check4.Value = 1
Check5.Value = 1
Check6.Value = 1
Check7.Value = 1
Check8.Value = 1
Check9.Value = 1
Check10.Value = 1
Check11.Value = 1
Check12.Value = 1
Check13.Value = 1
Check14.Value = 1
Check15.Value = 1
Check16.Value = 1
Check17.Value = 1
Check18.Value = 1
Check19.Value = 1
Check20.Value = 1
Check21.Value = 1
Check22.Value = 1
End Sub

Private Sub text_Click()

End Sub

Private Sub Timer1_Timer()
Text1.text = Label2 & Label4 & Label3 & Label4
End Sub
