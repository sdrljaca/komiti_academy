# Odoo Testing and Verification Handbook

Овај документ учи шта значи професионална верификација Odoo измјене у KomITi-ју. Циљ није “ја сам кликнуо и мени ради”, него доказ да је измјена довољно провјерена за свој risk profile.
------------------------------------------------------------------------------------------------------------------

## 1) Minimum rule

Свака измјена мора имати verification који одговара њеном стварном impact-у.
------------------------------------------------------------------------------------------------------------------

## 2) Docs-only измјена

Минимум:
- провјера садржаја,
- да је документ на правом нивоу хијерархије,
- да није дуплирана policy логика.
------------------------------------------------------------------------------------------------------------------

## 3) XML / view измјена

Минимум:
- module upgrade,
- restart ако је потребно,
- hard refresh,
- ручна провјера exact UI flow-а,
- провјера да xpath није разбио сусједни layout.
------------------------------------------------------------------------------------------------------------------

## 4) Python business logic измјена

Минимум:
- module upgrade,
- create/write/read path провјера,
- role-aware scenario ако има security/business gating,
- negative case ако постоји business restriction.

KomITi example:
- `komiti_timesheet` lock date не тестирамо само “happy path”, него и blocked scenario.
------------------------------------------------------------------------------------------------------------------

## 5) Security измјена

Минимум:
- least-privileged user scenario,
- admin scenario ако је релевантан,
- hidden/read-only није довољан proof,
- мораш потврдити стварно permission behaviour.
------------------------------------------------------------------------------------------------------------------

## 6) JS / OWL / custom view измјена

Минимум:
- module upgrade,
- restart,
- hard refresh,
- UI interaction test,
- провјера да runtime не даје очигледне грешке,
- search/filter/control panel behaviour ако је view комплекснији.

KomITi example:
- `komiti_gantt` resize, switcher, search bar, default filter.
------------------------------------------------------------------------------------------------------------------

## 7) Website / frontend измјена

Минимум:
- rendered HTML/CSS провјера,
- desktop + mobile sanity check кад layout то тражи,
- hard refresh,
- asset reset ако symptom то тражи,
- провјера конкретне странице, не само source кода у модулу.
------------------------------------------------------------------------------------------------------------------

## 8) Restore / parity / clone рад

Минимум:
- DB restore proof,
- filestore proof,
- `/web/health`,
- login page,
- asset sanity,
- тек онда функционално поређење.
------------------------------------------------------------------------------------------------------------------

## 9) Role-based testing

У KomITi-ју често мораш мислити бар о овим actor-има:
- admin,
- manager,
- normal employee/user,
- website visitor ако је website flow у питању.
------------------------------------------------------------------------------------------------------------------

## 10) Testing anti-patterns

- тест само као admin,
- тест само једног клика,
- без upgrade-а,
- без runtime proof-а,
- “код изгледа добро” као замјена за verification.
------------------------------------------------------------------------------------------------------------------

## 11) Verification note template

После измјене треба да можеш записати:
- module(s):
- type of change:
- commands run:
- roles tested:
- UI / runtime checks:
- residual risk:
------------------------------------------------------------------------------------------------------------------

## 12) Кад си стварно завршио

Измјена је стварно верификована кад можеш јасно показати:
- шта си тестирао,
- под којим role-ама,
- на ком runtime-у,
- шта би још могло бити residual risk.
------------------------------------------------------------------------------------------------------------------

## 13) Capstone verification за `komiti_academy`

Кад полазник каже да је његов модул готов, минимум провјере је:
- install модула без traceback-а,
- module upgrade без traceback-а,
- креирање једног course record-а,
- креирање једног session record-а,
- повезивање course -> session,
- додавање instructor-а,
- додавање attendee-а,
- доказ да computed field-ови раде,
- negative test за overbooking,
- negative test за instructor-as-attendee,
- negative test за invalid date range,
- бар један `academy_user` scenario,
- бар један `academy_manager` scenario.

Verification note за capstone мора експлицитно имати:
- module: `komiti_academy`
- install/upgrade command
- records created during test
- roles tested
- positive scenarios
- negative scenarios
- residual risk

Без овога модул није „готов“, само је написан.

Ово је директна припрема за завршни task верификације који ћеш морати сам испоручити за `komiti_academy`.
------------------------------------------------------------------------------------------------------------------

## 14) Шта читаш даље

- `12_ODOO_ЛИСТА_ПРОВЈЕРЕ_ЗА_ПРЕГЛЕД_КОДА_1h.md`
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`
------------------------------------------------------------------------------------------------------------------

## 99) Задатак на komiti_academy пројекту за кандидата

1. Верификуј `komiti_academy` тако да докажеш install, upgrade, happy path и negative path.
Референца: Ово је објашњено у поглављима `## 3) XML / view измјена`, `## 4) Python business logic измјена`, `## 5) Security измјена` и `## 13) Capstone verification за \`komiti_academy\``.
2. Тестирај бар један `academy_user` и један `academy_manager` scenario.
Референца: Ово је објашњено у поглављима `## 9) Role-based testing` и `## 13) Capstone verification за \`komiti_academy\``.
3. Напиши verification note који стварно доказује да модул ради.
Референца: Ово је објашњено у поглављима `## 11) Verification note template` и `## 13) Capstone verification за \`komiti_academy\``.
------------------------------------------------------------------------------------------------------------------

## 99) Рјешења

1. За општу verification дисциплину уради ово редом:
	1. Одреди који тип измјене провјераваш: XML/view, Python logic или security.
	2. У релевантним поглављима `## 3) XML / view измјена`, `## 4) Python business logic измјена` и `## 5) Security измјена` узми одговарајуће тест кораке.
	3. Направи checklist која доказује install, upgrade, happy path и negative path, нпр. `module upgrade прошао`, `record се креира`, `недозвољен унос је блокиран`.
	4. На крају прођи и све ставке из `## 13) Capstone verification за \`komiti_academy\`` и означи сваку као `pass` или `fail`.
2. За role-based testing уради ово редом:
	1. У `## 9) Role-based testing` узми образац како раздвајаш улоге.
	2. Дефиниши бар један scenario за `academy_user` и један за `academy_manager`.
	3. За сваки scenario запиши коју акцију корисник изводи и какав исход очекујеш, нпр. `academy_user може видјети своје податке`, `academy_manager може уредити session`.
	4. Изврши оба scenario-а и забиљежи шта је прошло, а шта није.
3. За verification note уради ово редом:
	1. У `## 11) Verification note template` узми форму note-а.
	2. Попуни note стварним резултатима тестирања, не општим тврдњама, нпр. `upgrade: pass`, `happy path: pass`, `negative path: pass/fail`.
	3. У note укључи install/upgrade исход, tested flow-ове и negative path резултат.
	4. Провјери преко `## 13) Capstone verification за \`komiti_academy\`` да note стварно доказује да модул ради.
