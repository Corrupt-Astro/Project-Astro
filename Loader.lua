local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Loader Key",
   Icon = 0,
   LoadingTitle = "Key",
   LoadingSubtitle = "By Echo",
   ShowText = "Key",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "IN DISCORD",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"ALPHA"}
   }
})

local Tab = Window:CreateTab("Main", 4483362458)



--local Button = Tab:CreateButton({
--   Name = "Project Astro",
--   Callback = function()
   -- The function that takes place when the button is pressed
     -- loadstring(game:HttpGet("https://raw.githubusercontent.com/Corrupt-Astro/Project-Astro/refs/heads/main/Version/Version1.lua",true))()
         
--   end,
-- })

local Button = Tab:CreateButton({
   Name = "Origin Hub",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Corrupt-Astro/Origin-Hub/refs/heads/main/REHAX.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Doors",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Corrupt-Astro/Origin-Hub/refs/heads/main/MSHAX.lua",true))()
   end,
})

