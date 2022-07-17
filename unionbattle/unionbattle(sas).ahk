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

;ユニバトサスーリカ用(祈りスタート祈りメイン)
Insert::
    ;無変換キーを押したままInsertキーを押すと参戦確認のはいボタンをクリックするところからスタート
    If (GetKeyState("vk1D", "P"))
    {
        ;参戦確認のはいボタンのサーチ
        ImageSearch, sx, sy, 727, 787, 917, 857, *100 start.bmp
        If (ErrorLevel = 0)
        {
            Click, %sx%, %sy%
            Loop, 
            {
                ;全祈りボタンのサーチ
                ImageSearch, apx, apy, 1513, 788, 1651, 861, *100 allprayer.bmp
                If (ErrorLevel = 0)
                {
                    Click, %apx%, %apy%, 0
                    Click, %apx%, %apy%
                    Sleep, 300
                    break
                }
            }
        }
        ;下のループ関数の呼び出し
        Prayer()
    }
    ;Insertキーだけを押すとホームボタン長押しからスタート
    Else
    {
        ;ループ関数の定義
        Prayer() {
            Loop, 
            {
                ;ホームボタンのサーチ
                ImageSearch, hx, hy, 231, 1049, 333, 1149, *100 home.bmp
                If (ErrorLevel = 0)
                {
                    ;ホームボタン1.2秒長押し後、幻獣級バナーへカーソル移動
                    Sleep, 200
                    Click, %hx%, %hy%, D
                    Sleep, 1200
                    Click, 1188, 285, 0
                    Loop, 
                    {
                        ;幻獣級バナーのサーチ
                        ImageSearch, gx, gy, 1158, 270, 1352, 331, *100 genju.bmp
                        If (ErrorLevel = 0)
                        {
                            Click, %gx%, %gy%
                            Loop, 
                            {
                                ;進軍するボタンのサーチ
                                ImageSearch, sx, sy, 1595, 890, 1813, 960, *100 shingun.bmp
                                If (ErrorLevel = 0)
                                {
                                    Click, %sx%, %sy%, 0
                                    Click, %sx%, %sy%
                                    Loop, 
                                    {
                                        ;クエスト開始チェックのための左上の青い玉サーチ
                                        ImageSearch, , , 48, 73, 100, 115, *100 wave.bmp
                                        If (ErrorLevel = 0)
                                        {
                                            Loop, 
                                            {
                                                ;オートオフボタンのサーチ
                                                ;オートオフの場合、オートスキルに変更
                                                ImageSearch, aux, auy, 42, 1011, 174, 1123, *100 auto.bmp
                                                If (ErrorLevel = 0)
                                                {
                                                    Click, %aux%, %auy%
                                                    Loop, 
                                                    {
                                                        ;オートスキルボタンのサーチ
                                                        ImageSearch, asx, asy, 26, 864, 175, 998, *100 autosk.bmp
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
                                                        ImageSearch, anx, any, 42, 1011, 174, 1123, *100 autono.bmp
                                                        If (ErrorLevel = 0)
                                                        {
                                                            Click, %anx%, %any%, 2
                                                            Loop, 
                                                            {
                                                                ;オートスキルボタンのサーチ
                                                                ImageSearch, asx, asy, 26, 864, 175, 998, *100 autosk.bmp
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
                                                                ImageSearch, , , 42, 1011, 174, 1123, *100 autosk.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    break
                                                                }
                                                            }break
                                                        }
                                                    }break
                                                }
                                            }
                                            ;3.5秒後に左上の敵のアイコンクリック
                                            Sleep, 3500
                                            Click, 1383, 1080
                                            Loop, 
                                            {
                                                ;サスーリカのアイコンサーチ
                                                ImageSearch, sax, say, 1816, 1001, 1959, 1140, *100 sas.bmp
                                                If (ErrorLevel = 0)
                                                {
                                                    ;アマリリスが通常攻撃した後にスキルオート解除
                                                    Sleep, 4800
                                                    Click, 106, 1064
                                                    Loop, 
                                                    {
                                                        ;通常攻撃アイコンのサーチ
                                                        ImageSearch, , , 1424, 968, 1632, 1157, *100 attack.bmp
                                                        If (ErrorLevel = 0)
                                                        {
                                                            ;アマリリスに傀儡
                                                            Click, 1704, 1066
                                                            Click, 430, 511
                                                            Sleep, 500
                                                            Loop, 
                                                            {
                                                                ;通常攻撃アイコンのサーチ
                                                                ImageSearch, , , 1424, 968, 1632, 1157, *100 attack.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    ;FS1をサスーリカに
                                                                    Sleep, 100
                                                                    Click, 1704, 1066
                                                                    Click, 1217, 512
                                                                    Loop, 
                                                                    {
                                                                        ;QUEST CLEARのRの文字のサーチ
                                                                        ImageSearch, , , 1586, 451, 1606, 534, *100 clear.bmp
                                                                        If (ErrorLevel = 0)
                                                                        {
                                                                            Sleep, 2000
                                                                            Loop,
                                                                            {
                                                                                ;OKボタンのサーチ
                                                                                ImageSearch, ox, oy, 878, 876, 1117, 946, *80 ok.bmp
                                                                                If (ErrorLevel = 0)
                                                                                {
                                                                                    Click, %ox%, %oy%, 0
                                                                                    Click, %ox%, %oy%
                                                                                    Loop, 
                                                                                    {
                                                                                        ;ユニオンボタンのサーチ
                                                                                        ImageSearch, qx, qy, 1431, 1048, 1527, 1140, *100 union.bmp
                                                                                        If (ErrorLevel = 0)
                                                                                        {
                                                                                            Click, %qx%, %qy%, 0
                                                                                            Click, %qx%, %qy%
                                                                                            Loop, 
                                                                                            {
                                                                                                ;自ユニオンのサーチ
                                                                                                ImageSearch, mx, my, 213, 808, 295, 866, *100 myunion.bmp
                                                                                                If (ErrorLevel = 0)
                                                                                                {
                                                                                                    Click, %mx%, %my%, 0
                                                                                                    Click, %mx%, %my%
                                                                                                    ;自ユニオンサーチ前にqを押し続けると全祈り→1エールしてループ継続(4100と5600)(500)
                                                                                                    If (GetKeyState("q", "P"))
                                                                                                    {
                                                                                                        Loop, 
                                                                                                        {
                                                                                                            ;全祈りボタンのサーチ
                                                                                                            ImageSearch, apx, apy, 1513, 788, 1651, 861, *100 allprayer.bmp
                                                                                                            If (ErrorLevel = 0)
                                                                                                            {
                                                                                                                Click, %apx%, %apy%, 0
                                                                                                                Click, %apx%, %apy%
                                                                                                                Sleep, 500
                                                                                                                Loop, 
                                                                                                                {
                                                                                                                    ;エールボタンのサーチ
                                                                                                                    ImageSearch, yx, yy, 359, 790, 545, 855, *100 yell.bmp
                                                                                                                    If (ErrorLevel = 0)
                                                                                                                    {
                                                                                                                        Sleep, 200
                                                                                                                        Click, %yx%, %yy%, 0
                                                                                                                        Click, %yx%, %yy%
                                                                                                                        Sleep, 300
                                                                                                                        break
                                                                                                                    }
                                                                                                                }break
                                                                                                            }
                                                                                                        }break
                                                                                                    }
                                                                                                    ;自ユニオンサーチ前にwを押し続けると1エール→全祈り→1エールしてループ継続(4600)(520)
                                                                                                    Else If (GetKeyState("w", "P"))
                                                                                                    {
                                                                                                        Loop, 
                                                                                                        {
                                                                                                            ;エールボタンのサーチ
                                                                                                            ImageSearch, yx, yy, 359, 790, 545, 855, *100 yell.bmp
                                                                                                            If (ErrorLevel = 0)
                                                                                                            {
                                                                                                                Click, %yx%, %yy%, 0
                                                                                                                Click, %yx%, %yy%
                                                                                                                Sleep, 500
                                                                                                                Loop, 
                                                                                                                {
                                                                                                                    ;全祈りボタンのサーチ
                                                                                                                    ImageSearch, apx, apy, 1513, 788, 1651, 861, *100 allprayer.bmp
                                                                                                                    If (ErrorLevel = 0)
                                                                                                                    {
                                                                                                                        Sleep, 200
                                                                                                                        Click, %apx%, %apy%, 0
                                                                                                                        Click, %apx%, %apy%
                                                                                                                        Sleep, 500
                                                                                                                        Loop, 
                                                                                                                        {
                                                                                                                            ;エールボタンのサーチ
                                                                                                                            ImageSearch, yx, yy, 359, 790, 545, 855, *100 yell.bmp
                                                                                                                            If (ErrorLevel = 0)
                                                                                                                            {
                                                                                                                                Sleep, 200
                                                                                                                                Click, %yx%, %yy%, 0
                                                                                                                                Click, %yx%, %yy%
                                                                                                                                Sleep, 300
                                                                                                                                break
                                                                                                                            }
                                                                                                                        }break
                                                                                                                    }
                                                                                                                }break
                                                                                                            }
                                                                                                        }break
                                                                                                    }
                                                                                                    ;自ユニオンサーチ前にeを押し続けると全祈りしてノマクエ(恐怖に設定中)
                                                                                                    Else If (GetKeyState("e", "P"))
                                                                                                    {
                                                                                                        Loop, 
                                                                                                        {
                                                                                                            ;全祈りボタンのサーチ
                                                                                                            ImageSearch, apx, apy, 1513, 788, 1651, 861, *100 allprayer.bmp
                                                                                                            If (ErrorLevel = 0)
                                                                                                            {
                                                                                                                Click, %apx%, %apy%, 0
                                                                                                                Click, %apx%, %apy%
                                                                                                                Sleep, 500
                                                                                                                Loop, 
                                                                                                                {
                                                                                                                    ;ホームボタンのサーチ
                                                                                                                    ImageSearch, hx, hy, 231, 1049, 333, 1149, *100 home.bmp
                                                                                                                    If (ErrorLevel = 0)
                                                                                                                    {
                                                                                                                        Sleep, 200
                                                                                                                        click, %hx%, %hy%, 0
                                                                                                                        Click, %hx%, %hy%
                                                                                                                        Loop, 
                                                                                                                        {
                                                                                                                            ;メインクエストボタンのサーチ
                                                                                                                            ImageSearch, max, may, 1732, 801, 1904, 950, *100 mainquest.bmp
                                                                                                                            If (ErrorLevel = 0)
                                                                                                                            {
                                                                                                                                Click, %max%, %may%
                                                                                                                                Loop, 
                                                                                                                                {
                                                                                                                                    ;該当クエストのサーチ
                                                                                                                                    ImageSearch, qx, qy, 1304, 618, 1726, 713, *100 quest.bmp
                                                                                                                                    If (ErrorLevel = 0)
                                                                                                                                    {
                                                                                                                                        Click, %qx%, %qy%
                                                                                                                                        Sleep, 200
                                                                                                                                        Loop, 
                                                                                                                                        {
                                                                                                                                            ;該当クエストのバナーのQuest部分のサーチ
                                                                                                                                            ImageSearch, q5x, q5y, 1066, 314, 1293, 388, *100 genju.bmp
                                                                                                                                            If (ErrorLevel = 0)
                                                                                                                                            {
                                                                                                                                                Click, %q5x%, %q5y%
                                                                                                                                                Loop, 
                                                                                                                                                {
                                                                                                                                                    ;編成の右矢印マークのサーチ
                                                                                                                                                    ImageSearch, chx, chy, 1718, 492, 1850, 715, *100 change.bmp
                                                                                                                                                    If (ErrorLevel = 0)
                                                                                                                                                    {
                                                                                                                                                        Click, %chx%, %chy%, 0
                                                                                                                                                        Click, %chx%, %chy%
                                                                                                                                                        Loop, 
                                                                                                                                                        {
                                                                                                                                                            ;進軍するボタンのサーチ
                                                                                                                                                            ImageSearch, sx, sy, 1577, 847, 1841, 948, *100 shingun.bmp
                                                                                                                                                            If (ErrorLevel = 0)
                                                                                                                                                            {
                                                                                                                                                                Click, %sx%, %sy%, 0
                                                                                                                                                                Click, %sx%, %sy%
                                                                                                                                                                Loop, 
                                                                                                                                                                {
                                                                                                                                                                    ;クエスト開始チェックのための左上の青い玉サーチ
                                                                                                                                                                    ImageSearch, , , 48, 73, 100, 115, *100 wave.bmp
                                                                                                                                                                    If (ErrorLevel = 0)
                                                                                                                                                                    {
                                                                                                                                                                        Loop, 
                                                                                                                                                                        {
                                                                                                                                                                            ;オートオフボタンのサーチ
                                                                                                                                                                            ;オートオフの場合、オートスキルに変更
                                                                                                                                                                            ImageSearch, aux, auy, 42, 1011, 174, 1123, *100 auto.bmp
                                                                                                                                                                            If (ErrorLevel = 0)
                                                                                                                                                                            {
                                                                                                                                                                                Click, %aux%, %auy%
                                                                                                                                                                                Loop, 
                                                                                                                                                                                {
                                                                                                                                                                                    ;オートスキルボタンのサーチ
                                                                                                                                                                                    ImageSearch, asx, asy, 26, 864, 175, 998, *100 autosk.bmp
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
                                                                                                                                                                                    ImageSearch, anx, any, 42, 1011, 174, 1123, *100 autono.bmp
                                                                                                                                                                                    If (ErrorLevel = 0)
                                                                                                                                                                                    {
                                                                                                                                                                                        Click, %anx%, %any%, 2
                                                                                                                                                                                        Loop, 
                                                                                                                                                                                        {
                                                                                                                                                                                            ;オートスキルボタンのサーチ
                                                                                                                                                                                            ImageSearch, asx, asy, 26, 864, 175, 998, *100 autosk.bmp
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
                                                                                                                                                                                            ImageSearch, , , 42, 1011, 174, 1123, *100 autosk.bmp
                                                                                                                                                                                            If (ErrorLevel = 0)
                                                                                                                                                                                            {
                                                                                                                                                                                                break
                                                                                                                                                                                            }
                                                                                                                                                                                        }break
                                                                                                                                                                                    }
                                                                                                                                                                                }break
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                        ;助っ人アイコンクリック
                                                                                                                                                                        Sleep, 100
                                                                                                                                                                        Click, 427, 1068
                                                                                                                                                                        Loop, 
                                                                                                                                                                        {
                                                                                                                                                                            ;QUEST CLEARのRの文字のサーチ
                                                                                                                                                                            ImageSearch, , , 1586, 451, 1606, 534, *100 clear.bmp
                                                                                                                                                                            If (ErrorLevel = 0)
                                                                                                                                                                            {
                                                                                                                                                                                Sleep, 3500
                                                                                                                                                                                Loop,
                                                                                                                                                                                {
                                                                                                                                                                                    ;OKボタンのサーチ
                                                                                                                                                                                    ImageSearch, ox, oy, 878, 876, 1117, 946, *80 ok.bmp
                                                                                                                                                                                    If (ErrorLevel = 0)
                                                                                                                                                                                    {
                                                                                                                                                                                        Click, %ox%, %oy%, 0
                                                                                                                                                                                        Click, %ox%, %oy%
                                                                                                                                                                                        Loop, 
                                                                                                                                                                                        {
                                                                                                                                                                                            ;ユニオンボタンのサーチ
                                                                                                                                                                                            ImageSearch, qx, qy, 1431, 1048, 1527, 1140, *100 union.bmp
                                                                                                                                                                                            If (ErrorLevel = 0)
                                                                                                                                                                                            {
                                                                                                                                                                                                Sleep, 1500
                                                                                                                                                                                                Click, %qx%, %qy%, 0
                                                                                                                                                                                                Click, %qx%, %qy%
                                                                                                                                                                                                Loop, 
                                                                                                                                                                                                {
                                                                                                                                                                                                    ;自ユニオンのサーチ
                                                                                                                                                                                                    ImageSearch, mx, my, 213, 808, 295, 866, *100 myunion.bmp
                                                                                                                                                                                                    If (ErrorLevel = 0)
                                                                                                                                                                                                    {
                                                                                                                                                                                                        Click, %mx%, %my%, 0
                                                                                                                                                                                                        Click, %mx%, %my%
                                                                                                                                                                                                        Loop, 
                                                                                                                                                                                                        {
                                                                                                                                                                                                            ;全祈りボタンのサーチ
                                                                                                                                                                                                            ImageSearch, apx, apy, 1513, 788, 1651, 861, *100 allprayer.bmp
                                                                                                                                                                                                            If (ErrorLevel = 0)
                                                                                                                                                                                                            {
                                                                                                                                                                                                                Click, %apx%, %apy%, 0
                                                                                                                                                                                                                Click, %apx%, %apy%
                                                                                                                                                                                                                Sleep, 500
                                                                                                                                                                                                                Loop, 
                                                                                                                                                                                                                {
                                                                                                                                                                                                                    ;エールボタンのサーチ
                                                                                                                                                                                                                    ImageSearch, yx, yy, 359, 790, 545, 855, *100 yell.bmp
                                                                                                                                                                                                                    If (ErrorLevel = 0)
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                        Sleep, 200
                                                                                                                                                                                                                        Click, %yx%, %yy%, 0
                                                                                                                                                                                                                        Click, %yx%, %yy%
                                                                                                                                                                                                                        Sleep, 300
                                                                                                                                                                                                                        break
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                }break
                                                                                                                                                                                                            }
                                                                                                                                                                                                        }break
                                                                                                                                                                                                    }
                                                                                                                                                                                                }break
                                                                                                                                                                                            }
                                                                                                                                                                                        }break
                                                                                                                                                                                    }
                                                                                                                                                                                    ;表示されるまでOKボタンの位置以外をクリックして口上カット
                                                                                                                                                                                    Else
                                                                                                                                                                                    {
                                                                                                                                                                                        Sleep, 100
                                                                                                                                                                                        Click, 1000, 1000
                                                                                                                                                                                    }
                                                                                                                                                                                }break
                                                                                                                                                                            }
                                                                                                                                                                        }break
                                                                                                                                                                    }
                                                                                                                                                                }break
                                                                                                                                                            }
                                                                                                                                                        }break
                                                                                                                                                    }
                                                                                                                                                    ;フレ選択がされていない場合の対策
                                                                                                                                                    Else
                                                                                                                                                    {
                                                                                                                                                        Sleep, 100
                                                                                                                                                        Click, %q5x%, %q5y%
                                                                                                                                                    }
                                                                                                                                                }break
                                                                                                                                            }
                                                                                                                                        }break
                                                                                                                                    }
                                                                                                                                    ;メインクエストボタンが押されなかった場合の対策
                                                                                                                                    Else
                                                                                                                                    {
                                                                                                                                        Sleep, 100
                                                                                                                                        Click, %max%, %may%
                                                                                                                                    }
                                                                                                                                }break
                                                                                                                            }
                                                                                                                        }break
                                                                                                                    }
                                                                                                                }break
                                                                                                            }
                                                                                                        }break
                                                                                                    }
                                                                                                    ;自ユニオンサーチ前にrを押し続けると全エールしてループ継続
                                                                                                    Else If (GetKeyState("r", "P"))
                                                                                                    {
                                                                                                        Loop, 
                                                                                                        {
                                                                                                            ;全エールボタンのサーチ
                                                                                                            ImageSearch, ayx, ayy, 667, 787, 836, 866, *100 allyell.bmp
                                                                                                            If (ErrorLevel = 0)
                                                                                                            {
                                                                                                                Click, %ayx%, %ayy%, 0
                                                                                                                Click, %ayx%, %ayy%
                                                                                                                Sleep, 300
                                                                                                                break
                                                                                                            }
                                                                                                        }break
                                                                                                    }
                                                                                                    ;自ユニオンサーチ前に何も押さないと全祈りしてループ継続(5100)(510)
                                                                                                    Else
                                                                                                    {
                                                                                                        Loop, 
                                                                                                        {
                                                                                                            ;全祈りボタンのサーチ
                                                                                                            ImageSearch, apx, apy, 1513, 788, 1651, 861, *100 allprayer.bmp
                                                                                                            If (ErrorLevel = 0)
                                                                                                            {
                                                                                                                Click, %apx%, %apy%, 0
                                                                                                                Click, %apx%, %apy%
                                                                                                                Sleep, 300
                                                                                                                break
                                                                                                            }
                                                                                                        }break
                                                                                                    }
                                                                                                }
                                                                                                ;クルクルにより画面遷移ができなかった場合の対策
                                                                                                Else
                                                                                                {
                                                                                                    Sleep, 10
                                                                                                    Click, %qx%, %qy%
                                                                                                }
                                                                                            }break
                                                                                        }
                                                                                    }break
                                                                                }
                                                                                ;表示されるまでOKボタンの位置以外をクリックして口上カット
                                                                                Else
                                                                                {
                                                                                    Sleep, 100
                                                                                    Click, 1000, 1000
                                                                                }
                                                                            }break
                                                                        }
                                                                    }break
                                                                }
                                                            }break
                                                        }
                                                    }break
                                                }
                                            }break
                                        }
                                    }break
                                }
                                ;フレ選択がされていない場合の対策
                                Else
                                {
                                    Sleep, 50
                                    Click, %gx%, %gy%
                                }
                            }break
                        }
                    }
                }
            }
        }
        ;ループ関数の呼び出し
        Prayer()
    }
Return

;ユニバトサスーリカ用(エールスタートエールメイン)
Home::
    ;無変換キーを押したままHomeキーを押すと参戦確認のはいボタンをクリックするところからスタート
    If (GetKeyState("vk1D", "P"))
    {
        ;参戦確認のはいボタンのサーチ
        ImageSearch, sx, sy, 727, 787, 917, 857, *100 start.bmp
        If (ErrorLevel = 0)
        {
            Click, %sx%, %sy%
            Loop, 
            {
                ;全エールボタンのサーチ
                ImageSearch, ayx, ayy, 667, 787, 836, 866, *100 allyell.bmp
                If (ErrorLevel = 0)
                {
                    Click, %ayx%, %ayy%, 0
                    Click, %ayx%, %ayy%
                    Sleep, 300
                    break
                }
            }
        }
        ;下のループ関数の呼び出し
        Yell()
    }
    Else
    {
        ;ループ関数の定義
        Yell() {
            Loop, 
            {
                ;ホームボタンのサーチ
                ImageSearch, hx, hy, 231, 1049, 333, 1149, *100 home.bmp
                If (ErrorLevel = 0)
                {
                    ;ホームボタン1.2秒長押し後、幻獣級バナーへカーソル移動
                    Sleep, 200
                    Click, %hx%, %hy%, D
                    Sleep, 1200
                    Click, 1188, 285, 0
                    Loop, 
                    {
                        ;幻獣級バナーのサーチ
                        ImageSearch, gx, gy, 1158, 270, 1352, 331, *100 genju.bmp
                        If (ErrorLevel = 0)
                        {
                            Click, %gx%, %gy%
                            Loop, 
                            {
                                ;進軍するボタンのサーチ
                                ImageSearch, sx, sy, 1595, 890, 1813, 960, *100 shingun.bmp
                                If (ErrorLevel = 0)
                                {
                                    Click, %sx%, %sy%, 0
                                    Click, %sx%, %sy%
                                    Loop, 
                                    {
                                        ;クエスト開始チェックのための左上の青い玉サーチ
                                        ImageSearch, , , 48, 73, 100, 115, *100 wave.bmp
                                        If (ErrorLevel = 0)
                                        {
                                            Loop, 
                                            {
                                                ;オートオフボタンのサーチ
                                                ;オートオフの場合、オートスキルに変更
                                                ImageSearch, aux, auy, 42, 1011, 174, 1123, *100 auto.bmp
                                                If (ErrorLevel = 0)
                                                {
                                                    Click, %aux%, %auy%
                                                    Loop, 
                                                    {
                                                        ;オートスキルボタンのサーチ
                                                        ImageSearch, asx, asy, 26, 864, 175, 998, *100 autosk.bmp
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
                                                        ImageSearch, anx, any, 42, 1011, 174, 1123, *100 autono.bmp
                                                        If (ErrorLevel = 0)
                                                        {
                                                            Click, %anx%, %any%, 2
                                                            Loop, 
                                                            {
                                                                ;オートスキルボタンのサーチ
                                                                ImageSearch, asx, asy, 26, 864, 175, 998, *100 autosk.bmp
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
                                                                ImageSearch, , , 42, 1011, 174, 1123, *100 autosk.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    break
                                                                }
                                                            }break
                                                        }
                                                    }break
                                                }
                                            }
                                            ;3.5秒後に左上の敵のアイコンクリック
                                            Sleep, 3500
                                            Click, 1383, 1080
                                            Loop, 
                                            {
                                                ;サスーリカのアイコンサーチ
                                                ImageSearch, sax, say, 1816, 1001, 1959, 1140, *100 sas.bmp
                                                If (ErrorLevel = 0)
                                                {
                                                    ;アマリリスが通常攻撃した後にスキルオート解除
                                                    Sleep, 4800
                                                    Click, 106, 1064
                                                    Loop, 
                                                    {
                                                        ;通常攻撃アイコンのサーチ
                                                        ImageSearch, , , 1424, 968, 1632, 1157, *100 attack.bmp
                                                        If (ErrorLevel = 0)
                                                        {
                                                            ;アマリリスに傀儡
                                                            Click, 1704, 1066
                                                            Click, 430, 511
                                                            Sleep, 500
                                                            Loop, 
                                                            {
                                                                ;通常攻撃アイコンのサーチ
                                                                ImageSearch, , , 1424, 968, 1632, 1157, *100 attack.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    ;FS1をサスーリカに
                                                                    Sleep, 100
                                                                    Click, 1704, 1066
                                                                    Click, 1217, 512
                                                                    Loop, 
                                                                    {
                                                                        ;QUEST CLEARのRの文字のサーチ
                                                                        ImageSearch, , , 1586, 451, 1606, 534, *100 clear.bmp
                                                                        If (ErrorLevel = 0)
                                                                        {
                                                                            Sleep, 2000
                                                                            Loop,
                                                                            {
                                                                                ;OKボタンのサーチ
                                                                                ImageSearch, ox, oy, 878, 876, 1117, 946, *80 ok.bmp
                                                                                If (ErrorLevel = 0)
                                                                                {
                                                                                    Click, %ox%, %oy%, 0
                                                                                    Click, %ox%, %oy%
                                                                                    Loop, 
                                                                                    {
                                                                                        ;ユニオンボタンのサーチ
                                                                                        ImageSearch, qx, qy, 1431, 1048, 1527, 1140, *100 union.bmp
                                                                                        If (ErrorLevel = 0)
                                                                                        {
                                                                                            Sleep, 400
                                                                                            Click, %qx%, %qy%, 0
                                                                                            Click, %qx%, %qy%
                                                                                            Loop, 
                                                                                            {
                                                                                                ;自ユニオンのサーチ
                                                                                                ImageSearch, mx, my, 213, 808, 295, 866, *100 myunion.bmp
                                                                                                If (ErrorLevel = 0)
                                                                                                {
                                                                                                    Click, %mx%, %my%, 0
                                                                                                    Click, %mx%, %my%
                                                                                                    Loop, 
                                                                                                    {
                                                                                                        ;全エールボタンのサーチ
                                                                                                        ImageSearch, ayx, ayy, 667, 787, 836, 866, *100 allyell.bmp
                                                                                                        If (ErrorLevel = 0)
                                                                                                        {
                                                                                                            Click, %ayx%, %ayy%, 0
                                                                                                            Click, %ayx%, %ayy%
                                                                                                            Sleep, 300
                                                                                                            break
                                                                                                        }
                                                                                                    }break
                                                                                                }
                                                                                                ;クルクルにより画面遷移ができなかった場合の対策
                                                                                                Else
                                                                                                {
                                                                                                    Sleep, 10
                                                                                                    Click, %qx%, %qy%
                                                                                                }
                                                                                            }break
                                                                                        }
                                                                                    }break
                                                                                }
                                                                                ;表示されるまでOKボタンの位置以外をクリックして口上カット
                                                                                Else
                                                                                {
                                                                                    Sleep, 100
                                                                                    Click, 1000, 1000
                                                                                }
                                                                            }break
                                                                        }
                                                                    }break
                                                                }
                                                            }break
                                                        }
                                                    }break
                                                }
                                            }break
                                        }
                                    }break
                                }
                                ;フレ選択がされていない場合の対策
                                Else
                                {
                                    Sleep, 50
                                    Click, %gx%, %gy%
                                }
                            }break
                        }
                    }
                }
            }
        }
        Yell()
    }
Return

;緊急回避用
;F5キーでユニオンをクリック→自ユニオンにカーソル移動
F5::
    Click, 1477, 1083, 0
    Click, 1477, 1083, 5
    Click, 256, 806, 0
Return
;F4キーで自ユニオンをクリック
F4::
    Click, 256, 806, 5
Return
;F3キーでフルエールをクリック→ホームボタンにカーソル移動、F2キーでエールをクリック
F3::
    Click, 717, 821, 10
    Click, 284, 1077, 0
Return
F2::
    Click, 443, 822, 10
Return
;F6キーでフル祈りをクリック→ホームボタンにカーソル移動、F7キーで祈りをクリック
F6::
    Click, 1558, 821, 10
    Click, 284, 1077, 0
Return
F7::
    Click, 1280, 822, 10
Return
;F1キーでホームを長押し→幻獣級バナーにカーソル移動
F1::
    Click, 284, 1077, D
    Sleep, 1200
    Click, 1414, 362, 0
Return
;F9キーで幻獣級とフレンド選択をクリック
F9::
    Click, 1414, 362, 60
Return
;F10キーで進軍をクリック→左上の敵アイコンにカーソル移動
F10::
    Click, 1754, 934, 0
    Click, 1754, 934, 3
    Click, 1383, 1080, 0
Return
;F11キーでOKをクリック
F11::
    Click, 983, 900, 0
    Click, 983, 900, 50
Return
;F8キーで左上に表示される戻るボタンをクリック
F8::
    Click, 274, 116
Return
;無変換+kで交易選択→12体選択→送り出すをクリック
vk1D & k::
    ;ユニットボタンのサーチ
    ImageSearch, ux, uy, 430, 1078, 614, 1160, *100 unit.bmp
    If (ErrorLevel = 0)
    {
        Click, %ux%, %uy%
        Loop, 
        {
            ;交易所アイコンのサーチ
            ImageSearch, kx, ky, 1498, 109, 1802, 243, *100 koueki.bmp
            If (ErrorLevel = 0)
            {
                Click, %kx%, %ky%
                Loop, 
                {
                    ;送り出すバナーのサーチ
                    ImageSearch, ox, oy, 1271, 347, 1604, 469, *100 okuridasu.bmp
                    If (ErrorLevel = 0)
                    {
                        Sleep, 300
                        Click, %ox%, %oy%
                        Sleep, 1000
                        Loop, 
                        {
                            ;表示順のサーチ
                            ;表示順が入手順になっている場合は左上から順に選択をし、送り出すボタンをクリック
                            ImageSearch, , , 1572, 172, 1773, 237, *100 nyuushujun.bmp
                            If (ErrorLevel = 0)
                            {
                                Click, 888, 383
                                Click, 1141, 383
                                Click, 1377, 383
                                Click, 1631, 383
                                Click, 888, 626
                                Click, 1141, 626
                                Click, 1377, 626
                                Click, 1631, 626
                                Click, 888, 877
                                Click, 1141, 877
                                Click, 1377, 877
                                Click, 1631, 877
                                Click, 454, 886
                                break
                            }
                            ;表示順が入手順以外の場合は入手順に変更
                            Else
                            {
                                Click, 1666, 212
                                Loop, 
                                {
                                    ;入手順ボタンのサーチ→OKボタンをクリック
                                    ImageSearch, nx, ny, 1401, 512, 1622, 605, *100 nyuushu.bmp
                                    If (ErrorLevel = 0)
                                    {
                                        Click, %nx%, %ny%
                                        Click, 813, 1041
                                        Sleep, 500
                                        break
                                    }
                                }
                            }
                        }break
                    }
                }break
            }
        }
    }
Return
;無変換+lで12体選択→送り出すをクリック
vk1D & l::
    Click, 888, 383
    Click, 1141, 383
    Click, 1377, 383
    Click, 1631, 383
    Click, 888, 626
    Click, 1141, 626
    Click, 1377, 626
    Click, 1631, 626
    Click, 888, 877
    Click, 1141, 877
    Click, 1377, 877
    Click, 1631, 877
    Click, 454, 886
Return

;メインクエスト単体
End::
    Loop, 
    {
        ;ホームボタンのサーチ
        ImageSearch, hx, hy, 231, 1049, 333, 1149, *100 home.bmp
        If (ErrorLevel = 0)
        {
            click, %hx%, %hy%, 0
            Click, %hx%, %hy%
            Loop, 
            {
                ;メインクエストボタンのサーチ
                ImageSearch, max, may, 1732, 801, 1904, 950, *100 mainquest.bmp
                If (ErrorLevel = 0)
                {
                    Click, %max%, %may%
                    Loop, 
                    {
                        ;該当クエストのサーチ
                        ImageSearch, qx, qy, 1304, 618, 1726, 713, *100 quest.bmp
                        If (ErrorLevel = 0)
                        {
                            Click, %qx%, %qy%
                            Sleep, 200
                            Loop, 
                            {
                                ;該当クエストのバナーのQuest部分のサーチ
                                ImageSearch, q5x, q5y, 1066, 314, 1293, 388, *100 genju.bmp
                                If (ErrorLevel = 0)
                                {
                                    Click, %q5x%, %q5y%
                                    Loop, 
                                    {
                                        ;編成の右矢印マークのサーチ
                                        ImageSearch, chx, chy, 1718, 492, 1850, 715, *100 change.bmp
                                        If (ErrorLevel = 0)
                                        {
                                            Click, %chx%, %chy%, 0
                                            Click, %chx%, %chy%
                                            Loop, 
                                            {
                                                ;進軍するボタンのサーチ
                                                ImageSearch, sx, sy, 1577, 847, 1841, 948, *100 shingun.bmp
                                                If (ErrorLevel = 0)
                                                {
                                                    Click, %sx%, %sy%, 0
                                                    Click, %sx%, %sy%
                                                    Loop, 
                                                    {
                                                        ;クエスト開始チェックのための左上の青い玉サーチ
                                                        ImageSearch, , , 48, 73, 100, 115, *100 wave.bmp
                                                        If (ErrorLevel = 0)
                                                        {
                                                            Loop, 
                                                            {
                                                                ;オートオフボタンのサーチ
                                                                ;オートオフの場合、オートスキルに変更
                                                                ImageSearch, aux, auy, 42, 1011, 174, 1123, *100 auto.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    Click, %aux%, %auy%
                                                                    Loop, 
                                                                    {
                                                                        ;オートスキルボタンのサーチ
                                                                        ImageSearch, asx, asy, 26, 864, 175, 998, *100 autosk.bmp
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
                                                                        ImageSearch, anx, any, 42, 1011, 174, 1123, *100 autono.bmp
                                                                        If (ErrorLevel = 0)
                                                                        {
                                                                            Click, %anx%, %any%, 2
                                                                            Loop, 
                                                                            {
                                                                                ;オートスキルボタンのサーチ
                                                                                ImageSearch, asx, asy, 26, 864, 175, 998, *100 autosk.bmp
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
                                                                                ImageSearch, , , 42, 1011, 174, 1123, *100 autosk.bmp
                                                                                If (ErrorLevel = 0)
                                                                                {
                                                                                    break
                                                                                }
                                                                            }break
                                                                        }
                                                                    }break
                                                                }
                                                            }
                                                            ;助っ人アイコンクリック
                                                            Sleep, 100
                                                            Click, 427, 1068
                                                            Loop, 
                                                            {
                                                                ;QUEST CLEARのRの文字のサーチ
                                                                ImageSearch, , , 1586, 451, 1606, 534, *100 clear.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    Sleep, 3500
                                                                    Loop,
                                                                    {
                                                                        ;OKボタンのサーチ
                                                                        ImageSearch, ox, oy, 878, 876, 1117, 946, *80 ok.bmp
                                                                        If (ErrorLevel = 0)
                                                                        {
                                                                            Click, %ox%, %oy%, 0
                                                                            Click, %ox%, %oy%
                                                                            Loop, 
                                                                            {
                                                                                ;ユニオンボタンのサーチ
                                                                                ImageSearch, qx, qy, 1431, 1048, 1527, 1140, *100 union.bmp
                                                                                If (ErrorLevel = 0)
                                                                                {
                                                                                    Sleep, 1500
                                                                                    Click, %qx%, %qy%, 0
                                                                                    Click, %qx%, %qy%
                                                                                    Loop, 
                                                                                    {
                                                                                        ;自ユニオンのサーチ
                                                                                        ImageSearch, mx, my, 213, 808, 295, 866, *100 myunion.bmp
                                                                                        If (ErrorLevel = 0)
                                                                                        {
                                                                                            Click, %mx%, %my%, 0
                                                                                            Click, %mx%, %my%
                                                                                            Loop, 
                                                                                            {
                                                                                                ;全祈りボタンのサーチ
                                                                                                ImageSearch, apx, apy, 1513, 788, 1651, 861, *100 allprayer.bmp
                                                                                                If (ErrorLevel = 0)
                                                                                                {
                                                                                                    Click, %apx%, %apy%, 0
                                                                                                    Click, %apx%, %apy%
                                                                                                    Sleep, 500
                                                                                                    Loop, 
                                                                                                    {
                                                                                                        ;エールボタンのサーチ
                                                                                                        ImageSearch, yx, yy, 359, 790, 545, 855, *100 yell.bmp
                                                                                                        If (ErrorLevel = 0)
                                                                                                        {
                                                                                                            Sleep, 200
                                                                                                            Click, %yx%, %yy%, 0
                                                                                                            Click, %yx%, %yy%
                                                                                                            Sleep, 300
                                                                                                            break
                                                                                                        }
                                                                                                    }break
                                                                                                }
                                                                                            }break
                                                                                        }
                                                                                    }break
                                                                                }
                                                                            }break
                                                                        }
                                                                        ;表示されるまでOKボタンの位置以外をクリックして口上カット
                                                                        Else
                                                                        {
                                                                            Sleep, 100
                                                                            Click, 1000, 1000
                                                                        }
                                                                    }break
                                                                }
                                                            }break
                                                        }
                                                    }break
                                                }
                                            }break
                                        }
                                        ;フレ選択がされていない場合の対策
                                        Else
                                        {
                                            Sleep, 100
                                            Click, %q5x%, %q5y%
                                        }
                                    }break
                                }
                            }break
                        }
                        ;メインクエストボタンが押されなかった場合の対策
                        Else
                        {
                            Sleep, 100
                            Click, %max%, %may%
                        }
                    }break
                }
            }break
        }
    }
Return