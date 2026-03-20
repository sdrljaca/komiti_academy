# Odoo план учења

Ово је спољни план учења заснован на званичној Odoo документацији и најјачим community ресурсима. Није AI туторијал, него редослијед шта стварно треба читати и шта из тога треба усвојити.

Правило рада:
- не прелази на сљедећу ставку док претходну ниси стварно прочитао и испробао;
- уз сваку страницу мораш имати бар једну малу практичну вјежбу;
- ако не знаш својим ријечима објаснити тему, рачунај да је ниси још усвојио.
- ако хоћеш да ставка буде чекирана на web приказу, у checkbox уписуј мало латинично `x`, дакле `- [x]`, а не друге знакове.

## Фазе

- [ ] Фаза: 0 -> Junior (8 седмица): Циљ ове фазе је да особа престане бити “Python почетник који гледа Odoo”, и постане неко ко разумије основну структуру модула и може направити једноставан addon без туђе помоћи.
  - [ ] [Setup guide](https://www.odoo.com/documentation/19.0/developer/tutorials/setup_guide.html): како се ради source install, како се покреће `odoo-bin`, шта је `addons-path`, како се пали developer mode и како изгледа исправно локално окружење за учење и развој.
  - [ ] [Server framework 101](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101.html): добијаш главни backend пут учења и видиш како се један Odoo модул гради постепено, од почетног skeleton-а до функционалне апликације.
  - [ ] [Chapter 1: Architecture Overview](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/01_architecture.html): шта су Odoo слојеви, како framework размишља и гдје се уопште налазе model, view, data и security.
  - [ ] [Chapter 2: A New Application](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/02_newapp.html): како се прави нова Odoo апликација, шта је основни module skeleton и зашто су `__manifest__.py` и `__init__.py` битни.
  - [ ] [Chapter 3: Models And Basic Fields](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/03_basicmodel.html): како се дефинише model, шта су основни типови поља и како се постављају прве business структуре у ORM-у.
  - [ ] [Chapter 4: Security - A Brief Introduction](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/04_securityintro.html): основа ACL размишљања, ко шта може видјети и мијењати, и зашто security не смије доћи тек на крају.
  - [ ] [Chapter 5: Finally, Some UI To Play With](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/05_firstui.html): како model добија први UI и како Odoo из Python слоја прелази у употребљиву форму.
  - [ ] [Chapter 6: Basic Views](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/06_basicviews.html): основа tree, form и search view-ова и како XML одређује оно што корисник стварно види.
  - [ ] [Chapter 7: Relations Between Models](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/07_relations.html): како се користе `Many2one`, `One2many` и `Many2many` и како се model-и вежу у један стварни business flow.
  - [ ] [Chapter 8: Computed Fields And Onchanges](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/08_compute_onchange.html): разлика између derived вриједности и UI helper логике, и кад иде `compute`, а кад `onchange`.
  - [ ] [Chapter 9: Ready For Some Action?](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/09_actions.html): како се повезују action, menu и view mode тако да корисник стварно може ући у функционалност коју си направио.
  - [ ] [Chapter 10: Constraints](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/10_constraints.html): како се пишу server-side правила и зашто business validation не смије остати само на нивоу форме.
  - [ ] [Chapter 11: Add The Sprinkles](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/11_sprinkles.html): како се полира модул и додају додатни елементи који модул чине употребљивијим и ближим стварној апликацији.
  - [ ] [Chapter 12: Inheritance](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/12_inheritance.html): како се проширују постојећи model-и и view-ови без ломљења upstream логике.
  - [ ] [Chapter 13: Interact With Other Modules](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/13_other_module.html): како зависности међу модулaма стварно раде и како један модул безбједно улази у туђи домен.
  - [ ] [Chapter 14: A Brief History Of QWeb](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/14_qwebintro.html): шта је QWeb, зашто постоји и гдје ћеш га срести чак и ако ти је главни фокус backend.
  - [ ] [Define module data](https://www.odoo.com/documentation/19.0/developer/tutorials/define_module_data.html): разлика између master и demo података, како се data фајлови пријављују у manifest-у и како XML/CSV улазе у модул.
  - [ ] [Restrict access to data](https://www.odoo.com/documentation/19.0/developer/tutorials/restrict_data_access.html): groups, access rights, record rules, `sudo`, explicit security checks и зашто је security модел шири од једног `ir.model.access.csv` фајла.
  - [ ] [Safeguard your code with unit tests](https://www.odoo.com/documentation/19.0/developer/tutorials/unit_tests.html): како се покрећу тестови, како изгледа `tests/` структура и како се пише први озбиљан Odoo unit test.

- [ ] Фаза: Junior -> Самосталан Developer (10 седмица): Циљ ове фазе је да неко више не прави само “demo module”, него да може ући у постојећи код, разумјети га, измјенити га без ломљења система и испоручити промјену професионално.
  - [ ] [Reference](https://www.odoo.com/documentation/19.0/developer/reference.html): учиш да званичну reference документацију користиш као радни алат, а не као пасивно штиво.
  - [ ] [ORM API](https://www.odoo.com/documentation/19.0/developer/reference/backend/orm.html): дубље разумијевање model-а, fields, recordset-а, environment-а, decorators-а и уобичајених ORM метода које користиш сваки дан.
  - [ ] [Data Files](https://www.odoo.com/documentation/19.0/developer/reference/backend/data.html): како раде XML и CSV data фајлови, шта је loading order и како се data слој одржава без хаоса.
  - [ ] [Window Actions ( ir.actions.act_window )](https://www.odoo.com/documentation/19.0/developer/reference/backend/actions.html): како се професионално конфигурише action слој и како view/action/context wiring заиста ради.
  - [ ] [Manifest](https://www.odoo.com/documentation/19.0/developer/reference/backend/module.html): шта све треба да знаш о `__manifest__.py`, dependency-јима, `data`, `demo`, `application` и структури модула.
  - [ ] [Access Rights](https://www.odoo.com/documentation/19.0/developer/reference/backend/security.html): тачна правила за ACL слој и како се group-based приступ моделира на production начин.
  - [ ] [Record Rules](https://www.odoo.com/documentation/19.0/developer/reference/backend/security.html): како се пишу правила приступа по записима и како domain постаје security механизам.
  - [ ] [Field Access](https://www.odoo.com/documentation/19.0/developer/reference/backend/security.html): како се ограничења могу поставити и на нивоу поља, не само на нивоу модела или view-а.
  - [ ] [Security Pitfalls](https://www.odoo.com/documentation/19.0/developer/reference/backend/security.html): најчешће грешке које developer прави када мисли да је нешто сигурно, а заправо није.
  - [ ] [Command-line interface (CLI)](https://www.odoo.com/documentation/19.0/developer/reference/cli.html): како се користе `-i`, `-u`, testing опције, shell и остале CLI команде које су стварни дио свакодневног рада.
  - [ ] [View records](https://www.odoo.com/documentation/19.0/developer/reference/user_interface/view_records.html): како су view записи организовани и како читати постојећи UI слој у туђем модулу.
  - [ ] [View architectures](https://www.odoo.com/documentation/19.0/developer/reference/user_interface/view_architectures.html): form, list, search, kanban, calendar, gantt и остале архитектуре које мораш знати кад улазиш у постојећи модул.
  - [ ] [Testing Python code](https://www.odoo.com/documentation/19.0/developer/reference/backend/testing.html): како изгледа званични Odoo testing модел и како мислити о провјери понашања, а не само о једном green test run-у.
  - [ ] [Integration Testing](https://www.odoo.com/documentation/19.0/developer/reference/backend/testing.html): како се тестира цјелина flow-а, не само појединачна функција или helper метода.
  - [ ] [Profiling](https://www.odoo.com/documentation/19.0/developer/reference/backend/performance.html): како уочити спор код и почети размишљати о performance-у прије него што систем постане тежак за одржавање.
  - [ ] [Good practices](https://www.odoo.com/documentation/19.0/developer/reference/backend/performance.html): које performance и backend навике раздвајају solid modul од модула који је спор и fragile.
  - [ ] [How-to guides](https://www.odoo.com/documentation/19.0/developer/howtos.html): ово је прелаз са “знам основе” на “знам рјешавати стварне задатке по темама”.
  - [ ] [Multi-company Guidelines](https://www.odoo.com/documentation/19.0/developer/howtos/company.html): како размишљати о company isolation, company-dependent пољима и multi-company правилима без случајног пробијања приступа.
  - [ ] [Create customized reports](https://www.odoo.com/documentation/19.0/developer/howtos/create_reports.html): како се граде стварни извјештаји и како SQL/ORM/report слој улазе у професионалан Odoo рад.
  - [ ] [Translating Modules](https://www.odoo.com/documentation/19.0/developer/howtos/translations.html): како се модул припрема за превод и зашто localization није накнадни козметички корак.
  - [ ] [Upgrade a customized database](https://www.odoo.com/documentation/19.0/developer/howtos/upgrade_custom_db.html): како се размишља о upgrade-у custom базе и зашто custom код није завршен ако није upgrade-safe.
  - [ ] [Odoo Community Association](https://odoo-community.org/): упознајеш најважнију Odoo open-source заједницу и схваташ гдје се налазе production-grade community pattern-и.
  - [ ] [Odoo Community Association на GitHub-у](https://github.com/OCA): учиш да читаш стварне OCA репозиторијуме, структуру addon-а, review стил и конвенције које професионалци користе.

- [ ] Фаза: Самосталан Developer -> Pro Odoo Developer (12 седмица): Циљ ове фазе је да developer не зна само направити модул, него да зна радити frontend, integration, testing, upgrade, community-style code reading и испоруку промјене на професионалном нивоу.
  - [ ] [Discover the web framework](https://www.odoo.com/documentation/19.0/developer/tutorials/discover_js_framework.html): улаз у Odoo frontend свијет и прва озбиљна слика о Owl-у, dashboard-има и web client архитектури.
  - [ ] [Chapter 1: Owl components](https://www.odoo.com/documentation/19.0/developer/tutorials/discover_js_framework/01_owl_components.html): како се граде и користе Owl компоненте, шта је component-based размишљање и како Odoo frontend стварно живи.
  - [ ] [Chapter 2: Build a dashboard](https://www.odoo.com/documentation/19.0/developer/tutorials/discover_js_framework/02_build_a_dashboard.html): како се више frontend building block-ова спаја у један употребљив UI.
  - [ ] [Master the web framework](https://www.odoo.com/documentation/19.0/developer/tutorials/master_odoo_web_framework.html): дубљи frontend ресурс за прелаз са basic Owl знања на стварну frontend специјализацију у Odoo-у.
  - [ ] [Framework Overview](https://www.odoo.com/documentation/19.0/developer/reference/frontend/framework_overview.html): како је организован web client, који су главни building block-ови и како frontend архитектура стварно функционише.
  - [ ] [Assets](https://www.odoo.com/documentation/19.0/developer/reference/frontend/assets.html): како раде asset bundle-ови, lazy loading и зашто frontend bug често није само “JS код је добар”.
  - [ ] [Odoo Module System](https://www.odoo.com/documentation/19.0/developer/reference/frontend/javascript_modules.html): како се организују JavaScript модули и како frontend код улази у Odoo framework.
  - [ ] [Owl components](https://www.odoo.com/documentation/19.0/developer/reference/frontend/owl_components.html): званична reference за компоненте, best practices и границе Owl слоја.
  - [ ] [Registries](https://www.odoo.com/documentation/19.0/developer/reference/frontend/registries.html): како Odoo web client региструје нове field-ове, view type-ове и друге frontend extension тачке.
  - [ ] [Services](https://www.odoo.com/documentation/19.0/developer/reference/frontend/services.html): како се пишу и користе frontend сервиси и како state/behavior living outside components ради у пракси.
  - [ ] [Hooks](https://www.odoo.com/documentation/19.0/developer/reference/frontend/hooks.html): како се користе hooks у Odoo/Owl frontend-у и како се избјегава ad hoc frontend код.
  - [ ] [Patching code](https://www.odoo.com/documentation/19.0/developer/reference/frontend/patching_code.html): како се ради patching у Odoo frontend-у и зашто је то моћно, али опасно ако се користи без дисциплине.
  - [ ] [QWeb Templates](https://www.odoo.com/documentation/19.0/developer/reference/frontend/qweb.html): дубље разумијевање template слоја, output-а, conditionals, loops и везе између backend и frontend рендеринга.
  - [ ] [JavaScript Unit Testing](https://www.odoo.com/documentation/19.0/developer/reference/frontend/unit_testing.html): како се тестира frontend логика, а не само Python backend.
  - [ ] [Customize a field](https://www.odoo.com/documentation/19.0/developer/howtos/javascript_field.html): како се мијења постојећи field component у web framework-у без крпљења наслијепо.
  - [ ] [Customize a view type](https://www.odoo.com/documentation/19.0/developer/howtos/javascript_view.html): како се custom view type ради на framework нивоу, што је важно ако желиш напреднији UI рад.
  - [ ] [Create a client action](https://www.odoo.com/documentation/19.0/developer/howtos/javascript_client_action.html): како се прави озбиљнији custom frontend entry point унутар Odoo web client-а.
  - [ ] [Create a standalone Owl application](https://www.odoo.com/documentation/19.0/developer/howtos/standalone_owl_application.html): како се Owl користи и ван класичног web client оквира.
  - [ ] [Use Owl components on the portal and website](https://www.odoo.com/documentation/19.0/developer/howtos/frontend_owl_components.html): како frontend Odoo знање преносиш на portal/website слој.
  - [ ] [Website themes](https://www.odoo.com/documentation/19.0/developer/howtos/website_themes.html): како се website customization ради дисциплиновано, а не само ad hoc CSS/XML измјенама.
  - [ ] [Web Services](https://www.odoo.com/documentation/19.0/developer/reference/external_api.html): како Odoo комуницира споља и како мислити о интеграцијама и API границама.
  - [ ] [Write lean easy-to-maintain CSS](https://www.odoo.com/documentation/19.0/developer/howtos/scss.html): како да frontend customization не постане технички дуг послије неколико итерација.
  - [ ] [OpenUpgrade](https://github.com/OCA/OpenUpgrade): упознавање са open-source upgrade ecosystem-ом и migration thinking-ом који је битан за pro ниво.
  - [ ] [maintainer-tools](https://github.com/OCA/maintainer-tools): увид у maintainer дисциплину, конвенције и review standard који community користи за озбиљан Odoo код.

## Минимални услов за прелаз из фазе у фазу

- из фазе `0 -> Junior` не прелазиш док не направиш један мали модул од нуле;
- из фазе `Junior -> Самосталан Developer` не прелазиш док не можеш сигурно мијењати постојећи модул, урадити upgrade и написати basic test;
- из фазе `Самосталан Developer -> Pro Odoo Developer` не прелазиш док не можеш читати OCA код, урадити frontend измјену, објаснити security ризик и планирати upgrade-safe испоруку.

## Практични артефакти које мораш имати до краја плана

- један мали backend Odoo модул од нуле;
- један модул у ком си мијењао постојећи view/action/security слој;
- бар један Python test;
- бар једну Owl/frontend измјену;
- кратке биљешке шта си научио из бар 5 OCA addon-а које си читао.