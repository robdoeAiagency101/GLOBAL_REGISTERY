import json
import csv
import os

INVARIANT = 932808725

def compile_sovereign_bridge():
    print(f"[*] Initializing Sovereign Comprehensive Bridge for Invariant M = {INVARIANT}...")
    
    # 1. Load latest tax ledger record
    tax_entries = []
    if os.path.exists("tax_ledger.csv"):
        with open("tax_ledger.csv", mode='r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                tax_entries.append(row)
                
    # 2. Load registry proof if available
    math_proof = {}
    if os.path.exists("registry_proof.json"):
        with open("registry_proof.json", mode='r', encoding='utf-8') as f:
            math_proof = json.load(f)

    # 3. Construct Master ERC-721 Metadata Payload
    master_metadata = {
        "name": "RobDoe Sovereign Registry - Master State Deed",
        "description": "Unified cryptographic bridge of mathematical proofs, HMRC/ATO tax pooling ledgers, and domain infrastructure anchored to invariant M = 932808725.",
        "image": "ipfs://bafybeigdyrzt5sfp7udm7hu76uh7y26nf3efuylqabf3oclgtqy55fbzdi",
        "attributes": [
            {"trait_type": "System Invariant", "value": INVARIANT},
            {"trait_type": "Total Tax Records", "value": len(tax_entries)},
            {"trait_type": "Math Engine Status", "value": math_proof.get("status", "OPERATIONAL")},
            {"trait_type": "Compliance Framework", "value": "ATO Capital Property / HMRC Section 104"}
        ],
        "tax_ledger_sample": tax_entries[-1] if tax_entries else {},
        "math_proof_summary": {
            "steps_executed": len(math_proof.get("computation_steps", [])),
            "target_wallet": math_proof.get("wallet", "0x84CA4aFC3F395ebc0b519680B546Cd604C9c2018")
        }
    }
    
    output_file = "master_token_metadata.json"
    with open(output_file, "w", encoding='utf-8') as f:
        json.dump(master_metadata, f, indent=4)
        
    print(f"[+] Master bridge compiled successfully: {output_file}")
    print(json.dumps(master_metadata, indent=2))

if __name__ == "__main__":
    compile_sovereign_bridge()
