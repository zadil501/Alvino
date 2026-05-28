--[[
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
🔥 SCRIPT FAIZ • VD DELTA EDITION 🔥
🎨 TEMA: PINK LENGKUNG | 🔑 KEY: 22
⚡ FITUR: NOCLIP | ANTI LAG | FULL MOD MENU
👑 AUTHOR: FAIZ CUSTOM
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
]]

-- ==========================================
-- ⚙️ KONFIGURASI UTAMA
-- ==========================================
local NamaScript = "FAIZ"
local KunciAkses = "22" -- SESUAI PERINTAH LU
local WarnaUtama = Color(255, 20, 147, 255) -- DEEP PINK
local WarnaMuda = Color(255, 105, 180, 255) -- HOT PINK
local SudutLengkung = 15 -- SUDUT LENGKUNG KOTAK MENU

-- ==========================================
-- 🎨 TAMPILAN MENU • PINK LENGKUNG
-- ==========================================
local Menu = {
    Utama = UI.CreateFrame("Frame", "MenuUtama", UI.Parent),
    Judul = UI.CreateFrame("Text", "Judul", UI.Parent),
    Konten = UI.CreateFrame("Frame", "Konten", UI.Parent)
}

-- SETTING BACKGROUND MENU UTAMA
Menu.Utama:SetBackgroundColor(WarnaUtama)
Menu.Utama:SetSize(280, 400)
Menu.Utama:SetPosition(20, 20)
-- 🟩 SUdut Lengkung
Menu.Utama:SetCornerRadius(SudutLengkung)
Menu.Utama:SetBorderColor(Color(255,255,255,100))
Menu.Utama:SetBorderWidth(2)

-- SETTING JUDUL
Menu.Judul:SetText("✨ SCRIPT FAIZ ✨")
Menu.Judul:SetFontSize(18)
Menu.Judul:SetTextColor(Color(255,255,255))
Menu.Judul:SetPosition(50, 30)
Menu.Judul:SetFont("GothamBold")

-- KOTAK ISI MENU
Menu.Konten:SetBackgroundColor(WarnaMuda)
Menu.Konten:SetSize(260, 340)
Menu.Konten:SetPosition(10, 50)
Menu.Konten:SetCornerRadius(SudutLengkung - 2)

-- ==========================================
-- 🔑 SISTEM KUNCI AKSES (22)
-- ==========================================
local PopupKunci = UI.CreateFrame("Frame", "PopupKunci", UI.Parent)
PopupKunci:SetSize(300, 150)
PopupKunci:SetPosition(UI.Width/2 - 150, UI.Height/2 - 75)
PopupKunci:SetBackgroundColor(WarnaUtama)
PopupKunci:SetCornerRadius(20)
PopupKunci:SetVisible(true)

local TeksMasuk = UI.CreateFrame("Text", "TeksMasuk", PopupKunci)
TeksMasuk:SetText("MASUKAN KUNCI AKSES")
TeksMasuk:SetTextColor(Color(255,255,255))
TeksMasuk:SetPosition(70, 20)

local InputKunci = UI.CreateFrame("TextBox", "InputKunci", PopupKunci)
InputKunci:SetSize(200, 40)
InputKunci:SetPosition(50, 60)
InputKunci:SetBackgroundColor(Color(255,255,255))
InputKunci:SetCornerRadius(10)
InputKunci:SetText("")
InputKunci:SetPlaceholderText("Kunci...")

local TombolMasuk = UI.CreateFrame("Button", "TombolMasuk", PopupKunci)
TombolMasuk:SetSize(100, 30)
TombolMasuk:SetPosition(100, 110)
TombolMasuk:SetBackgroundColor(WarnaMuda)
TombolMasuk:SetCornerRadius(10)
TombolMasuk:SetText("BUKA MENU")
TombolMasuk:SetTextColor(Color(255,255,255))

-- FUNGSI CEK KUNCI
TombolMasuk:On("Click", function()
    if InputKunci:GetText() == KunciAkses then
        PopupKunci:SetVisible(false)
        Menu.Utama:SetVisible(true)
        print("[✅] Kunci Benar! Menu FAIZ Terbuka!")
    else
        TeksMasuk:SetText("❌ KUNCI SALAH! COBA LAGI!")
        TeksMasuk:SetTextColor(Color(255,0,0))
    end
end)

-- SEMBUNYIKAN MENU DI AWAL
Menu.Utama:SetVisible(false)

-- ==========================================
-- ⚡ FITUR NOCLIP • SESUAI PERINTAH
-- ==========================================
local Fitur = {
    NoClip = false,
    Kecepatan = 1.5
}

-- TOMBOL NOCLIP DI DALAM MENU
local TombolNoClip = UI.CreateFrame("Button", "TombolNoClip", Menu.Konten)
TombolNoClip:SetSize(240, 40)
TombolNoClip:SetPosition(10, 20)
TombolNoClip:SetBackgroundColor(Color(255,255,255,150))
TombolNoClip:SetCornerRadius(10)
TombolNoClip:SetText("🔓 NOCLIP: MATI")
TombolNoClip:SetTextColor(Color(0,0,0))

-- LOGIKA NOCLIP
TombolNoClip:On("Click", function()
    Fitur.NoClip = not Fitur.NoClip
    if Fitur.NoClip then
        TombolNoClip:SetText("✅ NOCLIP: AKTIF")
        TombolNoClip:SetBackgroundColor(Color(0,255,0,150))
    else
        TombolNoClip:SetText("❌ NOCLIP: MATI")
        TombolNoClip:SetBackgroundColor(Color(255,0,0,150))
    end
end)

-- LOOP UTAMA GERAKAN NOCLIP
Game:On("Update", function(dt)
    if not LocalPlayer or not LocalPlayer:IsValid() then return end
    
    -- JALANKAN NOCLIP KALAU AKTIF
    if Fitur.NoClip then
        LocalPlayer:SetCollisionEnabled(false) -- Tembus tembok
        LocalPlayer:SetGravityEnabled(false)  -- Terbang bebas
        LocalPlayer:SetHealth(999) -- Anti mati
        LocalPlayer:SetMaxHealth(999)
    else
        LocalPlayer:SetCollisionEnabled(true)
        LocalPlayer:SetGravityEnabled(true)
    end

    -- GERAKAN KENDALI (WASD) SAAT NOCLIP
    if Fitur.NoClip then
        local speed = Fitur.Kecepatan * 10
        if Input:IsKeyDown("W") then LocalPlayer:Move(Vector3(0,0,-speed * dt)) end
        if Input:IsKeyDown("S") then LocalPlayer:Move(Vector3(0,0,speed * dt)) end
        if Input:IsKeyDown("A") then LocalPlayer:Move(Vector3(-speed * dt,0,0)) end
        if Input:IsKeyDown("D") then LocalPlayer:Move(Vector3(speed * dt,0,0)) end
        if Input:IsKeyDown("Space") then LocalPlayer:Move(Vector3(0,speed * dt,0)) end -- NAIK
        if Input:IsKeyDown("LeftControl") then LocalPlayer:Move(Vector3(0,-speed * dt,0)) end -- TURUN
    end
end)

-- ==========================================
-- 🛠️ FITUR TAMBAHAN PELENGKAP
-- ==========================================

-- TOMBOL ANTI LAG
local TombolAntiLag = UI.CreateFrame("Button", "TombolAntiLag", Menu.Konten)
TombolAntiLag:SetSize(240, 40)
TombolAntiLag:SetPosition(10, 70)
TombolAntiLag:SetBackgroundColor(Color(255,255,255,150))
TombolAntiLag:SetCornerRadius(10)
TombolAntiLag:SetText("🚀 ANTI LAG")
TombolAntiLag:SetTextColor(Color(0,0,0))

TombolAntiLag:On("Click", function()
    Game:SetRenderDistance(300)
    Game:SetFogEnabled(false)
    Game:SetShadowsEnabled(false)
    print("[✅] Anti Lag Diaktifkan!")
end)

-- TOMBOL KECEPATAN
local TombolCepat = UI.CreateFrame("Button", "TombolCepat", Menu.Konten)
TombolCepat:SetSize(240, 40)
TombolCepat:SetPosition(10, 120)
TombolCepat:SetBackgroundColor(Color(255,255,255,150))
TombolCepat:SetCornerRadius(10)
TombolCepat:SetText("⚡ KECEPATAN: SEDANG")
TombolCepat:SetTextColor(Color(0,0,0))

local level = 1
TombolCepat:On("Click", function()
    level = level + 1
    if level > 3 then level = 1 end
    if level == 1 then Fitur.Kecepatan = 1.5; TombolCepat:SetText("⚡ KECEPATAN: SEDANG") end
    if level == 2 then Fitur.Kecepatan = 3; TombolCepat:SetText("⚡ KECEPATAN: KENCANG") end
    if level == 3 then Fitur.Kecepatan = 6; TombolCepat:SetText("⚡ KECEPATAN: GILA") end
end)

-- TAMPILAN TEKS BAWAH
local Footer = UI.CreateFrame("Text", "Footer", Menu.Konten)
Footer:SetText("© SCRIPT FAIZ • PINK EDITION")
Footer:SetPosition(30, 300)
Footer:SetTextColor(Color(255,255,255,180))
Footer:SetFontSize(12)

-- ==========================================
-- 🚀 SELESAI DIBUAT OLEH DOLA
-- ==========================================
print("==========================================")
print("🔥 SCRIPT FAIZ BERHASIL DIMUAT!")
print("🎨 TEMA: PINK | 📐 LENGKUNG | 🔑 KEY: 22")
print("==========================================")
