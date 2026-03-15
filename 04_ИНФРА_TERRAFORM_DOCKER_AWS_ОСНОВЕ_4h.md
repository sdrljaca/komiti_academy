# Infra Foundations: Terraform, Docker, AWS

Ово је foundation документ за кандидата и сваког новог KomITi инжењера који infrastructure слој учи од нуле, али кроз стварни KomITi AWS/Terraform/Docker контекст, не кроз апстрактне toy примјере.

Сврха није да те претвори у cloud/platform специјалисту за 4 сата, него да ти да operational mental model:
- шта у KomITi-ју ради AWS,
- шта ради Docker и терминалска команда `docker compose`,
- шта ради Terraform и његове терминалске команде,
- и како се та три слоја везују у један систем.

Правило у овом документу је једноставно: кад се појам први пут уводи, експлицитно кажем да ли је терминалска команда или фајл; касније користим само назив ако је контекст већ јасан.
------------------------------------------------------------------------------------------------------------------

## 1) Шта је infra stack у KomITi-ју

Кад у овом репоу кажемо „infra“, не мислимо на један алат, него на више слојева који раде заједно:
- AWS је cloud substrate: VM, мрежа, IP, security boundary, disk,
- Docker је runtime packaging слој: како се сервис пакује и покреће у контејнеру,
- терминалска команда `docker compose` је локални/host orchestration слој за више сервиса,
- Terraform је infrastructure-as-code слој који описује и мијења AWS ресурсе,
- Odoo/Caddy/Postgres су application/runtime workload који на том слоју живи.

Професионално размишљање овдје је:
- Terraform не замјењује Docker,
- Docker не замјењује AWS,
- AWS не замјењује application verification,
- сваки слој има своју истину, свој risk и свој operational vocabulary.
------------------------------------------------------------------------------------------------------------------

## 2) AWS основе које мораш знати

AWS у овом learning контексту не учиш као каталог 200 сервиса, него као минимални operational set.

Најбитнији concepts су:
- `EC2`: виртуелна машина на којој runtime стварно живи,
- `VPC` / subnet: мрежни простор и сегментација,
- security group: inbound/outbound firewall boundary,
- `EIP` (`Elastic IP`): стабилна јавна IP адреса,
- `Route 53` / DNS thinking: како домен дође до правог host-а,
- disk/volume reasoning: runtime није само CPU и RAM него и storage.

У KomITi mental model-у то типично значи:
- један EC2 host носи runtime слој,
- security group одређује ко може на SSH/HTTP/HTTPS,
- EIP и DNS везују host за јавни endpoint,
- мрежа и security boundary су дио production safety-а, не споредан детаљ.

Junior грешка је да AWS гледа као „само сервер“. Бољи mental model је:
- EC2 = compute,
- security group = ко смије да прича са тим compute-ом,
- subnet/VPC = гдје тај compute живи,
- IP/DNS = како други системи долазе до њега.
------------------------------------------------------------------------------------------------------------------

## 3) Docker и container основе које мораш знати

Container није виртуелна машина. То је изолован runtime process са својим filesystem view-ом, network namespace-ом и договореним entrypoint-ом.

Најбитнији concepts су:
- image: template од ког контејнер настаје,
- container: running instance те image-е,
- volume: persistent data који не желиш изгубити кад се container ре-креира,
- port mapping: како service из контејнера постаје доступан host-у,
- environment variables: runtime конфигурација,
- `docker compose`: декларативни опис више сервиса који раде заједно.

У KomITi контексту је битно рано усвојити:
- Odoo често не ради сам, него са Postgres-ом, reverse proxy-јем и другим helper слојевима,
- `docker compose` је договор како ти сервиси заједно живе,
- restart container-а није исто што и rebuild image-е,
- ephemeral container filesystem није исто што и persistent data.

Практично размишљање:
- image = шта покрећеш,
- container = шта тренутно ради,
- compose = како више контејнера формира један runtime систем,
- volume = шта мора преживјети restart/recreate cycle.
------------------------------------------------------------------------------------------------------------------

## 4) Terraform mental model

Terraform је infrastructure-as-code алат.

Његова суштина није „направи ми један EC2“, него:
- опиши жељено стање инфраструктуре као код,
- упореди то стање са оним што стварно постоји,
- добиј plan промјена,
- контролисано примјени те промјене.

У KomITi контексту то значи:
- DEV и PROD AWS окружења описујемо Terraform кодом,
- EC2, networking, security groups и EIP нису ручни кликови у AWS console-у,
- `terraform plan` је доказ шта ће се промијенити,
- `terraform apply` је контролисана примјена,
- state фајл `terraform.tfstate` је runtime истина Terraform-а о ресурсима које управља; у odoo4komiti репоу га нпр. видиш у `infra/aws/odoo-dev-ec2-compose/terraform.tfstate`.
------------------------------------------------------------------------------------------------------------------

## 5) Шта је provider

Provider је plugin који Terraform-у омогућава да прича са неким системом.

У овом репоу најбитнији је:
- AWS provider.

Практично:
- Terraform сам по себи не зна шта је EC2, VPC или Elastic IP,
- AWS provider му даје тај vocabulary и API bridge.

Ако гледаш Terraform код, `provider` слој је оно што Terraform повезује са стварним cloud-ом.
------------------------------------------------------------------------------------------------------------------

## 6) Шта су resource, data source и output

`resource` описује нешто што Terraform прави или мијења.

Примјери из нашег AWS контекста:
- EC2 instance,
- security group,
- elastic IP,
- route table,
- key pair.

`data` чита нешто што већ постоји, без ownership-а над тим ресурсом.

Практично:
- resource = Terraform управља животним циклусом,
- data source = Terraform само чита.

`output` износи битну вриједност напоље.

У KomITi контексту то су често:
- public IP,
- SSH команда,
- HTTP/HTTPS URL,
- други runtime identifier-и који ти требају послије `apply`.
------------------------------------------------------------------------------------------------------------------

## 7) State је критична истина

Terraform state није неки споредни cache. То је кључни артефакт.

State памти:
- које ресурсе Terraform сматра својима,
- њихове ID-еве,
- атрибуте који су потребни за наредни plan,
- dependency graph који је већ materialized у runtime-у.

Зато су важна правила:
- state се не комитује у git,
- state може садржати осјетљиве податке,
- губитак state-а није „мањи проблем“, него operational problem,
- ручне промјене у AWS console-у могу створити drift између state-а и стварности.

У KomITi начину рада мораш рано усвојити:
- source code није довољан,
- Terraform state + cloud runtime = стварна истина.
------------------------------------------------------------------------------------------------------------------

## 8) Variables и `terraform.tfvars`

Variables су улазни параметри Terraform конфигурације.

Оне постоје да код не hardcode-ује:
- CIDR правила,
- instance type,
- домен,
- кључне naming/runtime вриједности,
- понекад и credentials/secrets, ако модел то дозвољава.

У овом репоу често ћеш видјети:
- фајл `variables.tf` као schema улаза, нпр. у `infra/aws/odoo-dev-ec2-compose/variables.tf` и `infra/aws/odoo-prod-ec2-compose/variables.tf`,
- фајл `terraform.tfvars.example` као template, нпр. у `infra/aws/odoo-dev-ec2-compose/terraform.tfvars.example` и `infra/aws/odoo-prod-ec2-compose/terraform.tfvars.example`,
- фајл `terraform.tfvars` као локалну, некомитовану runtime конфигурацију, нпр. у `infra/aws/odoo-dev-ec2-compose/terraform.tfvars`.

Важно: зато не видиш `infra/aws/odoo-prod-ec2-compose/terraform.tfvars` у репоу. За PROD је намјерно versioned само `terraform.tfvars.example`, док се стварни `terraform.tfvars` прави локално од стране оператора из тог template-а или се осјетљиве вриједности уносе преко environment variable-а. Разлог је једноставан: PROD `tfvars` носи environment-specific и често secret вриједности, па не смије бити нормалан git артефакт.

Кључна дисциплина:
- `terraform.tfvars` може бити осјетљив,
- не иде у git,
- за PROD посебно не гураш DB/Odoo лозинке у Terraform ако ће завршити у state-у,
- фајлови `terraform.tfstate` и `terraform.tfstate.backup` су локални state артефакти; у овом репоу их нпр. видиш у `infra/aws/odoo-dev-ec2-compose/terraform.tfstate` и `infra/aws/odoo-dev-ec2-compose/terraform.tfstate.backup`, и управо зато не треба да постану нормалан дио version control-а.
------------------------------------------------------------------------------------------------------------------

## 9) Структура директоријума: општа и KomITi конкретна

Кад први пут читаш Terraform репо, није довољно да знаш шта је `resource`; мораш знати и гдје шта живи.

Типична Terraform структура изгледа овако:
- root инфраструктурни директоријум: ту су главни `.tf` фајлови за један stack,
- `modules/`: reusable building blocks које више stack-ова може користити,
- `templates/`: user-data и други template-и који се render-ују у runtime-у,
- `scripts/`: helper оперативне скрипте око inventory/pause-resume/bootstrap рада,
- фајлови `README.md` / `RUNBOOK.md`: operator documentation,
- `.terraform/`: локални provider/cache артефакти после `init`,
- фајл `.terraform.lock.hcl`: lock за provider верзије,
- фајлови `terraform.tfvars` / `terraform.tfstate`: локални runtime/state фајлови који нису за commit.

У KomITi репоу конкретно имаш:
- `infra/`: top-level инфраструктурни слој,
- `infra/aws/`: AWS Terraform и AWS-specific documentation,
- фајл `infra/aws/CODEX_TERRAFORM.md`: policy/disciplina документ,
- `infra/aws/modules/`: мјесто за reusable Terraform module-е,
- `infra/aws/odoo-dev-ec2-compose/`: DEV stack root,
- `infra/aws/odoo-prod-ec2-compose/`: PROD stack root.

Унутар `infra/aws/odoo-dev-ec2-compose/` и `infra/aws/odoo-prod-ec2-compose/` типично имаш:
- фајлове `main.tf` и `versions.tf`: root Terraform setup,
- фајл `network.tf`: VPC/subnet/routing слој,
- фајл `security.tf`: security groups и security boundary,
- фајл `compute.tf`: EC2 host слој,
- фајл `locals.tf`: naming/tagging/helper composition,
- фајл `variables.tf`: конфигурабилни улази,
- фајл `outputs.tf`: operator-facing outputs после apply-а,
- директоријуме `templates/` и `scripts/`,
- фајл `README.md`: quick-start/operator overview,
- фајл `RUNBOOK.md`: day-2 ops контекст.

Практично, кад кажемо „Terraform код за DEV“, у овом репоу то најчешће значи: отвори `infra/aws/odoo-dev-ec2-compose/` и читај тај директоријум као један инфраструктурни систем.

Имај на уму да назив `odoo-dev-ec2-compose` већ носи 3 слоја у себи:
- `ec2` = AWS compute host,
- `compose` = Docker runtime orchestration на том host-у,
- Terraform `.tf` фајлови = опис инфраструктуре која тај host и његов boundary прави.
------------------------------------------------------------------------------------------------------------------

## 10) Plan није формалност

`terraform plan` није checkbox прије `apply`.

Његова сврха је да ти јасно покаже:
- шта ће бити креирано,
- шта ће бити измијењено,
- шта ће бити обрисано,
- да ли нека наизглед мала промјена има велик blast radius.

Професионално размишљање значи:
- прво читаш plan,
- онда процјењујеш impact,
- тек онда радиш `apply`.

Ако не умијеш прочитати Terraform plan, онда још ниси operationally safe за инфраструктурни рад.
------------------------------------------------------------------------------------------------------------------

## 11) Apply није deploy script

`terraform apply` не значи „пустио сам сервер и готово“.

Apply значи:
- Terraform је примијенио infrastructure промјену,
- state је ажуриран,
- cloud ресурсни слој је доведен ближе описаном стању.

Али то није исто што и:
- да је апликација functional,
- да је compose stack здрав,
- да је Odoo operational,
- да су day-2 ops кораци завршени.

У KomITi AWS контексту често иде овако:
1. Terraform подигне инфраструктурни skeleton.
2. Bootstrap/compose/runtime слој доведе апликацију у operational state.
3. Онда слиједи verification.

То је иста ментална дисциплина као код Odoo-а:
- infra code truth није исто што и runtime truth.
------------------------------------------------------------------------------------------------------------------

## 12) Како се AWS, Docker и Terraform вежу у један flow

Најкориснији foundations mental model за овај репо је овај редослијед:

1. Terraform дефинише AWS ресурсе.
2. AWS даје host, мрежу, security boundary и јавни endpoint.
3. На том host-у Docker/Compose покреће application сервисе.
4. Онда тек мјериш да ли је Odoo runtime стварно здрав.

Зато је важно да не мијешаш класе проблема:
- ако security group не пушта саобраћај, то није Docker bug,
- ако container не диже service, то није нужно Terraform bug,
- ако је Odoo up али functional flow не ради, то више није чист infra problem.

Ово је суштина infrastructure reasoning-а: исти incident може изгледати као „систем не ради“, али root cause може бити у сасвим другом слоју.
------------------------------------------------------------------------------------------------------------------

## 13) Шта Terraform код често значи у овом репоу

Кад читаш AWS Terraform директоријуме, размишљај овако:

- `network.tf` = networking topology
- `security.tf` = security boundary
- `compute.tf` = instance/runtime host
- `locals.tf` = naming/tagging/helper composition
- `variables.tf` = what is configurable
- `outputs.tf` = what the operator needs after apply
- `templates/*.tpl` = rendered bootstrap/user-data content

У KomITi-ју то није апстракција, него стварни layout који видиш под:
- `infra/aws/odoo-dev-ec2-compose/`
- `infra/aws/odoo-prod-ec2-compose/`

То је инфраструктурни еквивалент Odoo mental model-а:
- model -> resource
- field -> argument/attribute
- action/menu wiring -> dependency/reference wiring
- runtime upgrade -> plan/apply cycle
------------------------------------------------------------------------------------------------------------------

## 14) Dependency reasoning

Један од најбитнијих Terraform concepts је dependency graph.

Terraform мора знати:
- шта зависи од чега,
- којим редом ресурси настају,
- шта се смије уништити тек након чега,
- гдје reference значи implicit dependency.

Практично:
- EC2 може зависити од subnet-а и security group-а,
- route table association зависи од мреже,
- output често зависи од ресурса који је тек креиран.

Junior грешка је да гледа фајл по фајл, а не graph по graph.
------------------------------------------------------------------------------------------------------------------

## 15) Drift и ручне AWS промјене

Terraform рад постаје опасан кад људи ручно мијењају ресурсе у AWS console-у, а онда забораве да код/state то не одражавају.

То ствара drift:
- код каже једно,
- state памти друго,
- cloud runtime изгледа треће.

Зато је важно:
- не радити random ручне измјене у AWS-у,
- ако их радиш у incident ситуацији, документуј их,
- што прије врати ownership у код и state дисциплину,
- читај plan као drift detector, не само као apply prelude.
------------------------------------------------------------------------------------------------------------------

## 16) Secrets и risk thinking

Terraform почетник често види variable и помисли да је нормално убацити сваку лозинку у `tfvars`.

То није увијек прихватљиво.

Мораш мислити:
- да ли та вриједност завршава у state-у,
- да ли се state чува локално или remote,
- ко има приступ том state-у,
- да ли secret припада Terraform слоју или bootstrap/runtime слоју.

У KomITi контексту посебно је важно:
- DEV има нешто више tolerance за lab/runtime convenience,
- PROD има строжију secret discipline,
- није свака operational тајна добра Terraform тајна.
------------------------------------------------------------------------------------------------------------------

## 17) Minimal safe workflow у KomITi-ју

Кад радиш Terraform промјену, minimum safe редослијед је:

1. разуми шта ресурсно мијењаш,
2. провјери variables и environment context,
3. покрени `terraform init` ако треба,
4. покрени `terraform validate`,
5. покрени `terraform plan`,
6. прочитај impact,
7. тек онда покрени `terraform apply`,
8. провјери outputs и runtime,
9. документуј operational delta ако је битан.

То није бирократија; то је основна production discipline.
------------------------------------------------------------------------------------------------------------------

## 18) KomITi infra checklist

Кад завршиш овај документ, мораш моћи објаснити:
- шта AWS даје, а шта не даје,
- шта је image, а шта container,
- шта ради `docker compose`,
- шта је provider,
- шта је resource, а шта data source,
- зашто је state критичан,
- зашто `plan` читаш прије `apply`,
- зашто `terraform.tfvars` и state не иду у git,
- зашто infrastructure apply није исто што и application verification,
- како да читаш AWS Terraform фолдер као систем, а не као скуп случајних `.tf` фајлова,
- како да разликујеш AWS problem, Docker/runtime problem и Odoo functional problem.
------------------------------------------------------------------------------------------------------------------

## 19) Foundations practical drill

После овог документа уради бар ово:

1. Отвори `infra/aws/odoo-dev-ec2-compose`.
2. Пронађи `variables.tf`, `compute.tf`, `security.tf`, `outputs.tf`.
3. Објасни који `.tf` фајл дефинише host, који network boundary, а који operator outputs.
4. Објасни гдје у том stack-у престаје Terraform, а почиње Docker/runtime reasoning.
5. Објасни зашто `terraform plan` мора доћи прије `apply`.
6. Објасни зашто за PROD не желимо да DB/Odoo лозинке живе у Terraform state-у.
7. Објасни разлику између `infra/aws/CODEX_TERRAFORM.md` и root stack директоријума као што је `infra/aws/odoo-dev-ec2-compose/`.

Ако ово не можеш објаснити без нагађања, још ниси стварно усвојио infra foundations.

Овај infra drill није директно task имплементације модула, али је припрема да касније за `komiti_academy` разликујеш code problem, runtime problem и infra problem.
------------------------------------------------------------------------------------------------------------------

## 20) Local Terraform + Docker Desktop lab за кандидата

Ако кандидат нема AWS/Azure lab буџет, има смисла да први Terraform lab ради локално преко Docker Desktop-а.
Овај lab није дио core product scope-а модула `komiti_academy`, него learning/support exercise да кандидат локално подигне runtime на ком ће касније развијати и провјеравати Odoo модул.

Сврха овог lab-а није да глуми прави cloud deployment, него да кандидат практично увјежба:
- структуру Terraform пројекта,
- `variables.tf`, `outputs.tf`, `terraform.tfvars.example` и локални `terraform.tfvars`,
- separation између `dev` и `prod` варијанте stack-а,
- naming conventions,
- `plan` / `apply` / `destroy` циклус,
- идеју да Terraform доводи runtime skeleton у стање у ком Odoo може да се покрене.

Овај lab не учи стварни cloud networking, VM lifecycle и cloud security boundary. То мораш знати да не замијениш локални Docker lab са стварним AWS/Azure infra радом.
Добро је да овај lab гледаш као bridge: pattern-и око variables, outputs, naming-а и environment separation касније се могу пренијети на AWS/Azure Terraform рад, али ово није 1:1 cloud template.

Предложени lab нека живи у твом репоу `komiti_academy_ime_polaznika`, нпр. овако:
- `infra/local/odoo-dev-docker-desktop/`
- `infra/local/odoo-prod-docker-desktop/`

Унутар сваког од та два root директоријума candidate треба да има бар:
- `versions.tf`
- `main.tf`
- `variables.tf`
- `outputs.tf`
- `terraform.tfvars.example`
- локални `terraform.tfvars` који не иде у git

Минимални runtime који Terraform локално треба да подигне је:
- једна Docker network,
- један Postgres container,
- један Odoo container,
- volume за Postgres data,
- volume или mount reasoning за Odoo config/addons ако lab дође до те фазе,
- operator output који каже на ком URL-у Odoo треба да буде доступан.

Добар minimum viable lab је:
1. Terraform Docker provider локално управља Docker Desktop runtime-ом.
2. `main.tf` прави network, volume и оба container-а.
3. `variables.tf` носи назив окружења, порт, DB credentials за lab и naming prefix.
4. `outputs.tf` избацује URL типа `http://localhost:8069` и кључне називе ресурса.
5. `terraform.tfvars.example` постоји и за `dev` и за `prod`, тако да candidate види separation чак и кад оба stack-а живе локално.

Bootstrap idea у овом локалном lab-у не значи cloud-init на VM-у, него:
- Terraform прво доведе Docker ресурсе у жељено стање,
- онда Odoo container добије environment/config да може причати са Postgres-ом,
- па тек онда провјераваш да ли је runtime стварно up.

Minimum safe lab flow нека буде:
1. `terraform init`
2. `terraform validate`
3. `terraform plan -var-file=terraform.tfvars`
4. `terraform apply -var-file=terraform.tfvars`
5. `docker ps` и провјера да су Odoo и Postgres up
6. отварање Odoo URL-а из `output` вриједности
7. `terraform destroy -var-file=terraform.tfvars`

Ако candidate успјешно уради овај lab, онда је стварно увјежбао Terraform shape и lifecycle дисциплину, чак иако још није радио прави cloud provisioning.
------------------------------------------------------------------------------------------------------------------

## 21) Шта читаш даље

- `../infra/aws/CODEX_TERRAFORM.md`
- `../infra/aws/odoo-dev-ec2-compose/README.md`
- `../infra/aws/odoo-dev-ec2-compose/RUNBOOK.md`
- `../infra/aws/odoo-prod-ec2-compose/README.md`
- `../infra/aws/odoo-prod-ec2-compose/RUNBOOK.md`
------------------------------------------------------------------------------------------------------------------

## 99) Задатак на komiti_academy пројекту за кандидата

1. Напиши кратку infra/runtime дијагностичку биљешку за `komiti_academy`: шта би прво провјеравао ако модул не ради, а шта ако runtime уопште није здрав.
Референца: Ово је објашњено у поглављима `## 12) Како се AWS, Docker и Terraform вежу у један flow` и `## 19) Foundations practical drill`.
2. За `komiti_academy` попиши које runtime претпоставке морају бити истините прије стварне провјере да модул ради.
Референца: Ово је објашњено у поглављима `## 3) Docker и container основе које мораш знати`, `## 7) State је критична истина` и `## 17) Minimal safe workflow у KomITi-ју`.
3. Објасни на једном примјеру зашто container restart, module upgrade и стварна провјера захваћеног flow-а нису иста ствар.
Референца: Ово је објашњено у поглављима `## 3) Docker и container основе које мораш знати`, `## 12) Како се AWS, Docker и Terraform вежу у један flow` и `## 17) Minimal safe workflow у KomITi-ју`.
4. Осмисли и локално опиши Terraform lab у свом репоу `komiti_academy_ime_polaznika` који преко Docker Desktop-а подиже Postgres и Odoo stack за локални `dev` runtime, са јасном структуром фајлова, variables, outputs и јасним редослиједом рада.
Референца: Ово је објашњено у поглављима `## 8) Variables и \`terraform.tfvars\``, `## 9) Структура директоријума: општа и KomITi конкретна`, `## 10) Plan није формалност`, `## 17) Minimal safe workflow у KomITi-ју` и `## 20) Local Terraform + Docker Desktop lab за кандидата`.
------------------------------------------------------------------------------------------------------------------

## 99) Рјешења

1. За дијагностичку биљешку уради ово редом:
	1. У `## 12) Како се AWS, Docker и Terraform вежу у један flow` узми образац како раздвајаш infra слој од application слоја.
	2. Раздвоји двије ситуације: `модул не ради` и `runtime није здрав`.
	3. За сваку ситуацију запиши прве 2 до 3 провјере које би урадио, нпр. за `runtime није здрав`: `контейнери нису up`, `health endpoint не враћа 200`, `service restart није помогао`.
	4. Ако ти треба образац питања, узми га из `## 19) Foundations practical drill` и преведи у `komiti_academy` контекст.
2. За runtime претпоставке уради ово редом:
	1. Из `## 3) Docker и container основе које мораш знати` издвоји шта мора бити подигнуто и доступно.
	2. Из `## 7) State је критична истина` запиши које стање мора бити конзистентно прије тестирања.
	3. Из `## 17) Minimal safe workflow у KomITi-ју` препиши минимални редослијед провјера прије стварне провјере да модул ради.
	4. Сложи коначну листу runtime претпоставки у кратку checklist форму, нпр. `runtime up`, `health 200`, `исправна база`, `свјеж module upgrade`.
3. За разлику између restart-а, upgrade-а и провјере захваћеног flow-а уради ово редом:
	1. Из `## 3) Docker и container основе које мораш знати` издвоји шта значи restart runtime-а.
	2. Из `## 17) Minimal safe workflow у KomITi-ју` издвоји шта значи module upgrade.
	3. Затим запиши шта је стварна провјера захваћеног flow-а и по чему се разликује од претходна два корака.
	4. Формулиши један кратак примјер на `komiti_academy` модулу, нпр. `restart је само подигао сервис`, `upgrade је учитао XML и Python измјене`, `провјера је доказала да корисник може стварно проћи flow без грешке`.
4. За локални Terraform + Docker Desktop lab уради ово редом:
	1. У root-у свог локалног clone-а репоа `komiti_academy_ime_polaznika` осмисли `infra/local/odoo-dev-docker-desktop/` као root stack директоријум.
	2. Унутар њега планирај бар фајлове `versions.tf`, `main.tf`, `variables.tf`, `outputs.tf` и `terraform.tfvars.example`; као резултат треба да имаш јасан Terraform shape чак и прије писања свих детаља.
	3. У `variables.tf` предвиди бар `environment`, `project_name`, `odoo_port`, `postgres_db`, `postgres_user` и `postgres_password`, а у `outputs.tf` бар Odoo URL и називе кључних Docker ресурса.
	4. У `main.tf` планирај да Terraform подигне једну Docker network, Postgres volume, Postgres container и Odoo container; као резултат runtime треба да буде довољан да Odoo прича са базом локално.
	5. Кад skeleton буде спреман, у терминалу редом пусти `terraform init`, `terraform validate`, `terraform plan -var-file=terraform.tfvars` и `terraform apply -var-file=terraform.tfvars`; као резултат треба да добијеш Docker ресурсе и output са URL-ом типа `http://localhost:8069`.
	6. Потврди runtime са `docker ps`; као резултат треба да видиш бар Odoo и Postgres container у `Up` стању.
	7. На крају запиши шта овај lab учи, а шта не учи: учи Terraform structure/lifecycle и Docker runtime wiring за локални `komiti_academy` dev runtime, али не учи стварни cloud VM/network/security boundary и не мијења core product scope самог Odoo модула.
