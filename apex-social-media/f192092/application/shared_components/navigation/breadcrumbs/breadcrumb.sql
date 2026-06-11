prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>146726770692635976661
,p_default_application_id=>192092
,p_default_id_offset=>8155984660337852939
,p_default_owner=>'WKSP_KCSI'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(9830389381297018153)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_created_on=>wwv_flow_imp.dz('20260519054611Z')
,p_updated_on=>wwv_flow_imp.dz('20260519054611Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9830389581809018153)
,p_short_name=>'Timeline'
,p_static_id=>'timeline'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_created_on=>wwv_flow_imp.dz('20260519054611Z')
,p_updated_on=>wwv_flow_imp.dz('20260519054611Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp.component_end;
end;
/
