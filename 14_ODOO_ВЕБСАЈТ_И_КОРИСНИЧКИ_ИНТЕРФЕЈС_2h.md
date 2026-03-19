# Odoo Website and Frontend

Овај документ покрива website/theme/frontend слој у KomITi Odoo систему. Ово је посебна дисциплина и не треба је мијешати са класичним form/tree CRUD thinking-ом.

## Садржај

1\) Шта је у KomITi-ју website/frontend слој<br>
2\) Разлика: source code vs rendered truth<br>
3\) QWeb thinking<br>
4\) SCSS / assets thinking<br>
5\) Website form / CRM integration<br>
6\) Asset reset discipline<br>
7\) Mobile vs desktop<br>
8\) KomITi practical checklist<br>
9\) Шта мораш знати као професионалац

## 1) Шта је у KomITi-ју website/frontend слој

Најрелевантнији модули су:
- `komiti_web`
- `komiti_website_crm`
- дијелом `komiti_gantt` као custom frontend/UI experience

## 2) Разлика: source code vs rendered truth

У website слоју није довољно да видиш код у XML/SCSS/JS фајлу. Мораш гледати:
- rendered DOM,
- стварно учитане asset bundle-ове,
- browser/runtime caching,
- page-specific context.

## 3) QWeb thinking

QWeb template промјена утиче на rendered HTML, али:
- тек после module upgrade-а,
- тек после asset/runtime refresh-а,
- тек кад отвориш конкретну страницу и видиш output.

## 4) SCSS / assets thinking

SCSS промјена није “готова” кад се фајл сачува. Мораш провјерити:
- да ли је bundle rebuild практично effect-ован,
- да ли browser вуче стари asset,
- да ли је проблем у CSS specificity-ју,
- да ли је rendered HTML уопште онакав како претпостављаш.

## 5) Website form / CRM integration

`komiti_website_crm` је важан learning case јер показује да website form није само HTML form, него дио Odoo/CRM behaviour-а.

## 6) Asset reset discipline

Кад website изгледа stale/broken:

1. не паничиш,
2. провјераваш runtime state,
3. радиш asset reset discipline из `../custom-addons/CODEX_ODOO.md`,
4. поново гледаш rendered output.

## 7) Mobile vs desktop

Website change није довољно провјерити само на desktop-у ако layout issue очигледно има responsive risk.

## 8) KomITi practical checklist

- коју страницу мијењаш,
- који module носи ту измјену,
- који template/view је ефективан,
- који asset bundle учитава стилове/JS,
- како изгледа rendered резултат на конкретном URL-у,
- да ли је problem source, runtime, cache или asset drift.

## 9) Шта мораш знати као професионалац

Website/frontend task се не рјешава гледањем једног XML фајла. Мораш читати:
- template,
- assets,
- runtime response,
- rendered DOM,
- конкретну страницу и context.

