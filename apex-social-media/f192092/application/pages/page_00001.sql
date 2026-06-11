prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>146726770692635976661
,p_default_application_id=>192092
,p_default_id_offset=>8155984660337852939
,p_default_owner=>'WKSP_KCSI'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Timeline'
,p_alias=>'HOME'
,p_step_title=>'APEX Social Media'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.actions.add([{',
'      name: "like",',
'      action: (event, element, args) => {',
'         apex.items.P1_ACTION_ID.value = args.id;',
'         apex.event.trigger(document, ''action-like'');',
'      }',
'   }, {',
'      name: "delete",',
'      action: (event, element, args) => {',
'         apex.items.P1_ACTION_ID.value = args.id;',
'         apex.event.trigger(document, ''action-delete'');',
'      }',
'   }, {',
'      name: "open-map",',
'      action: () => {',
'         apex.event.trigger(document, ''action-open-map'');',
'      }',
'   }]);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.user-has-liked {',
'    color: red;',
'}',
'',
'@media (max-width: 640px) {',
'    .new-post-button {',
'        position: fixed;',
'        bottom: 24px;',
'        right: 24px;',
'        z-index: 1000;',
'    }',
'}'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_created_on=>wwv_flow_imp.dz('20260519054611Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260611165558Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_last_updated_by=>'IWAN.HERDIAN@KCSI-ID.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(159826426934414980757)
,p_plug_name=>'Post'
,p_static_id=>'post'
,p_title=>'Post'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize:js-headingLevel-1'
,p_plug_template=>2674150083631647148
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SM_POSTS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260519061313Z')
,p_updated_on=>wwv_flow_imp.dz('20260519092440Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(159826430033509980788)
,p_plug_name=>'Post and Like Locations'
,p_static_id=>'post-and-like-locations'
,p_region_name=>'map'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2674150083631647148
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct lat, lon, created_by, apex_util.get_since(created) as since from',
'  (',
'  select lat, lon, created_by, created from SM_POSTS',
'  union',
'  select lat, lon, created_by, created from SM_REACTIONS',
'  )'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_MAP_REGION'
,p_created_on=>wwv_flow_imp.dz('20260519092440Z')
,p_updated_on=>wwv_flow_imp.dz('20260611165558Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'IWAN.HERDIAN@KCSI-ID.COM'
);
wwv_flow_imp_page.create_map_region(
 p_id=>wwv_flow_imp.id(159826430063787980789)
,p_region_id=>wwv_flow_imp.id(159826430033509980788)
,p_height=>300
,p_navigation_bar_type=>'FULL'
,p_navigation_bar_position=>'END'
,p_init_position_zoom_type=>'QUERY_RESULTS'
,p_layer_messages_position=>'BELOW'
,p_legend_position=>'END'
,p_features=>'MOUSEWHEEL_ZOOM:RECTANGLE_ZOOM:SCALE_BAR:DISTANCE_TOOL'
,p_updated_on=>wwv_flow_imp.dz('20260611165558Z')
,p_updated_by=>'IWAN.HERDIAN@KCSI-ID.COM'
);
wwv_flow_imp_page.create_map_region_layer(
 p_id=>wwv_flow_imp.id(9907359077554642140)
,p_map_region_id=>wwv_flow_imp.id(159826430063787980789)
,p_name=>'Locations'
,p_static_id=>'locations'
,p_label=>'Locations'
,p_layer_type=>'POINT'
,p_display_sequence=>10
,p_location=>'REGION_SOURCE'
,p_has_spatial_index=>false
,p_geometry_column_data_type=>'LONLAT_COLUMNS'
,p_longitude_column=>'LON'
,p_latitude_column=>'LAT'
,p_point_display_type=>'SVG'
,p_point_svg_shape=>'Default'
,p_feature_clustering=>false
,p_tooltip_adv_formatting=>true
,p_tooltip_html_expr=>'&CREATED_BY. @ &SINCE.'
,p_info_window_adv_formatting=>true
,p_info_window_html_expr=>'<strong>&NAME.</strong><br><img src="#APEX_FILES#sample_data/employees/&AVATAR_IMAGE." alt="Avatar of &NAME." title="Avatar of &NAME." width="100">'
,p_legend_adv_formatting=>false
,p_allow_hide=>true
,p_updated_on=>wwv_flow_imp.dz('20260611165558Z')
,p_updated_by=>'IWAN.HERDIAN@KCSI-ID.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(159826428761549980776)
,p_plug_name=>'Timeline'
,p_static_id=>'timeline'
,p_region_name=>'timeline'
,p_region_css_classes=>'t-Chat'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
' p.id,',
' p.created_by AS user_name,',
' p.post_comment AS comment_text,',
' p.file_blob,',
' p.file_mime,',
'',
' apex_util.get_since(p.created) post_date,',
'',
' (',
'     select count(*) from SM_REACTIONS smr',
'     where smr.post_id=p.id',
' ) as REACTIONS,',
'',
' (',
'     select ''user-has-liked'' from SM_REACTIONS smr',
'     where smr.post_id=p.id and created_by=:APP_USER',
' ) USER_REACTION_CSS',
'',
' from SM_POSTS p',
'',
' order by p.created desc'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_created_on=>wwv_flow_imp.dz('20260519070744Z')
,p_updated_on=>wwv_flow_imp.dz('20260519072135Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(159826428916776980777)
,p_region_id=>wwv_flow_imp.id(159826428761549980776)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'USER_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'POST_DATE'
,p_body_adv_formatting=>false
,p_body_column_name=>'COMMENT_TEXT'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'USER_NAME'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'FILE_BLOB'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'WIDESCREEN'
,p_media_sizing=>'COVER'
,p_media_css_classes=>'selectDisable'
,p_media_description=>'&COMMENT_TEXT.'
,p_pk1_column_name=>'ID'
,p_mime_type_column_name=>'FILE_MIME'
,p_updated_on=>wwv_flow_imp.dz('20260519072135Z')
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(159826428976653980778)
,p_card_id=>wwv_flow_imp.id(159826428916776980777)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'&REACTIONS.'
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$like?id=&ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-heart &USER_REACTION_CSS. '
,p_action_css_classes=>'js-heart-button'
,p_is_hot=>false
,p_updated_on=>wwv_flow_imp.dz('20260519071719Z')
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(159826429141781980779)
,p_card_id=>wwv_flow_imp.id(159826428916776980777)
,p_action_type=>'BUTTON'
,p_position=>'SECONDARY'
,p_display_sequence=>20
,p_label=>'Delete'
,p_static_id=>'action_1'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$delete?id=&ID.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-trash-o'
,p_is_hot=>false
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>'trim(:user_name)=trim(:APP_USER)'
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
,p_updated_on=>wwv_flow_imp.dz('20260519072135Z')
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(159826428224175980770)
,p_button_sequence=>10
,p_button_name=>'ADD_POST'
,p_static_id=>'add-post'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Post'
,p_button_position=>'AFTER_LOGO'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'new-post-button'
,p_icon_css_classes=>'fa-plus'
,p_created_on=>wwv_flow_imp.dz('20260519064814Z')
,p_updated_on=>wwv_flow_imp.dz('20260519065405Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(159826428372130980772)
,p_button_id=>wwv_flow_imp.id(159826428224175980770)
,p_action_sequence=>10
,p_name=>'Open Post Dialog'
,p_action=>'NATIVE_OPEN_REGION'
,p_static_id=>'open-post-dialog'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(159826426934414980757)
,p_stop_execution_on_error=>true
,p_created_on=>wwv_flow_imp.dz('20260519065405Z')
,p_updated_on=>wwv_flow_imp.dz('20260519065405Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(159826428477374980773)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'post-button'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260519070355Z')
,p_updated_on=>wwv_flow_imp.dz('20260519070355Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(159826428614565980774)
,p_button_id=>wwv_flow_imp.id(159826428477374980773)
,p_action_sequence=>10
,p_name=>'Submit post'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_static_id=>'submit-post'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'Save',
  'show_processing', 'Y')).to_clob
,p_stop_execution_on_error=>true
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P1_FILE_BLOB'').value.length>0 ||',
'apex.item(''P1_POST_COMMENT'').value.length>0'))
,p_created_on=>wwv_flow_imp.dz('20260519070355Z')
,p_updated_on=>wwv_flow_imp.dz('20260519070355Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159826429175787980780)
,p_name=>'P1_ACTION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(159826428761549980776)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519072418Z')
,p_updated_on=>wwv_flow_imp.dz('20260519072418Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159826427276320980761)
,p_name=>'P1_FILE_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_item_source_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_prompt=>'Photo'
,p_source=>'FILE_BLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>2042262243893469891
,p_item_css_classes=>'file-upload'
,p_item_icon_css_classes=>'fa-camera-retro'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'DROPZONE_BLOCK',
  'display_download_link', 'Y',
  'dropzone_title', 'Share a photo..',
  'file_types', 'image/*',
  'filename_column', 'FILE_NAME',
  'max_file_size', '10000',
  'mime_type_column', 'FILE_MIME',
  'storage_type', 'DB_COLUMN')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519061313Z')
,p_updated_on=>wwv_flow_imp.dz('20260519085416Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159826427109732980759)
,p_name=>'P1_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_item_source_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519061313Z')
,p_updated_on=>wwv_flow_imp.dz('20260519064306Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159826427591551980764)
,p_name=>'P1_LAT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_item_source_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_source=>'LAT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519061313Z')
,p_updated_on=>wwv_flow_imp.dz('20260519093907Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159826427759727980765)
,p_name=>'P1_LON'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_item_source_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_source=>'LON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519061313Z')
,p_updated_on=>wwv_flow_imp.dz('20260519093907Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159826427168146980760)
,p_name=>'P1_POST_COMMENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_item_source_plug_id=>wwv_flow_imp.id(159826426934414980757)
,p_prompt=>'Post'
,p_source=>'POST_COMMENT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519061313Z')
,p_updated_on=>wwv_flow_imp.dz('20260519064306Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(159826429583688980784)
,p_name=>'action-delete'
,p_static_id=>'action-delete'
,p_event_sequence=>20
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-delete'
,p_created_on=>wwv_flow_imp.dz('20260519084511Z')
,p_updated_on=>wwv_flow_imp.dz('20260519084511Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(159826429743981980785)
,p_event_id=>wwv_flow_imp.id(159826429583688980784)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>unistr('DELETE \2013 Confirm dialog')
,p_static_id=>'delete-confirm-dialog'
,p_action=>'NATIVE_CONFIRM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'message', 'You are about to delete this post. Are you sure?',
  'title', 'Are you Sure?')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519084511Z')
,p_updated_on=>wwv_flow_imp.dz('20260519084511Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(159826429814013980786)
,p_event_id=>wwv_flow_imp.id(159826429583688980784)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>unistr('DELETE \2013 do database work')
,p_static_id=>'delete-do-database-work'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P1_ACTION_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from SM_REACTIONS where POST_ID = :P1_ACTION_ID and created_by=:APP_USER;',
    'delete from SM_POSTS where id=:P1_ACTION_ID and created_by=:APP_USER;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_created_on=>wwv_flow_imp.dz('20260519084511Z')
,p_updated_on=>wwv_flow_imp.dz('20260519084511Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(159826429927443980787)
,p_event_id=>wwv_flow_imp.id(159826429583688980784)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>unistr('DELETE \2013 remove post in UI')
,p_static_id=>'delete-remove-post-in-ui'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''[data-id=''+apex.items.P1_ACTION_ID.value+'']'').remove();')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519084511Z')
,p_updated_on=>wwv_flow_imp.dz('20260519084511Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(159826429323176980781)
,p_name=>'action-like'
,p_static_id=>'action-like'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-like'
,p_created_on=>wwv_flow_imp.dz('20260519072849Z')
,p_updated_on=>wwv_flow_imp.dz('20260519083528Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(159826429529710980783)
,p_event_id=>wwv_flow_imp.id(159826429323176980781)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'LIKE -- do database work'
,p_static_id=>'like-do-database-work'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P1_ACTION_ID,P1_LAT,P1_LON',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    -- try to store this posts'' reaction from this user',
    '    insert into SM_REACTIONS (post_id, reaction, lat, lon)',
    '        values (:P1_ACTION_ID, ''LIKED'', :P1_LAT, :P1_LON);',
    '    exception when dup_val_on_index then',
    '        -- remove it as it already existed',
    '        delete from SM_REACTIONS where',
    '            post_id=:P1_ACTION_ID and created_by=:APP_USER;',
    '    end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_created_on=>wwv_flow_imp.dz('20260519083528Z')
,p_updated_on=>wwv_flow_imp.dz('20260519083528Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(159826429453370980782)
,p_event_id=>wwv_flow_imp.id(159826429323176980781)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'LIKE - update UI (adjust count + heart color)'
,p_static_id=>'like-update-ui-adjust-count-heart-color'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const button = $(''[data-id="''+ apex.items.P1_ACTION_ID.value +''"] .js-heart-button''); // get the card',
    '',
    '    const label = button.find(''.a-CardView-buttonLabel''); // get the likes count section',
    '',
    '    const icon = button.find(''.a-CardView-buttonIcon''); // gets the element if its liked already',
    '',
    '    let likeCount = label.text(); // get the like count',
    '',
    '    if (icon.hasClass(''user-has-liked'')) {',
    '        // user has liked this already, and they are unliking it now -- decrement',
    '        label.text(--likeCount);',
    '',
    '    } else {',
    '        // user is liking the post -- increment',
    '        label.text(++likeCount);',
    '    }',
    '',
    '    icon.toggleClass(''user-has-liked''); // either add this class or remove it')))).to_clob
,p_created_on=>wwv_flow_imp.dz('20260519072849Z')
,p_updated_on=>wwv_flow_imp.dz('20260519083528Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9907359211481642141)
,p_name=>'action-open-map'
,p_static_id=>'action-open-map'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-open-map'
,p_created_on=>wwv_flow_imp.dz('20260519093606Z')
,p_updated_on=>wwv_flow_imp.dz('20260519093606Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9907359357678642142)
,p_event_id=>wwv_flow_imp.id(9907359211481642141)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(159826430033509980788)
,p_created_on=>wwv_flow_imp.dz('20260519093606Z')
,p_updated_on=>wwv_flow_imp.dz('20260519093606Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9907359422565642143)
,p_name=>'Get Device Location'
,p_static_id=>'get-device-location'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_created_on=>wwv_flow_imp.dz('20260519093907Z')
,p_updated_on=>wwv_flow_imp.dz('20260519093907Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9907359530581642144)
,p_event_id=>wwv_flow_imp.id(9907359422565642143)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-get-current-position'
,p_action=>'NATIVE_GET_CURRENT_POSITION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_high_accuracy', 'N',
  'latitude_item', 'P1_LAT',
  'longitude_item', 'P1_LON',
  'return_type', 'lat_long')).to_clob
,p_wait_for_result=>'Y'
,p_created_on=>wwv_flow_imp.dz('20260519093907Z')
,p_updated_on=>wwv_flow_imp.dz('20260519093907Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(159826427055495980758)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(159826426934414980757)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Timeline'
,p_static_id=>'initialize-form-timeline'
,p_internal_uid=>151670442395158127819
,p_created_on=>wwv_flow_imp.dz('20260519061313Z')
,p_updated_on=>wwv_flow_imp.dz('20260519061313Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(159826428674885980775)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(159826426934414980757)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Insert Post'
,p_static_id=>'insert-post'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Posted!'
,p_internal_uid=>151670444014548127836
,p_created_on=>wwv_flow_imp.dz('20260519070355Z')
,p_updated_on=>wwv_flow_imp.dz('20260519070355Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp.component_end;
end;
/
