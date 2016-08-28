function RealityCast (keys)

	local caster = keys.caster
	local ability = keys.ability
	local unit = caster:GetUnitName()
	local vPoint = ability:GetCursorPosition()

	if caster.haunting then
		
		local target = Entities:FindByNameNearest(unit, vPoint, 0)

		if target:IsIllusion() then
			
			--Store the caster and the illusions forward vector
			local caster_forward_vector = caster:GetForwardVector()
			local target_forward_vector = target:GetForwardVector()

			--Swaps the forward vector of the caster and the illusion
			caster:SetForwardVector(target_forward_vector)
			target:SetForwardVector(caster_forward_vector)

			--Store the caster and the illusions current position
			caster.currentPosition = caster:GetAbsOrigin()
			target.currentPosition = target:GetAbsOrigin()

			--Swaps the position of the caster and the illusion
			target:SetAbsOrigin(caster.currentPosition)	
			caster:SetAbsOrigin(target.currentPosition)

			FindClearSpaceForUnit( caster, target.currentPosition, true )

			EmitSoundOn("Hero_Spectre.Reality", caster)

		end

	end

end
