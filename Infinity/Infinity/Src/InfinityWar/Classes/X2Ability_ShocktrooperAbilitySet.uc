//---------------------------------------------------------------------------------------
//  FILE:    X2Ability_ShocktrooperAbilitySet.uc
//  AUTHOR:  schnick3rs
//  DATE:    28 Feb 2016
//  PURPOSE: Defines abilities used by the Shocktrooper class.
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class X2Ability_ShocktrooperAbilitySet extends X2Ability
	config(GameData_SoldierSkills);

var config int STEALTH_CHARGES;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(ShocktrooperFrenzy());

	return Templates;
}

static function X2AbilityTemplate ShocktrooperFrenzy()
{
	local X2AbilityTemplate						Template;
	local X2Effect_RangerStealth                ShocktrooperFrenzy;
	local X2AbilityCharges                      Charges;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ShocktrooperFrenzy');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stealth";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityCosts.AddItem(new class'X2AbilityCost_Charges');
	Template.AbilityCosts.AddItem(default.FreeActionCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.STEALTH_CHARGES;
	Template.AbilityCharges = Charges;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityShooterConditions.AddItem(new class'X2Condition_Stealth');

	ShocktrooperFrenzy = new class'X2Effect_RangerStealth';
	ShocktrooperFrenzy.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	ShocktrooperFrenzy.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true);
	ShocktrooperFrenzy.bRemoveWhenTargetConcealmentBroken = true;
	Template.AddTargetEffect(ShocktrooperFrenzy);

	Template.AddTargetEffect(class'X2Effect_Spotted'.static.CreateUnspottedEffect());

	Template.ActivationSpeech = 'ActivateConcealment';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	return Template;
}