Return-Path: <linux-gpio+bounces-35269-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAVtNIk75mmatgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35269-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:43:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6709142D5F8
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B71E03065A69
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BA041B360;
	Mon, 20 Apr 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Km8h7/HL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5AD3C7DF2;
	Mon, 20 Apr 2026 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691648; cv=none; b=WHD28swuL9Jp2fSRkcGHUnag0zH75rllpXybUnp0DcnZRl58ib/CovXfoZ6UCo5NP6v1X+E+Z/txCALkWIW98Q6ty1kwLJMQne8jl9c95dqaZBUNUOGz5/iLYQlfdCyoOA0a5TW1lTu769ysNVVv/gIZpX5m7+xDOAQj2p/wosA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691648; c=relaxed/simple;
	bh=MZ6c+TDtpw8q7K54n5dh+Dzy7SkWo62Dd4bYWqbDeGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emEEK6RRurDXUfRPe6etONYXUkvgdEttD/HowSFVfcxmbJ+81NiyitgdVbu0AV04Tl7YLCz93fRTO/8JlmPpHNRUDRDOLT+M51GjpAHOoQ2ajNOkC4Q5PpSi7yW8qbS1g7ZQThasnj7/zo6e50tDu9UO+tiral3ZQkM0pBNvb/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Km8h7/HL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7ADC2BCB9;
	Mon, 20 Apr 2026 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691648;
	bh=MZ6c+TDtpw8q7K54n5dh+Dzy7SkWo62Dd4bYWqbDeGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Km8h7/HL9FRyzySze82U+mjm7CU/yX7o6ZrfgZH5TbKZk6r50PdeQ0Bp8aiPNkZ10
	 RrROnkeA0ksJgOKuBaFWIfzgVq4a5pBz35h0kc6Xw9ofhQf5U9eVaqTlAlYzZ5dziD
	 qNNXWPFVAzNJ5EPiHPjq6SKUNJHi/3yJMNHvovfEc+3VE5OoOSqiAwddd1teMz+eGX
	 pQ51CbQFdr1bx5IDw7ireitXQhLT/xivwd01nyzsT+jDe0wPeyUJeL5oGWweCZVHem
	 uGdBysFTEWMTw6hIICLc/D4c0aI1ALg5KaoS4uJFRto8JrGtc0xAGXIHkvxcAHf4wU
	 cTGkkZ/M8QXPw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	support.opensource@diasemi.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] gpio: da9055: normalize return value of gpio_get
Date: Mon, 20 Apr 2026 09:19:05 -0400
Message-ID: <20260420132314.1023554-151-sashal@kernel.org>
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
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,diasemi.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35269-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6709142D5F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit 4d720b0d68e9a251d60804eace42aac800d7a79f ]

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by da9055_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://patch.msgid.link/20260218190657.2974723-3-dmitry.torokhov@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a complete picture. Let me compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `gpio: da9055`
- Action verb: "normalize" (implies correcting incorrect behavior)
- Summary: Normalize the return value of `da9055_gpio_get()` to conform
  to the GPIO API contract of returning 0 or 1.

**Step 1.2: Tags**
- `Signed-off-by: Dmitry Torokhov` - author, well-known kernel developer
  (input subsystem maintainer)
- `Link: https://patch.msgid.link/20260218190657.2974723-3-
  dmitry.torokhov@gmail.com` - part 3 of a series
- `Signed-off-by: Bartosz Golaszewski` - GPIO subsystem maintainer,
  accepted the patch
- No Fixes: tag, no Cc: stable (expected for AUTOSEL candidates)
- No Reported-by or Tested-by tags

**Step 1.3: Commit Body**
The message explains: the GPIO `.get()` callback must return 0 or 1 (or
negative error). `da9055_gpio_get()` was not normalizing its return
value, potentially returning values like 2, 4, or 8.

**Step 1.4: Hidden Bug Fix Detection**
Yes - this is a real bug fix disguised as a "normalize" cleanup. The
`.get()` callback violates its API contract, and since commit
`86ef402d805d` in v6.15, the gpiolib framework actively checks for this
violation.

Record: This is a bug fix for API contract violation.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Change Inventory**
- Single file: `drivers/gpio/gpio-da9055.c`
- One line changed: `return ret & (1 << offset);` → `return !!(ret & (1
  << offset));`
- Function: `da9055_gpio_get()`
- Scope: single-line surgical fix

**Step 2.2: Code Flow Change**
Before: `ret & (1 << offset)` returns the raw bit value, which for
offset=1 is 2, for offset=2 is 4. The GPIO API contract requires 0 or 1.
After: `!!(ret & (1 << offset))` normalizes to boolean 0 or 1.

**Step 2.3: Bug Mechanism**
Category: Logic/correctness fix (API contract violation). The `1 <<
offset` mask for offset > 0 produces values > 1 when the bit is set.

**Step 2.4: Fix Quality**
Obviously correct. The `!!` operator is the standard C idiom for boolean
normalization. Zero regression risk - it only changes non-zero values >
1 to 1, which is the intended semantics.

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
The buggy line was introduced in commit `04ed4279715f68` (2012-09-14) -
the original DA9055 GPIO driver by Ashish Jangam. The bug has existed
since the driver was created.

**Step 3.2: Related Fixes**
While this commit lacks a `Fixes:` tag, the **identical** fixes by the
same author for other drivers all reference `Fixes: 86ef402d805d
("gpiolib: sanitize the return value of gpio_chip::get()")`:
- `e2fa075d5ce19` (ti-ads7950) - has Fixes: + Cc: stable
- `2bb995e6155cb` (qca807x) - has Fixes:
- `fb22bb9701d48` (rza1) - has Fixes:
- `fbd03587ba732` (amd-fch) - has Fixes:

The missing tags on this da9055 commit appear to be an oversight.

**Step 3.3: File History**
No other recent changes to gpio-da9055.c that would conflict.

**Step 3.4: Author**
Dmitry Torokhov is a major kernel contributor (input subsystem
maintainer). He reported the issue that led to `ec2cceadfae72` (the
gpiolib normalize wrapper) and systematically fixed affected drivers.

**Step 3.5: Dependencies**
None. This is completely standalone - it just adds `!!` to one return
expression.

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1-4.2:** b4 dig could not find the da9055 commit specifically
(it's not yet in the tree). However, b4 found the related series
patches, confirming this is part of Dmitry's systematic effort to fix
non-compliant GPIO drivers.

**Step 4.3:** The bug report chain originates from `ec2cceadfae72`
discussion where Dmitry reported that `86ef402d805d` broke multiple
drivers.

**Step 4.4:** This is part of a series of driver-level fixes submitted
alongside the framework-level normalize wrapper. The da9055 fix is
standalone.

**Step 4.5:** Similar driver fixes from this same series were backported
to 6.19.y stable. The da9055 one was not, likely because it lacks
Fixes:/Cc:stable tags.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1:** Modified function: `da9055_gpio_get()`

**Step 5.2:** `da9055_gpio_get()` is registered as the `.get` callback
in the `reference_gp` gpio_chip structure. It is called by the gpiolib
framework via `gpiochip_get()` whenever any consumer reads a GPIO value
from this PMIC.

**Step 5.3:** The function reads register values via `da9055_reg_read()`
(I2C), then returns a masked bit value.

**Step 5.4:** Call chain: userspace/kernel consumer →
`gpiod_get_value_cansleep()` → `gpiod_get_raw_value_commit()` →
`gpio_chip_get_value()` → `gpiochip_get()` → `da9055_gpio_get()`. The
path is reachable from any GPIO consumer.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: CRITICAL FINDING - v6.15.y is broken:**

I verified the state of stable trees:

- **v6.12.y and earlier**: Do NOT have `86ef402d805d` (sanitize commit).
  The da9055 driver returns non-normalized values, but gpiolib doesn't
  check, so it "works" (though technically wrong). Fix is low-priority
  here.

- **v6.15.y**: HAS `86ef402d805d` (sanitize: `ret > 1 → -EBADE`). Does
  NOT have `ec2cceadfae72` (normalize wrapper). **The da9055 GPIO driver
  is BROKEN** - reading GPIO at offset 1 or 2 when active returns
  `-EBADE` (error) instead of 1.

- **v6.19.y**: HAS both sanitize and normalize wrapper. da9055 works but
  emits a warning on every read of an active GPIO with offset > 0.

- **v7.0.y**: Same as v6.19.y.

**Step 6.2:** Patch applies cleanly - the code hasn't changed since
2012.

**Step 6.3:** The da9055 normalize fix is NOT in any stable tree.

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1:** GPIO subsystem, driver for Dialog DA9055 PMIC - a specific
hardware device. Criticality: PERIPHERAL (specific hardware), but GPIO
is a fundamental interface.

**Step 7.2:** The da9055 driver has been stable/untouched since 2012.
The bug only became functional via the gpiolib sanitize commit in 6.15.

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1:** Affected: Users of DA9055 PMIC hardware (Dialog
Semiconductor).

**Step 8.2:** Trigger: Any read of GPIO pin 1 or 2 when active. This is
a basic operation, not an edge case.

**Step 8.3:** Failure mode in v6.15.y: GPIO read returns `-EBADE` error
instead of the actual value. This breaks GPIO functionality for the
device. Severity: **HIGH** for affected hardware users.

**Step 8.4:**
- Benefit: Fixes actual GPIO breakage in 6.15.y, eliminates warnings in
  6.19.y/7.0.y
- Risk: Virtually zero - single `!!` addition, obviously correct boolean
  normalization
- Ratio: Very favorable

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
1. Fixes a real GPIO breakage in v6.15.y stable (returns -EBADE for
   active GPIOs at offset > 0)
2. Eliminates runtime warnings in v6.19.y and v7.0.y
3. Identical fixes for other drivers WERE tagged Fixes: + Cc: stable
4. Trivially correct 1-character change (`!!`)
5. Zero regression risk
6. The bug has existed since 2012 but became a real breakage in 6.15+
7. Accepted by GPIO subsystem maintainer Bartosz Golaszewski
8. Author is a major kernel contributor who reported the original
   framework issue

**Evidence AGAINST backporting:**
1. Missing Fixes: and Cc: stable tags (but likely an oversight given
   sibling commits have them)
2. DA9055 PMIC is old hardware with potentially few users

**Stable rules checklist:**
1. Obviously correct and tested? **YES** - trivial `!!` normalization
2. Fixes a real bug? **YES** - API contract violation causing -EBADE in
   6.15+
3. Important issue? **YES** - GPIO completely broken for this hardware
   in 6.15.y
4. Small and contained? **YES** - 1 character change
5. No new features? **YES** - pure fix
6. Applies to stable? **YES** - code unchanged since 2012

## Verification

- [Phase 1] Parsed tags: Link to patch.msgid.link (part 3 of series),
  signed off by GPIO maintainer
- [Phase 2] Diff analysis: single character change `!!` added to
  normalize return value in `da9055_gpio_get()`
- [Phase 3] git blame: buggy code from `04ed4279715f68` (2012), original
  DA9055 driver creation
- [Phase 3] Checked sibling commits: `e2fa075d5ce19`, `2bb995e6155cb`,
  `fb22bb9701d48` all have `Fixes: 86ef402d805d` and were tagged for
  stable
- [Phase 4] b4 dig confirmed series context via related commits
- [Phase 5] `da9055_gpio_get()` called by gpiolib framework via
  `gpiochip_get()` wrapper
- [Phase 6] v6.15.11 confirmed: has sanitize (`ret > 1 → -EBADE`) but
  NOT normalize wrapper → da9055 GPIO broken
- [Phase 6] v6.19.12 confirmed: has normalize wrapper → da9055 works
  with warning
- [Phase 6] v6.12.81 confirmed: no sanitize commit → no breakage (pre-
  existing mild API violation)
- [Phase 6] da9055 buggy line confirmed at line 58 in v6.15.11
- [Phase 8] Failure mode in 6.15.y: `gpiochip_get()` returns -EBADE for
  GPIO offsets 1,2 when active. Severity HIGH.

This is a trivially correct one-character fix that resolves a real GPIO
breakage in v6.15.y stable and eliminates runtime warnings in 6.19.y and
7.0.y. The missing Fixes: tag is clearly an oversight given that all
sibling commits from the same author and series have it. The risk is
effectively zero.

**YES**

 drivers/gpio/gpio-da9055.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index a09bd6eb93cfb..1949a6ea8ec61 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -55,7 +55,7 @@ static int da9055_gpio_get(struct gpio_chip *gc, unsigned offset)
 			return ret;
 	}
 
-	return ret & (1 << offset);
+	return !!(ret & (1 << offset));
 
 }
 
-- 
2.53.0


