Return-Path: <linux-gpio+bounces-23045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCEEAFF5C2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 300763A8C57
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367CD2BCFB;
	Thu, 10 Jul 2025 00:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="cw0/FeF+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6153B280
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106866; cv=none; b=D4gfZ2Bzb/yAXJespSJEYBAtmLe9qOzMVg111Jve1ICdxaeCRSz5z2OsMDwjlEaOg5X5dxfOCUJ/Nwj2RMZ/DgiyXs9ndDkptJkrOtKwgcE3NA6z7MXrj8Q7af1Jb75JN/t1m6GLgrebmpi2We+GSBO5bJlK5wTeTb4+Skt/mCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106866; c=relaxed/simple;
	bh=N59AVMDA2VWEyFaQ8+75ktzECVGn6U3aLFqXowhwM6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rie6YsGAqMM1AHHEBQoDi7/ZmWQr1Zj9ftE2ZZ93yXf+hA00PQ1ALqbenmntW/p/0v70iLXIIpnRGpeeBLSLGC2KgQ2XPW1oCakZ278d/rdr4VOfkhk0X3v+nYdTKNWTvTfcdAidE/0k6txXFXvyF5YxBl+SwOyzSYv6SSbnHX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=cw0/FeF+; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106852; bh=N59AVMDA2VWEyFaQ8+75ktzECVGn6U3aLFqXowhwM6c=;
	l=6347; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=cw0/FeF+wPRTlGPbPZ979fS0EDK8sp77juUapZ9LnZalNn0vXObgeQbLnyNvAAKig
	 KoHwJDFx46YXHYxNtQPq4WSU6glJ2JLQlMcQpAXuSBzTitYzTkh/45nhrRFMImfvUL
	 Kuh66dzHKmmB04cC5S/6CjENbR+MXo5ylwGyhjFY=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:52 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	ksk4725@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	smn1196@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	ravi.patel@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	SungMin Park <smn1196@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 03/16] clk: samsung: Add clock PLL support for ARTPEC-8 SoC
Date: Thu, 10 Jul 2025 09:20:33 +0900
Message-Id: <20250710002047.1573841-4-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hakyeong Kim <hgkim05@coasia.com>

Add below clock PLL support for ARTPEC-8 SoC platform:
- pll_1017x
- pll_1031x

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/clk-pll.c | 129 +++++++++++++++++++++++++++++++++-
 drivers/clk/samsung/clk-pll.h |   2 +
 2 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index fe8abe442c51..3337483ff8b8 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -17,6 +17,7 @@
 #include "clk.h"
 #include "clk-pll.h"
 
+#define PLL_TIMEOUT_MS		10U
 #define PLL_TIMEOUT_US		20000U
 #define PLL_TIMEOUT_LOOPS	1000000U
 
@@ -273,7 +274,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx)
+	if (pll->type == pll_142xx || pll->type == pll_1017x)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -1325,6 +1326,125 @@ static const struct clk_ops samsung_pll531x_clk_ops = {
 	.recalc_rate = samsung_pll531x_recalc_rate,
 };
 
+/*
+ * PLL1031X Clock Type
+ */
+#define PLL1031X_LOCK_FACTOR	(500)
+
+#define PLL1031X_MDIV_MASK	(0x3ff)
+#define PLL1031X_PDIV_MASK	(0x3f)
+#define PLL1031X_SDIV_MASK	(0x7)
+#define PLL1031X_MDIV_SHIFT	(16)
+#define PLL1031X_PDIV_SHIFT	(8)
+#define PLL1031X_SDIV_SHIFT	(0)
+
+#define PLL1031X_KDIV_MASK	(0xffff)
+#define PLL1031X_KDIV_SHIFT	(0)
+#define PLL1031X_MFR_MASK	(0x3f)
+#define PLL1031X_MRR_MASK	(0x1f)
+#define PLL1031X_MFR_SHIFT	(16)
+#define PLL1031X_MRR_SHIFT	(24)
+
+static unsigned long samsung_pll1031x_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 mdiv, pdiv, sdiv, kdiv, pll_con0, pll_con3;
+	u64 fvco = parent_rate;
+
+	pll_con0 = readl_relaxed(pll->con_reg);
+	pll_con3 = readl_relaxed(pll->con_reg + 0xc);
+	mdiv = (pll_con0 >> PLL1031X_MDIV_SHIFT) & PLL1031X_MDIV_MASK;
+	pdiv = (pll_con0 >> PLL1031X_PDIV_SHIFT) & PLL1031X_PDIV_MASK;
+	sdiv = (pll_con0 >> PLL1031X_SDIV_SHIFT) & PLL1031X_SDIV_MASK;
+	kdiv = (pll_con3 & PLL1031X_KDIV_MASK);
+
+	fvco *= (mdiv << PLL1031X_MDIV_SHIFT) + kdiv;
+	do_div(fvco, (pdiv << sdiv));
+	fvco >>= PLL1031X_MDIV_SHIFT;
+
+	return (unsigned long)fvco;
+}
+
+static bool samsung_pll1031x_mpk_change(u32 pll_con0, u32 pll_con3,
+					const struct samsung_pll_rate_table *rate)
+{
+	u32 old_mdiv, old_pdiv, old_kdiv;
+
+	old_mdiv = (pll_con0 >> PLL1031X_MDIV_SHIFT) & PLL1031X_MDIV_MASK;
+	old_pdiv = (pll_con0 >> PLL1031X_PDIV_SHIFT) & PLL1031X_PDIV_MASK;
+	old_kdiv = (pll_con3 >> PLL1031X_KDIV_SHIFT) & PLL1031X_KDIV_MASK;
+
+	return (old_mdiv != rate->mdiv || old_pdiv != rate->pdiv ||
+		old_kdiv != rate->kdiv);
+}
+
+static int samsung_pll1031x_set_rate(struct clk_hw *hw, unsigned long drate,
+				     unsigned long prate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	const struct samsung_pll_rate_table *rate;
+	u32 con0, con3;
+
+	/* Get required rate settings from table */
+	rate = samsung_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+		       drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	con0 = readl_relaxed(pll->con_reg);
+	con3 = readl_relaxed(pll->con_reg + 0xc);
+
+	if (!(samsung_pll1031x_mpk_change(con0, con3, rate))) {
+		/* If only s change, change just s value only */
+		con0 &= ~(PLL1031X_SDIV_MASK << PLL1031X_SDIV_SHIFT);
+		con0 |= rate->sdiv << PLL1031X_SDIV_SHIFT;
+		writel_relaxed(con0, pll->con_reg);
+
+		return 0;
+	}
+
+	/* Set PLL lock time. */
+	writel_relaxed(rate->pdiv * PLL1031X_LOCK_FACTOR, pll->lock_reg);
+
+	/* Set PLL M, P, and S values. */
+	con0 &= ~((PLL1031X_MDIV_MASK << PLL1031X_MDIV_SHIFT) |
+		  (PLL1031X_PDIV_MASK << PLL1031X_PDIV_SHIFT) |
+		  (PLL1031X_SDIV_MASK << PLL1031X_SDIV_SHIFT));
+
+	con0 |= (rate->mdiv << PLL1031X_MDIV_SHIFT) |
+		(rate->pdiv << PLL1031X_PDIV_SHIFT) |
+		(rate->sdiv << PLL1031X_SDIV_SHIFT);
+
+	/* Set PLL K, MFR and MRR values. */
+	con3 = readl_relaxed(pll->con_reg + 0xc);
+	con3 &= ~((PLL1031X_KDIV_MASK << PLL1031X_KDIV_SHIFT) |
+		  (PLL1031X_MFR_MASK << PLL1031X_MFR_SHIFT) |
+		  (PLL1031X_MRR_MASK << PLL1031X_MRR_SHIFT));
+	con3 |= (rate->kdiv << PLL1031X_KDIV_SHIFT) |
+		(rate->mfr << PLL1031X_MFR_SHIFT) |
+		(rate->mrr << PLL1031X_MRR_SHIFT);
+
+	/* Write configuration to PLL */
+	writel_relaxed(con0, pll->con_reg);
+	writel_relaxed(con3, pll->con_reg + 0xc);
+
+	/* Wait for PLL lock if the PLL is enabled */
+	return samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
+}
+
+static const struct clk_ops samsung_pll1031x_clk_ops = {
+	.recalc_rate = samsung_pll1031x_recalc_rate,
+	.round_rate = samsung_pll_round_rate,
+	.set_rate = samsung_pll1031x_set_rate,
+};
+
+static const struct clk_ops samsung_pll1031x_clk_min_ops = {
+	.recalc_rate = samsung_pll1031x_recalc_rate,
+};
+
 static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 				const struct samsung_pll_clock *pll_clk)
 {
@@ -1373,6 +1493,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1451x:
 	case pll_1452x:
 	case pll_142xx:
+	case pll_1017x:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
@@ -1468,6 +1589,12 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_4311:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
+	case pll_1031x:
+		if (!pll->rate_table)
+			init.ops = &samsung_pll1031x_clk_min_ops;
+		else
+			init.ops = &samsung_pll1031x_clk_ops;
+		break;
 	default:
 		pr_warn("%s: Unknown pll type for pll clk %s\n",
 			__func__, pll_clk->name);
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index e9a5f8e0e0a3..6c8bb7f26da5 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -49,6 +49,8 @@ enum samsung_pll_type {
 	pll_0718x,
 	pll_0732x,
 	pll_4311,
+	pll_1017x,
+	pll_1031x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.34.1


