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
			scr_text("* Hey, Lancer!|* How's Castle Town been since we left?", "susie", 7);	
				scr_char_move_on_page(obj_susie, spr_susie_walk_up, true, 0, -20, .2, 90);
				scr_obj_sprite_on_page_delayed(obj_lancer, spr_lancer_down, false, 0, 45);
				scr_obj_sprite_on_page_delayed(obj_susie, spr_susie_walk_up, false, 0, 90);
			scr_text("* Incredible!", "lancer", 8);	
			scr_text("* ...Okay.", "susie", 10);	
			scr_text("* How's", "susie", 2);
				scr_text_cutoff_skip(7);
			scr_text("* Incredible!", "lancer", 8);	
				scr_text_slow(.2);
			scr_text("* ...", "susie", 3);
			scr_text("* Hey, um...", "susie", 0);
			scr_text("* I know it's probably not the BEST idea, but...", "susie", 13);
			scr_text("* I was thinking you should, uh...", "susie", 10);
			scr_text("* Yes?", "lancer", 2);	
			scr_text("* You should probably go... talk to your dad?|* See how he's doing?", "susie", 3);
			scr_text("* With everything that's happened, we kinda forget he's still here, so...", "susie", 12);
			scr_text("* Maybe go do that?|* Or not?", "susie", 20);
			scr_text("* Do you wanna come?", "lancer", 1);
			scr_text("* Uh...", "susie", 25);
			scr_text("* Not... really?", "susie", 20);
			scr_text("* Anyways, I need to go talk to Ralsei about something, so...", "susie", 7);
			scr_text("* See you later?", "susie", 21);
			scr_text("* You bet!", "lancer", 2);
			scr_text("* Cool.", "susie", 2);
				scr_char_move_after_textbox(obj_susie, spr_susie_walk_right, true, 3, 0, .8, 20);
				scr_obj_sprite_after_textbox_delayed(obj_lancer, spr_lancer_up, false, 30);
				scr_char_move_after_textbox(obj_susie, spr_susie_walk_up, true, 0, -20, .3, 90);
				scr_obj_sprite_after_textbox_delayed(obj_susie, spr_invischaracter, false, 150);
		break;
		
		case "self_2":
			scr_fade_warp_with_music(rm_one, 240, sng_cardjail);
		break;
		
		case "self_3":
			scr_text("* ...", "king", 5);
			scr_text("* Footsteps.", "king", 0);
			scr_char_move_after_textbox(obj_lancer, spr_lancer_right, false, 30, 0, .2, 100);
		break;
		
		case "self_4":
			scr_text("* Hi Dad!", "lancer", 3);
			scr_text("* ...", "king", 5);
			scr_text("* My son.", "king", 0);
			scr_text("* Just checking in on you!", "lancer", 2);
			scr_text("* Why have you not come to visit sooner?", "king", 5);
			scr_text("* Adventuring!", "lancer", 1);
			scr_text("* ...With the Lightners, I presume?", "king", 5);
			scr_text("* Yeah!|* They're great!", "lancer", 2);
			scr_text("* ...", "king", 5);
			scr_text("* I don't even do any of the walking! It's...", "lancer", 1);
			scr_text("* Incredib", "lancer", 8);
				scr_text_slow(.4);
				scr_text_cutoff_skip(10);
			scr_text("* Enough.", "king", 5);
			scr_text("* ...", "lancer", 5);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_right_sad, false);
			scr_text("* You still do not get it, do you?", "king", 0);
			scr_text("* These 'heroes' you spend time with.|* They are not 'heroes'.", "king", 5);
			scr_text("* I wouldn't even classify them as 'good'.", "king", 4);
			scr_text("* What... What do you mean?", "lancer", 7);
			scr_text("* They are poisoning your mind, my son.", "king", 5);
				scr_obj_sprite_on_page(obj_king, spr_king_sulk_left, false);
			scr_text("* Promises of freedom and friendship just so they can use you for their gain.", "king", 0);
			scr_text("* ...", "king", 5);
			scr_text("* I really wish you came to see me sooner.", "king", 1);
			scr_text("* I thought you were gonna be upset when I saved the Lightners.", "lancer", 7);
			scr_text("* And when we...", "lancer", 10);
			scr_text("* And I was.|* But now I am not.", "king", 2);
			scr_text("* And unlike the heroes, I HAVE changed for good.", "king", 7);
			scr_text("* While they have been off sealing other worlds...", "king", 5);
			scr_text("* I have been here.|* Self-reflecting on my actions.", "king", 2);
			scr_text("* I have seen the error of my ways, and what my actions have inflicted.", "king", 1);
			scr_text("* And for that, I am sorry.", "king", 3);
			scr_text("* That's great, Dad! Let me go tell Susie", "lancer", 3);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_right, false);
				scr_text_cutoff_skip(41);
			scr_text("* I need a favor from you, Lancer.", "king", 5);
			scr_text("* Yeah?", "lancer", 0);
			scr_text("* I need you to release me from here.", "king", 0);
			scr_text("* ...", "lancer", 4);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_right_sad, false);
			scr_text("* I don't know if I can do that, Dad", "lancer", 12);
				scr_text_cutoff_skip(36);
			scr_text("* Listen to my words.", "king", 5);
			scr_text("* The heroes are planning something.", "king", 10);
				scr_obj_sprite_on_page(obj_king, spr_king_sulk, false);
			scr_text("* I can sense their deception whenever they come to taunt me in this prison.", "king", 11);
			scr_text("* I understand you are friends with them now, so I will not force you to fight them.", "king", 5);
			scr_text("* But won't you", "lancer", 7);
				scr_text_cutoff_skip(15);
			scr_text("* I will not engage either.|* Do not worry.", "king", 0);
			scr_text("* ...", "lancer", 11);
			scr_text("* I don't know, Dad.", "lancer", 10);
			scr_text("* How do I know you won't just attack them when you get out?", "lancer", 12);
			scr_text("* I give you my word, Lancer.", "king", 2);
			scr_text("* ...", "lancer", 5);
			scr_text("* Dad, you were gonna...", "lancer", 10);
			scr_text("* As I told the heroes, it was a bluff so they would concede.", "king", 5);
			scr_text("* I would have never harmed you.", "king", 3);
			scr_text("* You...", "lancer", 10);
			scr_text("* ...", "king", 5);
			scr_text("* If you are truly worried about what I will do,", "king", 5);
			scr_text("* At least let me out briefly.", "king", 1);
			scr_text("* Let me stretch my legs around here for a while.", "king", 2);
			scr_text("* Then you may return and I will go into my cell without problem.", "king", 1);
			scr_text("* I think I can do that! Let me go ask", "lancer", 2);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_right, false);
				scr_text_cutoff_skip(38);
			scr_text("* Do not ask the Lightners.|* They will refuse my request.", "king", 6);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_right_sad, false);
			scr_text("* I raised you well, my boy.|* You can make your own decision on this.", "king", 0);
				scr_obj_sprite_on_page(obj_king, spr_king_sulk_left, false);
			scr_text("* I...", "lancer", 4);
			scr_text("* Just for a few minutes?", "lancer", 7);
			scr_text("* Just a few.", "king", 2);
			scr_text("* ...", "lancer", 6);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_left_sad, false);
			scr_text("* Okay.", "lancer", 0);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_right, false);
				scr_char_move_after_textbox(obj_lancer, spr_lancer_left, false, -30, 0, .2, 100);
				scr_layer_hide_after_textbox_delayed("Tiles_4", true, 100, snd_impact);
		break;
		
		case "self_5":
			scr_char_move_after_textbox(obj_lancer, spr_lancer_right, false, 30, 0, .2, 100);
		break;
		
		case "self_6":
			scr_text("* Is that good?", "lancer", 3);
			scr_text("* Perfect.", "king", 0);
				scr_obj_sprite_on_page(obj_king, spr_king_walk_left, false);
			scr_text("* If you wish to stand outside, you may do so.", "king", 5);
			scr_text("* I do not plan on leaving.", "king", 2);
			scr_text("* Okay!", "lancer", 1);
			scr_char_move_after_textbox(obj_lancer, spr_lancer_left, false, -30, 0, .2, 40);
		break;
		
		case "self_7":
			scr_text("* One more thing, Lancer.", "king", 0);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_right, false);
			scr_text("* Do you think you could possibly get me a phone?", "king", 5);
			scr_text("* I wish to check up on some... friends of mine.", "king", 1);
			scr_text("* Sure, Dad!", "lancer", 3);
			scr_queue_movement_group_after_textbox([
				   { obj: obj_lancer, sprite: spr_lancer_left, loop: false, dx: -30, dy: 0, speed: .2, duration: 60 },
				   { obj: obj_king, sprite: spr_king_walk_left, loop: true, dx: -2, dy: 5, speed: .2, duration: 75 }
			]);
		break;
		
		case "self_8":
		    scr_char_move_after_textbox(obj_lancer, spr_lancer_right_phone, false, 30, 0, .2, 100);
		    scr_custom_call_after_textbox_delayed(function()
		        {
		            global.king_moved_x = obj_king.x;
		            global.king_moved_y = obj_king.y;
		        }, 1);
		break;
		
		case "self_9":
			scr_text("* Here!|* I got it from Girldad!", "lancer", 3);
				scr_obj_sprite_on_page(obj_lancer, spr_lancer_right, false);
				scr_snd_on_page(snd_item, 1);
			scr_text("* Thank you.", "king", 0);
			scr_text("* I am very proud of your decision-making skills.", "king", 0);
			scr_text("* Wow, a compliment!|* I guess you have changed!", "lancer", 2);
			scr_text("* As I said.", "king", 0);
			scr_text("* Okay, I'll be outside.|* Enjoy your free time!", "lancer", 1);
			scr_text("* I will, thank you.", "king", 7);
				scr_char_move_after_textbox(obj_lancer, spr_lancer_left, false, -30, 0, .2, 100);
		break;
		
		case "self_10":
		    scr_text("* ...", "king", 5);
		    scr_text("* If only he knew.", "king", 0);
		    scr_text("* If he knew just how wrong he is.", "king", 4);
		    scr_text("* ...", "king", 5);
		    scr_text("* My son.", "king", 0);
		        scr_fade_after_textbox(c_black, true, 0, true);
		break;
		
		case "self_11":
			audio_play_sound(snd_phone_ring, 1, false);
		break;
		
		case "self_12":
			scr_text("* Hello?", "king");
				scr_text_hide_face(true); 
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", true);
			scr_text("* ...", "king");
			scr_text("* Yes, I know you have somewhere to be, but", "king");
				scr_text_cutoff_skip(43);
			scr_text("* ...", "king");
			scr_text("* I do not wish to impede on your time.", "king");
			scr_text("* All I request is for you to help me with something.", "king");
			scr_text("* As your humble servant, I believe I deserve", "king");
				scr_text_cutoff_skip(45);
			scr_text("* ...", "king");
			scr_text("* I HOPE to deserve such an honor from you.", "king");
			scr_text("* ...", "king");
			scr_text("* Thank you.", "king");
			scr_text("* I will be here when you arrive.|* In my cell.", "king");
			scr_text("* Do you", "king");
				scr_text_cutoff_skip(8);
			scr_text("* ...", "king");
			scr_text("* I see.", "king");
			scr_text("* I just need to", "king");
				scr_text_cutoff_skip(16);
			scr_text("* (Click...)", "noone");
			scr_text("* ...", "king");
			scr_text("* Hello?", "king");
			scr_text("* ...", "king");
		break;
		
		case "self_13":
			scr_fade_warp_with_music(rm_two, 240, sng_empty);
		break;
		
		case "self_14":
			scr_char_move_after_textbox(obj_susie, spr_susie_walk_up, true, 0, -20, .2, 55);
			scr_obj_sprite_after_textbox_delayed(obj_susie, spr_susie_right, false, 55);
			scr_obj_sprite_after_textbox_delayed(obj_lancer, spr_lancer_left, false, 30);
		break;
		
		case "self_15":
			scr_text("* Hi Susie!", "lancer", 1);
				scr_text_hide_face(false); 
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", false);
			scr_text("* Hey dude!", "susie", 7);
			scr_text("* How'd your talk with Toothpaste Boy go?", "lancer", 2);
			scr_text("* We, uh...", "susie", 10);
			scr_text("* Haven't talked yet?", "susie", 12);
			scr_text("* He's been busy fixing up things around Castle Town since we got back, so...", "susie", 13);
			scr_text("* Why are you out here?", "susie", 6);
			scr_text("* ...", "lancer", 0);
			scr_text("* Incredible!", "lancer", 8);
				scr_text_slow(.3);
			scr_text("* Dude, that's...", "susie", 11);
			scr_text("* Not helpful.", "susie", 4);
			scr_text("* I'm waiting for Girldad to finish printing something!", "lancer", 1);
			scr_text("* Oh, sick!|* What's she printing?", "susie", 7);
			scr_text("* My face.", "lancer", 2);
			scr_text("* Your... face?", "susie", 6);
			scr_text("* I'm making banners!", "lancer", 3);
			scr_text("* ...With your face.", "susie", 3);
			scr_text("* Yeah!", "lancer", 2);
			scr_text("* Hey, I think we could use those for Noelle's welcome party!", "susie", 6);
			scr_text("* Bet she'd love that.", "susie", 56);
			scr_text("* I didn't know she was coming!", "lancer", 3);
			scr_text("* Well, I have to talk to Ralsei about it first.", "susie", 41);
			scr_text("* Hopefully he... gets the point easily enough.", "susie", 10);
			scr_text("* Okay!", "lancer", 1);
			scr_text("* ...", "susie", 20);
			scr_text("* I'll see you around, dude.", "susie", 3);
			scr_text("* Okay!", "lancer", 1);
				scr_char_move_after_textbox(obj_susie, spr_susie_walk_down, true, 0, 20, .2, 55);
		break;
		
		case "self_16":
			scr_fade_warp_with_music(rm_three, 240, sng_cardjail);
		break;
		
		case "self_17":
			scr_char_move_after_textbox(obj_lancer, spr_lancer_right, false, 30, 0, .2, 100);
			scr_obj_sprite_after_textbox_delayed(obj_king, spr_king_walk_left, false, 50);
		break;
		
		case "self_18":
			scr_text("* How are your friends, Dad?", "lancer", 1);
			scr_text("* My...", "king", 5);
			scr_text("* ...", "king", 5);
			scr_text("* They are good.", "king", 2);
			scr_text("* Nice!", "lancer", 2);
			scr_text("* I'll... give you a few more minutes?", "lancer", 1);
			scr_text("* I appreciate it.", "king", 7);
			scr_text("* Okay!", "lancer", 3);
				scr_char_move_after_textbox(obj_lancer, spr_lancer_left, false, -30, 0, .2, 100);
		break;
		
		case "self_19":
			scr_text("* ...", "king", 5);
			scr_text("* Soon.", "king", 5);
			scr_text("* Very, very soon.", "king", 0);
		break;
		
		case "self_20":
			scr_fade_warp_with_music(rm_four, 240, sng_queensboard);
		break;
		
		case "self_21":
			if (!audio_is_playing(sng_queensboard)){audio_play_sound(sng_queensboard, 1, true)}
		    scr_text("* The kid needs his face on EVERY banner?", "tenna");
		    scr_text("* Jeez, that's more publicity than I get!", "tenna");
		        scr_obj_sprite_on_page(obj_tenna, spr_tenna_whisper, false);
		        scr_obj_sprite_after_textbox(obj_tenna, spr_tenna_headup, false);
		        scr_obj_spawn_after_textbox(obj_queen_print, obj_queen.x, obj_queen.y, "Instances");
				scr_snd_after_textbox(snd_printing, 1);
		break;
		
		case "self_22":
			scr_text("* I Think He Has A Cool Face", "queen", 1);
			scr_text("* It Would Be Cooler If It Were A Robot One Though", "queen", 15);
			scr_text("* What is with you and robot faces?", "tenna");
				scr_obj_sprite_on_page(obj_tenna, spr_tenna_laugh, true);
			scr_text("* I Can Attach Them Easily To My Bosom", "queen", 7);
				scr_obj_sprite_on_page(obj_queen, spr_queen_laughing, true);
				scr_set_var_on_page_delayed(obj_tenna, "image_speed", "0", 90);
			scr_text("* ...", "tenna");
			scr_text("* Doesn't the Internet have censors against this stuff???", "tenna");
				scr_obj_sprite_on_page(obj_tenna, spr_tenna_tie1, false);
			scr_text("* Nope", "queen", 1);
				scr_obj_sprite_on_page(obj_queen, spr_queen_walk_right, false);
			scr_text_secondary("I hacked them", "queen", 23);
			scr_text("* Ah.", "tenna");
				scr_obj_sprite_on_page(obj_tenna, spr_tenna_headup, false);
				scr_snd_on_page(snd_tenna1, 1);
				scr_char_move_after_textbox(obj_ralsei, spr_ralsei_walk_up, true, 0, -15, .2, 75);
				scr_obj_sprite_after_textbox_delayed(obj_queen, spr_queen_walk_down, false, 60);
				scr_obj_sprite_after_textbox_delayed(obj_ralsei, spr_ralsei_walk_up, false, 75);
		break;
		
		case "self_23":
			scr_text("* Am I interrupting something?", "ralsei", 33);
			scr_text("* Just A Lancer Publicity Act (Patent Pending)", "queen", 1);
				scr_obj_sprite_on_page(obj_queen, spr_queen_laughing, true);
			scr_text("* ...", "ralsei", 22);
			scr_text("* Anyways, I wanted to get both of your opinions on something.", "ralsei", 20);
			scr_text("* Lay it on us, plushie!", "tenna");
				scr_obj_sprite_on_page(obj_tenna, spr_tenna_point_at_screen, false);
			scr_text("* ...What?", "ralsei", 21);
			scr_text("* Lay it on us, Ralsei!", "tenna");
			scr_text("* What do you guys think of Noelle's return to the Dark World?", "ralsei", 4);
			scr_text("* I know Susie really wants it, and I don't blame her, but...", "ralsei", 8);
			scr_text("* Something about this doesn't feel like... the right thing to want.", "ralsei", 18);
			scr_text("* It's not even a matter of the Prophecy, it's just...", "ralsei", 5);
			scr_text("* I Think Noelle Would Be A Great Addition To My Town", "queen", 1);
				scr_obj_sprite_on_page(obj_queen, spr_queen_walk_down, false);
			scr_text("* Your... town?", "ralsei", 22);
			scr_text("* Did I Stutter", "queen", 1);
				scr_obj_sprite_on_page(obj_queen, spr_queen_laughing, true);
			scr_text("* I can't really fit a 4th podium for the gameshow, so...", "tenna");
				scr_obj_sprite_on_page(obj_queen, spr_queen_walk_down, false);
			scr_text("* If she wants to join, you gotta kick Susie out. ", "tenna");
				scr_obj_sprite_on_page(obj_tenna, spr_tenna_laugh_up, false);
				scr_text_secondary("We're not doing your show again???", "ralsei", 30);
			scr_text("* It just feels weird, you know?", "ralsei", 6);
			scr_text("* It's been the three of us for the whole time, and now...", "ralsei", 7);
			scr_text("* She Was With You Guys Like 3 Days Ago", "queen", 13);
			scr_text("* As Was Burghley", "queen", 9);
			scr_text("* L Memory Loss", "queen", 1);
				scr_obj_sprite_on_page(obj_queen, spr_queen_laughing, true);
				scr_text_secondary("Okay...?", "ralsei", 22);
			scr_text("* I guess the real point is that I'm worried she'll disrupt things in motion.", "ralsei", 4);
				scr_obj_sprite_on_page(obj_tenna, spr_tenna_pose_podium, false);
			scr_text("* The Prophecy says what it says, and there isn't much I can do to change it, but...", "ralsei", 5);
			scr_text("* Didn't That Flower Man Tell You To Stop Doing That", "queen", 10);
				scr_obj_sprite_on_page(obj_queen, spr_queen_walk_down, false);
			scr_text("* How... How did you know about Flowery???", "ralsei", 12);
			scr_text("* Orb", "queen", 1);
				scr_text_secondary("...", "ralsei", 31);
			scr_text("* Well, thanks, you guys!", "ralsei", 2);
				scr_char_move_after_textbox(obj_ralsei, spr_ralsei_walk_down, true, 0, 15, .2, 75);
		break;
		
		case "self_24":
			scr_text("* Who's Noelle Again", "queen", 18);
				scr_obj_sprite_on_page(obj_queen, spr_queen_walk_right, false);
			scr_text("* Talk about a memory loss!", "tenna");
				scr_obj_sprite_on_page(obj_tenna, spr_tenna_laugh, true);
				scr_snd_on_page(snd_crowdlaugh, 1);
			scr_text("* Shut Up There's A Server Malfunction", "queen", 16);
				scr_obj_sprite_on_page(obj_tenna, spr_tenna_headup, false);
			scr_text("* Anyways Let Me Go Give This To Lancer", "queen", 1);
			scr_queue_movement_group_after_textbox([
			    { obj: obj_queen, sprite: spr_queen_walk_down, loop: true, dx: 0, dy: 15, speed: .2, duration: 30 }
			]);
			scr_queue_movement_group_after_textbox([
			    { obj: obj_queen, sprite: spr_queen_walk_right, loop: true, dx: 18, dy: 0, speed: .2, duration: 30 }
			]);
			scr_queue_movement_group_after_textbox([
			    { obj: obj_queen, sprite: spr_queen_walk_down, loop: true, dx: 0, dy: 30, speed: .2, duration: 90 }
			]);
		break;
		
		case "self_25":
			scr_text("* Guess I'll just...", "tenna");
			scr_text("* Go talk to Mike?", "tenna");
		break;
		
		case "self_26":
			scr_fade_warp_with_music(rm_five, 240, sng_empty);
		break;
		
		case "self_27":
			scr_char_move_after_textbox(obj_queen, spr_queen_walk_right, true, 30, 0, .2, 120);
			scr_obj_sprite_after_textbox_delayed(obj_queen, spr_queen_walk_up, false, 120);
		break;
		
		case "self_28":
			scr_text("* I Printed Out Your Face", "queen", 1);
			scr_text("* I Completely Forgot To Bring It Though", "queen", 9);
				scr_text_secondary("My Bad", "queen", 1)
			scr_text("* Thank you Girldad!", "lancer", 1);
			scr_text("* Why Are You Standing Out Here", "queen", 15);
			scr_text("* ...", "lancer", 6);
			scr_text("* Can you keep a secret?", "lancer", 0);
			scr_text("* Sure", "queen", 1);
				scr_text_secondary("???", "queen", 18)
			scr_text("* I let my dad out of his cage for a bit so he could stretch his legs.", "lancer", 2);
			scr_text("* ...", "queen", 1);
			scr_text("* You Did What", "queen", 21);
			scr_text("* It's okay!|* He's not gonna leave the room.", "lancer", 3);
			scr_text("* Especially because I gave him a phone to call his friends while he's out!", "lancer", 1);
			scr_text("* Whose Phone Did You Give Him", "queen", 3);
			scr_text("* Yours.", "lancer", 2);
			scr_text("* ...", "queen", 4);
			scr_text("* Why Did You Let Him Out", "queen", 3);
			scr_text("* He's Dangerous", "queen", 5);
			scr_text("* He's changed!", "lancer", 1);
			scr_text("* How So", "queen", 11);
			scr_text("* He was giving me a bunch of compliments,", "lancer", 2);
			scr_text("* and he gave me his word that he wouldn't attack my friends!", "lancer", 3);
			scr_text("* And How Much Do You Value His Word", "queen", 13);
			scr_text("* ...", "lancer", 6);
			scr_text("* He's my dad... I have to trust him.", "lancer", 7);
			scr_text("* ...", "queen", 4);
			scr_text("* Let Me Go Have A Chit Chat With This Guy", "queen", 3);
			scr_text("* Okay!|* Enjoy!", "lancer", 3);
		break;
		
		case "self_29":
			scr_fade_warp_with_music(rm_six, 240, sng_cardjail);
		break;
		
		case "self_30":
			scr_char_move_after_textbox(obj_queen, spr_queen_walk_right, true, 30, 0, .2, 90);
		break;
		
		case "self_31":
			scr_text("* Hey", "queen", 2);
				scr_obj_sprite_on_page(obj_king, spr_king_walk_left, false);
			scr_text("* What do you want?", "king", 5);
			scr_text("* Why Are You Tricking Lancer", "queen", 2);
			scr_text("* And Who Did You Call On The Phone", "queen", 0);
				scr_text_secondary("I Can Check Records", "queen", 6)
			scr_text("* No one of your concern, woman.", "king", 0);
			scr_text("* Don't bother with the records, either. I already deleted the conversation.", "king", 4);
			scr_text("* Darn My One Weakness", "queen", 10);
			scr_text("* Anyways", "queen", 9);
			scr_text("* The First Question", "queen", 0);
			scr_text("* There is no trickery in the slightest.", "king", 5);
			scr_text("* Why do you assume such foul play of me?", "king", 10);
			scr_text("* You Literally Threatened To Throw Him Off A Cliff", "queen", 16);
			scr_text("* As I told him, it was just a bluff.", "king", 0);
			scr_text("* You Don't Threaten To Do That To A Kid", "queen", 17);
			scr_text("* That's Just Messed Up", "queen", 16);
			scr_text("* Who are you to critique my parenting skills?", "king", 5);
			scr_text("* Lancer has grown up into a fine young pumpkin.", "king", 7);
			scr_text("* How Often Do You Beat Him", "queen", 13);
			scr_text("* ...", "king", 8);
			scr_text("* How DARE you accuse me of hurting my child.", "king", 9);
			scr_text("* He's Basically My Kid At This Point", "queen", 24);
			scr_text("* You've known him for a few days. He is in no way your son as he is mine.", "king", 6);
			scr_text("* I'm Pretty Sure He Respects Me More Than You", "queen", 6);
			scr_text("* Plus I Don't Threaten To Kill Him", "queen", 13);
			scr_text("* Or His Friends", "queen", 9);
			scr_text("* Is that so?", "king", 5);
			scr_text("* Well I Mean There Was That One Time But They Were Fine LOL", "queen", 25);
			scr_text("* Also You Wanted Them To Like: Actually Die", "queen", 5);
			scr_text("* That's Kinda Mean", "queen", 2);
			scr_text("* They deserved it.|* They still do.", "king", 0);
			scr_text("* But do not fret. A plan is working its ways through the system as we speak.", "king", 4);
			scr_text("* Doesn't Sound Like You've Changed Much", "queen", 3);
			scr_text("* As I promised my son, I will not lift a finger to harm anybody here, nor the heroes.", "king", 0);
			scr_text("* All I want is to be free.", "king", 1);
			scr_text("* That's Interesting", "queen", 0);
			scr_text("* Why is that?", "king", 5);
			scr_text("* You Want To Be Free Yet You Trapped That Clown Down In Your Castle", "queen", 11);
			scr_text("* ...", "king", 6);
			scr_text("* Who told you about him?", "king", 5);
			scr_text("* My Kid", "queen", 7);
			scr_text("* ...", "king", 5);
			scr_text("* Jevil was a different situation.", "king", 5);
			scr_text("* So Basically Someone Goes Crazy And You Lock Them Up", "queen", 10);
			scr_text("* Wow Sounds Familiar Doesn't It", "queen", 11);
				scr_text_secondary("Wink Wink", "queen", 23);
			scr_text("* I am not crazy.", "king", 8);
			scr_text("* Keep Telling Yourself That", "queen", 9);
			scr_text("* Maybe One Day It'll Be True", "queen", 20);
				scr_char_move_after_textbox(obj_queen, spr_queen_walk_left, true, -30, 0, .2, 90);
		break;
		
		case "self_32":
			scr_fade_warp_with_music(rm_one, 999999999999, sng_empty);
		break;
/*
Queen: So Basically Someone Goes Crazy And You Lock Them Up
Queen: Wow Sounds Familiar Doesn't It
	(Queen: Wink Wink)
King: I am not crazy.
Queen: Keep Telling Yourself That
Queen: Maybe One Day It'll Be True
(Queen walks out)
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