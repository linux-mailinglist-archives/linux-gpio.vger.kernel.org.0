Return-Path: <linux-gpio+bounces-31347-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCZpF/+9gGl3AgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31347-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:08:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE5CDEB0
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1A433160A0C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 14:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018A237A4AF;
	Mon,  2 Feb 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlDKB6vW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B472237757B;
	Mon,  2 Feb 2026 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044289; cv=none; b=hi1GYyUBm8A2UW7KfVWd64ORx25b0+WLiqntO3wTDVBav9Q6sUErBz03rrkHsZVxYFvXacV2AlxBa4884yr2SIZrW/Zwf6yUlnAZAM4k4VOlZ1TvKRCPx6Dad6H+UF9crfC/HD8YHBkJTGBLYCMNcEwkrcsp9uPI9Nqf3xSYVvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044289; c=relaxed/simple;
	bh=hSUDMemRVUoY0npdFDPpId4d3LZDbW1Q30SA0hltVEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyJtl7krODUi4hkXuEZCn9TxN+r5wA8fKnW/37K13TgYd/r6VDOK1HqnkT+yhxlHvcxXwlmtmOLL87Vmzm2AkHdJHMNemJq4IE56zlJxd75zmNQX4S9f2qbNPfpAk1p6Av3V9NJ7bNBcWnHI0TIyOtcXB2OY27LWhj15at6lzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlDKB6vW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CE0C116C6;
	Mon,  2 Feb 2026 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044289;
	bh=hSUDMemRVUoY0npdFDPpId4d3LZDbW1Q30SA0hltVEI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tlDKB6vWFEX2IqsSPC6Z+1HN2mjscqjc8033NUTLg20tqdJ1YEXlth+tFXTvVtV86
	 h7Wqmn6gcWLn2xdERzxUjIqRjLACaUemPcXzq76vBvALGKKjcYH6cor6cmY5hWvMl4
	 3sJZEGqR1tWSrgEgzC6mIaBrw8zlEqwR3dhjDRUmiN1uHqEApADPpv+MK7fGYlD+RL
	 aqm1i+V5UtXpsU+CsiixFBB3NE0g7SUdeuYoXn/+/hFg5Z+OGjN2rMgtJYSUIWGTaK
	 iCddsG68JjWYLmfUyOENEwzqVhYZH6ZDkfWM+q/s2Rn+mzSy/n6R1yuT1nfmWmhb4I
	 HS6qN4Cc5qKfA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Feb 2026 15:57:35 +0100
Subject: [PATCH RFC 3/8] pinctrl: qcom: Allow exposing reference clocks
 living in TLMM reg space
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
In-Reply-To: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
 Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=5326;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=OhZ2KA92dJ70lXXP48TBPU9L16SvJF50a/3w3QOui6Y=;
 b=fVkRsrz+nGOZjQaZvb483P6TQrKhcx9av3824ehABeteCt/6FVYFMsDLaZBnF840GD5cKB8BN
 IJpasMwOkRzAErlLaBLhmIad4tt5ySAZTu3SFpj3/CeoMIU8IYr8gcT
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31347-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,init.name:url]
X-Rspamd-Queue-Id: 18CE5CDEB0
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Certain platforms (at least SM8750) had a number of registers
(responsible for gating refclk output to various consumers) moved to
TLMM. They're simple on/off toggles.

Expose them from the msm-pinctrl driver to allow for a reasonable DT
representation.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 92 ++++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h | 14 ++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index e99871b90ab9..1a52431a8605 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2013, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
@@ -16,6 +17,7 @@
 #include <linux/pm.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/reboot.h>
+#include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -80,6 +82,7 @@ struct msm_pinctrl {
 	const struct msm_pinctrl_soc_data *soc;
 	void __iomem *regs[MAX_NR_TILES];
 	u32 phys_base[MAX_NR_TILES];
+	struct ref_clk ref_clks[];
 };
 
 #define MSM_ACCESSOR(name) \
@@ -1525,9 +1528,69 @@ SIMPLE_DEV_PM_OPS(msm_pinctrl_dev_pm_ops, msm_pinctrl_suspend,
 
 EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 
+static int clkref_enable(struct clk_hw *hw)
+{
+	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
+	u32 val;
+
+	regmap_write(rclk->regmap, rclk->init.offset, BIT(0));
+	udelay(10);
+
+	regmap_read(rclk->regmap, rclk->init.offset, &val);
+
+	return (val & BIT(0)) ? 0 : -EINVAL;
+}
+
+static void clkref_disable(struct clk_hw *hw)
+{
+	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
+
+	regmap_write(rclk->regmap, rclk->init.offset, 0);
+
+	udelay(10);
+}
+
+static int clkref_is_enabled(struct clk_hw *hw)
+{
+	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
+	u32 val;
+
+	regmap_read(rclk->regmap, rclk->init.offset, &val);
+
+	return !!val;
+}
+
+static const struct clk_ops clkref_ops = {
+	.enable = clkref_enable,
+	.disable = clkref_disable,
+	.is_enabled = clkref_is_enabled,
+};
+
+static struct clk_hw *msm_pinctrl_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct msm_pinctrl *pctrl = data;
+	u32 idx = clkspec->args[0];
+
+	if (idx >= pctrl->soc->num_ref_clks)
+		return ERR_PTR(-EINVAL);
+
+	return &pctrl->ref_clks[idx].hw;
+}
+
+static const struct clk_parent_data clkref_parent_data = {
+	.index = 0, /* RPM(h) XO clock */
+};
+
+static const struct regmap_config clkref_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+};
+
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	struct device *dev = &pdev->dev;
 	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
@@ -1595,6 +1658,35 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
+	if (soc_data->num_ref_clks) {
+		struct regmap *regmap = devm_regmap_init_mmio(dev, pctrl->regs[0],
+							      &clkref_regmap_config);
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
+
+		for (int i = 0; i < soc_data->num_ref_clks; i++) {
+			struct clk_hw *hw = &pctrl->ref_clks[i].hw;
+			struct clk_init_data init = { };
+
+			init.name = pctrl->soc->ref_clks[i]->name;
+			init.parent_data = &clkref_parent_data;
+			init.num_parents = 1;
+			init.ops = &clkref_ops;
+			hw->init = &init;
+
+			ret = devm_clk_hw_register(dev, hw);
+			if (ret)
+				return dev_err_probe(dev, ret, "Couldn't register clock %s\n",
+						     init.name);
+
+			pctrl->ref_clks[i].regmap = regmap;
+		}
+
+		ret = devm_of_clk_add_hw_provider(dev, msm_pinctrl_clk_get, pctrl);
+		if (ret)
+			return dev_err_probe(dev, ret, "Couldn't register clk provider\n");
+	}
+
 	platform_set_drvdata(pdev, pctrl);
 
 	dev_dbg(&pdev->dev, "Probed Qualcomm pinctrl driver\n");
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 4625fa5320a9..213cc789711d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -5,6 +5,7 @@
 #ifndef __PINCTRL_MSM_H__
 #define __PINCTRL_MSM_H__
 
+#include <linux/clk-provider.h>
 #include <linux/pm.h>
 #include <linux/types.h>
 
@@ -129,6 +130,17 @@ struct msm_gpio_wakeirq_map {
 	unsigned int wakeirq;
 };
 
+struct ref_clk_init_data {
+	const char * const name;
+	u32 offset;
+};
+
+struct ref_clk {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	struct ref_clk_init_data init;
+};
+
 /**
  * struct msm_pinctrl_soc_data - Qualcomm pin controller driver configuration
  * @pins:	    An array describing all pins the pin controller affects.
@@ -170,6 +182,8 @@ struct msm_pinctrl_soc_data {
 	bool wakeirq_dual_edge_errata;
 	unsigned int gpio_func;
 	unsigned int egpio_func;
+	const struct ref_clk_init_data **ref_clks;
+	unsigned int num_ref_clks;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;

-- 
2.52.0


