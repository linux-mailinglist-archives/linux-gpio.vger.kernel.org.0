Return-Path: <linux-gpio+bounces-35270-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KClC+445mlutgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35270-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:32:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC6E42D283
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DC9D30306D9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A81481FCD;
	Mon, 20 Apr 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXpVwyGi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5158481FC5;
	Mon, 20 Apr 2026 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691910; cv=none; b=U3PAPGwOC/kHybJIKnLeig5pOttf2hAHiml+/Nq1umIvXkZTPwEYz9T5O9aGpgzRcuzWikplkQjKCr172upECBatGGdqDTZUhyoaXw2TRdUJoEcAwJRpLR7z6vwI73id80Y1thNLmu11/5re97UiUTu/7VNLVQVVPfebRlcwYSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691910; c=relaxed/simple;
	bh=mA7U/R/o4PFajNO17IAo08Ol59rFT9blZeVBaB5gODI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/6/TVD03mnnfNjzAQZ5rCLcCsnpiMVS+jbPQRWxvHunB4RfyBh1ayH01GtSW09oPJpf/W6z+svcwWzERUp+HzICggrp0KPAsVLdRgDvxiirVf+ic69Yq9v8KH8YzIWzRbj4LeoZvuZP3VQm2VKu8CeZ3ppvTzAezWfl9v1zsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXpVwyGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367FAC2BCB7;
	Mon, 20 Apr 2026 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691910;
	bh=mA7U/R/o4PFajNO17IAo08Ol59rFT9blZeVBaB5gODI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lXpVwyGiONC6V1zFbppD9uTaLmRi8OdpKi+IpaK76fwAU6CEGaXKI7IC4nsXvwhfn
	 sxnvqkaY2wEnY4mWcjz2qUVlRSp/jsRcj+19L9SUANt3Sj397SxUjHA3LILZpyJ/LX
	 u6Tp7b2nEDT2AqWsgwlYvFxJn6P/3xuLKVS6uv1ZFhxsvK4Xh4H5OPMnIRpE45xfW1
	 ghnKollgjvx/uGoG6xWW0coHEnQe9reOasWGydnI8Mam0jx7HhyuE212ivbHB4PfmH
	 6g6Zv6KP7RNCqK1iYzFkFCVkb7sttjzxhZKb1S9EZYK1NTTEBvbwgYPKV8VvRJe7Vb
	 jwR2heP77LvVw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	marek.vasut+renesas@gmail.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] gpio: bd9571mwv: normalize return value of gpio_get
Date: Mon, 20 Apr 2026 09:20:58 -0400
Message-ID: <20260420132314.1023554-264-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35270-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CCC6E42D283
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit c43778680546dd379b3d8219c177b1a34ba87002 ]

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by bd9571mwv_gpio_get() is
normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://patch.msgid.link/20260218190657.2974723-1-dmitry.torokhov@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have the full picture. Let me compile the complete analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1**: Subsystem: `gpio/bd9571mwv`. Action verb: "normalize"
(ensure correctness). Summary: Normalize the return value of the GPIO
get callback to comply with the API contract (0 or 1).

**Step 1.2**: Tags:
- `Signed-off-by: Dmitry Torokhov` - author, well-known kernel
  maintainer (input subsystem lead)
- `Link:` to patch.msgid.link for the original submission
- `Signed-off-by: Bartosz Golaszewski` - GPIO subsystem maintainer who
  applied it
- No `Fixes:` tag, no `Cc: stable`, no `Reported-by:` in this specific
  commit

**Step 1.3**: The commit message states the GPIO `get()` callback API
contract requires return values of 0 or 1 (or negative error). The
driver was returning `val & BIT(offset)` which can return values like 2
for offset 1.

**Step 1.4**: This IS a bug fix despite neutral "normalize" language. It
fixes an API contract violation that became a functional bug after
gpiolib changes.

## PHASE 2: DIFF ANALYSIS

**Step 2.1**: Single file changed (`drivers/gpio/gpio-bd9571mwv.c`),
single line modified. Function: `bd9571mwv_gpio_get()`.

**Step 2.2**: Before: `return val & BIT(offset)` returns 0, 1, 2, 4,
etc. depending on offset. After: `return !!(val & BIT(offset))` returns
0 or 1.

**Step 2.3**: Bug category: **Logic/correctness fix + API contract
violation**. The driver has `.ngpio = 2` (offsets 0 and 1). For offset
0, `BIT(0) = 1`, so the return was 0 or 1 (fine). For offset 1, `BIT(1)
= 2`, so the return was 0 or 2 (broken).

The critical context is commit `86ef402d805d` ("gpiolib: sanitize the
return value of gpio_chip::get()"), merged in v6.15-rc1, which made
gpiolib return `-EBADE` when `get()` returns > 1. This turned the API
violation into a **functional failure** for GPIO offset 1.

Subsequently, `ec2cceadfae72` ("gpiolib: normalize the return value of
gc->get() on behalf of buggy drivers"), merged in v7.0-rc2, softened
this to normalize the value with a warning instead of returning -EBADE.

**Step 2.4**: Fix quality: Trivially correct. `!!` is a well-established
C pattern for boolean normalization. Zero regression risk.

## PHASE 3: GIT HISTORY

**Step 3.1**: The buggy `return val & BIT(offset)` line was introduced
in `9384793036afb7` (2017-04-25) - the original driver addition by Marek
Vasut. This code has been present since ~v4.13.

**Step 3.2**: The commit under review has no Fixes: tag. However, the
identical fix in related drivers (`2bb995e6155cb` for qca807x,
`e2fa075d5ce19` for ti-ads7950) both have `Fixes: 86ef402d805d`. From
the mailing list discussion, Andrew Lunn asked Dmitry to add a Fixes:
tag on the qca807x version, and it was agreed to reference
`86ef402d805d`.

**Step 3.3**: `86ef402d805d` was introduced in v6.15-rc1. It is NOT in
v6.12 or v6.6 stable trees (confirmed by `git merge-base --is-
ancestor`). The safety-net `ec2cceadfae72` has `Cc: stable` and `Fixes:
86ef402d805d`, so it will be backported to v6.15.y.

**Step 3.4**: Dmitry Torokhov is a well-known kernel maintainer (Linux
input subsystem lead). He submitted multiple "normalize return value of
gpio_get" patches across different drivers simultaneously, all fixing
the same class of bug. He was also the reporter of the issue that led to
`ec2cceadfae72`.

**Step 3.5**: No prerequisites needed. The `!!` change is standalone.

## PHASE 4: MAILING LIST RESEARCH

From the mailing list discussion of the qca807x patch (same author, same
pattern):
- Andrew Lunn asked for a Fixes: tag and suggested `86ef402d805d`
- Linus Walleij gave Reviewed-by
- Bartosz Golaszewski (GPIO maintainer) gave Reviewed-by
- The author confirmed this is a fix for the gpiolib tightening
- The bd9571mwv patch was sent separately and routed through GPIO
  maintainer directly

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1**: Only `bd9571mwv_gpio_get()` is modified.

**Step 5.2**: This is called by gpiolib core (`gpiochip_get()` wrapper
at line 3259 of gpiolib.c), which validates the return value:

```3259:3275:/home/sasha/linux-autosel-7.0/drivers/gpio/gpiolib.c
static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
{
        int ret;

        lockdep_assert_held(&gc->gpiodev->srcu);

        /* Make sure this is called after checking for gc->get(). */
        ret = gc->get(gc, offset);
        if (ret > 1) {
                gpiochip_warn(gc,
                        "invalid return value from gc->get(): %d,
consider fixing the driver\n",
                        ret);
                ret = !!ret;
        }

        return ret;
}
```

**Step 5.4**: The call chain is: userspace GPIO access ->
gpiod_get_value() -> gpio_chip_get_value() -> gpiochip_get() ->
gc->get() (= bd9571mwv_gpio_get). This is reachable from userspace via
the GPIO chardev interface.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1**: The *original* bug (returning > 1) has existed since
v4.13, but it was harmless until `86ef402d805d` (v6.15-rc1). The code
that makes this a *real* bug only exists in v6.15+.

**Step 6.2**: Clean apply expected - the file has barely changed. Only
the one line being fixed.

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1**: GPIO driver for ROHM BD9571MWV/BD9574MWF PMIC (Renesas
R-Car platforms). Criticality: PERIPHERAL (specific embedded hardware).

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1**: Affects users of Renesas R-Car platforms with ROHM
BD9571MWV PMIC GPIO.

**Step 8.2**: Triggered any time GPIO offset 1 is read. Common operation
for users of this hardware.

**Step 8.3**:
- Without `ec2cceadfae72`: GPIO reads on offset 1 return -EBADE
  (functional failure, severity HIGH)
- With `ec2cceadfae72`: GPIO reads on offset 1 trigger a kernel warning
  (severity MEDIUM)

**Step 8.4**:
- BENEFIT: Fixes functional correctness for this driver; eliminates
  kernel warnings
- RISK: Essentially zero - one-character change (`!!` addition),
  obviously correct, same pattern applied to 5+ other drivers
- Ratio: Highly favorable

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- One-line, obviously correct fix (!! normalization)
- Fixes a real API contract violation that causes functional failure or
  warnings
- Same fix pattern applied to multiple drivers by the same author
- Related patches have `Fixes: 86ef402d805d` tag (omission in this patch
  appears accidental)
- Reviewed and applied by GPIO subsystem maintainer Bartosz Golaszewski
- Reviewed by Linus Walleij (on related patches)
- Zero regression risk
- The gpiolib wrapper `ec2cceadfae72` explicitly says "consider fixing
  the driver" in its warning message - this IS that fix

**Evidence AGAINST backporting:**
- No explicit `Fixes:` tag or `Cc: stable` on this specific commit
- The safety net `ec2cceadfae72` already prevents functional failure
  (converts to warning)
- Affects niche hardware (ROHM PMIC on Renesas platforms)
- The underlying issue (`86ef402d805d`) only exists in v6.15+, limiting
  stable tree applicability

**Stable rules checklist:**
1. Obviously correct? YES - `!!` is a trivial, standard normalization
2. Fixes a real bug? YES - API violation causing -EBADE or warnings
3. Important issue? MEDIUM - functional failure without safety net;
   warnings with it
4. Small and contained? YES - one line, one file
5. No new features? Correct
6. Can apply to stable? YES - clean apply expected

## Verification

- [Phase 1] Parsed tags: No Fixes: or Cc: stable on this commit
  (expected for AUTOSEL candidate)
- [Phase 2] Diff: single line `return val & BIT(offset)` → `return
  !!(val & BIT(offset))` in bd9571mwv_gpio_get()
- [Phase 3] git blame: buggy code from commit 9384793036afb7 (v4.13,
  2017), present since driver creation
- [Phase 3] git show 86ef402d805d: confirmed gpiolib sanitize commit in
  v6.15-rc1, returns -EBADE for get() > 1
- [Phase 3] git show ec2cceadfae72: confirmed safety net commit in
  v7.0-rc2, normalizes with warning
- [Phase 3] merge-base: 86ef402d805d IS in v6.15 (exit=0), NOT in v6.12
  (exit=1) or v6.6 (exit=1)
- [Phase 3] Related patches 2bb995e6155cb (qca807x) and e2fa075d5ce19
  (ti-ads7950) both have `Fixes: 86ef402d805d`
- [Phase 4] Mailing list (via b4 dig on related qca807x patch): Andrew
  Lunn confirmed Fixes: 86ef402d805d is appropriate; Linus Walleij and
  Bartosz Golaszewski provided Reviewed-by
- [Phase 5] Call chain verified: userspace → gpiod_get_value →
  gpio_chip_get_value → gpiochip_get → bd9571mwv_gpio_get
- [Phase 5] gpiolib.c line 3267-3272: confirmed validation wrapper
  checks for ret > 1 and emits warning
- [Phase 6] Driver file unchanged since 2021; clean apply expected
- [Phase 8] .ngpio = 2 confirmed at line 93; offset 1 returns BIT(1) =
  2, triggering the bug

The fix is a trivially correct one-line change that addresses a real API
contract violation. It eliminates either -EBADE errors (v6.15 without
safety net) or kernel warnings (v7.0 with safety net) when reading GPIO
offset 1. The fix carries essentially zero regression risk and is part
of a coordinated effort by the author to fix this class of bug across
multiple drivers, with identical patches in other drivers having
explicit `Fixes:` tags.

**YES**

 drivers/gpio/gpio-bd9571mwv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index 7c95bb36511e1..cc5b1746f2fe8 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -69,7 +69,7 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret < 0)
 		return ret;
 
-	return val & BIT(offset);
+	return !!(val & BIT(offset));
 }
 
 static int bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.53.0


