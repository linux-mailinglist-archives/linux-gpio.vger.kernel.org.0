Return-Path: <linux-gpio+bounces-35267-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO4eCYs65mlutgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35267-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:39:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D93142D4A5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70DB331AAB8F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 13:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC45C3FFAC1;
	Mon, 20 Apr 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMntbf2i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A03FFAB5;
	Mon, 20 Apr 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691605; cv=none; b=L2PHpSPIogN0SThCEMd8/tnSgOCfO811mF+5gzXVMbMCjthLowJdSHo4LDzS3DZvHRlXwwdp/ggIOA3FuYonsx4bIMx/ukD17LIFA5N732jmRiUV1Si8gAV11ojyljJfVvy4ruVt73vWXWsCe6eouPx+yhgEX60K/YgLyNhkut8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691605; c=relaxed/simple;
	bh=QWO1+ilXI4/9bxiArWY+juEy4LrgdzMjjCXGM4ITv6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bvc+MT8OFDTXVwGcJ072acQQXimQqOfd5ihh9mc+Frj5sUDfXF2WnWJnJLAJJCoOqIyxe4qRp4n9Hl6vxyaW0tbJtrUNmlh6lueZ2ohBIdazbQYdTK+ZdB6YShyyp34r4qi3Y18BZbeWKbzTTQAlIfUdlmk9SgaqwZWs1uB/wnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMntbf2i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F79C2BCB4;
	Mon, 20 Apr 2026 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691605;
	bh=QWO1+ilXI4/9bxiArWY+juEy4LrgdzMjjCXGM4ITv6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VMntbf2iURSe+b2zCNOPBX5JWmLmegIQU4pOFNC7vjQ45690+Sx+6ZEmR242OnfVw
	 IXG2LWZAPlBp3DJ3oIFdtUUnjKPJFHSYhyZMqyzjwyZo0uIFcESpy6PBoOdsZXfm2w
	 rl5KNZ6GTCye1kRyfWXuMFKoo9PUh1UNzUMjhF68aAmOYOIie2xeGW9jH3WSQ1CsHI
	 jG2vOg8zf4/wh7XLYy96XRyOSR4qlsUGbTqCR8MFNjziR3nZMqFXb5Nr8bLN7ONnuJ
	 rMrHeLgOgdNUWWod3jPUGYz3UzUe3o5QUXDRiYGA+pXqqBTePDCtYwwss/Um84YaEv
	 Op9epaFNV1Zew==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] gpio: viperboard: normalize return value of gpio_get
Date: Mon, 20 Apr 2026 09:18:41 -0400
Message-ID: <20260420132314.1023554-127-sashal@kernel.org>
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
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35267-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 8D93142D4A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit c08381ad56a9cc111f893b2b21400ceb468cc698 ]

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by vprbrd_gpiob_get() in the output
case is normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://patch.msgid.link/20260218190657.2974723-7-dmitry.torokhov@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Connection lost, reconnecting...
Retry attempt 1...
Now I have all the information needed for a comprehensive analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: PARSE THE SUBJECT LINE
Record: [gpio: viperboard] [normalize] [Normalize return value of
gpio_get callback to [0, 1] range]

### Step 1.2: PARSE ALL COMMIT MESSAGE TAGS
- `Signed-off-by: Dmitry Torokhov` - Author
- `Link:` - patch.msgid.link (message ID
  20260218190657.2974723-**7**-dmitry.torokhov@gmail.com - patch 7/7 in
  a series)
- `Signed-off-by: Bartosz Golaszewski` - GPIO subsystem maintainer
  applied it
- No Fixes: tag, no Cc: stable, no Reported-by, no Reviewed-by

Record: Missing Fixes: and Cc: stable tags (expected for candidates).
Maintainer SOB present. Part of a 7-patch series.

### Step 1.3: ANALYZE THE COMMIT BODY TEXT
The commit says the GPIO `.get()` callback must return 0 or 1 (or
negative error). `vprbrd_gpiob_get()` in the output case returns
`gpio->gpiob_val & (1 << offset)`, which for offset > 0 returns values
like 2, 4, 8, etc., violating the API contract.

Record: Bug = API contract violation in GPIO get callback. Symptom =
non-normalized return value (e.g., 32 instead of 1 for offset 5). Root
cause = missing `!!()` normalization.

### Step 1.4: DETECT HIDDEN BUG FIXES
"Normalize" is equivalent to "fix incorrect return value." This is a
real bug fix - the function returns wrong values for the majority of
GPIO offsets (1-15 out of 16).

Record: This IS a bug fix, not cleanup.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: INVENTORY THE CHANGES
- `drivers/gpio/gpio-viperboard.c`: 1 line changed (+1/-1)
- Function modified: `vprbrd_gpiob_get()`
- Scope: single-file surgical fix, one line

Record: 1 file, 1 line changed, single function, minimal scope.

### Step 2.2: UNDERSTAND THE CODE FLOW CHANGE
**Before:** When GPIO B pin is set as output, `return gpio->gpiob_val &
(1 << offset)` returns a bit-masked value (0, 1, 2, 4, 8, ..., 32768).

**After:** `return !!(gpio->gpiob_val & (1 << offset))` returns 0 or 1.

Record: Before = returns arbitrary power-of-2 values. After = returns
normalized 0/1.

### Step 2.3: IDENTIFY THE BUG MECHANISM
Category: **Logic / correctness fix** - incorrect return value from API
callback.

The expression `(1 << offset)` for offset=5 yields 32. If the bit is
set, `gpiob_val & 32` returns 32, not 1. The `!!` operator normalizes
any truthy value to exactly 1.

Record: Logic bug - wrong return value for GPIO offsets > 0. Fix is
`!!()` normalization.

### Step 2.4: ASSESS THE FIX QUALITY
- Obviously correct: `!!` is the standard pattern used throughout the
  kernel for this exact purpose
- Minimal: one line
- The identical fix was applied to `vprbrd_gpioa_get()` in 2015 (commit
  `80776df4f53e8`)
- Zero regression risk

Record: Fix is obviously correct, minimal, proven pattern. Zero
regression risk.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: BLAME THE CHANGED LINES
The buggy line (291) was introduced in commit `9d5b72de0d162` by Lars
Poeschel on 2012-11-05 - the original driver addition. This bug has
existed since the driver was first added.

Record: Buggy code from 2012, present in all stable trees since ~v3.8.

### Step 3.2: FOLLOW THE FIXES: TAG
No Fixes: tag present. However, sibling commit `e2fa075d5ce19` (iio:
adc: ti-ads7950, same author, same type of fix) has `Fixes: 86ef402d805d
("gpiolib: sanitize the return value of gpio_chip::get()")` and `Cc:
stable@vger.kernel.org`.

The commit `86ef402d805d` (v6.15-rc1, Feb 2025) made gpiolib reject non-
normalized values by returning `-EBADE`. This was then partially
reverted by `ec2cceadfae72` (Feb 2026, Cc: stable) to normalize + warn
instead of error.

Record: The bug was latent since 2012. It became a functional regression
in v6.15 when `86ef402d805d` started rejecting non-normalized values
with -EBADE.

### Step 3.3: CHECK FILE HISTORY
Commit `80776df4f53e8` (Dec 2015) by Linus Walleij applied the identical
fix to `vprbrd_gpioa_get()` but missed `vprbrd_gpiob_get()`. This commit
completes that work 10 years later.

Record: Prior art exists in the same file - identical fix applied to
gpioa in 2015, gpiob was missed.

### Step 3.4: CHECK THE AUTHOR
Dmitry Torokhov is a prolific kernel contributor (input subsystem
maintainer, Google). He authored the gpiolib normalization series fixing
this same class of bug across 7+ GPIO drivers.

Record: Author is an experienced, well-known kernel developer.

### Step 3.5: CHECK FOR DEPENDENCIES
This is patch 7/7 in a series of independent per-driver fixes. Each
patch is completely standalone. No dependencies.

Record: Fully standalone, no dependencies.

---

## PHASE 4: MAILING LIST RESEARCH

### Step 4.1: ORIGINAL PATCH DISCUSSION
Found via b4 am: This is patch 7/7 in a series:
1. gpio: bd9571mwv: normalize return value of gpio_get
2. gpio: cgbc: normalize return value of gpio_get
3. gpio: da9055: normalize return value of gpio_get
4. gpio: lp873x: normalize return value of gpio_get
5. gpio: stp-xway: normalize return value of gpio_get
6. gpio: tps65086: normalize return value of gpio_get
7. gpio: viperboard: normalize return value of gpio_get (this one)

No review comments were found in the mbox (no replies). The maintainer
(Bartosz Golaszewski) applied the patches directly.

Record: Part of a 7-patch series. No review discussion found. Applied by
GPIO maintainer.

### Step 4.2: REVIEWERS
The sibling iio commit had `Reviewed-by: Andy Shevchenko`, `Reviewed-by:
Bartosz Golaszewski`, and `Reviewed-by: Linus Walleij`. This GPIO series
was applied directly by the maintainer.

Record: Applied by subsystem maintainer Bartosz Golaszewski.

### Step 4.3-4.5: BUG REPORT AND STABLE HISTORY
The root cause was Dmitry Torokhov's report that `86ef402d805d` broke
many GPIO drivers. This led to both the gpiolib normalization fix
(ec2cceadfae72, Cc: stable) and the per-driver cleanup series.

Record: Dmitry Torokhov reported the broader issue, leading to both
framework and per-driver fixes.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1-5.4: FUNCTION ANALYSIS
`vprbrd_gpiob_get()` is registered as the `.get` callback for GPIO chip
B in `vprbrd_gpio_probe()` (line 428). It's called by the gpiolib
framework via `gpiochip_get()` → `gc->get()` whenever any GPIO consumer
reads a pin value on viperboard GPIO B.

The affected path is specifically the "output cache" early return at
line 290-291, which is taken whenever a pin configured as output is
read.

Record: Called via gpiolib framework from any GPIO consumer reading pin
values. Affected path = output pin value reads.

### Step 5.5: SIMILAR PATTERNS
The exact same bug pattern (`val & BIT(offset)` instead of `!!(val &
BIT(offset))`) was fixed in 7 drivers in this series alone, plus the
prior 2015 fix for gpioa in the same file.

Record: Systematic pattern across many GPIO drivers. Well-understood,
well-tested fix pattern.

---

## PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

### Step 6.1: BUGGY CODE IN STABLE?
The buggy line was introduced in 2012. It exists in ALL active stable
trees.

### Step 6.2: BACKPORT COMPLICATIONS
One-line change to ancient code. Will apply cleanly to all stable trees.

### Step 6.3: RELATED FIXES IN STABLE
`ec2cceadfae72` (gpiolib: normalize the return value on behalf of buggy
drivers) is Cc: stable and will be backported. This provides a
framework-level safety net, but the per-driver fix eliminates the
warning.

Record: gpiolib framework fix will be in stable too, but per-driver fix
prevents warnings.

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: SUBSYSTEM CRITICALITY
Subsystem: drivers/gpio - device driver, GPIO subsystem.
Criticality: PERIPHERAL - viperboard is an obscure USB GPIO device.

### Step 7.2: SUBSYSTEM ACTIVITY
Moderate activity in GPIO subsystem overall, but viperboard itself has
minimal activity (last change was commit `d9d87d90cc0b1`).

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: WHO IS AFFECTED
Users of Nano River Technologies Viperboard USB GPIO hardware - a very
small population.

### Step 8.2: TRIGGER CONDITIONS
Any read of a GPIO B pin that is configured as output, at offsets 1-15.
Common operation for any viperboard GPIO user.

### Step 8.3: FAILURE MODE SEVERITY
- **On stable with 86ef402d805d but not ec2cceadfae72**: Returns -EBADE
  error instead of pin value - **MEDIUM** (functional regression)
- **On stable with both**: Produces kernel WARNING - **LOW**
- **On older stable without either**: GPIO consumers get wrong values
  (e.g., 32 instead of 1) - **MEDIUM** (incorrect behavior)

### Step 8.4: RISK-BENEFIT RATIO
**BENEFIT**: Fixes incorrect return value for all viperboard GPIO B
users. Eliminates kernel warnings.
**RISK**: Effectively zero - one-line `!!()` change, same pattern used
everywhere.

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: EVIDENCE COMPILATION
**FOR backporting:**
- Real bug fix: incorrect API return value, present since 2012
- One-line, obviously correct (identical to fix applied to gpioa in
  2015)
- Zero regression risk
- Part of a series where sibling commits were explicitly tagged Cc:
  stable
- Fixes a functional regression on v6.15+ (where gpiolib returns -EBADE
  for non-normalized values)
- Standalone, no dependencies, applies cleanly to all stable trees

**AGAINST backporting:**
- Obscure hardware with very few users
- gpiolib framework fix (ec2cceadfae72, Cc: stable) already handles
  normalization at the framework level
- Severity is LOW-MEDIUM (worst case is a kernel WARNING with the
  framework fix in stable)
- No Fixes: or Cc: stable tags on this specific commit

### Step 9.2: STABLE RULES CHECKLIST
1. Obviously correct and tested? **YES** - `!!()` pattern, identical to
   prior gpioa fix
2. Fixes a real bug? **YES** - incorrect return values from GPIO get
   callback
3. Important issue? **BORDERLINE** - functional regression on v6.15+,
   wrong values on older
4. Small and contained? **YES** - 1 line, 1 file
5. No new features? **YES**
6. Can apply to stable? **YES** - cleanly applies to all trees

### Step 9.3: EXCEPTION CATEGORIES
Not an exception category - this is a standard correctness fix.

### Step 9.4: DECISION
This is a small, safe, obviously correct fix for a real API contract
violation that has existed since 2012. While the hardware is obscure,
the fix is zero-risk and the same class of fix was explicitly marked for
stable in sibling commits. The `!!()` pattern is well-established and
was already applied to the other get function in this same file.

---

## Verification

- [Phase 1] Parsed tags: Signed-off-by by author (Torokhov) and
  maintainer (Golaszewski), Link to lore.
- [Phase 2] Diff analysis: Single line change `return gpio->gpiob_val &
  (1 << offset)` → `return !!(gpio->gpiob_val & (1 << offset))` in
  vprbrd_gpiob_get().
- [Phase 3] git blame: Buggy code introduced in 9d5b72de0d162
  (2012-11-05, original driver addition).
- [Phase 3] git show 80776df4f53e8: Confirmed identical fix was applied
  to vprbrd_gpioa_get() in Dec 2015 by Linus Walleij, but gpiob_get was
  missed.
- [Phase 3] git show 86ef402d805d: Confirmed this commit (v6.15-rc1)
  made gpiolib return -EBADE for non-normalized values.
- [Phase 3] git show ec2cceadfae72: Confirmed this commit (Cc: stable)
  partially reverts to normalize+warn instead of error.
- [Phase 3] git show e2fa075d5ce19: Confirmed sibling commit (iio: ti-
  ads7950) has Fixes: 86ef402d805d and Cc: stable.
- [Phase 4] b4 am: Confirmed this is patch 7/7 in a series of 7
  identical fixes across GPIO drivers.
- [Phase 4] Mbox review: No review comments found; applied directly by
  maintainer.
- [Phase 5] Verified vprbrd_gpiob_get registered as .get callback at
  line 428 of gpio-viperboard.c.
- [Phase 5] Verified gpiolib framework calls gc->get() via
  gpiochip_get() in gpiolib.c:3277.
- [Phase 6] Bug exists in all stable trees (code from 2012). Patch
  applies cleanly.
- [Phase 6] Confirmed ec2cceadfae72 is Cc: stable and provides
  framework-level normalization.
- [Phase 8] Risk: effectively zero for a `!!()` one-liner.

**YES**

 drivers/gpio/gpio-viperboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index 15e495c109d2a..89087fd48a819 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -288,7 +288,7 @@ static int vprbrd_gpiob_get(struct gpio_chip *chip,
 
 	/* if io is set to output, just return the saved value */
 	if (gpio->gpiob_out & (1 << offset))
-		return gpio->gpiob_val & (1 << offset);
+		return !!(gpio->gpiob_val & (1 << offset));
 
 	mutex_lock(&vb->lock);
 
-- 
2.53.0


