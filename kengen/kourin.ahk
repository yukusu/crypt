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
        ImageSearch, , , 31, 58, 116, 126, *20 wave.bmp
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
            Loop, 
            {
                ;wave1の左下の敵のアイコンサーチ(火属性)
                ImageSearch, x1, y1, 1641, 996, 1693, 1042, *20 hi.bmp
                If (ErrorLevel = 0)
                {
                    Click, %x1%, %y1%
                    loop,
                    {
                        ;wave2の左下の敵のアイコンサーチ(闇属性)
                        ImageSearch, x2, y2, 1641, 996, 1693, 1042, *20 yami.bmp
                        If (ErrorLevel = 0)
                        {
                            Click, %x2%, %y2%
                            loop,
                            {
                                ;wave3の左上の敵のアイコンサーチ(水属性)
                                ImageSearch, x3, y3, 1301, 1001, 1349, 1035, *20 mizu.bmp
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
                                                        ;APが切れた際の対策
                                                        ;回復するボタンのサーチ
                                                        ImageSearch, kx, ky, 645, 741, 981, 871, *30 kaifuku.bmp
                                                        If (ErrorLevel = 0)
                                                        {
                                                            Click, %kx%, %ky%
                                                            Sleep, 500
                                                            Loop, 
                                                            {
                                                                ;Twitter回復があればそちらを優先
                                                                ;Twitter投稿ボタンのサーチ
                                                                ImageSearch, tx, ty, 827, 828, 1164, 961, *60 twitter.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    Click, %tx%, %ty%
                                                                    Sleep, 300
                                                                    Loop, 
                                                                    {
                                                                        ;はいボタンのサーチ
                                                                        ImageSearch, tyx, tyy, 652, 763, 982, 885, *80 yes.bmp
                                                                        If (ErrorLevel = 0)
                                                                        {
                                                                            Click, %tyx%, %tyy%
                                                                            Loop, 
                                                                            {
                                                                                ;OKボタンのサーチ
                                                                                ImageSearch, ox, oy, 819, 732, 1188, 867, *80 ok.bmp
                                                                                If (ErrorLevel = 0)
                                                                                {
                                                                                    Click, %ox%, %oy%
                                                                                    break
                                                                                }
                                                                            }break
                                                                        }
                                                                    }break
                                                                }
                                                                ;回復済みであれば次の処理へ
                                                                Else
                                                                {
                                                                    break
                                                                }
                                                            }
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
                                                                        ;暗転したプラスボタンのサーチ
                                                                        ImageSearch, , , 1223, 549, 1410, 647, *30 plusoff.bmp
                                                                        If (ErrorLevel = 0)
                                                                        {
                                                                            ;APがMAXになったら長押しをやめる
                                                                            Click, %px%, %py%, U
                                                                            Loop, 
                                                                            {
                                                                                ;はいボタンのサーチ
                                                                                ImageSearch, yx, yy, 448, 829, 779, 968, *30 yes.bmp
                                                                                If (ErrorLevel = 0)
                                                                                {
                                                                                    Click, %yx%, %yy%
                                                                                    Loop, 
                                                                                    {
                                                                                        ;OKボタンのサーチ
                                                                                        ImageSearch, ox, oy, 819, 732, 1188, 867, *30 ok.bmp
                                                                                        If (ErrorLevel = 0)
                                                                                        {
                                                                                            Click, %ox%, %oy%
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
                                                        ;日付が変わる際の対策
                                                        Else
                                                        {
                                                            Loop, 
                                                            {
                                                                ;日付が変わる際のOKボタンのサーチ
                                                                ImageSearch, ox, oy, 838, 744, 1152, 863, *60 ok.bmp
                                                                If (ErrorLevel = 0)
                                                                {
                                                                    Click, %ox%, %oy%
                                                                    Loop, 
                                                                    {
                                                                        ;スタート画面の任意の画像のサーチ
                                                                        ImageSearch, Sx, Sy, 0, 0, 1977, 1141, *60 START.bmp
                                                                        If (ErrorLevel = 0)
                                                                        {
                                                                            Sleep, 1000
                                                                            Click, %Sx%, %Sy%
                                                                            ;起動時の読み込み時間の待機
                                                                            Sleep, 10000
                                                                            Loop, 
                                                                            {
                                                                                ;連続ログインのOKボタンのサーチ
                                                                                ImageSearch, lox, loy, 1240, 775, 1575, 906, *60 ok.bmp
                                                                                If (ErrorLevel = 0)
                                                                                {
                                                                                    Click, %lox%, %loy%
                                                                                    Sleep, 1000
                                                                                    Loop, 
                                                                                    {
                                                                                        ;フレンドポイントのOKボタンのサーチ
                                                                                        ImageSearch, fox, foy, 1240, 775, 1575, 906, *60 ok.bmp
                                                                                        If (ErrorLevel = 0)
                                                                                        {
                                                                                            Click, %fox%, %foy%
                                                                                            break
                                                                                        }
                                                                                        ;フレンド利用がなかった際は次の処理へ
                                                                                        Else
                                                                                        {
                                                                                            break
                                                                                        }
                                                                                    }
                                                                                    Loop, 
                                                                                    {
                                                                                        ;ログインボーナス時のユニオンボタンのサーチ
                                                                                        ImageSearch, Lux, Luy, 1361, 1018, 1574, 1162, *30 Loginunion.bmp
                                                                                        If (ErrorLevel = 0)
                                                                                        {
                                                                                            Sleep, 5000
                                                                                            Click, %Lux%, %Luy%
                                                                                            Sleep, 3000
                                                                                            Loop, 
                                                                                            {
                                                                                                ;お知らせ画面のOKボタンのサーチ
                                                                                                ImageSearch, ook, ooy, 812, 1019, 1134, 1120, *50 oshiraseok.bmp
                                                                                                If (ErrorLevel = 0)
                                                                                                {
                                                                                                    Click, %oox%, %ooy%
                                                                                                    Sleep, 3000
                                                                                                    Loop, 
                                                                                                    {
                                                                                                        ;有償ガチャのお知らせ画面のOKボタンのサーチ
                                                                                                        ImageSearch, ook, ooy, 812, 1019, 1134, 1120, *50 oshiraseok.bmp
                                                                                                        If (ErrorLevel = 0)
                                                                                                        {
                                                                                                            Click, %oox%, %ooy%
                                                                                                            break
                                                                                                        }
                                                                                                        Else
                                                                                                        {
                                                                                                            break
                                                                                                        }
                                                                                                    }break
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                    break
                                                                                                }
                                                                                            }
                                                                                            Loop, 
                                                                                            {
                                                                                                ;ホーム画面のホームボタンのサーチ
                                                                                                ImageSearch, Hhx, Hhy, 197, 1018, 363, 1155, *20 Homehome.bmp
                                                                                                If (ErrorLevel = 0)
                                                                                                {
                                                                                                    Click, %Hhx%, %Hhy%, D
                                                                                                    Sleep, 1200
                                                                                                    Loop, 
                                                                                                    {
                                                                                                        ;神話級バナーのQuestのサーチ
                                                                                                        ImageSearch, qx, qy, 1226, 276, 1417, 351, *60 genju.bmp
                                                                                                        If (ErrorLevel = 0)
                                                                                                        {
                                                                                                            Click, %qx%, %qy%
                                                                                                            Loop, 
                                                                                                            {
                                                                                                                ;進軍するボタンのサーチ
                                                                                                                ImageSearch, sx, sy, 1595, 890, 1813, 960, *60 shingun.bmp
                                                                                                                If (ErrorLevel = 0)
                                                                                                                {
                                                                                                                    Click, %sx%, %sy%, 0
                                                                                                                    Click, %sx%, %sy%
                                                                                                                    break
                                                                                                                }
                                                                                                                ;フレ選択がされていない場合の対策
                                                                                                                Else
                                                                                                                {
                                                                                                                    Sleep, 10
                                                                                                                    Click, %gx%, %gy%
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
                                                                ;通常時は何もせずにループ継続
                                                                Else
                                                                {
                                                                    break
                                                                }
                                                            }break
                                                        }

                                                    }break
                                                }
                                                ;表示されるまで再戦ボタンの位置以外をクリックして口上カット
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
            }
        }
    }
Return