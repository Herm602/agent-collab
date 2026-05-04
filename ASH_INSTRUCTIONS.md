# ASH — National Business Lead Generation Machine

## Mission

Build a complete database of **ALL South African businesses across ALL industries** that could buy from Levinn Workwear or use Nexa/AI services.

One Excel per industry. Systematic. Repeatable. Scalable.

## Target Industries (Phase 1 Priority Order)

| Priority | Industry | File Name | Est. Companies |
|----------|----------|-----------|---------------|
| 1 | Labour Brokers | leads_labour_brokers_sa.xlsx | 37 (DONE — use as template) |
| 2 | Construction | leads_construction_sa.xlsx | 100 |
| 3 | Mining & Quarrying | leads_mining_sa.xlsx | 80 |
| 4 | Logistics & Transport | leads_logistics_sa.xlsx | 100 |
| 5 | Manufacturing | leads_manufacturing_sa.xlsx | 100 |
| 6 | Security Services | leads_security_sa.xlsx | 60 |
| 7 | Agriculture & Farming | leads_agriculture_sa.xlsx | 80 |
| 8 | Cleaning & Facilities | leads_cleaning_sa.xlsx | 60 |
| 9 | Food Processing | leads_food_processing_sa.xlsx | 50 |
| 10 | Warehousing & Storage | leads_warehousing_sa.xlsx | 50 |
| 11 | Automotive & Workshops | leads_automotive_sa.xlsx | 60 |
| 12 | Chemical & Pharma | leads_chemical_sa.xlsx | 40 |
| 13 | Steel & Metal Fabrication | leads_steel_sa.xlsx | 50 |
| 14 | Textile & Apparel | leads_textile_sa.xlsx | 40 |
| 15 | Packaging & Printing | leads_packaging_sa.xlsx | 40 |

**Total Phase 1 Target: ~850 companies across 15 industries**

## Excel Column Structure (Copy for Every Industry)

| Column | Header | Required | Notes |
|--------|--------|----------|-------|
| A | Company Name | YES | Full legal name |
| B | Location | YES | City/Province |
| C | Website | NO | If available |
| D | Industry Sub-Sector | NO | e.g., "Civil Construction", "Underground Mining" |
| E | Email | YES | Primary contact email (generic or named) |
| F | Phone | YES | Direct landline or mobile |
| G | Decision Maker | NO | Name + title if found |
| H | Lead Score | NO | 1-10 priority |
| I | Close Timeline | NO | Days/weeks estimate |
| J | Notes | YES | Physical address, key intel, BEE status, est. headcount, sector details |

## Minimum Viable Lead (MVL)

Every row MUST have:
- ✅ Company Name
- ✅ Email OR Phone (both preferred)
- ✅ Physical Address (in Notes)
- ✅ Industry relevance note

If you can't find email AND phone after 10 minutes of searching, flag as "NEEDS MANUAL" and move on.

## Research Sources (Free, Priority Order)

1. **Google Search**: "[industry] companies South Africa" + city name
   - Example: "construction companies Johannesburg"
   - Example: "mining contractors Mpumalanga"

2. **AfricaBizInfo**: africabizinfo.com
   - SA business directory with verified phone numbers
   - Search by industry + location

3. **Cybo**: cybo.com
   - Business listings with addresses and phone numbers

4. **Infobel**: local.infobel.co.za
   - Phone directory with business addresses

5. **SA Business Listings**: sabusinesslistings.co.za
   - Local business directory

6. **Brabys**: brabys.com
   - SA business directory with maps

7. **LinkedIn**
   - Company pages for director/MD names
   - Search: "[industry] South Africa"

8. **Company Websites**
   - Contact pages for addresses and emails
   - About Us for leadership names

9. **CIPC/Company Registrations**
   - cipc.co.za for registered company lookups

10. **Industry Associations**
    - MBSA (Master Builders SA)
    - NAACAM (automotive)
    - SAPA (packaging)
    - Etc.

## Research Methodology

### Step 1: Industry List Building (30-60 min per industry)
- Search "list of [industry] companies South Africa"
- Copy company names into Excel
- Aim for 50-100 names minimum

### Step 2: Deep Research (5-10 min per company)
- Find website → contact page → email
- Google "[company name] phone number"
- Check AfricaBizInfo, Cybo, Infobel
- Record physical address from any source
- Look for MD/CEO/Director name on LinkedIn

### Step 3: Notes Format (Structured for parsing)
```
ADDRESS: [Full physical address]. PHONE: [Alt phones]. CONTACT: [Name, Title]. EMAIL: [Alt emails]. [Key intel: years in business, employees, BEE status, certifications, clients, revenue if known].
```

### Step 4: Priority Scoring
| Score | Criteria |
|-------|----------|
| 10 | Large national company, named MD contact, clear PPE need, BEE advantage |
| 8-9 | Medium company, has email + phone, industrial focus, regional coverage |
| 6-7 | Smaller operation, basic contact info, local only |
| 4-5 | Limited web presence, generic email only, status unclear |
| 1-3 | Missing critical data, outdated, possibly inactive |

## Report Generation (After Each Industry)

1. Open `levinn_report.html` in text editor
2. Replace company names and data with new industry research
3. Update stats boxes (total leads, high priority count, provinces covered)
4. Update executive summary for industry-specific language
5. Save as `[industry]_report.html`
6. Open in browser → Print → Save as PDF
7. Save PDF as `[industry]_report.pdf`

## Deliverables Per Industry (Back to Cael/Hermie)

1. `leads_[industry]_sa.xlsx` — Full data engine
2. `[industry]_report.pdf` — 2-page premium report
3. `TOP_5_[industry].md` — Brief notes on highest-priority targets

## File Naming Convention

All files must follow this pattern:
- `leads_[industry]_sa.xlsx` — Data file
- `[industry]_report.html` — Report template
- `[industry]_report.pdf` — PDF output
- `TOP_5_[industry].md` — Priority notes

**Industry names:** lowercase, no spaces (use underscore)
Examples: `construction`, `mining`, `logistics`, `manufacturing`, `security`, `agriculture`, `cleaning`

## Quality Gates

Before submitting each industry:
- [ ] Minimum 30 companies with email OR phone
- [ ] At least 5 companies with named decision maker
- [ ] Physical addresses recorded for top 20
- [ ] No duplicate companies
- [ ] Notes are structured and readable
- [ ] Report generated and visually clean

## Pace Expectations

| Task | Time per Industry |
|------|------------------|
| List building (names only) | 30-60 min |
| Deep research (30-50 companies) | 3-5 hours |
| Excel formatting + cleanup | 30 min |
| Report generation | 30 min |
| **Total per industry** | **4-7 hours** |

**Target: 2-3 industries per week minimum**

## Contact & Questions

- Drop questions in shared folder as `[industry]_QUESTION.md`
- Flag blocked leads in Excel Notes column as "NEEDS MANUAL"
- Priority escalations: ping Cael directly

## Remember

- **Quality over quantity** — 50 solid leads beat 100 weak ones
- **Named contacts beat generic emails** — always hunt for MD/CEO/Procurement Manager
- **Physical addresses beat PO boxes** — shows real business presence
- **BEE status = sales angle** — record it when found
- **This is a revenue machine** — every lead is potential R50K-R500K annually
- **Systematic wins** — same process, same columns, same format every time

## End Goal

**National Yellow Pages for Money:**
- 15 industries
- 850+ companies
- Every company has email + phone + address + contact name
- Every industry has a premium PDF report
- Sales team picks up report, calls top 5, books meetings
- **Pipeline potential: R40M - R400M annually**

**Build it. Scale it. Own the data.**

---

**Version:** 1.0
**Updated:** 2026-05-04
**Owner:** Cael Voss for Hermie
**Mission Status:** ACTIVE — Ash executing now
