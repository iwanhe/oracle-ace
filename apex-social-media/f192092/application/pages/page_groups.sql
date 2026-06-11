prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 192092
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>146726770692635976661
,p_default_application_id=>192092
,p_default_id_offset=>8155984660337852939
,p_default_owner=>'WKSP_KCSI'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(9830394655954018164)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
wwv_flow_imp.component_end;
end;
/
