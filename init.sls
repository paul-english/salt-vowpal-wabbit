vw_deps:
  pkg.installed:
    - name: libboost-program-options-dev
    
vw_repo:
  git.latest:
    - name: https://github.com/JohnLangford/vowpal_wabbit.git
    - target: /usr/src/vowpal_wabbit
    - rev: master
    - require:
      - pkg: vw_deps

vw_make:
  cmd.run:
    - cwd: /usr/src/vowpal_wabbit
    - name: make
    - require:
      - git: vw_repo
    
ln -s /usr/src/vowpal_wabbit/vowpalwabbit/vw /usr/bin/vw:
  cmd:
    - run
    - require:
      - cmd: vw_make
    - unless: ls /usr/bin/vw
  
ln -s /usr/src/vowpal_wabbit/vowpalwabbit/active_interactor /usr/bin/active_interactor:
  cmd:
    - run
    - require:
      - cmd: vw_make
    - unless: ls /usr/bin/active_interactor
  
ln -s /usr/src/vowpal_wabbit/cluster/single_machine /usr/bin/single_machine:
  cmd:
    - run
    - require:
      - cmd: vw_make
    - unless: ls /usr/bin/single_machine
  
ln -s /usr/src/vowpal_wabbit/cluster/spanning_tree /usr/bin/spanning_tree:
  cmd:
    - run
    - require:
      - cmd: vw_make
    - unless: ls /usr/bin/spanning_tree
  
ln -s /usr/src/vowpal_wabbit/utl/vw-convergence /usr/bin/vw-convergence:
  cmd:
    - run
    - require:
      - cmd: vw_make
    - unless: ls /usr/bin/vw-convergence
  
ln -s /usr/src/vowpal_wabbit/utl/vw-regr /usr/bin/vw-regr:
  cmd:
    - run
    - require:
      - cmd: vw_make
    - unless: ls /usr/bin/vw-regr
  
ln -s /usr/src/vowpal_wabbit/utl/vw-varinfo /usr/bin/vw-varinfo:
  cmd:
    - run
    - require:
      - cmd: vw_make
    - unless: ls /usr/bin/vw-varinfo
  
ln -s /usr/src/vowpal_wabbit/utl/vw2csv /usr/bin/vw2csv:
  cmd:
    - run
    - require:
      - cmd: vw_make
    - unless: ls /usr/bin/vw2csv
  