// scr_text_shake(23, 28); -> Shake the letters between (and indcluding) x and y
// scr_text_color(23, 28, color, color, color, color); -> Turn the letters between (and indcluding) x and y different colors
// scr_text_face_spr(LEFT, spr_noelle_left_happy); -> Turning a sprite a direction (4-directional only)
// scr_obj_spawn_after_textbox(obj_desscircle, 680, 215, "Instances"); -> Spawning an object after the full textbox is done
// scr_obj_sprite_after_textbox(obj_dess, spr_dess_intro_body, false, snd_appear, 0.7); -> Sprite animation after textbox is done
// scr_obj_sprite_after_textbox_delayed(obj_dess, spr_dess_drool, true, 60); -> Same as above, but with a delay
// scr_text_speaker_shake(.5, 1); -> Shake the speaker during the line of text
// scr_text_cutoff_slow(11, 11, 0.1); -> Slows down the text, and cuts it off at letter x

/// @param text_id
function scr_game_text(_text_id)
{
	switch (_text_id)
	{
		case "self_1":
			scr_obj_spawn_after_textbox(obj_queen, 660, 300, "Instances");
			scr_char_move_after_textbox(obj_queen, spr_queen_walk_down, true, 0, 4, 1, 15);
		break;
		
		case "self_2":
		    scr_text("* What did you guys talk about?", "lancer", 2);
		        scr_obj_sprite_on_page(obj_queen, spr_queen_walk_left, false);
		        scr_obj_sprite_on_page(obj_lancer, spr_lancer_right, false);
		    scr_text("* Uh", "queen", 9);
		    scr_text("* Taxes", "queen", 20);
		    scr_text("* I love taxes!", "lancer", 3);
		    scr_text("* ...", "queen", 4);
		    scr_text("* Okay", "queen", 28);
		    scr_text("* Anyways", "queen", 1);
		    scr_text("* I'm Gonna Go: Do Something", "queen", 2);
		    scr_text("* Make Sure Your Dad Doesn't Leave", "queen", 3);
		    scr_text("* Okay!", "lancer", 2);
		    scr_text("* Sick", "queen", 10);
		        scr_obj_sprite_after_textbox_delayed(obj_lancer, spr_lancer_left, false, 20);
		        scr_char_move_after_textbox(obj_queen, spr_queen_walk_down, true, 0, 4, .9, 20);
				scr_char_move_after_textbox(obj_queen, spr_queen_walk_left, true, -5, 0, .9, 60);
				scr_char_move_after_textbox(obj_queen, spr_queen_walk_down, true, 0, 4, .9, 60);
		break;
		
		case "self_3":
			scr_fade_warp_with_music(rm_one, 240, sng_empty);
		break;
		
		case "self_4":
			scr_char_move_after_textbox(obj_susie, spr_susie_walk_up, true, 0, -6, .5, 50);
			scr_obj_sprite_after_textbox_delayed(obj_susie, spr_susie_walk_up, false, 50);
		break;
		
		case "self_5":
			 scr_text("* Hey, dude!", "susie", 7);
				scr_obj_sprite_on_page(obj_ralsei, spr_ralsei_walk_down, false);
			scr_text("* Hi, Susie!", "ralsei", 2);
			scr_text("* Listen, we, uh...", "susie", 13);
			scr_text("* Really need to talk about this.", "susie", 3);
			scr_text("* I know, I've just been very busy, and...", "ralsei", 39);
			scr_text("* But we will have a chance to talk!|* Just give it some time!", "ralsei", 40);
				scr_obj_sprite_on_page(obj_ralsei, spr_ralsei_happyhands, false);
			scr_text("* ...Why do I feel like you're stalling the conversation?", "susie", 11);
				scr_obj_sprite_on_page(obj_ralsei, spr_ralsei_surprisedhands, false);
			scr_text("* I...", "ralsei", 36);
			scr_text("* ...", "ralsei", 37);
				scr_obj_sprite_on_page(obj_ralsei, spr_ralsei_down_lookdown, false);
			scr_text("* You really want to discuss this, Susie?", "ralsei", 8);
			scr_text("* Yeah, dude. I dropped this on you like the second I came down here.", "susie", 10);
			scr_text("* I know, it's just that we went through some pretty heavy stuff a little bit ago", "ralsei", 40);
				scr_text_cutoff_skip(81);
			scr_text("* I know. I was there.", "susie", 12);
			scr_text("* And this conversation still needs to happen.", "susie", 13);
			scr_text("* So... come outside soon, okay?", "susie", 8);
			scr_text("* I'll grab a table.", "susie", 9);
			scr_text("* ...Okay, Susie.|* If you insist.", "ralsei", 0);
				scr_obj_sprite_on_page(obj_ralsei, spr_ralsei_walk_down, false);
			scr_text("* Alright.", "susie", 2);
				scr_char_move_after_textbox(obj_susie, spr_susie_walk_down, true, 0, 6, .5, 50);
		break;
		
		case "self_6":
			scr_text("* ...", "ralsei", 41);
				scr_obj_sprite_on_page(obj_ralsei, spr_ralsei_down_lookdown, false);
		break;
		
		case "self_7":
			scr_fade_warp_with_music(rm_two, 240, sng_empty);
		break;
/*

*/

		/*array_push(obj_cutscenehandler_midfightattacks.after_textbox_queue, {
			type: "tenna_battle_intro"
			});*/
				
	
		/* Warp Code:
		if (instance_exists(obj_cutscenehandler_midfightattacks))
			    {
			        obj_cutscenehandler_midfightattacks.waiting_for_warp = true;
			    }
		*/
		
		/* Pitching Music:
			global.song = { sound: sng_?, bpm: ?, beats: ? };
			global.music = audio_play_sound(sng_?, 1, true);
			audio_sound_pitch(global.music, 0.7);
			global.song_start = current_time;
		*/
		/* Summoning UI (Not in battle):
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
		    audio_stop_all();
		    global.song = { sound: sng_cmmm, bpm: 130, beats: 9999 };
			global.music = audio_play_sound(sng_cmmm, 1, true);
			audio_sound_pitch(global.music, 1.25);
			global.song_start = current_time;
		*/
		
		/* Movement Queue:
			scr_queue_movement_group_after_textbox([
				   { obj: obj_gerson, sprite: spr_gerson_hammer_walkright_lantern, loop: true, dx: 15, dy: 3, speed: .2, duration: 75 },
				   { obj: obj_mewmew, sprite: spr_ghost_shocked_left, loop: false, dx: 0, dy: -10, speed: .2, duration: 75 }
			]);
		*/
		
		// Battle Example:
		/* case "self_18":
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
		    obj_UI.sprite_index = spr_UI_Pink;
			obj_mewmew.sprite_index = spr_ghost_shocked_left;
		    var pink = obj_mewmew;
		    var _seq = instance_create_depth(0, 0, 0, obj_fight_sequencer);
		    _seq.sequence = [
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
		        { type: "talk", batch: [ { speaker: pink, text: "Hey! Hey!!! HEY!!!"} ] },
				{ type: "talk", batch: [ { speaker: pink, text: "GERSON!!! I'M ON YOUR SIDE!!!" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "WHAT'S GOING ON???" } ] },
		        { type: "attack", attacker: obj_sound_of_justice, data: global.atk_sound_of_justice_hammers },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
		        { type: "talk", batch: [ { speaker: pink, text: "DIDN'T WE PLAN TO DO THIS???" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "WHY ARE YOU ATTACKING ME???" } ] },
		        { type: "attack", kind: "custom", start_func: scr_start_giant_hammer_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "talk", batch: [ { speaker: pink, text: "You know I can't take damage... right???" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "So... quit it!!!" } ] },
				{ type: "attack", kind: "custom", start_func: scr_start_falling_hammer_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_wistful },
				{ type: "talk", batch: [ { speaker: pink, text: "We need to... find my body..." } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "Damn it, Gerson, don't you double-cross me too!!!" } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_shocked_left },
				{ type: "attack", kind: "custom", start_func: scr_start_gavel_slam_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_wistful },
				{ type: "talk", batch: [ { speaker: pink, text: "Come on, Gerson. I don't want to fight you." } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "So stop fighting me..." } ] },
		        // add more talk/attack pairs as you write more dialogue/attacks
		    ];		
		break;
		
		case "self_19":
			scr_ui_reverse(sng_empty);
			audio_stop_all();
			scr_text("* Please...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_scared);
	        scr_portrait_tail_off();
	        scr_snd_after_textbox(snd_sojlaugh, 1);
	        scr_obj_sprite_after_textbox(obj_sound_of_justice, spr_sound_of_justice_laugh, true);
	        scr_custom_call_after_textbox_delayed(scr_spawn_soj_hit_hammer, 113); // mid-laugh hammer hit
			scr_obj_sprite_after_textbox_delayed(obj_mewmew, spr_ghost_shocked_left, false, 120);
	        scr_custom_call_after_textbox_delayed(scr_start_pan_and_reveal_left, 150); // shortly after the hit
		break;
	*/
	}
}