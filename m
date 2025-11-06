Return-Path: <linux-gpio+bounces-28155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE4FC3987C
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 09:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C6694F665D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 08:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8BD3009E4;
	Thu,  6 Nov 2025 08:08:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCB12FA0F6;
	Thu,  6 Nov 2025 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416492; cv=none; b=PGRToqBkc9CenIi/NEtk5xk9A1lBnydw6AgJUhMxdZPqFZXhPf6wfW5burDqJTHkeQCJdN/KPI8et4iKCOeGpfFDfoVymLjtD+Wp0HB7vd/cmcx5lIHxG2eoiXuohEqjy6dVCILFtat4VU3h37uijNnK4q5GLZjWgNX7KV8SenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416492; c=relaxed/simple;
	bh=zQF54YGxdip1p/b0RB0fDedsZEKacHGzvRUHq9IznVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b9mvDA6oBedgAQlwGlYzvIzypyDx2mCNLleBDrnxvTjuvzu9ouDWbLfPfIJEu0SrrWftlsS+SIwZb2o8zE4em1DRnG/1mn+VK6YIPl5YK9DBEfw9XPmJbPdDYPojkIRGzfOBPPNZbDZNgoOmNyVseQyKaN5fgzMgU5uJVJNBIU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: MH4Rch2vTO2vIfkJRw8GNA==
X-CSE-MsgGUID: wj30XI7qR4ScPQOJwu/rJQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2025 17:08:04 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.113])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D359400755B;
	Thu,  6 Nov 2025 17:08:01 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: biju.das.jz@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Pavel Machek <pavel@denx.de>
Subject: [PATCH] pinctrl: renesas: rzg2l: Refactor OEN register PWPR handling
Date: Thu,  6 Nov 2025 09:07:58 +0100
Message-ID: <20251106080758.36645-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the OEN register write with PWPR protection logic into a helper
function to eliminate code duplication between rzg2l_write_oen() and
rzg2l_pinctrl_resume_noirq().

Introduce rzg2l_oen_write_with_pwpr() helper that encapsulates the
PWPR unlock, OEN register write, and PWPR lock sequence. This helper
must be called with pctrl->lock already held by the caller.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/cip-dev/OS9PR01MB16368C765305362F5F4132759FFC4A@OS9PR01MB16368.jpnprd01.prod.outlook.com/T/#u
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 53 +++++++++++++++----------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f25ecada5c692..863e779dda028 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1112,13 +1112,37 @@ static int rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 	return !(readb(pctrl->base + pctrl->data->hwcfg->regs.oen) & BIT(bit));
 }
 
-static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
+/**
+ * rzg2l_oen_write_with_pwpr - Write to OEN register with PWPR protection
+ * @pctrl: pinctrl driver data
+ * @val: value to write to OEN register
+ *
+ * Writes to the OEN register, handling PWPR write protection if required
+ * by the hardware configuration. Must be called with pctrl->lock held.
+ */
+static void rzg2l_oen_write_with_pwpr(struct rzg2l_pinctrl *pctrl, u8 val)
 {
 	const struct rzg2l_register_offsets *regs = &pctrl->data->hwcfg->regs;
+	u16 oen_offset = pctrl->data->hwcfg->regs.oen;
+	u8 pwpr;
+
+	if (pctrl->data->hwcfg->oen_pwpr_lock) {
+		pwpr = readb(pctrl->base + regs->pwpr);
+		writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
+	}
+
+	writeb(val, pctrl->base + oen_offset);
+
+	if (pctrl->data->hwcfg->oen_pwpr_lock)
+		writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
+}
+
+static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
+{
 	u16 oen_offset = pctrl->data->hwcfg->regs.oen;
 	unsigned long flags;
-	u8 val, pwpr;
 	int bit;
+	u8 val;
 
 	if (!pctrl->data->pin_to_oen_bit)
 		return -EOPNOTSUPP;
@@ -1133,13 +1157,8 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 		val &= ~BIT(bit);
 	else
 		val |= BIT(bit);
-	if (pctrl->data->hwcfg->oen_pwpr_lock) {
-		pwpr = readb(pctrl->base + regs->pwpr);
-		writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
-	}
-	writeb(val, pctrl->base + oen_offset);
-	if (pctrl->data->hwcfg->oen_pwpr_lock)
-		writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
+
+	rzg2l_oen_write_with_pwpr(pctrl, val);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
@@ -3200,7 +3219,6 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
 	unsigned long flags;
-	u8 pwpr;
 	int ret;
 
 	if (!atomic_read(&pctrl->wakeup_path)) {
@@ -3210,16 +3228,11 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	}
 
 	writeb(cache->qspi, pctrl->base + QSPI);
-	if (pctrl->data->hwcfg->oen_pwpr_lock) {
-		raw_spin_lock_irqsave(&pctrl->lock, flags);
-		pwpr = readb(pctrl->base + regs->pwpr);
-		writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
-	}
-	writeb(cache->oen, pctrl->base + pctrl->data->hwcfg->regs.oen);
-	if (pctrl->data->hwcfg->oen_pwpr_lock) {
-		writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
-		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-	}
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
-- 
2.25.1


