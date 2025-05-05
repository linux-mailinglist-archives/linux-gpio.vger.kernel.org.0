Return-Path: <linux-gpio+bounces-19635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293FEAAB1AD
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 06:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CF013A2C00
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 04:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC25440360D;
	Tue,  6 May 2025 00:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWo4kDR7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B4F2D903E;
	Mon,  5 May 2025 22:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485512; cv=none; b=MCX33a/DJiM3g0vTA4s6IKTa3ZgGMaUNYCYQ/qogAiTqyE/p9zTX1P/QLmkMSBEXYbAKvM5GCz0xpzFShtm1/uiPaXrvCs4ElvpSQqLA8tWIIx27MK2JpF9TrnIiM7h44jk6TjEi+mhykScyESuRvKw2jBKt6IF3JlBmGyLaEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485512; c=relaxed/simple;
	bh=TWNIECLFDrGssxfIRWwMyGx7uVm/cZCl4qk3I1Gtj7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bhC1D7aN9ZAVAXf4hvarLKHoQ3t+4C9PqVlUgIQiLmSaNTnPjNb3KdIGWHpdp2gu7XQTOqpbc9isCFS0orDHisBSqkBx6JEEwZsj44bsdSxHZdge8ZqCovSrWDKUO6kA0rHGee1hvtVWJuHAC4tH5A7R3mvt3Bx8pTP7cjwQ8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWo4kDR7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7FDC4CEEE;
	Mon,  5 May 2025 22:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485511;
	bh=TWNIECLFDrGssxfIRWwMyGx7uVm/cZCl4qk3I1Gtj7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YWo4kDR7SPVh2TxUYcsHYhyCS//M6slchxdkzi6pt5AEmWZWAieLvZ3KkN0wwIuvh
	 Tt9/sgU8Zjqn5pf5GyQ2e6WSVN8nl2NskywrayzieYkqVDhfDJBdv7sz6tKH/KJRFc
	 nNPX+gq7XLIdvdGjHijQONyh+JrMfpafbznzipK8v4aXc+4vE7atSsCVVlevqwpzZc
	 uiEGq+AXnkZ8bwZJM4fHOIYI1nWYvwX76UbkqeHiUZfZsFGXkEltlGq1sGaeqWoT7v
	 1ZvLC8msGBN8Lz8uWbSmcgrI1dLMr7Cg2iBHxQ3raCx7L8HHQSK+PDXrHvOVtXaoA8
	 8INRjoMzaSqVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 353/486] pinctrl: renesas: rzg2l: Add suspend/resume support for pull up/down
Date: Mon,  5 May 2025 18:37:09 -0400
Message-Id: <20250505223922.2682012-353-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

[ Upstream commit b2bd65fbb617353e3c46ba5206b3b030fa0f260c ]

The Renesas RZ/G3S supports a power-saving mode where power to most of
the SoC components is lost, including the PIN controller.  Save and
restore the pull-up/pull-down register contents to ensure the
functionality is preserved after a suspend/resume cycle.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/20250205100116.2032765-1-claudiu.beznea.uj@bp.renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index d90685cfe2e1a..bde58f5a743cb 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -311,6 +311,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @pmc: PMC registers cache
  * @pfc: PFC registers cache
  * @iolh: IOLH registers cache
+ * @pupd: PUPD registers cache
  * @ien: IEN registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
@@ -324,6 +325,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*pfc;
 	u32	*iolh[2];
 	u32	*ien[2];
+	u32	*pupd[2];
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	eth_mode;
@@ -2539,6 +2541,11 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 		if (!cache->ien[i])
 			return -ENOMEM;
 
+		cache->pupd[i] = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->pupd[i]),
+					      GFP_KERNEL);
+		if (!cache->pupd[i])
+			return -ENOMEM;
+
 		/* Allocate dedicated cache. */
 		dedicated_cache->iolh[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
 							sizeof(*dedicated_cache->iolh[i]),
@@ -2779,7 +2786,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
 
 	for (u32 port = 0; port < nports; port++) {
-		bool has_iolh, has_ien;
+		bool has_iolh, has_ien, has_pupd;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -2791,6 +2798,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
+		has_pupd = !!(caps & PIN_CFG_PUPD);
 
 		if (suspend)
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PFC(off), cache->pfc[port]);
@@ -2809,6 +2817,15 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 			}
 		}
 
+		if (has_pupd) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
+						 cache->pupd[0][port]);
+			if (pincnt >= 4) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
+							 cache->pupd[1][port]);
+			}
+		}
+
 		RZG2L_PCTRL_REG_ACCESS16(suspend, pctrl->base + PM(off), cache->pm[port]);
 		RZG2L_PCTRL_REG_ACCESS8(suspend, pctrl->base + P(off), cache->p[port]);
 
-- 
2.39.5


