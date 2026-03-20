# Odoo Foundations

Ово је foundation документ за кандидата и сваког новог KomITi инжењера који учи Odoo од нуле, али кроз реалан KomITi код, не кроз апстрактне toy примјере.

## Садржај

1\) Odoo mental model<br>
2\) Шта је model<br>
3\) Шта је recordset<br>
4\) Шта су: `env`, `domain`, `context`<br>
5\) Fields<br>
6\) Шта су: `onchange`, `constrains`, `create`, `write`, `unlink`<br>
7\) Views<br>
8\) View inheritance<br>
9\) Action и menu слој<br>
10\) Security basics<br>
11\) Module upgrade није опционо<br>
12\) Runtime truth > source code truth<br>
13\) KomITi foundations checklist<br>
14\) Foundations capstone задатак<br>
15\) Шта читаш даље<br>
99\) Задатак на komiti_academy пројекту за кандидата

## 1) Odoo mental model

Odoo је framework у коме се већина посла врти око ових слојева:
- model,
- fields,
- view,
- action/menu,
- security,
- data,
- runtime upgrade.

У KomITi контексту то значи:
- `komiti_timesheet` проширује постојећи Odoo `account.analytic.line`,
- `komiti_project` проширује `project.project` и `project.task`,
- `komiti_dispatching` уводи своје моделе као `komiti.dispatch.order`,
- `komiti_gantt` додаје custom view type изнад dispatching flow-а,
- `komiti_web` и `komiti_website_crm` мијењају website behaviour и content structure.

## 2) Шта је model

Model је Python класа која описује business object.

Примјери из овог репоа:
- `project.task`
- `project.project`
- `account.analytic.line`
- `komiti.dispatch.order`
- `komiti.dispatch.assignment`
- `komiti.employee.hourly.rate`

Има два основна pattern-а:
- нови model: `_name = "komiti.dispatch.order"`
- inheritance existing model-а: `_inherit = "project.task"`

Кад правиш нови Odoo addon са властитим model-има, најмањи skeleton који мораш разумјети изгледа овако:
- `__manifest__.py`: описује идентитет модула, dependency-је и које data/view/security фајлове Odoo треба да учита.
- `__init__.py`: root Python улаз за модул; њиме кажеш Python/Odoo-у да module package стварно учита свој код.
- `models/__init__.py`: увози Python фајлове из `models/` директоријума, нпр. `academy_course.py` и `academy_session.py`, да би се те model класе регистровале.

Без ова три фајла можеш имати написан Python код у репоу, али Odoo модул неће бити јасно повезан, учитан и регистрован као цјелина.

## 3) Шта је recordset

У Odoo-у `self` скоро никад не значи “само један објекат”; често значи recordset.

Зато је нормално писати:
- `for record in self:`
- `self.filtered(...)`
- `self.mapped(...)`

Ово мораш усвојити рано, иначе ћеш правити багове у `write`, `compute` и helper методама.

## 4) Шта су: `env`, `domain`, `context`

`env` је runtime приступ бази, user-у, context-у и registry-ју.

Кроз `env` радиш ствари као:
- `self.env["project.task"]`
- `self.env.user`
- `self.env.company`

`domain` је filter логика за search.

Примјер размишљања:
- “дај ми све dispatch order-е у стању published”
- “дај ми timesheet линије за једног employee-а у датом датумском распону”

`context` је runtime meta-информација.

Користи се за:
- default вриједности,
- search default filter-е,
- behaviour toggles,
- locale/timezone-like behaviour.

У KomITi-ју је битан нпр. search default pattern у dispatching action-има.

## 5) Fields

Најважнији типови које мораш одмах разумијети:
- `Char`, `Text`, `Boolean`, `Integer`, `Float`, `Date`, `Datetime`
- `Many2one`, `One2many`, `Many2many`
- `Selection`

`related` field није “нова истина”; он изводи вриједност из другог поља.

`compute` field се рачуна из других вриједности. Пази на dependency reasoning.

KomITi примјер: У `komiti_timesheet` Hours се рачуна из From/To UX-а, али професионално размишљање тражи да разликујеш:
- шта је input,
- шта је derived value,
- шта иде у onchange,
- шта мора бити server-side validated.

## 6) Шта су: `onchange`, `constrains`, `create`, `write`, `unlink`

`@api.onchange`: UI helper. Добар за form UX, али није довољан као једини business guarantee.

`@api.constrains`: Server-side validation pattern. Користи се кад нешто мора важити и изван једног form workflow-а.

`create`, `write`, `unlink`: Ово су главне lifecycle тачке. Ту professional developer мора мислити:
- ко све може позвати ову логику,
- шта се дешава у batch-у,
- да ли постоје permission/data side effects,
- да ли је потребан rollback-safe pattern.

У `komiti_timesheet` lock date логика је добар study case за ову тему.

## 7) Views

Odoo UI углавном долази из XML view-ова:
- form,
- tree/list,
- search,
- kanban,
- calendar,
- activity,
- custom view types као `komiti_gantt`.

У KomITi-ју врло често не правимо све from scratch, него насљеђујемо постојећи view inheritance-ом.

Ово је један од слојева који ћеш касније морати сам да направиш на `komiti_academy`, не само да га препознаш у туђем модулу.

## 8) View inheritance

Кључно правило: користити стабилне anchor-е:
- Добро: `//field[@name='unit_amount']`
- Лоше: fragilan xpath који зависи од layout детаља без стабилне semantics.

Ово је један од најчешћих junior failure mode-ова.

## 9) Action и menu слој

Да би user видио нешто у UI-ју, није довољан model или view. Често су потребни:
- action,
- menu binding,
- search view,
- view mode wiring.

`komiti_gantt` је добар KomITi примјер јер показује да “view постоји у коду” није исто што и “view је доступан у Odoo switcher-у”.

## 10) Security basics

Мораш разликовати:
- group,
- access control list,
- record rule,
- server-side checks у Python-у.

## 11) Module upgrade није опционо

У овом репоу важи професионално правило:
- ако мијењаш Odoo модул, upgrade је нормалан дио измјене,
- без upgrade-а не можеш тврditi да си провјерио понашање.

## 12) Runtime truth > source code truth

У KomITi начину рада није довољно да код “изгледа добро”. Мораш провјерити:
- да ли је модул upgrade-ован,
- да ли је `odoo-web` учитао нови код,
- да ли assets стварно служе ново стање,
- да ли конкретан user flow ради.

Практично искуство за горе наведене Odoo концепте и слојеве кандидат стиче читајући `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md` и `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`, а прво властито Odoo искуство стиче радећи `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md` кроз `academy.course` и `academy.session`.

## 13) KomITi foundations checklist

Кад завршиш овај документ, мораш моћи објаснити:
- разлику између `_name` и `_inherit`,
- улогу `__manifest__.py`, `__init__.py` и `models/__init__.py` у skeleton-у модула,
- шта је recordset,
- шта је `env`,
- када користиш `onchange`, а када server-side validation,
- зашто XML view промјена без upgrade-а није довољна,
- зашто runtime verification има предност над “видим код у фајлу”.

## 14) Foundations capstone задатак

Док читаш foundations, не остајеш само на теорији. Од овог тренутка почињеш свој модул:
- `komiti_academy`

До краја овог foundation слоја мораш имати:
- нови addon folder,
- `__manifest__.py`,
- `__init__.py`,
- `models/__init__.py`,
- скицу model-а `academy.course`,
- скицу model-а `academy.session`,
- списак поља која ћеш правити,
- кратко објашњење шта је input, шта derived, а шта business rule.

Минимална самопровјера:
- да ли јасно знаш зашто су ти потребна два model-а,
- да ли знаш који field је `Many2one`, који `One2many`, који `Many2many`,
- да ли знаш која правила иду у `constrains`, а која могу у `onchange`,
- да ли знаш који ће view-ови постојати.

Ако на ово не можеш одговорити, још ниси стварно усвојио foundations.

## 15) Шта читаш даље

- `05_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`
- `16_ЗАВРШНИ_ПРОЈЕКАТ_НАПРАВИ_СВОЈ_ODOO_МОДУЛ_16h.md`

## 99) Задатак на komiti_academy пројекту за кандидата

1. Направи skeleton модула `komiti_academy` са почетним Odoo фајловима.  
Референца: Ово је објашњено у поглављима `## 2) Шта је model`, `## 7) Views`, `## 9) Action и menu слој` и `## 14) Foundations capstone задатак`.
2. Дефиниши скицу `academy.course` и `academy.session` model-а и попиши њихова почетна поља.  
Референца: Ово је објашњено у поглављима `## 2) Шта је model`, `## 4) Шта су: \`env\`, \`domain\`, \`context\`` и `## 5) Fields`.
3. Одреди шта је input, шта derived, а шта business rule у првој верзији модула.  
Референца: Ово је објашњено у поглављима `## 5) Fields`, `## 6) Шта су: \`onchange\`, \`constrains\`, \`create\`, \`write\`, \`unlink\`` и `## 14) Foundations capstone задатак`.
4. Именуј минимални UI који модул мора имати: tree, form и search слој.  
Референца: Ово је објашњено у поглављима `## 7) Views`, `## 8) View inheritance`, `## 9) Action и menu слој` и `## 14) Foundations capstone задатак`.

Рјешења:

1. За skeleton модула уради ово редом:
	1. У `## 14) Foundations capstone задатак` узми основни образац за почетак.
	2. Запиши који су минимални почетни Odoo фајлови потребни да модул има јасан skeleton, нпр. `__manifest__.py`, `__init__.py`, `models/__init__.py`, `models/academy_course.py`, `models/academy_session.py`, `views/academy_course_views.xml`, `security/ir.model.access.csv`.
	3. Из `## 7) Views` и `## 9) Action и menu слој` провјери да у skeleton-у не заборавиш UI улазе у модул.
	4. Направи кратку листу фајлова и сврхе сваког од њих.
2. За `academy.course` и `academy.session` уради ово редом:
	1. У `## 2) Шта је model` одреди шта је посебан model, а шта само поље постојећег model-а.
	2. Из `## 5) Fields` попиши почетна поља за оба model-а, нпр. за `academy.course` бар `name` и једно статусно или описно поље, а за `academy.session` бар везу према курсу и једно временско поље.
	3. Из `## 4) Шта су: \`env\`, \`domain\`, \`context\`` провјери које relation везе и филтери очекујеш.
	4. Запиши коначну скицу оба model-а у краткој табеларној или листној форми.
3. За input, derived и business rule уради ово редом:
	1. Прођи пољa која си дефинисао и раздвоји која уноси корисник, а која настају из других података.
	2. Из `## 6) Шта су: \`onchange\`, \`constrains\`, \`create\`, \`write\`, \`unlink\`` одреди гдје иде business правило, а гдје derived логика.
	3. Сваки елемент сврстај у једну од 3 групе: `input`, `derived`, `business rule`.
	4. Провјери да ли је ова подјела у складу са очекивањем из `## 14) Foundations capstone задатак`.
4. За минимални UI уради ово редом:
	1. Из `## 7) Views` запиши која поља морају бити видљива у tree и form погледу.
	2. Из `## 8) View inheritance` одлучи да ли ти треба нови view или насљеђивање постојећег.
	3. Из `## 9) Action и menu слој` додај како корисник уопште улази у тај UI.
	4. На крају запиши минимални UI scope: `tree`, `form`, `search`, `action`, `menu`, уз кратак примјер шта у сваком од њих корисник мора видјети.