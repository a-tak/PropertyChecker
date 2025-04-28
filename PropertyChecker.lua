-- メタデータ確認スクリプト

-- テーブルを再帰的に表示する関数
local function printTable(tbl, indent)
    indent = indent or ""
    
    -- テーブルでない場合は値をそのまま返す
    if type(tbl) ~= "table" then
        return tostring(tbl)
    end
    
    -- テーブルの各要素を表示
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(indent .. key .. ":")
            printTable(value, indent .. "  ")
        else
            -- nilの場合は「未設定」と表示
            local displayValue = value or "未設定"
            print(indent .. key .. ": " .. tostring(displayValue))
        end
    end
end

-- DaVinci Resolveの基本オブジェクトを取得
local resolve = Resolve()
local project = resolve:GetProjectManager():GetCurrentProject()
local mediaPool = project:GetMediaPool()
local folder = mediaPool:GetCurrentFolder()
local mediaItems = folder:GetClipList()

-- 各メディアアイテムのメタデータを表示
for _, mediaItem in ipairs(mediaItems) do
    print("\n=== クリップ名: " .. mediaItem:GetClipProperty("Clip Name") .. " ===")
    print("メディアタイプ: " .. mediaItem:GetClipProperty("Type"))
    print("フォーマット: " .. mediaItem:GetClipProperty("Format"))
    
    -- GetClipPropertyの情報を表示
    print("\n[GetClipPropertyの情報]")
    print("プロパティ一覧:")
    local properties = mediaItem:GetClipProperty()
    printTable(properties, "  ")
    
    -- GetMetadataの情報を表示
    print("\n[GetMetadataの情報]")
    print("メタデータ一覧:")
    local metadata = mediaItem:GetMetadata()
    printTable(metadata, "  ")
end
