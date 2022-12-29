# E-commerce-DBMS-homework
# RDBMS homework - E-commerce Database

## Quick start
* download mySQL
* install pyqt5

## 系統架構與環境
### 系統架構
![image](https://user-images.githubusercontent.com/37070545/209913022-bc1556f3-fc1a-43fd-8fb9-9311ad215616.png)

### 系統環境 
* 系統 : win10
* 資料庫 : mySQL
* 前端 : PyQT5
* 使用說明
    1. 利用mySQL workbench 創建data，也可以直接輸入sql檔。
    ![image](https://user-images.githubusercontent.com/37070545/209913165-6d0d14b7-d4fe-4b6d-a218-6c417e950711.png)
    2. 更改controller.py的連接DBMS的password部分，再使用 start.py 開啟UI介面。
    ![image](https://user-images.githubusercontent.com/37070545/209913393-4425123a-c2b6-4d69-98e8-ad27c99aa38d.png)
    3. 下拉選擇你要的 query，然後點選 search 便能觸發該 query。(點選 Clear 刪除頁面上的結果)
    ![image](https://user-images.githubusercontent.com/37070545/209913432-a8c0b8f4-3680-4157-bfbb-f86eb074a170.png)
    4. 也可以在query方框內輸入要執行的query。(點選 Clear 刪除頁面上的結果)
    ![image](https://user-images.githubusercontent.com/37070545/209913562-3b5679ab-bba6-4225-b117-4a30a81d1892.png)


## ER Diagrams
![project_er diagram](https://user-images.githubusercontent.com/37070545/207524900-91711c02-7313-41a7-b2c2-29968d1dc917.jpg)

## Relation schema
![project_schema](https://user-images.githubusercontent.com/37070545/207524931-c93f86b0-c912-4427-b219-1b1bd18157a7.jpg)

## 資料庫基本需求

### Entity (7個)
* **Consumer** : 
    1. Consumer_ID (**primary key**) : 消費者的 id，為 key attribute。
    2. First_name : 消費者的 first_name。
    3. Last_name : 消費者的 last_name。
    4. Address : 消費者的住址。
    5. Bank account : 消費者的銀行帳號。
* **Product** : 
    1. Product_ID (**primary key**) : 產品的 id。
    2. Price : 產品的價格。
    3. Name : 產品的名稱 。
    4. S_ID (**foreign key**) : 店家的 id。
* **Online store** : 
    1. Store_Id (**primary key**) : 線上店家的 id。
    2. Store_name : 店家的名稱。
    3. Bank account : 店家的銀行帳號。
* **Order** : 
    1. Order_ID (**primary key**) : 訂單的 id。
    2. Total_cost : 該訂單的總花費。
    3. Time : 消費者下訂單的時間。
    4. L_ID : 物流的 id。
* **Logistics**
    1. Logistics_ID (**primary key**) : 物流的 id。
    2. Name : 物流的名稱。
    3. Shipping_cost : 該物流的運費。
* **Cart**
    1. C_ID (**primary key**) : 消費者的 id。
    2. P_ID (**primary key**) : 產品的 id。
    3. Number_product : 產品的數量。
* **Consume**
    1. C_ID (**primary key**) : 消費者的 id。
    2. P_ID (**primary key**) : 產品的 id。
    3. O_ID (**primary key**) : 訂單的 id。
    4. Number_product : 產品的數量。

### Relationship (需包含二元及三元)
* 二元關係
    1. Cart => Consumer and Product
        消費者可以將產品加入到購物車，一個消費者可以加入很多種產品到購物車，一個產品也可以被很多消費者加入到購物車。
    2. Supply => Online store and Product
        一間商店可以提供很多種產品或者不提供產品。
    3. Delivery => Order and Logistics
        每一筆訂單必須有物流去寄貨，同一個物流可能同時寄很多筆訂單。
* 三元關係
    1. Cousume => Consumer, Product and Order
        每一次消費，都包含一位消費者，與一種產品，還有一筆訂單
