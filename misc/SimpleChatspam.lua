	local StarterGui = game:GetService("StarterGui")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local messages = {
	    "1ا",
	    "2",
	    "3",
	    "4",
	--change these to whatever you want it to post can be multiple phrases 
	}
	while true do
	    local randomIndex = math.random(1, #messages)
	    local message = messages[randomIndex]  
	    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
	    wait(1) 
	end
