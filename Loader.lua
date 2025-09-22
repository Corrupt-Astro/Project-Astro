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

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local Tab = Window:CreateTab("Main", 4483362458)

local Input = Tab:CreateInput({
   Name = "Key",
   CurrentValue = "",
   PlaceholderText = "Input Key",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      if Text == "Alpha" then
         Tab:CreateButton({
            Name = "Project Astro",
            Callback = function()
               loadstring(game:HttpGet("https://raw.githubusercontent.com/Corrupt-Astro/Project-Astro/refs/heads/main/Version/Version1.lua",true))()
               Rayfield:Destroy()
            end
         })
      end
   end
})


