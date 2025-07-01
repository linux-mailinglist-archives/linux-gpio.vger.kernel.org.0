Return-Path: <linux-gpio+bounces-22469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2176AEF467
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 12:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01587188B2A7
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 10:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1812727281A;
	Tue,  1 Jul 2025 10:02:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62CD26FA50;
	Tue,  1 Jul 2025 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364129; cv=none; b=LlGEkfRtv7HBevWSlbbBonHyJdXymtJJeITEZWGvCAuanBfxMgzncYBM/Xqwv1xfsGdcLeJzm4ihZKnHs6em0QZqYNZyNMf/5lLc+5tU+s2XI3goKWSf8bjbnuTOXIFnZ5+ToEtL7rgc9fn1tD8eKT1QH14N/X52i4YlsEDJgN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364129; c=relaxed/simple;
	bh=b6Mws18//UdUf1HAPjqDRRtl5fVPkeBMSpyAAgA9X1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cCNBMV/+WJdaDO6aoyNpQk1XpJtMEWx+ucd4jKDf7gS3dV+RqZXGqdCx24yzy6dlI2EAmoX9hTHyL8EUsCDkZxuILNqp5jImNcYXKnmXDUFOhyxZG7Zv7Y2ZvoBWXk+Kc+DMICsKV/jmiCrRcvG62w3/GFVSbJqXjkniXubHqlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: C9RaqKrsTw6n2g0fCGxmnw==
X-CSE-MsgGUID: eoZCzhebQha4hbp/0KtrKg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Jul 2025 19:01:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.52])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1272540223EB;
	Tue,  1 Jul 2025 19:01:56 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Don't switch to GPIO during resume
Date: Tue,  1 Jul 2025 11:01:52 +0100
Message-ID: <20250701100154.37536-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though some pins are set correctly during resume(e.g.: PS0), due
to the unconditional switch to GPIO for restoring the PFC register is
triggering spurious IRQ on RZ/G3E. So avoid switch to GPIO if the pin
is configured correctly during resume.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 35 ++++++++++++++++---------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2a10ae0bf5bd..09ee771b1e36 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3118,27 +3118,36 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 		pm = readw(pctrl->base + PM(off));
 		for_each_set_bit(pin, &pinmap, max_pin) {
 			struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+			u32 pfc_mask;
+			u32 pfc_val;
+			u8 pmc_val;
 
 			/* Nothing to do if PFC was not configured before. */
 			if (!(cache->pmc[port] & BIT(pin)))
 				continue;
 
-			/* Set pin to 'Non-use (Hi-Z input protection)' */
-			pm &= ~(PM_MASK << (pin * 2));
-			writew(pm, pctrl->base + PM(off));
+			pfc_val = readl(pctrl->base + PFC(off));
+			pmc_val = readb(pctrl->base + PMC(off)) & BIT(pin);
+			pfc_mask = PFC_MASK << (pin * 4);
 
-			/* Temporarily switch to GPIO mode with PMC register */
-			pmc &= ~BIT(pin);
-			writeb(pmc, pctrl->base + PMC(off));
+			if (!pmc_val || ((cache->pfc[port] & pfc_mask) != (pfc_val & pfc_mask))) {
+				/* Set pin to 'Non-use (Hi-Z input protection)' */
+				pm &= ~(PM_MASK << (pin * 2));
+				writew(pm, pctrl->base + PM(off));
 
-			/* Select Pin function mode. */
-			pfc &= ~(PFC_MASK << (pin * 4));
-			pfc |= (cache->pfc[port] & (PFC_MASK << (pin * 4)));
-			writel(pfc, pctrl->base + PFC(off));
+				/* Temporarily switch to GPIO mode with PMC register */
+				pmc &= ~BIT(pin);
+				writeb(pmc, pctrl->base + PMC(off));
 
-			/* Switch to Peripheral pin function. */
-			pmc |= BIT(pin);
-			writeb(pmc, pctrl->base + PMC(off));
+				/* Select Pin function mode. */
+				pfc &= ~pfc_mask;
+				pfc |= cache->pfc[port] & pfc_mask;
+				writel(pfc, pctrl->base + PFC(off));
+
+				/* Switch to Peripheral pin function. */
+				pmc |= BIT(pin);
+				writeb(pmc, pctrl->base + PMC(off));
+			}
 		}
 	}
 
-- 
2.43.0


