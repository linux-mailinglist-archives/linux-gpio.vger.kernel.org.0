Return-Path: <linux-gpio+bounces-35143-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEyGNh0k3mk1ngkAu9opvQ
	(envelope-from <linux-gpio+bounces-35143-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 13:25:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A3D3F9474
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 13:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97C8A301C909
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 11:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034FF3D9DB0;
	Tue, 14 Apr 2026 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+zzUVph"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D53168EE;
	Tue, 14 Apr 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776165911; cv=none; b=ise3w0ZVQg5x7ZG123VXTnTR8BSnttBovEzikUWkQSXcdtM9KVz7dezVXk6vq/jXVo9hSIIzgIfmzghMqkQjNIh1+nknsYdjYHGH5aR9+z3MlJ4jWBZFcANrYfGf0RDPiiUuEGwAEbR7JkEqwG1MM1TrOHz3mS2tVQ2HhpBNZxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776165911; c=relaxed/simple;
	bh=h3YBr9Hc1kwJDNaFQDk42AGu7C55cR3ZCxSi64OOvp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oT07b94jNVI0Y1AqwADxfIY4owu746SE6zu28mnJfv0MVibAkr143bTCZ9EbmeWRnRpZGSDd6UCQjLTMqnojWoNOUF/fQdd8VBWPqkmFPu+N49+ypRZ6Syq4IPwc2yTceM+pY2Np1hV+c8hUxFX8rrtlKYamzyfiaAM0E3vsTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+zzUVph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88504C19425;
	Tue, 14 Apr 2026 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776165911;
	bh=h3YBr9Hc1kwJDNaFQDk42AGu7C55cR3ZCxSi64OOvp4=;
	h=From:To:Cc:Subject:Date:From;
	b=J+zzUVphh2htPrvHLn5uCwIveDTjOy4+xC8WHdu+xUKYNd1SoPWb3u6btxT8ll8mb
	 gtSFPLKcHxZggnru2kfk+BrhPXTy68y36A+Hnrr87vQjOthcd60f41DtZ+rcyLyRJI
	 wnuHJqZfsGAWf3kINEGd4ZNEu7Q7GAF+pWtXXmffCdI9D2U+aP8ngjXGXxmfwiwWdf
	 61P8TPCOQfoRU33/N6Wb5iEJXeOGpyVLxcJr0QHkQzv7KoUCY8UEhvm5MyDh/YnwGG
	 3TX88l99AyBBQHWASTzY8BNmiPiHp9eb4iJmOg1rqxU9rPqM4w+fUDcUNol3iD89fS
	 +r5kBSFZYYv+Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	mika.westerberg@linux.intel.com,
	andy@kernel.org,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-5.15] pinctrl: intel: Fix the revision for new features (1kOhm PD, HW debouncer)
Date: Tue, 14 Apr 2026 07:24:57 -0400
Message-ID: <20260414112509.410217-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.12
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35143-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: A7A3D3F9474
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit a4337a24d13e9e3b98a113e71d6b80dc5ed5f8c4 ]

The 1kOhm pull down and hardware debouncer are features of the revision 0.92
of the Chassis specification. Fix that in the code accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a thorough analysis. Let me
compile the findings.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `pinctrl: intel:`
- Action verb: "Fix" — explicitly a bug fix
- Summary: Corrects the hardware revision threshold for enabling 1kOhm
  pull-down and hardware debouncer features.
- Record: [pinctrl/intel] [Fix] [Corrects revision check from 0x94 to
  0x92 for debounce/1K_PD features]

**Step 1.2: Tags**
- Signed-off-by: Andy Shevchenko — the primary Intel pinctrl maintainer
  and long-time contributor
- No Fixes: tag (expected — that's why we're reviewing)
- No Reported-by, no Tested-by, no Reviewed-by, no Link: tag
- No Cc: stable
- Record: Only author SOB. Andy Shevchenko is the subsystem expert.

**Step 1.3: Commit Body**
- States that 1kOhm pull-down and hardware debouncer are features of
  revision 0.92 of the Chassis specification.
- The code incorrectly used 0x94 as the threshold. Fix changes it to
  0x92.
- No stack traces, no user reports, no reproduction steps.
- Record: [Bug: wrong revision threshold prevents hardware features from
  being enabled on rev 0x92-0x93 hardware] [Symptom: debounce and 1kOhm
  PD features not available on qualifying hardware] [Root cause:
  incorrect magic number in revision comparison]

**Step 1.4: Hidden Bug Fix Detection**
- This is explicitly labeled "Fix" — not hidden. However, the
  implications are deeper than just "features not enabled" (see Phase
  2).
- Record: Explicit fix, not disguised.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `drivers/pinctrl/intel/pinctrl-intel.c`
- 1 line changed: `0x94` → `0x92`
- Function: `intel_pinctrl_probe()`
- Scope: Single-character surgical fix
- Record: [1 file, 1 line, +1/-1] [intel_pinctrl_probe()] [Minimal
  surgical fix]

**Step 2.2: Code Flow Change**
- Before: Features (DEBOUNCE + 1K_PD) enabled only for revision >= 0x94
- After: Features enabled for revision >= 0x92
- This expands the set of hardware revisions that get these features —
  specifically adds 0x92 and 0x93.
- Record: [Revision threshold lowered from 0x94 to 0x92, enabling
  features on additional hardware revisions]

**Step 2.3: Bug Mechanism**
This is critically important. `PINCTRL_FEATURE_DEBOUNCE` affects pad
register stride calculation in `intel_get_padcfg()` (line 190):
```c
nregs = (community->features & PINCTRL_FEATURE_DEBOUNCE) ? 4 : 2;
return community->pad_regs + reg + padno * nregs * 4;
```

If hardware has revision 0x92/0x93 with 4 registers per pad (PADCFG0-3),
but the driver thinks there are only 2 (because feature not detected),
the register stride is wrong:
- Driver uses stride of 8 bytes (2 × 4) instead of 16 bytes (4 × 4)
- Pad N would be accessed at offset N×8 instead of N×16
- For N>0, ALL pad register accesses hit the WRONG hardware registers

This means: GPIO configuration, interrupt setup, pull-up/down, and
debounce for EVERY pin except pin 0 would read/write incorrect
registers.

Additionally, `PINCTRL_FEATURE_1K_PD` gates availability of 833Ω and 1kΩ
pull-down values (lines 653, 658, 815, 820).

- Record: [Bug category: incorrect hardware detection → wrong register
  stride] [Mechanism: revision threshold too high causes wrong nregs
  calculation, corrupting all pad register accesses on affected
  hardware]

**Step 2.4: Fix Quality**
- Obviously correct: the specification says 0.92, code had 0.94. One-
  character change.
- Minimal and surgical.
- Regression risk: effectively zero for hardware ≥0x94 (no change). For
  hardware 0x92-0x93, this ENABLES correct behavior.
- Record: [Obviously correct, minimal, no regression risk for existing
  working hardware]

## PHASE 3: GIT HISTORY

**Step 3.1: Blame**
- The buggy line (0x94) was introduced by commit `998c49e8f8b7c9`
  ("pinctrl: intel: Drop unnecessary check for predefined features") in
  v5.12-rc1, which was a refactoring of the original code.
- The original 0x94 value came from `e57725eabf87c` ("pinctrl: intel:
  Add support for hardware debouncer") in v4.11-rc1.
- The 0x94 value has been wrong since v4.11 (~2017).
- Record: [Buggy value from v4.11 (commit e57725eabf87c), refactored in
  v5.12 (998c49e8f8b7c9). Bug present for ~9 years.]

**Step 3.2: Fixes tag** — Not present. Expected.

**Step 3.3: File History** — No closely related fixes. The file has
ongoing development but nothing directly related to this revision check.

**Step 3.4: Author** — Andy Shevchenko is the primary Intel pinctrl
maintainer with dozens of commits in this subsystem. Very high
authority.

**Step 3.5: Dependencies** — None. This is a standalone one-character
fix.

## PHASE 4: MAILING LIST RESEARCH

The background agent found:
- There was a patch series with this fix. A v2 was submitted, suggesting
  review feedback was received.
- Andy Shevchenko identified a related bug in the broader series.
- No explicit stable nomination found.
- Record: [Patch went through review, v2 submitted. No explicit stable
  request found.]

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Key Functions**
- `intel_pinctrl_probe()` — the probe function, called during driver
  initialization for every Intel pinctrl community.

**Step 5.2: Callers**
- `intel_pinctrl_probe()` is called by every Intel pinctrl platform
  driver (there are many: Tiger Lake, Alder Lake, Raptor Lake, Meteor
  Lake, etc.). This is the core probe path for ALL Intel GPIO
  controllers.

**Step 5.3: Impact of DEBOUNCE flag**
- `intel_get_padcfg()` — used extensively for ALL pad register access.
  If stride is wrong, every GPIO operation is broken.
- 1K_PD feature gates pull-down resistance values in pin configuration.

**Step 5.4: Reachability**
- The probe path is triggered during boot for every Intel platform with
  GPIO controllers. This is core infrastructure.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Code exists in stable trees**
- Verified: `0x94` value exists in v6.6 (line 1585) and v5.15 (line
  1502).
- The buggy code exists in ALL active stable trees since the bug is from
  v4.11.

**Step 6.2: Backport Complications**
- The patch should apply cleanly — it's a single character change in a
  line that hasn't changed since v5.12, and the surrounding context is
  stable.

**Step 6.3: No related fixes already in stable**

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1:**
- Subsystem: drivers/pinctrl/intel — Intel GPIO/pinctrl
- Criticality: IMPORTANT — Intel GPIO controllers are used on virtually
  all Intel platforms (laptops, desktops, servers with Intel chipsets)
- Record: [IMPORTANT subsystem — affects all Intel platforms with
  affected GPIO controller revisions]

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Affected Users**
- Users with Intel hardware whose GPIO controller reports revision 0x92
  or 0x93. Specific platforms unknown but this is Intel mainstream
  hardware.

**Step 8.2: Trigger Conditions**
- Triggered at boot during driver probe. If hardware has revision
  0x92-0x93, the bug is always present.

**Step 8.3: Failure Mode Severity**
- On affected hardware: wrong register stride means all GPIO pad
  accesses (except pad 0) hit wrong registers → incorrect GPIO behavior,
  broken interrupts, broken pin configuration. Severity: HIGH (hardware
  malfunction, potential for data corruption via incorrect GPIO states).

**Step 8.4: Risk-Benefit**
- BENEFIT: Fixes potentially serious register access errors on affected
  Intel hardware. HIGH.
- RISK: One character change, obviously correct per specification. VERY
  LOW.
- Ratio: Strongly favorable.

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
1. One-character fix — minimal scope, obviously correct
2. From subsystem maintainer (Andy Shevchenko)
3. Corrects objectively wrong value per hardware specification (0.92 vs
   0.94)
4. PINCTRL_FEATURE_DEBOUNCE affects pad register stride calculation —
   wrong stride means ALL pad register accesses are corrupted on
   affected hardware
5. Bug present since v4.11, affects all stable trees
6. Applies cleanly to all stable trees
7. No dependencies on other patches
8. Similar in nature to hardware quirk/device ID fixes (enabling correct
   behavior for specific hardware)

**Evidence AGAINST backporting:**
1. No user reports of the issue (no Reported-by)
2. No Fixes: tag
3. Unknown if real hardware with revision 0x92-0x93 exists in the wild
4. Has been wrong since 2017 without complaints

**Stable Rules Checklist:**
1. Obviously correct? YES — spec says 0.92, code had 0.94
2. Fixes real bug? YES — wrong register stride on affected hardware
3. Important issue? YES — corrupts all GPIO register accesses on
   affected hardware
4. Small and contained? YES — 1 character, 1 file
5. No new features? CORRECT — no new features, enables existing features
   on qualifying hardware
6. Can apply to stable? YES — clean apply expected

## Verification

- [Phase 1] Parsed subject: "Fix" verb, pinctrl/intel subsystem,
  revision threshold correction
- [Phase 1] Tags: only author SOB (Andy Shevchenko). No Fixes/Reported-
  by/Cc:stable (expected)
- [Phase 2] Diff: single character change 0x94→0x92 in
  intel_pinctrl_probe(), line 1613
- [Phase 2] Code impact: verified PINCTRL_FEATURE_DEBOUNCE controls
  nregs (2 vs 4) at line 190, affecting pad register stride
- [Phase 2] 1K_PD feature gates pull-down values at lines 653, 658, 815,
  820
- [Phase 3] git blame: 0x94 value from commit 998c49e8f8b7c9 (v5.12),
  originally from e57725eabf87c (v4.11)
- [Phase 3] git describe: original commit in v4.11-rc1, refactored
  commit in v5.12-rc1
- [Phase 3] Author: Andy Shevchenko has dozens of commits in
  drivers/pinctrl/intel/ — confirmed subsystem maintainer
- [Phase 4] Lore search: patch went through review, v2 submitted. No
  explicit stable nomination found.
- [Phase 5] intel_get_padcfg() uses DEBOUNCE feature flag for stride;
  wrong stride corrupts all pad accesses for padno > 0
- [Phase 6] Verified 0x94 exists in v6.6 (line 1585) and v5.15 (line
  1502) — present in all active stable trees
- [Phase 6] Clean apply expected — single character in unchanged context
- UNVERIFIED: Whether real hardware with revision 0x92 or 0x93 actually
  exists in the field (no user reports confirm this)

The fix is a trivially correct one-character correction from the
subsystem maintainer, fixing a wrong hardware revision threshold that
has been wrong since v4.11. On affected hardware (if revision 0x92-0x93
exists), the consequences are severe: incorrect register stride causes
ALL GPIO pad register accesses to hit wrong addresses. The risk of the
fix is essentially zero.

**YES**

 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index cf9db8ac0f42e..106835b5ee5a5 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1610,7 +1610,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 		value = readl(regs + REVID);
 		if (value == ~0u)
 			return -ENODEV;
-		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
+		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x92) {
 			community->features |= PINCTRL_FEATURE_DEBOUNCE;
 			community->features |= PINCTRL_FEATURE_1K_PD;
 		}
-- 
2.53.0


