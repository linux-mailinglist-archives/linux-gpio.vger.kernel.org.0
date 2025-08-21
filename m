Return-Path: <linux-gpio+bounces-24743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC1B2F84F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8A331CE1DAE
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658D6311C31;
	Thu, 21 Aug 2025 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NpfUtSVw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B9C311C03
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780031; cv=none; b=GJvuMTJFV0aQcxRBi8zQqh6YySkqf5YNdi6O/LJSS2iG7J+WSD/MSw7kqk6PGeGSshfiNQ+MEfACtpRHN4cj//auEejoYGLjGljtXz2BvD+EInh4LscAvVn5ouuUvObAwJ7e4mCswmPK9+BRTtXpq2+RJaU06sn7w6N47pq5V1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780031; c=relaxed/simple;
	bh=Ygx/6i9fDNSyVdBqXnb5C9TqfXiEiFyWFWNwmCZzuho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=jNBH548ow6e1GnAROMH/OkKrS5s4rxa0ARql2KpQBzCeoEYhpmIwy4El/AcwmWref9P9sidFv6q32oUmZh9aEjKzBFjRFt11fkCseeKG2S+oqkSHvCKqRfef0o9JtjT25ymB2f+WyE2eP88KCcg+fqNr0Cc1h0hmGL4bgOgbyq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NpfUtSVw; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250821124026epoutp029d96a0ddf5c0186e0eb24c0b84d5bc90~dyKHGys3k0273302733epoutp02r
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250821124026epoutp029d96a0ddf5c0186e0eb24c0b84d5bc90~dyKHGys3k0273302733epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780026;
	bh=EopF+6K6AGEYqU238mUq7RmxlB52Ks3bm7uhQjFXMF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpfUtSVwF0q8QI3whIhzsUSh1n1C6nmofokqtimMcRVOX4ysJGri2uOMAkbKyT5Nj
	 wDJfZvYmvRnb4b42aeAJeQdw/+ageD86SrOM3FCuZq/SQZ8B6veqQ4nb4/K1NqA1Hg
	 PxP/EzkP6b5XArcFmvyEjEUViEUwhD/8a9qbFc4k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250821124026epcas5p2ab38c669eea5e066418045909845755c~dyKGUI6q_1778717787epcas5p2k;
	Thu, 21 Aug 2025 12:40:26 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c72wT0ft7z6B9m5; Thu, 21 Aug
	2025 12:40:25 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250821124024epcas5p349dda3c9e0523cc07acf2889476beeb1~dyKEsh07f1856118561epcas5p30;
	Thu, 21 Aug 2025 12:40:24 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124019epsmtip25fd548e6582d5ad4a811cd1dd82c686c~dyKAG5vTA2603426034epsmtip2U;
	Thu, 21 Aug 2025 12:40:19 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v2 02/10] clk: samsung: Add clock PLL support for ARTPEC-8
 SoC
Date: Thu, 21 Aug 2025 18:02:46 +0530
Message-ID: <20250821123310.94089-3-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124024epcas5p349dda3c9e0523cc07acf2889476beeb1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124024epcas5p349dda3c9e0523cc07acf2889476beeb1
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124024epcas5p349dda3c9e0523cc07acf2889476beeb1@epcas5p3.samsung.com>

From: Hakyeong Kim <hgkim05@coasia.com>

Add below clock PLL support for Axis ARTPEC-8 SoC platform:
- pll_1017x: Integer PLL with mid frequency FVCO (950 to 2400 MHz)
             This is used in ARTPEC-8 SoC for shared PLL

- pll_1031x: Integer/Fractional PLL with mid frequency FVCO
             (600 to 1200 MHz)
             This is used in ARTPEC-8 SoC for Audio PLL

FOUT calculation for pll_1017x and pll_1031x:
FOUT = (MDIV x FIN)/(PDIV x 2^SDIV) for integer PLL
FOUT = (((MDIV + KDIV)/65536) x FIN)/(PDIV x 2^SDIV) for fractional PLL

Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 128 +++++++++++++++++++++++++++++++++-
 drivers/clk/samsung/clk-pll.h |   2 +
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index fe8abe442c51..614063396e23 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -273,7 +273,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx)
+	if (pll->type == pll_142xx || pll->type == pll_1017x)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -1325,6 +1325,125 @@ static const struct clk_ops samsung_pll531x_clk_ops = {
 	.recalc_rate = samsung_pll531x_recalc_rate,
 };
 
+/*
+ * PLL1031x Clock Type
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
@@ -1373,6 +1492,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1451x:
 	case pll_1452x:
 	case pll_142xx:
+	case pll_1017x:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
@@ -1468,6 +1588,12 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
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
2.49.0


