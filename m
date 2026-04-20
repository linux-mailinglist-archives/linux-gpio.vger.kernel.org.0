Return-Path: <linux-gpio+bounces-35263-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEDFIAos5mliswEAu9opvQ
	(envelope-from <linux-gpio+bounces-35263-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:37:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3185F42C0E5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B402631302E4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 13:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DEB3C3456;
	Mon, 20 Apr 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CY2JTM3A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565D53C345F;
	Mon, 20 Apr 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691051; cv=none; b=a3+hsCfDgAlTeiF2Q/+hHQLLztW1iKKKMn09b5+kzEZd+ifH+ec93ILgpnuKQefnmoJ8WyM8UzHiTpBjsiw65AbHjXpUue6Us4Azr2X38/QfOe/VyhJeV+1pOPCO3GbtUrwcQ9f9pLaCMQkn6jE7HysOuIFG5cSSdUBkz2LM1BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691051; c=relaxed/simple;
	bh=7X5Udci/GbMjq5DiV3vyaQVZSRriOrN3RQrkmmC9Xzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A1lM51Z/F8lsGZ6bEGuns2w9e1lGnAVJiI/KfdeOu1yIwijMOZ10V3M3n0MF6EtLmMztAodEjxaas98xMA3VAWQoNo3ZKe/N91TMotGes39xm8T1feKKW0px0nNfOxYxZ7E1aejN60C9BEAi85s22Hpdp1DLv+hcyw85kKqD0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CY2JTM3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E722C2BCB6;
	Mon, 20 Apr 2026 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691051;
	bh=7X5Udci/GbMjq5DiV3vyaQVZSRriOrN3RQrkmmC9Xzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CY2JTM3A0q6zNKhtzVKqVxlC2vnlz9TfG5ODaZzvva4ii9ao4z2GIDxJvb5W2TH9v
	 ypdpv0siYJ5MRsTgF3eKO6RIPN6OKSO4u/Y9Me0uFIzjkZ6yCxDFC9el0XmHGWOCEN
	 DcVwvoGo3B1gDoH1LR6kwxa0U0qhWB7K/VSPQzyGltZa7gkyLt26Z9Ao+wMtPecAVu
	 UwpNlI93DfKpLFwy5pJvdZTMb5rVrAS1XDHr/h5JVUBQo3tOicri3ekWoMZ/J9o19x
	 2D5japPl3tShjnYoYawIMgpsP7LUxyxmuGxtErRvi1icEdOaqaFLf41InY6eGQ+8T/
	 3xx4Dq35R+Ksg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	thomas.richard@bootlin.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] gpio: cgbc: normalize return value of gpio_get
Date: Mon, 20 Apr 2026 09:08:51 -0400
Message-ID: <20260420131539.986432-65-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
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
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,bootlin.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35263-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 3185F42C0E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit 49621f1c97788216f2f10f1a9e903f216e289f5d ]

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by cgbc_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://patch.msgid.link/20260218190657.2974723-2-dmitry.torokhov@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a complete analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `gpio: cgbc:`
- Action verb: "normalize" (implies correcting incorrect behavior)
- Summary: Normalizes the return value of the GPIO get callback to the
  [0, 1] range

**Step 1.2: Tags**
- `Signed-off-by: Dmitry Torokhov` - author, prolific kernel/input/GPIO
  contributor
- `Link:` to lore patch submission
- `Signed-off-by: Bartosz Golaszewski` - GPIO subsystem maintainer who
  applied it
- No `Fixes:` tag, no `Cc: stable` tag (but sibling patches in the same
  series DO have these tags)

**Step 1.3: Commit Body**
- Clearly states the API contract: GPIO get callback must return 0, 1,
  or negative error
- States the driver violates this by returning non-normalized values
  (e.g., 2, 4, 8, etc.)
- The fix "normalizes" to [0, 1]

**Step 1.4: Hidden Bug Fix Detection**
- YES - this is a bug fix. The driver violates the gpio_chip API
  contract. With the gpiolib sanitization commit (86ef402d805d) present
  in v6.15+, this violation causes either `-EBADE` errors or runtime
  warnings.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `drivers/gpio/gpio-cgbc.c`
- 2 lines removed, 2 lines added (net 0 change)
- Function modified: `cgbc_gpio_get()`
- Scope: single-file, single-function surgical fix

**Step 2.2: Code Flow Change**
- BEFORE: `return (int)(val & (u8)BIT(offset));` — returns the raw bit
  value (could be 1, 2, 4, 8, 16, 32, 64, 128)
- AFTER: `return !!(val & BIT(offset));` — returns 0 or 1
- Also removes unnecessary `else` after `return ret`

**Step 2.3: Bug Mechanism**
- Category: Logic/correctness fix (API contract violation)
- The `BIT(offset)` for offset > 0 yields values > 1 (BIT(1)=2,
  BIT(2)=4, etc.)
- The old code masks `val` with `BIT(offset)`, returning the bit's
  position value rather than 0/1
- With gpiolib sanitize (86ef402d805d in v6.15+), returning values > 1
  triggers `-EBADE` or a warning

**Step 2.4: Fix Quality**
- Obviously correct: `!!` is the standard C idiom for boolean
  normalization
- Minimal/surgical: 2-line change in a single function
- Zero regression risk: `!!` can only produce 0 or 1, which is exactly
  what's expected
- The fix is identical in pattern to all 6 other patches in the series

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
- The buggy `return (int)(val & (u8)BIT(offset))` line was introduced by
  commit `4342bf63b64b0` (Thomas Richard, 2024-10-01) when the cgbc GPIO
  driver was first created in v6.13-rc1.

**Step 3.2: Fixes Target**
- The commit doesn't have a `Fixes:` tag, but the sibling patches
  reference `Fixes: 86ef402d805d ("gpiolib: sanitize the return value of
  gpio_chip::get()")`, which was added in v6.15-rc1.

**Step 3.3: Related Changes**
- This is part of a 7-patch series by Dmitry Torokhov, all normalizing
  gpio_get return values across different drivers.
- The gpiolib core workaround (ec2cceadfae72) landed in v7.0-rc2, adding
  normalization + warning in gpiolib itself.
- The cgbc_gpio_get function has been unchanged since its creation — no
  conflicting changes.

**Step 3.4: Author**
- Dmitry Torokhov is a highly respected kernel developer (input
  subsystem maintainer, Google). He reported the problem with the
  gpiolib sanitize commit and contributed the driver-side fixes.

**Step 3.5: Dependencies**
- The fix touches only `cgbc_gpio_get()` which is unchanged since the
  driver was created. No dependencies on any other patches.
- The diff applies cleanly to any tree containing the cgbc driver
  (v6.13+).

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1: Original Patch Discussion**
- Patch 2/7 in series `[PATCH 1/7] gpio: bd9571mwv: normalize return
  value of gpio_get`
- 11 messages in thread. Applied by Bartosz Golaszewski (GPIO
  maintainer).
- Discussion revealed Dmitry recommended reverting 86ef402d805d for
  stable but keeping it for 7.0. Bartosz instead sent ec2cceadfae72 to
  normalize in gpiolib core (with `Cc: stable`).

**Step 4.2: Reviewers**
- Applied directly by Bartosz Golaszewski (GPIO subsystem maintainer)
- No explicit Reviewed-by on the cgbc patch, but the entire series was
  applied together

**Step 4.3-4.5: Bug Context**
- The underlying issue is well-documented: commit 86ef402d805d broke
  many GPIO drivers that returned non-normalized values. The cgbc driver
  is one of them.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1-5.4: Function Analysis**
- `cgbc_gpio_get()` is the `.get` callback for the cgbc GPIO chip,
  assigned at probe time (line 173)
- It's called by gpiolib core (`gpiochip_get()`) whenever any consumer
  reads this GPIO
- For Congatec Board Controller GPIO, this affects 14 GPIO pins (pins
  0-13)
- Pins with offset > 0 would return values > 1, triggering the bug

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Code Existence in Stable**
- cgbc driver: exists in v6.13+ stable trees
- gpiolib sanitize (86ef402d805d): exists in v6.15+ stable trees
- gpiolib normalize workaround (ec2cceadfae72, `Cc: stable`): exists in
  v7.0, will be backported to v6.15+

**Step 6.2: Backport Complexity**
- The `cgbc_gpio_get()` function is IDENTICAL in all stable trees from
  v6.13 onwards
- The patch applies cleanly to any tree with the cgbc driver

**Step 6.3: Impact Matrix**
- **v6.13-v6.14 stable**: Driver exists, sanitize check absent. Bug is
  latent (no user-visible effect since gpiolib didn't check). Low
  priority.
- **v6.15+ stable**: Driver AND sanitize check exist. Without
  ec2cceadfae72: driver returns `-EBADE` for pins > 0 (broken!). With
  ec2cceadfae72 but without this fix: driver works but triggers a
  warning on every `gpio_get` for pins 1-13.

## PHASE 7: SUBSYSTEM CONTEXT

- Subsystem: GPIO (`drivers/gpio/`) - IMPORTANT, used by many
  embedded/SBC platforms
- The Congatec Board Controller is used in embedded industrial computing
- Criticality: PERIPHERAL (specific hardware), but users of this
  hardware depend on it

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Affected Users**
- Users of Congatec Board Controller hardware with GPIO

**Step 8.2: Trigger Conditions**
- Any read of GPIO pins 1-13 (offset > 0) triggers the bug
- This is a normal operation path, not an edge case

**Step 8.3: Failure Severity**
- Without gpiolib workaround: GPIO reads return error (-EBADE) for most
  pins → MEDIUM-HIGH (driver broken)
- With gpiolib workaround: Warning emitted on every read → LOW-MEDIUM
  (functional but noisy)

**Step 8.4: Risk-Benefit**
- BENEFIT: Fixes incorrect driver behavior, eliminates runtime warnings,
  prevents potential breakage
- RISK: Virtually zero — `!!` normalization is trivially correct
- RATIO: Very favorable

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
1. Fixes a real API contract violation that causes warnings or errors in
   v6.15+ trees
2. 2-line change, trivially correct (`!!` normalization)
3. Sibling patches in the same series have `Fixes:` and `Cc: stable`
   tags
4. Applied by GPIO subsystem maintainer
5. Author is a top-tier kernel developer
6. Zero regression risk
7. Clean apply to all stable trees containing the driver

**Evidence AGAINST backporting:**
1. The gpiolib core workaround (ec2cceadfae72) already handles this at
   the framework level
2. No explicit `Fixes:` or `Cc: stable` on this specific patch
3. For v6.13-v6.14 where the sanitize check doesn't exist, the bug is
   latent

**Stable Rules Checklist:**
1. Obviously correct? YES — `!!` is trivially correct
2. Fixes a real bug? YES — API violation causing errors/warnings
3. Important issue? MEDIUM — driver broken or warning-spewing without
   fix
4. Small and contained? YES — 2 lines in 1 function
5. No new features? Correct — pure bug fix
6. Applies to stable? YES — cleanly

## Verification

- [Phase 1] Parsed tags: Signed-off-by Dmitry Torokhov and Bartosz
  Golaszewski, Link to patch submission
- [Phase 2] Diff analysis: 2 lines changed in `cgbc_gpio_get()`,
  `(int)(val & (u8)BIT(offset))` → `!!(val & BIT(offset))`
- [Phase 3] git blame: buggy code introduced in 4342bf63b64b0
  (v6.13-rc1), present in stable 6.13+
- [Phase 3] git show 86ef402d805d: confirmed sanitize commit in
  v6.15-rc1, makes non-[0,1] returns an error
- [Phase 3] git show ec2cceadfae72: confirmed gpiolib normalize
  workaround in v7.0-rc2 with `Cc: stable`
- [Phase 3] git tag --contains: verified cgbc in v6.13+, sanitize in
  v6.15+, normalize in v7.0
- [Phase 3] git diff shows `cgbc_gpio_get()` unchanged since driver
  creation — clean apply
- [Phase 4] b4 mbox: found 11-message thread, all 7 patches applied by
  Bartosz Golaszewski
- [Phase 4] Mailing list discussion: Dmitry recommended reverting
  sanitize for stable; Bartosz instead sent gpiolib normalize fix
- [Phase 4] Sibling patches (e2fa075d5ce19, 2bb995e6155cb,
  fb22bb9701d48) all have `Fixes: 86ef402d805d` and `Cc: stable`
- [Phase 5] `cgbc_gpio_get()` is the `.get` callback called by gpiolib
  on every GPIO read
- [Phase 6] Confirmed driver exists in 6.13+ and sanitize check in
  6.15+; patch applies cleanly
- [Phase 8] For offset > 0, `BIT(offset)` yields values 2-128; returning
  these violates API and triggers warnings/errors

The fix is small, surgical, trivially correct, and eliminates incorrect
API behavior that causes runtime warnings in stable trees. The sibling
patches explicitly target stable. The absence of `Cc: stable` on this
specific patch appears to be an oversight or inconsistency within the
series.

**YES**

 drivers/gpio/gpio-cgbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
index 0efa1b61001ad..84b5ed3c6e22b 100644
--- a/drivers/gpio/gpio-cgbc.c
+++ b/drivers/gpio/gpio-cgbc.c
@@ -47,8 +47,8 @@ static int cgbc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 	if (ret)
 		return ret;
-	else
-		return (int)(val & (u8)BIT(offset));
+
+	return !!(val & BIT(offset));
 }
 
 static int __cgbc_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.53.0


