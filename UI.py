# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'UI.ui'
#
# Created by: PyQt5 UI code generator 5.15.7
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 600)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.label_button = QtWidgets.QLabel(self.centralwidget)
        self.label_button.setGeometry(QtCore.QRect(20, 20, 131, 101))
        self.label_button.setObjectName("label_button")
        self.comboBox = QtWidgets.QComboBox(self.centralwidget)
        self.comboBox.setGeometry(QtCore.QRect(160, 20, 541, 22))
        self.comboBox.setObjectName("comboBox")
        self.label_botton_text = QtWidgets.QLabel(self.centralwidget)
        self.label_botton_text.setGeometry(QtCore.QRect(160, 50, 541, 31))
        self.label_botton_text.setObjectName("label_botton_text")
        self.label_button_query = QtWidgets.QLabel(self.centralwidget)
        self.label_button_query.setGeometry(QtCore.QRect(160, 90, 541, 31))
        self.label_button_query.setObjectName("label_button_query")
        self.pushButton_button_show = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_button_show.setGeometry(QtCore.QRect(710, 50, 75, 31))
        self.pushButton_button_show.setObjectName("pushButton_button_show")
        self.pushButton_button_clear = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_button_clear.setGeometry(QtCore.QRect(710, 90, 75, 31))
        self.pushButton_button_clear.setObjectName("pushButton_button_clear")
        self.label_query = QtWidgets.QLabel(self.centralwidget)
        self.label_query.setGeometry(QtCore.QRect(20, 140, 131, 111))
        self.label_query.setObjectName("label_query")
        self.plainTextEdit = QtWidgets.QPlainTextEdit(self.centralwidget)
        self.plainTextEdit.setGeometry(QtCore.QRect(160, 140, 541, 111))
        self.plainTextEdit.setObjectName("plainTextEdit")
        self.pushButton_query_show = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_query_show.setGeometry(QtCore.QRect(710, 180, 75, 31))
        self.pushButton_query_show.setObjectName("pushButton_query_show")
        self.pushButton_query_clear = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_query_clear.setGeometry(QtCore.QRect(710, 220, 75, 31))
        self.pushButton_query_clear.setObjectName("pushButton_query_clear")
        self.label_result = QtWidgets.QLabel(self.centralwidget)
        self.label_result.setGeometry(QtCore.QRect(20, 270, 131, 41))
        self.label_result.setObjectName("label_result")
        self.label_result_text = QtWidgets.QLabel(self.centralwidget)
        self.label_result_text.setGeometry(QtCore.QRect(20, 320, 761, 231))
        self.label_result_text.setObjectName("label_result_text")
        MainWindow.setCentralWidget(self.centralwidget)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.label_button.setText(_translate("MainWindow", "TextLabel"))
        self.label_botton_text.setText(_translate("MainWindow", "TextLabel"))
        self.label_button_query.setText(_translate("MainWindow", "TextLabel"))
        self.pushButton_button_show.setText(_translate("MainWindow", "PushButton"))
        self.pushButton_button_clear.setText(_translate("MainWindow", "PushButton"))
        self.label_query.setText(_translate("MainWindow", "TextLabel"))
        self.pushButton_query_show.setText(_translate("MainWindow", "PushButton"))
        self.pushButton_query_clear.setText(_translate("MainWindow", "PushButton"))
        self.label_result.setText(_translate("MainWindow", "TextLabel"))
        self.label_result_text.setText(_translate("MainWindow", "TextLabel"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
