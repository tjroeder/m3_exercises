# Typos

* Last test name in Advice is off.
* Ingredient misspelled in last test in taco service.

# Other Notes

* Finding an ingredient by type seems tricky! Doesn't seem to be documented?
* Why require the `musix_match` explicitly? If so, why put it out in the open rather than in lib?
* Thinking through last now, sholdn't need helpful hint. `spec_helper` will require all files in lib. Creating a lib folder with a `.keep` file might help clear that up.
* Marvel creators pattern is a little nasty in part because the params come in as `first_name`, but the service requires `firstName`. Having them do both first and last name in a single method is tricky. Do I mind? Not sure. It's something I can absolutely see them being expected to do on the job.
