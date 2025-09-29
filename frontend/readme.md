# Trouvez une solution pour que l'image docker reste la même pour les 3 environnements mais que la bonne API soit contactée en fonction de l'environnement d'exécution. Des solutions très différentes sont possible pour cette partie, à vous d'être imaginatif. Deux pistes vous sont proposées mais vous pouvez en choisir d'autres 




après plusieurs essais j'ai réussi

ce que j'ai fait :

premier test était de faire un constants.template.tsx, de mettre __ENV__ pour qu'il soit édité avec sed puis repassé en constants.tsx avec les bons env. ça avait pas l'air de fonctionner (au début j'ai fait ça après la compilation déjà mdr donc logique), puis j'ai refait avant de compiler et pas de résultat, j'avais toujours mon __ENV__. donc option numéro deux : faire un config.template.json (grosso modo la même chose sauf que config lui va pas bouger donc c’est good, pas de problème de compilation etc). j'ai mon config.template.json, je fais un sed __ENV__ avec la vraie variable env que je donne dans mon docker-compose, puis j'ai modifié mon constants. au début des erreurs car j'appelle mes constants avant qu'ils soient init donc problème, puis j'ai édité mon main pour faire en sorte de charger mes constants avant d'afficher mon app, comme ça j'ai plus de problème et ça fonctionne nickel.

et aussi je suis passé de static web sever a nginx car je ne pouvais pas lancer mon .sh 