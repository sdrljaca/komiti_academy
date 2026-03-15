# Odoo Debugging Playbook

Овај документ учи како се bug дијагностикује у KomITi-ју. Циљ није да “нешто пробаш”, него да систематски дођеш до root cause-а.
------------------------------------------------------------------------------------------------------------------

## 1) Прво класификуј проблем

Питај се којој класи проблема припада:
- model / business logic,
- view / XML layout,
- security / permission,
- action / menu / search context,
- frontend / assets / JS / browser cache,
- restore / parity / runtime drift,
- data inconsistency.

Без ове класификације дијагноза постаје random walk.
------------------------------------------------------------------------------------------------------------------

## 2) Debug order у KomITi начину рада

1. потврди problem statement,
2. идентификуј захваћени flow и role,
3. класификуј слој проблема,
4. потврди runtime truth,
5. тек онда мијењај код.
------------------------------------------------------------------------------------------------------------------

## 3) Ако сумњаш на model/business logic

Гледај:
- `create`, `write`, `unlink`,
- helper методе,
- compute/related logic,
- context-sensitive behaviour,
- да ли се логика ослања само на UI onchange.

KomITi example:
- `komiti_timesheet` lock date / Hours calculation.
------------------------------------------------------------------------------------------------------------------

## 4) Ако сумњаш на view problem

Гледај:
- inheritance chain,
- xpath target,
- да ли је parent view стабилан,
- да ли је upgrade стварно пуштен,
- да ли effective view одговара очекивању.

KomITi example:
- `komiti_timesheet` field placement,
- `komiti_project` task/project customization surface.
------------------------------------------------------------------------------------------------------------------

## 5) Ако сумњаш на security problem

Гледај:
- ACL,
- record rules,
- group membership,
- admin vs least-privileged scenario,
- server-side explicit checks.

Никад не претпостављај да је “field readonly” у view-у исто што и права заиста раде.
------------------------------------------------------------------------------------------------------------------

## 6) Ако сумњаш на action/search context problem

Гледај:
- action context,
- default search filter,
- search view wiring,
- view mode registration,
- menu/action binding.

KomITi example:
- `komiti_gantt` active filter и switcher behaviour.
------------------------------------------------------------------------------------------------------------------

## 7) Ако сумњаш на website/frontend/assets problem

Гледај:
- да ли је problem у source-у или у rendered DOM-у,
- bundle / asset runtime,
- browser cache,
- `ir_attachment` `/web/assets/%`,
- `ir_asset` custom entries ако је theme/website override у питању.

Ово је чест real-world KomITi problem class.
------------------------------------------------------------------------------------------------------------------

## 8) Ако сумњаш на localhost vs remote difference

Провјера иде овим редом:

1. да ли је иста база,
2. да ли је исти filestore,
3. да ли је исти upgrade/runtime status,
4. да ли су исти assets,
5. да ли је исти user/role scenario,
6. да ли је проблем заправо local config/runtime difference.
------------------------------------------------------------------------------------------------------------------

## 9) Restore / parity debugging

После restore-а, прије дубље дијагнозе провјери:
- `/web/health`,
- login page,
- `/web/assets/...` статусе,
- filestore присуство,
- да ли су DB dump и filestore из истог baseline-а.
------------------------------------------------------------------------------------------------------------------

## 10) Debug anti-patterns

- мијењаш код прије него што знаш problem class,
- гледаш само source code и вјерујеш да је runtime исти,
- тестираш само као admin,
- не разликујеш UI helper logic од server truth-а,
- не reset-ујеш assets кад problem class то тражи.
------------------------------------------------------------------------------------------------------------------

## 11) KomITi debugging questions

Кад год дијагностикујеш, запиши себи:
- који module/flow је захваћен,
- који role/actor види problem,
- шта је expected,
- шта је actual,
- који runtime proof имам,
- која је најмања сигурна измјена која адресира root cause.
------------------------------------------------------------------------------------------------------------------

## 12) Кад је дијагноза добра

Добра дијагноза значи да можеш јасно рећи:
- у ком слоју је problem,
- зашто се дешава,
- шта је runtime evidence,
- како ћеш га верификовати након фикса.
------------------------------------------------------------------------------------------------------------------

## 13) Шта читаш даље

- `10_ODOO_ПРИРУЧНИК_ЗА_ТЕСТИРАЊЕ_И_ПРОВЈЕРУ_3h.md`
- `11_ODOO_БЕЗБЈЕДНОСТ_ПОДАТАКА_И_МИГРАЦИЈЕ_3h.md`
