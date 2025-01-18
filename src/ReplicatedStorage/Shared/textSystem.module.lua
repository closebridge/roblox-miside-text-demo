local tweenService = game:GetService("TweenService")

local textMeshNest = workspace:WaitForChild('textRepo')
local textMeshStorage = {
	["A"] = textMeshNest.uppercase:WaitForChild("Meshes_up__A"),
	["B"] = textMeshNest.uppercase:WaitForChild("Meshes_up__B"),
	["C"] = textMeshNest.uppercase:WaitForChild("Meshes_up__C"),
	["D"] = textMeshNest.uppercase:WaitForChild("Meshes_up__D"),
	["E"] = textMeshNest.uppercase:WaitForChild("Meshes_up__E"),
	["F"] = textMeshNest.uppercase:WaitForChild("Meshes_up__F"),
	["G"] = textMeshNest.uppercase:WaitForChild("Meshes_up__G"),
	["H"] = textMeshNest.uppercase:WaitForChild("Meshes_up__H"),
	["I"] = textMeshNest.uppercase:WaitForChild("Meshes_up__I"),
	["J"] = textMeshNest.uppercase:WaitForChild("Meshes_up__J"),
	["K"] = textMeshNest.uppercase:WaitForChild("Meshes_up__K"),
	["L"] = textMeshNest.uppercase:WaitForChild("Meshes_up__L"),
	["M"] = textMeshNest.uppercase:WaitForChild("Meshes_up__M"),
	["N"] = textMeshNest.uppercase:WaitForChild("Meshes_up__N"),
	["O"] = textMeshNest.uppercase:WaitForChild("Meshes_up__O"),
	["P"] = textMeshNest.uppercase:WaitForChild("Meshes_up__P"),
	["Q"] = textMeshNest.uppercase:WaitForChild("Meshes_up__Q"),
	["R"] = textMeshNest.uppercase:WaitForChild("Meshes_up__R"),
	["S"] = textMeshNest.uppercase:WaitForChild("Meshes_up__S"),
	["T"] = textMeshNest.uppercase:WaitForChild("Meshes_up__T"),
	["U"] = textMeshNest.uppercase:WaitForChild("Meshes_up__U"),
	["V"] = textMeshNest.uppercase:WaitForChild("Meshes_up__V"),
	["W"] = textMeshNest.uppercase:WaitForChild("Meshes_up__W"),
	["X"] = textMeshNest.uppercase:WaitForChild("Meshes_up__X"),
	["Y"] = textMeshNest.uppercase:WaitForChild("Meshes_up__Y"),
	["Z"] = textMeshNest.uppercase:WaitForChild("Meshes_up__Z"),


	["a"] = textMeshNest.lowercase:WaitForChild("Meshes_low__a"),
	["b"] = textMeshNest.lowercase:WaitForChild("Meshes_low__b"),
	["c"] = textMeshNest.lowercase:WaitForChild("Meshes_low__c"),
	["d"] = textMeshNest.lowercase:WaitForChild("Meshes_low__d"),
	["e"] = textMeshNest.lowercase:WaitForChild("Meshes_low__e"),
	["f"] = textMeshNest.lowercase:WaitForChild("Meshes_low__f"),
	["g"] = textMeshNest.lowercase:WaitForChild("Meshes_low__g"),
	["h"] = textMeshNest.lowercase:WaitForChild("Meshes_low__h"),
	["i"] = textMeshNest.lowercase:WaitForChild("Meshes_low__i"),
	["j"] = textMeshNest.lowercase:WaitForChild("Meshes_low__j"),
	["k"] = textMeshNest.lowercase:WaitForChild("Meshes_low__k"),
	["l"] = textMeshNest.lowercase:WaitForChild("Meshes_low__l"),
	["m"] = textMeshNest.lowercase:WaitForChild("Meshes_low__m"),
	["n"] = textMeshNest.lowercase:WaitForChild("Meshes_low__n"),
	["o"] = textMeshNest.lowercase:WaitForChild("Meshes_low__o"),
	["p"] = textMeshNest.lowercase:WaitForChild("Meshes_low__p"),
	["q"] = textMeshNest.lowercase:WaitForChild("Meshes_low__q"),
	["r"] = textMeshNest.lowercase:WaitForChild("Meshes_low__r"),
	["s"] = textMeshNest.lowercase:WaitForChild("Meshes_low__s"),
	["t"] = textMeshNest.lowercase:WaitForChild("Meshes_low__t"),
	["u"] = textMeshNest.lowercase:WaitForChild("Meshes_low__u"),
	["v"] = textMeshNest.lowercase:WaitForChild("Meshes_low__v"),
	["w"] = textMeshNest.lowercase:WaitForChild("Meshes_low__w"),
	["x"] = textMeshNest.lowercase:WaitForChild("Meshes_low__x"),
	["y"] = textMeshNest.lowercase:WaitForChild("Meshes_low__y"),
	["z"] = textMeshNest.lowercase:WaitForChild("Meshes_low__z"),


	["0"] = textMeshNest.number.Meshes__zero,
	["1"] = textMeshNest.number.Meshes__one,
	["2"] = textMeshNest.number.Meshes__two,
	["3"] = textMeshNest.number.Meshes__three,
	["4"] = textMeshNest.number.Meshes__four,
	["5"] = textMeshNest.number.Meshes__five,
	["6"] = textMeshNest.number.Meshes__six,
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

	-- 0: Normal (on sine), 1: Shaky, 2: Shrinking
	AppearStyle: number,
	AnimationTiming: number | nil,

	-- 0: Normal, 1: Explode
	EndStyle: number,
	flatTextLocation: Instance

}

local textSystem = {}

function textSystem.displayText3D(prepTable: PrepTable)
	-- Strat:

	-- 1. Duplicate 3D text from table
	-- 2. Add SurfaceGUI, Frame, TextLabel and UIGradient to the mesh of the text (Must be using Robotic - Black font)
	-- (Get location of 2D text, and append to that place)
	-- (OR append to requested character/location)
	-- 2: Apply physics slowly (from start to end) (EndStyle)

	if not prepTable.flatTextLocation then
		error("prepTable.flatTextLocation not met the requirement. (nil)")
	-- elseif #breakLocation == 0 then
	-- 	warn('breakLocation empty, text mesh will dynamically add newline on flatTextLocations brickSize')
	end

    local function separateText(input: string)
		local result = {}
		for i = 1, #input do
			table.insert(result, input:sub(i, i))
		end
		return result
	end
	local textArray = separateText(string.upper(prepTable.Text))

	local flatTextLocation: Instance = prepTable.flatTextLocation
	-- flatTextLocation.Anchored = true
	-- flatTextLocation.CanCollide = false
	-- flatTextLocation.CanTouch = false

	local lineNest: Instance
	local function newLineNest()
		lineNest = Instance.new('Part')
        local weld = Instance.new("WeldConstraint")

		lineNest.Parent = flatTextLocation.Parent
		lineNest.Name = ''
		lineNest.Anchored = true
		lineNest.CanCollide = false
		lineNest.CanTouch = false
		lineNest.Transparency = 1
		lineNest.Position = Vector3.new(flatTextLocation.Position.X, flatTextLocation.Position.Y + 1, flatTextLocation.Position.Z + 2)
		-- lineNest.Orientation = Vector3.new(flatTextLocation.Orientation.X, flatTextLocation.Orientation.Y, flatTextLocation.Orientation.Z)
		
		-- weld.Part0 = lineNest
		-- weld.Part1 = flatTextLocation
		-- weld.Parent = lineNest
		return lineNest
	end

	lineNest = newLineNest()
	-- setLTSCount(lineNest)

	
	print(#textArray)
	local i = 1
	local cachedTextMesh: table = {}
	local previousTextMesh: Instance
	-- local textFitX: number = 0
	-- local justBreakLine: table = {false, false}

	local highlight = Instance.new('Highlight')
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	highlight.FillTransparency = 1
	highlight.OutlineColor = Color3.new(255,255,255)
	highlight.OutlineTransparency = 0
	
	local innerGradientTextContainer = Instance.new("SurfaceGui")
	local innerFrame = Instance.new("Frame")
	local gradientText = Instance.new("TextLabel")
	local gradient = Instance.new("UIGradient")

	innerGradientTextContainer.Face = Enum.NormalId.Front
	innerGradientTextContainer.CanvasSize = Vector2.new(50,50)
	innerGradientTextContainer.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud

	innerFrame.BackgroundTransparency = 1
	innerFrame.Position = UDim2.new(-0.275, 0,-0.25, 0)
	innerFrame.Size = UDim2.new(1.55, 0, 1.55, 0)
	innerFrame.BorderSizePixel = 0

	gradientText.Position = UDim2.new(0,0,0,0)
	gradientText.Size = UDim2.new(1,0,1,0)
	gradientText.BackgroundTransparency = 1
	gradientText.BorderSizePixel = 0
	gradientText.RichText = true
	gradientText.TextColor3 = Color3.new(1,1,1)
	gradientText.TextScaled = true
	gradientText.TextXAlignment = Enum.TextXAlignment.Center
	gradientText.TextYAlignment = Enum.TextYAlignment.Center
	gradientText.Font = Enum.Font.Roboto
	gradientText.FontFace = Font.new('rbxasset://fonts/families/Roboto.json', Enum.FontWeight.Heavy, Enum.FontStyle.Normal)

	if not prepTable.Gradient then
		gradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(0.768627, 0.321569, 0.443137)),
			ColorSequenceKeypoint.new(1, Color3.new(0.427451, 0.494118, 0.784314))
		})
	else
		gradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(prepTable.Gradient.ColorSequence1)),
			ColorSequenceKeypoint.new(1, Color3.new(prepTable.Gradient.ColorSequence2))
		})
	end
	gradient.Rotation = 90

	print(prepTable.AnimationTiming)
	while i <= #textArray do
		local currentTextMesh: Instance
		-- local currentWeld: Instance = Instance.new("WeldConstraint")
		
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
			error('cache failed to save instance ❌\n\n' .. fail)
		end

		-- print('\n\n')
		-- print(currentTextMesh)
		-- print(textArray[i])
		-- print('\n\n')

		-- local breakLocResult, _ = pcall(function()
		-- 	return breakLocation[i]
		-- end)

		-- print("textFitX: " .. textFitX)
		-- print("flatTextLocation " .. flatTextLocation.Size.X)
		-- if breakLocResult or textFitX >= flatTextLocation.Size.X then
		-- 	local oldLineNest: Instance = lineNest
		-- 	local newLineNest: Instance = newLineNest()
		-- 	newLineNest.Position = Vector3.new(oldLineNest.Position.X, oldLineNest.Position.Y - (oldLineNest.Size.Y + prepTable.textYGap), oldLineNest.Position.Z)
		-- 	lineNest = newLineNest
		-- 	textFitX = 0
		-- 	setLTSCount(lineNest)
		-- 	justBreakLine[1] = true
		-- 	justBreakLine[2] = true
		-- 	print('newline added')
		-- end


		lineNest.Name = lineNest.Name .. textArray[i]
		currentTextMesh = currentTextMesh:Clone()
		currentTextMesh.Material = Enum.Material.Neon
		currentTextMesh.Anchored = true
		currentTextMesh.CanCollide = false
		currentTextMesh.CanTouch = false
		currentTextMesh.Color = Color3.new(148, 147, 150)
        currentTextMesh.Size = Vector3.new(
            currentTextMesh.Size.X,
            currentTextMesh.Size.Y,
            currentTextMesh.Size.Z * 1.2
        )
		if string.find(textArray[i], "%s") then
			currentTextMesh.Name = "IGNORE"
		else
			currentTextMesh.Name = textArray[i] .. i
		end

		-- currentWeld.Parent = lineNest
		-- currentWeld.Part0 = currentTextMesh
		-- currentWeld.Part1 = lineNest
		-- currentWeld.Name = textArray[i], 'weld'

		local Localhighlight = highlight:Clone()
		local localIGTC = innerGradientTextContainer:Clone()
		local localGradient = gradient:Clone()
		local localFrame = innerFrame:Clone()
		local localText = gradientText:Clone()

		if textArray[i] == string.lower(textArray[i]) then -- TODO: Fix incorrect lowercase text's gradient text
			localText.Position = UDim2.new(-0.25, 0, -0.32, 0)
			localText.Size = UDim2.new(1.5, 0, 1.45, 0)
		end

		localText.Text = textArray[i]

		if i == 1 then
			currentTextMesh.Position = Vector3.new(
				lineNest.Position.X,
				lineNest.Position.Y,
				lineNest.Position.Z
			)
		else
			local testMeshLocation = function()
				if string.upper(textArray[i]) == "I" then
					return previousTextMesh.Position.X + (currentTextMesh.Size.X * 2)  + prepTable.textXGap
				else
					return previousTextMesh.Position.X + currentTextMesh.Size.X + prepTable.textXGap

				end
			end
			currentTextMesh.Position = Vector3.new(
				testMeshLocation(),
				lineNest.Position.Y,
				lineNest.Position.Z
			)
		end
		
		-- Make them invisible, as we want to use textAnimateHandler to handle the animation
		currentTextMesh.Transparency = 1
		localIGTC.Enabled = false
		localText.Transparency = 1

		i += 1

		previousTextMesh = currentTextMesh
		currentTextMesh.Parent = lineNest
		localIGTC.Parent = currentTextMesh
		Localhighlight.Parent = currentTextMesh
		localFrame.Parent = localIGTC
		localText.Parent = localFrame
		localGradient.Parent = localText
	end

	print("ftl", flatTextLocation.CFrame.Rotation.Y)
	local fTLOrienationX, fTLOrienationY, fTLOrienationZ = flatTextLocation:GetPivot():ToOrientation()
	lineNest:PivotTo(CFrame.new(lineNest.Position.X, lineNest.Position.Y, lineNest.Position.Z) * CFrame.Angles(fTLOrienationX, fTLOrienationY, fTLOrienationZ))

	-- lineNest.CFrame = CFrame.new(lineNest.Position.X, lineNest.Position.Y, lineNest.Position.Z)
	lineNest.CFrame = CFrame.new(flatTextLocation.Position)
	* CFrame.Angles(fTLOrienationX, fTLOrienationY, fTLOrienationZ) * CFrame.new(Vector3.new(-10, 0 ,0))

	-- lineNest:PivotTo(
	-- 	CFrame.new(
    --         Vector3.new(
    --             lineNest.Position.X,
    --             lineNest.Position.Y,
    --             lineNest.Position.Z
    --         )
    --     ) * CFrame.Angles(
	-- 		fTLOrienationX,
	-- 		fTLOrienationY,
	-- 		fTLOrienationZ
	-- 	)
	-- )
	textSystem.textAnimateHandler(prepTable, #textArray * 0.5, lineNest)

	-- return true
end


-- Strats:
-- 1. call textAnimateHandler once texts are being aligned properly (desync)
-- 2. Perform various AppearStyle/EndStyle
function textSystem.textAnimateHandler(prepTable: PrepTable, timeBetweenStyle: number ,textItem: table) -- TODO: Convert to ModuleScript
	-- AppearStyle = 0: Normal (on sine), 1: Shaky, 2: Shrinking
	-- EndStyle = 0: Normal, 1: Explode

	local textItemState = function(item) -- 0: 2D, 1: 3D
		if item[1]:IsA("TextLabel") then
			return 0
		elseif item[1]:IsA("MeshPart") then
			return 1
		else
			error('unexpected item in item @ textItemState (check if GetChildren() is included)')
			return -1
		end
	end

	local normalStyle = TweenInfo.new(
		prepTable.AnimationTiming,
		Enum.EasingStyle.Quart,
		Enum.EasingDirection.Out,
		0,
		false,
		0
	)
	local ignoreCheck = function(meshName: string)
		if string.find(meshName, 'IGNORE') then
			return true
		end
	end

	if prepTable.AppearStyle == 0 then
		local cYOffset: number = 0.5
		local rZOffset: number = 0.4
		local sXOffset, sYOffset: number = 1.5, 1.5
		for _, mesh: Instance in textItem:GetChildren() do

			local rX, rY, rZ = mesh.CFrame:ToOrientation()
			local sX, sY, sZ = mesh.Size.X, mesh.Size.Y, mesh.Size.Z
			mesh.CFrame = CFrame.new(mesh.CFrame.Position.X, mesh.CFrame.Position.Y + cYOffset, mesh.CFrame.Position.Z) * CFrame.Angles(rX,rY,rZ - rZOffset)
			mesh.Size = Vector3.new(sX + sXOffset, sY + sYOffset, sZ)
			task.wait(prepTable[4])
			
			if not ignoreCheck(mesh.Name) then
				
				local textTween = tweenService:Create(mesh, normalStyle, {
					CFrame = CFrame.new(mesh.CFrame.Position.X, mesh.CFrame.Position.Y, mesh.CFrame.Position.Z) * CFrame.Angles(rX,rY,rZ),
					Transparency = 0,
					Size = Vector3.new(sX, sY, sZ)
				})
				
				
				local gradient = mesh:GetDescendants()[3] -- NOT UIGradient, but TextLabel
				local gradientTween = tweenService:Create(gradient, normalStyle, {
					TextTransparency = 0
				})
				
				textTween:Play()
				mesh:FindFirstChild("SurfaceGui").Enabled = true
				gradientTween:Play()
			end
		end
	end -- TODO: Apply TweenService for animation (movement, visual)

	task.wait(timeBetweenStyle) -- Time between AppearStyle and EndStyle
	
	if prepTable.EndStyle == 0 then
		local innerTextLineNest = textItem:GetChildren()
		for _, innerLSTValue: Instance in ipairs(innerTextLineNest) do
			task.wait(0.03)
			innerLSTValue.Anchored = false
			innerLSTValue.CanCollide = true
			innerLSTValue.CanTouch = false
			print(innerLSTValue.Name, " gone")
		end
		task.wait(timeBetweenStyle)
		for _, text: Instance in ipairs(innerTextLineNest) do
			task.wait(0.03)
			text:Destroy()
		end
	end

    textItem:Destroy()
end

return textSystem