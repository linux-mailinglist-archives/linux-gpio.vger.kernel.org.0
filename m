Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604B927A6DC
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 07:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgI1FSV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 01:18:21 -0400
Received: from z5.mailgun.us ([104.130.96.5]:51997 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbgI1FSU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 01:18:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601270299; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=cbFm9FwT8XucchocMhLL/B0Omvmdtwq5rVewksZLN5M=; b=rUoUXOSxsupSCo0LqKZUvswpWF505Y3nbCID7UXED0bknHdeUM4Us7Wqu7tvMD2R+rYz3UCX
 Pi/hx9V5CygRmSweWSFSxMbBmEcmQNsQAC+p4EPqKR4aIaKPoFn0dH81noy70ZuPnJZfMzgb
 byPKNJ5QXJBzqwq7a672YeooXp4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f7171bb971b64f61b557b60 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 05:16:43
 GMT
Sender: varada=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81BFDC433CA; Mon, 28 Sep 2020 05:16:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from varda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: varada)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B3B6BC43385;
        Mon, 28 Sep 2020 05:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3B6BC43385
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=varada@codeaurora.org
From:   Varadarajan Narayanan <varada@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, varada@codeaurora.org,
        nsekar@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, sricharan@codeaurora.org
Subject: [PATCH 1/7] clk: qcom: clk-alpha-pll: Add support for Stromer PLLs
Date:   Mon, 28 Sep 2020 10:45:34 +0530
Message-Id: <1601270140-4306-2-git-send-email-varada@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add programming sequence support for managing the Stromer
PLLs.

Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 156 ++++++++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-alpha-pll.h |   5 ++
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 26139ef..ce3257f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -116,6 +116,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_OPMODE] = 0x38,
 		[PLL_OFF_ALPHA_VAL] = 0x40,
 	},
+
+	[CLK_ALPHA_PLL_TYPE_STROMER] = {
+		[PLL_OFF_L_VAL] = 0x08,
+		[PLL_OFF_ALPHA_VAL] = 0x10,
+		[PLL_OFF_ALPHA_VAL_U] = 0x14,
+		[PLL_OFF_USER_CTL] = 0x18,
+		[PLL_OFF_USER_CTL_U] = 0x1c,
+		[PLL_OFF_CONFIG_CTL] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U] = 0xff,
+		[PLL_OFF_TEST_CTL] = 0x30,
+		[PLL_OFF_TEST_CTL_U] = 0x34,
+		[PLL_OFF_STATUS] = 0x28,
+	},
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
@@ -127,6 +140,8 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define ALPHA_BITWIDTH		32U
 #define ALPHA_SHIFT(w)		min(w, ALPHA_BITWIDTH)
 
+#define	PLL_STATUS_REG_SHIFT	8
+
 #define PLL_HUAYRA_M_WIDTH		8
 #define PLL_HUAYRA_M_SHIFT		8
 #define PLL_HUAYRA_M_MASK		0xff
@@ -210,7 +225,7 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
-	u32 val, mask;
+	u32 val, val_u, mask, mask_u;
 
 	regmap_write(regmap, PLL_L_VAL(pll), config->l);
 	regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
@@ -240,14 +255,143 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	mask |= config->pre_div_mask;
 	mask |= config->post_div_mask;
 	mask |= config->vco_mask;
+	mask |= config->alpha_en_mask;
+	mask |= config->alpha_mode_mask;
 
 	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
 
+	/* Stromer APSS PLL does not enable LOCK_DET by default, so enable it */
+	val_u = config->status_reg_val << PLL_STATUS_REG_SHIFT;
+	val_u |= config->lock_det;
+
+	mask_u = config->status_reg_mask;
+	mask_u |= config->lock_det;
+
+	if (val_u != 0)
+		regmap_update_bits(regmap, PLL_USER_CTL_U(pll), mask_u, val_u);
+
+	if (config->test_ctl_val != 0)
+		regmap_write(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+
+	if (config->test_ctl_hi_val != 0)
+		regmap_write(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
 }
 EXPORT_SYMBOL_GPL(clk_alpha_pll_configure);
 
+static unsigned long
+alpha_pll_stromer_calc_rate(u64 prate, u32 l, u64 a)
+{
+	return (prate * l) + ((prate * a) >> ALPHA_REG_BITWIDTH);
+}
+
+static unsigned long
+alpha_pll_stromer_round_rate(unsigned long rate, unsigned long prate, u32 *l, u64 *a)
+{
+	u64 remainder;
+	u64 quotient;
+
+	quotient = rate;
+	remainder = do_div(quotient, prate);
+	*l = quotient;
+
+	if (!remainder) {
+		*a = 0;
+		return rate;
+	}
+
+	quotient = remainder << ALPHA_REG_BITWIDTH;
+
+	remainder = do_div(quotient, prate);
+
+	if (remainder)
+		quotient++;
+
+	*a = quotient;
+	return alpha_pll_stromer_calc_rate(prate, *l, *a);
+}
+
+static unsigned long
+clk_alpha_pll_stromer_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	u32 l, low, high, ctl;
+	u64 a = 0, prate = parent_rate;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+
+	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
+	if (ctl & PLL_ALPHA_EN) {
+		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &low);
+		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
+			    &high);
+		a = (u64)high << ALPHA_BITWIDTH | low;
+	}
+
+	return alpha_pll_stromer_calc_rate(prate, l, a);
+}
+
+static int clk_alpha_pll_stromer_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	unsigned long rate = req->rate;
+	u32 l;
+	u64 a;
+
+	rate = alpha_pll_stromer_round_rate(rate, req->best_parent_rate, &l, &a);
+
+	return 0;
+}
+
+static int clk_alpha_pll_stromer_set_rate(struct clk_hw *hw, unsigned long rate,
+					 unsigned long prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l;
+	int ret;
+	u64 a;
+
+	rate = alpha_pll_stromer_round_rate(rate, prate, &l, &a);
+
+	/* Write desired values to registers */
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
+					a >> ALPHA_BITWIDTH);
+
+	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
+			   PLL_ALPHA_EN, PLL_ALPHA_EN);
+
+	if (!clk_hw_is_enabled(hw))
+		return 0;
+
+	/* Stromer PLL supports Dynamic programming.
+	 * It allows the PLL frequency to be changed on-the-fly without first
+	 * execution of a shutdown procedure followed by a bring up procedure.
+	 */
+
+	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE,
+			   PLL_UPDATE);
+	/* Make sure PLL_UPDATE request goes through */
+	mb();
+
+	/* Wait for PLL_UPDATE to be cleared */
+	ret = wait_for_pll_update(pll);
+	if (ret)
+		return ret;
+
+	/* Wait 11or more PLL clk_ref ticks[to be explored more on wait] */
+
+	/* Poll LOCK_DET for one */
+	ret = wait_for_pll_enable_lock(pll);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
 	int ret;
@@ -898,6 +1042,16 @@ const struct clk_ops clk_alpha_pll_hwfsm_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_hwfsm_ops);
 
+const struct clk_ops clk_alpha_pll_stromer_ops = {
+	.enable = clk_alpha_pll_enable,
+	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
+	.recalc_rate = clk_alpha_pll_stromer_recalc_rate,
+	.determine_rate = clk_alpha_pll_stromer_determine_rate,
+	.set_rate = clk_alpha_pll_stromer_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_stromer_ops);
+
 const struct clk_ops clk_alpha_pll_fixed_trion_ops = {
 	.enable = clk_trion_pll_enable,
 	.disable = clk_trion_pll_disable,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index d3201b8..3e25b1b 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -15,6 +15,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_FABIA,
 	CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
+	CLK_ALPHA_PLL_TYPE_STROMER,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
@@ -121,6 +122,9 @@ struct alpha_pll_config {
 	u32 post_div_mask;
 	u32 vco_val;
 	u32 vco_mask;
+	u32 status_reg_val;
+	u32 status_reg_mask;
+	u32 lock_det;
 };
 
 extern const struct clk_ops clk_alpha_pll_ops;
@@ -129,6 +133,7 @@ extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 extern const struct clk_ops clk_alpha_pll_huayra_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ro_ops;
+extern const struct clk_ops clk_alpha_pll_stromer_ops;
 
 extern const struct clk_ops clk_alpha_pll_fabia_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_fabia_ops;
-- 
2.7.4

