#!/usr/bin/env python3
import sys
import json
import time

INVARIANT = 932808725
TARGET_WALLET = "0x84CA4aFC3F395ebc0b519680B546Cd604C9c2018"
DOMAIN = "robdoe.com"

def run_recursive_engine(steps=10):
    print(f"[*] Initializing Sovereign Recursive Math Engine...")
    print(f"[*] System Invariant M: {INVARIANT}")
    print(f"[*] Target Wallet: {TARGET_WALLET}")
    print(f"[*] Domain Anchor: {DOMAIN}")
    
    z = complex(0, 0)
    c = complex(INVARIANT % 1000 / 1000.0, (INVARIANT // 1000) % 1000 / 1000.0)
    
    results = []
    for i in range(1, steps + 1):
        z = z**2 + c
        magnitude = abs(z)
        state_hash = (INVARIANT * i) ^ int(magnitude * 1e6)
        results.append({
            "step": i,
            "z_real": z.real,
            "z_imag": z.imag,
            "magnitude": magnitude,
            "state_hash": state_hash
        })
        print(f"    [Step {i}] Z = {z:.4f} | Magnitude: {magnitude:.4f} | State Hash: {state_hash}")
        
    registry_record = {
        "invariant": INVARIANT,
        "wallet": TARGET_WALLET,
        "domain": DOMAIN,
        "status": "OPERATIONAL",
        "timestamp": time.time(),
        "computation_steps": results
    }
    
    with open("registry_proof.json", "w") as f:
        json.dump(registry_record, f, indent=2)
        
    print(f"[+] Recursive Math Engine executed successfully. Proof written to registry_proof.json.")

if __name__ == "__main__":
    run_recursive_engine()
