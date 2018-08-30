function UiWord()
    UI_LAYERZORDER_BACKGROUND = 0
    UI_LAYERZORDER_TAROT = 1
    UI_LAYERZORDER_LABEL = 2
    UI_LAYERZORDER_MID =3
    UI_LAYERZORDER_MENU = 4    
--Begin.lua
   Ui_Begin_Button = {
                       ["Ui_Begin_Button_Life"] = "LIFE",
                       ["Ui_Begin_Button_EnterPrise"] = "ENTERPRISE",
                       ["Ui_Begin_Button_Love"] = "LOVE"
   }

--Shuffle.lua
   Ui_Shuffle_Button = {
                       ["Ui_Shuffle_Button_Top"] = "TOP",
                       ["Ui_Shuffle_Button_Center"] = "CENTER",
                       ["Ui_Shuffle_Button_Bottom"] = "BOTTOM",
                       ["Ui_Shuffle_Button_Next"] = "SHUFFLE NEXT",
                       ["Ui_Shuffle_Button_end"] = "SHUFFLE END"
   }
    
    UI_BUTTON_STATE_NORMAL_BEFORECALLBACK = 1000
    UI_BUTTON_STATE_SELECT_BEFORECALLBACK = 1001
    UI_BUTTON_STATE_NORMAL_AFTERCALLBACK = 1002
    UI_BUTTON_STATE_SELECT_AFTERCALLBACK = 1003

--Choice.lua
   Ui_Choice_Button = {
                       ["Ui_Choice_Button_end"] = "CHOICE END"
   }

--Answer.lua
   Ui_Answer_Button = {
                       ["Ui_Answer_Button_end"] = "NEXT CARD",

                       ["Ui_Answer5_Button_end"] = "END"
   }

--End.lua
   Ui_End_Button = {
                       ["Ui_End_Button_Back"] = "WATCH CARDS AGAIN",

                       ["Ui_End_Button_Again"] = "GAME AGAIN",

                       ["Ui_End_Button_Exit"] = "GAME OVER",

                       ["Ui_End_Button_Share"] = "SHARE"
   }
end