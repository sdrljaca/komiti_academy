# Practice Ladder — 20 Progressive Odoo Exercises

Ово је практични curriculum за кандидата и наредне KomITi junior чланове. Вјежбе иду од најсигурнијих ка сложенијим, и све су везане за реалне KomITi модуле и way-of-working.

## 1) Foundation drills

1. Нађи у `komiti_timesheet` manifest, model и view фајлове и објасни чему служе.
2. Подигни localhost и потврди `/web/health`.
3. Направи docs-only commit који ажурира један learning документ.
4. Напиши 5 SQL upita над локалном Odoo базом и објасни резултат.
5. Пронађи који custom модул мијења website form/CRM behaviour.

## 2) Safe UI and XML drills

6. Промијени један label у постојећем view-у и пусти module upgrade.
7. Додај један help текст на постојеће field rendering мјесто.
8. Пронађи стабилан xpath anchor и објасни зашто је стабилан.
9. Уради малу search/filter измјену и ручно верификуј effect.
10. Напиши кратак smoke test записник за ту измјену.

## 3) Python and business rule drills

11. Пронађи у `komiti_timesheet` гдје се брани lock date и објасни normal user vs admin path.
12. Додај један мали helper метод у постојећи модул и објасни зашто не иде inline.
13. Испрати један `create/write` flow од UI-а до model кода.
14. Пронађи једно related поље и објасни зашто није исто што и stored source field.
15. Напиши verification plan за мали Python fix.

## 4) Advanced Odoo / frontend drills

16. Испрати `komiti_gantt` од action-а до JS/QWeb/SCSS слоја.
17. Објасни зашто custom view постојање у коду није довољно да се види у UI switcher-у.
18. За један website task напиши asset/runtime debugging редослијед.

## 5) Professional delivery drills

19. За један реалан KomITi task напиши mini technical plan: scope, risk, verification, rollout.
20. Самостално затвори један мали task end-to-end: код, upgrade, verification, docs delta, commit.

## 6) Capstone build path: `komiti_academy`

Ово је обавезна parallel track вјежба. Не ради се „једног дана на крају“, него током цијелог curriculum-а.

21. Направи addon skeleton за `komiti_academy`.
22. Дефиниши `academy.course` и `academy.session` model-е.
23. Додај relation поља и објасни зашто су баш тог типа.
24. Направи tree/form view за оба model-а.
25. Додај menu/action wiring и инсталирај модул.
26. Додај basic security групе и access CSV.
27. Имплементирај 3 computed/derived поља.
28. Имплементирај least 4 business правила.
29. Напиши smoke test note за happy path.
30. Напиши negative test checklist за invalid input и permission scenario.
31. Уради refactor pass: naming, helper methods, file layout.
32. Напиши кратак README/capstone handoff: scope, commands, verification, residual risk.

## 7) Како знаш да је capstone стварно завршен

Capstone је стварно готов тек кад можеш показати све ово:
- модул се инсталира,
- модул се upgrade-ује,
- UI flow ради,
- negative case-ови су тестирани,
- security није прескочен,
- постоји docs delta,
- можеш усмено објаснити architecture и risk.

## 8) Како се оцјењује напредак

Човјек не напредује само кад “уради код”, него кад може сам да објасни:
- шта је мијењао,
- зашто баш ту,
- шта је провјерио,
- који је ризик,
- шта би урадио ако verification падне.