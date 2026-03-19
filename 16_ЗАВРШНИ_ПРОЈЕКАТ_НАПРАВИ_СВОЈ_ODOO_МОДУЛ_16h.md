# Завршни пројекат: Build Your Own Odoo Module

Document Owner: Project Manager
Product Scope Input: Product Manager
Business Validation Input: Business Owner

Ово је главни завршни пројекат learning библиотеке (завршни, сабирни практични пројекат learning библиотеке). Циљ није да полазник само чита документа, него да кроз њих постепено изгради свој први озбиљан Odoo модул и да до краја curriculum-а тај модул буде:
- функционалан,
- upgrade-safe,
- ручно истестиран,
- документован,
- довољно чист да може проћи review.

Главни опис самог производа/модула који се гради је у `00_ОПИС_ПРОИЗВОДА_2h.md`.
Овај документ објашњава scope завршног пројекта, контролне тачке, Definition of Done и learning execution редослијед.

Кандидат implementation ради у свом GitHub репоу `komiti_academy_ime_polaznika`, док је овај репо `komiti_academy` learning/documentation репо.

Модул који се прави је:
- `komiti_academy`

## Садржај

1\) Зашто баш `komiti_academy`<br>
2\) Шта модул треба да ради<br>
3\) Обавезан scope<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.1 `academy.course`<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.2 `academy.session`<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.3 Derived/business fields<br>
4\) Обавезна правила<br>
5\) Обавезни UI слој<br>
6\) Обавезни security слој<br>
7\) Како се модул гради кроз curriculum<br>
&nbsp;&nbsp;&nbsp;&nbsp;Фаза A<br>
&nbsp;&nbsp;&nbsp;&nbsp;Фаза B<br>
&nbsp;&nbsp;&nbsp;&nbsp;Фаза C<br>
&nbsp;&nbsp;&nbsp;&nbsp;Фаза D<br>
8\) Контролне тачке<br>
&nbsp;&nbsp;&nbsp;&nbsp;Checkpoint 1: Skeleton ready<br>
&nbsp;&nbsp;&nbsp;&nbsp;Checkpoint 2: Functional flow ready<br>
&nbsp;&nbsp;&nbsp;&nbsp;Checkpoint 3: Rules enforced<br>
&nbsp;&nbsp;&nbsp;&nbsp;Checkpoint 4: Delivery ready<br>
9\) Definition of Done за capstone<br>
10\) Шта мора остати као артефакт<br>
11\) Како користиш остале learning документе док правиш овај модул<br>
12\) Завршна провјера за ментора<br>
99\) Задатак на komiti_academy пројекту за кандидата

## 1) Зашто баш `komiti_academy`

Овај модул је намјерно изабран као средња тежина.

Није превише лаган јер тражи:
- више model-а,
- relation reasoning,
- business rules,
- views,
- security,
- workflow,
- verification.

Није ни превише тежак јер не улази у:
- accounting,
- stock,
- payroll,
- complex website runtime,
- heavy custom JS као први корак.

## 2) Шта модул треба да ради

Модул управља интерним курсевима и сесијама.

Основни model-и:
- `academy.course`
- `academy.session`

Минимални functional scope:
- креирање курса,
- креирање сесије за курс,
- везивање инструктора,
- везивање учесника,
- број мјеста,
- стање сесије,
- basic search/filter,
- basic role separation.

## 3) Обавезан scope

### 3.1 `academy.course`

Минимална поља:
- `name`
- `description`
- `level` као `Selection`
- `active`
- `session_ids`

### 3.2 `academy.session`

Минимална поља:
- `name`
- `course_id`
- `instructor_id`
- `attendee_ids`
- `start_date`
- `end_date`
- `seats`
- `state`

### 3.3 Derived/business fields

Обавезно бар:
- `attendee_count`
- `seats_left`
- `occupancy_percent`

## 4) Обавезна правила

Полазник мора имплементирати бар ова правила:
- `seats` не смије бити негативан,
- број attendee-а не смије прећи број мјеста,
- instructor не смије бити исти као attendee на истој session,
- `end_date` не смије бити прије `start_date`,
- session state мора имати јасан lifecycle бар `draft -> open -> done/cancelled`.

## 5) Обавезни UI слој

Полазник мора имати:
- course tree view,
- course form view,
- session tree view,
- session form view,
- search view бар за session model,
- menu + action wiring.

Пожељно, али није обавезно:
- calendar view за session,
- smart button или notebook page,
- basic kanban.

## 6) Обавезни security слој

Минимум:
- access CSV,
- бар једна `academy_user` група,
- бар једна `academy_manager` група,
- јасно објашњење ко смије create/write/delete.

Ако нема fine-grained record rule, полазник мора бар у документацији написати зашто тај слој још није ушао у прву верзију.

## 7) Како се модул гради кроз curriculum

Capstone не радиш одједном. Градиш га у фазама.

### Фаза A

После `05_ODOO_ОСНОВЕ_4h.md`, `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md` и `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md` мораш имати:
- име модула,
- folder skeleton,
- manifest,
- init фајлове,
- скицу model-а,
- кратку спецификацију scope-а.

### Фаза B

После KomITi domain/module докумената мораш имати:
- оба model-а имплементирана,
- relation-е постављене,
- основне tree/form/search view-ове,
- menu/action wiring,
- basic security.

### Фаза C

После debugging/testing/task-breakdown докумената мораш имати:
- business rules,
- verification note,
- manual test evidence,
- docs delta,
- clean module upgrade path.

### Фаза D

До краја curriculum-а модул мора имати:
- refactor pass,
- review cleanup,
- explicit residual risk note,
- јасан handoff опис.

## 8) Контролне тачке

### Checkpoint 1: Skeleton ready

Полазник пролази ако може показати:
- `__manifest__.py`
- `__init__.py`
- `models/__init__.py`
- `models/course.py`
- `models/session.py`
- `security/ir.model.access.csv`
- `views/academy_course_views.xml`
- `views/academy_session_views.xml`

### Checkpoint 2: Functional flow ready

Полазник пролази ако може:
- инсталирати модул без traceback-а,
- отворити menu/action,
- креирати course,
- креирати session,
- додати instructor-а,
- додати attendee-е,
- показати да computed field-ови раде.

### Checkpoint 3: Rules enforced

Полазник пролази ако може демонстрирати:
- negative case за seats,
- negative case за overbooking,
- negative case за instructor-as-attendee,
- state transition proof.

### Checkpoint 4: Delivery ready

Полазник пролази ако има:
- module upgrade command,
- smoke test note,
- кратак technical summary,
- објашњење residual risk-а,
- јасан commit scope.

## 9) Definition of Done за capstone

`komiti_academy` се сматра завршеним кад полазник може показати:
- да модул инсталација и upgrade пролазе,
- да су model-и, security и view-ови повезани,
- да бар 4 business правила стварно раде,
- да је module ручно истестиран,
- да постоји кратка документација шта модул ради,
- да може усмено објаснити architecture, risk и verification.

## 10) Шта мора остати као артефакт

До краја onboarding-а полазник мора имати:
- код модула,
- кратак README/capstone note,
- verification note,
- листу шта је свјесно остављено out-of-scope,
- бар један clean commit или commit series који показује еволуцију модула.

## 11) Како користиш остале learning документе док правиш овај модул

- `05_ODOO_ОСНОВЕ_4h.md`: разумијеш model, field, view, action, security.
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`: држиш модул чистим и читљивим.
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`: читаш KomITi модуле да видиш добре pattern-е.
- `10_ODOO_ПРИРУЧНИК_ЗА_ТЕСТИРАЊЕ_И_ПРОВЈЕРУ_3h.md`: пишеш verification као професионалац.
- `13_РАЗЛАГАЊЕ_ЗАДАТКА_И_РАЗМИШЉАЊЕ_О_ИСПОРУЦИ_2h.md`: scope држиш реалним и upgrade-safe.
- `15_ЉЕСТВИЦА_ПРАКСЕ_20_ВЈЕЖБИ_40h.md`: кроз вјежбе долазиш до готовог capstone-а.

## 12) Завршна провјера за ментора

Ментор треба да може одговорити са `да` на ова питања:
- Да ли полазник разумије зашто модул има баш ова два model-а?
- Да ли полазник разумије relation-е, а не само да их је ископирао?
- Да ли може сам пустити upgrade и објаснити шта провјерава?
- Да ли је тестирао и happy path и negative path?
- Да ли је документација довољна да други инжењер настави рад?

Ако је одговор `не` на више ставки, модул још није стварно завршен.

## 99) Задатак на komiti_academy пројекту за кандидата

1. Имплементирај `academy.course` и `academy.session` у складу са обавезним scope-ом.
Референца: Ово је објашњено у поглављима `## 3) Обавезан scope` и `## 7) Како се модул гради кроз curriculum`.
2. Имплементирај обавезна business правила и докажи их кроз positive и negative scenario-е.
Референца: Ово је објашњено у поглављима `## 4) Обавезна правила`, `## 8) Контролне тачке` и `## 9) Definition of Done за capstone`.
3. Направи обавезни UI слој и основни security слој.
Референца: Ово је објашњено у поглављима `## 5) Обавезни UI слој`, `## 6) Обавезни security слој` и `## 7) Како се модул гради кроз curriculum`.
4. Припреми checkpoint артефакте и доведи модул до Definition of Done стања.
Референца: Ово је објашњено у поглављима `## 8) Контролне тачке`, `## 9) Definition of Done за capstone` и `## 10) Шта мора остати као артефакт`.

Рјешења:

1. За model scope уради ово редом:
	1. У `## 3) Обавезан scope` издвоји све обавезне елементе модула.
	2. Издвоји све што је обавезно за `academy.course` и `academy.session`.
	3. Имплементирај model-е и поља један по један, без прескакања обавезних ставки, нпр. прво `academy.course`, па затим `academy.session`.
	4. Провјери преко `## 7) Како се модул гради кроз curriculum` да редослијед рада има смисла.
2. За business правила и доказивање уради ово редом:
	1. У `## 4) Обавезна правила` издвоји свако правило као засебну ставку.
	2. За свако правило запиши шта је positive scenario, а шта negative scenario.
	3. Имплементирај правило и одмах провјери оба scenario-а, нпр. `дозвољен унос пролази`, `недозвољен унос баца очекивану грешку`.
	4. На крају провјери преко `## 8) Контролне тачке` и `## 9) Definition of Done за capstone` да ниједно правило није остало само „на папиру“.
3. За UI и security уради ово редом:
	1. У `## 5) Обавезни UI слој` попиши шта мора бити доступно кориснику, нпр. tree, form, search и menu entry.
	2. У `## 6) Обавезни security слој` попиши која права и ограничења морају постојати, нпр. ко може читати, ко може уређивати, ко не смије брисати.
	3. Имплементирај прво основни UI, па затим security слој који га штити.
	4. Провјери преко `## 7) Како се модул гради кроз curriculum` да је редослијед имплементације стабилан.
4. За checkpoint артефакте и DoD уради ово редом:
	1. У `## 8) Контролне тачке` запиши шта мораш имати на сваком checkpoint-у.
	2. У `## 9) Definition of Done за capstone` претвори услове у финалну checklist форму.
	3. У `## 10) Шта мора остати као артефакт` провјери да су сви тражени артефакти припремљени, нпр. verification note, кратак rollout summary и јасно описан final scope.
	4. Означи модул као спреман тек кад су checkpoint-и, DoD и артефакти стварно покривени.

