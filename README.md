# TDA101G1 旅遊電商與行程客製化平台

這是一個以 **Java Web** 為核心的旅遊專題網站，整合了 **商品商城、會員中心、訂單流程、站內信、優惠券管理、以及客製化行程規劃** 等功能，並區分前台與後台管理介面。

---

## 🗺️ 網站地圖

### 前台網站

```text
首頁
└─ /index.jsp
   ├─ 熱門套裝行程展示
   ├─ 導覽列與會員入口
   └─ 推薦商品與活動內容

商品與購物流程
└─ /product/
   ├─ productDetail.jsp      商品詳情
   ├─ shoppingCar.jsp        購物車
   ├─ checkout.jsp           結帳頁
   ├─ successPay.jsp         付款完成頁
   └─ denyPage.jsp           權限 / 流程限制頁

會員中心
└─ /frontstage_member/
   ├─ login2.jsp             會員登入
   ├─ SignUp.jsp             會員註冊
   ├─ MemberUpdate.jsp       會員資料修改
   ├─ listAllMember.jsp      會員清單/展示
   ├─ member_Calendar/       行事曆
   ├─ member_Collection/     收藏清單
   ├─ member_Comment/        評論管理
   ├─ member_Credit_Card/    信用卡資料
   ├─ member_Inbox/          站內信
   ├─ member_Order/          訂單查詢
   └─ member_Schedule/       行程管理

客製化行程功能
└─ /hui_project/
   ├─ index.jsp              行程規劃首頁
   ├─ schedule.jsp           行程編輯 / 排程
   ├─ produce_schedule.jsp   行程產生結果
   └─ getLatLng.html         地理座標測試頁

其他頁面
├─ /profilecard.jsp          個人資訊卡
└─ /NoData/                  無資料或空狀態頁面
```

### 後台管理

```text
/backstage/
├─ login.jsp                 後台登入
├─ Home.jsp                  後台首頁 / 儀表板
├─ employee/                 員工管理
├─ member/                   會員管理
├─ product/                  商品管理
├─ coupon/                   優惠券管理
├─ inbox/                    信件管理
└─ Order_Master/             訂單管理
```

---

## 🛠️ 使用技術

| 類別 | 技術 | 說明 |
|---|---|---|
| 後端語言 | `Java` | 專案主要開發語言 |
| Web 技術 | `JSP`、`Servlet`、`JSTL` | 建立動態網頁與控制流程 |
| 架構風格 | `MVC / DAO / Service` | `controller`、`model` 分層清楚 |
| 資料庫 | `Oracle` | 由 `ojdbc6.jar` 與 `Common/common.java` 可看出使用 Oracle |
| 連線方式 | `JDBC`、`JNDI DataSource` | 使用 `java:comp/env/jdbc/TestDB3` 進行資料庫連線 |
| 即時通訊 | `WebSocket` | 用於多人共同編輯行程功能 |
| 快取 / 狀態 | `Redis`、`Jedis` | 於 `src/com/redis/` 與 `jedis-2.9.0.jar` 可見 |
| JSON 處理 | `Gson`、`JSON-Java` | API 回傳與資料交換使用 |
| 郵件功能 | `JavaMail` | 註冊/通知等功能可延伸使用 |
| 前端樣式 | `HTML`、`CSS`、`JavaScript` | 前端頁面基礎技術 |
| UI 套件 | `Bootstrap 4` | 快速建立 RWD 版面 |
| 前端工具 | `jQuery` | DOM 操作與 Ajax 互動 |
| 行事曆 | `FullCalendar` | 行程/日曆顯示 |
| 日期選擇 | `Flatpickr` | 日期欄位選擇器 |
| 前端建置 | `Node.js`、`Gulp` | `WebContent/mall/` 模板資源使用 |
| 專案型態 | `Eclipse Dynamic Web Project` | 由 `.project` 與 `WebContent/WEB-INF/web.xml` 可判斷 |

---

## 📁 主要文件結構

```text
G1-0625/
├─ build/                         編譯後 class 檔
├─ src/                           Java 原始碼
│  ├─ Common/                     共用設定（如 DataSource）
│  ├─ jdbc/util/                  JDBC 工具類
│  ├─ InboxDAO_interface.java     DAO 介面
│  └─ com/
│     ├─ member/                  會員模組
│     ├─ product/                 商品模組
│     ├─ order/                   訂單明細模組
│     ├─ order_master/            訂單主檔模組
│     ├─ coupon/                  優惠券模組
│     ├─ inbox/                   站內信模組
│     ├─ inbox_api/               站內信 API
│     ├─ member_api/              會員登入 / 註冊 API
│     ├─ customerize/             客製化行程模組
│     ├─ customerizedetail/       行程明細模組
│     ├─ customerize/websocket/   即時協作功能
│     ├─ collection/              收藏功能
│     ├─ comment/                 留言 / 評論功能
│     ├─ productcmt/              商品評論模組
│     ├─ credit_card/             信用卡資料模組
│     ├─ employee/                員工模組
│     ├─ filter/                  登入驗證過濾器
│     ├─ redis/                   Redis 測試與相關程式
│     └─ util/                    圖片顯示、條碼等工具類
├─ WebContent/                    前端頁面與 Web 資源
│  ├─ index.jsp                   專案首頁
│  ├─ backstage/                  後台頁面
│  ├─ frontstage_member/          會員前台頁面
│  ├─ hui_project/                行程規劃頁面
│  ├─ product/                    商品購物流程頁面
│  ├─ img/                        圖片資源
│  ├─ vendors/                    前端第三方套件
│  ├─ META-INF/                   Web 中繼資料
│  └─ WEB-INF/
│     ├─ web.xml                  Web 專案設定
│     └─ lib/                     外部 jar 套件
└─ .project                       Eclipse 專案設定
```

---

## 📌 補充說明

- 專案首頁預設由 `WebContent/WEB-INF/web.xml` 指向 `index.jsp`。
- 後端資料庫連線集中在 `src/Common/common.java`。
- `WebContent/mall/` 內含一份以 **Start Bootstrap** 為基礎的商城樣板，可作為前端版型參考。

---

如果之後需要，我也可以再幫你把這份 `README.md` 補上：
1. **系統安裝與執行方式**
2. **資料表/ER 圖說明**
3. **各模組負責人與功能分工**
