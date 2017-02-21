print("LET'S GO FAST AS FUCK BOII")

local bounce = false
local doBounce = false

surface.CreateFont( "FastAF", {
	font = "Brutal Type",
	extended = false,
	size = 200,
	weight = 300,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
surface.CreateFont( "FastAFInfo", {
	font = "Brutal Type",
	extended = false,
	size = 25,
	weight = 300,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

hook.Add("CreateMove", "chicken curry!", function(ucmd)
	if(bounce) then
		RunConsoleCommand(LocalPlayer():IsOnGround() and "+jump" or "-jump")
		doBounce = true
	else
		if doBounce then
			RunConsoleCommand("-jump")
			doBounce = false
		end
	end
end)

local max = 0

hook.Add( "HUDPaint", "HelloThere", function()
	local vel = LocalPlayer():GetVelocity()
	vel.z = 0
	local speed = vel:Length()
	local info = ""

	local transp = 255

	local width = speed * 100 / 180

	if(width > 500) then
		width = 500
		info = "U FAST AS FUCK BOI"
	end

	if(width > max) then
		max = width
	end

	if((max - 20) > width and speed > 250) then
		max = max - 1
		info = "Losing velocity!"
	end

	if(speed < 250) then
		max = max - 0.4
	end

	draw.DrawText(math.Round(speed), "FastAF", ScrW() * 0.05, ScrH() * 0.05, Color( 255, 255, 255, transp ), TEXT_ALIGN_LEFT )


	surface.SetDrawColor( 255, 255, 255, transp )
	surface.DrawRect( ScrW() * 0.05, ScrH() * 0.175, 500, 25 )

	surface.SetDrawColor( 33, 150, 243, transp )
	surface.DrawRect( ScrW() * 0.05, ScrH() * 0.175, max, 25 )

	surface.SetDrawColor( 244, 67, 54, transp )
	surface.DrawRect( ScrW() * 0.05, ScrH() * 0.175, width, 25 )

	draw.DrawText(info, "FastAFInfo", ScrW() * 0.05, ScrH() * 0.205, Color( 255, 255, 255, transp ), TEXT_ALIGN_LEFT )
end )

concommand.Add("fastaf", function()
	if(bounce) then
		bounce = false
	else
		bounce = true
	end
end )

concommand.Add( "killyourself", function( ply, cmd, args )
	ply:Kill()
	print( "You killed yourself!" )
end )