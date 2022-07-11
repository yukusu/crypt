#Persistent
#SingleInstance, Force
#NoEnv
#UseHook
#InstallKeybdHook
#InstallMouseHook
#HotkeyInterval, 2000
#MaxHotkeysPerInterval, 200
Process, Priority,, Realtime
SendMode, Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2

vk1D & p::
    Pause
Return
vk1D & r::
    Reload
Return
vk1D & Esc::
ExitApp
Return

;クリプトがアクティブ時に有効
#IfWinActive ahk_exe cryptract.exe

    ;wave1からでないと開始されない。途中で始めた場合はwave1が表示されてからループ開始
vk1D & s::
    Loop, 
    {
        ;クエスト開始チェックのための左上の青い玉サーチ
        ImageSearch, , , 31, 58, 116, 126, *50 wave.bmp
        If (ErrorLevel = 0)
        {
            Loop, 
            {
                ;オートオフボタンのサーチ
                ;オートオフの場合、オートスキルに変更
                ImageSearch, aux, auy, 42, 1011, 174, 1123, *20 auto.bmp
                If (ErrorLevel = 0)
                {
                    Click, %aux%, %auy%
                    Loop, 
                    {
                        ;オートスキルボタンのサーチ
                        ImageSearch, asx, asy, 26, 864, 175, 998, *20 autosk.bmp
                        If (ErrorLevel = 0)
                        {
                            Click, %asx%, %asy%
                            break
                        }
                    }break
                }
                ;オートノーマルの場合、オートスキルに変更
                Else
                {
                    Loop, 
                    {
                        ;オートノーマルボタンのサーチ
                        ImageSearch, anx, any, 42, 1011, 174, 1123, *60 autono.bmp
                        If (ErrorLevel = 0)
                        {
                            Click, %anx%, %any%, 2
                            Loop, 
                            {
                                ;オートスキルボタンのサーチ
                                ImageSearch, asx, asy, 26, 864, 175, 998, *20 autosk.bmp
                                If (ErrorLevel = 0)
                                {
                                    Click, %asx%, %asy%
                                    break
                                }
                            }break
                        }
                        ;オートスキルの場合、何もせずに次の処理へ
                        Else
                        {
                            Loop, 
                            {
                                ;オートスキルボタンのサーチ
                                ImageSearch, , , 42, 1011, 174, 1123, *60 autosk.bmp
                                If (ErrorLevel = 0)
                                {
                                    break
                                }
                            }break
                        }
                    }break
                }
            }
            Sleep, 3500
            Loop, 
            {
                ;wave1の左上の敵のアイコンサーチ(火属性)
                ImageSearch, x1, y1, 1665, 1002, 1684, 1038, *10 hi.bmp
                If (ErrorLevel = 0)
                {
                    Click, %x1%, %y1%
                    loop,
                    {
                        ;wave2の左上の敵のアイコンサーチ(樹属性)
                        ImageSearch, x2, y2, 1665, 1002, 1684, 1038, *10 ki.bmp
                        If (ErrorLevel = 0)
                        {
                            Click, %x2%, %y2%
                            loop,
                            {
                                ;wave3の左上の敵のアイコンサーチ(闇属性)
                                ImageSearch, x3, y3, 1665, 1002, 1684, 1038, *10 yami.bmp
                                If (ErrorLevel = 0)
                                {
                                    Click, %x3%, %y3%
                                    loop,
                                    {
                                        ;QUEST CLEARのRの文字のサーチ
                                        ImageSearch, , , 1586, 451, 1606, 534, *40 clear.bmp
                                        If (ErrorLevel = 0)
                                        {
                                            Sleep, 3500
                                            Loop,
                                            {
                                                ;再戦するボタンのサーチ
                                                ImageSearch, sx, sy, 1385, 876, 1593, 944, *50 saisen.bmp
                                                If (ErrorLevel = 0)
                                                {
                                                    Click, %sx%, %sy%
                                                    Sleep, 500
                                                    Loop, 
                                                    {
                                                        ;回復するボタンのサーチ
                                                        ImageSearch, kx, ky, 645, 741, 981, 871, *30 kaifuku.bmp
                                                        If (ErrorLevel = 0)
                                                        {
                                                            Click, %kx%, %ky%
                                                            Sleep, 500
                                                            Loop, 
                                                            {
                                                                ;プラスボタンのサーチ
                                                                ImageSearch, px, py, 1223, 549, 1410, 647, plus.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    ;APがMAXになるまで長押し
                                                                    Click, %px%, %py%, D
                                                                    Loop, 
                                                                    {
                                                                        ImageSearch, , , 1223, 549, 1410, 647, *30 plusoff.bmp
                                                                        If (ErrorLevel = 0)
                                                                        {
                                                                            Click, %px%, %py%, U
                                                                            Loop, 
                                                                            {
                                                                                ImageSearch, yx, yy, 448, 829, 779, 968, yes.bmp
                                                                                If (ErrorLevel = 0)
                                                                                {
                                                                                    Click, %yx%, %yy%
                                                                                }
                                                                            }break
                                                                        }
                                                                    }break
                                                                }
                                                            }break
                                                        }
                                                        Else
                                                        {
                                                            break
                                                        }
                                                    }break
                                                }
                                                Else
                                                {
                                                    ;表示されるまで再戦ボタンの位置以外をクリックして口上カット
                                                    Sleep, 100
                                                    Click, 1000, 1000
                                                }
                                            }break
                                        }
                                    }break
                                }
                            }break
                        }
                    }
                }
            }
        }
    }
Return

1::
    Loop,
    {
        ;再戦するボタンのサーチ
        ImageSearch, sx, sy, 1385, 876, 1593, 944, *50 saisen.bmp
        If (ErrorLevel = 0)
        {
            Click, %sx%, %sy%
            Sleep, 500
            Loop, 
            {
                ;回復するボタンのサーチ
                ImageSearch, kx, ky, 645, 741, 981, 871, *30 kaifuku.bmp
                If (ErrorLevel = 0)
                {
                    Click, %kx%, %ky%
                    Sleep, 500
                    Loop, 
                    {
                        ;プラスボタンのサーチ
                        ImageSearch, px, py, 1223, 549, 1410, 647, plus.bmp
                        If (ErrorLevel = 0)
                        {
                            ;APがMAXになるまで長押し
                            Click, %px%, %py%, D
                            Loop, 
                            {
                                ImageSearch, , , 1223, 549, 1410, 647, *30 plusoff.bmp
                                If (ErrorLevel = 0)
                                {
                                    Click, %px%, %py%, U
                                    Loop, 
                                    {
                                        ImageSearch, yx, yy, 448, 829, 779, 968, yes.bmp
                                        If (ErrorLevel = 0)
                                        {
                                            Click, %yx%, %yy%
                                        }
                                    }break
                                }
                            }break
                        }
                    }break
                }
                Else
                {
                    break
                }
            }
        }
        ;Else
        ;{
        ;    Sleep, 100
        ;    Click, 1000, 1000
        ;}
    }
Return

2::
    Loop, 
    {
        ImageSearch, ox, oy, 842, 739, 1152, 854, ok.bmp
        If (ErrorLevel = 0)
        {
            Click, %ox%, %oy%
            break
        }
    }
Return
3::
    Loop, 
    {
        ImageSearch, Hx, Hy, 0, 0, 1977, 1141, *60 HOME.bmp
        If (ErrorLevel = 0)
        {
            Click, %Hx%, %Hy%
            Sleep, 15000
            Loop, 
            {
                ImageSearch, lox, loy, 1240, 775, 1575, 906, *60 ok.bmp
                If (ErrorLevel = 0)
                {
                    Click, %lox%, %loy%
                }
                Else
                {
                    Loop, 
                    {
                        ImageSearch, hbx, hby, 197, 1018, 363, 1155, *20 homeblack.bmp
                        If (ErrorLevel = 0)
                        {
                            Click, %hbx%, %hby%, D
                            break
                        }
                    }break
                }
            }break
        }
    }
Return
4::

Return
5::
    Loop, 
    {
        ImageSearch, hbx, hby, 197, 1018, 363, 1155, *20 homeblack.bmp
        If (ErrorLevel = 0)
        {
            Click, %hbx%, %hby%, D
            break
        }
    }
Return