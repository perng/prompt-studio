# 引導式圖像 Prompt Builder Flutter App 設計文件

## 一、產品定位

### 產品名稱構想
- PromptCraft
- Banana Prompt Studio
- Image Prompt Builder
- 視覺咒語工坊
- Prompt 桶子生成器

### 核心價值
這個 App 不只是「輸入一句話」而已，而是把圖像提示詞拆成有結構的區塊，讓使用者透過手機觸控、滑動選擇、Bottom Sheet 填表單的方式，慢慢組出完整 Prompt。

它解決的問題是：

- 使用者不知道要描述哪些細節
- 寫出來的 Prompt 太亂、太散
- 不知道「相機語言」「微細節」「風格錨點」怎麼加
- 不知道加太多會失控，加太少又不夠準

---

## 二、產品概念

這個 App 可以叫做：

### 引導式圖像 Prompt 設計器

使用者進來後，不是直接看到一個大文字框，而是看到：

1. 主體是什麼
2. 畫面場景是什麼
3. 想要什麼氛圍
4. 想用什麼鏡頭語言
5. 要不要加微細節
6. 要不要加風格錨點
7. 最後自動幫你組成 Prompt

---

## 三、核心互動流程

### 使用流程

#### Step 1：先決定主題
例如：
- 一位站在雨夜街頭的少女
- 森林中的巨大機械鹿
- 老派香港茶餐廳內景
- 台灣夜市裡的賽博龐克攤販

#### Step 2：用細節桶補內容
系統把細節拆成桶：

- 主體
- 光線
- 氛圍
- 環境
- 相機
- 色彩
- 材質
- 構圖
- 微細節
- 風格錨點

#### Step 3：即時預覽 Prompt
透過底部彈出視窗 (Bottom Sheet) 或浮動面板即時顯示：

- 自然語言 Prompt
- 結構化 Prompt
- 精簡版 Prompt
- 進階版 Prompt

#### Step 4：一鍵複製 / 匯出
可輸出為：
- 通用 Prompt
- 英文 Prompt
- 中文 Prompt
- 含 Negative Prompt 版本
- JSON 結構版本

---

## 四、UI 介面設計

### 整體版面
建議採用適合手機的單欄滑動或分步精靈 (Wizard) 模式：

#### 頂部 / 步驟指示
顯示目前進度 (例如 Progress Bar 或水平橫向滑動的步驟標籤)：
- 1 主體 -> 2 場景 -> 3 光線 -> 4 相機 -> 5 微細節 -> 6 風格 -> 7 匯出

#### 中央：表單編輯區
每一區都是一張卡片 (Card) 或是可展開的列表 (ExpansionPanel)。使用者可以觸控選擇標籤、用滑桿調整強度。

#### 底部：懸浮的即時預覽區 (Bottom Sheet)
常駐在底部的迷你面板，上滑可展開查看完整資訊：
- 生成中的 Prompt
- Prompt 品質提示
- 長度提示
- 風格衝突提醒
- 一鍵複製、分享 (Share) 按鈕

---

## 五、功能模組設計

### 1. 主體描述模組
欄位：
- 主角 / 主物件
- 動作
- 表情
- 年齡感
- 服裝 / 外觀
- 特殊道具

例：
- 主角：年輕女劍士
- 動作：站在屋頂上回頭
- 表情：冷靜堅定
- 服裝：黑色長風衣、皮革手套
- 道具：發光長刀

---

### 2. 細節桶模組
每個桶都做成可選標籤 + 自由輸入。

#### 光線
可選項：
- 柔和晨光
- 霓虹紫光
- 黃昏逆光
- 月光
- 室內暖光
- 體積光
- 強烈高反差
- 頂光 (Top lighting)
- 底光 (Underlighting)
- 側光 (Side lighting)
- 林間碎光 (Dappled light)
- 聚光燈 (Spotlight)
- 閃光燈效果 (Flash photography)
- 螢光發光 (Fluorescent glow)
- 燭光 (Candlelight)
- 篝火光 (Campfire light)
- 魔法發光 (Magical glow)
- 螢火蟲微光 (Firefly glimmer)
- 天井光 (Skylight)
- 窗外透光 (Window light)
- 陰天漫射光 (Overcast diffuse light)
- 無影光 (Flat lighting)
- 舞台絢爛光 (Stage lighting)
- 全息投影光 (Holographic light)
- 賽博龐克燈牌光 (Cyberpunk neon signage)
- 水下折射光 (Underwater caustics)
- 電弧閃電光 (Arc lightning)

#### 氛圍
- 平靜
- 神秘
- 冥想感
- 緊張
- 末日感
- 浪漫
- 壓迫感
- 歡樂 (Joyful)
- 孤獨 (Lonely)
- 懷舊 (Nostalgic)
- 史詩感 (Epic)
- 詭異 (Eerie)
- 夢幻 (Dreamy)
- 迷幻 (Psychedelic)
- Cyberpunk感 (Cyberpunk vibe)
- 未來科技感 (Futuristic)
- 宗教神聖感 (Sacred/Holy)
- 戰爭殘酷感 (Gritty war)
- 童話感 (Fairy tale)
- 幽默搞笑 (Humorous)
- 懸疑 (Suspenseful)
- 生機盎然 (Vibrant/Lively)
- 頹廢 (Decadent)
- 溫馨 (Cozy)
- 狂熱 (Frenetic)
- 冰冷疏離 (Cold and detached)
- 憂鬱 (Melancholic)

#### 環境
- 雨夜街頭
- 廢棄工廠
- 森林
- 日式房間
- 太空站
- 古老圖書館
- 夜市
- 沙漠綠洲 (Desert oasis)
- 冰川裂隙 (Glacier crevasse)
- 賽博龐克酒吧 (Cyberpunk bar)
- 歐式古堡 (European castle)
- 水下遺跡 (Underwater ruins)
- 雲端神殿 (Cloud temple)
- 魔幻結晶洞穴 (Crystal cave)
- 蒸氣龐克鐘樓 (Steampunk clocktower)
- 異星地表 (Alien surface)
- 繁華商業街 (Busy commercial street)
- 傳統中國茶館 (Traditional Chinese teahouse)
- 現代極簡辦公室 (Minimalist modern office)
- 擁擠地鐵車廂 (Crowded subway car)
- 二戰戰壕 (WWII trench)
- 鬼屋廢墟 (Haunted mansion ruins)
- 天空浮島 (Floating islands)
- 巨型機器人內部 (Inside a giant mecha)
- 喧囂傳統市場 (Bustling traditional market)
- 寧靜海灘 (Tranquil beach)
- 無盡迷宮 (Infinite labyrinth)

#### 色彩
- 冷藍灰
- 暖橘金
- 高彩度
- 黑金
- 粉紫夢幻
- 墨綠復古
- 褪色復古 (Faded retro)
- 黑白對比 (High-contrast B&W)
- 單色調 (Monochrome)
- 霓虹撞色 (Neon color clash)
- 電影橙青調 (Teal and Orange)
- 低飽和莫蘭迪色 (Morandi colors)
- 螢光毒性綠 (Toxic neon green)
- 深紅血色調 (Blood red tones)
- 冰川冷藍調 (Glacial blue tones)
- 金箔奢華色 (Gold foil luxury)
- 迷幻漸層 (Psychedelic gradients)
- 深海幽藍 (Deep sea blue)
- 賽博龐克紫紅 (Cyberpunk magenta)
- 大地泥土色 (Earthy tones)
- 柔和粉彩 (Pastel colors)
- 哥德暗黑調 (Gothic dark)
- 賽璐璐鮮豔色 (Cel-shaded vibrant)
- 晚霞火燒雲 (Sunset gradient)
- 銀灰科技色 (Silver tech)
- 毒蘑菇斑斕色 (Poisonous vibrant)

#### 材質
- 濕玻璃
- 光滑金屬
- 粗糙石牆
- 天鵝絨
- 木紋
- 陶瓷
- 鏽蝕表面
- 碳纖維 (Carbon fiber)
- 毛線編織 (Knitted wool)
- 半透明磨砂 (Frosted glass/plastic)
- 飄逸絲綢 (Flowing silk)
- 爬蟲類鱗片 (Reptile scales)
- 機甲外殼 (Mecha armor plating)
- 冰塊晶體 (Ice crystals)
- 水晶折射 (Refractive crystal)
- 黏稠液體 (Viscous slime)
- 皺褶紙張 (Crumpled paper)
- 粗糙油畫布 (Rough canvas)
- 柔軟皮革 (Soft leather)
- 熔岩流動 (Flowing lava)
- 老舊羊皮紙 (Aged parchment)
- 柔軟羽毛 (Soft feathers)
- 長毛絨布 (Plush fur)
- 全息投影干擾 (Holographic glitch)
- Q彈果凍質感 (Jelly texture)
- 斑駁掉漆 (Peeling paint)
- 蜂巢結構 (Honeycomb structure)

#### 構圖
- 低角度
- 居中對稱
- 特寫
- 半身
- 全身
- 遠景
- 前景遮擋
- 三分法構圖
- 俯視角 (God's eye view)
- 荷蘭角 (Dutch angle / 斜角)
- 魚眼透視 (Fisheye perspective)
- 超微距 (Extreme macro)
- 大遠景 (Extreme long shot)
- 背影 (From behind)
- 越肩視角 (Over the shoulder)
- 景深引導線 (Leading lines with DoF)
- 畫中畫 (Framing within a frame)
- 對角線構圖 (Diagonal composition)
- 黃金螺旋構圖 (Golden ratio / Fibonacci spiral)
- 幾何切割 (Geometric division)
- 上下倒置 (Upside down)
- 鳥瞰 (Bird's-eye view)
- 蟲瞳視角 (Worm's-eye view)
- 第一人稱視角 (First-person POV)
- 雙人對峙/鏡像構圖 (Symmetrical standoff)
- 極端特寫 (Extreme close-up)
- 動態模糊追焦 (Panning with motion blur)
- 大面積留白 (Negative space)

---

### 3. 相機語言模組
這一塊很重要，可以做成「電影感助手」。

#### 選項
- 35mm 膠片
- 50mm 人像
- 微距特寫
- f1.4 淺景深
- 長焦壓縮
- 變形鏡頭
- 運動模糊
- 手持攝影感
- 鏡頭光暈
- cinematic shot

#### 呈現方式
可以做成兩層：
- 基本模式：電影感 / 人像感 / 特寫感 / 廣角感
- 進階模式：顯示實際術語

這樣新手不會被嚇到，高手又能細調。

---

### 4. 微細節模組
做成「真實感增強器」。

#### 微細節庫
- 灰塵顆粒
- 細小刮痕
- 膠片顆粒
- 柔和光暈
- 細微高光
- 環境霧氣
- 冰冷反射
- 指紋痕跡
- 磨損邊緣
- 皮膚細節
- 布料纖維
- 水珠附著

#### UX 建議
旁邊顯示提示：
- 0 個：畫面可能太乾淨
- 1～3 個：通常最佳
- 4 個以上：可能過度堆疊

---

### 5. 風格錨點模組
做成「風格控制器」。

#### 風格選項
- 吉卜力感
- 寫實動漫
- 韋斯安德森式對稱
- 皮克斯感
- 文藝復興油畫
- 超寫實攝影
- 賽博龐克黑色電影感
- 雜誌時尚大片
- 復古底片感
- 插畫海報風

#### UX 規則
系統限制：
- 建議只選 1～2 個
- 超過 3 個時提示：風格可能互相衝突

---

### 6. Prompt 組裝引擎
系統不是單純把所有東西硬接起來，而是根據模板組句。

#### 組裝邏輯

##### 基礎模板
`[主體]，位於[環境]，呈現[氛圍]，使用[光線]，以[相機語言]拍攝，畫面帶有[材質/色彩]，構圖為[構圖]，加入[微細節]，整體風格偏向[風格錨點]。`

##### 英文模板
`A [subject] in [environment], with a [mood] atmosphere, lit by [lighting], shot with [camera], featuring [color palette] and [texture], composed in [composition], with subtle details such as [micro-details], in the style of [style anchors].`

##### 進階版
再加入權重與排序：
- 先主體
- 再場景
- 再鏡頭
- 再質感
- 最後風格

---

## 六、智慧功能

### 1. Prompt 品質檢查器
系統可以即時提醒：

- 你缺少光線描述
- 你沒有指定構圖
- 你選了太多風格
- 你的微細節太多
- 你的相機語言與插畫風格可能衝突

這個功能很有價值，因為它會讓 App 不只是生成器，而是「Prompt 教練」。

---

### 2. Prompt 強化按鈕
按鈕可以有：

- 幫我更電影感
- 幫我更寫實
- 幫我更夢幻
- 幫我更像插畫
- 幫我更乾淨精準
- 幫我縮短
- 幫我改成英文

---

### 3. 模板情境庫
使用者可以從情境快速開始：

- 人像攝影
- 產品攝影
- 海報設計
- 動漫場景
- 電影鏡頭
- 奇幻世界
- 台灣街景
- LINE 貼圖角色
- 古風人物
- 科幻城市

點進去後，先帶入預設桶內容。

---

### 4. 收藏與版本比較
使用者可：
- 收藏 Prompt
- 複製版本
- 比較 A / B Prompt 差異
- 看哪個版本加入了哪些細節

這很適合反覆調整。

---

## 七、建議頁面架構

建議使用 Flutter 的 `BottomNavigationBar` 來進行主要頁面切換：

### 1. 首頁 (Home Tab)
內容：
- 這個工具的快速介紹
- 建立新 Prompt (Floating Action Button)
- 推薦的模板入口 (以水平滑動的 Carousel 呈現)

### 2. Builder 頁面
主功能頁，採單頁長滾動或 PageView 分步設計。底部常駐 Prompt 預覽。

### 3. Templates 頁 (Templates Tab)
瀏覽各種場景模板的網格流 (GridView)。

### 4. 收藏與歷史 (Saved Tab)
收藏與歷史版本，支援左滑刪除、點擊重新編輯。

### 5. 學習區 (Learn Tab)
教使用者什麼是：
- 細節桶
- 相機語言
- 微細節
- 風格錨點

這會提升產品黏性。

---

## 八、適合的技術架構

### 前端 (Mobile)
- Flutter
- Dart
- Material 3 設計語言 / Cupertino 樣式

### 狀態管理
- Riverpod 或是 Bloc (適合處理複雜的表單狀態與即時預覽)
- 本地快取可使用 Hive 或 Isar 資料庫

### 後端
MVP 可先不用重後端，只做前端組裝。  
若要登入與收藏：
- Supabase
- Firebase

### AI 功能
若之後想升級，可以加入 LLM：
- 幫使用者把中文描述補成完整 Prompt
- 自動把 Prompt 翻成英文
- 自動檢查衝突與補強

---

## 九、MVP 版本該先做哪些

我建議第一版重點在驗證核心流程，先做這些：

### MVP 系統規格 (System Specifications)
- **支援平台**：Android 與 iOS 雙平台手機 (使用 Flutter 建置)。
- **本地運作 (Offline-first)**：MVP 版本暫不依賴後端 API，所有 Prompt 組裝邏輯與選項資料庫皆內建於 App 中，無需網路即可使用。
- **資料儲存**：App 當下編輯狀態暫存於記憶體，關閉 App 後重置 (本地資料庫預定於第二階段導入)。
- **效能與反應時間**：所有的 Tag 點擊與 Slider 調整，必須實現在 100ms 內即時更新 Bottom Sheet 的 Prompt 預覽。
- **介面語系**：操作介面以繁體中文為主，輸出的 Prompt 預覽提供中文與英文版本。

### MVP 核心功能
- 主體輸入 (支援鍵盤字串輸入)
- 細節桶選擇 (光線、氛圍、環境、色彩、材質、構圖)
- 相機語言選擇
- 微細節選擇
- 風格錨點選擇
- 即時組裝 Prompt (Bottom Sheet 預覽)
- 中日英文 Prompt 顯示切換
- 一鍵複製到手機剪貼簿

這樣已經能用了，而且很清楚。

### 第二階段
- 收藏
- 模板
- Prompt 品質檢查
- 強化按鈕
- Negative Prompt

### 第三階段
- 接圖像模型 API
- 直接生成圖片
- A/B 比較
- 圖像結果回饋學習

---

## 十、具體畫面草圖

### Builder 頁面概念

#### 頂部 / 步驟導航 (Stepper / TabBar)
可水平滑動切換的類別：
- 主題 | 場景 | 光線 | 氛圍 | 相機 | 色彩 | 材質 | 構圖 | 微細節 | 風格

#### 主內容區 (ScrollView / PageView)
依據頂部選中的類別顯示對應的卡片內容：
- 可點擊的 Chip / Tag 選項
- 支援長按拖曳排序 (ReorderableListView)
- 點擊「+」展開鍵盤自由輸入補充

#### 底部面板 (BottomSheet / Persistent Footer)

##### 預覽與操作面板 (上滑展開)

**短版**
> 雨夜街頭的年輕女劍士，霓虹紫光，35mm 低角度拍攝，平靜而神秘的氛圍，濕玻璃反射，細微高光與環境霧氣，寫實動漫風格。

**長版**
> A young female swordswoman standing on a rainy neon-lit street at night, calm yet mysterious atmosphere, soft purple neon lighting, shot on 35mm from a low angle, wet glass reflections, subtle highlights, ambient mist, realistic anime style.

按鈕排版 (橫向 Scroll 或 Grid)：
- 複製中文 (Copy to Clipboard)
- 複製英文
- 精簡
- 強化
- 匯出 JSON / 分享至其他 App (Share Panel)

---

## 十一、資料結構設計

可以用這種 JSON：

```json
{
  "subject": {
    "main": "年輕女劍士",
    "action": "站在屋頂回頭",
    "appearance": ["黑色長風衣", "皮革手套"],
    "props": ["發光長刀"]
  },
  "environment": ["雨夜街頭"],
  "lighting": ["柔和霓虹紫光", "體積光"],
  "mood": ["平靜", "神秘"],
  "camera": ["35mm", "低角度", "f1.4淺景深"],
  "color": ["冷藍紫"],
  "texture": ["濕玻璃", "光滑金屬"],
  "composition": ["三分法構圖"],
  "microDetails": ["細微高光", "環境霧氣", "膠片顆粒"],
  "styleAnchors": ["寫實動漫"],
  "negativePrompt": ["多餘手指", "模糊五官"]
}