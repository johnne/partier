#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

rnames <- c("1. Klimatskadliga subventioner","2. Avståndsbaserat reseavdrag","3. Flygets miljökostnader",
              "4. Fossila investeringar via exportkrediter","5. Konsumtionens klimatpåverkan",
              "6. Klimathandlingsplaner","7. Skydd av värdefulla skogar","8. Översyn av skogspolitiken",
              "9. Mineralutvinning i skyddad natur","10. Ekologiskt jordbruk","11. Miljöavgift på växtskyddsmedel",
              "12. Miljöersättning till betesmarker","13. Stärkt marint skydd","14. Förbud mot bottentrålning",
              "15. Återvinning av plast","16. Information om varors kemikalieinnehåll",
              "17. Ägardirektiv till statliga bolag","18. Stärkande av miljöbalken")
cnames <- c("V","Mp","S","L","C","M","Kd","Sd")

read_answers <- function(f="svar.tsv"){
  answers <- read.table(f, sep="\t", header=TRUE, encoding = "utf-8", row.names=1)
  return(answers)
}

details <- function() {
  summaries <- c("Sverige subventionerar i dag klimatskadlig verksamhet med minst 30 miljarder kronor om året. Nästan hälften rör användning av fossila bränslen.",
                 "Reseavdraget används i dag mestadels till bilpendling i stortsadsregioner och det sker mycket fusk. Reseavdraget behöver ändras för att ge bättre miljöeffekt.",
                 "Flyget släpper ut stora mängder växthusgaser. I år har det införts en flygskatt, men ännu bär flyget långt ifrån sina fulla miljökostnader.",
                 "Exportkrediter är en av de största källorna av offentliga medel som går till fossila investeringar globalt. Det är inte hållbart om vi ska leva upp till Parisavtalet.",
                 "Dagens klimatmål omfattar bara utsläpp som sker inom Sveriges gränser. Men en stor del av det vi konsumerar produceras utomlands eller består av utrikes flygresor.",
                 "Sverige ska minska utsläppen med 85 procent till 2045 jämfört med 1990. För att nå målet krävs minskningar på minst 6 procent per år.",
                 "För att skydda värdefulla skogar och klara Sveriges internationella åtaganden samt riksdagens miljömål behövs ökade anslag till skydd av värdefull natur",
                 "Dagens skogspolitik utformades på 1990-talet. Det är nu hög tid att den ses över och att skogsvårdslagstiftningen moderniseras för att anpassas till dagens verklighet.",
                 "En gruva eller ett kalkbrott innebär stor negativ påverkan på den biologiska mångfalden och andra naturvärden. I dag saknas generellt förbud mot prospektering i naturskyddade områden.",
                 "Ekologiskt jordbruk bidrar till ökad biologisk mångfald, ökad djurvälfärd, större lönsamhet och användning av mindre bekämpningsmedel.",
                 "I dag finns en skatt på bekämpningsmedel som i stort sett är verkningslös. En differentierad skatt som baserad på medlens giftighet skulle ha en större miljöstyrande effekt.",
                 "Betesmarker är rika på biologisk mångfald, men hotas i dag av igenväxning. Det måste bli lönsamt för lantbrukare att bibehålla och restaurera dessa ytor.",
                 "Marina skyddsområden har i realiteten svagt skydd och de behöver även utökas.",
                 "Bottentrålning medför stora bifångster och leder till att många bottenlevande djur dör och att deras livsmiljö förstörs",
                 "Målet för materialåtervinning av plast är lägre än för övriga förpackningar. Dagens mål för plast är 30 procent jämfört med 70 procent för många andra material.",
                 "Material med farligt innehåll ska kunna sorteras bort och förstöras vid materialåtervinning. För att det ska vara möjligt krävs information om varors kemikalieinnehåll.",
                 "De statliga bolagen kan spela en nyckelroll i den omställning som samhället behöver genomgå för att nå uppsatta miljöoch hållbarhetsmål.",
                 "Miljöbalken är ett viktigt verktyg för att uppnå antagna miljö- och hållbarhetsmål. Lagstiftningen måste vässas och tydliggöra att miljökraven gäller för fler verksamheter. "
                 )
  suggestions <- c("Fatta beslut under mandatperioden om att fasa ut merparten av skatteundantagen för användning av fossila bränslen.",
                   "Ändra reseavdraget så att det enbart utgår från avstånd och blir samma oavsett val av färdmedel",
                   "Fatta beslut som gör att flyget betalar mer av sina miljökostnader.",
                   "Inför restriktioner som gör att svenska exportkreditorgan inte får utfärda lån och garantier till fossila projekt",
                   "Inför ett kompletterande klimatmål och styrmedel för att minska de konsumtionsbaserade utsläppen av växthusgaser.",
                   "Ta fram och arbeta för genomförandet av en klimathandlingsplan som minskar utsläppen i Sverige med minst 6 procent per år.",
                   "Öka anslaget till skydd av värdefull natur för att kunna skydda fler skogar.",
                   "Gör en översyn av skogspolitiken för att underlätta att nå miljökvalitetsmålen och säkerställa ett hållbart nyttjande av skogen",
                   "Inför ett förbud mot mineralutvinning och prospektering i alla skyddade områden.",
                   "Sträva efter att uppnå en blocköverskridande överenskommelse med konkreta åtgärder för att främja svensk ekologisk produktion.",
                   "Inför en skatt som blir högre ju farligare ett växtskyddsmedel är och använd medlen för utveckling av alternativa bekämpningsmetoder.",
                   "Höj miljöersättningarna till lantbrukare som låter beta sina betesmarker.",
                   "Fatta beslut om att stärka skyddet i Sveriges marina skyddade områden och att öka andelen marina skyddade områden till minst 20 procent.",
                   "Verka för att bottentrålning förbjuds inom hela EU.",
                   "Öka målet för materialåtervinning av plast till 70 procent.",
                   "Sverige ska driva på, inom EU och globalt, för att information om varors kemikalieinnehåll ska vara lättillgänglig från produktions- till avfallsledet.",
                   "Skärp de statliga bolagens ägardirektiv så att de får ett tydligare uppdrag att verka för att nå miljömålen.",
                   "Utred möjligheten att lyfta in fler regelverk som reglerar miljö- och naturresursutnyttjande i miljöbalken"
                   )
  dt <- cbind(summaries, suggestions)
  rownames(dt) <- seq(1,nrow(dt))
  return(dt)
}

read_numeric <- function(f="svar_numeric.tsv") {
  n <- read.table(f, header=T, row.names = 1, sep="\t")
  return(n)
}

library(shiny)
library(DT)
options(DT.options = list(selection = "single", pageLength = 20, searching = FALSE, paging = FALSE))
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Partiernas miljölöften"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         tagList(
           tags$h4("Bakgrund"),
           "Inför riksdagsvalen presenterar Naturskyddsföreningen miljöpolitiska förslag och granskar riksdagspartiernas miljöambitioner.",
           "Här kan du se svaren från den ",a("miljöpolitiska enkät",href="https://www.naturskyddsforeningen.se/val2018/sa-mycket-lovar-partierna-for-miljon"),"som skickades ut till partierna inför valet i september 2018. Enkäten innehöll 18 politiska förslag och här visas stödet i riksdagen för dessa förslag baserat på mandatfördelningen efter det senaste valet.",
           tags$br(),
           tags$h4("Information"),
           "I rullmenyn nedan kan du välja bland de olika förslagen för att se mer information"
         ),
         selectInput("suggestions", label = "",
                     choices = c("1. Klimatskadliga subventioner","2. Avståndsbaserat reseavdrag","3. Flygets miljökostnader","4. Fossila investeringar via exportkrediter","5. Konsumtionens klimatpåverkan","6. Klimathandlingsplaner","7. Skydd av värdefulla skogar","8. Översyn av skogspolitiken","9. Mineralutvinning i skyddad natur","10. Ekologiskt jordbruk","11. Miljöavgift på växtskyddsmedel","12. Miljöersättning till betesmarker","13. Stärkt marint skydd","14. Förbud mot bottentrålning","15. Återvinning av plast","16. Information om varors kemikalieinnehåll","17. Ägardirektiv till statliga bolag","18. Stärkande av miljöbalken")),
         uiOutput("suggestion_info"),
         #tags$br(),
         tagList(
           tags$h4("Påverka"),
           "Genom att kryssa i de olika partierna kan du se hur stödet för förslagen förändras om de ikryssade partierna skulle ställa sig bakom samtliga förslag.",
           "V och Mp är förkryssade eftersom de svarade Ja på samtliga förslag."
         ),
         checkboxGroupInput("party_answers", label="Påverka partier", choices=c("V","Mp","S","L","C","M","Kd","Sd"), 
                            inline = TRUE, selected = c("V","Mp")),
         radioButtons("table_type", label="Tabelltyp", choices = c("Mandatfördelning", "Partiernas svar"), inline = TRUE)
      ),
      
      mainPanel(
        tabsetPanel(
          tabPanel(title="Tabell", 
                   DT::dataTableOutput("mandat")
          ),
          tabPanel(title = "Kontakta riksdagen",
                   tagList(
                     tags$h4("Maila riksdagen"),
                     "Här nedan hittar du alla mailadresser till riksdagens ledamöter. Klicka tre gånger i en ruta för att välja alla adresser."
                   ),
                   tags$h5("Alla ledamöter"),
                   verbatimTextOutput("all"),
                   tags$h5("Centerpartiet"),
                   verbatimTextOutput("C"),
                   tags$h5("Kristdemokraterna"),
                   verbatimTextOutput("Kd"),
                   tags$h5("Liberalerna"),
                   verbatimTextOutput("L"),
                   tags$h5("Moderaterna"),
                   verbatimTextOutput("M"),
                   tags$h5("Miljöpartiet"),
                   verbatimTextOutput("Mp"),
                   tags$h5("Socialdemokraterna"),
                   verbatimTextOutput("S"),
                   tags$h5("Sverigedemokraterna"),
                   verbatimTextOutput("Sd"),
                   tags$h5("Vänsterpartiet"),
                   verbatimTextOutput("V")
                   )
          
        )
      )
   )
)

server <- function(input, output, session) {
  # Force Mp and V selected
  observe({
    x <- input$party_answers
    updateCheckboxGroupInput(session, "party_answers", selected = unique(c("V","Mp",x)))
  })
   output$all <- renderText({
     paste0("alireza.akhondi@riksdagen.se,daniel.backstrom@riksdagen.se,jonny.cato.hansson@riksdagen.se,fredrik.christensson@riksdagen.se,magnus.ek@riksdagen.se,eskil.erlandsson@riksdagen.se,johan.hedin@riksdagen.se,ulrika.heie@riksdagen.se,peter.helander@riksdagen.se,martina.johansson@riksdagen.se,ola.johansson@riksdagen.se,anders.w.jonsson@riksdagen.se,johanna.jonsson@riksdagen.se,emil.kallstrom@riksdagen.se,mikael.larsson@riksdagen.se,helena.lindahl@riksdagen.se,per.lodenius@riksdagen.se,kerstin.lundgren@riksdagen.se,annie.loof@riksdagen.se,sofia.nilsson@riksdagen.se,rickard.nordin@riksdagen.se,niels.paarup-petersen@riksdagen.se,annika.qarlsson@riksdagen.se,lars.thomsson@riksdagen.se,helena.vilhelmsson@riksdagen.se,linda.ylivainio@riksdagen.se,kristina.yngwe@riksdagen.se,solveig.zander@riksdagen.se,martin.adahl@riksdagen.se,anders.akesson@riksdagen.se,per.asling@riksdagen.se,lars.adaktusson@riksdagen.se,michael.anefur@riksdagen.se,acko.ankarberg.johansson@riksdagen.se,camilla.brodin@riksdagen.se,ebba.busch.thor@riksdagen.se,andreas.carlson@riksdagen.se,christian.carlsson@riksdagen.se,sofia.damm@riksdagen.se,hans.eklind@riksdagen.se,jakob.forssmed@riksdagen.se,hampus.hagman@riksdagen.se,robert.halef@riksdagen.se,magnus.jacobsson@riksdagen.se,ingemar.kihlstrom@riksdagen.se,jimmy.loord@riksdagen.se,magnus.oscarsson@riksdagen.se,mikael.oscarsson@riksdagen.se,kjell-arne.ottosson@riksdagen.se,tuve.skanberg@riksdagen.se,pia.steensland@riksdagen.se,larry.soder@riksdagen.se,roland.utbult@riksdagen.se,tina.acketoft@riksdagen.se,maria.arnholm@riksdagen.se,gulan.avci@riksdagen.se,jan.bjorklund@riksdagen.se,juno.blom@riksdagen.se,emma.carlsson.lofdahl@riksdagen.se,bengt.eliasson@riksdagen.se,joar.forssell@riksdagen.se,helena.gellerman@riksdagen.se,roger.haddad@riksdagen.se,robert.hannah@riksdagen.se,fredrik.malm@riksdagen.se,maria.nilsson@riksdagen.se,lina.nordquist@riksdagen.se,christer.nylander@riksdagen.se,johan.pehrson@riksdagen.se,mats.persson@riksdagen.se,arman.teimouri@riksdagen.se,barbro.westerholm@riksdagen.se,allan.widman@riksdagen.se,ann-sofie.alm@riksdagen.se,jan.r.andersson@riksdagen.se,alexandra.anstrell@riksdagen.se,beatrice.ask@riksdagen.se,kristina.axen.olin@riksdagen.se,hanif.bali@riksdagen.se,lars.beckman@riksdagen.se,erik.bengtzboe@riksdagen.se,sten.bergheden@riksdagen.se,jorgen.berglund@riksdagen.se,tobias.billstrom@riksdagen.se,elisabeth.bjornsdotter.rahm@riksdagen.se,carl-oskar.bohlin@riksdagen.se,helena.bouveng@riksdagen.se,katarina.brannstrom@riksdagen.se,margareta.cederfelt@riksdagen.se,asa.coenraads@riksdagen.se,ida.drougge@riksdagen.se,annicka.engblom@riksdagen.se,karin.enstrom@riksdagen.se,jan.ericson@riksdagen.se,lotta.finstorp@riksdagen.se,johan.forssell@riksdagen.se,mats.green@riksdagen.se,ann-charlotte.hammar.johnsson@riksdagen.se,anders.hansson@riksdagen.se,ulrika.heindorff@riksdagen.se,lars.hjalmered@riksdagen.se,johan.hultberg@riksdagen.se,marie-louise.hanel.sandstrom@riksdagen.se,kjell.jansson@riksdagen.se,pal.jonson@riksdagen.se,david.josefsson@riksdagen.se,ellen.juntti@riksdagen.se,ulrika.jorgensen@riksdagen.se,arin.karapet@riksdagen.se,mattias.j.karlsson@riksdagen.se,ulf.kristersson@riksdagen.se,marlene.lund.kopparklint@riksdagen.se,betty.malmberg@riksdagen.se,maria.malmer.stenergard@riksdagen.se,josefin.malmqvist@riksdagen.se,noria.manouchi@riksdagen.se,louise.meijer@riksdagen.se,marta.obminska@riksdagen.se,charlotta.olsson@riksdagen.se,erik.ottoson@riksdagen.se,jessica.polfjard@riksdagen.se,lars.puss@riksdagen.se,saila.quicklund@riksdagen.se,edward.riedl@riksdagen.se,jessica.rosencrantz@riksdagen.se,jessika.roswall@riksdagen.se,hans.rothenberg@riksdagen.se,magdalena.schroder@riksdagen.se,maria.stockhaus@riksdagen.se,elisabeth.svantesson@riksdagen.se,cecilie.tenfjord-toftby@riksdagen.se,tomas.tobe@riksdagen.se,hans.wallmark@riksdagen.se,camilla.waltersson.gronvall@riksdagen.se,jorgen.warborn@riksdagen.se,john.weinerhall@riksdagen.se,sofia.westergren@riksdagen.se,cecilia.widegren@riksdagen.se,john.widegren@riksdagen.se,niklas.wykman@riksdagen.se,viktor.warnick@riksdagen.se,boriana.aberg@riksdagen.se,ann-britt.asebol@riksdagen.se,leila.ali.elmi@riksdagen.se,janine.alm.ericson@riksdagen.se,emma.berginger@riksdagen.se,jonas.eriksson@riksdagen.se,elisabeth.falkhaven@riksdagen.se,maria.ferm@riksdagen.se,maria.gardfjell@riksdagen.se,annika.hirvonen.falk@riksdagen.se,annica.hjerling@riksdagen.se,emma.hult@riksdagen.se,rebecka.le.moine@riksdagen.se,asa.lindhagen@riksdagen.se,rasmus.ling@riksdagen.se,amanda.palmstierna@riksdagen.se,anna.sibinska@riksdagen.se,lorentz.tovatt@riksdagen.se,ann-christin.ahlberg@riksdagen.se,johan.andersson@riksdagen.se,marie.axelsson@riksdagen.se,denis.begic@riksdagen.se,patrik.bjorck@riksdagen.se,helene.bjorklund@riksdagen.se,marlene.burwick@riksdagen.se,johan.buser@riksdagen.se,clasgoran.carlsson@riksdagen.se,gunilla.c.carlsson@riksdagen.se,teresa.carvalho@riksdagen.se,mikael.dahlqvist@riksdagen.se,adnan.dibrani@riksdagen.se,hans.ekstrom@riksdagen.se,jamal.el-haj@riksdagen.se,lena.emilsson@riksdagen.se,patrik.engstrom@riksdagen.se,asa.eriksson@riksdagen.se,matilda.ernkrans@riksdagen.se,erik.ezelius@riksdagen.se,aylin.fazelian@riksdagen.se,kenneth.g.forslund@riksdagen.se,isak.from@riksdagen.se,roza.guclu.hedin@riksdagen.se,elin.a.gustafsson@riksdagen.se,monica.haider@riksdagen.se,thomas.hammarberg@riksdagen.se,johanna.haraldsson@riksdagen.se,jorgen.hellman@riksdagen.se,caroline.helmersson.olsson@riksdagen.se,hans.hoff@riksdagen.se,paula.holmqvist@riksdagen.se,per-arne.hakansson@riksdagen.se,anna.johansson@riksdagen.se,mattias.jonsson@riksdagen.se,joakim.jarrebring@riksdagen.se,ida.karkiainen@riksdagen.se,annelie.karlsson@riksdagen.se,niklas.karlsson@riksdagen.se,asa.karlsson@riksdagen.se,kadir.kasirga@riksdagen.se,sultan.kayhan@riksdagen.se,tomas.kronstahl@riksdagen.se,serkan.kose@riksdagen.se,gustaf.lantz@riksdagen.se,dag.larsson@riksdagen.se,hillevi.larsson@riksdagen.se,lars.mejern.larsson@riksdagen.se,malin.larsson@riksdagen.se,rikard.larsson@riksdagen.se,sanne.lennstrom@riksdagen.se,teres.lindberg@riksdagen.se,asa.lindestam@riksdagen.se,eva.lindh@riksdagen.se,elin.lundgren@riksdagen.se,fredrik.lundh.sammeli@riksdagen.se,patrik.lundqvist@riksdagen.se,petter.loberg@riksdagen.se,johan.lofstrand@riksdagen.se,anders.lonnberg@riksdagen.se,magnus.manhammar@riksdagen.se,ola.moller@riksdagen.se,laila.naraghi@riksdagen.se,pyry.niemi@riksdagen.se,ingemar.nilsson@riksdagen.se,jennie.nilsson@riksdagen.se,kristina.nilsson@riksdagen.se,pia.nilsson@riksdagen.se,ingela.nylund.watz@riksdagen.se,leif.nysmed@riksdagen.se,carina.ohlsson@riksdagen.se,fredrik.olovsson@riksdagen.se,kalle.olsson@riksdagen.se,jasenko.omanovic@riksdagen.se,mattias.ottosson@riksdagen.se,peter.persson@riksdagen.se,bjorn.petersson@riksdagen.se,helen.pettersson@riksdagen.se,marianne.pettersson@riksdagen.se,lawen.redar@riksdagen.se,azadeh.rojhan@riksdagen.se,lena.radstrom.baastad@riksdagen.se,joakim.sandell@riksdagen.se,markus.selin@riksdagen.se,linus.skold@riksdagen.se,fredrik.stenberg@riksdagen.se,maria.stromkvist@riksdagen.se,gunilla.svantorp@riksdagen.se,anna-caren.satherberg@riksdagen.se,mathias.tegner@riksdagen.se,olle.thorell@riksdagen.se,emilia.toyra@riksdagen.se,anna.vikstrom@riksdagen.se,anna.wallentheim@riksdagen.se,hanna.westeren@riksdagen.se,asa.westlund@riksdagen.se,mats.wiking@riksdagen.se,anders.ygeman@riksdagen.se,carina.odebrink@riksdagen.se,anders.osterberg@riksdagen.se,jonas.p.andersson@riksdagen.se,jonas.m.andersson@riksdagen.se,lars.andersson@riksdagen.se,tobias.andersson@riksdagen.se,clara.aranda@riksdagen.se,ludvig.aspling@riksdagen.se,angelika.bengtsson@riksdagen.se,paula.bieler@riksdagen.se,bo.broman@riksdagen.se,mattias.backstrom.johansson@riksdagen.se,alexander.christiansson@riksdagen.se,dennis.dioukarev@riksdagen.se,staffan.eklof@riksdagen.se,aron.emilsson@riksdagen.se,matheus.enholm@riksdagen.se,yasmine.eriksson@riksdagen.se,mikael.eskilandersson@riksdagen.se,runar.filper@riksdagen.se,josef.fransson@riksdagen.se,ann-christine.utterstedt@riksdagen.se,jorgen.grubb@riksdagen.se,roger.hedlund@riksdagen.se,ebba.hermansson@riksdagen.se,richard.jomshof@riksdagen.se,patrik.jonsson@riksdagen.se,mattias.karlsson@riksdagen.se,martin.kinnunen@riksdagen.se,julia.kronlid@riksdagen.se,fredrik.lindahl@riksdagen.se,linda.lindberg@riksdagen.se,angelica.lundberg@riksdagen.se,david.lang@riksdagen.se,adam.marttinen@riksdagen.se,jonas.millard@riksdagen.se,thomas.morell@riksdagen.se,mats.nordberg@riksdagen.se,caroline.nordengrip@riksdagen.se,katja.nyberg@riksdagen.se,anne.oskarsson@riksdagen.se,eric.palmqvist@riksdagen.se,magnus.persson@riksdagen.se,charlotte.quensel@riksdagen.se,per.ramhorn@riksdagen.se,patrick.reslow@riksdagen.se,roger.richtoff@riksdagen.se,michael.rubbestad@riksdagen.se,sara.seppala@riksdagen.se,oscar.sjostedt@riksdagen.se,johnny.skalin@riksdagen.se,robert.stenkvist@riksdagen.se,mikael.strandman@riksdagen.se,carina.stahl@riksdagen.se,jimmy.stahl@riksdagen.se,cassandra.sundin@riksdagen.se,sven-olof.sallstrom@riksdagen.se,bjorn.soder@riksdagen.se,henrik.vinge@riksdagen.se,eric.westroth@riksdagen.se,markus.wiechel@riksdagen.se,jennie.afeldt@riksdagen.se,jimmie.akesson@riksdagen.se,christina.ostberg@riksdagen.se,ulla.andersson@riksdagen.se,nooshi.dadgostar@riksdagen.se,lorena.delgado@riksdagen.se,ali.esbati@riksdagen.se,ida.gabrielsson@riksdagen.se,hanna.gunnarsson@riksdagen.se,tony.haddou@riksdagen.se,jens.holm@riksdagen.se,christina.hoj.larsen@riksdagen.se,momodou-malcolm.jallow@riksdagen.se,lotta.johnsson.fornarve@riksdagen.se,amineh.kakabaveh@riksdagen.se,maj.karlsson@riksdagen.se,birger.lahti@riksdagen.se,yasmine.posio@riksdagen.se,daniel.riazat@riksdagen.se,karin.ragsjo@riksdagen.se,elin.segerlind@riksdagen.se,jonas.sjostedt@riksdagen.se,hakan.svenneling@riksdagen.se,mia.sydow.molleby@riksdagen.se,ilona.waldau@riksdagen.se,jon.thorbjornson@riksdagen.se,jessica.thunander@riksdagen.se,vasiliki.tsouplaki@riksdagen.se,ciczie.weidby@riksdagen.se,linda.snecker@riksdagen.se,jessica.wetterling@riksdagen.se")
   })
   output$C <- renderText({
     paste0("alireza.akhondi@riksdagen.se,daniel.backstrom@riksdagen.se,jonny.cato.hansson@riksdagen.se,fredrik.christensson@riksdagen.se,magnus.ek@riksdagen.se,eskil.erlandsson@riksdagen.se,johan.hedin@riksdagen.se,ulrika.heie@riksdagen.se,peter.helander@riksdagen.se,martina.johansson@riksdagen.se,ola.johansson@riksdagen.se,anders.w.jonsson@riksdagen.se,johanna.jonsson@riksdagen.se,emil.kallstrom@riksdagen.se,mikael.larsson@riksdagen.se,helena.lindahl@riksdagen.se,per.lodenius@riksdagen.se,kerstin.lundgren@riksdagen.se,annie.loof@riksdagen.se,sofia.nilsson@riksdagen.se,rickard.nordin@riksdagen.se,niels.paarup-petersen@riksdagen.se,annika.qarlsson@riksdagen.se,lars.thomsson@riksdagen.se,helena.vilhelmsson@riksdagen.se,linda.ylivainio@riksdagen.se,kristina.yngwe@riksdagen.se,solveig.zander@riksdagen.se,martin.adahl@riksdagen.se,anders.akesson@riksdagen.se,per.asling@riksdagen.se")
   })
   output$Kd <- renderText({
     paste0("lars.adaktusson@riksdagen.se,michael.anefur@riksdagen.se,acko.ankarberg.johansson@riksdagen.se,camilla.brodin@riksdagen.se,ebba.busch.thor@riksdagen.se,andreas.carlson@riksdagen.se,christian.carlsson@riksdagen.se,sofia.damm@riksdagen.se,hans.eklind@riksdagen.se,jakob.forssmed@riksdagen.se,hampus.hagman@riksdagen.se,robert.halef@riksdagen.se,magnus.jacobsson@riksdagen.se,ingemar.kihlstrom@riksdagen.se,jimmy.loord@riksdagen.se,magnus.oscarsson@riksdagen.se,mikael.oscarsson@riksdagen.se,kjell-arne.ottosson@riksdagen.se,tuve.skanberg@riksdagen.se,pia.steensland@riksdagen.se,larry.soder@riksdagen.se,roland.utbult@riksdagen.se")
   })
   output$L <- renderText({
     paste0("tina.acketoft@riksdagen.se,maria.arnholm@riksdagen.se,gulan.avci@riksdagen.se,jan.bjorklund@riksdagen.se,juno.blom@riksdagen.se,emma.carlsson.lofdahl@riksdagen.se,bengt.eliasson@riksdagen.se,joar.forssell@riksdagen.se,helena.gellerman@riksdagen.se,roger.haddad@riksdagen.se,robert.hannah@riksdagen.se,fredrik.malm@riksdagen.se,maria.nilsson@riksdagen.se,lina.nordquist@riksdagen.se,christer.nylander@riksdagen.se,johan.pehrson@riksdagen.se,mats.persson@riksdagen.se,arman.teimouri@riksdagen.se,barbro.westerholm@riksdagen.se,allan.widman@riksdagen.se")
   })
   output$M <- renderText({
     paste0("ann-sofie.alm@riksdagen.se,jan.r.andersson@riksdagen.se,alexandra.anstrell@riksdagen.se,beatrice.ask@riksdagen.se,kristina.axen.olin@riksdagen.se,hanif.bali@riksdagen.se,lars.beckman@riksdagen.se,erik.bengtzboe@riksdagen.se,sten.bergheden@riksdagen.se,jorgen.berglund@riksdagen.se,tobias.billstrom@riksdagen.se,elisabeth.bjornsdotter.rahm@riksdagen.se,carl-oskar.bohlin@riksdagen.se,helena.bouveng@riksdagen.se,katarina.brannstrom@riksdagen.se,margareta.cederfelt@riksdagen.se,asa.coenraads@riksdagen.se,ida.drougge@riksdagen.se,annicka.engblom@riksdagen.se,karin.enstrom@riksdagen.se,jan.ericson@riksdagen.se,lotta.finstorp@riksdagen.se,johan.forssell@riksdagen.se,mats.green@riksdagen.se,ann-charlotte.hammar.johnsson@riksdagen.se,anders.hansson@riksdagen.se,ulrika.heindorff@riksdagen.se,lars.hjalmered@riksdagen.se,johan.hultberg@riksdagen.se,marie-louise.hanel.sandstrom@riksdagen.se,kjell.jansson@riksdagen.se,pal.jonson@riksdagen.se,david.josefsson@riksdagen.se,ellen.juntti@riksdagen.se,ulrika.jorgensen@riksdagen.se,arin.karapet@riksdagen.se,mattias.j.karlsson@riksdagen.se,ulf.kristersson@riksdagen.se,marlene.lund.kopparklint@riksdagen.se,betty.malmberg@riksdagen.se,maria.malmer.stenergard@riksdagen.se,josefin.malmqvist@riksdagen.se,noria.manouchi@riksdagen.se,louise.meijer@riksdagen.se,marta.obminska@riksdagen.se,charlotta.olsson@riksdagen.se,erik.ottoson@riksdagen.se,jessica.polfjard@riksdagen.se,lars.puss@riksdagen.se,saila.quicklund@riksdagen.se,edward.riedl@riksdagen.se,jessica.rosencrantz@riksdagen.se,jessika.roswall@riksdagen.se,hans.rothenberg@riksdagen.se,magdalena.schroder@riksdagen.se,maria.stockhaus@riksdagen.se,elisabeth.svantesson@riksdagen.se,cecilie.tenfjord-toftby@riksdagen.se,tomas.tobe@riksdagen.se,hans.wallmark@riksdagen.se,camilla.waltersson.gronvall@riksdagen.se,jorgen.warborn@riksdagen.se,john.weinerhall@riksdagen.se,sofia.westergren@riksdagen.se,cecilia.widegren@riksdagen.se,john.widegren@riksdagen.se,niklas.wykman@riksdagen.se,viktor.warnick@riksdagen.se,boriana.aberg@riksdagen.se,ann-britt.asebol@riksdagen.se")
   })
   output$Mp <- renderText({
     paste0("leila.ali.elmi@riksdagen.se,janine.alm.ericson@riksdagen.se,emma.berginger@riksdagen.se,jonas.eriksson@riksdagen.se,elisabeth.falkhaven@riksdagen.se,maria.ferm@riksdagen.se,maria.gardfjell@riksdagen.se,annika.hirvonen.falk@riksdagen.se,annica.hjerling@riksdagen.se,emma.hult@riksdagen.se,rebecka.le.moine@riksdagen.se,asa.lindhagen@riksdagen.se,rasmus.ling@riksdagen.se,amanda.palmstierna@riksdagen.se,anna.sibinska@riksdagen.se,lorentz.tovatt@riksdagen.se")
   })
   output$S <- renderText({
     paste0("ann-christin.ahlberg@riksdagen.se,johan.andersson@riksdagen.se,marie.axelsson@riksdagen.se,denis.begic@riksdagen.se,patrik.bjorck@riksdagen.se,helene.bjorklund@riksdagen.se,marlene.burwick@riksdagen.se,johan.buser@riksdagen.se,clasgoran.carlsson@riksdagen.se,gunilla.c.carlsson@riksdagen.se,teresa.carvalho@riksdagen.se,mikael.dahlqvist@riksdagen.se,adnan.dibrani@riksdagen.se,hans.ekstrom@riksdagen.se,jamal.el-haj@riksdagen.se,lena.emilsson@riksdagen.se,patrik.engstrom@riksdagen.se,asa.eriksson@riksdagen.se,matilda.ernkrans@riksdagen.se,erik.ezelius@riksdagen.se,aylin.fazelian@riksdagen.se,kenneth.g.forslund@riksdagen.se,isak.from@riksdagen.se,roza.guclu.hedin@riksdagen.se,elin.a.gustafsson@riksdagen.se,monica.haider@riksdagen.se,thomas.hammarberg@riksdagen.se,johanna.haraldsson@riksdagen.se,jorgen.hellman@riksdagen.se,caroline.helmersson.olsson@riksdagen.se,hans.hoff@riksdagen.se,paula.holmqvist@riksdagen.se,per-arne.hakansson@riksdagen.se,anna.johansson@riksdagen.se,mattias.jonsson@riksdagen.se,joakim.jarrebring@riksdagen.se,ida.karkiainen@riksdagen.se,annelie.karlsson@riksdagen.se,niklas.karlsson@riksdagen.se,asa.karlsson@riksdagen.se,kadir.kasirga@riksdagen.se,sultan.kayhan@riksdagen.se,tomas.kronstahl@riksdagen.se,serkan.kose@riksdagen.se,gustaf.lantz@riksdagen.se,dag.larsson@riksdagen.se,hillevi.larsson@riksdagen.se,lars.mejern.larsson@riksdagen.se,malin.larsson@riksdagen.se,rikard.larsson@riksdagen.se,sanne.lennstrom@riksdagen.se,teres.lindberg@riksdagen.se,asa.lindestam@riksdagen.se,eva.lindh@riksdagen.se,elin.lundgren@riksdagen.se,fredrik.lundh.sammeli@riksdagen.se,patrik.lundqvist@riksdagen.se,petter.loberg@riksdagen.se,johan.lofstrand@riksdagen.se,anders.lonnberg@riksdagen.se,magnus.manhammar@riksdagen.se,ola.moller@riksdagen.se,laila.naraghi@riksdagen.se,pyry.niemi@riksdagen.se,ingemar.nilsson@riksdagen.se,jennie.nilsson@riksdagen.se,kristina.nilsson@riksdagen.se,pia.nilsson@riksdagen.se,ingela.nylund.watz@riksdagen.se,leif.nysmed@riksdagen.se,carina.ohlsson@riksdagen.se,fredrik.olovsson@riksdagen.se,kalle.olsson@riksdagen.se,jasenko.omanovic@riksdagen.se,mattias.ottosson@riksdagen.se,peter.persson@riksdagen.se,bjorn.petersson@riksdagen.se,helen.pettersson@riksdagen.se,marianne.pettersson@riksdagen.se,lawen.redar@riksdagen.se,azadeh.rojhan@riksdagen.se,lena.radstrom.baastad@riksdagen.se,joakim.sandell@riksdagen.se,markus.selin@riksdagen.se,linus.skold@riksdagen.se,fredrik.stenberg@riksdagen.se,maria.stromkvist@riksdagen.se,gunilla.svantorp@riksdagen.se,anna-caren.satherberg@riksdagen.se,mathias.tegner@riksdagen.se,olle.thorell@riksdagen.se,emilia.toyra@riksdagen.se,anna.vikstrom@riksdagen.se,anna.wallentheim@riksdagen.se,hanna.westeren@riksdagen.se,asa.westlund@riksdagen.se,mats.wiking@riksdagen.se,anders.ygeman@riksdagen.se,carina.odebrink@riksdagen.se,anders.osterberg@riksdagen.se")
   })
   output$Sd <- renderText({
     paste0("jonas.p.andersson@riksdagen.se,jonas.m.andersson@riksdagen.se,lars.andersson@riksdagen.se,tobias.andersson@riksdagen.se,clara.aranda@riksdagen.se,ludvig.aspling@riksdagen.se,angelika.bengtsson@riksdagen.se,paula.bieler@riksdagen.se,bo.broman@riksdagen.se,mattias.backstrom.johansson@riksdagen.se,alexander.christiansson@riksdagen.se,dennis.dioukarev@riksdagen.se,staffan.eklof@riksdagen.se,aron.emilsson@riksdagen.se,matheus.enholm@riksdagen.se,yasmine.eriksson@riksdagen.se,mikael.eskilandersson@riksdagen.se,runar.filper@riksdagen.se,josef.fransson@riksdagen.se,ann-christine.utterstedt@riksdagen.se,jorgen.grubb@riksdagen.se,roger.hedlund@riksdagen.se,ebba.hermansson@riksdagen.se,richard.jomshof@riksdagen.se,patrik.jonsson@riksdagen.se,mattias.karlsson@riksdagen.se,martin.kinnunen@riksdagen.se,julia.kronlid@riksdagen.se,fredrik.lindahl@riksdagen.se,linda.lindberg@riksdagen.se,angelica.lundberg@riksdagen.se,david.lang@riksdagen.se,adam.marttinen@riksdagen.se,jonas.millard@riksdagen.se,thomas.morell@riksdagen.se,mats.nordberg@riksdagen.se,caroline.nordengrip@riksdagen.se,katja.nyberg@riksdagen.se,anne.oskarsson@riksdagen.se,eric.palmqvist@riksdagen.se,magnus.persson@riksdagen.se,charlotte.quensel@riksdagen.se,per.ramhorn@riksdagen.se,patrick.reslow@riksdagen.se,roger.richtoff@riksdagen.se,michael.rubbestad@riksdagen.se,sara.seppala@riksdagen.se,oscar.sjostedt@riksdagen.se,johnny.skalin@riksdagen.se,robert.stenkvist@riksdagen.se,mikael.strandman@riksdagen.se,carina.stahl@riksdagen.se,jimmy.stahl@riksdagen.se,cassandra.sundin@riksdagen.se,sven-olof.sallstrom@riksdagen.se,bjorn.soder@riksdagen.se,henrik.vinge@riksdagen.se,eric.westroth@riksdagen.se,markus.wiechel@riksdagen.se,jennie.afeldt@riksdagen.se,jimmie.akesson@riksdagen.se,christina.ostberg@riksdagen.se")
   })
   output$V <- renderText({
     paste0("ulla.andersson@riksdagen.se,nooshi.dadgostar@riksdagen.se,lorena.delgado@riksdagen.se,ali.esbati@riksdagen.se,ida.gabrielsson@riksdagen.se,hanna.gunnarsson@riksdagen.se,tony.haddou@riksdagen.se,jens.holm@riksdagen.se,christina.hoj.larsen@riksdagen.se,momodou-malcolm.jallow@riksdagen.se,lotta.johnsson.fornarve@riksdagen.se,amineh.kakabaveh@riksdagen.se,maj.karlsson@riksdagen.se,birger.lahti@riksdagen.se,yasmine.posio@riksdagen.se,daniel.riazat@riksdagen.se,karin.ragsjo@riksdagen.se,elin.segerlind@riksdagen.se,jonas.sjostedt@riksdagen.se,hakan.svenneling@riksdagen.se,mia.sydow.molleby@riksdagen.se,ilona.waldau@riksdagen.se,jon.thorbjornson@riksdagen.se,jessica.thunander@riksdagen.se,vasiliki.tsouplaki@riksdagen.se,ciczie.weidby@riksdagen.se,linda.snecker@riksdagen.se,jessica.wetterling@riksdagen.se")
   })
   
   output$suggestion_info <- renderUI({
     dets <- details()
     s = input$suggestions
     i <- as.numeric(strsplit(s,split="\\.")[[1]][1])
     summary <- dets[i,"summaries"]
     sugg <- dets[i,"suggestions"]
     tagList(tags$b(s),tags$br(),summary,tags$br(),tags$b("Förslag:"),sugg)
   })
   
   set_mandates <- reactive({
     n <- read_numeric()
     cols <- colnames(n)
     parties <- c(input$party_answers)
     if (!is.null(parties)) {
       sel <- n[,parties]
       if (length(parties)==1) {
         sel <- as.data.frame(n[,parties], row.names=rownames(n))
         colnames(sel) <- parties
       }
       sel[sel==0] <- 1
       if (length(parties)==7) {
         unsel <- as.data.frame(n[,!colnames(n)%in%parties], row.names=rownames(n))
         colnames(unsel) <- colnames(n)[!colnames(n)%in%parties]
       }
       else {
         unsel <- n[,!colnames(n)%in%parties]
       }
       
       n <- cbind(sel,unsel)[,cols]
     }
    return(n)
   })
  
   output$mandat <- renderDataTable({
     # Read numeric data
     n <- set_mandates()
     mandat <- read.table("mandat.tsv", header=T, row.names=1)
     cols <- colnames(n)
     n <- as.matrix(n)
     mandat <- mandat[colnames(n),]
     n <- n %*% diag(mandat)
     colnames(n) <- cols
     mandates <- rowSums(n)
     percent <- mandates/349
     nums <- cbind(percent, mandates)
     colnames(nums) <- c("Mandat i %","Mandat")
     row.names(nums) <- rnames
     # Read answers
     answers <- read_answers()
     row.names(answers) <- rnames
     if (input$table_type=="Partiernas svar")
       datatable(answers, options = list(selection = "single", columnDefs = list(list(className = 'dt-center', targets=seq(1,ncol(answers)))))) %>%
        formatStyle(cnames, backgroundColor = styleEqual(c("Ja","?","Nej"), c("lightgreen","lightsteelblue","deeppink")))
     else
       datatable(nums, options = list(autoWidth = TRUE, selection = "single", columnDefs = list(list(className = 'dt-center', targets=c(1,2))))) %>% 
        formatPercentage("Mandat i %",0) %>% 
        formatStyle("Mandat i %", backgroundColor = styleInterval(0.5, c("deeppink","lightgreen"))) %>%
        formatStyle("Mandat", backgroundColor = styleInterval(round(349/2), c("deeppink","lightgreen")))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

