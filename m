Return-Path: <linux-gpio+bounces-31350-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A9ROjS9gGl3AgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31350-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:05:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9BCDD95
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE0633030E6C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 14:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73A6378821;
	Mon,  2 Feb 2026 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uciOcZj6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4537881F;
	Mon,  2 Feb 2026 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044305; cv=none; b=Fe6pzXVt8Y/9dRAS2Iqr64HVo81XpZjhZ5knhxZn/RGXVp4LnuLcP/ujnFHl+SG1Fp/ryOgL2XfJdzEZhF9g+TnZxNg8hve640YRTcyJU5T/NUJISALmZzREX3UHYt2uk5I8W0MIy4+eE8XRyT0cHkm+b/cOmbeHthHg0Af7yK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044305; c=relaxed/simple;
	bh=onT3QaTRY0xTkD5kNCCvjIsdUkdS7xb9ckzbZSKX7t4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEVQ2agryVeTjv4QbktoeeQXOvwi4rjEJikgBZLBf04VKcQnS/oO90sIv97grVgMKKWKbCXHiQxTR92UeUUHRwGPiV/kwwBE0Yded0NVsszzB9GiDyWpeaxtA6EpP7JxL/bCVWreIEorWUWuiUd8s8itvmfc41bD6vIY6lTlPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uciOcZj6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD612C2BCB1;
	Mon,  2 Feb 2026 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044305;
	bh=onT3QaTRY0xTkD5kNCCvjIsdUkdS7xb9ckzbZSKX7t4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uciOcZj6KnD7BIl76BTJQBL8MfUAHfzuniX17qbONVuvona1cy7EDJiWmCfYUXQop
	 dtjuTQ0shEn/uZFFOjn34BfyuQFiz2CbR5M1fbChvJ/YPlfR/G9jDNJVGhHm9Q292F
	 m8yy+T7feKfW86D6ACEbaZr96v6AZyJ8qmKc47MGIRcqxwdM2e+2c+Al+iFxxzKGxc
	 tYgHrqIw0IvMcVzpWswmr4ysK1NiCA/r8Ikf47fUFG2sTKh6390ub2LXANu+t8V69V
	 vkkW6D6BlMafUDI5qpT41mK7edXrlvxeVZICv7XUWGFrXFJiFvirSlxjTWxBMLiLQS
	 JV0NR31MbQsQg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Feb 2026 15:57:38 +0100
Subject: [PATCH RFC 6/8] clk: qcom: Remove tcsrcc-sm8750
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=5682;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=0DfW/RMcdv2idv95WiA/x5h2RxFFNXGhR2LLy+IJWBY=;
 b=O+U6pwIXi3l1ChB1HXernBRH4Jojjz5fibiZIbuf7eRq6Aj4/wNHK1IEWk5WveiaVdSt99onL
 m61QHuTB6u3BgqQ4kkwoTqyR6bn40De0EaXNoTKszctZ0NmU1QBoe62
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31350-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D3C9BCDD95
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is now handled from within the pinctrl subsystem, since there is
no "CC" block inside SM8750's TCSR, as the corresponding hardware is
present within TLMM. Remove the leftovers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |   8 ---
 drivers/clk/qcom/Makefile        |   1 -
 drivers/clk/qcom/tcsrcc-sm8750.c | 141 ---------------------------------------
 3 files changed, 150 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb74..f3ed33173ef6 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1506,14 +1506,6 @@ config SM_TCSRCC_8650
 	  Support for the TCSR clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
 
-config SM_TCSRCC_8750
-	tristate "SM8750 TCSR Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	select QCOM_GDSC
-	help
-	  Support for the TCSR clock controller on SM8750 devices.
-	  Say Y if you want to use peripheral devices such as UFS/USB/PCIe.
-
 config SA_VIDEOCC_8775P
 	tristate "SA8775P Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6b0ad8832b55..f8c81844ee48 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -184,7 +184,6 @@ obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
-obj-$(CONFIG_SM_TCSRCC_8750) += tcsrcc-sm8750.o
 obj-$(CONFIG_SM_VIDEOCC_6350) += videocc-sm6350.o
 obj-$(CONFIG_SM_VIDEOCC_7150) += videocc-sm7150.o
 obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
deleted file mode 100644
index 242e320986ef..000000000000
--- a/drivers/clk/qcom/tcsrcc-sm8750.c
+++ /dev/null
@@ -1,141 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-/*
- * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
- */
-
-#include <linux/clk-provider.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
-
-#include "clk-branch.h"
-#include "clk-regmap.h"
-#include "clk-regmap-divider.h"
-#include "clk-regmap-mux.h"
-#include "common.h"
-
-enum {
-	DT_BI_TCXO_PAD,
-};
-
-static struct clk_branch tcsr_pcie_0_clkref_en = {
-	.halt_reg = 0x0,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x0,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_0_clkref_en",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch tcsr_ufs_clkref_en = {
-	.halt_reg = 0x1000,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1000,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_ufs_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch tcsr_usb2_clkref_en = {
-	.halt_reg = 0x2000,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x2000,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch tcsr_usb3_clkref_en = {
-	.halt_reg = 0x3000,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x3000,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb3_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_regmap *tcsr_cc_sm8750_clocks[] = {
-	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
-	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
-	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
-	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
-};
-
-static const struct regmap_config tcsr_cc_sm8750_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x3000,
-	.fast_io = true,
-};
-
-static const struct qcom_cc_desc tcsr_cc_sm8750_desc = {
-	.config = &tcsr_cc_sm8750_regmap_config,
-	.clks = tcsr_cc_sm8750_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
-};
-
-static const struct of_device_id tcsr_cc_sm8750_match_table[] = {
-	{ .compatible = "qcom,sm8750-tcsr" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, tcsr_cc_sm8750_match_table);
-
-static int tcsr_cc_sm8750_probe(struct platform_device *pdev)
-{
-	return qcom_cc_probe(pdev, &tcsr_cc_sm8750_desc);
-}
-
-static struct platform_driver tcsr_cc_sm8750_driver = {
-	.probe = tcsr_cc_sm8750_probe,
-	.driver = {
-		.name = "tcsr_cc-sm8750",
-		.of_match_table = tcsr_cc_sm8750_match_table,
-	},
-};
-
-static int __init tcsr_cc_sm8750_init(void)
-{
-	return platform_driver_register(&tcsr_cc_sm8750_driver);
-}
-subsys_initcall(tcsr_cc_sm8750_init);
-
-static void __exit tcsr_cc_sm8750_exit(void)
-{
-	platform_driver_unregister(&tcsr_cc_sm8750_driver);
-}
-module_exit(tcsr_cc_sm8750_exit);
-
-MODULE_DESCRIPTION("QTI TCSR_CC SM8750 Driver");
-MODULE_LICENSE("GPL");

-- 
2.52.0


