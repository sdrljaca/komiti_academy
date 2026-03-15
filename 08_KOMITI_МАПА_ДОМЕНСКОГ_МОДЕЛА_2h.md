# KomITi Domain Model Map

Овај документ објашњава систем не као збир фајлова, него као domain map. Циљ је да нови инжењер разумије гдје су главни пословни токови и који custom модули носе ту логику.
------------------------------------------------------------------------------------------------------------------

## 1) Велика слика

KomITi систем у овом репоу се може читати кроз 5 главних domain зона:
- projects и tasks,
- timesheets и cost tracking,
- dispatching и resource allocation,
- website / lead capture,
- internal ops / AI / administration.
------------------------------------------------------------------------------------------------------------------

## 2) Projects и tasks

Главни upstream Odoo ослонац:
- `project.project`
- `project.task`

KomITi custom layer:
- `komiti_project`
- дјелимично `komiti_dispatching`
- дјелимично `komiti_timesheet`

### Шта `komiti_project` додаје

- numbering discipline,
- custom fields по пројекту/таску,
- project members,
- task value extension patterns.
------------------------------------------------------------------------------------------------------------------

## 3) Timesheets и costing

Главни upstream Odoo ослонац:
- `account.analytic.line`
- `hr.employee`
- `res.company`
- `res.config.settings`

KomITi custom layer:
- `komiti_timesheet`

### Шта `komiti_timesheet` ради

- From/To UX за унос времена,
- automatic Hours calculation,
- lock date,
- employee hourly rate logic,
- timesheet day wizard,
- додатне validation/business rule слојеве.
------------------------------------------------------------------------------------------------------------------

## 4) Dispatching и resource allocation

KomITi custom models:
- `komiti.dispatch.order`
- `komiti.dispatch.assignment`
- calendar helper модели везани за partner/project/employee слој

Modules:
- `komiti_dispatching`
- `komiti_gantt`

### Пословна сврха

- планирање налога,
- везивање људи/ресурса за dispatch order,
- приказ и манипулација временским оквирима,
- search/filtering по operational стањима.
------------------------------------------------------------------------------------------------------------------

## 5) Website и lead capture

Modules:
- `komiti_web`
- `komiti_website_crm`

### Шта је битно

- website naming/layout agreement,
- content sections,
- website form behaviour који води у CRM,
- asset/runtime difference између source и rendered HTML/CSS-а.
------------------------------------------------------------------------------------------------------------------

## 6) Internal ops

Modules:
- `komiti_dev_ops`
- `komiti_infra_switch`

### Шта учиш из овог слоја

- Odoo може бити UI за operations, не само ERP screens,
- `ir.config_parameter` и settings pattern су реалан KomITi use-case,
- runtime safety и permissions су critical.
------------------------------------------------------------------------------------------------------------------

## 7) AI / automation слој

Module:
- `komiti_claw`

### Зашто је важан за learning

Ово је напредни примјер да Odoo није само CRUD. Ту имаш:
- controllers,
- discuss integration,
- config settings,
- rule engine thinking,
- external service orchestration.
------------------------------------------------------------------------------------------------------------------

## 8) Employees и fleet

Supporting modules:
- `komiti_employees`
- `komiti_fleet`

Ови модули су корисни да видиш како се domain data и seed/import patterns интегришу у шири систем.
------------------------------------------------------------------------------------------------------------------

## 9) Како domain zone-ови комуницирају

### Projects <-> Timesheets

Timesheet lines често упућују на task/project context.

### Projects <-> Dispatching

Dispatch order-и operationally живе близу task/project execution-а.

### Website <-> CRM / Projects

Website capture може бити upstream за customer/contact/project-related flow.

### Ops <-> Runtime

Ops modules не мијењају само data; они утичу на инфраструктурни и runtime behaviour.
------------------------------------------------------------------------------------------------------------------

## 10) Шта нови инжењер мора знати напамет

- `komiti_timesheet` је први добар модул за учење inheritance + business rules.
- `komiti_project` је основа project/task domain-а.
- `komiti_dispatching` је custom operational model layer.
- `komiti_gantt` је advanced custom UI extension.
- `komiti_web` и `komiti_website_crm` су website/runtime learning layer.
- `komiti_dev_ops` и `komiti_claw` показују да KomITi Odoo није “само ERP custom field repo”.
------------------------------------------------------------------------------------------------------------------

## 11) Шта читаш даље

- `14_ODOO_ВЕБСАЈТ_И_КОРИСНИЧКИ_ИНТЕРФЕЈС_2h.md`
- `09_ODOO_ПРИРУЧНИК_ЗА_ОТКЛАЊАЊЕ_ГРЕШАКА_3h.md`
