function UiWord - chinese()
    UI_LAYERZORDER_BACKGROUND = 0
    UI_LAYERZORDER_TAROT = 1
    UI_LAYERZORDER_LABEL = 2
    UI_LAYERZORDER_MID =3
    UI_LAYERZORDER_MENU = 4    
--Begin.lua
   Ui_Begin_Button = {
                       ["Ui_Begin_Button_Life"] = "生活",
                       ["Ui_Begin_Button_EnterPrise"] = "事业",
                       ["Ui_Begin_Button_Love"] = "爱情"
   }

--Shuffle.lua
   Ui_Shuffle_Button = {
                       ["Ui_Shuffle_Button_Top"] = "上",
                       ["Ui_Shuffle_Button_Center"] = "中",
                       ["Ui_Shuffle_Button_Bottom"] = "下",
                       ["Ui_Shuffle_Button_Next"] = "下一步洗牌",
                       ["Ui_Shuffle_Button_end"] = "洗牌结束"
   }
    
    UI_BUTTON_STATE_NORMAL_BEFORECALLBACK = 1000
    UI_BUTTON_STATE_SELECT_BEFORECALLBACK = 1001
    UI_BUTTON_STATE_NORMAL_AFTERCALLBACK = 1002
    UI_BUTTON_STATE_SELECT_AFTERCALLBACK = 1003

--Choice.lua
   Ui_Choice_Button = {
                       ["Ui_Choice_Button_end"] = "抽牌结束"
   }

--Answer.lua
   Ui_Answer_Button = {
                       ["Ui_Answer_Button_end"] = "下一张",

                       ["Ui_Answer5_Button_end"] = "结束"
   }

--End.lua
   Ui_End_Button = {
                       ["Ui_End_Button_Back"] = "再次看牌",

                       ["Ui_End_Button_Again"] = "重新开始",

                       ["Ui_End_Button_Exit"] = "退出游戏",

                       ["Ui_End_Button_Share"] = "分享游戏"
   }
end