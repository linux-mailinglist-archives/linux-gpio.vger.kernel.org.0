Return-Path: <linux-gpio+bounces-35261-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJQ0JlAn5mm6sgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35261-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:17:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99F42B758
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD043301CE74
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 13:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92943A3825;
	Mon, 20 Apr 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4XhjMjZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B743A1E73;
	Mon, 20 Apr 2026 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690949; cv=none; b=qYBU/WtLHs9tSl1wnOcPcJqugDZU+7w7cCbZakPteSPyjbzd91hqWHl+az5HTLHqUHQxcn9BaIiv8uabqaC3wpYUb6NjwCBOSZTLU1QQDqWjx4tv9TDrc0Rzx0QLrFHFXSdj9dwFB7BDEmzCximMJ0K0BI9+EHcjIsreq7woOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690949; c=relaxed/simple;
	bh=yFy+QQIRSBLq3C9dEiBy+11bYiiz4OjbaBiD3WNJNjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mu8isfBmgMhWUE/5rq7zXjaTRxT49Lhs/0C7YURAkD9yRNZdE9KGrNQN1SGLwl+ebVM7l96T8/rJoriXL6afjAT6VPJWQ76QuelVZ4+YE7Q3anpmzfLZle4nmO6D04KXx0JQag0ON3XVFbJ6ad70nRaC+hvI8dOMRgW8qEvGth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4XhjMjZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D597C19425;
	Mon, 20 Apr 2026 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690949;
	bh=yFy+QQIRSBLq3C9dEiBy+11bYiiz4OjbaBiD3WNJNjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z4XhjMjZs0lWpW+g5wbzQgYgYLIb3rrwRJZFHXOxaL4gLpJrL39lASkCsOOJDJFkN
	 HJflaZGqFH5RX2Wtnfvc9UmRCvGGENKHPmdpz01q7gqljclJ9q9G4B1mN3whq1WnmE
	 lAoGo+OYqfVHROve6zLN9Vp+tunpoEOL82PQgPPhPYdbcMYarbIOOqB7BDo1zrhBbB
	 kEab3AEtIK9YvfXEOYDExsSKdlOuXgObZfF2AhXLf/mrPjV5JZTQMowbeHYi2epBVM
	 HD6fZNvgA/ixkpw2NzbGlpyPCVYwpMH1UmIKOHhf4ZUDaRqXIOzuZce/ywIgj/N+mJ
	 NI3rQu9Xh7jgQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] gpio: lp873x: normalize return value of gpio_get
Date: Mon, 20 Apr 2026 09:07:52 -0400
Message-ID: <20260420131539.986432-6-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linaro.org,bgdev.pl,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35261-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 0A99F42B758
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit 5a32ebabb6819fafce99e7bc6575ca568af6d22a ]

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by lp873x_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://patch.msgid.link/20260218190657.2974723-4-dmitry.torokhov@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information I need. Let me compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `gpio: lp873x`
- Action: "normalize" (correctness fix, ensuring API compliance)
- Summary: Normalize return value of `gpio_get` callback to [0, 1] range
Record: [gpio: lp873x] [normalize] [Fix return value to comply with GPIO
API contract]

**Step 1.2: Tags**
- `Signed-off-by: Dmitry Torokhov` - Author, major kernel contributor
  (input subsystem maintainer, also contributes to GPIO)
- `Link: https://patch.msgid.link/20260218190657.2974723-4-
  dmitry.torokhov@gmail.com` - Patch 4 in a series
- `Signed-off-by: Bartosz Golaszewski` - GPIO subsystem maintainer
  applied it
- No Fixes: tag (expected for AUTOSEL candidates)
- No Cc: stable tag
Record: Author is a well-known kernel maintainer. Patch applied by GPIO
subsystem maintainer.

**Step 1.3: Commit Body**
The commit message explains the GPIO `.get()` callback API contract: it
must return 0, 1, or negative error. The lp873x driver violated this.
Record: Bug = API contract violation. Return value is non-normalized
(can return values > 1 like 16).

**Step 1.4: Hidden Bug Fix?**
Yes. "normalize" disguises a real correctness bug. The driver returns
`val & BIT(offset * BITS_PER_GPO)` which for offset=1 returns 16 (not 0
or 1). This violates the GPIO API contract.
Record: This IS a bug fix despite "normalize" language.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file: `drivers/gpio/gpio-lp873x.c`, 1 line changed
- Function modified: `lp873x_gpio_get()`
Record: Minimal single-line change in one function.

**Step 2.2: Code Flow Change**
Before: `return val & BIT(offset * BITS_PER_GPO);` - returns 0 or
BIT(offset*4), which for offset=1 is 16.
After: `return !!(val & BIT(offset * BITS_PER_GPO));` - returns 0 or 1.
Record: Changes return value normalization on the normal code path.

**Step 2.3: Bug Mechanism**
Category: Logic/correctness fix (type g). `BITS_PER_GPO` is 4. For
offset=0, `BIT(0)=1` (fine). For offset=1, `BIT(4)=16` (bug - returns 16
instead of 1).

This interacts critically with `86ef402d805d` (sanitizer added in
v6.15):
- **Original sanitizer** (v6.15): Returns `-EBADE` if `ret > 1` --
  meaning GPO2 reads would FAIL with an error
- **Revised sanitizer** (v7.0, commit `ec2cceadfae72`): Warns and
  normalizes to `!!ret`
- **Without sanitizer** (v6.14 and older): Non-normalized value
  propagated to consumers

Record: API violation; offset=1 returns 16 instead of 1. Can cause
-EBADE errors in some stable tree versions.

**Step 2.4: Fix Quality**
Trivially correct. `!!` is the standard C idiom for boolean
normalization. Zero regression risk.
Record: Obviously correct, minimal, zero risk.

## PHASE 3: GIT HISTORY

**Step 3.1: Blame**
The buggy line (`return val & BIT(...)`) was introduced in
`83f141030cec88` (2016-08-31, v4.9) - the original driver. Bug present
since inception.
Record: Bug exists since v4.9, present in all stable trees.

**Step 3.2: Fixes Tag**
No Fixes: tag present. However, sister commits reference `Fixes:
86ef402d805d`. The lp873x commit likely should have had this tag.
Record: Sister commits all have `Fixes: 86ef402d805d`.

**Step 3.3: File History**
Only 2 changes since v6.6: `30d15b8949828` (GPIO set callback rename)
and `d9d87d90cc0b1` (rename back). Neither affects `lp873x_gpio_get()`.
The fix applies cleanly to all stable trees.
Record: Standalone fix, no prerequisites for the get() function.

**Step 3.4: Author**
Dmitry Torokhov is the input subsystem maintainer and a very active
kernel contributor. He authored multiple similar GPIO normalization
fixes (`fbd03587ba732` for amd-fch, `2bb995e6155cb` for qca807x,
`e2fa075d5ce19` for ti-ads7950). He also reported the issue that led to
the gpiolib sanitizer fix `ec2cceadfae72`.
Record: Highly trusted author. Systematic fix across multiple drivers.

**Step 3.5: Dependencies**
None. The change to `lp873x_gpio_get()` is self-contained - the function
hasn't changed since 2016.
Record: No dependencies. Clean apply expected.

## PHASE 4: MAILING LIST

**Step 4.1-4.2**: Lore is behind a bot protection wall. However, b4 dig
confirmed the series and the sister patches. The patch was accepted by
the GPIO subsystem maintainer (Bartosz Golaszewski).

**Step 4.3: Bug Context**
The framework-level fix `ec2cceadfae72` was prompted by Dmitry Torokhov
reporting that `86ef402d805d` broke multiple drivers. Bartosz
Golaszewski then:
1. Changed the sanitizer from -EBADE to warn+normalize
2. CC'd stable on that fix
3. Accepted all driver-level fixes from Dmitry

**Step 4.4: Series Context**
This is patch 4 in a series of GPIO normalization fixes. Each patch is
independent (different drivers).

**Step 4.5: Stable Discussion**
The sister commit `e2fa075d5ce19` (ti-ads7950) explicitly has `Cc:
<Stable@vger.kernel.org>`. The framework fix `ec2cceadfae72` also has
`Cc: stable`. This lp873x patch appears to have missed the Cc: stable
tag despite being the same class of fix.
Record: Sister patches have Cc: stable. This one appears to have been
missed.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1-5.2**: `lp873x_gpio_get` is called via the `.get` callback in
`template_chip`. The GPIO framework calls it through `gpiochip_get()` ->
`gpio_chip_get_value()` -> gpiod_get_value/gpiod_get_raw_value paths.

**Step 5.4**: Call chain: userspace GPIO access -> gpiod_get_value() ->
gpio_chip_get_value() -> gpiochip_get() -> lp873x_gpio_get(). Reachable
from userspace via the GPIO chardev interface.

Record: Reachable from userspace, called on every GPIO read of this
device.

## PHASE 6: CROSS-REFERENCING

**Step 6.1**: The buggy code exists in all stable trees (since v4.9).
The lp873x driver has barely changed.

**Step 6.2**: The `lp873x_gpio_get()` function is unchanged since 2016.
The fix should apply cleanly to all stable trees.

**Step 6.3**: No related fixes for this specific driver in stable.

Record: Clean backport expected to all active stable trees.

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1**: GPIO subsystem - IMPORTANT level. GPIO is used widely in
embedded/IoT systems.
**Step 7.2**: The lp873x is a TI PMIC used in embedded/industrial
systems (BeagleBone, etc.).
Record: Peripheral driver but with real embedded users.

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1**: Affects users of LP873x PMIC GPO2 (offset=1). The LP873x
is used on TI AM335x/AM57xx platforms.

**Step 8.2**: Triggered on every GPIO read of GPO2. Impact varies by
stable tree:
- v6.15+ with only `86ef402d805d`: Returns -EBADE error (FUNCTIONAL
  BREAKAGE)
- v7.0+ with `ec2cceadfae72`: Warning in dmesg
- v6.14 and older: Non-normalized value to consumers (potential subtle
  bugs)

**Step 8.3**: Severity varies: MEDIUM (warning + potential wrong
behavior) to HIGH (functional breakage with -EBADE in certain stable
trees)

**Step 8.4**: BENEFIT: Eliminates API violation, prevents -EBADE errors
in some trees, removes warning. RISK: Essentially zero (single `!!`
addition).

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR:**
1. Trivial 1-line fix, obviously correct (`!!` normalization)
2. Fixes real API contract violation (returning 16 instead of 1)
3. Zero regression risk
4. Sister patches (`e2fa075d5ce19`, `2bb995e6155cb`) have `Cc: stable`
   and `Fixes:` tags
5. Author is highly trusted kernel maintainer
6. Applied by GPIO subsystem maintainer
7. Bug present since v4.9 - affects all stable trees
8. In some stable trees (v6.15+), the unfixed driver causes -EBADE
   functional errors
9. Clean backport expected - function unchanged since 2016

**Evidence AGAINST:**
1. No Fixes: tag or Cc: stable on this specific commit (likely
   oversight)
2. Low user population (LP873x PMIC users only)
3. Impact in latest stable trees is "just" a warning (with the sanitizer
   normalization)

**Stable Rules Checklist:**
1. Obviously correct? **YES** - `!!` is standard normalization
2. Fixes real bug? **YES** - API violation, wrong return values
3. Important issue? **MEDIUM-HIGH** - can cause -EBADE in some trees
4. Small and contained? **YES** - 1 line, 1 file
5. No new features? **YES** - pure fix
6. Can apply to stable? **YES** - function unchanged since 2016

## Verification

- [Phase 1] Parsed tags: Author is Dmitry Torokhov, applied by GPIO
  maintainer Bartosz Golaszewski. No Fixes:/Cc:stable.
- [Phase 2] Diff analysis: 1 line changed in `lp873x_gpio_get()`, `val &
  BIT(...)` -> `!!(val & BIT(...))`. For offset=1, changes return from
  16 to 1.
- [Phase 3] git blame: buggy line from `83f141030cec88` (v4.9,
  2016-08-31), present in all stable trees.
- [Phase 3] git show `86ef402d805d`: sanitizer that returns -EBADE for
  ret > 1, first in v6.15.
- [Phase 3] git show `ec2cceadfae72`: follow-up changing -EBADE to
  warn+normalize, has `Cc: stable`.
- [Phase 3] Sister commits `2bb995e6155cb` (qca807x) and `e2fa075d5ce19`
  (ti-ads7950): both have `Fixes: 86ef402d805d` and one has `Cc:
  stable`.
- [Phase 3] git log: only 2 unrelated changes to lp873x since v6.6 (GPIO
  set callback renames), neither affect get().
- [Phase 4] b4 dig: confirmed sister patches found on lore. Lore itself
  blocked by bot protection.
- [Phase 5] Call chain: userspace -> gpiod_get_value -> gpiochip_get ->
  lp873x_gpio_get. Reachable from userspace.
- [Phase 6] Function `lp873x_gpio_get()` is identical in all stable
  trees since v4.9. Clean apply expected.
- [Phase 8] BITS_PER_GPO=4, offset=1 returns BIT(4)=16, confirmed via
  computation.
- UNVERIFIED: Could not directly access lore.kernel.org discussion for
  this specific patch due to bot protection. Relied on b4 dig and sister
  patch analysis.

The fix is a trivially correct 1-line normalization that fixes a real
API violation present since v4.9. Sister patches in the same series have
explicit stable nominations. The risk is essentially zero.

**YES**

 drivers/gpio/gpio-lp873x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 5376708a81bfe..f4413fa5a8110 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -55,7 +55,7 @@ static int lp873x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret < 0)
 		return ret;
 
-	return val & BIT(offset * BITS_PER_GPO);
+	return !!(val & BIT(offset * BITS_PER_GPO));
 }
 
 static int lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.53.0


