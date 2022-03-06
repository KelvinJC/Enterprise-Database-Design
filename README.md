# Enterprise Database Design

Insight drawn from data is crucial to decision making within a business concern. It then follows that every business should have a store for its data. Databases can be used for storage, analytical as well as transactional purposes. For the business in question, I was given the task of designing a database which would be used for the storage of relevant data on their clients, suppliers and services. 

In the design of database the first step is usually to conduct a thorough analysis of the enterprise in question. Such analysis provides a view of the underlying business logic governing its operations.

After the analysis is concluded the next step is the drafting of an Entity Relational Data Model (ERD).

The ER model is used as a tool to design relational databases. In the ER model, entities are objects that exist independently of any other entities in the database. The building blocks of an ER diagram are entities and attributes. 

An entity can be a noun: person, place or thing. In an ER diagram, an entity is drawn as a rectangle. Entities have attributes which are the data elements that characterize the entity. Attributes tell us more about the entity. In an ER diagram, attributes are drawn as ovals.


## Business Logic
Treasure House** (Treasure House) provides a variety of services for couples looking to get married. Couples can discuss the various options with a Treasure House wedding consultant, who will help them to choose the Treasure House services that meet their needs and budget. 
When a couple contracts with Treasure House to provide wedding services that is referred to as a “wedding”. For each wedding, the name of the wedding and initial date that a couple contracts with Treasure House is recorded. The name of the wedding is usually the last names of the couple. For example, when Lisa Wellington and Segun Cole contract with Treasure House, that would be named the “Wellington-Cole Wedding”. 
Every wedding must have at least two people associated with it - the couple being married. Due to divorce it is possible for a person to be in more than one wedding couple over time. For each person in the wedding couple, the person’s name, address (street, city, state, zip code) and phone number are recorded. 

Treasure House offers many services such as, the marriage ceremony, reception, rehearsal dinners, dressmaking, limousine, carriage and others. For each service available, the name of the service, the type of service (ceremony, gathering, transportation etc.) and a description are kept. 
Some services are provided by only one contractor, but for most services, Treasure House has several contractors that can provide that service. A contractor must provide at least one service to be in the system. Treasure House will always have one contractor for every service. 
Different contractors can provide a given service in slightly different ways. For example, Treasure House has two contractors that can provide low-cost, basic catering for a reception and one contractor that can offer high-cost, fine dining for a reception. To help clients understand the differences in each contractor providing a service, a description of each contractor’s capabilities in providing the services are kept in the system. Therefore, there is a description for the generic service, regardless of which contractor provides the service, plus a separate description of how the service is provided by each specific contractor. For each contractor, the contractor’s company name, address and phone number are recorded.

While some weddings involve only a single service, most couples contract with Treasure House to provide many services. The services that are provided for a particular wedding are organised into “events”. Each event is associated with one and only one wedding. Every wedding must include at least one event. Some events involve several services but others involve only one service. For example, Wellington-Cole wedding includes three events: wedding ceremony, reception and after-reception transportation. The reception involves catering, floral and valet parking services while the after-reception transportation involves only the limousine service. 
It is possible to offer a service that no couple has ever chosen, but most services have been provided for many different weddings. For each event, an event name is assigned, often with the help of the couple. For example, in the Wellington-Cole wedding, they chose to call the reception the “Post Wedding Gala”. 
In addition to the event name, the beginning date and time, the ending date and time and a description are entered into the system. Every event must occur at some place, although the event can be entered into the system before the couple decide on a location for the event. For each location, the name of the location, the location type and the address are kept by Treasure House. Locations that are new to Treasure House may have never had an event scheduled there, but most have had several events over time. Every event is scheduled for only one location.

A couple may decide which Treasure House services they want before deciding which contractor they want to provide that service so it is important that the system allows couple to contract a service without specifying the contractor. For example, the Wellington-Cole couple may contract for Treasure House to provide catering to the reception event before they decide if they want the contractor that specialises in African cuisine or the contractor that specialises in Caribbean cuisine.

In addition to knowing which contractor is contracted to provide a service for a event, it important to know which contractor actually ends up furnishing each service at an event. For example, LaVerne Florist may be contracted to provide floral services for the Wellington-Cole reception and Lorreta’s Orishi-rishi is contracted for the catering. Two days before the event, Laverne Florist may notify Treasure House that due to an unforeseen problem, they will not be able to deliver on the contract. As a result, Treasure House has to gert Vieden Flowers to provide the floral service. The system should track that LaVerne Florist was contracted for floral service but Vieden Flowers actually provided the service. It should also show that Lorreta’s Orishi-rishi was contracted for catering and that Lorreta’s Orishi-rishi actually provided the catering.

Due to the variables in each service, such as the number of planned guests at a reception, an estimated cost and running cost of furnishing the service for each event must also be kept. Also, it is possible in some cases for a contractor to furnish a service on a date that is different from the actual event. 
For example, for an early morning wedding ceremony, a florist may begin delivering and arranging flowers the evening before the ceremony or a caterer may begin setting up tables and decorations for a reception the night before the reception. The actual date the contractor began furnishing the service must be recorded.

In addition to the wedding couple, there are guests that are invited to some events. Not all events, such as transportation after the reception, have guests invited. A person can be in the system as a member of a couple and have never been a guest at any event. (The couple being married are never considered “guests” at their own wedding, but can be guests at the weddings of other couples over time). 
For events that have guests invited, a guest list is compiled. A person can be invited to many events. Treasure House places guest books at events for guests to sign. The guest book has space for the guest to write their name, address and phone number. The address and phone number are usually left blank by guests but some people do provide that information. 
After an event is over, Treasure House wil take the information from the guest books and try to match them with the people that were invited to the event. Individuals that were on the guest list but did not attend are marked as invited and as not attending. Individuals that attended but are not on the guest list are added to the Treasure House system as guests and are marked as not invited but as attending.

Finally the total estimated cost of the wedding and the total actual cost of the wedding should be stored as redundant data.

### For the purpose of data privacy, all names of persons and business entities have been changed to fictional ones.  


## ERD Logical Design (1st iteration)
![](images/erd%20logic%20first%20step.png)
<br>

## ERD Logical Design (2nd iteration)
![](images/erd%20logic%20second.drawio.png)
<br>

## ERD Physical Design
![](images/bigweddingiii.png)
