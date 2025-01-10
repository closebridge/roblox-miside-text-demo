print("Running")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local textSize = 40 -- TODO: Add ability to dynamically change text size based on length of the text

-- Strategies: 


-- 0: Display, format, render, text in 2D on user's screen 
-- (Fixed if Placement is 0) (DON'T USE 2D TEXT IF NOT 0)
-- (Must add text piece by piece, or else the 4th step would be impossible)

-- 1: Format, append 3D mesh text to target
-- (Fixed to player's screen (move, rotation, facing direction) until EndStyle)
-- 2: Apply physics slowly (from start to end) (EndStyle)

local mainText = workspace.textRepo

type PrepTable = {
	Text: string,
	Gradient: {
		ColorSequence1: table,
		ColorSequence2: table
	} | nil,

	-- 0: Player, 1: Character, 2: Object
	Placement: number,
	Character: string?, -- If Placement is 1
	billboardAppearance: boolean,

	textXGap: number?,
	textYGap: number?,

	-- 0: Normal (on sine), 1: Crazy, 2: Creepy, 3...
	AppearStyle: number,
	AppearSpeed: number | nil,

	-- 0: Normal, 1: Explode, 2: Gradually, 3...
	EndStyle: number,
	flatTextLocation: Instance

}

function main(input: PrepTable)
	local function separateText(input: string)
		local result = {}
		for i = 1, #input do
			table.insert(result, input:sub(i, i))
		end
		return result
	end
	local breakupText = separateText(input.Text)
		
	if not input.AppearSpeed then
		input.AppearSpeed = 0.03
	end

	displayText3D(input, breakupText, {})

	
	-- local success, fail = pcall(function()
	-- 	if input.Placement == 0 then
	-- 		local breakLocation = displayText2D(input, breakupText) -- Run displayText2D if textPrep.Placement is 1
	-- 		displayText3D(input, breakupText, breakLocation)
	-- 	elseif input.Placement >= 1 then
	-- 		displayText3D(input, breakupText, false)
	-- 	end
	-- end)
	
	-- if success then
	-- 	print("displayText finished!")
	-- else
	-- 	print("displayText failed!❌ \n\n".. fail)
	-- end

	return true
end

function displayText2D(prepTable: PrepTable, textArray: table)
	--print("running > displayText2D")
	--print(prepTable)
	--print(textArray)
	
	local textContainer = Instance.new("ScreenGui")
	local frameParent = Instance.new("Frame")
	local __text = Instance.new("TextLabel")
	local __gradient = Instance.new("UIGradient")
	
	textContainer.Name = "textContainer"
	
	-- Formatting text
	-- TODO: Add more flexibility to create text's color style (For now it's using gradient_ungroup_0)
	if not prepTable.Gradient then
		__gradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(0.768627, 0.321569, 0.443137)),
			ColorSequenceKeypoint.new(1, Color3.new(0.427451, 0.494118, 0.784314))
		})
	else
		__gradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(prepTable.Gradient.ColorSequence1)),
			ColorSequenceKeypoint.new(1, Color3.new(prepTable.Gradient.ColorSequence2))
		})
	end
	__gradient.Rotation = 90
	
	-- TODO: Make text display to other character (For now it's only display to Player)
	frameParent.Size = UDim2.new(0.979, 0,0.346, 0)
	frameParent.Name = "frameParent"
	frameParent.Position = UDim2.new(0.01, 0, 0.599, 0)
	frameParent.BackgroundTransparency = 1
	frameParent.BorderSizePixel = 0
	frameParent.Parent = textContainer
	
	-- TODO: Duplicate 2nd __text and use that as an outline 
	-- (set inner color to transparent, and add white outline)
	__text.Position = UDim2.new(0.01, 0,0, 0)
	__text.Size = UDim2.new(0.979, 0, 0.346, 0) -- TODO: Dynamically change size of container's size if the text is long
	__text.Font = Enum.Font.Roboto
	__text.FontFace = Font.new('rbxasset://fonts/families/Roboto.json', Enum.FontWeight.Bold, Enum.FontStyle.Normal)

	__text.Name = 'currentText'
	__text.TextWrapped = true
	__text.TextScaled = false
	__text.TextWrapped = true
	__text.ZIndex = 2
	__text.TextDirection = "LeftToRight"
	__text.TextStrokeTransparency = 1
	__text.TextColor3 = Color3.new(255,255,255)
	__text.BackgroundTransparency = 1
	__text.TextSize = textSize -- TODO: Add ability to dynamically change text size based on length of the text
	
	local __outline = __text:Clone()
	__outline.Name = 'currentOutlineText'
	__outline.TextXAlignment = "Center"
	__outline.TextStrokeTransparency = 0
	__outline.TextStrokeColor3 = Color3.new(1, 1, 1)
	__outline.ZIndex = 1
	
	__text.Text = ''
	__outline.Text = ''
	
	textContainer.Parent = PlayerGui
	
	
	local breakLocation: table = {}
	local function textToFlow(input: PrepTable)
		
		local currentTextBlock = __text:Clone()
		local currentOutlineBlock = __outline:Clone()
		local currentNest = Instance.new("Frame")
		currentNest.Size = UDim2.new(0.979, 0, 1, 0)
		currentNest.Position = UDim2.new(0.01, 0, 0, 0)
		currentNest.BackgroundTransparency = 1
		
		local currentTextTest = currentTextBlock:Clone()
		currentTextTest.Name = "currentTextTest"
		currentTextTest.TextTransparency = 1
		currentTextTest.Parent = currentNest
		
		currentTextBlock.TextXAlignment = "Left"
		currentOutlineBlock.TextXAlignment = "Left"
		
		__gradient:Clone().Parent = currentTextBlock
		
		currentTextBlock.Parent = currentNest
		currentOutlineBlock.Parent = currentNest
		currentTextTest.Parent = currentNest

		currentTextBlock.Parent = currentNest
		currentOutlineBlock.Parent = currentNest
		
		currentNest.Parent = frameParent
		currentNest.Name = ''
		
		local i = 1
		local textFitCheck
		while i <= #textArray do
			task.wait(prepTable.AppearSpeed)
			print(i, textArray[i])
			currentTextTest.Text = currentTextTest.Text .. textArray[i]
			textFitCheck = currentTextTest.TextFits
			
			-- Clone, clean inner text and reuse that (if !TextFits)
			if not textFitCheck then
				local previousNestPosition = currentNest.Position
				
				currentNest = currentNest:Clone()
				currentNest.Parent = frameParent
				currentNest.Name = ''
				currentTextBlock = currentNest:WaitForChild("currentText")
				currentOutlineBlock = currentNest:WaitForChild("currentOutlineText")
				currentTextTest = currentNest:WaitForChild("currentTextTest")
				
				currentTextBlock.Text = ''
				currentOutlineBlock.Text = ''
				currentTextTest.Text = ''
				
				currentTextBlock.TextXAlignment = 'Center'
				currentOutlineBlock.TextXAlignment = 'Center'
				currentTextTest.TextXAlignment = 'Center'
				
				currentNest.Position = UDim2.new(
					previousNestPosition.X.Scale,
					previousNestPosition.X.Offset,
					previousNestPosition.Y.Scale,
					previousNestPosition.Y.Offset + textSize
				)
				i -= 1
				table.insert(breakLocation, i)
				textFitCheck = true
			else -- Append text normally
				currentTextBlock.Text = currentTextBlock.Text .. textArray[i]
				currentOutlineBlock.Text = currentOutlineBlock.Text .. textArray[i]
				currentNest.Name = currentNest.Name .. textArray[i]
				i += 1
			end
		end
	end
	textToFlow(prepTable) -- TODO: Return from2DText table {i1, i2, i3...}
	return breakLocation
end

function displayText3D(prepTable: PrepTable, textArray: table, breakLocation: table)
	-- Strat:

	-- 1. Duplicate 3D text from table
	-- 2. Add SurfaceGUI, Frame, TextLabel and UIGradient to the mesh of the text (Must be using Robotic - Black font)
	-- (Get location of 2D text, and append to that place)
	-- (OR append to requested character/location)
	-- 2: Apply physics slowly (from start to end) (EndStyle)

	if not prepTable.flatTextLocation then
		error("prepTable components not met the requirement.")
	elseif #breakLocation == 0 then
		warn('breakLocation empty, text mesh will dynamically add \"n on flatTextLocations brickSize')
		breakLocation = false
	end

	local flatTextLocation = prepTable.flatTextLocation
	local textMeshNest = workspace:WaitForChild('textRepo')
	local textMeshStorage = {
		["A"] = textMeshNest.uppercase:WaitForChild("Meshes_up__A"),
		-- ["B"] = textMeshNest.uppercase:WaitForChild("Meshes_up__B"),
		["C"] = textMeshNest.uppercase:WaitForChild("Meshes_up__C"),
		-- ["D"] = textMeshNest.uppercase:WaitForChild("Meshes_up__D"),
		-- ["E"] = textMeshNest.uppercase:WaitForChild("Meshes_up__E"),
		["F"] = textMeshNest.uppercase:WaitForChild("Meshes_up__F"),
		-- ["G"] = textMeshNest.uppercase:WaitForChild("Meshes_up__G"),
		["H"] = textMeshNest.uppercase:WaitForChild("Meshes_up__H"),
		-- ["I"] = textMeshNest.uppercase:WaitForChild("Meshes_up__I"),
		-- ["J"] = textMeshNest.uppercase:WaitForChild("Meshes_up__J"),
		["K"] = textMeshNest.uppercase:WaitForChild("Meshes_up__K"),
		["L"] = textMeshNest.uppercase:WaitForChild("Meshes_up__L"),
		["M"] = textMeshNest.uppercase:WaitForChild("Meshes_up__M"),
		-- ["N"] = textMeshNest.uppercase:WaitForChild("Meshes_up__N"),
		-- ["O"] = textMeshNest.uppercase:WaitForChild("Meshes_up__O"),
		-- ["P"] = textMeshNest.uppercase:WaitForChild("Meshes_up__P"),
		-- ["Q"] = textMeshNest.uppercase:WaitForChild("Meshes_up__Q"),
		-- ["R"] = textMeshNest.uppercase:WaitForChild("Meshes_up__R"),
		-- ["S"] = textMeshNest.uppercase:WaitForChild("Meshes_up__S"),
		-- ["T"] = textMeshNest.uppercase:WaitForChild("Meshes_up__T"),
		-- ["U"] = textMeshNest.uppercase:WaitForChild("Meshes_up__U"),
		-- ["V"] = textMeshNest.uppercase:WaitForChild("Meshes_up__V"),
		["W"] = textMeshNest.uppercase:WaitForChild("Meshes_up__W"),
		-- ["X"] = textMeshNest.uppercase:WaitForChild("Meshes_up__X"),
		-- ["Y"] = textMeshNest.uppercase:WaitForChild("Meshes_up__Y"),
		["Z"] = textMeshNest.uppercase:WaitForChild("Meshes_up__Z"),


		["a"] = textMeshNest.lowercase.Meshes_low__a,
		["b"] = textMeshNest.lowercase.Meshes_low__b,
		-- ["c"] = textMeshNest.lowercase.Meshes_low__c,
		["d"] = textMeshNest.lowercase.Meshes_low__d,
		["e"] = textMeshNest.lowercase.Meshes_low__e,
		-- ["f"] = textMeshNest.lowercase.Meshes_low__f,
		["g"] = textMeshNest.lowercase.Meshes_low__g,
		-- ["h"] = textMeshNest.lowercase.Meshes_low__h,
		["i"] = textMeshNest.lowercase.Meshes_low__i,
		["j"] = textMeshNest.lowercase.Meshes_low__j,
		-- ["k"] = textMeshNest.lowercase.Meshes_low__k,
		["l"] = textMeshNest.lowercase.Meshes_low__l,
		-- ["m"] = textMeshNest.lowercase.Meshes_low__m,
		["n"] = textMeshNest.lowercase.Meshes_low__n,
		["o"] = textMeshNest.lowercase.Meshes_low__o,
		-- ["p"] = textMeshNest.lowercase.Meshes_low__p,
		["q"] = textMeshNest.lowercase.Meshes_low__q,
		-- ["r"] = textMeshNest.lowercase.Meshes_low__r,
		["s"] = textMeshNest.lowercase.Meshes_low__s,
		["t"] = textMeshNest.lowercase.Meshes_low__t,
		-- ["u"] = textMeshNest.lowercase.Meshes_low__u,
		["v"] = textMeshNest.lowercase.Meshes_low__v,
		-- ["w"] = textMeshNest.lowercase.Meshes_low__w,
		["x"] = textMeshNest.lowercase.Meshes_low__x,
		["y"] = textMeshNest.lowercase.Meshes_low__y,
		-- ["z"] = textMeshNest.lowercase.Meshes_low__z,


		["0"] = textMeshNest.number.Meshes__zero,
		["1"] = textMeshNest.number.Meshes__one,
		["2"] = textMeshNest.number.Meshes__two,
		["3"] = textMeshNest.number.Meshes__three,
		["4"] = textMeshNest.number.Meshes__four,
		["5"] = textMeshNest.number.Meshes__five,
		-- ["6"] = textMeshNest.number.Meshes__six, -- Exist
		["7"] = textMeshNest.number.Meshes__seven,
		["8"] = textMeshNest.number.Meshes__eight,
		["9"] = textMeshNest.number.Meshes__nine,


		["!"] = textMeshNest.symbol.Meshes__exclamation,
		["\""] = textMeshNest.symbol.Meshes__quote,
		["#"] = textMeshNest.symbol.Meshes__hashtag,
		-- ["$"] = textMeshNest.symbol.Meshes__dollar, -- Exist
		["%"] = textMeshNest.symbol.Meshes__percent,
		-- ["&"] = textMeshNest.symbol.Meshes__ampersand, -- Exist
		-- ["'"] = textMeshNest.symbol.Meshes__apostrophe, -- Exist
		["("] = textMeshNest.symbol.Meshes__left_parenthesis,
		[")"] = textMeshNest.symbol.Meshes__right_parenthesis,
		["*"] = textMeshNest.symbol.Meshes__asterisk,
		["+"] = textMeshNest.symbol.Meshes__plus,
		[","] = textMeshNest.symbol.Meshes__comma,
		-- ["-"] = textMeshNest.symbol.Meshes__hyphen,
		-- ["."] = textMeshNest.symbol.Meshes__period,
		-- ["/"] = textMeshNest.symbol.Meshes__slash, -- Exist
		[":"] = textMeshNest.symbol.Meshes__colon,
		[";"] = textMeshNest.symbol.Meshes__semicolon,
		["<"] = textMeshNest.symbol.Meshes__less_than,
		-- ["="] = textMeshNest.symbol.Meshes__equals, -- Exist
		[">"] = textMeshNest.symbol.Meshes__greater_than,
		-- ["?"] = textMeshNest.symbol.Meshes__question,
		["@"] = textMeshNest.symbol.Meshes__at,
		-- ["["] = textMeshNest.symbol.Meshes__left_bracket,
		["\\"] = textMeshNest.symbol.Meshes__backslash,
		-- ["]"] = textMeshNest.symbol.Meshes__right_bracket,
		["^"] = textMeshNest.symbol.Meshes__caret,
		["_"] = textMeshNest.symbol.Meshes__underscore,
		-- ["`"] = textMeshNest.symbol.Meshes__grave,
		-- ["{"] = textMeshNest.symbol.Meshes__left_brace,
		-- ["|"] = textMeshNest.symbol.Meshes__vertical_bar, -- Exist
		-- ["}"] = textMeshNest.symbol.Meshes__right_brace,
		-- ["~"] = textMeshNest.symbol.Meshes__tilde,
		[" "] = textMeshNest.symbol.Meshes__whitespace
	}

	local lineSeparatorTable: table = {}
	local lstCount = 1
	local setLTSCount = function(lineNest)
		lineSeparatorTable[lstCount] = lineNest
		lstCount += 1
	end

	local lineNest: Instance
	local function newLineNest()
		lineNest = Instance.new('Part')
		lineNest.Parent = flatTextLocation
		lineNest.Name = ''
		lineNest.Anchored = true
		lineNest.CanCollide = false
		lineNest.CanTouch = false
		lineNest.Transparency = 1
		lineNest.Position = Vector3.new(flatTextLocation.Position.X - (flatTextLocation.Size.X / 2), flatTextLocation.Position.Y, flatTextLocation.Position.Z)
		return lineNest
	end
	
	newLineNest()
	setLTSCount(lineNest)

	
	print(#textArray)
	local i = 1
	local previousTextMesh: Instance
	local cachedTextMesh: table = {}
	local textFitX: number = 0

	while i <= #textArray do
		task.wait(prepTable.AppearSpeed)

		local currentTextMesh: Instance
		local success, fail = pcall(function()
			if cachedTextMesh[textArray[i]] then
				-- print('💾 using mesh from cached table')
				currentTextMesh = cachedTextMesh[textArray[i]]
			else
				-- print('💽 new instance, fetching')
				currentTextMesh = textMeshStorage[textArray[i]]
				if currentTextMesh then
					cachedTextMesh[textArray[i]] = currentTextMesh
				else
					error('no mesh found within storage')
				end
			end
		end)
		if not success then
			print('cache failed to save instance ❌\n\n' .. fail)
		end

		-- print('\n\n')
		-- print(currentTextMesh)
		-- print(textArray[i])
		-- print('\n\n')

		local breakLocResult, _ = pcall(function()
			return breakLocation[i]
		end)

		-- print("textFitX: " .. textFitX)
		-- print("flatTextLocation " .. flatTextLocation.Size.X)
		if breakLocResult or textFitX >= flatTextLocation.Size.X then
			local oldLineNest: Instance = lineNest
			local newLineNest: Instance = newLineNest()
			newLineNest.Position = Vector3.new(oldLineNest.Position.X, oldLineNest.Position.Y - (oldLineNest.Size.Y + prepTable.textYGap), oldLineNest.Position.Z)
			lineNest = newLineNest
			textFitX = 0
			setLTSCount(lineNest) -- FIX: Text not properly aligned center
		else
			-- print('no breakline')
		end

		lineNest.Name = lineNest.Name .. textArray[i]
		currentTextMesh = currentTextMesh:Clone()
		currentTextMesh.Name = textArray[i] .. i

		if i == 1 then
			currentTextMesh.Position = Vector3.new(
				-- prepTable.flatTextLocation.Position.X + prepTable.textXGap,
				lineNest.Position.X,
				lineNest.Position.Y,
				lineNest.Position.Z
			)
		else
			currentTextMesh.Position = Vector3.new(
				-- prepTable.flatTextLocation.Position.X + prepTable.textXGap,
				previousTextMesh.Position.X + currentTextMesh.Size.X + prepTable.textXGap,

				lineNest.Position.Y,
				lineNest.Position.Z
			)
		end
		
		textFitX = textFitX + (currentTextMesh.Size.X + prepTable.textXGap)
		previousTextMesh = currentTextMesh
		currentTextMesh.Parent = lineNest
		i += 1
	end

	task.wait(3) -- TODO: Make this dynamically change based on text length
	
	-- TODO: Make text fell with EndStyle
	for i0, value in ipairs(lineSeparatorTable) do
		task.wait(prepTable.AppearSpeed)
		local vLST = lineSeparatorTable[i0]:GetChildren()
		for i1, innerLSTValue in ipairs(vLST) do
			task.wait(prepTable.AppearSpeed)
			innerLSTValue.Anchored = false
		end
	end
end


main({
	Text = "AAAaaaaAAAAAA",
	-- Gradient = {
	-- 	Gradient1 = {0.768627, 0.321569, 0.443137},
	-- 	Gradient2 = {0.427451, 0.494118, 0.784314}
	-- },
	Gradient = nil,
	Placement = 2,
	Character = 'Player',
	AppearStyle = 0,
	AppearSpeed = 0.1, -- The default is 0.03
	textXGap = 0.2,
	textYGap = 0.5,
	EndStyle = 0,
	flatTextLocation = workspace:WaitForChild('flatTextLocation_Test')
})
