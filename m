Return-Path: <linux-gpio+bounces-26428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F39CB8D9C5
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 13:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE513BB199
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 11:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8810025C81E;
	Sun, 21 Sep 2025 11:16:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC9625A645;
	Sun, 21 Sep 2025 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758453380; cv=none; b=QuBYi3FxDdXJsjda5EcJm86lO/uPcsXUNE/buUwB3epLGlkxGMf4+Is0ULTLf5T6zvX42ZERjqKthaLlIBe/iQmwPGzOt0i17HMqoFeoe14eFglFtAxrjusat/NVCSUlznSH3xoNCQxn61oMEB+XQGzdQht32EWoCwo/sFZxWEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758453380; c=relaxed/simple;
	bh=UpbXyrQ0blJ7h0PCDJ/49mnrDbFLigC2UUCMRuB29Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhrTkk1vgMsM9x3kiYGvE+XUgad493ZvT4b3KlqXony4q/DTa1oPb8MIM6XRMzmXkHCTC53gPcz44uOoSkcaHw3KoZNkexKxMI8eFPY5GyG9+zI0mbH8g4AYdzkYwIkohnXDTkKgvtjFT2RnqYuYM83laM/XbMN1jzc38Z+raqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: uLH8IYV8QQSu/zBPYuGRPA==
X-CSE-MsgGUID: /unLjb6tTUWq3IsNVoP2zw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Sep 2025 20:16:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.3])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0EF6E40061AE;
	Sun, 21 Sep 2025 20:16:05 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
Date: Sun, 21 Sep 2025 12:15:53 +0100
Message-ID: <20250921111557.103069-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921111557.103069-1-biju.das.jz@bp.renesas.com>
References: <20250921111557.103069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to reconfigure the pin if the pin's configuration values
are same as the reset values. E.g.: PS0 pin configuration for NMI function
is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
code is first setting it to GPIO HI-Z state and then again reconfiguring
to NMI function leading to spurious IRQ. Drop the unnecessary pin
configurations from the driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * Dropped extra space before the == operator.
 * Moved spinlock acquire before reading pfc value.
 * Make sure it is configured for function in PMC register for
   skipping GPIO switch.
v1->v2:
 * Updated commit header and description.
 * Added check in rzg2l_pinctrl_set_pfc_mode() to avoid unnecessary
   configuration
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 94cb77949f59..5ae8d28199d5 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -541,7 +541,11 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
 	unsigned long flags;
-	u32 reg;
+	u32 reg, pfc;
+
+	pfc = readl(pctrl->base + PFC(off));
+	if (((pfc >> (pin * 4)) & PFC_MASK)  == func)
+		return;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 
@@ -557,9 +561,8 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 	writeb(reg & ~BIT(pin), pctrl->base + PMC(off));
 
 	/* Select Pin function mode with PFC register */
-	reg = readl(pctrl->base + PFC(off));
-	reg &= ~(PFC_MASK << (pin * 4));
-	writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
+	pfc &= ~(PFC_MASK << (pin * 4));
+	writel(pfc | (func << (pin * 4)), pctrl->base + PFC(off));
 
 	/* Switch to Peripheral pin function with PMC register */
 	reg = readb(pctrl->base + PMC(off));
@@ -3117,11 +3120,18 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 		pm = readw(pctrl->base + PM(off));
 		for_each_set_bit(pin, &pinmap, max_pin) {
 			struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+			u32 pfc_val, pfc_mask;
 
 			/* Nothing to do if PFC was not configured before. */
 			if (!(cache->pmc[port] & BIT(pin)))
 				continue;
 
+			pfc_val = readl(pctrl->base + PFC(off));
+			pfc_mask = PFC_MASK << (pin * 4);
+			/* Nothing to do if reset value of the pin is same as cached value */
+			if ((cache->pfc[port] & pfc_mask) == (pfc_val & pfc_mask))
+				continue;
+
 			/* Set pin to 'Non-use (Hi-Z input protection)' */
 			pm &= ~(PM_MASK << (pin * 2));
 			writew(pm, pctrl->base + PM(off));
@@ -3131,8 +3141,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 			writeb(pmc, pctrl->base + PMC(off));
 
 			/* Select Pin function mode. */
-			pfc &= ~(PFC_MASK << (pin * 4));
-			pfc |= (cache->pfc[port] & (PFC_MASK << (pin * 4)));
+			pfc &= ~pfc_mask;
+			pfc |= (cache->pfc[port] & pfc_mask);
 			writel(pfc, pctrl->base + PFC(off));
 
 			/* Switch to Peripheral pin function. */
-- 
2.43.0


