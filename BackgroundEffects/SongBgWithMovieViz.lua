local Color1 = color(Var "Color1");
local Color2 = color(Var "Color2");

local t = Def.ActorFrame {
	Def.Sprite {
		OnCommand=function(self)
			self:LoadFromCurrentSongBackground()
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
			self:scale_or_crop_background();
			self:diffuse(Color1)
			self:effectclock("music")
		end;
	};

	LoadActor(Var "File1") .. {
		OnCommand=cmd(blend,"BlendMode_Add";x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;scale_or_crop_background;diffuse,Color2;effectclock,"music");
		GainFocusCommand=cmd(play);
		LoseFocusCommand=cmd(pause);
	};
};

return t;
