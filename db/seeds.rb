# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create(:email => "admin@oneline-team.de", :password => "Start2018!", :password_confirmation => "Start2018!", :role_name => "admin")
f = FormularCreator.create(:name => "Datenverarbeitung", :content => '<h1 style="text-align: center;"><strong>Schriftliche Einwilligung gem&auml;&szlig; Datenschutz&nbsp;</strong></h1>
<p>&nbsp;</p>
<p>Die im Vertrag angegebenen personenbezogenen Daten, insbesondere Name, Anschrift, Telefonnummer, Bankdaten, die allein zum Zwecke der Durchf&uuml;hrung des entstehenden Vertragsverh&auml;ltnisses notwendig und erforderlich sind, werden auf Grundlage gesetzlicher Berechtigungen erhoben.</p>
<p>&nbsp;</p>
<p>F&uuml;r jede dar&uuml;ber hinausgehende Nutzung der personenbezogenen Daten und die Erhebung zus&auml;tzlicher Informationen bedarf es regelm&auml;&szlig;ig der Einwilligung des Betroffenen. Eine solche Einwilligung k&ouml;nnen Sie im Folgenden Abschnitt <strong>freiwillig</strong> erteilen.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h2 style="text-align: center;"><strong>Einwilligung in die Datennutzung zu weiteren Zwecken</strong></h2>
<p>&nbsp;</p>
<p>Sind Sie mit den folgenden Nutzungszwecken einverstanden, kreuzen Sie diese bitte entsprechend an. Wollen Sie keine Einwilligung erteilen, lassen Sie die Felder bitte frei.</p>
<p>&nbsp;</p>
<ul>
<li>Ich willige ein, dass mir die {{company.name}} postalisch Informationen und Angebote zu weiteren Finanzprodukten zum Zwecke der Werbung &uuml;bersendet.</li>
<li>Ich willige ein, dass mir die {{company.name}} per E-Mail/Telefon/Fax/SMS* Informationen und Angebote zu weiteren Finanzprodukten zum Zwecke der Werbung &uuml;bersendet. (* bei Einwilligung bitte Unzutreffendes streichen)</li>
</ul>
<p>&nbsp;</p>
<p>[Ort, Datum]</p>
<p>[Unterschrift des Betroffenen]</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h3 style="text-align: center;"><strong>Rechte des Betroffenen: Auskunft, Berichtigung, L&ouml;schung und Sperrung, Widerspruchsrecht</strong></h3>
<p>&nbsp;</p>
<p>Sie sind gem&auml;&szlig; Artikel 15 DSGVO jederzeit berechtigt, gegen&uuml;ber der {{company.name}} um umfangreiche <strong>Auskunftserteilung</strong> zu den zu Ihrer Person gespeicherten Daten zu ersuchen.</p>
<p>&nbsp;</p>
<p>Gem&auml;&szlig; Artikel 17 DSGVO k&ouml;nnen Sie jederzeit gegen&uuml;ber der {{company.name}} die <strong>Berichtigung, L&ouml;schung und Sperrung</strong> einzelner personenbezogener Daten verlangen.</p>
<p>&nbsp;</p>
<p>Sie k&ouml;nnen dar&uuml;ber hinaus jederzeit ohne Angabe von Gr&uuml;nden von Ihrem <strong>Widerspruchsrecht</strong> Gebrauch machen und die erteilte Einwilligungserkl&auml;rung mit Wirkung f&uuml;r die Zukunft ab&auml;ndern oder g&auml;nzlich widerrufen. Sie k&ouml;nnen den Widerruf entweder postalisch, per E-Mail oder per Fax an den Vertragspartner &uuml;bermitteln. Es entstehen Ihnen dabei keine anderen Kosten als die Portokosten bzw. die &Uuml;bermittlungskosten nach den bestehenden Basistarifen.</p>
<p>&nbsp;</p>')