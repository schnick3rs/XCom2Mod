class X2Item_InfinityWeapons extends X2Item config(IW_WeaponData);

// Variables from config - GameData_InfinityWeaponData.ini
// ***** Damage arrays for attack actions  *****

// CC Weapons
var config WeaponDamageValue SWORD_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue SWORD_MEDIVAL_BASEDAMAGE; // DA CC

// Pistols
var config WeaponDamageValue PISTOL_CONVENTIONAL_BASEDAMAGE; //
var config WeaponDamageValue PISTOL_HEAVY_BASEDAMAGE; // more damage (-move)
var config WeaponDamageValue PISTOL_ASSAULT_BASEDAMAGE; // more burst (+ to aim?)

var config WeaponDamageValue SMG_CONVENTIONAL_BASEDAMAGE; //

var config WeaponDamageValue CHAINRIFLE_CONVENTIONAL_BASEDAMAGE;

// Shotguns
var config WeaponDamageValue SHOTGUN_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue SHOTGUN_LIGHT_BASEDAMAGE; // CONVENTIONAL
var config WeaponDamageValue SHOTGUN_BOARDING_BASEDAMAGE;
var config WeaponDamageValue SHOTGUN_HEAVY_BASEDAMAGE;

// Rifles
var config WeaponDamageValue CARBINE_PLASMA_BASEDAMAGE; //This version sacrifices fire rate and accuracy in favor of a bigger payload

var config WeaponDamageValue RIFLE_CONVENTIONAL_BASEDAMAGE; // Infinity Rifle
var config WeaponDamageValue RIFLE_COMBI_BASEDAMAGE; // Infinity Combi Rifle
var config WeaponDamageValue RIFLE_MULTI_BASEDAMAGE; // Infinity Combi Rifle
var config WeaponDamageValue RIFLE_PLASMA_BASEDAMAGE; // Infinity Combi Rifle

var config WeaponDamageValue MARKSMANRIFLE_CONVENTIONAL_BASEDAMAGE;

// Sniper
var config WeaponDamageValue SNIPERRIFLE_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue SNIPERRIFLE_MULTI_BASEDAMAGE;
var config WeaponDamageValue SNIPERRIFLE_PLASMA_BASEDAMAGE;
var config WeaponDamageValue SNIPERRIFLE_GUIDED_BASEDAMAGE;

// Spitfire
var config WeaponDamageValue SPITFIRE_MAGNETIC_BASEDAMAGE;	// Infinity Spitfire

// HMGs
var config WeaponDamageValue HMG_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue HMG_MULTI_BASEDAMAGE;


//var config WeaponDamageValue SPITFIRE_MAGNETIC_BASEDAMAGE;
//var config WeaponDamageValue SPITFIRE_BEAM_BASEDAMAGE;

// ***** Core properties and variables for weapons *****
var config int SPITFIRE_MAGNETIC_AIM;
var config int SPITFIRE_MAGNETIC_CRITCHANCE;
var config int SPITFIRE_MAGNETIC_ICLIPSIZE;
var config int SPITFIRE_MAGNETIC_ISOUNDRANGE;
var config int SPITFIRE_MAGNETIC_IENVIRONMENTDAMAGE;
var config int SPITFIRE_MAGNETIC_ISUPPLIES;
var config int SPITFIRE_MAGNETIC_TRADINGPOSTVALUE;
var config int SPITFIRE_MAGNETIC_IPOINTS;
var config int SPITFIRE_MAGNETIC_UPGRADESLOTS;

var config int RIFLE_COMBI_AIM;
var config int RIFLE_COMBI_CRITCHANCE;
var config int RIFLE_COMBI_ICLIPSIZE;
var config int RIFLE_COMBI_ISOUNDRANGE;
var config int RIFLE_COMBI_IENVIRONMENTDAMAGE;
var config int RIFLE_COMBI_ISUPPLIES;
var config int RIFLE_COMBI_TRADINGPOSTVALUE;
var config int RIFLE_COMBI_IPOINTS;
var config int RIFLE_COMBI_UPGRADESLOTS;

var config int RIFLE_CONVENTIONALAIM;
var config int RIFLE_CONVENTIONALCRITCHANCE;
var config int RIFLE_CONVENTIONALICLIPSIZE;
var config int RIFLE_CONVENTIONALISOUNDRANGE;
var config int RIFLE_CONVENTIONALIENVIRONMENTDAMAGE;
var config int RIFLE_CONVENTIONALISUPPLIES;
var config int RIFLE_CONVENTIONALTRADINGPOSTVALUE;
var config int RIFLE_CONVENTIONALIPOINTS;
var config int RIFLE_CONVENTIONALUPGRADESLOTS;

// ***** Range Modifier Tables *****
var config array<int> RIFLE_COMBI_RANGE;
var config array<int> SPITFIRE_RANGE;
var config array<int> MEDIUM_CONVENTIONAL_RANGE;

//Template classes are searched for by the game when it starts. Any derived classes have their CreateTemplates function called
//on the class default object. The game expects CreateTemplates to return a list of templates that it will add to the manager
//reponsible for those types of templates. Later, these templates will be automatically picked up by the game mechanics and systems.
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> InfinityWeapons;

	InfinityWeapons.AddItem(CreateTemplate_Rifle_Conventional()); // T0
//	InfinityWeapons.AddItem(CreateTemplate_Rifle_Magnetic()); // T1
	InfinityWeapons.AddItem(CreateTemplate_CombiRifle_Magnetic()); // T2
//	InfinityWeapons.AddItem(CreateTemplate_MultiRifle_Beam()); // T3

	InfinityWeapons.AddItem(CreateTemplate_Spitfire_Magnetic()); // T2
	
	return InfinityWeapons;
}

// The rifle is the inseparable companion of the infantry soldier: 
// conceived for mass combat, it is now the most common weapon in the battlefields of the Sphere.
// Recent technological advances have made it more lightweight and accurate, making it viable for covert operatives.
static function X2DataTemplate CreateTemplate_Rifle_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Rifle_CV');
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base"; // ?
	Template.Tier = 0;

	Template.RangeAccuracy = default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.RIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.RIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.RIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.RIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.RIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.RIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.RIFLE_CONVENTIONAL_UPGRADESLOTS;
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_AssaultRifle_CV.WP_AssaultRifle_CV";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	
	Template.UpgradeItem = 'CombiRifle_MG';

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';
	
	return Template;
}


static function X2DataTemplate CreateTemplate_CombiRifle_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AssaultRifle_MG');
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.RIFLE_COMBI_RANGE;
	Template.BaseDamage = default.RIFLE_COMBI_BASEDAMAGE;
	Template.Aim = default.RIFLE_COMBI_AIM;
	Template.CritChance = default.RIFLE_COMBI_CRITCHANCE;
	Template.iClipSize = default.RIFLE_COMBI_ICLIPSIZE;
	Template.iSoundRange = default.RIFLE_COMBI_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.RIFLE_COMBI_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.RIFLE_COMBI_UPGRADESLOTS;
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	Template.GameArchetype = "WP_AssaultRifle_MG.WP_AssaultRifle_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;
	
	Template.UpgradeItem = 'AssaultRifle_BM';

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

// ***** Spitfire *****
// The Spitfire is a mid-range machine gun designed for close quarters and urban combat.
// Regardless of its specific incarnation, this type of weapon has carved its way into the history of weapons due to its high fire rate and notable accuracy.
// Internationally known by different iterations of the name "Fire Spitter", it is widely regarded as the 'most effective automatic firearm in the Sphere'.
// Compared to its big sister, the Heavy Machine Gun, a Spitfire barrel is shorter and its ammunition lighter, two factors that define its usefulness as assault and support weapon in urban combat environments.
// Coupled with its sturdy build and ease of use, the Spitfire has all the features of a legendary weapon.
static function X2DataTemplate CreateTemplate_Spitfire_Magnetic()
{
	local X2WeaponTemplate Template;

	// Basic properties copied from the spitfire
	//=====================================================================

	// TemplateType, Template, LocalisationHock
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Spitfire_MG');
	Template.WeaponPanelImage = "_MagneticRifle"; // ? purpsose

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon'; // this is a hightech HMG / Assault Rifle hybrid, mabye use 'rifle'
	Template.WeaponTech = 'conventional';	
	Template.strImage = "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 1; // this is not a starting weapon

	Template.RangeAccuracy = default.SPITFIRE_RANGE;
	Template.BaseDamage = default.SPITFIRE_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.SPITFIRE_MAGNETIC_AIM;
	Template.CritChance = default.SPITFIRE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.SPITFIRE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.SPITFIRE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SPITFIRE_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SPITFIRE_MAGNETIC_UPGRADESLOTS;
	Template.bIsLargeWeapon = false;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Suppression');

	// This all the resources; sounds, animations, models, physics, the works.
	// TODO: Replace with final mash
	Template.GameArchetype = "WP_ModExampleWeapon_CV.WP_ModExampleWeapon_CV"; //Use a custom archetype
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.UpgradeItem = 'Spitfire_BM'; // TODO check if its upgradable

	Template.StartingItem = true;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false; // no infinity advanced items

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

