:- discontiguous 
    male/1, female/1, 
    married/2, husband/2, wife/2, 
    parent/2, father/2,  mother/2, child/2, son/2, daughter/2,
    sibling/2, brother/2, sister/2,
    grandparent/2, grandfather/2, grandmother/2,
    grandchild/2, grandson/2, granddaughter/2,
    auntOrUncle/2, uncle/2, aunt/2.

% rules
married(Husband, Wife) :- Husband @< Wife, married(Wife, Husband). % супруги
husband(Husband, Wife) :- male(Husband), married(Husband, Wife). % муж
wife(Wife, Husband) :- female(Wife), married(Wife, Husband). % жена

father(Father, Child) :- male(Father), parent(Father, Child). % отец
mother(Mother, Child) :- female(Mother), parent(Mother, Child). % мать
child(Child, Parent) :- parent(Parent, Child). % ребёнок
son(Child, Parent) :- male(Child), child(Child, Parent). % сын
daughter(Child, Parent) :- female(Child), child(Child, Parent). % дочь

sibling(Child1, Child2) :-  parent(X,Child1),parent(X,Child2),Child1\=Child2. % брат или сестра
brother(Brother, Child) :- male(Brother), sibling(Brother, Child). % брат
sister(Sister, Child) :- female(Sister), sibling(Sister, Child). % сестра

grandparent(Grandp, Child) :- parent(Grandp, Parent),  parent(Parent, Child). % прародители
grandfather(Grandf, Child) :- male(Grandf), grandparent(Grandf, Child). % дедушка 
grandmother(Grandm, Child) :- female(Grandm), grandparent(Grandm, Child). % бабушка
grandchild(Child, Grandp) :- grandparent(Grandp, Child). % внук или внучка
grandson(Child, Grandp) :- male(Child), grandchild(Child, Grandp). % внук
granddaughter(Child, Grandp) :- female(Child), grandchild(Child, Grandp). % внучка

auntOrUncle(ParentSibling1, Child) :- sibling(ParentSibling1, ParentSibling2), parent(ParentSibling2, Child). % дядя или тётя
uncle(Uncle, Child) :- male(Uncle), auntoruncle(Uncle, Child). % дядя
aunt(Aunt, Child) :- female(Aunt), auntoruncle(Aunt, Child). % тётя


% facts
female('Otsutsuki Kaguya').

%-------------------------------------------------
male('Otsutsuki Hagaromo').
parent('Otsutsuki Kaguya', 'Otsutsuki Hagaromo').

male('Otsutsuki Hamura').
parent('Otsutsuki Kaguya', 'Otsutsuki Hamura').

male('Kaguyas Will').
parent('Otsutsuki Kaguya', 'Kaguyas Will').

%-------------------------------------------------
male('Indra').
parent('Otsutsuki Hagaromo', 'Indra').

male('Asura').
parent('Otsutsuki Hagaromo', 'Asura').

%-------------------------------------------------
male('Kaguya Kimimaro').
grandparent('Otsutsuki Kaguya', 'Kaguya Kimimaro').

%-------------------------------------------------
male('Elder Hyuga').
grandparent('Otsutsuki Hamura', 'Elder Hyuga').

male('Otsutsuki Toneri').
grandparent('Otsutsuki Hamura', 'Otsutsuki Toneri').


% Uchiha tree
%-------------------------------------------------
male('Uchiha Tajima').
parent('Indra', 'Uchiha Tajima').

%-------------------------------------------------
male('Uchiha Madara').
parent('Uchiha Tajima', 'Uchiha Madara').

male('Uchiha Izuna').
parent('Uchiha Izuna', 'Uchiha Madara').

%-------------------------------------------------
male('Uchiha Kagami').
grandparent('Indra', 'Uchiha Kagami').

male('Uchiha Shishui').
parent('Uchiha Kagami', 'Uchiha Shishui').

%-------------------------------------------------
male('Uchiha Obito').
grandparent('Indra', 'Uchiha Obito').

%-------------------------------------------------
male('Uchiha Fugaku').
grandparent('Indra', 'Uchiha Fugaku').

female('Uchiha Mikoto').

married('Uchiha Fugaku', 'Uchiha Mikoto').

%-------------------------------------------------
male('Uchiha Itachi').
parent('Uchiha Fugaku', 'Uchiha Itachi').
parent('Uchiha Mikoto', 'Uchiha Itachi').

male('Uchiha Sasuke').
parent('Uchiha Fugaku', 'Uchiha Sasuke').
parent('Uchiha Mikoto', 'Uchiha Sasuke').

female('Haruno Sakura').

married('Uchiha Sasuke', 'Haruno Sakura').

%-------------------------------------------------
female('Uchiha Sarada').
parent('Uchiha Sasuke', 'Uchiha Sarada').
parent('Haruno Sakura', 'Uchiha Sarada').


% Uzumaki & Senju tree
%-------------------------------------------------
male('Senju Butsuma').
grandparent('Asura', 'Senju Butsuma').

male('Uzumaki Ashina').
grandparent('Asura', 'Uzumaki Ashina').

%-------------------------------------------------
male('Senju Itama').
parent('Senju Butsuma', 'Senju Itama').

male('Senju Tobirama').
parent('Senju Butsuma', 'Senju Tobirama').

male('Senju Hashirama').
parent('Senju Butsuma', 'Senju Hashirama').

female('Uzumaki Mito').
parent('Uzumaki Ashina', 'Uzumaki Mito').

married('Senju Hashirama', 'Uzumaki Mito').

%-------------------------------------------------
female('Tsunade').
parent('Senju Hashirama', 'Tsunade').
parent('Uzumaki Mito', 'Tsunade').

male('Nawaki').
parent('Senju Hashirama', 'Nawaki').
parent('Uzumaki Mito', 'Nawaki').

%-------------------------------------------------
female('Uzumaki Fuso').
grandparent('Asura', 'Uzumaki Fuso').

male('Ise').

married('Ise', 'Uzumaki Fuso').

female('Uzumaki Karin').
grandparent('Asura', 'Uzumaki Karin').

female('Uzumaki Kushina').
grandparent('Asura', 'Uzumaki Kushina').

male('Namikaze Minato').

married('Namikaze Minato', 'Uzumaki Kushina').

%-------------------------------------------------
male('Uzumaki Nagato').
parent('Ise', 'Uzumaki Nagato').
parent('Uzumaki Fuso', 'Uzumaki Nagato').


% Hyuga & Uzumaki tree
%-------------------------------------------------
male('Hyuga Haishi').
parent('Elder Hyuga', 'Hyuga Haishi').

male('Hyuga Hizashi').
parent('Elder Hyuga', 'Hyuga Hizashi').

%-------------------------------------------------
male('Hyuga Neji').
parent('Hyuga Hizashi', 'Hyuga Neji').

female('Hyuga Hanabi').
parent('Hyuga Haishi', 'Hyuga Hanabi').

female('Hyuga Hinata').
parent('Hyuga Haishi', 'Hyuga Hinata').

male('Uzumaki Naruto').
parent('Namikaze Minato', 'Uzumaki Naruto').
parent('Uzumaki Kushina', 'Uzumaki Naruto').

married('Uzumaki Naruto', 'Hyuga Hinata').

%-------------------------------------------------
male('Uzumaki Boruto').
parent('Uzumaki Naruto', 'Uzumaki Boruto').
parent('Hyuga Hinata', 'Uzumaki Boruto').

female('Uzumaki Himawari').
parent('Uzumaki Naruto', 'Uzumaki Himawari').
parent('Hyuga Hinata', 'Uzumaki Himawari').








