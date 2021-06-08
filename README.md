# OMOP CDM loader for SYNPUF data

1. Sign up for a [UMLS account](https://uts.nlm.nih.gov/uts/login) (click Research Organization) and wait for approval
2. [Generate an API key](https://uts.nlm.nih.gov/uts/edit-profile) to use in the docker build
1. Acquire vocab.zip containing free and UMLS vocabularies from [ATHENA download](https://athena.ohdsi.org/vocabulary/list)
2. `docker build --build-arg UMLS_API_KEY=<secret> -t ohdsi/synpuf .`
