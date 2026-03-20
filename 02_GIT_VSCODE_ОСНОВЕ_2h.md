# Git And VS Code Foundations
Овај документ уводи кандидата у VS Code и Git основе које су потребне за сигуран рад у KomITi репоу.
Циљ није да кандидат постане Git или VS Code експерт за 2 сата, него да не прави почетничке грешке и да разумије шта тачно ради кад отвара workspace, проналази фајлове, мијења код, снима, commit-ује и шаље код.

## Садржај

1\) VS Code основе које мораш знати<br>
&nbsp;&nbsp;&nbsp;&nbsp;Explorer<br>
&nbsp;&nbsp;&nbsp;&nbsp;Workspace је VS Code контекст у ком радиш; он може садржати један фолдер или више фолдера<br>
&nbsp;&nbsp;&nbsp;&nbsp;Search, Explorer, Source Control и Terminal су 4 панела која мораш разликовати<br>
&nbsp;&nbsp;&nbsp;&nbsp;Шта почетник у VS Code-у мора одмах усвојити<br>
2\) Git основе које мораш знати<br>
3.1\) Локална и remote грана<br>
4\) Шта значе слова у VS Code Explorer-у<br>
5\) Explorer није исто што и Source Control panel<br>
5.1\) Шта значи доњи лијеви угао у VS Code-у: Git status indicator<br>
6\) Save није исто што и commit<br>
7\) Основни локални ток рада<br>
&nbsp;&nbsp;&nbsp;&nbsp;Корак 1: узми најновији `main`<br>
&nbsp;&nbsp;&nbsp;&nbsp;Корак 2: направи нови feature branch из `main`<br>
&nbsp;&nbsp;&nbsp;&nbsp;Корак 3: уради локалне измјене<br>
&nbsp;&nbsp;&nbsp;&nbsp;Корак 4: staged-уј и commit-уј<br>
&nbsp;&nbsp;&nbsp;&nbsp;Корак 5: push на GitHub<br>
&nbsp;&nbsp;&nbsp;&nbsp;Корак 6: промоција у `staging`<br>
&nbsp;&nbsp;&nbsp;&nbsp;Корак 7: промоција у `main`<br>
&nbsp;&nbsp;&nbsp;&nbsp;Корак 8: врати се на свој feature branch ако настављаш рад<br>
8\) Најчешће почетничке грешке<br>
9\) Најважнији појмови и Минималне команде које мораш знати<br>
10\) Како ово изгледа у KomITi-ју<br>
11\) Самопровјера<br>
12\) Шта читаш даље<br>
99\) Задатак на komiti_academy пројекту за кандидата

## 1) VS Code основе које мораш знати

### Explorer
- `Explorer` је лијеви панел у VS Code-у у ком видиш фолдере и фајлове.
- Кроз Explorer прегледаш фајл једним кликом (биће му назив италиц), а отвараш фајл са 2 клика.
- У Explorer-у видиш Фајлове, директоријуме, али само један workspace.

### Workspace је VS Code контекст у ком радиш; он може садржати један фолдер или више фолдера
- Ако у VS Code-у урадиш `Open Folder`, отворићеш један фолдер као свој радни workspace и аутоматски један неименован Workspace
- Ако у већ отворен workspace урадиш `Add Folder to Workspace`, добијаш `multi-root workspace`, тј. workspace са више top-level root директоријума.
- `workspace` није само визуелни појам у VS Code-у, него граница контекста за претрагу, читање фајлова, терминал и рад агента.
- Да ли можеш имати више workspace-ова истовремено: Да, можеш али не у једном VS Code прозору.
- Практично правило: ако хоћеш јасно раздвајање контекста, мање грешака и мање забуне око команди, често је сигурније имати два прозора него један претрпан multi-root workspace.

### Search, Explorer, Source Control и Terminal су 4 панела која мораш разликовати
- `Explorer` = структура фолдера и фајлова.
- `Search` = претрага текста кроз фајлове.
- `Source Control` = Git стање, staged и unstaged измјене.
- `Terminal` = мјесто гдје куцаш команде као `git`, `docker compose` и `rg`.

### Шта почетник у VS Code-у мора одмах усвојити
- да зна у ком workspace-у ради,
- да зна у ком root директоријуму се тренутно налази,
- да разликује Explorer од Source Control панела,
- да не прави фајлове у погрешном root-у,
- да зна да `save` у editor-у није исто што и `commit` у Git-у.

## 2) Git основе које мораш знати 
- `Git` и `GitHub` нису исто: `Git` је систем за version control, а `GitHub` је платформа на којој живи remote репо.
- VS Code Explorer и Source Control углавном ти показују Git стање локалног workspace-а.
- У KomITi workflow-у који сада користимо, типичан ток је: `feature` -> `staging` -> `main`.
- `clone` и `fork` нису исто: `clone` је локална копија repo-а на твом рачунару, а `fork` је твоја лична remote копија туђег repo-а на GitHub-у.
- `fork` се најчешће користи кад немаш write приступ на оригинални repo, па измјене радиш у свом GitHub fork-у и онда шаљеш `Pull Request` према оригиналном repo-у.
- Практично: ако радиш у свом или тиму доступном repo-у, најчешће ти треба `clone`; ако радиш на туђем GitHub repo-у без директног write приступа, онда ти прво треба `fork`, па тек онда `clone` тог fork-а.
- `DevOps` је шири начин рада и сарадње између development и operations стране, са циљем да се софтвер брже, сигурније и стабилније испоручује и одржава.
- `CI/CD` је ужи, практични дио тога: скуп аутоматизованих pipeline-ова и корака који build-ују, тестирају и испоручују код.
- `DevOps` и `CI/CD` су настали као одговор на спор, ручан и раздвојен начин прављења, тестирања и пуштања софтвера, гдје су development и operations дуго радили као одвојени свјетови, и нису настали од једног аутора, него су се постепено развили у software индустрији кроз agile, automation и DevOps праксе.
- Разлика је у томе што је `DevOps` више култура, operating model и дисциплина рада, а `CI/CD` конкретан механизам и алатски ток који ту дисциплину спроводи. Практично: `DevOps` ти каже како тим треба да ради и шта жели да постигне, а `CI/CD` служи да се те промјене аутоматски провјере и пребаце од commit-а до deployment-а.

## 3.1) Локална и remote грана
```text
REMOTE   [origin/feature]         [origin/staging]             [origin/main]
			  ^                           |                          |
			  | git push                  | git pull                 | git pull
			  |                           v                          v
LOKALNO  [feature] ----git merge----> [staging] ----git merge----> [main]
			  ^                                                        |
			  |                                                        |
			  +------- git checkout -b feature iz local main ----------+
								(a local main je prethodno
								osvježen iz origin/main)
```

Замисли да је Git repo једна фасцикла са више папира, а сваки branch један посебан папир у тој фасцикли. Исти branch може постојати на два мјеста: локално, код тебе на рачунару и remote, на GitHub-у.
- Креирање feature локалне гране (`git checkout -b 2026-03-12-features`):
	У стварном раду прво станеш на главни папир командом `git checkout main`, освјежиш га командом `git pull origin main`, па онда направиш свој радни папир командом `git checkout -b 2026-03-12-features`.
- Рад у локалној feature грани (`git commit -m "Expand Git foundations workflow"`):
	Послије тога мијењаш фајлове у VS Code-у, провјериш шта си тачно урадио са `git status --short` и `git diff --stat`, па локално снимаш своје стање командама `git add 02_GIT_VSCODE_ОСНОВЕ_2h.md` и `git commit -m "Expand Git foundations workflow"`.
- pull и merge локалне feature гране у staging (`git pull origin staging` и `git merge 2026-03-12-features`) и main:
	Кад хоћеш да и други виде твој рад, пошаљеш свој локални радни папир на GitHub командом `git push -u origin 2026-03-12-features`, чиме твој локални `2026-03-12-features` добије и своју remote копију `origin/2026-03-12-features`.
	Кад је промјена провјерена, пређеш на `staging` са `git checkout staging`, освјежиш га са `git pull origin staging`, унесеш садржај свог радног папира командом `git merge 2026-03-12-features`, па резултат пошаљеш назад на GitHub са `git push origin staging`; касније исту логику поновиш и за `main`, тако да Git практично служи да тачно знаш на ком папиру радиш, шта си мијењао и како се та промјена креће до главне верзије.

Обзиром да је ово јако важан концепт, ајде да га поновимо таксативно:
- `main` = главни папир,
- `staging` = папир за провјеру,
- `2026-03-12-features` = твој радни папир.
Исти тај branch може постојати на два мјеста:
- локално, код тебе на рачунару,
- remote, на GitHub-у.
Зато можеш имати:
- локални `staging`,
- remote `origin/staging`.
То нису буквално исти branch, него локална и remote копија исте линије рада.
У причи са папиром ово значи:
- `checkout` = прелазиш на други папир,
- `commit` = запамтиш тренутно стање папира,
- `push` = пошаљеш свој папир на GitHub,
- `pull` = узмеш новију верзију папира са GitHub-а,
- `merge` = пренесеш садржај са једног папира на други папир.
Практично:
- `git checkout staging` значи да си прешао на свој локални `staging`,
- `git pull origin staging` значи да си узео ново стање са remote `origin/staging`,
- `git push origin staging` значи да си послао свој локални `staging` на remote `origin/staging`.

## 4) Шта значе слова у VS Code Explorer-у
Најчешће ознаке су:
- `M` = `Modified`
- `U` = најчешће `Untracked` нови фајл који још није додат у Git; у merge конфликту може значити и unresolved/unmerged стање
- `A` = `Added`
- `D` = `Deleted`
- `R` = `Renamed`
Практично:
- ако видиш `M` поред `.md` фајла, мијењао си га локално. `M` најчешће нестане послије commit-а или ако вратиш фајл на старо стање.
- ако видиш `U`, Git још не прати тај нови фајл. `U` нестане кад фајл додаш у Git са `git add` па касније commit-ујеш, или ако обришеш тај нови фајл.
- ако видиш `D`, фајл је обрисан у локалном workspace-у. `D` нестане кад брисање уђе у commit, или ако вратиш обрисани фајл назад.
Уопштено, слова нестају кад Git више не види ту промјену као "неријешену" локалну промјену.

## 5) Explorer није исто што и Source Control panel
- Explorer даје брз визуелни signal поред фајла,
- Source Control panel ти детаљније показује шта је staged, шта unstaged и шта иде у commit.
Кад год ниси сигуран, Source Control panel и `git status --short` су поузданији од нагађања по иконицама.

## 5.1) Шта значи доњи лијеви угао у VS Code-у: Git status indicator
У Git status indicator-у често видиш кратак Git status за активни repo.
На примјеру типа:
- `odoo4komiti` = repo у коме тренутно радиш,
- `2026-03-11-features` = branch на коме тренутно стојиш,
- `*` = имаш локалне измјене које још нису commit-оване,
- иконицу кружних стрелица = Git sync/refresh зона; ту VS Code показује или нуди fetch/pull/push/sync, а ако се иконица врти, обично је Git операција у току.
То из print screen-а није неки посебан "Copilot workspace" или одвојени agent context, него VS Code status bar који показује Git контекст активног repo-а у тренутном workspace-у.
Практично, screenshot ти говори три ствари одједном:

За агента је ово користан сигнал, али не и магична гаранција.
- Git indicator говори агенту који је тренутни branch контекст. У истом clone-у и истом working tree-ју агент не може радити на другој локалној грани од оне коју Git status indicator показује. Ако indicator показује `2026-03-11-features`, онда агент у том контексту ради над `2026-03-11-features`.
- Ако имаш више агената у истом workspace-у, они дијеле исти checkout-ован branch и исто радно стабло; не могу радити над различитим локалним гранама.
- Ако видиш несклад између indicator-а и онога што очекујеш, провјери `git status` и `git branch --show-current`, јер можда гледаш други repo у multi-root workspace-у или други clone.
Ако имаш више root фолдера у истом workspace-у, VS Code обично и даље за активни фајл или активни repo приказује релевантан Git контекст, па зато мораш пазити који је фајл активан и у ком root-у стварно радиш.
У причи са папиром:
- `odoo4komiti` = фасцикла у којој су папири,
- `2026-03-11-features` = папир на коме тренутно пишеш,
- `*` = папир си мијењао, али ту верзију још ниси снимио као commit.

## 6) Save није исто што и commit
Ово је кључна почетничка разлика:
- `save` уписује фајл на диск,
- `commit` снима ту измјену у Git историју,
- `push` шаље тај commit на GitHub.
Значи, редослијед је често:
1. уредиш фајл,
2. `save`,
3. прегледаш diff,
4. `git add`,
5. `git commit`,
6. `git push`.

## 7) Основни локални ток рада
Ово је једна цјелина: како Git изгледа у стварном KomITi workflow-у, са конкретним командама и редослиједом који стварно користимо.

Исти овај Git ток касније ћеш морати сам да проведеш и за task-ове на `komiti_academy`, па га не читај као апстрактно правило него као радну процедуру.

### Корак 1: узми најновији `main`
```powershell
git checkout main
git pull origin main
```
- `git checkout main`: пређе на локалну грану `main`.
- `git pull origin main`: повуче најновије промјене са remote-а `origin` за грану `main` и споји их у локалну `main`.
- `origin`: аргумент који каже са ког remote-а повлачиш.
- `main`: аргумент који каже коју грану повлачиш.
Овдје узимаш најновији главни branch као полазну основу.
То значи:
- прешао си на локални `main`,
- повукао си најновије стање са remote `origin/main`,
- у причи са папиром: стао си на главни папир и провјерио да ли имаш његову најновију верзију из заједничке фасцикле.

### Корак 2: направи нови feature branch из `main`
```powershell
git checkout -b 2026-03-12-features
```
- `git checkout -b 2026-03-12-features`: направи нову грану из тренутне позиције и одмах пређе на њу.
- `-b` значи: направи нову грану и одмах пређи на њу; то је кратка опција, односно flag, и скраћеница је од `branch`.
- `2026-03-12-features` је аргумент; њиме задајеш како ће се нова грана звати.
Ако хоћеш одмах да branch постоји и на GitHub-у:
```powershell
git push -u origin 2026-03-12-features
```
- `git push -u origin 2026-03-12-features`: пошаље нову грану на GitHub и запамти upstream везу.
- `-u` значи `--set-upstream`; то је опција којом кажеш Git-у да памти везу између локалне гране и remote гране истог имена.
- `origin` је аргумент и значи: на који remote шаљеш.
- `2026-03-12-features` је аргумент и значи: коју грану шаљеш.
Овдје `checkout -b` значи:
- направи нови папир из тренутног папира,
- и одмах стани на тај нови папир,
- ако урадиш и `push -u`, онда тај нови папир одмах добија и своју копију у GitHub фасцикли.

### Корак 3: уради локалне измјене
Измијениш фајлове у VS Code-у, па провјериш стање:
```powershell
git status --short
git diff --stat
git diff -- 02_GIT_VSCODE_ОСНОВЕ_2h.md
```
- `git status --short`: прикаже кратак, компактни статус working tree-ја.
- `git diff --stat`: прикаже статистички преглед промјена по фајловима.
- `git diff -- 02_GIT_VSCODE_ОСНОВЕ_2h.md`: прикаже тачан diff само за наведени фајл.
- `--short` је дуга опција; тражиш краћи, компактнији приказ Git статуса.
- `--stat` је дуга опција; тражиш кратак статистички преглед промјена по фајловима.
- у команди `git diff -- 02_GIT_VSCODE_ОСНОВЕ_2h.md`, оно `--` није назив фајла него раздвајач; Git-у говори: све послије овога третирај као путању, не као опцију.
- `02_GIT_VSCODE_ОСНОВЕ_2h.md` је аргумент, односно путања фајла за који тражиш diff.
- у причи са папиром: сад пишеш по свом радном папиру и онда гледаш шта си на њему стварно промијенио у односу на старо стање.

### Корак 4: staged-уј и commit-уј
```powershell
git add 02_GIT_VSCODE_ОСНОВЕ_2h.md ИЛИ git add --all
git commit -m "Expand Git foundations workflow"
```
- `git add 02_GIT_VSCODE_ОСНОВЕ_2h.md`: staged-ује само тај један фајл.
- Кад кажемо `staged`, то практично значи: `изабрао си да та измјена уђе у сљедећи снимак`, односно у сљедећи commit.
- `git add --all`: staged-ује све детектоване измјене у радном стаблу, укључујући нове, измијењене и обрисане фајлове.
- `git commit -m "Expand Git foundations workflow"`: направи commit од staged измјена и одмах упише commit поруку.
- `--all`: flag који каже Git-у да не бираш појединачне фајлове него све тренутне измјене.
- `-m`: кратка опција за `message`.
- `"Expand Git foundations workflow"`: аргумент опције `-m`, односно текст commit поруке.
Послије успјешног commit-а Git често испише нешто као `66bee36`; то је кратки commit ID, односно скраћени commit hash. Тај број и слова нису случајни: то је кратка верзија јединственог идентификатора тог commit-а. Пуни commit hash је много дужи, а Git у свакодневном раду често приказује само скраћену верзију, довољну да се commit јасно препозна у том репоу. Практично, `66bee36` значи: "овај тачно одређени снимак кода". Зато можеш да кажеш, на примјер: `погледај commit 66bee36` или `ова промјена је ушла у 66bee36`.

Важно: Git технички не commit-ује "цијелу грану" као један посебан објекат, него прави нови снимак свега што си staged-овао док се налазиш на тој грани, зато је прецизније рећи: `на овој грани сам commit-овао све тренутне измјене`, а не `commit-овао сам грану`.
Ово значи да си локално снимио ново стање свог feature branch-а.
Ово је дио гдје већина почетника први пут стварно види разлику између:
- save,
- add,
- commit.
Додатно:
- `git add` значи: означио си који дио папира хоћеш да уђе у снимак,
- `git commit` значи: направио си снимак тог папира у том тренутку,
- у причи са папиром: не памтиш баш све што си икад шарао, него само оно што си свјесно одлучио да уђе у ову верзију.

### Корак 5: push на GitHub
```powershell
git push origin 2026-03-12-features
```
- `git push origin 2026-03-12-features`: пошаље локалне commit-ове са те гране на GitHub.
- `origin`: аргумент који каже на који remote шаљеш.
- `2026-03-12-features`: аргумент који каже коју грану шаљеш.
Сад твој локални feature branch постоји и као remote branch на GitHub-у.
Ово је важна разлика:
- локални `2026-03-12-features` = код тебе,
- remote `origin/2026-03-12-features` = на GitHub-у,
- у причи са папиром: свој радни папир си послао у заједничку фасциклу да и други могу да виде ту верзију.

### Корак 6: промоција у `staging`
Прво пређеш на `staging` и освјежиш га:
```powershell
git checkout staging
git pull origin staging
```
- `git checkout staging`: пређе на локалну грану `staging`.
- `git pull origin staging`: освјежи локални `staging` најновијим стањем са remote-а `origin/staging`.
Онда унесеш feature садржај у `staging`:
```powershell
git merge 2026-03-12-features
git push origin staging
```
- `git merge 2026-03-12-features`: у тренутну грану `staging` уноси садржај са feature гране.
- `git push origin staging`: шаље ажурирани `staging` назад на GitHub.
То значи да је садржај са твог feature branch-а прешао у `staging`.
Овдје `merge` ради овако:
- стао си на `staging`,
- освјежио си `staging` са GitHub-а,
- у `staging` си унео садржај са `2026-03-12-features`,
- па си нови `staging` послао назад на GitHub,
- у причи са папиром: узео си папир за провјеру, провјерио да је свеж, па на њега пренио садржај са свог радног папира.

### Корак 7: промоција у `main`
Кад је `staging` или feature промјена провјерена, идеш на `main`:
```powershell
git checkout main
git pull origin main
git merge 2026-03-12-features
git push origin main
```
- `git checkout main`: пређе на локалну грану `main`.
- `git pull origin main`: освјежи локални `main` remote стањем са `origin/main`.
- `git merge 2026-03-12-features`: у `main` уноси садржај провјерене feature гране.
- `git push origin main`: шаље ажурирани `main` на GitHub.
У неким токовима се у `main` merge-ује `staging`, а у неким директно feature branch. Битна логика је иста:
- прво станеш на branch који прима промјену,
- онда у њега merge-ујеш провјерени branch,
- па push-ујеш remote,
- у причи са папиром: сад узимаш главни папир и на њега преносиш оно што је већ прошло провјеру.

### Корак 8: врати се на свој feature branch ако настављаш рад
```powershell
git checkout 2026-03-12-features
```
- `git checkout 2026-03-12-features`: врати те на локалну feature грану да наставиш рад.
Ако ово схватиш, онда практично разумијеш и:
- у причи са папиром: вратио си се на свој радни папир и настављаш да пишеш на њему, а не на `staging` или `main` папиру,
- шта је локална грана,
- шта је remote грана,
- шта је `checkout`,
- шта је `pull`,
- шта је `push`,
- шта је промоција између грана.

## 8) Најчешће почетничке грешке
- помијешати `save` и `commit`,
- commit-овати све без читања diff-а,
- убацити неповезане фајлове у исти commit,
- радити директно на погрешној branch-и,
- видјети `U` и не разумјети да је то нови untracked фајл,
- мислити да је `push` исто што и `deploy`.

## 9) Најважнији појмови и Минималне команде које мораш знати
- `working tree`: локалне измјене које још нису commit-оване,
- `staged changes`: измјене спремљене за наредни commit,
- `commit`: снимак једне логичке цјелине,
- `branch`: изолована линија рада,
- `fork`: твоја лична GitHub копија туђег repo-а, на којој можеш радити без директног мијењања оригинала,
- `checkout`: прелазак на други branch или креирање новог branch-а,
- `merge`: пренос садржаја из једног branch-а у други branch,
- `origin`: default remote,
- `push`: слање локалних commit-а на remote,
- `pull`: преузимање remote промјена.

Ово су исте оне команде из workflow-а изнад, само као кратка cheat-sheet листа:
```powershell
git checkout main
git checkout staging
git checkout -b <new-branch>
git status --short
git diff --stat
git diff -- path/to/file
git add path/to/file
git commit -m "Short message"
git merge <source-branch>
git pull origin <branch>
git push origin <branch>
```
- `git checkout main` / `git checkout staging`: прелазак на постојећу локалну грану.
- `git checkout -b <new-branch>`: креира нову грану и одмах пређе на њу; `-b` значи `branch`.
- `git status --short`: кратак статус working tree-ја; `--short` значи компактни приказ.
- `git diff --stat`: статистички преглед diff-а; `--stat` значи summary по фајловима.
- `git diff -- path/to/file`: diff само за један фајл; `--` раздваја опције од путање.
- `git add path/to/file`: staged-ује један конкретан фајл.
- `git commit -m "Short message"`: прави commit; `-m` значи да поруку дајеш у истој команди.
- `git merge <source-branch>`: уноси садржај source гране у тренутну грану.
- `git pull origin <branch>`: повуче remote стање са `origin` за дату грану и споји га локално.
- `git push origin <branch>`: пошаље локалне commit-ове на remote `origin` за дату грану.

## 10) Како ово изгледа у KomITi-ју
У овом репоу важи дисциплина:
- један commit = једна логичка цјелина,
- не комитуј неповезане измјене,
- прво прочитај `eng codex`,
- не третирај `main` као playground,
- `staging` је integration грана, а `main` production грана,
- локални Git proof није исто што и Odoo runtime proof.

## 11) Самопровјера
Кад завршиш овај документ, мораш знати да одговориш:
- шта значи `M`, а шта `U` у VS Code-у,
- која је разлика између save / commit / push,
- која је разлика између `fork` и `clone`,
- шта је branch,
- шта ради `checkout`, а шта `merge`,
- која је разлика између локалне `staging` и remote `origin/staging`,
- зашто `git status --short` провјеравамо прије commit-а,
- зашто не стављамо неповезане фајлове у исти commit.

## 12) Шта читаш даље
- `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- `04_ODOO_ОСНОВЕ_4h.md`
- `05_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`

## 99) Задатак на komiti_academy пројекту за кандидата

1. Отвори свој налог на GitHub, креирај repo `komiti_academy_ime_polaznika` и клонирај га локално, јер је то remote и локални репо у ком радиш свој кандидатски модул.  
Референца: Ово је објашњено у поглављима `## 2) Git основе које мораш знати` и `## 7) Основни локални ток рада`.
2. Одреди како ће изгледати твој први рад у Git-у за `komiti_academy`: назив feature гране, прва логичка цјелина за commit и правило шта не смије ући у исти commit.  
Референца: Ово је објашњено у поглављима `## 7) Основни локални ток рада` и `## 10) Како ово изгледа у KomITi-ју`.
3. У свом репоу увјежбај пун Git workflow на једноставном фајлу `1.txt`: креирај локалне и remote гране `main`, `staging` и `feature` (`feature` да буде у складу са ENGINEERING_CODEX.md у предузећу KomITi), па у `feature` грани направи `1.txt` са једним редом `prvi red`, commit-уј и push-уј ту промјену.  
Референца: Ово је објашњено у поглављима `## 3.1) Локална и remote грана`, `## 7) Основни локални ток рада` и `## 10) Како ово изгледа у KomITi-ју`.
4. Након тога промовиши исту промјену из `feature` у `staging`, па из `staging` у `main`, онда се врати на `feature`, у `1.txt` додај други ред `drugi red` и понови исти workflow до `main`.  
Референца: Ово је објашњено у поглављима `## 3.1) Локална и remote грана`, `## 7) Основни локални ток рада`, `## 8) Најчешће почетничке грешке` и `## 10) Како ово изгледа у KomITi-ју`.

Рјешења:

1. За GitHub налог, repo и локални clone уради ово редом:
	1. Ако већ немаш налог, отвори га на GitHub-у и доврши основну регистрацију.
	2. На GitHub-у креирај нови repo под именом `komiti_academy_ime_polaznika` и означи да ти GitHub одмах креира почетни `README`, да би remote `main` постојао одмах.
	3. Пази да назив repo-а јасно носи твој кандидатски контекст и да не правиш рад директно у learning repo-у `komiti_academy`.
	4. Клонирај тај repo локално командом `git clone <url-kopiran-sa-githuba>` и уђи у фолдер репоа.
	5. Отвори тај локални clone у VS Code-у и провјери са `git branch --show-current` да си на `main`.
	6. Провјери са `git remote -v` да је remote `origin` повезан на твој GitHub repo.
2. За овај први Git задатак уради ово редом:
	1. У `## 7) Основни локални ток рада` узми образац за branch flow.
	2. У терминалу укуцај `git checkout -b 2026-03-15-komiti-academy-skeleton`; као резултат треба да пређеш на нову грану чије име јасно каже да је везана за `komiti_academy`.
	3. Запиши шта ће бити прва логичка цјелина за commit, нпр. `module skeleton` или `почетни model`.
	4. Из `## 10) Како ово изгледа у KomITi-ју` запиши правило шта неће ући у исти commit ако не припада истој промјени.
3. За први пуни workflow на `1.txt` уради ово редом у свом репоу `komiti_academy_ime_polaznika`:
	1. Провјери да си у локалном clone-у `komiti_academy_ime_polaznika` и да локални `main` већ постоји, јер си repo клонирао са GitHub-а.
	2. Креирај локални `staging` командом `git checkout -b staging`, па га пошаљи на GitHub командом `git push -u origin staging`; као резултат треба да имаш и локални и remote `staging`.
	3. Врати се на `main` командама `git checkout main` и `git pull origin main`, да feature грану направиш из ажурног `main`.
	4. Креирај feature грану командом `git checkout -b 2026-03-15-git-workflow-vjezba`.
	5. У тој грани направи фајл `1.txt` са једним редом: `prvi red`.
	6. Прије staging-а у терминалу укуцај `git status --short` и `git diff --stat`; као резултат треба да видиш само `1.txt` као једну чисту логичку промјену.
	7. Уради `git add 1.txt` и `git commit -m "Add first line to 1.txt"`.
	8. Уради `git push -u origin 2026-03-15-git-workflow-vjezba`; као резултат треба да имаш и локалну и remote feature грану са првом измјеном.
4. За промоцију и понављање workflow-а уради ово редом:
	1. Док си на `2026-03-15-git-workflow-vjezba`, провјери да је `1.txt` на remote feature грани и да commit историја има смисла.
	2. Пређи на `staging`, освјежи га, уради merge из `2026-03-15-git-workflow-vjezba`, па `git push origin staging`; као резултат `prvi red` мора бити и на remote `staging`.
	3. Пређи на `main`, освјежи га, уради merge из `staging`, па `git push origin main`; као резултат `prvi red` мора бити и на remote `main`.
	4. Врати се на `2026-03-15-git-workflow-vjezba`; по жељи прво уради `git merge main`, да feature грана види најновије стање `main` прије наставка рада.
	5. У `1.txt` додај други ред `drugi red`, па уради `git add 1.txt`, `git commit -m "Add second line to 1.txt"` и `git push origin 2026-03-15-git-workflow-vjezba`.
	6. Понови исту промоцију: `feature` -> `staging` -> `main`, тако да и `drugi red` прође цијели workflow.
	7. На крају провјери да локални и remote `main`, `staging` и `2026-03-15-git-workflow-vjezba` имају очекивану историју и да можеш објаснити како се једна мала промјена креће кроз цијели Git flow.

