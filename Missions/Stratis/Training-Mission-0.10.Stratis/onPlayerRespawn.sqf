switch (roledescription (_this select 0)) do
	{
		case "Flight Instructor";
		case "Training Officer":
			{

removeAllWeapons (_this select 0);
removeAllItems (_this select 0);
removeAllAssignedItems (_this select 0);
removeUniform (_this select 0);
removeVest (_this select 0);
removeBackpack (_this select 0);
removeHeadgear (_this select 0);
removeGoggles (_this select 0);

(_this select 0) forceAddUniform "rhs_uniform_cu_ocp";
for "_i" from 1 to 3 do {(_this select 0) addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 3 do {(_this select 0) addItemToUniform "ACE_quikclot";};
(_this select 0) addItemToUniform "ACE_CableTie";
(_this select 0) addItemToUniform "ACE_EarPlugs";
(_this select 0) addItemToUniform "ACE_EntrenchingTool";
(_this select 0) addItemToUniform "ACE_microDAGR";
(_this select 0) addItemToUniform "ACE_morphine";
for "_i" from 1 to 2 do {(_this select 0) addItemToUniform "ACE_tourniquet";};
(_this select 0) addItemToUniform "ACE_Flashlight_XL50";
for "_i" from 1 to 2 do {(_this select 0) addItemToUniform "16Rnd_9x21_Mag";};
(_this select 0) addVest "V_BandollierB_khk";
(_this select 0) addHeadgear "H_MilCap_mcamo";
(_this select 0) addGoggles "G_Aviator";

(_this select 0) addWeapon "hgun_Pistol_02_F";

(_this select 0) linkItem "ItemMap";
(_this select 0) linkItem "ItemCompass";
(_this select 0) linkItem "tf_microdagr";


			};
			
		case "Trainee":
			{

			removeAllWeapons (_this select 0);
removeAllItems (_this select 0);
removeAllAssignedItems (_this select 0);
removeUniform (_this select 0);
removeVest (_this select 0);
removeBackpack (_this select 0);
removeHeadgear (_this select 0);
removeGoggles (_this select 0);

(_this select 0) forceAddUniform "rhs_uniform_cu_ocp";
(_this select 0) addItemToUniform "ACE_EarPlugs";
(_this select 0) addItemToUniform "ACE_Flashlight_XL50";
(_this select 0) addHeadgear "H_Cap_tan";

(_this select 0) linkItem "ItemMap";
(_this select 0) linkItem "ItemCompass";
(_this select 0) linkItem "tf_microdagr";


			
			};
			
	};