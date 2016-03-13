class X2Ability_InfinityArmorGrantedAbilitySet extends X2Ability config(IW_ArmorData);

var config int LIGHT_SKIRMISH_MOBILITY_BONUS;

var config int LIGHT_KEVLAR_MITIGRATION_AMOUNT;
var config int LIGHT_KEVLAR_MITIGRATION_CHANCE;

var config int MEDIUM_CONVENTIONAL_MOBILITY_BONUS;
var config int MEDIUM_CONVENTIONAL_MITIGRATION_AMOUNT;
var config int MEDIUM_CONVENTIONAL_MITIGRATION_CHANCE;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(CreateTemplate_IW_LightSkirmishArmorStats());
	Templates.AddItem(CreateTemplate_IW_LightKevlarArmorStats());
	
	Templates.AddItem(CreateTemplate_IW_MediumConventionalArmorStats());
	
	//Templates.AddItem(CreateTemplate_IW_HeavyConventionalArmorStats()); // Ariadna
	//Templates.AddItem(CreateTemplate_IW_HeavyPoweredArmorStats());	// Sphere

	return Templates;
}

static function SetDefaultArmorStatsTemplate(out X2AbilityTemplate Template)
{
	local X2AbilityTrigger					Trigger;
	local X2AbilityTarget_Self				TargetStyle;

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;	

	Template.AbilityToHitCalc = default.DeadEye;
	
	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);
}

static function X2AbilityTemplate CreateTemplate_IW_LightSkirmishArmorStats()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'IW_LightSkirmishArmorStats');
	// Template.IconImage  -- no icon needed for armor stats

	SetDefaultArmorStatsTemplate(template);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.LIGHT_SKIRMISH_MOBILITY_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate CreateTemplate_IW_LightKevlarArmorStats()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'IW_LightKevlarArmorStats');
	// Template.IconImage  -- no icon needed for armor stats

	SetDefaultArmorStatsTemplate(template);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.LIGHT_KEVLAR_MITIGRATION_AMOUNT);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorChance, default.LIGHT_KEVLAR_MITIGRATION_CHANCE);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}


static function X2AbilityTemplate CreateTemplate_IW_MediumConventionalArmorStats()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'IW_MediumConventionalArmorStats');
	// Template.IconImage  -- no icon needed for armor stats

	SetDefaultArmorStatsTemplate(template);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MEDIUM_CONVENTIONAL_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.MEDIUM_CONVENTIONAL_MITIGRATION_AMOUNT);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorChance, default.MEDIUM_CONVENTIONAL_MITIGRATION_CHANCE);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

// PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, default.MediumPlatedHealthBonusName, default.MediumPlatedHealthBonusDesc, Template.IconImage);