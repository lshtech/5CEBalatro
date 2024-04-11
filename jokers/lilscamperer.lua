local jokerInfo = {
	name = 'Lil\' Scamperer',
	config = {},
	text = {
		'{C:mult}+1{} Mult per consecutive',
		'hand played where',
		'this Joker has been',
		'moved beforehand.',
		'{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)',
		'{s:0.8,C:inactive}#2#'
	},
	rarity = 3,
	cost = 2,
	canBlueprint = true,
	canEternal = true
}

local function updateFlavorText(self)
	local flavorText = {
		'why does he look like that',
		'is he ugly on purpose',
		'...',
		'how does this make you feel',
		'i\'m annoyed just looking at it',
		'he\'s just a little guy!'
	}
	self.ability.extra.flavorText = flavorText[math.random(1,#flavorText)]

end

function jokerInfo.locDef(self)
	return {self.ability.extra.mult,self.ability.extra.flavorText}
end

function jokerInfo.init(self)
	self.ability.extra = {
		mult = 0
	}
	updateFlavorText(self)
end

function jokerInfo.calculate(self, context)
	updateFlavorText(self)
	if SMODS.end_calculate_context(context) then
		return {
			message = localize { type = 'variable', key = 'a_mult', vars = {self.ability.extra.mult} },
			mult_mod = self.ability.extra.chips,
		}
	end
end



return jokerInfo
	