Return-Path: <linux-gpio+bounces-35268-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD0pNFE75mmatgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35268-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:42:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415D42D5AC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 131A1300B3F7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E9240FDB4;
	Mon, 20 Apr 2026 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsnPCARC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78E40F8E4;
	Mon, 20 Apr 2026 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691640; cv=none; b=W7xKS8NqnVQ9gFCJDjItaKrQnvt8Wbg1Sx9hMf8W26rTn8AkpY7QyfJjCSg+zrtR35aaP9E+y3iV/FMfD9NdETAk5TyinU7q14kxdTiUt0yaJ88SmC+Y+7JrJcHCxcPjXwX3DqqxA75tdJnH+0Sb5tEueG3/zz7HozeaDou49JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691640; c=relaxed/simple;
	bh=CPsXeg1Q9d1VEn2dQOJBxmAMy/iazXITNvkbYYEgFNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLnIzPiJfYUKdHbPfc53mpf08YOUH8o/9TNONqK7TScGajGasQjvMHe7ulMIJ73EP3TQNWRYCxikm6VRWgBf7lf8kazyXdSD9kMRoRFOj9T90O8+U+S2hVpg+ZMUcbvwS2O4ROPcjRHomyFghocRcM25elePYVor1/x3yA2rT1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsnPCARC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0426C2BCB7;
	Mon, 20 Apr 2026 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691640;
	bh=CPsXeg1Q9d1VEn2dQOJBxmAMy/iazXITNvkbYYEgFNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tsnPCARC8cTuaHvuBPF2iPI1wbog/CTYqmazZmfbiCqejzTjJKFq0aMpxEFIq39iw
	 srrBpqatOAYSmjwwz+cQv/Doxozw5TQ2ugOeBvwlwT6+ukFNIEzKOuFVc304vSLr+H
	 5YqMEYZejAjcDQ3tJWfw3Xi/ziSdIRtz01ga5LBjS0FH+SYRZQCkRNAyXxG4dIJtWw
	 YfFS4JAT5EN/IP9ODzQP4NLbP7kCWBuiJsiT0QsZgVNqjo6Zv9pfmLC4XBVg+Fn5ms
	 aTea+Y9vo4/u1IErVcL2oC7IgUPJrTlARblMk5ds7t3PuD7Q9iH1ZvkRfCRfMESwee
	 Y5/ZOyOwoNxTQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Shyam-sundar.S-k@amd.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] pinctrl: amd: Support new ACPI ID AMDI0033
Date: Mon, 20 Apr 2026 09:19:01 -0400
Message-ID: <20260420132314.1023554-147-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
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
	TAGGED_FROM(0.00)[bounces-35268-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5415D42D5AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

[ Upstream commit 127e98c05c46654867faf5f578cb56d375b89092 ]

Add AMDI0033 to the AMD GPIO ACPI match table.
This lets the driver bind on new AMD platforms that expose this HID.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis Walkthrough

### PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line Parse**
Record: Subsystem `pinctrl: amd:`; action verb `Support` (effectively
"add"); summary: adds new ACPI HID `AMDI0033` to the AMD GPIO ACPI match
table.

**Step 1.2: Commit Message Tags**
Record: Tags present:
- `Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>` (AMD
  vendor author)
- `Signed-off-by: Linus Walleij <linusw@kernel.org>` (pinctrl subsystem
  maintainer)
- No `Fixes:`, no `Cc: stable`, no `Reported-by:`, no `Link:` — absence
  is expected for a review candidate.

**Step 1.3: Commit Body**
Record: Body states `Add AMDI0033 to the AMD GPIO ACPI match table. This
lets the driver bind on new AMD platforms that expose this HID.` No
stack traces, no crash symptoms — this is a hardware enablement patch,
not a crash fix.

**Step 1.4: Hidden Bug Fix?**
Record: Not a hidden bug fix. It is an explicit hardware-enablement (new
device ID) addition. Falls into the stable exception "NEW DEVICE IDs".

### PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
Record: 1 file modified, `drivers/pinctrl/pinctrl-amd.c`, +1/-0. Scope:
single-line addition inside `amd_gpio_acpi_match[]`. No functions
modified.

**Step 2.2: Code Flow Change**
Record: Before, the `acpi_device_id` table had `AMD0030`, `AMDI0030`,
`AMDI0031`. After, `AMDI0033` is an additional entry. With this change
the `amd_gpio` platform driver will match/bind on ACPI devices whose
`_HID` is `AMDI0033`.

**Step 2.3: Bug Mechanism Category**
Record: Category (h) — Hardware workaround / device ID addition. No
locking, no refcount, no error path, no memory safety change.

**Step 2.4: Fix Quality**
Record: Obviously correct. Identical in pattern to the 2021 `AMDI0031`
addition (commit `1ca46d3e43569`) and 2016 `AMDI0030` addition (commit
`42a44402ecb78`). Cannot regress existing platforms because adding an
entry to an ACPI match table only expands which devices bind; it does
not change behavior for existing IDs. Zero regression risk for systems
lacking `AMDI0033`.

### PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
Record: `git blame` on lines 1273–1280 shows the table was introduced in
`dbad75dd1f25e0` (Ken Xue, 2015). Prior ID additions:
- `AMDI0030` in `42a44402ecb78` (2016)
- `AMDI0031` in `1ca46d3e43569` (2021)
Both precedents for the same kind of change, and both the driver and its
ACPI table have existed since v4.1-era.

**Step 3.2: Fixes: tag**
Record: No `Fixes:` tag — N/A. This is not a bug fix commit.

**Step 3.3: Related Recent Changes**
Record: `git log --oneline -5 -- drivers/pinctrl/pinctrl-amd.c` shows
benign recent churn (header cleanup, IRQ hwirq access, PM debug
messages, treewide rename). No prerequisite refactor touches
`amd_gpio_acpi_match[]`.

**Step 3.4: Author**
Record: Basavaraj Natikar is an AMD engineer with a long history of AMD
pinctrl/platform fixes (`git log --author=Basavaraj` shows many prior
AMD pinctrl commits). The co-SoB is Linus Walleij, the pinctrl
maintainer. Both strong credibility signals.

**Step 3.5: Prerequisites**
Record: None. The match array already exists; only adds one entry.
Stands alone. Patch applies literally to the file's existing structure.

### PHASE 4: MAILING LIST RESEARCH

**Step 4.1 / 4.2: b4 dig results**
Record: `b4 dig -c 127e98c05c466` located the submission at `https://lor
e.kernel.org/all/20260327050616.3816318-1-Basavaraj.Natikar@amd.com/` (a
RESEND of the initial post). `b4 dig -a` shows only a single series
version (v1 / RESEND). `b4 dig -w` shows recipients: Basavaraj Natikar,
Shyam-sundar.S-k@amd.com (AMD), Linus Walleij (maintainer), `linux-
gpio@vger.kernel.org`. All appropriate people were included; the pinctrl
maintainer signed it off.

Note: Lore requires interactive JS (Anubis); direct WebFetch was blocked
so I could not read thread replies. Based on the patch having only a
RESEND (no revisions) and being applied by the maintainer via his own
SoB, there is no evidence of objections. UNVERIFIED: exact thread reply
content.

**Step 4.3 / 4.4 / 4.5**
Record: No Reported-by/Link tags; no bug report to follow. Not part of a
larger dependent series (single-patch submission). No prior stable
discussion — N/A for a trivial ID add.

### PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1–5.5**
Record: The modified entity is a data table, not a function. Impact
surface: the ACPI subsystem's platform-bus matcher reads this table at
driver registration to decide which ACPI devices the `amd_gpio` platform
driver probes. Adding an entry makes exactly one additional HID
(`AMDI0033`) bind to `amd_gpio_probe()`. Existing ID behavior is
unchanged. No other code needs updating; no quirks table search turned
up `AMDI0033` (Grep found the new ID only in `pinctrl-amd.c`).

### PHASE 6: STABLE TREE CROSS-REFERENCING

**Step 6.1: Does the code exist in stable?**
Record: The AMD pinctrl driver and its ACPI match table have existed
since 2015. Every active stable tree (5.4, 5.10, 5.15, 6.1, 6.6, 6.12,
6.17) contains `amd_gpio_acpi_match[]`. Adding one more entry applies
trivially.

**Step 6.2: Backport Complications**
Record: Clean apply expected across all active stable trees. The context
lines (`AMD0030`, `AMDI0030`, `AMDI0031` entries) are present in every
stable tree that contains the driver.

**Step 6.3: Related fixes already in stable?**
Record: No — this ID is genuinely new. Not a duplicate of anything.

### PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1: Subsystem**
Record: `drivers/pinctrl/pinctrl-amd.c` — AMD GPIO/pinctrl driver used
on essentially all modern AMD client platforms (laptops/desktops).
Criticality: IMPORTANT — without this binding, GPIO-driven devices
(trackpads, PM controls, power buttons, wake sources) on affected AMD
systems may not work, and wake-from-suspend can regress.

**Step 7.2: Activity**
Record: Actively maintained; regular but modest activity. New ACPI HIDs
appear every few years as AMD rolls out new platform silicon.

### PHASE 8: IMPACT AND RISK

**Step 8.1: Who's affected**
Record: Users of new AMD platforms (SoCs/APUs) whose firmware exposes
GPIO with `_HID "AMDI0033"`. Without this patch, the `amd_gpio` driver
never binds → no pinctrl/GPIO, and anything depending on it (e.g., I2C
HID trackpads routed through AMD GPIO interrupts, wake-on-GPIO) fails.

**Step 8.2: Trigger**
Record: Triggered at every boot on affected hardware. Extremely
deterministic — it's simply whether the driver binds or not.

**Step 8.3: Failure Mode Severity**
Record: Without the patch: non-functional input/power/wake peripherals
on new AMD platforms. Not a crash, but a severe hardware-enablement
functional regression (no keyboard/trackpad/wake). Severity HIGH for
affected users.

**Step 8.4: Risk-Benefit**
Record: BENEFIT: high for owners of new AMD hardware that lands on
stable kernels. RISK: near-zero — adding an ACPI match entry cannot
break existing hardware, cannot introduce UAF/locking/corruption, and
the driver's probe path is unchanged. This is the textbook safe stable
exception.

### PHASE 9: SYNTHESIS

**Step 9.1: Evidence**
For: Exactly matches the explicit stable exception "NEW DEVICE IDs —
trivial one-line additions to existing drivers that enable hardware
support." One-line addition. Maintainer SoB. Vendor author. Long-
established driver. Prior precedent `AMDI0031` was added the same way.
Clean apply.
Against: None of substance. No Fixes:/Cc: stable (expected for review
candidates, not a negative signal per the criteria).
Unresolved: Could not read lore thread replies directly due to Anubis.

**Step 9.2: Stable Rules**
1. Obviously correct and tested? Yes — trivial table entry, in mainline
   under the maintainer.
2. Fixes real issue? Yes — enables hardware that otherwise won't work.
3. Important? Yes — GPIO/pinctrl is foundational for input/power/wake on
   affected AMD systems.
4. Small and contained? Yes — +1 line in one file.
5. New feature or API? No — no new API, no new uapi.
6. Applies to stable? Yes — context is ancient and unchanged.

**Step 9.3: Exception Category**
Hits the "NEW DEVICE IDs" exception explicitly.

**Step 9.4: Decision**
Classic stable-worthy one-line ACPI ID add to an existing, mature
driver. Risk is near zero; benefit is real hardware enablement on new
AMD platforms.

## Verification

- [Phase 1] Read commit subject, body, and tags; confirmed no Fixes:/Cc:
  stable/Reported-by/Link tags; two SoBs (AMD author + pinctrl
  maintainer Linus Walleij).
- [Phase 2] Read the diff: single entry `{ "AMDI0033", 0},` appended
  between `AMDI0031` and terminator in `amd_gpio_acpi_match[]` in
  `drivers/pinctrl/pinctrl-amd.c` (lines ~1273–1278). Confirmed no
  function body changes.
- [Phase 2] Read `drivers/pinctrl/pinctrl-amd.c` lines 1270–1298 to
  confirm context and that `MODULE_DEVICE_TABLE(acpi, ...)` is
  unchanged.
- [Phase 3] `git blame drivers/pinctrl/pinctrl-amd.c -L 1273,1280`:
  table introduced by `dbad75dd1f25e0` (Ken Xue, 2015); `AMDI0030` added
  by `42a44402ecb78` (2016); `AMDI0031` added by `1ca46d3e43569` (2021).
  Confirms long-standing driver and precedent for the same kind of
  change.
- [Phase 3] `git log --oneline -5 -- drivers/pinctrl/pinctrl-amd.c`:
  recent churn is benign and unrelated to the match table.
- [Phase 3] `git log --oneline --author="Basavaraj" -10 --
  drivers/pinctrl/pinctrl-amd.c`: author has a substantive history of
  AMD pinctrl commits — established AMD platform engineer.
- [Phase 4] `b4 dig -c 127e98c05c466`: matched by patch-id; URL `https:/
  /lore.kernel.org/all/20260327050616.3816318-1-
  Basavaraj.Natikar@amd.com/`.
- [Phase 4] `b4 dig -c 127e98c05c466 -a`: only a single revision (v1 /
  RESEND); no evolution from reviewer feedback.
- [Phase 4] `b4 dig -c 127e98c05c466 -w`: original recipients included
  Linus Walleij (maintainer), linux-gpio list, and AMD reviewers —
  appropriate coverage.
- [Phase 5] Grep for `AMDI003[0-9]` across the tree: new ID occurs only
  in `drivers/pinctrl/pinctrl-amd.c`; existing `AMDI0030` references in
  `drivers/gpio/gpiolib-acpi-quirks.c` are quirk entries not dependent
  on this patch.
- [Phase 6] Confirmed by blame that the `amd_gpio_acpi_match[]` array
  structure has existed since 2015, so context applies cleanly to all
  active stable trees.
- [Phase 8] Impact reasoning is based on how ACPI platform driver
  binding works generically (match table controls probe); no user-bug-
  report was needed because the change is a pure hardware-enablement
  addition.
- UNVERIFIED: I could not directly read replies on the lore thread
  because lore.kernel.org is currently gated by Anubis anti-bot; however
  `b4 dig -a` showed no later revisions, and the maintainer's SoB on the
  committed patch indicates no unresolved objections.
- UNVERIFIED: I did not enumerate every stable branch's exact file state
  because this is a workspace-only checkout; however, since all
  preceding IDs (`AMDI0030`, `AMDI0031`) have been present since 2016
  and 2021 respectively and the match-table block has not been
  restructured, clean apply is expected on 5.4+.

This commit is a textbook stable exception: a trivial one-line ACPI
device ID addition to an existing, widely-used driver, authored by the
hardware vendor and signed off by the subsystem maintainer. Risk is
effectively zero; benefit is enabling GPIO/pinctrl on new AMD platforms
that would otherwise be non-functional.

**YES**

 drivers/pinctrl/pinctrl-amd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2af94ef564342..e3128b0045d22 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -1274,6 +1274,7 @@ static const struct acpi_device_id amd_gpio_acpi_match[] = {
 	{ "AMD0030", 0 },
 	{ "AMDI0030", 0},
 	{ "AMDI0031", 0},
+	{ "AMDI0033", 0},
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
-- 
2.53.0


