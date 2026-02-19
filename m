Return-Path: <linux-gpio+bounces-31833-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNpJN/dxlmlqfQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31833-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:14:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61615BA03
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B157E305D481
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 02:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEFD3101C6;
	Thu, 19 Feb 2026 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHlPGcmm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E79E30FF25;
	Thu, 19 Feb 2026 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771466707; cv=none; b=IG7Gkn7IoW0iSmlrd6A+dxByfjvtBO+jFrM34j8WQW0sbNbAq5xMhlJb3fTb2np1N1BR5sxZPvjZtFQdHcSQ+54UJoQhR4EOZ1jSg9ePVEaQVwaVAy0L6LVSWpsrHyvUZjTiE3rUBNBtL0Jh26+/e5xslez0wlI6+H28HySNQO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771466707; c=relaxed/simple;
	bh=D73wScJAC375XHCH4oZKOpkSXn1g9xaFJmyXXU/9UKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/kSckIXcpSFfdLzu9vC1dpysc5WrAEwaZI1wSxnt4NyXVqp0RXMH6/KR41KBphLMwRRGOKZymptFBcpD1UJoJWI2ilWSTtWug9y8e3y9EVCXinPq+mZFUWoMRgODqlFrq/pA6TvNkFSrAJkgOzJSwEeMsC+WF3AeH4w/ci+upw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHlPGcmm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B6AC116D0;
	Thu, 19 Feb 2026 02:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466707;
	bh=D73wScJAC375XHCH4oZKOpkSXn1g9xaFJmyXXU/9UKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SHlPGcmmCWc0L3iooCbHuBf8E5HBd0k5RhB5XDrRKy8Bn9X5piuxN7GnplB4mR1SB
	 c55XzbF3xdiMGp5KzfhShD+Ji4jJa621u2FyNSWxjDW0NFysOtxgyZbaphXIAkeRXQ
	 WyB/wIjRPgkIgjq+9jm+0XsF5sCpavvKt/OyGbYsHu/DgDfMzIJCAXY0pJzDnLaGNi
	 jiKqgUwNXx4sbEzwJk43vGFF+chfRrUnOy2UsS1zw49cJy3MXTQgc1IQH3UOyv631a
	 pRlmcfLyFnwvpsVR+6V2+1hneJ/tPl80TfEjBK/c60RrHrj2dZ8lzX9Ut58HUl8EfI
	 nBIVCw1wuOknQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>,
	linusw@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] pinctrl: renesas: rzt2h: Allow .get_direction() for IRQ function GPIOs
Date: Wed, 18 Feb 2026 21:04:10 -0500
Message-ID: <20260219020422.1539798-34-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31833-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,glider.be:email,msgid.link:url]
X-Rspamd-Queue-Id: 5A61615BA03
X-Rspamd-Action: no action

From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

[ Upstream commit 49b039a61a314c18074c15a7047705399e1240e6 ]

Setting up an IRQ would normally be done in the .activate() and
.deactivate() ops of the IRQ domain, but for hierarchical IRQ domains
the .activate() and .deactivate() ops are overridden in the
gpiochip_hierarchy_setup_domain_ops() function.

As such, activating and deactivating need to be done in the .translate()
and .free() ops of the IRQ domain.

For RZ/T2H and RZ/N2H, interrupts go through the pin controller, into
the ICU, which level-translates them and forwards them to the GIC.

To use a GPIO as an interrupt it needs to be put into peripheral
function mode 0, which will connect it to the IRQ lines of the ICU.

The IRQ chip .child_to_parent_hwirq() callback is called as part of the
IRQ fwspec parsing logic (as part of irq_create_of_mapping()) which
happens before the IRQ is requested (as part of gpiochip_lock_as_irq()).

gpiochip_lock_as_irq() calls gpiod_get_direction() if the
.get_direction() callback is provided to ensure that the GPIO line is
set up as input.

In our case, IRQ function is separate from GPIO, and both cannot be true
at the same time.

Return GPIO_LINE_DIRECTION_IN even if pin is in IRQ function to allow
this setup to work.

Hold the spinlock to ensure atomicity between reading the PMC register
(which determines whether the pin is in GPIO mode or not) and reading
the function of the pin when it is not in GPIO mode.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://patch.msgid.link/20251205150234.2958140-3-cosmin-gabriel.tanislav.xa@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Confirmed: The PFC register read pattern with `rzt2h_pinctrl_readq` and
the `PFC_MASK` at line 141 is consistent with what the fix does. The new
code reads `PFC(port)` and masks with `PFC_MASK`, which is the same
pattern used in the existing `rzt2h_pinctrl_set_pfc` function.

### Verification

- **Verified**: The driver `pinctrl-rzt2h.c` was introduced in commit
  34d4d093077a5, first appearing in v6.18. Active stable trees v6.18.y
  and v6.19.y contain this driver.
- **Verified**: `gpiochip_lock_as_irq()` at gpiolib.c:4088-4095 calls
  `gpiod_get_direction()` and fails if it returns negative, confirming
  the bug mechanism described in the commit message.
- **Verified**: The original `rzt2h_gpio_get_direction()` returns
  `-EINVAL` unconditionally when PMC bit is set (line 496-497 of current
  code), which would fail IRQ setup.
- **Verified**: `rzt2h_pinctrl_readq` is generated by macro at line 104
  and already used for PFC reads (line 140), so no new functions are
  needed.
- **Verified**: `PFC_MASK` is already defined (line 51: `GENMASK_ULL(5,
  0)`), so the mask pattern is correct.
- **Verified**: The PFC function 0 being the IRQ function is consistent
  with the hardware description (peripheral function mode 0 connects to
  ICU IRQ lines, as stated in the commit message).
- **Verified**: The spinlock `pctrl->lock` is already used in other
  functions (e.g., `rzt2h_gpio_set_direction` at line 475,
  `rzt2h_pinctrl_set_pfc` at line 128), so adding it to `get_direction`
  is consistent.
- **Verified**: No additional commits are needed as dependencies - the
  code being modified exists in the base driver.
- **Unverified**: Whether the commit has been explicitly discussed on
  linux-stable mailing list (did not search lore.kernel.org).

### Summary

**What the commit fixes**: GPIO pins on Renesas RZ/T2H and RZ/N2H SoCs
cannot be used as interrupt sources because the GPIO direction query
fails when the pin is in IRQ function mode, causing
`gpiochip_lock_as_irq()` to fail.

**Stable kernel criteria**:
- **Obviously correct**: Yes - the logic is clear and well-explained.
  When a pin is in IRQ mode (peripheral function 0), reporting it as
  input direction is the correct semantic.
- **Fixes a real bug**: Yes - GPIO IRQ functionality is broken without
  this fix.
- **Small and contained**: Yes - ~20 lines in a single function in a
  single driver file.
- **No new features**: Correct - this fixes existing GPIO/IRQ
  interaction, not adding new functionality.
- **Reviewed**: Yes - reviewed by Geert Uytterhoeven (Renesas subsystem
  maintainer).

**Risk vs benefit**: Very low risk (single driver, narrow hardware
scope, no architectural changes) vs. high benefit (enables GPIO IRQ
functionality on these SoCs).

**Concern**: The driver only exists in v6.18+ stable trees, limiting the
scope of backporting. No older stable trees are affected.

**YES**

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 4826ff91cd906..40df706210119 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -51,6 +51,7 @@
 
 #define PFC_MASK		GENMASK_ULL(5, 0)
 #define PFC_PIN_MASK(pin)	(PFC_MASK << ((pin) * 8))
+#define PFC_FUNC_INTERRUPT	0
 
 /*
  * Use 16 lower bits [15:0] for pin identifier
@@ -486,6 +487,7 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
+	u64 reg64;
 	u16 reg;
 	int ret;
 
@@ -493,8 +495,25 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	if (rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit))
+	guard(spinlock_irqsave)(&pctrl->lock);
+
+	if (rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit)) {
+		/*
+		 * When a GPIO is being requested as an IRQ, the pinctrl
+		 * framework expects to be able to read the GPIO's direction.
+		 * IRQ function is separate from GPIO, and enabling it takes the
+		 * pin out of GPIO mode.
+		 * At this point, .child_to_parent_hwirq() has already been
+		 * called to enable the IRQ function.
+		 * Default to input direction for IRQ function.
+		 */
+		reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
+		reg64 = (reg64 >> (bit * 8)) & PFC_MASK;
+		if (reg64 == PFC_FUNC_INTERRUPT)
+			return GPIO_LINE_DIRECTION_IN;
+
 		return -EINVAL;
+	}
 
 	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
 	reg = (reg >> (bit * 2)) & PM_MASK;
-- 
2.51.0


