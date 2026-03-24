class PromptData {
  static const Map<String, List<String>> categories = {
    '光線': [
      '柔和晨光', '霓虹紫光', '黃昏逆光', '月光', '室內暖光', '體積光', '強烈高反差',
      '頂光 (Top lighting)', '底光 (Underlighting)', '側光 (Side lighting)',
      '林間碎光 (Dappled light)', '聚光燈 (Spotlight)', '閃光燈效果 (Flash photography)',
      '螢光發光 (Fluorescent glow)', '燭光 (Candlelight)', '篝火光 (Campfire light)',
      '魔法發光 (Magical glow)', '螢火蟲微光 (Firefly glimmer)', '天井光 (Skylight)',
      '窗外透光 (Window light)', '陰天漫射光 (Overcast diffuse light)', '無影光 (Flat lighting)',
      '舞台絢爛光 (Stage lighting)', '全息投影光 (Holographic light)',
      '賽博龐克燈牌光 (Cyberpunk neon signage)', '水下折射光 (Underwater caustics)',
      '電弧閃電光 (Arc lightning)'
    ],
    '氛圍': [
      '平靜', '神秘', '冥想感', '緊張', '末日感', '浪漫', '壓迫感',
      '歡樂 (Joyful)', '孤獨 (Lonely)', '懷舊 (Nostalgic)', '史詩感 (Epic)',
      '詭異 (Eerie)', '夢幻 (Dreamy)', '迷幻 (Psychedelic)', 'Cyberpunk感 (Cyberpunk vibe)',
      '未來科技感 (Futuristic)', '宗教神聖感 (Sacred/Holy)', '戰爭殘酷感 (Gritty war)',
      '童話感 (Fairy tale)', '幽默搞笑 (Humorous)', '懸疑 (Suspenseful)',
      '生機盎然 (Vibrant/Lively)', '頹廢 (Decadent)', '溫馨 (Cozy)', '狂熱 (Frenetic)',
      '冰冷疏離 (Cold and detached)', '憂鬱 (Melancholic)'
    ],
    '環境': [
      '雨夜街頭', '廢棄工廠', '森林', '日式房間', '太空站', '古老圖書館', '夜市',
      '沙漠綠洲 (Desert oasis)', '冰川裂隙 (Glacier crevasse)', '賽博龐克酒吧 (Cyberpunk bar)',
      '歐式古堡 (European castle)', '水下遺跡 (Underwater ruins)', '雲端神殿 (Cloud temple)',
      '魔幻結晶洞穴 (Crystal cave)', '蒸氣龐克鐘樓 (Steampunk clocktower)', '異星地表 (Alien surface)',
      '繁華商業街 (Busy commercial street)', '傳統中國茶館 (Traditional Chinese teahouse)',
      '現代極簡辦公室 (Minimalist modern office)', '擁擠地鐵車廂 (Crowded subway car)',
      '二戰戰壕 (WWII trench)', '鬼屋廢墟 (Haunted mansion ruins)', '天空浮島 (Floating islands)',
      '巨型機器人內部 (Inside a giant mecha)', '喧囂傳統市場 (Bustling traditional market)',
      '寧靜海灘 (Tranquil beach)', '無盡迷宮 (Infinite labyrinth)'
    ],
    '色彩': [
      '冷藍灰', '暖橘金', '高彩度', '黑金', '粉紫夢幻', '墨綠復古',
      '褪色復古 (Faded retro)', '黑白對比 (High-contrast B&W)', '單色調 (Monochrome)',
      '霓虹撞色 (Neon color clash)', '電影橙青調 (Teal and Orange)', '低飽和莫蘭迪色 (Morandi colors)',
      '螢光毒性綠 (Toxic neon green)', '深紅血色調 (Blood red tones)', '冰川冷藍調 (Glacial blue tones)',
      '金箔奢華色 (Gold foil luxury)', '迷幻漸層 (Psychedelic gradients)', '深海幽藍 (Deep sea blue)',
      '賽博龐克紫紅 (Cyberpunk magenta)', '大地泥土色 (Earthy tones)', '柔和粉彩 (Pastel colors)',
      '哥德暗黑調 (Gothic dark)', '賽璐璐鮮豔色 (Cel-shaded vibrant)', '晚霞火燒雲 (Sunset gradient)',
      '銀灰科技色 (Silver tech)', '毒蘑菇斑斕色 (Poisonous vibrant)'
    ],
    '材質': [
      '濕玻璃', '光滑金屬', '粗糙石牆', '天鵝絨', '木紋', '陶瓷', '鏽蝕表面',
      '碳纖維 (Carbon fiber)', '毛線編織 (Knitted wool)', '半透明磨砂 (Frosted glass/plastic)',
      '飄逸絲綢 (Flowing silk)', '爬蟲類鱗片 (Reptile scales)', '機甲外殼 (Mecha armor plating)',
      '冰塊晶體 (Ice crystals)', '水晶折射 (Refractive crystal)', '黏稠液體 (Viscous slime)',
      '皺褶紙張 (Crumpled paper)', '粗糙油畫布 (Rough canvas)', '柔軟皮革 (Soft leather)',
      '熔岩流動 (Flowing lava)', '老舊羊皮紙 (Aged parchment)', '柔軟羽毛 (Soft feathers)',
      '長毛絨布 (Plush fur)', '全息投影干擾 (Holographic glitch)', 'Q彈果凍質感 (Jelly texture)',
      '斑駁掉漆 (Peeling paint)', '蜂巢結構 (Honeycomb structure)'
    ],
    '構圖': [
      '低角度', '居中對稱', '特寫', '半身', '全身', '遠景', '前景遮擋', '三分法構圖',
      '俯視角 (God\'s eye view)', '荷蘭角 (Dutch angle / 斜角)', '魚眼透視 (Fisheye perspective)',
      '超微距 (Extreme macro)', '大遠景 (Extreme long shot)', '背影 (From behind)',
      '越肩視角 (Over the shoulder)', '景深引導線 (Leading lines with DoF)', '畫中畫 (Framing within a frame)',
      '對角線構圖 (Diagonal composition)', '黃金螺旋構圖 (Golden ratio / Fibonacci spiral)',
      '幾何切割 (Geometric division)', '上下倒置 (Upside down)', '鳥瞰 (Bird\'s-eye view)',
      '蟲瞳視角 (Worm\'s-eye view)', '第一人稱視角 (First-person POV)',
      '雙人對峙/鏡像構圖 (Symmetrical standoff)', '極端特寫 (Extreme close-up)',
      '動態模糊追焦 (Panning with motion blur)', '大面積留白 (Negative space)'
    ],
    '相機': [
      '35mm 膠片', '50mm 人像', '微距特寫', 'f1.4 淺景深', '長焦壓縮',
      '變形鏡頭', '運動模糊', '手持攝影感', '鏡頭光暈', 'cinematic shot'
    ],
    '微細節': [
      '灰塵顆粒', '細小刮痕', '膠片顆粒', '柔和光暈', '細微高光', '環境霧氣',
      '冰冷反射', '指紋痕跡', '磨損邊緣', '皮膚細節', '布料纖維', '水珠附著'
    ],
    '風格': [
      '吉卜力感', '寫實動漫', '韋斯安德森式對稱', '皮克斯感', '文藝復興油畫',
      '超寫實攝影', '賽博龐克黑色電影感', '雜誌時尚大片', '復古底片感', '插畫海報風'
    ]
  };
}
