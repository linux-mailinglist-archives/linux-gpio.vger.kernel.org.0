Return-Path: <linux-gpio+bounces-35266-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK9CLQM05mmOtQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35266-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:11:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D942CBAF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 817063066959
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 13:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A673F0A97;
	Mon, 20 Apr 2026 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWFzEjB5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8D3F0A89;
	Mon, 20 Apr 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691531; cv=none; b=POHVdT5Z+gQhSdMCFgrTPhSJo5RRwbMRP9ex8ChZ+jTZ/bsIJxaXRDa4hypP73GIVzd4IIylLgeUx4Q4O4PmpZA3Ei4tny4nnm622q3Fm+p7+kJ8qLD2zcyCeS4DxxQCsSGwWVdswapkIe/I5WdczRBdtNjIH1TO5rpO/jV8T8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691531; c=relaxed/simple;
	bh=lzpcWzzqY3WXLtpjdbg6ZwpPOwS28VTXiPQKSPXazoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qe6UGF5q9z60Bg5iZ2S1fARYCSOYkq+3sJmKIQdFoNsL4qiICqMzNP3NuUH/xQrBK8+fuKYIZVdycvgjWKONzhh24PEaIPQEYK+l86lCWRHWEvg0/1UeUNj5nStGwjwVnuO3pY83BeSmYKDDSdTXs+z4GX0RdkMHxFHrchE4aRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWFzEjB5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22815C2BCB6;
	Mon, 20 Apr 2026 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691531;
	bh=lzpcWzzqY3WXLtpjdbg6ZwpPOwS28VTXiPQKSPXazoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWFzEjB5fCKCoyzkiz0sulchL0lIKsf4SFfRTAU+bNkokNXVZwg1mgrZPV/A5jTXW
	 VGWDL+6DCAIDVW10lPO8NCL0JnUxjZYliRaDIaiwLAGaPhUqk/fhFEwjeVFtB+t7md
	 9prSkb8Mhi7lr3j54E4SUPttavtmGHAPIqjDgIX+WLj1sxqsxqCCpvWucTLi+aEQUN
	 3ujcqlQhR2G6eEgJoIfQOx+fZ53TTjjJ8Xh5y3xjLqWWHliP8xS1yR+crqQPekPymC
	 LeO49/9Mq1w508wsJ8GCFfD9ksLOqlUBBHPkybAuMveUEuG0IBrCVlZv5U+tE29fQi
	 n5DGly9e0KfqQ==
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
Subject: [PATCH AUTOSEL 7.0-5.10] gpio: tps65086: normalize return value of gpio_get
Date: Mon, 20 Apr 2026 09:17:58 -0400
Message-ID: <20260420132314.1023554-84-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35266-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D8D942CBAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit 9eb7ecfd20f868421e44701274896ba9e136daae ]

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by tps65086_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://patch.msgid.link/20260218190657.2974723-6-dmitry.torokhov@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed. Let me compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `gpio: tps65086`
- Action: "normalize" (ensure correctness of return value)
- Summary: Normalize the return value of `gpio_get` to comply with the
  GPIO API contract (must return 0, 1, or negative error).
Record: [gpio: tps65086] [normalize] [Ensure gpio_get returns 0/1 per
API contract]

**Step 1.2: Tags**
- `Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>` - author,
  well-known kernel developer (input subsystem maintainer)
- `Link: https://patch.msgid.link/20260218190657.2974723-6-
  dmitry.torokhov@gmail.com` - part 6 of a series
- `Signed-off-by: Bartosz Golaszewski
  <bartosz.golaszewski@oss.qualcomm.com>` - GPIO subsystem maintainer
- No Fixes: tag (expected for autosel candidates)
- No Cc: stable tag (expected)
Record: Author is a highly trusted kernel developer. Applied by GPIO
subsystem maintainer. Part of a series (patch 6 of N).

**Step 1.3: Commit Body**
The message explains the API contract: `.get()` callbacks must return 0,
1, or negative error. The driver was returning raw bit values
(potentially 16, 32, 64, 128) which violates this contract.
Record: Bug is API contract violation. Symptom depends on kernel version
- may cause warnings or errors.

**Step 1.4: Hidden Bug Fix Detection**
"Normalize return value" = ensuring correct API behavior. This IS a real
bug fix - the function violated its documented contract.
Record: Yes, this is a real bug fix disguised as normalization.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file: `drivers/gpio/gpio-tps65086.c`
- 1 line changed: `-` removed, `+` added
- Function modified: `tps65086_gpio_get()`
- Scope: Single-file, single-line surgical fix
Record: 1 file, 1 line changed in tps65086_gpio_get(). Minimal scope.

**Step 2.2: Code Flow Change**
- Before: `return val & BIT(4 + offset);` — returns the raw bit value
  (e.g., BIT(4)=16, BIT(5)=32, BIT(6)=64, BIT(7)=128)
- After: `return !!(val & BIT(4 + offset));` — normalizes to 0 or 1
- Affects the normal return path of the GPIO get operation
Record: Before returns 0/16/32/64/128; after returns 0/1. Normal path
change.

**Step 2.3: Bug Mechanism**
Category: Logic/correctness fix. The function returned values > 1,
violating the `gpio_chip::get()` API contract that requires 0, 1, or
negative error.
Record: API contract violation. `BIT(4+offset)` can be 16,32,64,128
instead of required 0/1.

**Step 2.4: Fix Quality**
- Obviously correct: `!!` is the standard C idiom for boolean
  normalization
- Minimal/surgical: exactly one character change conceptually
- Regression risk: zero — `!!` preserves boolean semantics
Record: Trivially correct, zero regression risk.

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
The buggy line (`return val & BIT(4 + offset)`) was introduced in commit
`99f0fd540f539` ("gpio: tps65086: Add GPO driver for the TPS65086 PMIC")
by Andrew F. Davis, dated 2016-02-06. This went into v4.6. The bug has
been present since the driver was first created — approximately 10
years.
Record: Bug introduced in v4.6 (2016), present in ALL stable trees.

**Step 3.2: No Fixes: tag** — expected for autosel.

**Step 3.3: File History**
Recent changes to the file are mostly refactoring (GPIO callback rename,
devm conversion). None fix this issue.
Record: No related prior fixes. This is standalone.

**Step 3.4: Author**
Dmitry Torokhov is the Linux input subsystem maintainer and prolific
kernel contributor. He submitted multiple similar normalize patches:
- `fbd03587ba732` gpio: amd-fch
- `fb22bb9701d48` pinctrl: renesas: rza1
- `e2fa075d5ce19` iio: adc: ti-ads7950
- `2bb995e6155cb` net: phy: qcom: qca807x
Record: Trusted kernel developer. Systematic fix across multiple
drivers.

**Step 3.5: Dependencies**
The patch changes `val & BIT(4 + offset)` to `!!(val & BIT(4 + offset))`
— this is completely standalone with no dependencies.
Record: No dependencies. Applies cleanly on its own.

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1-4.2:** Lore was blocked by anti-bot protection. However, from
b4 dig on the related amd-fch patch (same author, same series), the
patches were submitted individually and reviewed by the GPIO subsystem
maintainer. The Link: header shows this is patch 6 of a series.

**Step 4.3:** The underlying issue was reported by Dmitry Torokhov
himself when he discovered `86ef402d805d` broke multiple drivers. He is
listed as `Reported-by` on `ec2cceadfae72` (the core workaround).

**Step 4.4-4.5:** The core workaround (`ec2cceadfae72`) explicitly has
`Cc: stable@vger.kernel.org`, indicating the upstream developers
consider the warning/normalization issue important for stable.
Record: Series of driver-level fixes coordinated with a core workaround.
Core fix is explicitly nominated for stable.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1-5.2:** `tps65086_gpio_get()` is registered as the `.get`
callback in `template_chip`. It's called by the GPIO core via
`gpiochip_get()` whenever any consumer reads this GPIO line.

**Step 5.3-5.4:** The function reads a register via `regmap_read()` and
returns a masked bit value. The GPIO core function `gpiochip_get()`
(line 3259 of gpiolib.c) calls it and then checks the return value:

```3267:3272:drivers/gpio/gpiolib.c
        if (ret > 1) {
                gpiochip_warn(gc,
                        "invalid return value from gc->get(): %d,
consider fixing the driver\n",
                        ret);
                ret = !!ret;
        }
```

This warning uses `dev_warn` (NOT rate-limited), so it fires on EVERY
GPIO read.

**Step 5.5:** Multiple similar drivers have the same bug — Dmitry's
series fixes several of them.
Record: Warning fires on every GPIO read. Not rate-limited.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1:** The buggy code exists since v4.6 — present in ALL stable
trees. For the 7.0.y tree specifically:
- `86ef402d805d` (strict checking, returns -EBADE for values > 1) —
  first in v6.15-rc1, present in v7.0
- `ec2cceadfae72` (normalize + warn instead of error) — present in v7.0

**Step 6.2:** The patch is a trivial one-line change. It will apply
cleanly to 7.0.y.

**Step 6.3:** No related fix already in stable for this specific driver.
Record: Both the strict check and the warn-and-normalize workaround are
in v7.0. Without this driver fix, every GPIO read emits a warning.

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

**Step 7.1:** GPIO driver (`drivers/gpio/`). Criticality: PERIPHERAL —
affects users of TPS65086 PMIC hardware specifically.

**Step 7.2:** The GPIO subsystem is actively maintained by Bartosz
Golaszewski.
Record: Peripheral subsystem, actively maintained.

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1:** Affects users of TPS65086 PMIC hardware (embedded systems
using this Texas Instruments power management IC).

**Step 8.2:** Triggered on every GPIO read for this hardware. If the
GPIO is polled or frequently accessed, the warning fires repeatedly.

**Step 8.3:** Failure mode: Without this fix in v7.0.y, every GPIO read
emits an un-rate-limited `dev_warn()` message to dmesg. Severity: MEDIUM
— not a crash or corruption, but real user-visible log noise that can be
significant.

**Step 8.4:**
- BENEFIT: Eliminates repeated runtime warnings for TPS65086 users. Low-
  medium benefit.
- RISK: Essentially zero — `!!` is trivially correct.
- Ratio: Positive. Near-zero risk for a real improvement.
Record: Zero risk, eliminates un-rate-limited warning on every GPIO
read.

## PHASE 9: FINAL SYNTHESIS

**Step 9.1: Evidence FOR backporting:**
- Fixes a real API contract violation present since v4.6
- Eliminates un-rate-limited `dev_warn()` on every GPIO read in v7.0
  (because `ec2cceadfae72` catches the violation)
- Trivially correct one-line fix with zero regression risk
- Part of a coordinated upstream effort (core workaround has `Cc:
  stable`)
- Applied by GPIO subsystem maintainer
- Written by a highly trusted kernel developer

**Evidence AGAINST:**
- The core already handles the value functionally (`ec2cceadfae72`
  normalizes it)
- The warning is "just" log noise, not a crash or corruption
- Peripheral hardware (TPS65086 PMIC only)

**Step 9.2: Stable Rules Checklist:**
1. Obviously correct? YES — `!!` normalization is trivially correct
2. Fixes real bug? YES — API violation causing repeated warnings
3. Important issue? MEDIUM — repeated dmesg warnings, not
   crash/corruption
4. Small and contained? YES — 1 line, 1 file
5. No new features? Correct — no new features
6. Applies to stable? YES — cleanly

**Step 9.3:** No special exception category, but trivially safe fix.

**Step 9.4: Decision**
The fix is a trivially correct, zero-risk, one-line change that
eliminates a repeated un-rate-limited warning emitted on every GPIO read
for TPS65086 hardware. In the v7.0 tree, the GPIO core workaround
(`ec2cceadfae72`, which is marked `Cc: stable`) catches this driver's
incorrect return value and normalizes it while printing a warning. This
driver-level fix is the proper solution. The coordinated upstream effort
(core workaround + individual driver fixes) demonstrates that the GPIO
maintainer considers these important for stable.

## Verification

- [Phase 1] Parsed tags: author is Dmitry Torokhov (input maintainer),
  applied by Bartosz Golaszewski (GPIO maintainer), patch 6 of series
- [Phase 2] Diff analysis: single line change `val & BIT(4+offset)` →
  `!!(val & BIT(4+offset))` in `tps65086_gpio_get()`
- [Phase 3] git blame: buggy code introduced in commit 99f0fd540f539
  (v4.6, 2016), present in all stable trees
- [Phase 3] git log --author: Dmitry submitted 4+ similar normalize
  patches across different drivers
- [Phase 4] b4 dig: found related amd-fch patch thread. Lore blocked by
  anti-bot for direct tps65086 thread
- [Phase 5] Grep of gpiolib.c: confirmed `gpiochip_get()` checks ret > 1
  and calls `gpiochip_warn()` (un-rate-limited `dev_warn`)
- [Phase 5] Grep of gpiolib.h: confirmed `gpiochip_warn` maps to
  `dev_warn` (not rate-limited)
- [Phase 6] git merge-base: confirmed `86ef402d805d` and `ec2cceadfae72`
  are both ancestors of v7.0
- [Phase 6] git show `ec2cceadfae72`: confirmed it has `Cc:
  stable@vger.kernel.org` and `Fixes: 86ef402d805d`
- [Phase 6] git tag --contains `86ef402d805d`: first in v6.15-rc1
- [Phase 6] git log v7.0.. -- gpio-tps65086.c: no changes after v7.0 tag
  (patch not yet applied)
- [Phase 8] Failure mode: un-rate-limited dev_warn on every GPIO read.
  Not crash/corruption, but real log noise.
- UNVERIFIED: Could not access lore discussion for the specific tps65086
  patch due to anti-bot protection

The fix is a trivially correct one-line change with zero risk that
silences a repeated runtime warning. It's part of a coordinated upstream
effort whose core component is already marked for stable. While it
doesn't fix a crash or corruption, it eliminates genuine user-visible
annoyance and properly fixes the driver's API contract violation.

**YES**

 drivers/gpio/gpio-tps65086.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tps65086.c b/drivers/gpio/gpio-tps65086.c
index 84b17b83476f5..df770ecf28bc4 100644
--- a/drivers/gpio/gpio-tps65086.c
+++ b/drivers/gpio/gpio-tps65086.c
@@ -50,7 +50,7 @@ static int tps65086_gpio_get(struct gpio_chip *chip, unsigned offset)
 	if (ret < 0)
 		return ret;
 
-	return val & BIT(4 + offset);
+	return !!(val & BIT(4 + offset));
 }
 
 static int tps65086_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.53.0


