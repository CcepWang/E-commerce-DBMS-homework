import pymysql
from PyQt5 import QtWidgets
from PyQt5.QtGui import QFont

from UI2 import Ui_MainWindow


class MainWindow_controller(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__() # in python3, super(Class, self).xxx = super().xxx
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self.setup_control()
        
    def setup_control(self):
        self.db_settings = {
            "host": "127.0.0.1",
            "port": 3306,
            "user": "root",
            "password": "密碼",
            "db": "dbms_project",
            "charset": "utf8"
        }
        # TODO
        
        self.ui.label_button.setText('Button')
        self.ui.label_button.setFont(QFont('Arial', 18))
        self.ui.comboBox.addItems(['SELECT-FROM-WHERE', 'DELETE', 'INSERT', 'UPDATE', 'IN', 'NOT IN', 'EXISTS', 'NOT EXISTS', 'COUNT', 'SUM', 'MAX', 'MIN', 'AVG', 'HAVING'])
        self.ui.comboBox.setFont(QFont('Arial', 12))
        self.ui.comboBox.currentTextChanged.connect(self.showInfo)
        self.ui.label_botton_text.setFont(QFont('Arial', 12))
        self.ui.label_botton_text.setWordWrap(True)
        self.ui.label_button_query.setFont(QFont('Arial', 12))
        self.ui.label_button_query.setWordWrap(True)
        self.showInfo()
        self.ui.pushButton_button_show.setText('Search')
        self.ui.pushButton_button_show.setFont(QFont('Arial', 12))
        self.ui.pushButton_button_show.clicked.connect(self.onButtonClickButton)
        self.ui.pushButton_button_clear.setText('Clear')
        self.ui.pushButton_button_clear.setFont(QFont('Arial', 12))
        self.ui.pushButton_button_clear.clicked.connect(self.onButtonClickClear)

        self.ui.label_query.setText('Query')
        self.ui.label_query.setFont(QFont('Arial', 18))
        self.ui.plainTextEdit.setFont(QFont('Arial', 14))
        self.ui.pushButton_query_show.setText('Search')
        self.ui.pushButton_query_show.setFont(QFont('Arial', 12))
        self.ui.pushButton_query_show.clicked.connect(self.onButtonClickQuery)
        self.ui.pushButton_query_clear.setText('Clear')
        self.ui.pushButton_query_clear.setFont(QFont('Arial', 12))
        self.ui.pushButton_query_clear.clicked.connect(self.onButtonClickClear)

        self.ui.label_result.setText('Result')
        self.ui.label_result.setFont(QFont('Arial', 18))
        self.ui.label_result_text.setText('')
        self.ui.label_result_text.setFont(QFont('Arial', 14))

    def infoAndQuery(self,text):
        if text == 'SELECT-FROM-WHERE':
            info = '挑選出價格小於5的商品名稱'
            query = 'SELECT P.Name FROM product As P WHERE P.Price < 5;'
            return info,query
        elif text == 'DELETE':
            info = 'A1這個物流廠商不合作了,所以刪除該廠商資料'
            query = "DELETE FROM logistics As L where L.Name = 'A1';"
            return info,query
        elif text == 'INSERT':
            info = 'A1這個物流廠商後來反悔了,決定仍要合作'
            query = "INSERT INTO logistics (Logistics_ID, Name, Shipping_cost) VALUES ('000000','A1','1');"
            return info,query
        elif text == 'UPDATE':
            info = '因為J先生搬家了,所以要更改住址到KK'
            query = "UPDATE consumer As C SET C.Address = 'KK' where C.First_name = 'J';"
            return info,query
        elif text == 'IN':
            info = '找出ABCDE和BCDEF這兩間商店的所有商品名稱'
            query = "SELECT P.Name FROM product As P WHERE P.S_ID IN (SELECT S.Store_ID FROM online_store AS S WHERE S.Store_name = 'ABCDE' OR S.Store_name = 'BCDEF');"
            return info,query
        elif text == 'NOT IN':
            info = '找出不屬於ABCDE和BCDEF這兩間商店的所有商品名稱'
            query = "SELECT P.Name FROM product As P WHERE P.S_ID NOT IN (SELECT S.Store_ID FROM online_store AS S WHERE S.Store_name = 'ABCDE' OR S.Store_name = 'BCDEF');"
            return info,query
        elif text == 'EXISTS':
            info = '找出有被放到購物車的產品名稱'
            query = "SELECT P.Name FROM product As P WHERE EXISTS (SELECT 1 FROM cart As C WHERE P.Product_ID = C.P_ID);"
            return info,query
        elif text == "NOT EXISTS":
            info = '找出沒有被放到購物車的產品名稱'
            query = "SELECT P.Name FROM product As P WHERE NOT EXISTS (SELECT 1 FROM cart As C WHERE P.Product_ID = C.P_ID);"
            return info,query
        elif text == "COUNT":
            info = '總共有幾個商店'
            query = 'SELECT COUNT(S.Store_ID) FROM online_store As S;'
            return info,query
        elif text == "SUM":
            info = 'ABCDE商店的商品總共要價多少'
            query = "SELECT SUM(P.Price) FROM product As P, online_store As S WHERE P.S_ID = S.Store_ID AND S.Store_name = 'ABCDE';"
            return info,query
        elif text == "MAX":
            info = '挑選出運費最高是多少'
            query = 'SELECT MAX(L.Shipping_cost) FROM logistics As L;'
            return info,query
        elif text == 'MIN':
            info = '挑選出運費最低是多少'
            query = 'SELECT MIN(L.Shipping_cost) FROM logistics As L;'
            return info,query
        elif text == "AVG":
            info = '挑選出平均運費是多少'
            query = 'SELECT AVG(L.Shipping_cost) FROM logistics As L;'
            return info,query
        elif text == "HAVING":
            info = '挑選出售出次數大於2的商品名稱'
            query = 'SELECT P.Name FROM product As P, comsume As C WHERE P.Product_ID = C.P_ID GROUP BY C.P_ID Having Count(P_ID) > 2;'
            return info,query

    def showInfo(self):
        text = self.ui.comboBox.currentText()
        info,query = self.infoAndQuery(text)
        self.ui.label_botton_text.setText(info)
        self.ui.label_button_query.setText(query)

    def onButtonClickButton(self):
        text = self.ui.comboBox.currentText()
        info,query = self.infoAndQuery(text)
        if text in ['DELETE','INSERT','UPDATE']:
            result = self.queryToDBMS(query,True)
        else:
            result = self.queryToDBMS(query,False)
        outPut = self.showResult(result)
        self.ui.label_result_text.setText(outPut)

    def onButtonClickQuery(self):
        msg = self.ui.plainTextEdit.toPlainText()
        string = self.firstWord(msg)
        if string in ['DELETE','INSERT','UPDATE']:
            result = self.queryToDBMS(msg,True)
        else:
            result = self.queryToDBMS(msg,False)
        outPut = self.showResult(result)
        self.ui.label_result_text.setText(outPut)

    def onButtonClickClear(self):
        self.ui.label_result_text.setText('')

    def queryToDBMS(self,query,commit=False):
        try:
            # 建立Connection物件
            self.conn = pymysql.connect(**self.db_settings)
            with self.conn.cursor() as cursor:
                # 執行指令
                cursor.execute(query)
                if commit:
                    self.conn.commit()
                # 取得所有資料
                result = cursor.fetchall()
                cursor.close()
                return result

        except Exception as ex:
            print(ex)

    def firstWord(self,string):
        temp = ''
        for i in range(len(string)):
            if string[i] == ' ':
                break
            else:
                temp += string[i]

        return temp

    def showResult(self,result):
        temp = ''
        for i in range(len(result)):
            temp = temp + str(result[i][0]) + ' '
        return temp
