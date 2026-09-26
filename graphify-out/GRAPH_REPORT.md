# Graph Report - omniroute  (2026-09-22)

## Corpus Check
- cluster-only mode — file stats not available

## Summary
- 41 nodes · 51 edges · 10 communities (3 shown, 7 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Community 0
- Community 1
- Community 3
- Community 4
- Community 5
- Community 7
- Community 8
- Community 9

## God Nodes (most connected - your core abstractions)
1. `d()` - 4 edges
2. `p()` - 4 edges
3. `u()` - 3 edges
4. `u()` - 3 edges
5. `y()` - 3 edges
6. `u()` - 3 edges
7. `y()` - 3 edges
8. `f()` - 3 edges
9. `f()` - 3 edges
10. `d()` - 2 edges

## Surprising Connections (you probably didn't know these)
- `y()` --calls--> `f()`  [EXTRACTED]
  patches/open-sse_0jdsfef._.js → patches/open-sse_0jdsfef._.js  _Bridges community 4 → community 7_
- `y()` --calls--> `f()`  [EXTRACTED]
  patches/open-sse_0sifrof._.js → patches/open-sse_0sifrof._.js  _Bridges community 5 → community 8_

## Import Cycles
- None detected.

## Communities (10 total, 7 thin omitted)

### Community 3 - "Community 3"
Cohesion: 0.50
Nodes (5): d(), i(), l(), p(), u()

### Community 4 - "Community 4"
Cohesion: 0.67
Nodes (3): a(), u(), y()

### Community 5 - "Community 5"
Cohesion: 0.67
Nodes (3): a(), u(), y()

## Knowledge Gaps
- **1 isolated node(s):** `run.sh script`
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 18 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **7 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `d()` connect `Community 3` to `Community 2`?**
  _High betweenness centrality (0.001) - this node is a cross-community bridge._
- **Why does `p()` connect `Community 3` to `Community 2`?**
  _High betweenness centrality (0.001) - this node is a cross-community bridge._
- **Why does `u()` connect `Community 4` to `Community 0`?**
  _High betweenness centrality (0.001) - this node is a cross-community bridge._
- **What connects `run.sh script` to the rest of the system?**
  _1 weakly-connected nodes found - possible documentation gaps or missing edges._