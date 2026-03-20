# 06. Frontend, Owl, website и Odoo 19

## Сврха

Један од највећих проблема старог начина учења Odoo-а је што developer остане у утиску да је Odoo развој углавном Python + XML.

За Odoo 19 то више није довољно.

Ово поглавље зато треба читати као исправку тог старог утиска. Није циљ да студент одмах постане frontend specialist, него да престане frontend слој третирати као мистерију или споредну тему. У Odoo 19 frontend је сувише важан да би се прескочио.

## Frontend mental model

Frontend у Odoo-у обухвата:
- web client;
- Owl компоненте;
- registries;
- services;
- hooks;
- assets;
- QWeb templates;
- website/portal customization.

Не мораш бити pure frontend specialist, али мораш разумјети систем.

Другим ријечима, student не треба да зна све internals web client-а одмах, али мора знати ко су главни дијелови и како сарађују. Ако тога нема, свaka frontend измјена изгледаће као случајан patch у JS-у, XML-у или CSS-у без јасног разлога зашто баш ту нешто мијењаш.

## Owl

Owl је component model који стоји иза великог дијела modern Odoo frontend-а.

Мораш бар разумјети:
- компоненту;
- props/state mental model;
- lifecycle на основном нивоу;
- event interaction;
- гдје компоненте улазе у Odoo web client.

За student-а је најважније да Owl не види као „још једну библиотеку коју треба набубати“, него као начин размишљања о интерфејсу. Компонента представља дио UI-а који има своје стање, понашање и границе. Кад то разумијеш, frontend код постаје мање магичан и лакше читљив.

## Registries и services

Ово је један од кључних Odoo 19 frontend концепата.

Registries ти говоре гдје framework „качиш“ extension.
Services ти говоре како shared frontend behavior живи изван једне компоненте.

Ако ово не разумијеш, frontend customization ће ти брзо постати ad hoc patching.

Ово је посебно важно у Odoo 19 јер framework није замишљен да све рјешаваш импровизованим override-ом. Постоје мјеста на којима систем очекује extension, и постоје мјеста гдје је patching знак да вјероватно радиш против архитектуре. Student треба рано развити осјећај за ту разлику.

## Hooks

Hooks су дио modern frontend discipline-е.

Не треба их посматрати као fancy синтаксу, него као договорен pattern за stateful/frontend behavior.

Кад student усваја hooks, корисно је да их гледа као структуриран начин да компоненте дијеле понашање и реактивну логику, без убацивања свега у једну велику класу или у хаотичан procedural код. То није само стил, него и одрживост.

## Assets

Assets су један од најчешћих извора забуне:
- код постоји, али није учитан;
- UI не изгледа како очекујеш;
- stale bundle или cache прикрива стварно стање;
- после restore-а или theme промјене систем не личи на оно што код обећава.

Зато asset troubleshooting није споредна тема.

Ово је дио који треба нарочито добро објаснити студенту, јер иначе добије утисак да је frontend debugging произвољан. Није. Само што доказ исправности не лежи само у source коду, него и у томе шта је bundle-овано, кеширано, рендеровано и стварно испоручено browser-у.

## QWeb и website слој

QWeb остаје важан и у Odoo 19.

Мораш знати:
- гдје се користи backend-side templating;
- гдје се користи website/portal rendering;
- како template inheritance ради;
- зашто XML/QWeb промјена често није довољна без upgrade-а и runtime провјере.

Студенту је корисно да QWeb посматра као мост између података и приказа. То није само „HTML са неким tag-овима“, него механизам којим Odoo гради видљиви интерфејс. Кад то схватиш, лакше ти је да разумијеш зашто се неки проблем појављује у template-у, а не у Python слоју.

## Website customization

Website рад није само „додај мало CSS-а“.

То је комбинација:
- views;
- templates;
- assets;
- theme logic;
- portal/website behavior;
- понекад Owl компоненти.

Website је добар примјер зашто Odoo development не треба свести на backend. Кад радиш website измјену, често мораш истовремено разумјети и template слој, и asset flow, и визуелни резултат, и понекад податке који хране тај приказ. То је одлична тема за учење системског размишљања.

## Odoo 19 practical note

За developer-а који хоће да буде више од basic backend junior-а, Odoo 19 тражи:
- основно frontend читање и разумјевање;
- способност да прати asset flow;
- способност да разликује backend bug од frontend/runtime проблема.

То не значи да свако мора бити full-stack expert од првог дана. Значи да студент више не може поштено рећи „ја радим само Python“ а да игнорише дио система који директно утиче на оно што корисник види и користи.

## Минимална вјежба

1. Пронађи један постојећи frontend extension point у Odoo 19 docs.
2. Направи малу измјену на једном view-у или website елементу.
3. Провјери asset loading.
4. Уради hard refresh и runtime провјеру.
5. Објасни шта је ту било backend, а шта frontend одговорност.

## Шта мораш знати прије преласка даље

- шта је Owl;
- чему служе registries/services/hooks;
- зашто су assets важни;
- зашто website customization није само XML;
- зашто Odoo 19 frontend не смијеш игнорисати.