# Odoo Learning Plan

This is an external learning plan based on the official Odoo documentation and the strongest community resources. It is not an AI tutorial, but a reading order of what you actually need to read and what you need to absorb from it.

Working rules:
- do not move to the next item until you have actually read and tried the previous one;
- for each page you must have at least one small practical exercise;
- if you cannot explain the topic in your own words, consider it not yet absorbed.
- if you want an item to appear checked in the web view, write a lowercase Latin `x` in the checkbox, i.e. `- [x]`, not other characters.

## Phases

- [ ] Phase: 0 -> Junior (8 weeks): The goal of this phase is for the person to stop being a "Python beginner looking at Odoo" and become someone who understands the basic module structure and can build a simple addon without anyone's help.
  - [ ] [Setup guide](https://www.odoo.com/documentation/19.0/developer/tutorials/setup_guide.html): how to do a source install, how to run `odoo-bin`, what `addons-path` is, how to enable developer mode and what a proper local environment for learning and development looks like.
  - [ ] [Server framework 101](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101.html): you get the main backend learning path and see how a single Odoo module is built step by step, from the initial skeleton to a functional application.
  - [ ] [Chapter 1: Architecture Overview](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/01_architecture.html): what the Odoo layers are, how the framework thinks and where model, view, data and security actually live.
  - [ ] [Chapter 2: A New Application](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/02_newapp.html): how to create a new Odoo application, what the basic module skeleton is and why `__manifest__.py` and `__init__.py` matter.
  - [ ] [Chapter 3: Models And Basic Fields](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/03_basicmodel.html): how to define a model, what the basic field types are and how to set up the first business structures in the ORM.
  - [ ] [Chapter 4: Security - A Brief Introduction](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/04_securityintro.html): the foundation of ACL thinking, who can see and modify what, and why security must not come only at the end.
  - [ ] [Chapter 5: Finally, Some UI To Play With](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/05_firstui.html): how a model gets its first UI and how Odoo transitions from the Python layer into a usable form.
  - [ ] [Chapter 6: Basic Views](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/06_basicviews.html): the foundation of tree, form and search views, and how XML determines what the user actually sees.
  - [ ] [Chapter 7: Relations Between Models](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/07_relations.html): how to use `Many2one`, `One2many` and `Many2many`, and how models are linked into a single real business flow.
  - [ ] [Chapter 8: Computed Fields And Onchanges](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/08_compute_onchange.html): the difference between a derived value and a UI helper logic, and when to use `compute` vs `onchange`.
  - [ ] [Chapter 9: Ready For Some Action?](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/09_actions.html): how to connect action, menu and view mode so that the user can actually enter the functionality you built.
  - [ ] [Chapter 10: Constraints](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/10_constraints.html): how to write server-side rules and why business validation must not remain only at the form level.
  - [ ] [Chapter 11: Add The Sprinkles](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/11_sprinkles.html): how to polish a module and add additional elements that make it more usable and closer to a real application.
  - [ ] [Chapter 12: Inheritance](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/12_inheritance.html): how to extend existing models and views without breaking upstream logic.
  - [ ] [Chapter 13: Interact With Other Modules](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/13_other_module.html): how dependencies between modules actually work and how one module safely enters another's domain.
  - [ ] [Chapter 14: A Brief History Of QWeb](https://www.odoo.com/documentation/19.0/developer/tutorials/server_framework_101/14_qwebintro.html): what QWeb is, why it exists and where you will encounter it even if your main focus is backend.
  - [ ] [Define module data](https://www.odoo.com/documentation/19.0/developer/tutorials/define_module_data.html): the difference between master and demo data, how data files are declared in the manifest and how XML/CSV enter the module.
  - [ ] [Restrict access to data](https://www.odoo.com/documentation/19.0/developer/tutorials/restrict_data_access.html): groups, access rights, record rules, `sudo`, explicit security checks and why the security model is broader than a single `ir.model.access.csv` file.
  - [ ] [Safeguard your code with unit tests](https://www.odoo.com/documentation/19.0/developer/tutorials/unit_tests.html): how to run tests, what the `tests/` structure looks like and how to write the first serious Odoo unit test.

- [ ] Phase: Junior -> Independent Developer (10 weeks): The goal of this phase is for someone to no longer just build a "demo module", but to be able to enter existing code, understand it, modify it without breaking the system and deliver the change professionally.
  - [ ] [Reference](https://www.odoo.com/documentation/19.0/developer/reference.html): you learn to use the official reference documentation as a working tool, not as passive reading.
  - [ ] [ORM API](https://www.odoo.com/documentation/19.0/developer/reference/backend/orm.html): deeper understanding of models, fields, recordsets, environment, decorators and common ORM methods you use every day.
  - [ ] [Data Files](https://www.odoo.com/documentation/19.0/developer/reference/backend/data.html): how XML and CSV data files work, what loading order is and how the data layer is maintained without chaos.
  - [ ] [Window Actions ( ir.actions.act_window )](https://www.odoo.com/documentation/19.0/developer/reference/backend/actions.html): how to professionally configure the action layer and how view/action/context wiring actually works.
  - [ ] [Manifest](https://www.odoo.com/documentation/19.0/developer/reference/backend/module.html): everything you need to know about `__manifest__.py`, dependencies, `data`, `demo`, `application` and module structure.
  - [ ] [Access Rights](https://www.odoo.com/documentation/19.0/developer/reference/backend/security.html): exact rules for the ACL layer and how group-based access is modeled in a production manner.
  - [ ] [Record Rules](https://www.odoo.com/documentation/19.0/developer/reference/backend/security.html): how to write access rules per record and how domain becomes a security mechanism.
  - [ ] [Field Access](https://www.odoo.com/documentation/19.0/developer/reference/backend/security.html): how restrictions can be set at the field level, not only at the model or view level.
  - [ ] [Security Pitfalls](https://www.odoo.com/documentation/19.0/developer/reference/backend/security.html): the most common mistakes developers make when they think something is secure but it actually is not.
  - [ ] [Command-line interface (CLI)](https://www.odoo.com/documentation/19.0/developer/reference/cli.html): how to use `-i`, `-u`, testing options, shell and other CLI commands that are a real part of everyday work.
  - [ ] [View records](https://www.odoo.com/documentation/19.0/developer/reference/user_interface/view_records.html): how view records are organized and how to read the existing UI layer in someone else's module.
  - [ ] [View architectures](https://www.odoo.com/documentation/19.0/developer/reference/user_interface/view_architectures.html): form, list, search, kanban, calendar, gantt and other architectures you must know when entering an existing module.
  - [ ] [Testing Python code](https://www.odoo.com/documentation/19.0/developer/reference/backend/testing.html): what the official Odoo testing model looks like and how to think about behavior verification, not just a single green test run.
  - [ ] [Integration Testing](https://www.odoo.com/documentation/19.0/developer/reference/backend/testing.html): how to test the entirety of a flow, not just an individual function or helper method.
  - [ ] [Profiling](https://www.odoo.com/documentation/19.0/developer/reference/backend/performance.html): how to spot slow code and start thinking about performance before the system becomes hard to maintain.
  - [ ] [Good practices](https://www.odoo.com/documentation/19.0/developer/reference/backend/performance.html): which performance and backend habits separate a solid module from one that is slow and fragile.
  - [ ] [How-to guides](https://www.odoo.com/documentation/19.0/developer/howtos.html): this is the transition from "I know the basics" to "I know how to solve real tasks by topic".
  - [ ] [Multi-company Guidelines](https://www.odoo.com/documentation/19.0/developer/howtos/company.html): how to think about company isolation, company-dependent fields and multi-company rules without accidentally breaching access.
  - [ ] [Create customized reports](https://www.odoo.com/documentation/19.0/developer/howtos/create_reports.html): how to build real reports and how the SQL/ORM/report layer enters professional Odoo work.
  - [ ] [Translating Modules](https://www.odoo.com/documentation/19.0/developer/howtos/translations.html): how to prepare a module for translation and why localization is not an afterthought cosmetic step.
  - [ ] [Upgrade a customized database](https://www.odoo.com/documentation/19.0/developer/howtos/upgrade_custom_db.html): how to think about upgrading a custom database and why custom code is not finished if it is not upgrade-safe.
  - [ ] [Odoo Community Association](https://odoo-community.org/): you meet the most important Odoo open-source community and understand where production-grade community patterns live.
  - [ ] [Odoo Community Association on GitHub](https://github.com/OCA): you learn to read real OCA repositories, addon structure, review style and conventions that professionals use.

- [ ] Phase: Independent Developer -> Pro Odoo Developer (12 weeks): The goal of this phase is for the developer to not only know how to build a module, but to know how to do frontend, integration, testing, upgrade, community-style code reading and deliver a change at a professional level.
  - [ ] [Discover the web framework](https://www.odoo.com/documentation/19.0/developer/tutorials/discover_js_framework.html): entry into the Odoo frontend world and the first serious picture of Owl, dashboards and web client architecture.
  - [ ] [Chapter 1: Owl components](https://www.odoo.com/documentation/19.0/developer/tutorials/discover_js_framework/01_owl_components.html): how Owl components are built and used, what component-based thinking is and how the Odoo frontend actually lives.
  - [ ] [Chapter 2: Build a dashboard](https://www.odoo.com/documentation/19.0/developer/tutorials/discover_js_framework/02_build_a_dashboard.html): how multiple frontend building blocks are combined into a single usable UI.
  - [ ] [Master the web framework](https://www.odoo.com/documentation/19.0/developer/tutorials/master_odoo_web_framework.html): a deeper frontend resource for transitioning from basic Owl knowledge to actual frontend specialization in Odoo.
  - [ ] [Framework Overview](https://www.odoo.com/documentation/19.0/developer/reference/frontend/framework_overview.html): how the web client is organized, what the main building blocks are and how the frontend architecture actually works.
  - [ ] [Assets](https://www.odoo.com/documentation/19.0/developer/reference/frontend/assets.html): how asset bundles work, lazy loading and why a frontend bug is often not just "the JS code is fine".
  - [ ] [Odoo Module System](https://www.odoo.com/documentation/19.0/developer/reference/frontend/javascript_modules.html): how JavaScript modules are organized and how frontend code enters the Odoo framework.
  - [ ] [Owl components](https://www.odoo.com/documentation/19.0/developer/reference/frontend/owl_components.html): the official reference for components, best practices and boundaries of the Owl layer.
  - [ ] [Registries](https://www.odoo.com/documentation/19.0/developer/reference/frontend/registries.html): how the Odoo web client registers new fields, view types and other frontend extension points.
  - [ ] [Services](https://www.odoo.com/documentation/19.0/developer/reference/frontend/services.html): how frontend services are written and used, and how state/behavior living outside components works in practice.
  - [ ] [Hooks](https://www.odoo.com/documentation/19.0/developer/reference/frontend/hooks.html): how hooks are used in the Odoo/Owl frontend and how to avoid ad hoc frontend code.
  - [ ] [Patching code](https://www.odoo.com/documentation/19.0/developer/reference/frontend/patching_code.html): how patching is done in the Odoo frontend and why it is powerful but dangerous if used without discipline.
  - [ ] [QWeb Templates](https://www.odoo.com/documentation/19.0/developer/reference/frontend/qweb.html): deeper understanding of the template layer, output, conditionals, loops and the link between backend and frontend rendering.
  - [ ] [JavaScript Unit Testing](https://www.odoo.com/documentation/19.0/developer/reference/frontend/unit_testing.html): how to test frontend logic, not just the Python backend.
  - [ ] [Customize a field](https://www.odoo.com/documentation/19.0/developer/howtos/javascript_field.html): how to modify an existing field component in the web framework without blind patching.
  - [ ] [Customize a view type](https://www.odoo.com/documentation/19.0/developer/howtos/javascript_view.html): how to build a custom view type at the framework level, which is important if you want advanced UI work.
  - [ ] [Create a client action](https://www.odoo.com/documentation/19.0/developer/howtos/javascript_client_action.html): how to build a more serious custom frontend entry point inside the Odoo web client.
  - [ ] [Create a standalone Owl application](https://www.odoo.com/documentation/19.0/developer/howtos/standalone_owl_application.html): how Owl is used outside the classic web client frame as well.
  - [ ] [Use Owl components on the portal and website](https://www.odoo.com/documentation/19.0/developer/howtos/frontend_owl_components.html): how to transfer your frontend Odoo knowledge to the portal/website layer.
  - [ ] [Website themes](https://www.odoo.com/documentation/19.0/developer/howtos/website_themes.html): how website customization is done in a disciplined manner, not just with ad hoc CSS/XML changes.
  - [ ] [Web Services](https://www.odoo.com/documentation/19.0/developer/reference/external_api.html): how Odoo communicates externally and how to think about integrations and API boundaries.
  - [ ] [Write lean easy-to-maintain CSS](https://www.odoo.com/documentation/19.0/developer/howtos/scss.html): how to prevent frontend customization from becoming technical debt after a few iterations.
  - [ ] [OpenUpgrade](https://github.com/OCA/OpenUpgrade): getting acquainted with the open-source upgrade ecosystem and migration thinking that is important for the pro level.
  - [ ] [maintainer-tools](https://github.com/OCA/maintainer-tools): insight into maintainer discipline, conventions and the review standard that the community uses for serious Odoo code.

## Minimum requirements for transitioning between phases

- you do not leave the `0 -> Junior` phase until you have built one small module from scratch;
