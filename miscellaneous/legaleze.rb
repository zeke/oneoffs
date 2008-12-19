# I saw a ridiculously worded sign today and wanted to see if random reorderings of its words would make about as much sense..

phrase = "unauthorized vehicles parked in designated accessible spaces not displaying distinguishing placards or license plates issued for persons with diablities may be towed away at owners expense towed vehicles may be reclaimed at 311 dollar fine or by telephoning 897-2300"

10.times do
  puts phrase.split(" ").sort_by{rand}.join(" ") + "\n\n"
end

# Sample results..
=begin
plates designated diablities telephoning be persons with not accessible unauthorized for at may distinguishing at towed displaying $311 towed parked in reclaimed expense may or away vehicles spaces by be owners or placards fine issued vehicles 8972300 license

displaying in plates placards designated unauthorized at issued distinguishing by vehicles parked telephoning persons $311 towed expense not accessible away or vehicles license 8972300 with may be or owners at fine may spaces reclaimed be diablities towed for

designated with in telephoning not placards plates be distinguishing for by may at persons away vehicles accessible or issued at unauthorized 8972300 $311 or spaces be parked may expense owners towed displaying reclaimed diablities towed license fine vehicles

not expense $311 placards in distinguishing reclaimed be for parked designated 8972300 at at telephoning with may or owners vehicles accessible towed diablities displaying license spaces unauthorized or be persons away by fine issued vehicles may plates towed

persons may or may in unauthorized with vehicles accessible spaces away designated 8972300 owners by placards be diablities fine license reclaimed distinguishing expense at vehicles parked not issued or at towed be $311 for telephoning towed plates displaying

may reclaimed license for not vehicles placards or plates in be vehicles towed telephoning persons or expense may parked spaces with at unauthorized diablities distinguishing designated fine $311 be issued owners 8972300 by displaying accessible at away towed

vehicles accessible at spaces reclaimed for persons be towed parked owners away placards diablities telephoning be in license by $311 fine displaying at distinguishing expense or issued 8972300 unauthorized or designated towed may vehicles may not plates with

placards displaying with be be owners not or plates diablities vehicles 8972300 persons at in away unauthorized license may fine distinguishing towed towed issued by or reclaimed expense for at $311 vehicles accessible telephoning parked spaces designated may

parked accessible not diablities or license may placards $311 for be displaying towed by vehicles spaces unauthorized at designated towed telephoning in may fine 8972300 be owners with distinguishing persons at plates reclaimed expense issued vehicles or away

expense 8972300 persons distinguishing may issued license reclaimed fine vehicles or be towed telephoning at parked $311 may be unauthorized by towed not for with away vehicles diablities placards accessible in plates or at spaces owners displaying designated
=end