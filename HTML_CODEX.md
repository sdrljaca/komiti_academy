# HTML Codex

Овај документ дефинише правила по којима Claude треба да испоручује HTML tutorial артефакте за `komiti_academy`.

Сврха овог документа је да HTML који улази у `en/html/` буде одмах употребљив у Odoo Tutorials runtime-у, без накнадних CSS override-ова у `odoo4komiti`, осим ако баш постоји repo-specific разлог.

## 1) Улоге и source of truth

- Српски markdown документ је канонски source of truth.
- Енглески HTML у `en/html/` је deploy артефакт.
- Енглески markdown није workflow source ако је архивиран или напуштен.
- Claude не смије измишљати нови content flow који није усклађен са српским source документом.

## 2) Гдје артефакт живи

- Сваки испоручени HTML tutorial иде у `en/html/`.
- Име HTML фајла мора остати стабилно и предвидљиво, да runtime sync у `odoo4komiti` не тражи ручно преименовање.
- Ако постоји постојећи slug, Claude га не мијења без експлицитног разлога.

## 3) Шта HTML мора да садржи

- Потпун, самосталан HTML документ (`<!DOCTYPE html>`, `html`, `head`, `body`).
- Inline CSS који је довољан да документ изгледа исправно и без спољних asset-а.
- Јасан `<title>` и видљив `h1` који одговарају tutorial теми.
- Јединствен `.page-wrapper` container.
- Конзистентну typographic структуру: `h1`, `h2`, `h3`, `p`, `ul`, `ol`, `table`, `blockquote`, `pre`, `code`.

## 4) Layout и spacing правила

- HTML мора бити визуелно компактан и читљив без додатног Odoo override-а.
- `.page-wrapper` не смије имати претјеран spacing који касније тјера runtime CSS patch.
- Подразумијевано правило за tutorial странице је компактнији layout, не „book page" са превише празног простора.
- Claude мора пазити на:
  - margin око главног wrapper-а,
  - padding унутар wrapper-а,
  - вертикалне размаке између пасуса, листа и heading-а,
  - line-height текста.
- Bullet/list spacing мора бити експлицитно контролисан и конзистентан.
- Тренутни baseline који је већ виђен у HTML артефактима је:
  - `ul, ol { margin: 10px 0 14px 28px; }`
  - `li { margin-bottom: 6px; }`
  - `.toc ol { margin-top: 10px; }`
  - `.toc li { margin-bottom: 4px; }`
- Нови target за 20% мањи bullet spacing је:
  - `ul, ol { margin: 8px 0 11.2px 28px; }`
  - `li { margin-bottom: 4.8px; }`
  - `.toc ol { margin-top: 8px; }`
  - `.toc li { margin-bottom: 3.2px; }`
- Claude не смије слободно процјењивати bullet spacing ако већ постоји договорени target; мора испоручити ове вриједности или експлицитно рећи зашто одступа.
- Ако се spacing мијења у једном tutorial-у из layout разлога, исти pattern треба провјерити и у осталим tutorial HTML фајловима, не само локално у једном документу.

## 5) Code и prompt formatting правила

- `pre` блокови морају имати тамну позадину и довољан contrast.
- `.ascii-diagram` блокови морају визуелно пратити code block стил, а не да остану на свијетлој позадини ако су остали code блокови тамни.
- Inline `code` мора остати правилно поравнат унутар реда.
- Claude мора експлицитно тестирати визуелно редове који почињу inline code/prompt садржајем, као нпр:
  - `C:\dev\KomITi\...`
  - `git init`
  - `git clone`
  - `git checkout ...`
- Ако Claude смањује line-height текста, мора провјерити и `code` baseline / vertical alignment, да не настане визуелно „пропадање" или ломљење реда.

## 6) Садржајна вјерност source документу

- HTML мора бити садржајно усклађен са српским markdown source-ом.
- Ако source каже `feature -> staging -> main`, HTML не смије испоручити старији branch model.
- Ако source користи одређени ASCII дијаграм, кораке или терминологију, HTML мора пратити ту логику.
- Имена докумената као `ENGINEERING_CODEX.md` не смију се испуштати ако су експлицитно битна у source-у.

## 7) Responsive и runtime правила

- HTML мора остати читљив унутар Odoo Tutorials layout-а који га render-ује inline.
- Не смије зависити од iframe-specific понашања.
- Не смије тражити посебан JavaScript да би основни content био читљив.
- Не смије ломити page width на mobile-у без јасног разлога.
- Horizontal overflow је прихватљив за `pre` и `.ascii-diagram`, али не за обичан body text.

## 8) Шта Claude не треба да ради

- Не уводити нови visual language по документу без разлога.
- Не правити различите spacing системе од tutorial-а до tutorial-а.
- Не остављати свијетли `.ascii-diagram` ако су `pre` блокови тамни.
- Не испоручивати HTML који захтијева накнадни Odoo CSS patch за основну читљивост.
- Не мијењати slug/filename convention без експлицитне одлуке.

## 9) Обавезна self-check листа прије испоруке

Прије него што Claude испоручи HTML, мора да провјери:

1. Да ли је HTML садржајно усклађен са српским source markdown-ом.
2. Да ли су branch/workflow кораци тачни.
3. Да ли су `pre` и `.ascii-diagram` визуелно усклађени.
4. Да ли inline `code` остаје поравнат на почетку реда.
5. Да ли `.page-wrapper` spacing није претјеран.
6. Да ли је документ читљив без додатног runtime CSS patch-а.
7. Да ли filename и slug остају стабилни.

## 10) Очекивани handoff уз HTML испоруку

Кад Claude испоручује HTML артефакт, handoff треба да каже:

- који српски markdown је био source,
- који HTML фајл је ажуриран,
- које content промјене су унесене,
- да ли је мијењан styling,
- да ли су провјерени `pre`, `.ascii-diagram` и inline `code` alignment,
- да ли је потребан било какав downstream runtime override.

## 11) Практично правило

- Ако Odoo runtime мора да patch-ује основни typography/layout да би tutorial изгледао нормално, онда HTML артефакт није довољно добро испоручен upstream.
