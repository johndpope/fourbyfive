//
//  Constants.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 05/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation


struct Constants {
    
    struct Api {
        
        public static let host = "i.instagram.com"
        
        /**
         * API URL
         */
        public static let url = "https://\(host)/api/v1/";
        
        /**
         * API Key (extracted from the apk)
         */
        public static let key = "f372b2a5f14d1bebedaaa4ac6f8d506db30ffdd6185b8e0cdfa7dab42f5a9cc6";
        
        /**
         * API Key Version
         */
        public static let keyVersion = "4";
        
        public static let imageCompression = "{\"lib_name\":\"jt\",\"lib_version\":\"1.3.0\",\"quality\":\"87\"}";
    }
    
    struct Device {
        
        
        /**
         * Device to mimic
         */
        public static let manufacturer = "samsung";
        
        /**
         * Model to mimic
         */
        public static let model = "SM-G935F";
        
        
        /**
         * Android version to mimic
         */
        public static let version = "23";
        
        /**
         * Android Release
         */
        public  static let  release = "6.0.1";
        
        /**
         * Experiments Activated
         */
        public static let experiments = "ig_android_universe_video_production,ig_search_client_h1_2017_holdout,ig_android_carousel_non_square_creation,ig_android_live_analytics,ig_android_realtime_mqtt_logging,ig_branded_content_show_settings_universe,ig_android_stories_server_coverframe,ig_android_live_dash_predictive_streaming,ig_android_video_captions_universe,ig_business_growth_acquisition_holdout_17h2,ig_android_ontact_invite_universe,ig_android_ad_async_ads_universe,ig_android_shopping_tag_creation_carousel_universe,ig_feed_engagement_holdout_universe,ig_direct_pending_inbox_memcache,ig_promote_guided_budget_duration_options_universe,ig_android_verified_comments_universe,ig_feed_lockdown,android_instagram_prefetch_suggestions_universe,ig_android_gallery_order_by_date_taken,ig_shopping_viewer_intent_actions,ig_android_startup_prefetch,ig_android_business_post_insights_v3_universe,ig_android_custom_story_import_intent,ig_video_copyright_whitelist,ig_explore_holdout_universe,ig_android_device_language_reset,ig_android_videocall_consumption_universe,ig_android_live_fault_tolerance_universe,ig_android_main_feed_seen_state_dont_send_info_on_tail_load,ig_android_face_filter_glyph_nux_animation_universe,ig_android_direct_allow_consecutive_likes,ig_android_livewith_guest_adaptive_camera_universe,ig_android_business_new_ads_payment_universe,ig_android_audience_control,ig_promotion_insights_sticky_tab_universe,ig_android_unified_bindergroup_in_staticandpagedadapter,ig_android_ad_new_viewability_logging_universe,ig_android_ad_impression_backtest,ig_android_log_account_switch_usable,ig_android_mas_viewer_list_megaphone_universe,ig_android_photo_fbupload_universe,ig_android_carousel_drafts,ig_android_bug_report_version_warning,ig_fbns_push,ig_android_carousel_no_buffer_10_30,ig_android_sso_family_key,ig_android_profile_tabs_redesign_universe,ig_android_user_url_deeplink_fbpage_endpoint,ig_android_fix_slow_rendering,ig_android_hide_post_in_feed,ig_android_shopping_thumbnail_icon,ig_android_ad_watchbrowse_universe,ig_android_search_people_tag_universe,ig_android_codec_high_profile,ig_android_long_impression_tracking,ig_android_inline_appeal,ig_android_log_mediacodec_info,ig_android_direct_expiring_media_loading_errors,ig_android_camera_face_filter_api_retry,ig_video_use_sve_universe,ig_android_low_data_mode,ig_android_enable_zero_rating,ig_android_sample_ppr,ig_android_force_logout_user_with_mismatched_cookie,ig_android_smartisan_app_badging,ig_android_direct_expiring_media_fix_duplicate_thread,ig_android_reverse_audio,ig_android_branded_content_three_line_ui_universe,ig_android_comments_impression_logger,ig_android_live_encore_production_universe,ig_promote_independent_ctas_universe,ig_android_http_stack_experiment_2017,ig_android_pending_request_search_bar,ig_android_main_feed_carousel_bumping_animation,ig_android_live_thread_delay_for_mute_universe,ig_android_fb_topsearch_sgp_fork_request,ig_android_heap_uploads,ig_android_stories_archive_universe,ig_android_business_ix_fb_autofill_universe,ig_lockdown_feed_shrink_universe,ig_android_stories_create_flow_favorites_tooltip,ig_android_direct_ephemeral_replies_with_context,ig_android_live_viewer_invite_universe,ig_android_promotion_feedback_channel,ig_profile_holdout_2017_universe,ig_android_executor_null_queue,ig_android_stories_video_loading_spinner_improvements,ig_android_direct_share_intent,ig_android_live_capture_translucent_navigation_bar,ig_stories_camera_blur_drawable,ig_android_stories_drawing_sticker,ig_android_facebook_twitter_profile_photos,ig_android_shopping_tag_creation_universe,ig_android_story_decor_image_fbupload_universe,ig_android_comments_ranking_kill_switch_universe,ig_promote_profile_visit_cta_universe,ig_android_story_reactions,ig_android_ppr_main_feed_enhancements,ig_android_used_jpeg_library,ig_carousel_draft_multiselect,ig_android_stories_close_to_left_head,ig_android_video_delay_auto_start,ig_android_live_with_invite_sheet_search_universe,ig_android_stories_archive_calendar,ig_android_ad_watchbrowse_cta_universe,ig_android_ads_manager_pause_resume_ads_universe,ig_android_main_feed_carousel_bumping,ig_stories_in_feed_unit_design_universe,ig_android_explore_iteminfo_universe_exp,ig_android_me_only_universe,ig_android_live_video_reactions_consumption_universe,ig_android_stories_hashtag_text,ig_android_live_reply_to_comments_universe,ig_android_live_save_to_camera_roll_universe,ig_android_sticker_region_tracking,ig_android_unified_inbox,ig_android_realtime_iris,ig_android_search_client_matching_2,ig_lockdown_notifications_universe,ig_android_feed_seen_state_with_view_info,ig_android_media_rows_prepare_10_31,ig_family_bridges_holdout_universe,ig_android_background_explore_fetch,ig_android_following_follower_social_context,ig_android_live_auto_collapse_comments_view_universe,ig_android_insta_video_consumption_infra,ig_android_ad_watchlead_universe,ig_android_direct_prefetch_direct_story_json,ig_android_cache_logger_10_34,ig_android_stories_weblink_creation,ig_android_histogram_reporter,ig_android_network_cancellation,ig_android_shopping_show_shop_tooltip,ig_android_video_delay_auto_start_threshold,ig_android_comment_category_filter_setting_universe,ig_promote_daily_budget_universe,ig_android_stories_camera_enhancements,ig_android_video_use_new_logging_arch,ig_android_ad_add_per_event_counter_to_logging_event,ig_android_feed_stale_check_interval,ig_android_crop_from_inline_gallery_universe,ig_android_direct_reel_options_entry_point,ig_android_stories_gallery_improvements,ig_android_live_broadcaster_invite_universe,ig_android_inline_photos_of_you_universe,ig_android_prefetch_notification_data,ig_android_direct_full_size_gallery_upload_universe_v2,ig_android_direct_app_deeplinking,ig_promotions_unit_in_insights_landing_page,ig_android_reactive_feed_like_count,ig_android_camera_ff_story_open_tray,ig_android_stories_asset_search,ig_android_constrain_image_size_universe,ig_rn_top_posts_stories_nux_universe,ig_ranking_following,ig_android_camera_retain_face_filter,ig_android_direct_inbox_presence,ig_android_live_skin_smooth,ig_android_stories_posting_offline_ui,ig_android_sidecar_video_upload_universe,ig_android_canvas_swipe_to_open_universe,ig_android_qp_features,android_ig_stories_without_storage_permission_universe2,ig_android_reel_raven_video_segmented_upload_universe,ig_android_swipe_navigation_x_angle_universe,ig_android_invite_xout_universe,ig_android_offline_mode_holdout,ig_android_live_send_user_location,ig_android_live_encore_go_live_button_universe,ig_android_analytics_logger_running_background_universe,ig_android_save_all,ig_android_live_report_watch_time_when_update,ig_android_family_bridge_discover,ig_android_startup_manager,instagram_search_and_coefficient_holdout,ig_android_high_res_upload_2,ig_android_dynamic_background_prefetch,ig_android_http_service_same_thread,ig_android_scroll_to_dismiss_keyboard,ig_android_remove_followers_universe,ig_android_skip_video_render,ig_android_crash_native_core_dumping,ig_android_one_tap_nux_upsell,ig_android_segmentation,ig_profile_holdout_universe,ig_dextricks_module_loading_experiment,ig_android_comments_composer_avatar_universe,ig_android_direct_open_thread_with_expiring_media,ig_android_post_capture_filter,ig_android_rendering_controls,ig_android_os_version_blocking,ig_android_no_prefetch_video_bandwidth_threshold,ig_android_encoder_width_safe_multiple_16,ig_android_warm_like_text,ig_android_request_feed_on_back,ig_comments_team_holdout_universe,ig_android_e2e_optimization_universe,ig_shopping_insights,ig_android_direct_async_message_row_building_universe,ig_android_fb_connect_follow_invite_flow,ig_android_direct_24h_replays,ig_android_video_stitch_after_segmenting_universe,ig_android_instavideo_periodic_notif,ig_android_enable_swipe_to_dismiss_for_all_dialogs,ig_android_stories_camera_support_image_keyboard,ig_android_warm_start_fetch_universe,ig_android_marauder_update_frequency,ig_camera_android_aml_face_tracker_model_version_universe,ig_android_ad_connection_manager_universe,ig_android_ad_watchbrowse_carousel_universe,ig_android_branded_content_edit_flow_universe,ig_android_video_feed_universe,ig_android_upload_reliability_universe,ig_android_direct_mutation_manager_universe,ig_android_ad_show_new_bakeoff,ig_heart_with_keyboad_exposed_universe,ig_android_react_native_universe_kill_switch,ig_android_comments_composer_callout_universe,ig_android_search_hash_tag_and_username_universe,ig_android_live_disable_speed_test_ui_timeout_universe,ig_android_miui_notification_badging,ig_android_qp_kill_switch,ig_android_ad_switch_fragment_logging_v2_universe,ig_android_ad_leadgen_single_screen_universe,ig_android_share_to_whatsapp,ig_android_live_snapshot_universe,ig_branded_content_share_to_facebook,ig_android_react_native_email_sms_settings_universe,ig_android_live_join_comment_ui_change,ig_android_camera_tap_smile_icon_to_selfie_universe,ig_android_feed_surface_universe,ig_android_biz_choose_category,ig_android_prominent_live_button_in_camera_universe,ig_android_video_cover_frame_from_original_as_fallback,ig_android_camera_leak_detector_universe,ig_android_live_hide_countdown_universe,ig_android_story_viewer_linear_preloading_count,ig_android_threaded_comments_universe,ig_android_stories_search_reel_mentions_universe,ig_promote_reach_destinations_universe,ig_android_progressive_jpeg_partial_download,ig_fbns_shared,ig_android_capture_slowmo_mode,ig_android_live_ff_fill_gap,ig_promote_clicks_estimate_universe,ig_android_video_single_surface,ig_android_video_download_logging,ig_android_foreground_location_collection,ig_android_last_edits,ig_android_pending_actions_serialization,ig_android_post_live_viewer_count_privacy_universe,ig_stories_engagement_2017_h2_holdout_universe,ig_android_image_cache_tweak_for_n,ig_android_direct_increased_notification_priority,ig_android_search_top_search_surface_universe,ig_android_live_dash_latency_manager,instagram_interests_holdout,ig_android_user_detail_endpoint,ig_android_videocall_production_universe,ig_android_ad_watchmore_entry_point_universe,ig_android_video_detail,ig_save_insights,ig_camera_android_new_face_effects_api_universe,ig_comments_typing_universe,ig_android_exoplayer_settings,ig_android_progressive_jpeg,ig_android_offline_story_stickers,ig_android_live_webrtc_audience_expansion_universe,ig_explore_android_universe,ig_android_video_prefetch_for_connectivity_type,ig_android_ad_holdout_watchandmore_universe,ig_promote_default_cta,ig_direct_stories_recipient_picker_button,ig_android_direct_notification_lights,ig_android_insights_relay_modern,ig_android_insta_video_abr_resize,ig_android_insta_video_sound_always_on,ig_android_fb_content_provider_anr_fix,ig_android_in_app_notifications_queue,ig_android_live_follow_from_comments_universe,ig_android_comments_new_like_button_position_universe,ig_android_hyperzoom,ig_android_live_broadcast_blacklist,ig_android_camera_perceived_perf_universe,ig_android_search_clear_layout_universe,ig_promote_reachbar_universe,ig_android_ad_one_pixel_logging_for_reel_universe,ig_android_stories_surface_universe,ig_android_stories_highlights_universe,ig_android_reel_viewer_fetch_missing_reels_universe,ig_android_arengine_separate_prepare,ig_android_direct_video_segmented_upload_universe,ig_android_direct_search_share_sheet_universe,ig_android_business_promote_tooltip,ig_android_direct_blue_tab,ig_android_instavideo_remove_nux_comments,ig_android_draw_rainbow_client_universe,ig_android_use_simple_video_player,ig_android_rtc_reshare,ig_android_enable_swipe_to_dismiss_for_favorites_dialogs,ig_android_auto_retry_post_mode,ig_fbns_preload_default,ig_android_emoji_sprite_sheet,ig_android_cover_frame_blacklist,ig_android_gesture_dismiss_reel_viewer,ig_android_gallery_grid_column_count_universe,ig_android_ad_logger_funnel_logging_universe,ig_android_live_encore_consumption_settings_universe,ig_perf_android_holdout,ig_android_list_redesign,ig_android_stories_separate_overlay_creation,ig_android_ad_show_new_interest_survey,ig_android_live_encore_reel_chaining_universe,ig_android_vod_abr_universe,ig_android_audience_profile_icon_badge,ig_android_immersive_viewer,ig_android_analytics_use_a2,ig_android_react_native_universe,ig_android_direct_thread_name_as_notification,ig_android_su_rows_preparer,ig_android_leak_detector_universe,ig_android_video_loopcount_int,ig_android_qp_sticky_exposure_universe,ig_android_enable_main_feed_reel_tray_preloading,ig_android_camera_upsell_dialog,ig_android_live_time_adjustment_universe,ig_android_internal_research_settings,ig_android_prod_lockout_universe,ig_android_react_native_ota,ig_android_main_camera_share_to_direct,ig_android_cold_start_feed_request,ig_android_fb_family_navigation_badging_user,ig_stories_music_sticker,ig_android_send_impression_via_real_time,ig_android_sc_ru_ig,ig_android_animation_perf_reporter_timeout,ig_android_warm_headline_text,ig_android_post_live_expanded_comments_view_universe,ig_android_new_block_flow,ig_android_long_form_video,ig_android_sign_video_url,ig_android_image_task_cancel_logic_fix,ig_android_stories_video_prefetch_kb,ig_android_video_render_prevent_cancellation_feed_universe,ig_android_live_stop_broadcast_on_404,android_face_filter_universe,ig_android_render_iframe_interval,ig_business_claim_page_universe,ig_android_live_move_video_with_keyboard_universe,ig_stories_vertical_list,ig_android_stories_server_brushes,ig_android_live_viewers_canned_comments_universe,ig_android_collections_cache,ig_android_payment_settings_universe,ig_android_live_face_filter,ig_android_canvas_preview_universe,ig_android_screen_recording_bugreport_universe,ig_story_camera_reverse_video_experiment,ig_downloadable_modules_experiment,ig_direct_core_holdout_q4_2017,ig_promote_updated_copy_universe,ig_android_search,ig_android_logging_metric_universe,ig_promote_budget_duration_slider_universe,ig_android_insta_video_consumption_titles,ig_android_video_proxy,ig_android_find_loaded_classes,ig_android_direct_expiring_media_replayable,ig_android_reduce_rect_allocation,ig_android_camera_universe,ig_android_post_live_badge_universe,ig_stories_holdout_h2_2017,ig_android_video_server_coverframe,ig_promote_relay_modern,ig_android_search_users_universe,ig_android_video_controls_universe,ig_creation_growth_holdout,android_segmentation_filter_universe,ig_qp_tooltip,ig_android_live_encore_consumption_universe,ig_android_experimental_filters,ig_android_shopping_profile_shoppable_feed,ig_android_save_collection_pivots,ig_android_business_conversion_value_prop_v2,ig_android_ad_browser_warm_up_improvement_universe,ig_promote_guided_ad_preview_newscreen,ig_android_livewith_universe,ig_android_whatsapp_invite_option,ig_android_video_keep_screen_on,ig_promote_automatic_audience_universe,ig_android_direct_remove_animations,ig_android_live_align_by_2_universe,ig_android_friend_code,ig_android_top_live_profile_pics_universe,ig_android_async_network_tweak_universe_15,ig_android_direct_init_post_launch,ig_android_camera_new_early_show_smile_icon_universe,ig_android_live_go_live_at_viewer_end_screen_universe,ig_android_live_bg_download_face_filter_assets_universe,ig_android_background_reel_fetch,ig_android_insta_video_audio_encoder,ig_android_video_segmented_media_needs_reupload_universe,ig_promote_budget_duration_split_universe,ig_android_upload_prevent_upscale,ig_android_business_ix_universe,ig_android_ad_browser_new_tti_universe,ig_android_self_story_layout,ig_android_business_choose_page_ui_universe,ig_android_camera_face_filter_animation_on_capture,ig_android_rtl,ig_android_comment_inline_expansion_universe,ig_android_live_request_to_join_production_universe,ig_android_share_spinner,ig_android_video_resize_operation,ig_android_stories_eyedropper_color_picker,ig_android_disable_explore_prefetch,ig_android_universe_reel_video_production,ig_android_react_native_push_settings_refactor_universe,ig_android_power_metrics,ig_android_sfplt,ig_android_story_resharing_universe,ig_android_direct_inbox_search,ig_android_direct_share_story_to_facebook,ig_android_exoplayer_creation_flow,ig_android_non_square_first,ig_android_insta_video_drawing,ig_android_swipeablefilters_universe,ig_android_direct_visual_replies_fifty_fifty,ig_android_reel_viewer_data_buffer_size,ig_android_video_segmented_upload_multi_thread_universe,ig_android_react_native_restart_after_error_universe,ig_android_direct_notification_actions,ig_android_profile,ig_android_additional_contact_in_nux,ig_stories_selfie_sticker,ig_android_live_use_rtc_upload_universe,ig_android_story_reactions_producer_holdout,ig_android_stories_reply_composer_redesign,ig_android_story_viewer_segments_bar_universe,ig_explore_netego,ig_android_audience_control_sharecut_universe,ig_android_direct_fix_top_of_thread_scrolling,ig_video_holdout_h2_2017,ig_android_insights_metrics_graph_universe,ig_android_ad_swipe_up_threshold_universe,ig_android_one_tap_send_sheet_universe,ig_android_international_add_payment_flow_universe,ig_android_live_see_fewer_videos_like_this_universe,ig_android_live_view_profile_from_comments_universe,ig_fbns_blocked,ig_android_direct_inbox_suggestions,ig_android_video_segmented_upload_universe,ig_carousel_post_creation_tag_universe,ig_android_mqtt_region_hint_universe,ig_android_suggest_password_reset_on_oneclick_login,ig_android_live_special_codec_size_list,ig_android_continuous_contact_uploading,ig_android_story_viewer_item_duration_universe,ig_promote_budget_duration_client_server_switch,ig_android_enable_share_to_messenger,ig_android_background_main_feed_fetch,promote_media_picker,ig_android_live_video_reactions_creation_universe,ig_android_sidecar_gallery_universe,ig_android_business_id,ig_android_story_import_intent,ig_android_feed_follow_button_redesign,ig_android_section_based_recipient_list_universe,ig_android_insta_video_broadcaster_infra_perf,ig_android_live_webrtc_livewith_params,ig_android_comment_audience_control_group_selection_universe,android_ig_fbns_kill_switch,ig_android_su_card_view_preparer_qe,ig_android_unified_camera_universe,ig_android_all_videoplayback_persisting_sound,ig_android_live_pause_upload,ig_android_branded_content_brand_remove_self,ig_android_direct_search_recipients_controller_universe,ig_android_ad_show_full_name_universe,ig_android_anrwatchdog,ig_android_camera_video_universe,ig_android_2fac,ig_android_audio_segment_report_info,ig_android_scroll_main_feed,ig_direct_bypass_group_size_limit_universe,ig_android_story_captured_media_recovery,ig_android_skywalker_live_event_start_end,ig_android_comment_hint_text_universe,ig_android_direct_search_story_recipients_universe,ig_android_ad_browser_gesture_control,ig_android_grid_cell_count,ig_promote_marketing_funnel_universe,ig_android_immersive_viewer_ufi_footer,ig_android_ad_watchinstall_universe,ig_android_comments_notifications_universe,ig_android_shortcuts,ig_android_new_optic,ig_android_audience_control_nux,favorites_home_inline_adding,ig_android_canvas_tilt_to_pan_universe,ig_internal_ui_for_lazy_loaded_modules_experiment,ig_android_direct_expiring_media_from_notification_behavior_universe,ig_android_fbupload_check_status_code_universe,ig_android_offline_reel_feed,ig_android_stories_viewer_modal_activity,ig_android_shopping_creation_flow_onboarding_entry_point,ig_android_activity_feed_click_state,ig_android_direct_expiring_image_quality_universe,ig_android_gl_drawing_marks_after_undo_backing,ig_android_story_gallery_behavior,ig_android_mark_seen_state_on_viewed_impression,ig_android_configurable_retry,ig_android_live_monotonic_pts,ig_android_live_webrtc_livewith_h264_supported_decoders,ig_story_ptr_timeout,ig_android_comment_tweaks_universe,ig_android_location_media_count_exp_ig,ig_android_image_cache_log_mismatch_fetch,ig_android_personalized_feed_universe,ig_android_direct_double_tap_to_like_messages,ig_android_comment_activity_feed_deeplink_to_comments_universe,ig_android_insights_holdout,ig_android_video_render_prevent_cancellation,ig_android_blue_token_conversion_universe,ig_android_tabbed_hashtags_locations_universe,ig_android_sfplt_tombstone,ig_android_live_with_guest_viewer_list_universe,ig_android_explore_chaining_universe,ig_android_gqls_typing_indicator,ig_android_comment_audience_control_universe,ig_android_direct_show_inbox_loading_banner_universe,ig_android_near_bottom_fetch,ig_promote_guided_creation_flow,ig_ads_increase_connection_step2_v2,ig_android_draw_chalk_client_universe";
        
        /**
         * Android Release
         */
        public static let userAgent = "Instagram 22.0.0.15.68 Android (\(version)/\(release); 640dpi; 1440x2560; \(manufacturer); \(model); hero2lte; samsungexynos8890; en_US)";

    }
    
}
