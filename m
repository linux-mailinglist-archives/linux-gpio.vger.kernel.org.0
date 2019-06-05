Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03562362AD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 19:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfFERaX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 13:30:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42460 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfFERaX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 13:30:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D3B896156F; Wed,  5 Jun 2019 17:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559755816;
        bh=zojRPO4qsQDaU6qObMhLx7QEVhvEOc7pUJW5vPglMJQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HAyRIH/829pQWzK8aCeN0+d7n9sWRDYaPxqkMzGyS66yHKztmnppwn+09h7X/kS4I
         pTm8keHbWs/abODgdQ3Hm/kwV13GF8cK0WuMs5H9sr4NgSKwg2dOBKKLL+sMOdHJmU
         YTFQcDJwG/cv2htGrRpkhTzPrh4vZat3PdO0Y7hM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 115BB61195;
        Wed,  5 Jun 2019 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559755767;
        bh=zojRPO4qsQDaU6qObMhLx7QEVhvEOc7pUJW5vPglMJQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Cyirjv/n/+vn7ZUtCB6tLywluCZgVijp/4Tv/u1oFH/49+XYA4HWyOwjU+0ae1Fhd
         YXHzZyZ5vEz1tkE00acgrn5k4y8SWd9hYcYqVkU3yxdjo7VaGyAOQcqAqeceNTQbso
         bD03drOZwvyvIdmRYPh7yyddnnPOLfh9QDlfXC1Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 115BB61195
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     robh+dt@kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] clk: qcom: Add ipq6018 Global Clock Controller support
Date:   Wed,  5 Jun 2019 22:58:56 +0530
Message-Id: <1559755738-28643-5-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the global clock controller found on
the ipq6018 based devices.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: anusha <anusharao@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/Kconfig       |    9 +
 drivers/clk/qcom/Makefile      |    1 +
 drivers/clk/qcom/gcc-ipq6018.c | 5267 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 5277 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-ipq6018.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e1ff83c..e5fb091 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -120,6 +120,15 @@ config IPQ_GCC_8074
 	  i2c, USB, SD/eMMC, etc. Select this for the root clock
 	  of ipq8074.
 
+config IPQ_GCC_6018
+	tristate "IPQ6018 Global Clock Controller"
+	depends on COMMON_CLK_QCOM
+	help
+	  Support for global clock controller on ipq6018 devices.
+	  Say Y if you want to use peripheral devices such as UART, SPI,
+	  i2c, USB, SD/eMMC, etc. Select this for the root clock
+	  of ipq6018.
+
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f0768fb..025137d 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
+obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
 obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
 obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
new file mode 100644
index 0000000..9f4552b
--- /dev/null
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -0,0 +1,5267 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+
+#include <linux/reset-controller.h>
+#include <dt-bindings/clock/qcom,gcc-ipq6018.h>
+
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-branch.h"
+#include "clk-alpha-pll.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "reset.h"
+
+#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
+
+enum {
+	P_XO,
+	P_BIAS_PLL,
+	P_UNIPHY0_RX,
+	P_UNIPHY0_TX,
+	P_UNIPHY1_RX,
+	P_BIAS_PLL_NSS_NOC,
+	P_UNIPHY1_TX,
+	P_PCIE20_PHY0_PIPE,
+	P_USB3PHY_0_PIPE,
+	P_GPLL0,
+	P_GPLL0_DIV2,
+	P_GPLL2,
+	P_GPLL4,
+	P_GPLL6,
+	P_SLEEP_CLK,
+	P_UBI32_PLL,
+	P_NSS_CRYPTO_PLL,
+	P_PI_SLEEP,
+};
+
+static const char * const gcc_xo_gpll0_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll0",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const char * const gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
+	"xo",
+	"bias_pll_cc_clk",
+	"gpll0",
+	"gpll4",
+	"nss_crypto_pll",
+	"ubi32_pll",
+};
+
+static const struct parent_map gcc_xo_bias_gpll0_gpll4_nss_ubi32_map[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL, 1 },
+	{ P_GPLL0, 2 },
+	{ P_GPLL4, 3 },
+	{ P_NSS_CRYPTO_PLL, 4 },
+	{ P_UBI32_PLL, 5 },
+};
+
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+};
+
+static const char * const gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2[] = {
+	"xo",
+	"bias_pll_nss_noc_clk",
+	"gpll0",
+	"gpll2",
+};
+
+static const struct parent_map gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2_map[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL_NSS_NOC, 1 },
+	{ P_GPLL0, 2 },
+	{ P_GPLL2, 3 },
+};
+
+static const char * const gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias[] = {
+	"xo",
+	"uniphy0_gcc_rx_clk",
+	"uniphy0_gcc_tx_clk",
+	"uniphy1_gcc_rx_clk",
+	"uniphy1_gcc_tx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map
+gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_RX, 1 },
+	{ P_UNIPHY0_TX, 2 },
+	{ P_UNIPHY1_RX, 3 },
+	{ P_UNIPHY1_TX, 4 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias[] = {
+	"xo",
+	"uniphy0_gcc_tx_clk",
+	"uniphy0_gcc_rx_clk",
+	"uniphy1_gcc_tx_clk",
+	"uniphy1_gcc_rx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map
+gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_TX, 1 },
+	{ P_UNIPHY0_RX, 2 },
+	{ P_UNIPHY1_TX, 3 },
+	{ P_UNIPHY1_RX, 4 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_gpll0_out_main_div2_gpll0[] = {
+	"xo",
+	"gpll0_out_main_div2",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_gpll0_out_main_div2_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_DIV2, 2 },
+	{ P_GPLL0, 1 },
+};
+
+static const char * const gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
+	"xo",
+	"uniphy0_gcc_rx_clk",
+	"uniphy0_gcc_tx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_RX, 1 },
+	{ P_UNIPHY0_TX, 2 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
+	"xo",
+	"uniphy0_gcc_tx_clk",
+	"uniphy0_gcc_rx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_TX, 1 },
+	{ P_UNIPHY0_RX, 2 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_gpll0_gpll6_ubi32_gpll0_div2[] = {
+	"xo",
+	"gpll0",
+	"gpll6",
+	"ubi32_pll",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map
+gcc_xo_gpll0_gpll6_ubi32_gpll0_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL6, 2 },
+	{ P_UBI32_PLL, 3 },
+	{ P_GPLL0_DIV2, 6 },
+};
+
+static const char * const gcc_xo_nss_crypto_pll_gpll0[] = {
+	"xo",
+	"nss_crypto_pll",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_nss_crypto_pll_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_NSS_CRYPTO_PLL, 1 },
+	{ P_GPLL0, 2 },
+};
+
+static const char * const gcc_xo_ubi32_pll_gpll0_gpll2_gpll4_gpll6[] = {
+	"xo",
+	"ubi32_pll",
+	"gpll0",
+	"gpll2",
+	"gpll4",
+	"gpll6",
+};
+
+static const struct parent_map gcc_xo_ubi32_gpll0_gpll2_gpll4_gpll6_map[] = {
+	{ P_XO, 0 },
+	{ P_UBI32_PLL, 1 },
+	{ P_GPLL0, 2 },
+	{ P_GPLL2, 3 },
+	{ P_GPLL4, 4 },
+	{ P_GPLL6, 5 },
+};
+
+static const char * const gcc_xo_gpll0_gpll2_gpll4_gpll6[] = {
+	"xo",
+	"gpll0",
+	"gpll2",
+	"gpll4",
+	"gpll6",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll2_gpll4_gpll6_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2, 2 },
+	{ P_GPLL4, 3 },
+	{ P_GPLL6, 4 },
+};
+
+static const char * const gcc_xo_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_DIV2, 1 },
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0",
+	"gpll4",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 2 },
+};
+
+static const char * const gcc_xo_gpll0_core_pi_sleep_clk[] = {
+	"xo",
+	"gpll0",
+	"sleep_clk",
+};
+
+static const struct parent_map gcc_xo_gpll0_core_pi_sleep_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 2 },
+	{ P_PI_SLEEP, 6 },
+};
+
+static const char * const gcc_pcie20_phy0_pipe_clk_xo[] = {
+	"pcie20_phy0_pipe_clk",
+	"xo",
+};
+
+static const struct parent_map gcc_pcie20_phy0_pipe_clk_xo_map[] = {
+	{ P_PCIE20_PHY0_PIPE, 0 },
+	{ P_XO, 2 },
+};
+
+static const char * const gcc_xo_gpll0_gpll2_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll0",
+	"gpll2",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll2_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2, 2 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const char * const gcc_xo_gpll6_gpll0_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll6",
+	"gpll0",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll6_gpll0_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL6, 1 },
+	{ P_GPLL0, 3 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const char * const gcc_usb3phy_0_cc_pipe_clk_xo[] = {
+	"usb3phy_0_cc_pipe_clk",
+	"xo",
+};
+
+static const struct parent_map gcc_usb3phy_0_cc_pipe_clk_xo_map[] = {
+	{ P_USB3PHY_0_PIPE, 0 },
+	{ P_XO, 2 },
+};
+
+static const char * const gcc_xo_gpll0_gpll6_gpll0_sleep_clk[] = {
+	"xo",
+	"gpll0",
+	"gpll6",
+	"gpll0_out_main_div2",
+	"sleep_clk",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll6_gpll0_sleep_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL6, 2 },
+	{ P_GPLL0_DIV2, 4 },
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const char * const gcc_xo_gpll0_gpll6_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll0",
+	"gpll6",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll6_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL6, 2 },
+	{ P_GPLL0_DIV2, 3 },
+};
+
+static const char * const gcc_xo_gpll4_gpll0_gpll6_gpll0_div2[] = {
+	"xo",
+	"gpll4",
+	"gpll0",
+	"gpll6",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll4_gpll0_gpll6_gpll0_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4, 1 },
+	{ P_GPLL0, 2 },
+	{ P_GPLL6, 3 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const char * const gcc_xo_gpll0_gpll6_gpll0_div2[] = {
+	"xo",
+	"gpll0",
+	"gpll6",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll6_gpll0_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL6, 2 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const char * const gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk[] = {
+	"xo",
+	"gpll0",
+	"gpll2",
+	"bias_pll_nss_noc_clk",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2, 3 },
+	{ P_BIAS_PLL_NSS_NOC, 4 },
+};
+
+static struct clk_alpha_pll gpll0_main = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_fixed_factor gpll0_out_main_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll0_out_main_div2",
+		.parent_names = (const char *[]){
+			"gpll0_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll0 = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll0",
+		.parent_names = (const char *[]){
+			"gpll0_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll ubi32_pll_main = {
+	.offset = 0x25000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA],
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "ubi32_pll_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_huayra_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv ubi32_pll = {
+	.offset = 0x25000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA],
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ubi32_pll",
+		.parent_names = (const char *[]){
+			"ubi32_pll_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll gpll6_main = {
+	.offset = 0x37000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_BRAMMO],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll6_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll6 = {
+	.offset = 0x37000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_BRAMMO],
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll6",
+		.parent_names = (const char *[]){
+			"gpll6_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll gpll4_main = {
+	.offset = 0x24000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll4_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll4 = {
+	.offset = 0x24000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4",
+		.parent_names = (const char *[]){
+			"gpll4_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x27000,
+	.freq_tbl = ftbl_pcnoc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcnoc_bfdcd_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor pcnoc_clk_src = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "pcnoc_clk_src",
+		.parent_names = (const char *[]){
+			"pcnoc_bfdcd_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll gpll2_main = {
+	.offset = 0x4a000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll2_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll2 = {
+	.offset = 0x4a000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll2",
+		.parent_names = (const char *[]){
+			"gpll2_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll nss_crypto_pll_main = {
+	.offset = 0x22000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_crypto_pll_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv nss_crypto_pll = {
+	.offset = 0x22000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_crypto_pll",
+		.parent_names = (const char *[]){
+			"nss_crypto_pll_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_qdss_tsctr_clk_src[] = {
+	F(160000000, P_GPLL0_DIV2, 2.5, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
+	F(600000000, P_GPLL4, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 qdss_tsctr_clk_src = {
+	.cmd_rcgr = 0x29064,
+	.freq_tbl = ftbl_qdss_tsctr_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll4_gpll0_gpll6_gpll0_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "qdss_tsctr_clk_src",
+		.parent_names = gcc_xo_gpll4_gpll0_gpll6_gpll0_div2,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor qdss_dap_sync_clk_src = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "qdss_dap_sync_clk_src",
+		.parent_names = (const char *[]){
+			"qdss_tsctr_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_qdss_at_clk_src[] = {
+	F(66670000, P_GPLL0_DIV2, 6, 0, 0),
+	F(240000000, P_GPLL4, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 qdss_at_clk_src = {
+	.cmd_rcgr = 0x2900c,
+	.freq_tbl = ftbl_qdss_at_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll4_gpll0_gpll6_gpll0_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "qdss_at_clk_src",
+		.parent_names = gcc_xo_gpll4_gpll0_gpll6_gpll0_div2,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor qdss_tsctr_div2_clk_src = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "qdss_tsctr_div2_clk_src",
+		.parent_names = (const char *[]){
+			"qdss_tsctr_clk_src"
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(300000000, P_BIAS_PLL, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_ppe_clk_src = {
+	.cmd_rcgr = 0x68080,
+	.freq_tbl = ftbl_nss_ppe_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_bias_gpll0_gpll4_nss_ubi32_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_ppe_clk_src",
+		.parent_names = gcc_xo_bias_gpll0_gpll4_nss_ubi32,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_xo_clk_src = {
+	.halt_reg = 0x30018,
+	.clkr = {
+		.enable_reg = 0x30018,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_xo_clk_src",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_ce_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_ce_clk_src = {
+	.cmd_rcgr = 0x68098,
+	.freq_tbl = ftbl_nss_ce_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_ce_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor system_noc_clk_src = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "system_noc_clk_src",
+		.parent_names = (const char *[]){
+			"system_noc_bfdcd_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_branch gcc_sleep_clk_src = {
+	.halt_reg = 0x30000,
+	.clkr = {
+		.enable_reg = 0x30000,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sleep_clk_src",
+			.parent_names = (const char *[]){
+				"sleep_clk"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_snoc_nssnoc_bfdcd_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_DIV2, 8, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(133333333, P_GPLL0, 6, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266666667, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 snoc_nssnoc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x76054,
+	.freq_tbl = ftbl_snoc_nssnoc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "snoc_nssnoc_bfdcd_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor snoc_nssnoc_clk_src = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "snoc_nssnoc_clk_src",
+		.parent_names = (const char *[]){
+			"snoc_nssnoc_bfdcd_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_apss_ahb_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0_DIV2, 16, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 apss_ahb_clk_src = {
+	.cmd_rcgr = 0x46000,
+	.freq_tbl = ftbl_apss_ahb_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "apss_ahb_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port5_rx_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY1_RX, 12.5, 0, 0),
+	F(25000000, P_UNIPHY0_RX, 5, 0, 0),
+	F(78125000, P_UNIPHY1_RX, 4, 0, 0),
+	F(125000000, P_UNIPHY1_RX, 2.5, 0, 0),
+	F(125000000, P_UNIPHY0_RX, 1, 0, 0),
+	F(156250000, P_UNIPHY1_RX, 2, 0, 0),
+	F(312500000, P_UNIPHY1_RX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port5_rx_clk_src = {
+	.cmd_rcgr = 0x68060,
+	.freq_tbl = ftbl_nss_port5_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port5_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias,
+		.num_parents = 7,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port5_tx_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY1_TX, 12.5, 0, 0),
+	F(25000000, P_UNIPHY0_TX, 5, 0, 0),
+	F(78125000, P_UNIPHY1_TX, 4, 0, 0),
+	F(125000000, P_UNIPHY1_TX, 2.5, 0, 0),
+	F(125000000, P_UNIPHY0_TX, 1, 0, 0),
+	F(156250000, P_UNIPHY1_TX, 2, 0, 0),
+	F(312500000, P_UNIPHY1_TX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port5_tx_clk_src = {
+	.cmd_rcgr = 0x68068,
+	.freq_tbl = ftbl_nss_port5_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port5_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias,
+		.num_parents = 7,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_pcie_axi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(240000000, P_GPLL4, 5, 0, 0),
+	{ }
+};
+
+static const struct freq_tbl ftbl_pcie_rchng_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 pcie0_axi_clk_src = {
+	.cmd_rcgr = 0x75054,
+	.freq_tbl = ftbl_pcie_axi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll4_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie0_axi_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll4,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb0_master_clk_src[] = {
+	F(80000000, P_GPLL0_DIV2, 5, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(133330000, P_GPLL0, 6, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb0_master_clk_src = {
+	.cmd_rcgr = 0x3e00c,
+	.freq_tbl = ftbl_usb0_master_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_out_main_div2_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb0_master_clk_src",
+		.parent_names = gcc_xo_gpll0_out_main_div2_gpll0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div apss_ahb_postdiv_clk_src = {
+	.reg = 0x46018,
+	.shift = 4,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "apss_ahb_postdiv_clk_src",
+			.parent_names = (const char *[]){
+				"apss_ahb_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor gcc_xo_div4_clk_src = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "gcc_xo_div4_clk_src",
+		.parent_names = (const char *[]){
+			"gcc_xo_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port1_rx_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY0_RX, 5, 0, 0),
+	F(125000000, P_UNIPHY0_RX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port1_rx_clk_src = {
+	.cmd_rcgr = 0x68020,
+	.freq_tbl = ftbl_nss_port1_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port1_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port1_tx_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY0_TX, 5, 0, 0),
+	F(125000000, P_UNIPHY0_TX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port1_tx_clk_src = {
+	.cmd_rcgr = 0x68028,
+	.freq_tbl = ftbl_nss_port1_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port1_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_port2_rx_clk_src = {
+	.cmd_rcgr = 0x68030,
+	.freq_tbl = ftbl_nss_port1_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port2_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_port2_tx_clk_src = {
+	.cmd_rcgr = 0x68038,
+	.freq_tbl = ftbl_nss_port1_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port2_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_port3_rx_clk_src = {
+	.cmd_rcgr = 0x68040,
+	.freq_tbl = ftbl_nss_port1_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port3_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_port3_tx_clk_src = {
+	.cmd_rcgr = 0x68048,
+	.freq_tbl = ftbl_nss_port1_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port3_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_port4_rx_clk_src = {
+	.cmd_rcgr = 0x68050,
+	.freq_tbl = ftbl_nss_port1_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port4_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_port4_tx_clk_src = {
+	.cmd_rcgr = 0x68058,
+	.freq_tbl = ftbl_nss_port1_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port4_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port5_rx_div_clk_src = {
+	.reg = 0x68440,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port5_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port5_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_port5_tx_div_clk_src = {
+	.reg = 0x68444,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port5_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port5_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_apss_axi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(308570000, P_GPLL6, 3.5, 0, 0),
+	F(400000000, P_GPLL0, 2, 0, 0),
+	F(533000000, P_GPLL0, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 apss_axi_clk_src = {
+	.cmd_rcgr = 0x38048,
+	.freq_tbl = ftbl_apss_axi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_ubi32_gpll0_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "apss_axi_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_ubi32_gpll0_div2,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_crypto_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(300000000, P_NSS_CRYPTO_PLL, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_crypto_clk_src = {
+	.cmd_rcgr = 0x68144,
+	.freq_tbl = ftbl_nss_crypto_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_nss_crypto_pll_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_crypto_clk_src",
+		.parent_names = gcc_xo_nss_crypto_pll_gpll0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port1_rx_div_clk_src = {
+	.reg = 0x68400,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port1_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port1_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_port1_tx_div_clk_src = {
+	.reg = 0x68404,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port1_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port1_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_port2_rx_div_clk_src = {
+	.reg = 0x68410,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port2_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port2_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_port2_tx_div_clk_src = {
+	.reg = 0x68414,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port2_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port2_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_port3_rx_div_clk_src = {
+	.reg = 0x68420,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port3_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port3_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_port3_tx_div_clk_src = {
+	.reg = 0x68424,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port3_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port3_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_port4_rx_div_clk_src = {
+	.reg = 0x68430,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port4_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port4_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_port4_tx_div_clk_src = {
+	.reg = 0x68434,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port4_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port4_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_ubi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(748800000, P_UBI32_PLL, 2, 0, 0),
+	F(1497600000, P_UBI32_PLL, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_ubi0_clk_src = {
+	.cmd_rcgr = 0x68104,
+	.freq_tbl = ftbl_nss_ubi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_ubi32_gpll0_gpll2_gpll4_gpll6_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_ubi0_clk_src",
+		.parent_names = gcc_xo_ubi32_pll_gpll0_gpll2_gpll4_gpll6,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_adss_pwm_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 adss_pwm_clk_src = {
+	.cmd_rcgr = 0x1c008,
+	.freq_tbl = ftbl_adss_pwm_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "adss_pwm_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_blsp1_qup_i2c_apps_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0_DIV2, 16, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0200c,
+	.freq_tbl = ftbl_blsp1_qup_i2c_apps_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup1_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_blsp1_qup_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 2, 5),
+	F(4800000, P_XO, 5, 0, 0),
+	F(9600000, P_XO, 2, 4, 5),
+	F(12500000, P_GPLL0_DIV2, 16, 1, 2),
+	F(16000000, P_GPLL0, 10, 1, 5),
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0, 16, 1, 2),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x02024,
+	.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup1_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x03000,
+	.freq_tbl = ftbl_blsp1_qup_i2c_apps_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup2_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
+	.cmd_rcgr = 0x03014,
+	.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup2_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x04000,
+	.freq_tbl = ftbl_blsp1_qup_i2c_apps_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup3_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
+	.cmd_rcgr = 0x04014,
+	.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup3_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x05000,
+	.freq_tbl = ftbl_blsp1_qup_i2c_apps_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup4_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x05014,
+	.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup4_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x06000,
+	.freq_tbl = ftbl_blsp1_qup_i2c_apps_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup5_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
+	.cmd_rcgr = 0x06014,
+	.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup5_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x07000,
+	.freq_tbl = ftbl_blsp1_qup_i2c_apps_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup6_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
+	.cmd_rcgr = 0x07014,
+	.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup6_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_blsp1_uart_apps_clk_src[] = {
+	F(3686400, P_GPLL0_DIV2, 1, 144, 15625),
+	F(7372800, P_GPLL0_DIV2, 1, 288, 15625),
+	F(14745600, P_GPLL0_DIV2, 1, 576, 15625),
+	F(16000000, P_GPLL0_DIV2, 5, 1, 5),
+	F(24000000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 1, 3, 100),
+	F(25000000, P_GPLL0, 16, 1, 2),
+	F(32000000, P_GPLL0, 1, 1, 25),
+	F(40000000, P_GPLL0, 1, 1, 20),
+	F(46400000, P_GPLL0, 1, 29, 500),
+	F(48000000, P_GPLL0, 1, 3, 50),
+	F(51200000, P_GPLL0, 1, 8, 125),
+	F(56000000, P_GPLL0, 1, 7, 100),
+	F(58982400, P_GPLL0, 1, 1152, 15625),
+	F(60000000, P_GPLL0, 1, 3, 40),
+	F(64000000, P_GPLL0, 12.5, 1, 1),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
+	.cmd_rcgr = 0x02044,
+	.freq_tbl = ftbl_blsp1_uart_apps_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_uart1_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
+	.cmd_rcgr = 0x03034,
+	.freq_tbl = ftbl_blsp1_uart_apps_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_uart2_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
+	.cmd_rcgr = 0x04034,
+	.freq_tbl = ftbl_blsp1_uart_apps_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_uart3_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
+	.cmd_rcgr = 0x05034,
+	.freq_tbl = ftbl_blsp1_uart_apps_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_uart4_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
+	.cmd_rcgr = 0x06034,
+	.freq_tbl = ftbl_blsp1_uart_apps_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_uart5_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
+	.cmd_rcgr = 0x07034,
+	.freq_tbl = ftbl_blsp1_uart_apps_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_uart6_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_crypto_clk_src[] = {
+	F(40000000, P_GPLL0_DIV2, 10, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 crypto_clk_src = {
+	.cmd_rcgr = 0x16004,
+	.freq_tbl = ftbl_crypto_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "crypto_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gp_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_DIV2, 8, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266666666, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp1_clk_src = {
+	.cmd_rcgr = 0x08004,
+	.freq_tbl = ftbl_gp_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_gpll0_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp1_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_gpll0_sleep_clk,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gp2_clk_src = {
+	.cmd_rcgr = 0x09004,
+	.freq_tbl = ftbl_gp_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_gpll0_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp2_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_gpll0_sleep_clk,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gp3_clk_src = {
+	.cmd_rcgr = 0x0a004,
+	.freq_tbl = ftbl_gp_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_gpll0_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp3_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_gpll0_sleep_clk,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor nss_ppe_cdiv_clk_src = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "nss_ppe_cdiv_clk_src",
+		.parent_names = (const char *[]){
+			"nss_ppe_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap_div nss_ubi0_div_clk_src = {
+	.reg = 0x68118,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_ubi0_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_ubi0_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ro_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_pcie_aux_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+};
+
+static struct clk_rcg2 pcie0_aux_clk_src = {
+	.cmd_rcgr = 0x75024,
+	.freq_tbl = ftbl_pcie_aux_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_core_pi_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie0_aux_clk_src",
+		.parent_names = gcc_xo_gpll0_core_pi_sleep_clk,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_mux pcie0_pipe_clk_src = {
+	.reg = 0x7501c,
+	.shift = 8,
+	.width = 2,
+	.parent_map = gcc_pcie20_phy0_pipe_clk_xo_map,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "pcie0_pipe_clk_src",
+			.parent_names = gcc_pcie20_phy0_pipe_clk_xo,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
+	F(144000, P_XO, 16, 12, 125),
+	F(400000, P_XO, 12, 1, 5),
+	F(24000000, P_GPLL2, 12, 1, 4),
+	F(48000000, P_GPLL2, 12, 1, 2),
+	F(96000000, P_GPLL2, 12, 0, 0),
+	F(177777778, P_GPLL0, 4.5, 0, 0),
+	F(192000000, P_GPLL2, 6, 0, 0),
+	F(384000000, P_GPLL2, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x42004,
+	.freq_tbl = ftbl_sdcc_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc1_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb_aux_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb0_aux_clk_src = {
+	.cmd_rcgr = 0x3e05c,
+	.freq_tbl = ftbl_usb_aux_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_core_pi_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb0_aux_clk_src",
+		.parent_names = gcc_xo_gpll0_core_pi_sleep_clk,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(60000000, P_GPLL6, 6, 1, 3),
+	{ }
+};
+
+static struct clk_rcg2 usb0_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x3e020,
+	.freq_tbl = ftbl_usb_mock_utmi_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll6_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb0_mock_utmi_clk_src",
+		.parent_names = gcc_xo_gpll6_gpll0_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_mux usb0_pipe_clk_src = {
+	.reg = 0x3e048,
+	.shift = 8,
+	.width = 2,
+	.parent_map = gcc_usb3phy_0_cc_pipe_clk_xo_map,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "usb0_pipe_clk_src",
+			.parent_names = gcc_usb3phy_0_cc_pipe_clk_xo,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_sdcc_ice_core_clk_src[] = {
+	F(80000000, P_GPLL0_DIV2, 5, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(216000000, P_GPLL6, 5, 0, 0),
+	F(308570000, P_GPLL6, 3.5, 0, 0),
+};
+
+static struct clk_rcg2 sdcc1_ice_core_clk_src = {
+	.cmd_rcgr = 0x5d000,
+	.freq_tbl = ftbl_sdcc_ice_core_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_gpll0_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc1_ice_core_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_gpll0_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 usb1_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x3f020,
+	.freq_tbl = ftbl_usb_mock_utmi_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll6_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb1_mock_utmi_clk_src",
+		.parent_names = gcc_xo_gpll6_gpll0_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_adss_pwm_clk = {
+	.halt_reg = 0x1c020,
+	.clkr = {
+		.enable_reg = 0x1c020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_adss_pwm_clk",
+			.parent_names = (const char *[]){
+				"adss_pwm_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_apss_ahb_clk = {
+	.halt_reg = 0x4601c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x0b004,
+		.enable_mask = BIT(14),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apss_ahb_clk",
+			.parent_names = (const char *[]){
+				"apss_ahb_postdiv_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_system_noc_bfdcd_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_DIV2, 8, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(133333333, P_GPLL0, 6, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266666667, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 system_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x26004,
+	.freq_tbl = ftbl_system_noc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "system_noc_bfdcd_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static const struct freq_tbl ftbl_ubi32_mem_noc_bfdcd_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(307670000, P_BIAS_PLL_NSS_NOC, 1.5, 0, 0),
+	F(533333333, P_GPLL0, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ubi32_mem_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x68088,
+	.freq_tbl = ftbl_ubi32_mem_noc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ubi32_mem_noc_bfdcd_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor ubi32_mem_noc_clk_src = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "ubi32_mem_noc_clk_src",
+		.parent_names = (const char *[]){
+			"ubi32_mem_noc_bfdcd_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_branch gcc_apss_axi_clk = {
+	.halt_reg = 0x46020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x0b004,
+		.enable_mask = BIT(13),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apss_axi_clk",
+			.parent_names = (const char *[]){
+				"apss_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_ahb_clk = {
+	.halt_reg = 0x01008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x0b004,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
+	.halt_reg = 0x02008,
+	.clkr = {
+		.enable_reg = 0x02008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup1_i2c_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup1_i2c_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
+	.halt_reg = 0x02004,
+	.clkr = {
+		.enable_reg = 0x02004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup1_spi_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup1_spi_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
+	.halt_reg = 0x03010,
+	.clkr = {
+		.enable_reg = 0x03010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup2_i2c_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup2_i2c_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
+	.halt_reg = 0x0300c,
+	.clkr = {
+		.enable_reg = 0x0300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup2_spi_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup2_spi_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
+	.halt_reg = 0x04010,
+	.clkr = {
+		.enable_reg = 0x04010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup3_i2c_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup3_i2c_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
+	.halt_reg = 0x0400c,
+	.clkr = {
+		.enable_reg = 0x0400c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup3_spi_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup3_spi_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
+	.halt_reg = 0x05010,
+	.clkr = {
+		.enable_reg = 0x05010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup4_i2c_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup4_i2c_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
+	.halt_reg = 0x0500c,
+	.clkr = {
+		.enable_reg = 0x0500c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup4_spi_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup4_spi_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
+	.halt_reg = 0x06010,
+	.clkr = {
+		.enable_reg = 0x06010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup5_i2c_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup5_i2c_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
+	.halt_reg = 0x0600c,
+	.clkr = {
+		.enable_reg = 0x0600c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup5_spi_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup5_spi_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
+	.halt_reg = 0x07010,
+	.clkr = {
+		.enable_reg = 0x07010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup6_i2c_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup6_i2c_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
+	.halt_reg = 0x0700c,
+	.clkr = {
+		.enable_reg = 0x0700c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup6_spi_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_qup6_spi_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart1_apps_clk = {
+	.halt_reg = 0x0203c,
+	.clkr = {
+		.enable_reg = 0x0203c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart1_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_uart1_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart2_apps_clk = {
+	.halt_reg = 0x0302c,
+	.clkr = {
+		.enable_reg = 0x0302c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart2_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_uart2_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart3_apps_clk = {
+	.halt_reg = 0x0402c,
+	.clkr = {
+		.enable_reg = 0x0402c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart3_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_uart3_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart4_apps_clk = {
+	.halt_reg = 0x0502c,
+	.clkr = {
+		.enable_reg = 0x0502c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart4_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_uart4_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart5_apps_clk = {
+	.halt_reg = 0x0602c,
+	.clkr = {
+		.enable_reg = 0x0602c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart5_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_uart5_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart6_apps_clk = {
+	.halt_reg = 0x0702c,
+	.clkr = {
+		.enable_reg = 0x0702c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart6_apps_clk",
+			.parent_names = (const char *[]){
+				"blsp1_uart6_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_crypto_ahb_clk = {
+	.halt_reg = 0x16024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x0b004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_crypto_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_crypto_axi_clk = {
+	.halt_reg = 0x16020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x0b004,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_crypto_axi_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_crypto_clk = {
+	.halt_reg = 0x1601c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x0b004,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_crypto_clk",
+			.parent_names = (const char *[]){
+				"crypto_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor gpll6_out_main_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll6_out_main_div2",
+		.parent_names = (const char *[]){
+			"gpll6_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_branch gcc_xo_clk = {
+	.halt_reg = 0x30030,
+	.clkr = {
+		.enable_reg = 0x30030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_xo_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x08000,
+	.clkr = {
+		.enable_reg = 0x08000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp1_clk",
+			.parent_names = (const char *[]){
+				"gp1_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x09000,
+	.clkr = {
+		.enable_reg = 0x09000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp2_clk",
+			.parent_names = (const char *[]){
+				"gp2_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x0a000,
+	.clkr = {
+		.enable_reg = 0x0a000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp3_clk",
+			.parent_names = (const char *[]){
+				"gp3_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdio_ahb_clk = {
+	.halt_reg = 0x58004,
+	.clkr = {
+		.enable_reg = 0x58004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdio_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_crypto_ppe_clk = {
+	.halt_reg = 0x68310,
+	.clkr = {
+		.enable_reg = 0x68310,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_crypto_ppe_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ce_apb_clk = {
+	.halt_reg = 0x68174,
+	.clkr = {
+		.enable_reg = 0x68174,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ce_apb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ce_axi_clk = {
+	.halt_reg = 0x68170,
+	.clkr = {
+		.enable_reg = 0x68170,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ce_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_cfg_clk = {
+	.halt_reg = 0x68160,
+	.clkr = {
+		.enable_reg = 0x68160,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_cfg_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_crypto_clk = {
+	.halt_reg = 0x68164,
+	.clkr = {
+		.enable_reg = 0x68164,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_crypto_clk",
+			.parent_names = (const char *[]){
+				"nss_crypto_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_csr_clk = {
+	.halt_reg = 0x68318,
+	.clkr = {
+		.enable_reg = 0x68318,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_csr_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_edma_cfg_clk = {
+	.halt_reg = 0x6819C,
+	.clkr = {
+		.enable_reg = 0x6819C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_edma_cfg_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_edma_clk = {
+	.halt_reg = 0x68198,
+	.clkr = {
+		.enable_reg = 0x68198,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_edma_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_noc_clk = {
+	.halt_reg = 0x68168,
+	.clkr = {
+		.enable_reg = 0x68168,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_noc_clk",
+			.parent_names = (const char *[]){
+				"snoc_nssnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_utcm_clk = {
+	.halt_reg = 0x2606c,
+	.clkr = {
+		.enable_reg = 0x2606c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_utcm_clk",
+			.parent_names = (const char *[]){
+				"snoc_nssnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_nssnoc_clk = {
+	.halt_reg = 0x26070,
+	.clkr = {
+		.enable_reg = 0x26070,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_nssnoc_clk",
+			.parent_names = (const char *[]){
+				"snoc_nssnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_wcss_ahb_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(133333333, P_GPLL0, 6, 0, 0),
+	{ }
+};
+
+static const struct freq_tbl ftbl_q6_axi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(400000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 wcss_ahb_clk_src = {
+	.cmd_rcgr = 0x59020,
+	.freq_tbl = ftbl_wcss_ahb_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "wcss_ahb_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 q6_axi_clk_src = {
+	.cmd_rcgr = 0x59120,
+	.freq_tbl = ftbl_q6_axi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_gpll4_gpll6_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "q6_axi_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2_gpll4_gpll6,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_core_axim_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+struct clk_rcg2 lpass_core_axim_clk_src = {
+	.cmd_rcgr = 0x1F020,
+	.freq_tbl = ftbl_lpass_core_axim_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_core_axim_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_snoc_cfg_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(266666667, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+struct clk_rcg2 lpass_snoc_cfg_clk_src = {
+	.cmd_rcgr = 0x1F040,
+	.freq_tbl = ftbl_lpass_snoc_cfg_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_snoc_cfg_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_q6_axim_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(400000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
+struct clk_rcg2 lpass_q6_axim_clk_src = {
+	.cmd_rcgr = 0x1F008,
+	.freq_tbl = ftbl_lpass_q6_axim_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_q6_axim_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_wcss_axi_m_clk = {
+	.halt_reg = 0x5903C,
+	.clkr = {
+		.enable_reg = 0x5903C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_axi_m_clk",
+			.parent_names = (const char *[]){
+				"system_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_wcss_ahb_clk = {
+	.halt_reg = 0x26034,
+	.clkr = {
+		.enable_reg = 0x26034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_wcss_ahb_clk",
+			.parent_names = (const char *[]){
+				"wcss_ahb_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6_axim_clk = {
+	.halt_reg = 0x5913C,
+	.clkr = {
+		.enable_reg = 0x5913C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6_axim_clk",
+			.parent_names = (const char *[]){
+				"q6_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6_axim2_clk = {
+	.halt_reg = 0x59150,
+	.clkr = {
+		.enable_reg = 0x59150,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6_axim2_clk",
+			.parent_names = (const char *[]){
+				"q6_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6ss_atbm_clk = {
+	.halt_reg = 0x59144,
+	.clkr = {
+		.enable_reg = 0x59144,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6ss_atbm_clk",
+			.parent_names = (const char *[]){
+				"qdss_at_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6ss_pclkdbg_clk = {
+	.halt_reg = 0x59140,
+	.clkr = {
+		.enable_reg = 0x59140,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6ss_pclkdbg_clk",
+			.parent_names = (const char *[]){
+				"qdss_dap_sync_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6_tsctr_1to2_clk = {
+	.halt_reg = 0x59148,
+	.clkr = {
+		.enable_reg = 0x59148,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6_tsctr_1to2_clk",
+			.parent_names = (const char *[]){
+				"qdss_tsctr_div2_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_core_tbu_clk = {
+	.halt_reg = 0x12028,
+	.clkr = {
+		.enable_reg = 0xb00c,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_core_tbu_clk",
+			.parent_names = (const char *[]){
+				"system_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_q6_tbu_clk = {
+	.halt_reg = 0x1202C,
+	.clkr = {
+		.enable_reg = 0xb00c,
+		.enable_mask = BIT(8),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_q6_tbu_clk",
+			.parent_names = (const char *[]){
+				"q6_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6_ahb_clk = {
+	.halt_reg = 0x59138,
+	.clkr = {
+		.enable_reg = 0x59138,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6_ahb_clk",
+			.parent_names = (const char *[]){
+				"wcss_ahb_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6_ahb_s_clk = {
+	.halt_reg = 0x5914C,
+	.clkr = {
+		.enable_reg = 0x5914C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6_ahb_s_clk",
+			.parent_names = (const char *[]){
+				"wcss_ahb_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_apb_clk = {
+	.halt_reg = 0x59040,
+	.clkr = {
+		.enable_reg = 0x59040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_dbg_ifc_apb_clk",
+			.parent_names = (const char *[]){
+				"qdss_dap_sync_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_atb_clk = {
+	.halt_reg = 0x59044,
+	.clkr = {
+		.enable_reg = 0x59044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_dbg_ifc_atb_clk",
+			.parent_names = (const char *[]){
+				"qdss_at_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_nts_clk = {
+	.halt_reg = 0x59048,
+	.clkr = {
+		.enable_reg = 0x59048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_dbg_ifc_nts_clk",
+			.parent_names = (const char *[]){
+				"qdss_tsctr_div2_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_dapbus_clk = {
+	.halt_reg = 0x5905C,
+	.clkr = {
+		.enable_reg = 0x5905C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_dbg_ifc_dapbus_clk",
+			.parent_names = (const char *[]){
+				"qdss_dap_sync_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_apb_bdg_clk = {
+	.halt_reg = 0x59050,
+	.clkr = {
+		.enable_reg = 0x59050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_dbg_ifc_apb_bdg_clk",
+			.parent_names = (const char *[]){
+				"qdss_dap_sync_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_atb_bdg_clk = {
+	.halt_reg = 0x59054,
+	.clkr = {
+		.enable_reg = 0x59054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_dbg_ifc_atb_bdg_clk",
+			.parent_names = (const char *[]){
+				"qdss_at_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_nts_bdg_clk = {
+	.halt_reg = 0x59058,
+	.clkr = {
+		.enable_reg = 0x59058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_dbg_ifc_nts_bdg_clk",
+			.parent_names = (const char *[]){
+				"qdss_tsctr_div2_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_dapbus_bdg_clk = {
+	.halt_reg = 0x59060,
+	.clkr = {
+		.enable_reg = 0x59060,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_dbg_ifc_dapbus_bdg_clk",
+			.parent_names = (const char *[]){
+				"qdss_dap_sync_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_ecahb_clk = {
+	.halt_reg = 0x59038,
+	.clkr = {
+		.enable_reg = 0x59038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_ecahb_clk",
+			.parent_names = (const char *[]){
+				"wcss_ahb_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_acmt_clk = {
+	.halt_reg = 0x59064,
+	.clkr = {
+		.enable_reg = 0x59064,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_acmt_clk",
+			.parent_names = (const char *[]){
+				"wcss_ahb_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_ahb_s_clk = {
+	.halt_reg = 0x59034,
+	.clkr = {
+		.enable_reg = 0x59034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_ahb_s_clk",
+			.parent_names = (const char *[]){
+				"wcss_ahb_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+struct freq_tbl ftbl_rbcpr_wcss_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	{ }
+};
+
+struct clk_rcg2 rbcpr_wcss_clk_src = {
+	.cmd_rcgr = 0x3a00c,
+	.freq_tbl = ftbl_rbcpr_wcss_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_out_main_div2_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "rbcpr_wcss_clk_src",
+		.parent_names = gcc_xo_gpll0_out_main_div2_gpll0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+struct clk_branch gcc_rbcpr_wcss_clk = {
+	.halt_reg = 0x3A004,
+	.clkr = {
+		.enable_reg = 0x3A004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_rbcpr_wcss_clk",
+			.parent_names = (const char *[]){
+				"rbcpr_wcss_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+struct clk_branch gcc_rbcpr_wcss_ahb_clk = {
+	.halt_reg = 0x3A008,
+	.clkr = {
+		.enable_reg = 0x3A008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_rbcpr_wcss_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+struct clk_branch gcc_mem_noc_q6_axi_clk = {
+	.halt_reg = 0x1D038,
+	.clkr = {
+		.enable_reg = 0x1D038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mem_noc_q6_axi_clk",
+			.parent_names = (const char *[]){
+				"q6_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_core_axim_clk = {
+	.halt_reg = 0x1F028,
+	.clkr = {
+		.enable_reg = 0x1F028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_core_axim_clk",
+			.parent_names = (const char *[]){
+				"lpass_core_axim_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_snoc_cfg_clk = {
+	.halt_reg = 0x1F048,
+	.clkr = {
+		.enable_reg = 0x1F048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_snoc_cfg_clk",
+			.parent_names = (const char *[]){
+				"lpass_snoc_cfg_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_q6_axim_clk = {
+	.halt_reg = 0x1F010,
+	.clkr = {
+		.enable_reg = 0x1F010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_q6_axim_clk",
+			.parent_names = (const char *[]){
+				"lpass_q6_axim_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_q6_atbm_at_clk = {
+	.halt_reg = 0x1F018,
+	.clkr = {
+		.enable_reg = 0x1F018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_q6_atbm_at_clk",
+			.parent_names = (const char *[]){
+				"qdss_at_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_q6_pclkdbg_clk = {
+	.halt_reg = 0x1F01C,
+	.clkr = {
+		.enable_reg = 0x1F01C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_q6_pclkdbg_clk",
+			.parent_names = (const char *[]){
+				"qdss_dap_sync_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_q6ss_tsctr_1to2_clk = {
+	.halt_reg = 0x1F014,
+	.clkr = {
+		.enable_reg = 0x1F014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_q6ss_tsctr_1to2_clk",
+			.parent_names = (const char *[]){
+				"qdss_tsctr_div2_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_q6ss_trig_clk = {
+	.halt_reg = 0x1F038,
+	.clkr = {
+		.enable_reg = 0x1F038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_q6ss_trig_clk",
+			.parent_names = (const char *[]){
+				"qdss_dap_sync_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_tbu_clk = {
+	.halt_reg = 0x12094,
+	.clkr = {
+		.enable_reg = 0xb00c,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_tbu_clk",
+			.parent_names = (const char *[]){
+				"lpass_q6_axim_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcnoc_lpass_clk = {
+	.halt_reg = 0x27020,
+	.clkr = {
+		.enable_reg = 0x27020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcnoc_lpass_clk",
+			.parent_names = (const char *[]){
+				"lpass_core_axim_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mem_noc_lpass_clk = {
+	.halt_reg = 0x1D044,
+	.clkr = {
+		.enable_reg = 0x1D044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mem_noc_lpass_clk",
+			.parent_names = (const char *[]){
+				"lpass_q6_axim_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_lpass_cfg_clk = {
+	.halt_reg = 0x26074,
+	.clkr = {
+		.enable_reg = 0x26074,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_lpass_cfg_clk",
+			.parent_names = (const char *[]){
+				"lpass_snoc_cfg_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mem_noc_ubi32_clk = {
+	.halt_reg = 0x1D03C,
+	.clkr = {
+		.enable_reg = 0x1D03C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mem_noc_ubi32_clk",
+			.parent_names = (const char *[]){
+				"ubi32_mem_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port1_rx_clk = {
+	.halt_reg = 0x68240,
+	.clkr = {
+		.enable_reg = 0x68240,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port1_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port1_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port1_tx_clk = {
+	.halt_reg = 0x68244,
+	.clkr = {
+		.enable_reg = 0x68244,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port1_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port1_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port2_rx_clk = {
+	.halt_reg = 0x68248,
+	.clkr = {
+		.enable_reg = 0x68248,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port2_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port2_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port2_tx_clk = {
+	.halt_reg = 0x6824c,
+	.clkr = {
+		.enable_reg = 0x6824c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port2_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port2_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port3_rx_clk = {
+	.halt_reg = 0x68250,
+	.clkr = {
+		.enable_reg = 0x68250,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port3_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port3_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port3_tx_clk = {
+	.halt_reg = 0x68254,
+	.clkr = {
+		.enable_reg = 0x68254,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port3_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port3_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port4_rx_clk = {
+	.halt_reg = 0x68258,
+	.clkr = {
+		.enable_reg = 0x68258,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port4_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port4_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port4_tx_clk = {
+	.halt_reg = 0x6825c,
+	.clkr = {
+		.enable_reg = 0x6825c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port4_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port4_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port5_rx_clk = {
+	.halt_reg = 0x68260,
+	.clkr = {
+		.enable_reg = 0x68260,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port5_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port5_tx_clk = {
+	.halt_reg = 0x68264,
+	.clkr = {
+		.enable_reg = 0x68264,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port5_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ppe_cfg_clk = {
+	.halt_reg = 0x68194,
+	.clkr = {
+		.enable_reg = 0x68194,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ppe_cfg_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ppe_clk = {
+	.halt_reg = 0x68190,
+	.clkr = {
+		.enable_reg = 0x68190,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ppe_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ppe_ipe_clk = {
+	.halt_reg = 0x68338,
+	.clkr = {
+		.enable_reg = 0x68338,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ppe_ipe_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ptp_ref_clk = {
+	.halt_reg = 0x6816C,
+	.clkr = {
+		.enable_reg = 0x6816C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ptp_ref_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_cdiv_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ce_apb_clk = {
+	.halt_reg = 0x6830C,
+	.clkr = {
+		.enable_reg = 0x6830C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ce_apb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ce_axi_clk = {
+	.halt_reg = 0x68308,
+	.clkr = {
+		.enable_reg = 0x68308,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ce_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_crypto_clk = {
+	.halt_reg = 0x68314,
+	.clkr = {
+		.enable_reg = 0x68314,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_crypto_clk",
+			.parent_names = (const char *[]){
+				"nss_crypto_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ppe_cfg_clk = {
+	.halt_reg = 0x68304,
+	.clkr = {
+		.enable_reg = 0x68304,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ppe_cfg_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ppe_clk = {
+	.halt_reg = 0x68300,
+	.clkr = {
+		.enable_reg = 0x68300,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ppe_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_qosgen_ref_clk = {
+	.halt_reg = 0x68180,
+	.clkr = {
+		.enable_reg = 0x68180,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_qosgen_ref_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_snoc_clk = {
+	.halt_reg = 0x68188,
+	.clkr = {
+		.enable_reg = 0x68188,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_snoc_clk",
+			.parent_names = (const char *[]){
+				"system_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_timeout_ref_clk = {
+	.halt_reg = 0x68184,
+	.clkr = {
+		.enable_reg = 0x68184,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_timeout_ref_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_div4_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ubi0_ahb_clk = {
+	.halt_reg = 0x68270,
+	.clkr = {
+		.enable_reg = 0x68270,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ubi0_ahb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port1_mac_clk = {
+	.halt_reg = 0x68320,
+	.clkr = {
+		.enable_reg = 0x68320,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port1_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port2_mac_clk = {
+	.halt_reg = 0x68324,
+	.clkr = {
+		.enable_reg = 0x68324,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port2_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port3_mac_clk = {
+	.halt_reg = 0x68328,
+	.clkr = {
+		.enable_reg = 0x68328,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port3_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port4_mac_clk = {
+	.halt_reg = 0x6832c,
+	.clkr = {
+		.enable_reg = 0x6832c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port4_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port5_mac_clk = {
+	.halt_reg = 0x68330,
+	.clkr = {
+		.enable_reg = 0x68330,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port5_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_ahb_clk = {
+	.halt_reg = 0x6820C,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x6820C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_ahb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_axi_clk = {
+	.halt_reg = 0x68200,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x68200,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_axi_clk",
+			.parent_names = (const char *[]){
+				"ubi32_mem_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_nc_axi_clk = {
+	.halt_reg = 0x68204,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x68204,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_nc_axi_clk",
+			.parent_names = (const char *[]){
+				"snoc_nssnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_core_clk = {
+	.halt_reg = 0x68210,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x68210,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_core_clk",
+			.parent_names = (const char *[]){
+				"nss_ubi0_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_ahb_clk = {
+	.halt_reg = 0x75010,
+	.clkr = {
+		.enable_reg = 0x75010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_aux_clk = {
+	.halt_reg = 0x75014,
+	.clkr = {
+		.enable_reg = 0x75014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_aux_clk",
+			.parent_names = (const char *[]){
+				"pcie0_aux_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_m_clk = {
+	.halt_reg = 0x75008,
+	.clkr = {
+		.enable_reg = 0x75008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_axi_m_clk",
+			.parent_names = (const char *[]){
+				"pcie0_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_s_clk = {
+	.halt_reg = 0x7500c,
+	.clkr = {
+		.enable_reg = 0x7500c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_axi_s_clk",
+			.parent_names = (const char *[]){
+				"pcie0_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_pcie0_axi_clk = {
+	.halt_reg = 0x26048,
+	.clkr = {
+		.enable_reg = 0x26048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_pcie0_axi_clk",
+			.parent_names = (const char *[]){
+				"pcie0_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_pipe_clk = {
+	.halt_reg = 0x75018,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x75018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_pipe_clk",
+			.parent_names = (const char *[]){
+				"pcie0_pipe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_prng_ahb_clk = {
+	.halt_reg = 0x13004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x0b004,
+		.enable_mask = BIT(8),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_prng_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_at_clk = {
+	.halt_reg = 0x29024,
+	.clkr = {
+		.enable_reg = 0x29024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_at_clk",
+			.parent_names = (const char *[]){
+				"qdss_at_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_dap_clk = {
+	.halt_reg = 0x29084,
+	.clkr = {
+		.enable_reg = 0x29084,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_dap_clk",
+			.parent_names = (const char *[]){
+				"qdss_dap_sync_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_ahb_clk = {
+	.halt_reg = 0x57024,
+	.clkr = {
+		.enable_reg = 0x57024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qpic_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_clk = {
+	.halt_reg = 0x57020,
+	.clkr = {
+		.enable_reg = 0x57020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qpic_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x4201c,
+	.clkr = {
+		.enable_reg = 0x4201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x42018,
+	.clkr = {
+		.enable_reg = 0x42018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_names = (const char *[]){
+				"sdcc1_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_ahb_clk = {
+	.halt_reg = 0x56008,
+	.clkr = {
+		.enable_reg = 0x56008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port1_rx_clk = {
+	.halt_reg = 0x56010,
+	.clkr = {
+		.enable_reg = 0x56010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port1_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port1_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port1_tx_clk = {
+	.halt_reg = 0x56014,
+	.clkr = {
+		.enable_reg = 0x56014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port1_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port1_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port2_rx_clk = {
+	.halt_reg = 0x56018,
+	.clkr = {
+		.enable_reg = 0x56018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port2_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port2_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port2_tx_clk = {
+	.halt_reg = 0x5601c,
+	.clkr = {
+		.enable_reg = 0x5601c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port2_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port2_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port3_rx_clk = {
+	.halt_reg = 0x56020,
+	.clkr = {
+		.enable_reg = 0x56020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port3_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port3_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port3_tx_clk = {
+	.halt_reg = 0x56024,
+	.clkr = {
+		.enable_reg = 0x56024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port3_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port3_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port4_rx_clk = {
+	.halt_reg = 0x56028,
+	.clkr = {
+		.enable_reg = 0x56028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port4_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port4_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port4_tx_clk = {
+	.halt_reg = 0x5602c,
+	.clkr = {
+		.enable_reg = 0x5602c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port4_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port4_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port5_rx_clk = {
+	.halt_reg = 0x56030,
+	.clkr = {
+		.enable_reg = 0x56030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port5_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port5_tx_clk = {
+	.halt_reg = 0x56034,
+	.clkr = {
+		.enable_reg = 0x56034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port5_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_sys_clk = {
+	.halt_reg = 0x5600C,
+	.clkr = {
+		.enable_reg = 0x5600C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_sys_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_ahb_clk = {
+	.halt_reg = 0x56108,
+	.clkr = {
+		.enable_reg = 0x56108,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy1_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_port5_rx_clk = {
+	.halt_reg = 0x56110,
+	.clkr = {
+		.enable_reg = 0x56110,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy1_port5_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_port5_tx_clk = {
+	.halt_reg = 0x56114,
+	.clkr = {
+		.enable_reg = 0x56114,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy1_port5_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_sys_clk = {
+	.halt_reg = 0x5610C,
+	.clkr = {
+		.enable_reg = 0x5610C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy1_sys_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_aux_clk = {
+	.halt_reg = 0x3e044,
+	.clkr = {
+		.enable_reg = 0x3e044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_aux_clk",
+			.parent_names = (const char *[]){
+				"usb0_aux_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_master_clk = {
+	.halt_reg = 0x3e000,
+	.clkr = {
+		.enable_reg = 0x3e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_master_clk",
+			.parent_names = (const char *[]){
+				"usb0_master_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_bus_timeout2_ahb_clk = {
+	.halt_reg = 0x47014,
+	.clkr = {
+		.enable_reg = 0x47014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_bus_timeout2_ahb_clk",
+			.parent_names = (const char *[]){
+				"usb0_master_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 pcie0_rchng_clk_src = {
+	.cmd_rcgr = 0x75070,
+	.freq_tbl = ftbl_pcie_rchng_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie0_rchng_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_pcie0_rchng_clk = {
+	.halt_reg = 0x75070,
+	.clkr = {
+		.enable_reg = 0x75070,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_rchng_clk",
+			.parent_names = (const char *[]){
+				"pcie0_rchng_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_s_bridge_clk = {
+	.halt_reg = 0x75048,
+	.clkr = {
+		.enable_reg = 0x75048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_axi_s_bridge_clk",
+			.parent_names = (const char *[]){
+				"pcie0_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_usb0_axi_clk = {
+	.halt_reg = 0x26040,
+	.clkr = {
+		.enable_reg = 0x26040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_usb0_axi_clk",
+			.parent_names = (const char *[]){
+				"usb0_master_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_mock_utmi_clk = {
+	.halt_reg = 0x3e008,
+	.clkr = {
+		.enable_reg = 0x3e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_mock_utmi_clk",
+			.parent_names = (const char *[]){
+				"usb0_mock_utmi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_phy_cfg_ahb_clk = {
+	.halt_reg = 0x3e080,
+	.clkr = {
+		.enable_reg = 0x3e080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_phy_cfg_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_pipe_clk = {
+	.halt_reg = 0x3e040,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3e040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_pipe_clk",
+			.parent_names = (const char *[]){
+				"usb0_pipe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_sleep_clk = {
+	.halt_reg = 0x3e004,
+	.clkr = {
+		.enable_reg = 0x3e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_sleep_clk",
+			.parent_names = (const char *[]){
+				"gcc_sleep_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_master_clk = {
+	.halt_reg = 0x3f000,
+	.clkr = {
+		.enable_reg = 0x3f000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_master_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_mock_utmi_clk = {
+	.halt_reg = 0x3f008,
+	.clkr = {
+		.enable_reg = 0x3f008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_mock_utmi_clk",
+			.parent_names = (const char *[]){
+				"usb1_mock_utmi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_phy_cfg_ahb_clk = {
+	.halt_reg = 0x3f080,
+	.clkr = {
+		.enable_reg = 0x3f080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_phy_cfg_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_sleep_clk = {
+	.halt_reg = 0x3f004,
+	.clkr = {
+		.enable_reg = 0x3f004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_sleep_clk",
+			.parent_names = (const char *[]){
+				"gcc_sleep_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cmn_12gpll_ahb_clk = {
+	.halt_reg = 0x56308,
+	.clkr = {
+		.enable_reg = 0x56308,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cmn_12gpll_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cmn_12gpll_sys_clk = {
+	.halt_reg = 0x5630c,
+	.clkr = {
+		.enable_reg = 0x5630c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cmn_12gpll_sys_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ice_core_clk = {
+	.halt_reg = 0x5d014,
+	.clkr = {
+		.enable_reg = 0x5d014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ice_core_clk",
+			.parent_names = (const char *[]){
+				"sdcc1_ice_core_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_dcc_clk = {
+	.halt_reg = 0x77004,
+	.clkr = {
+		.enable_reg = 0x77004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_dcc_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config ubi32_pll_config = {
+	.l = 0x3e,
+	.alpha = 0x57,
+	.config_ctl_val = 0x200d6aa8,
+	.config_ctl_hi_val = 0x3c2,
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.pre_div_val = 0x0,
+	.pre_div_mask = BIT(12),
+	.post_div_val = 0x0,
+	.post_div_mask = GENMASK(9, 8),
+};
+
+static const struct alpha_pll_config nss_crypto_pll_config = {
+	.l = 0x32,
+	.alpha = 0x0,
+	.alpha_hi = 0x0,
+	.config_ctl_val = 0x4001055b,
+	.main_output_mask = BIT(0),
+	.pre_div_val = 0x0,
+	.pre_div_mask = GENMASK(14, 12),
+	.post_div_val = 0x1 << 8,
+	.post_div_mask = GENMASK(11, 8),
+	.vco_mask = GENMASK(21, 20),
+	.vco_val = 0x0,
+	.alpha_en_mask = BIT(24),
+};
+
+static struct clk_hw *gcc_ipq6018_hws[] = {
+	&gpll0_out_main_div2.hw,
+	&pcnoc_clk_src.hw,
+	&snoc_nssnoc_clk_src.hw,
+	&system_noc_clk_src.hw,
+	&gcc_xo_div4_clk_src.hw,
+	&ubi32_mem_noc_clk_src.hw,
+	&nss_ppe_cdiv_clk_src.hw,
+	&gpll6_out_main_div2.hw,
+	&qdss_dap_sync_clk_src.hw,
+	&qdss_tsctr_div2_clk_src.hw,
+};
+
+static struct clk_regmap *gcc_ipq6018_clks[] = {
+	[GPLL0_MAIN] = &gpll0_main.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[UBI32_PLL_MAIN] = &ubi32_pll_main.clkr,
+	[UBI32_PLL] = &ubi32_pll.clkr,
+	[GPLL6_MAIN] = &gpll6_main.clkr,
+	[GPLL6] = &gpll6.clkr,
+	[GPLL4_MAIN] = &gpll4_main.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
+	[GPLL2_MAIN] = &gpll2_main.clkr,
+	[GPLL2] = &gpll2.clkr,
+	[NSS_CRYPTO_PLL_MAIN] = &nss_crypto_pll_main.clkr,
+	[NSS_CRYPTO_PLL] = &nss_crypto_pll.clkr,
+	[QDSS_TSCTR_CLK_SRC] = &qdss_tsctr_clk_src.clkr,
+	[QDSS_AT_CLK_SRC] = &qdss_at_clk_src.clkr,
+	[NSS_PPE_CLK_SRC] = &nss_ppe_clk_src.clkr,
+	[GCC_XO_CLK_SRC] = &gcc_xo_clk_src.clkr,
+	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
+	[SNOC_NSSNOC_BFDCD_CLK_SRC] = &snoc_nssnoc_bfdcd_clk_src.clkr,
+	[NSS_CE_CLK_SRC] = &nss_ce_clk_src.clkr,
+	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
+	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
+	[NSS_PORT5_RX_CLK_SRC] = &nss_port5_rx_clk_src.clkr,
+	[NSS_PORT5_TX_CLK_SRC] = &nss_port5_tx_clk_src.clkr,
+	[UBI32_MEM_NOC_BFDCD_CLK_SRC] = &ubi32_mem_noc_bfdcd_clk_src.clkr,
+	[PCIE0_AXI_CLK_SRC] = &pcie0_axi_clk_src.clkr,
+	[USB0_MASTER_CLK_SRC] = &usb0_master_clk_src.clkr,
+	[APSS_AHB_POSTDIV_CLK_SRC] = &apss_ahb_postdiv_clk_src.clkr,
+	[NSS_PORT1_RX_CLK_SRC] = &nss_port1_rx_clk_src.clkr,
+	[NSS_PORT1_TX_CLK_SRC] = &nss_port1_tx_clk_src.clkr,
+	[NSS_PORT2_RX_CLK_SRC] = &nss_port2_rx_clk_src.clkr,
+	[NSS_PORT2_TX_CLK_SRC] = &nss_port2_tx_clk_src.clkr,
+	[NSS_PORT3_RX_CLK_SRC] = &nss_port3_rx_clk_src.clkr,
+	[NSS_PORT3_TX_CLK_SRC] = &nss_port3_tx_clk_src.clkr,
+	[NSS_PORT4_RX_CLK_SRC] = &nss_port4_rx_clk_src.clkr,
+	[NSS_PORT4_TX_CLK_SRC] = &nss_port4_tx_clk_src.clkr,
+	[NSS_PORT5_RX_DIV_CLK_SRC] = &nss_port5_rx_div_clk_src.clkr,
+	[NSS_PORT5_TX_DIV_CLK_SRC] = &nss_port5_tx_div_clk_src.clkr,
+	[APSS_AXI_CLK_SRC] = &apss_axi_clk_src.clkr,
+	[NSS_CRYPTO_CLK_SRC] = &nss_crypto_clk_src.clkr,
+	[NSS_PORT1_RX_DIV_CLK_SRC] = &nss_port1_rx_div_clk_src.clkr,
+	[NSS_PORT1_TX_DIV_CLK_SRC] = &nss_port1_tx_div_clk_src.clkr,
+	[NSS_PORT2_RX_DIV_CLK_SRC] = &nss_port2_rx_div_clk_src.clkr,
+	[NSS_PORT2_TX_DIV_CLK_SRC] = &nss_port2_tx_div_clk_src.clkr,
+	[NSS_PORT3_RX_DIV_CLK_SRC] = &nss_port3_rx_div_clk_src.clkr,
+	[NSS_PORT3_TX_DIV_CLK_SRC] = &nss_port3_tx_div_clk_src.clkr,
+	[NSS_PORT4_RX_DIV_CLK_SRC] = &nss_port4_rx_div_clk_src.clkr,
+	[NSS_PORT4_TX_DIV_CLK_SRC] = &nss_port4_tx_div_clk_src.clkr,
+	[NSS_UBI0_CLK_SRC] = &nss_ubi0_clk_src.clkr,
+	[ADSS_PWM_CLK_SRC] = &adss_pwm_clk_src.clkr,
+	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,
+	[BLSP1_QUP2_I2C_APPS_CLK_SRC] = &blsp1_qup2_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP2_SPI_APPS_CLK_SRC] = &blsp1_qup2_spi_apps_clk_src.clkr,
+	[BLSP1_QUP3_I2C_APPS_CLK_SRC] = &blsp1_qup3_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP3_SPI_APPS_CLK_SRC] = &blsp1_qup3_spi_apps_clk_src.clkr,
+	[BLSP1_QUP4_I2C_APPS_CLK_SRC] = &blsp1_qup4_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP4_SPI_APPS_CLK_SRC] = &blsp1_qup4_spi_apps_clk_src.clkr,
+	[BLSP1_QUP5_I2C_APPS_CLK_SRC] = &blsp1_qup5_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP5_SPI_APPS_CLK_SRC] = &blsp1_qup5_spi_apps_clk_src.clkr,
+	[BLSP1_QUP6_I2C_APPS_CLK_SRC] = &blsp1_qup6_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP6_SPI_APPS_CLK_SRC] = &blsp1_qup6_spi_apps_clk_src.clkr,
+	[BLSP1_UART1_APPS_CLK_SRC] = &blsp1_uart1_apps_clk_src.clkr,
+	[BLSP1_UART2_APPS_CLK_SRC] = &blsp1_uart2_apps_clk_src.clkr,
+	[BLSP1_UART3_APPS_CLK_SRC] = &blsp1_uart3_apps_clk_src.clkr,
+	[BLSP1_UART4_APPS_CLK_SRC] = &blsp1_uart4_apps_clk_src.clkr,
+	[BLSP1_UART5_APPS_CLK_SRC] = &blsp1_uart5_apps_clk_src.clkr,
+	[BLSP1_UART6_APPS_CLK_SRC] = &blsp1_uart6_apps_clk_src.clkr,
+	[CRYPTO_CLK_SRC] = &crypto_clk_src.clkr,
+	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
+	[GP2_CLK_SRC] = &gp2_clk_src.clkr,
+	[GP3_CLK_SRC] = &gp3_clk_src.clkr,
+	[NSS_UBI0_DIV_CLK_SRC] = &nss_ubi0_div_clk_src.clkr,
+	[PCIE0_AUX_CLK_SRC] = &pcie0_aux_clk_src.clkr,
+	[PCIE0_PIPE_CLK_SRC] = &pcie0_pipe_clk_src.clkr,
+	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
+	[USB0_AUX_CLK_SRC] = &usb0_aux_clk_src.clkr,
+	[USB0_MOCK_UTMI_CLK_SRC] = &usb0_mock_utmi_clk_src.clkr,
+	[USB0_PIPE_CLK_SRC] = &usb0_pipe_clk_src.clkr,
+	[USB1_MOCK_UTMI_CLK_SRC] = &usb1_mock_utmi_clk_src.clkr,
+	[GCC_ADSS_PWM_CLK] = &gcc_adss_pwm_clk.clkr,
+	[GCC_APSS_AHB_CLK] = &gcc_apss_ahb_clk.clkr,
+	[GCC_APSS_AXI_CLK] = &gcc_apss_axi_clk.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK] = &gcc_blsp1_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK] = &gcc_blsp1_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP5_I2C_APPS_CLK] = &gcc_blsp1_qup5_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP5_SPI_APPS_CLK] = &gcc_blsp1_qup5_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP6_I2C_APPS_CLK] = &gcc_blsp1_qup6_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP6_SPI_APPS_CLK] = &gcc_blsp1_qup6_spi_apps_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
+	[GCC_BLSP1_UART3_APPS_CLK] = &gcc_blsp1_uart3_apps_clk.clkr,
+	[GCC_BLSP1_UART4_APPS_CLK] = &gcc_blsp1_uart4_apps_clk.clkr,
+	[GCC_BLSP1_UART5_APPS_CLK] = &gcc_blsp1_uart5_apps_clk.clkr,
+	[GCC_BLSP1_UART6_APPS_CLK] = &gcc_blsp1_uart6_apps_clk.clkr,
+	[GCC_CRYPTO_AHB_CLK] = &gcc_crypto_ahb_clk.clkr,
+	[GCC_CRYPTO_AXI_CLK] = &gcc_crypto_axi_clk.clkr,
+	[GCC_CRYPTO_CLK] = &gcc_crypto_clk.clkr,
+	[GCC_XO_CLK] = &gcc_xo_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_MDIO_AHB_CLK] = &gcc_mdio_ahb_clk.clkr,
+	[GCC_CRYPTO_PPE_CLK] = &gcc_crypto_ppe_clk.clkr,
+	[GCC_NSS_CE_APB_CLK] = &gcc_nss_ce_apb_clk.clkr,
+	[GCC_NSS_CE_AXI_CLK] = &gcc_nss_ce_axi_clk.clkr,
+	[GCC_NSS_CFG_CLK] = &gcc_nss_cfg_clk.clkr,
+	[GCC_NSS_CRYPTO_CLK] = &gcc_nss_crypto_clk.clkr,
+	[GCC_NSS_CSR_CLK] = &gcc_nss_csr_clk.clkr,
+	[GCC_NSS_EDMA_CFG_CLK] = &gcc_nss_edma_cfg_clk.clkr,
+	[GCC_NSS_EDMA_CLK] = &gcc_nss_edma_clk.clkr,
+	[GCC_NSS_NOC_CLK] = &gcc_nss_noc_clk.clkr,
+	[GCC_UBI0_UTCM_CLK] = &gcc_ubi0_utcm_clk.clkr,
+	[GCC_SNOC_NSSNOC_CLK] = &gcc_snoc_nssnoc_clk.clkr,
+	[GCC_NSS_PORT1_RX_CLK] = &gcc_nss_port1_rx_clk.clkr,
+	[GCC_NSS_PORT1_TX_CLK] = &gcc_nss_port1_tx_clk.clkr,
+	[GCC_NSS_PORT2_RX_CLK] = &gcc_nss_port2_rx_clk.clkr,
+	[GCC_NSS_PORT2_TX_CLK] = &gcc_nss_port2_tx_clk.clkr,
+	[GCC_NSS_PORT3_RX_CLK] = &gcc_nss_port3_rx_clk.clkr,
+	[GCC_NSS_PORT3_TX_CLK] = &gcc_nss_port3_tx_clk.clkr,
+	[GCC_NSS_PORT4_RX_CLK] = &gcc_nss_port4_rx_clk.clkr,
+	[GCC_NSS_PORT4_TX_CLK] = &gcc_nss_port4_tx_clk.clkr,
+	[GCC_NSS_PORT5_RX_CLK] = &gcc_nss_port5_rx_clk.clkr,
+	[GCC_NSS_PORT5_TX_CLK] = &gcc_nss_port5_tx_clk.clkr,
+	[GCC_NSS_PPE_CFG_CLK] = &gcc_nss_ppe_cfg_clk.clkr,
+	[GCC_NSS_PPE_CLK] = &gcc_nss_ppe_clk.clkr,
+	[GCC_NSS_PPE_IPE_CLK] = &gcc_nss_ppe_ipe_clk.clkr,
+	[GCC_NSS_PTP_REF_CLK] = &gcc_nss_ptp_ref_clk.clkr,
+	[GCC_NSSNOC_CE_APB_CLK] = &gcc_nssnoc_ce_apb_clk.clkr,
+	[GCC_NSSNOC_CE_AXI_CLK] = &gcc_nssnoc_ce_axi_clk.clkr,
+	[GCC_NSSNOC_CRYPTO_CLK] = &gcc_nssnoc_crypto_clk.clkr,
+	[GCC_NSSNOC_PPE_CFG_CLK] = &gcc_nssnoc_ppe_cfg_clk.clkr,
+	[GCC_NSSNOC_PPE_CLK] = &gcc_nssnoc_ppe_clk.clkr,
+	[GCC_NSSNOC_QOSGEN_REF_CLK] = &gcc_nssnoc_qosgen_ref_clk.clkr,
+	[GCC_NSSNOC_SNOC_CLK] = &gcc_nssnoc_snoc_clk.clkr,
+	[GCC_NSSNOC_TIMEOUT_REF_CLK] = &gcc_nssnoc_timeout_ref_clk.clkr,
+	[GCC_NSSNOC_UBI0_AHB_CLK] = &gcc_nssnoc_ubi0_ahb_clk.clkr,
+	[GCC_PORT1_MAC_CLK] = &gcc_port1_mac_clk.clkr,
+	[GCC_PORT2_MAC_CLK] = &gcc_port2_mac_clk.clkr,
+	[GCC_PORT3_MAC_CLK] = &gcc_port3_mac_clk.clkr,
+	[GCC_PORT4_MAC_CLK] = &gcc_port4_mac_clk.clkr,
+	[GCC_PORT5_MAC_CLK] = &gcc_port5_mac_clk.clkr,
+	[GCC_UBI0_AHB_CLK] = &gcc_ubi0_ahb_clk.clkr,
+	[GCC_UBI0_AXI_CLK] = &gcc_ubi0_axi_clk.clkr,
+	[GCC_UBI0_NC_AXI_CLK] = &gcc_ubi0_nc_axi_clk.clkr,
+	[GCC_UBI0_CORE_CLK] = &gcc_ubi0_core_clk.clkr,
+	[GCC_PCIE0_AHB_CLK] = &gcc_pcie0_ahb_clk.clkr,
+	[GCC_PCIE0_AUX_CLK] = &gcc_pcie0_aux_clk.clkr,
+	[GCC_PCIE0_AXI_M_CLK] = &gcc_pcie0_axi_m_clk.clkr,
+	[GCC_PCIE0_AXI_S_CLK] = &gcc_pcie0_axi_s_clk.clkr,
+	[GCC_SYS_NOC_PCIE0_AXI_CLK] = &gcc_sys_noc_pcie0_axi_clk.clkr,
+	[GCC_PCIE0_PIPE_CLK] = &gcc_pcie0_pipe_clk.clkr,
+	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
+	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
+	[GCC_QPIC_AHB_CLK] = &gcc_qpic_ahb_clk.clkr,
+	[GCC_QPIC_CLK] = &gcc_qpic_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_UNIPHY0_AHB_CLK] = &gcc_uniphy0_ahb_clk.clkr,
+	[GCC_UNIPHY0_PORT1_RX_CLK] = &gcc_uniphy0_port1_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT1_TX_CLK] = &gcc_uniphy0_port1_tx_clk.clkr,
+	[GCC_UNIPHY0_PORT2_RX_CLK] = &gcc_uniphy0_port2_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT2_TX_CLK] = &gcc_uniphy0_port2_tx_clk.clkr,
+	[GCC_UNIPHY0_PORT3_RX_CLK] = &gcc_uniphy0_port3_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT3_TX_CLK] = &gcc_uniphy0_port3_tx_clk.clkr,
+	[GCC_UNIPHY0_PORT4_RX_CLK] = &gcc_uniphy0_port4_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT4_TX_CLK] = &gcc_uniphy0_port4_tx_clk.clkr,
+	[GCC_UNIPHY0_PORT5_RX_CLK] = &gcc_uniphy0_port5_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT5_TX_CLK] = &gcc_uniphy0_port5_tx_clk.clkr,
+	[GCC_UNIPHY0_SYS_CLK] = &gcc_uniphy0_sys_clk.clkr,
+	[GCC_UNIPHY1_AHB_CLK] = &gcc_uniphy1_ahb_clk.clkr,
+	[GCC_UNIPHY1_PORT5_RX_CLK] = &gcc_uniphy1_port5_rx_clk.clkr,
+	[GCC_UNIPHY1_PORT5_TX_CLK] = &gcc_uniphy1_port5_tx_clk.clkr,
+	[GCC_UNIPHY1_SYS_CLK] = &gcc_uniphy1_sys_clk.clkr,
+	[GCC_USB0_AUX_CLK] = &gcc_usb0_aux_clk.clkr,
+	[GCC_SYS_NOC_USB0_AXI_CLK] = &gcc_sys_noc_usb0_axi_clk.clkr,
+	[GCC_SNOC_BUS_TIMEOUT2_AHB_CLK] = &gcc_snoc_bus_timeout2_ahb_clk.clkr,
+	[GCC_USB0_MASTER_CLK] = &gcc_usb0_master_clk.clkr,
+	[GCC_USB0_MOCK_UTMI_CLK] = &gcc_usb0_mock_utmi_clk.clkr,
+	[GCC_USB0_PHY_CFG_AHB_CLK] = &gcc_usb0_phy_cfg_ahb_clk.clkr,
+	[GCC_USB0_PIPE_CLK] = &gcc_usb0_pipe_clk.clkr,
+	[GCC_USB0_SLEEP_CLK] = &gcc_usb0_sleep_clk.clkr,
+	[GCC_USB1_MASTER_CLK] = &gcc_usb1_master_clk.clkr,
+	[GCC_USB1_MOCK_UTMI_CLK] = &gcc_usb1_mock_utmi_clk.clkr,
+	[GCC_USB1_PHY_CFG_AHB_CLK] = &gcc_usb1_phy_cfg_ahb_clk.clkr,
+	[GCC_USB1_SLEEP_CLK] = &gcc_usb1_sleep_clk.clkr,
+	[GCC_CMN_12GPLL_AHB_CLK] = &gcc_cmn_12gpll_ahb_clk.clkr,
+	[GCC_CMN_12GPLL_SYS_CLK] = &gcc_cmn_12gpll_sys_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[SDCC1_ICE_CORE_CLK_SRC] = &sdcc1_ice_core_clk_src.clkr,
+	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
+	[PCIE0_RCHNG_CLK_SRC] = &pcie0_rchng_clk_src.clkr,
+	[GCC_PCIE0_AXI_S_BRIDGE_CLK] = &gcc_pcie0_axi_s_bridge_clk.clkr,
+	[PCIE0_RCHNG_CLK] = &gcc_pcie0_rchng_clk.clkr,
+	[GCC_WCSS_AXI_M_CLK] = &gcc_wcss_axi_m_clk.clkr,
+	[GCC_SYS_NOC_WCSS_AHB_CLK] = &gcc_sys_noc_wcss_ahb_clk.clkr,
+	[WCSS_AHB_CLK_SRC] = &wcss_ahb_clk_src.clkr,
+	[GCC_Q6_AXIM_CLK] = &gcc_q6_axim_clk.clkr,
+	[Q6_AXI_CLK_SRC] = &q6_axi_clk_src.clkr,
+	[GCC_Q6SS_ATBM_CLK] = &gcc_q6ss_atbm_clk.clkr,
+	[GCC_Q6SS_PCLKDBG_CLK] = &gcc_q6ss_pclkdbg_clk.clkr,
+	[GCC_Q6_TSCTR_1TO2_CLK] = &gcc_q6_tsctr_1to2_clk.clkr,
+	[GCC_WCSS_CORE_TBU_CLK] = &gcc_wcss_core_tbu_clk.clkr,
+	[GCC_WCSS_Q6_TBU_CLK] = &gcc_wcss_q6_tbu_clk.clkr,
+	[GCC_Q6_AXIM2_CLK] = &gcc_q6_axim2_clk.clkr,
+	[GCC_Q6_AHB_CLK] = &gcc_q6_ahb_clk.clkr,
+	[GCC_Q6_AHB_S_CLK] = &gcc_q6_ahb_s_clk.clkr,
+	[GCC_WCSS_DBG_IFC_APB_CLK] = &gcc_wcss_dbg_ifc_apb_clk.clkr,
+	[GCC_WCSS_DBG_IFC_ATB_CLK] = &gcc_wcss_dbg_ifc_atb_clk.clkr,
+	[GCC_WCSS_DBG_IFC_NTS_CLK] = &gcc_wcss_dbg_ifc_nts_clk.clkr,
+	[GCC_WCSS_DBG_IFC_DAPBUS_CLK] = &gcc_wcss_dbg_ifc_dapbus_clk.clkr,
+	[GCC_WCSS_DBG_IFC_APB_BDG_CLK] = &gcc_wcss_dbg_ifc_apb_bdg_clk.clkr,
+	[GCC_WCSS_DBG_IFC_ATB_BDG_CLK] = &gcc_wcss_dbg_ifc_atb_bdg_clk.clkr,
+	[GCC_WCSS_DBG_IFC_NTS_BDG_CLK] = &gcc_wcss_dbg_ifc_nts_bdg_clk.clkr,
+	[GCC_WCSS_DBG_IFC_DAPBUS_BDG_CLK] = &gcc_wcss_dbg_ifc_dapbus_bdg_clk.clkr,
+	[GCC_WCSS_ECAHB_CLK] = &gcc_wcss_ecahb_clk.clkr,
+	[GCC_WCSS_ACMT_CLK] = &gcc_wcss_acmt_clk.clkr,
+	[GCC_WCSS_AHB_S_CLK] = &gcc_wcss_ahb_s_clk.clkr,
+	[GCC_RBCPR_WCSS_CLK] = &gcc_rbcpr_wcss_clk.clkr,
+	[RBCPR_WCSS_CLK_SRC] = &rbcpr_wcss_clk_src.clkr,
+	[GCC_RBCPR_WCSS_AHB_CLK] = &gcc_rbcpr_wcss_ahb_clk.clkr,
+	[GCC_MEM_NOC_Q6_AXI_CLK] = &gcc_mem_noc_q6_axi_clk.clkr,
+	[GCC_LPASS_CORE_AXIM_CLK] = &gcc_lpass_core_axim_clk.clkr,
+	[LPASS_CORE_AXIM_CLK_SRC] = &lpass_core_axim_clk_src.clkr,
+	[GCC_LPASS_SNOC_CFG_CLK] = &gcc_lpass_snoc_cfg_clk.clkr,
+	[LPASS_SNOC_CFG_CLK_SRC] = &lpass_snoc_cfg_clk_src.clkr,
+	[GCC_LPASS_Q6_AXIM_CLK] = &gcc_lpass_q6_axim_clk.clkr,
+	[LPASS_Q6_AXIM_CLK_SRC] = &lpass_q6_axim_clk_src.clkr,
+	[GCC_LPASS_Q6_ATBM_AT_CLK] = &gcc_lpass_q6_atbm_at_clk.clkr,
+	[GCC_LPASS_Q6_PCLKDBG_CLK] = &gcc_lpass_q6_pclkdbg_clk.clkr,
+	[GCC_LPASS_Q6SS_TSCTR_1TO2_CLK] = &gcc_lpass_q6ss_tsctr_1to2_clk.clkr,
+	[GCC_LPASS_Q6SS_TRIG_CLK] = &gcc_lpass_q6ss_trig_clk.clkr,
+	[GCC_LPASS_TBU_CLK] = &gcc_lpass_tbu_clk.clkr,
+	[GCC_PCNOC_LPASS_CLK] = &gcc_pcnoc_lpass_clk.clkr,
+	[GCC_MEM_NOC_UBI32_CLK] = &gcc_mem_noc_ubi32_clk.clkr,
+	[GCC_MEM_NOC_LPASS_CLK] = &gcc_mem_noc_lpass_clk.clkr,
+	[GCC_SNOC_LPASS_CFG_CLK] = &gcc_snoc_lpass_cfg_clk.clkr,
+};
+
+static const struct qcom_reset_map gcc_ipq6018_resets[] = {
+	[GCC_BLSP1_BCR] = { 0x01000, 0 },
+	[GCC_BLSP1_QUP1_BCR] = { 0x02000, 0 },
+	[GCC_BLSP1_UART1_BCR] = { 0x02038, 0 },
+	[GCC_BLSP1_QUP2_BCR] = { 0x03008, 0 },
+	[GCC_BLSP1_UART2_BCR] = { 0x03028, 0 },
+	[GCC_BLSP1_QUP3_BCR] = { 0x04008, 0 },
+	[GCC_BLSP1_UART3_BCR] = { 0x04028, 0 },
+	[GCC_BLSP1_QUP4_BCR] = { 0x05008, 0 },
+	[GCC_BLSP1_UART4_BCR] = { 0x05028, 0 },
+	[GCC_BLSP1_QUP5_BCR] = { 0x06008, 0 },
+	[GCC_BLSP1_UART5_BCR] = { 0x06028, 0 },
+	[GCC_BLSP1_QUP6_BCR] = { 0x07008, 0 },
+	[GCC_BLSP1_UART6_BCR] = { 0x07028, 0 },
+	[GCC_IMEM_BCR] = { 0x0e000, 0 },
+	[GCC_SMMU_BCR] = { 0x12000, 0 },
+	[GCC_APSS_TCU_BCR] = { 0x12050, 0 },
+	[GCC_SMMU_XPU_BCR] = { 0x12054, 0 },
+	[GCC_PCNOC_TBU_BCR] = { 0x12058, 0 },
+	[GCC_SMMU_CFG_BCR] = { 0x1208c, 0 },
+	[GCC_PRNG_BCR] = { 0x13000, 0 },
+	[GCC_BOOT_ROM_BCR] = { 0x13008, 0 },
+	[GCC_CRYPTO_BCR] = { 0x16000, 0 },
+	[GCC_WCSS_BCR] = { 0x18000, 0 },
+	[GCC_WCSS_Q6_BCR] = { 0x18100, 0 },
+	[GCC_NSS_BCR] = { 0x19000, 0 },
+	[GCC_SEC_CTRL_BCR] = { 0x1a000, 0 },
+	[GCC_ADSS_BCR] = { 0x1c000, 0 },
+	[GCC_DDRSS_BCR] = { 0x1e000, 0 },
+	[GCC_SYSTEM_NOC_BCR] = { 0x26000, 0 },
+	[GCC_PCNOC_BCR] = { 0x27018, 0 },
+	[GCC_TCSR_BCR] = { 0x28000, 0 },
+	[GCC_QDSS_BCR] = { 0x29000, 0 },
+	[GCC_DCD_BCR] = { 0x2a000, 0 },
+	[GCC_MSG_RAM_BCR] = { 0x2b000, 0 },
+	[GCC_MPM_BCR] = { 0x2c000, 0 },
+	[GCC_SPDM_BCR] = { 0x2f000, 0 },
+	[GCC_RBCPR_BCR] = { 0x33000, 0 },
+	[GCC_RBCPR_MX_BCR] = { 0x33014, 0 },
+	[GCC_TLMM_BCR] = { 0x34000, 0 },
+	[GCC_RBCPR_WCSS_BCR] = { 0x3a000, 0 },
+	[GCC_USB0_PHY_BCR] = { 0x3e034, 0 },
+	[GCC_USB3PHY_0_PHY_BCR] = { 0x3e03c, 0 },
+	[GCC_USB0_BCR] = { 0x3e070, 0 },
+	[GCC_USB1_BCR] = { 0x3f070, 0 },
+	[GCC_QUSB2_0_PHY_BCR] = { 0x4103c, 0 },
+	[GCC_QUSB2_1_PHY_BCR] = { 0x41040, 0 },
+	[GCC_SDCC1_BCR] = { 0x42000, 0 },
+	[GCC_SNOC_BUS_TIMEOUT0_BCR] = { 0x47000, 0 },
+	[GCC_SNOC_BUS_TIMEOUT1_BCR] = { 0x47008, 0 },
+	[GCC_SNOC_BUS_TIMEOUT2_BCR] = { 0x47010, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT0_BCR] = { 0x48000, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT1_BCR] = { 0x48008, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT2_BCR] = { 0x48010, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT3_BCR] = { 0x48018, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT4_BCR] = { 0x48020, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT5_BCR] = { 0x48028, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT6_BCR] = { 0x48030, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT7_BCR] = { 0x48038, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT8_BCR] = { 0x48040, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT9_BCR] = { 0x48048, 0 },
+	[GCC_UNIPHY0_BCR] = { 0x56000, 0 },
+	[GCC_UNIPHY1_BCR] = { 0x56100, 0 },
+	[GCC_CMN_12GPLL_BCR] = { 0x56300, 0 },
+	[GCC_QPIC_BCR] = { 0x57018, 0 },
+	[GCC_MDIO_BCR] = { 0x58000, 0 },
+	[GCC_WCSS_CORE_TBU_BCR] = { 0x66000, 0 },
+	[GCC_WCSS_Q6_TBU_BCR] = { 0x67000, 0 },
+	[GCC_USB0_TBU_BCR] = { 0x6a000, 0 },
+	[GCC_PCIE0_TBU_BCR] = { 0x6b000, 0 },
+	[GCC_NSS_NOC_TBU_BCR] = { 0x6e000, 0 },
+	[GCC_PCIE0_BCR] = { 0x75004, 0 },
+	[GCC_PCIE0_PHY_BCR] = { 0x75038, 0 },
+	[GCC_PCIE0PHY_PHY_BCR] = { 0x7503c, 0 },
+	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x75044, 0 },
+	[GCC_DCC_BCR] = { 0x77000, 0 },
+	[GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR] = { 0x78000, 0 },
+	[GCC_SMMU_CATS_BCR] = { 0x7c000, 0 },
+	[GCC_UBI0_AXI_ARES] = { 0x68010, 0 },
+	[GCC_UBI0_AHB_ARES] = { 0x68010, 1 },
+	[GCC_UBI0_NC_AXI_ARES] = { 0x68010, 2 },
+	[GCC_UBI0_DBG_ARES] = { 0x68010, 3 },
+	[GCC_UBI0_CORE_CLAMP_ENABLE] = { 0x68010, 4 },
+	[GCC_UBI0_CLKRST_CLAMP_ENABLE] = { 0x68010, 5 },
+	[GCC_UBI0_UTCM_ARES] = { 0x68010, 6 },
+	[GCC_UBI0_CORE_ARES] = { 0x68010, 7 },
+	[GCC_NSS_CFG_ARES] = { 0x68010, 16 },
+	[GCC_NSS_NOC_ARES] = { 0x68010, 18 },
+	[GCC_NSS_CRYPTO_ARES] = { 0x68010, 19 },
+	[GCC_NSS_CSR_ARES] = { 0x68010, 20 },
+	[GCC_NSS_CE_APB_ARES] = { 0x68010, 21 },
+	[GCC_NSS_CE_AXI_ARES] = { 0x68010, 22 },
+	[GCC_NSSNOC_CE_APB_ARES] = { 0x68010, 23 },
+	[GCC_NSSNOC_CE_AXI_ARES] = { 0x68010, 24 },
+	[GCC_NSSNOC_UBI0_AHB_ARES] = { 0x68010, 25 },
+	[GCC_NSSNOC_SNOC_ARES] = { 0x68010, 27 },
+	[GCC_NSSNOC_CRYPTO_ARES] = { 0x68010, 28 },
+	[GCC_NSSNOC_ATB_ARES] = { 0x68010, 29 },
+	[GCC_NSSNOC_QOSGEN_REF_ARES] = { 0x68010, 30 },
+	[GCC_NSSNOC_TIMEOUT_REF_ARES] = { 0x68010, 31 },
+	[GCC_PCIE0_PIPE_ARES] = { 0x75040, 0 },
+	[GCC_PCIE0_SLEEP_ARES] = { 0x75040, 1 },
+	[GCC_PCIE0_CORE_STICKY_ARES] = { 0x75040, 2 },
+	[GCC_PCIE0_AXI_MASTER_ARES] = { 0x75040, 3 },
+	[GCC_PCIE0_AXI_SLAVE_ARES] = { 0x75040, 4 },
+	[GCC_PCIE0_AHB_ARES] = { 0x75040, 5 },
+	[GCC_PCIE0_AXI_MASTER_STICKY_ARES] = { 0x75040, 6 },
+	[GCC_PCIE0_AXI_SLAVE_STICKY_ARES] = { 0x75040, 7 },
+	[GCC_UNIPHY0_XPCS_RESET] = { 0x56004, 2 },
+	[GCC_UNIPHY1_XPCS_RESET] = { 0x56104, 2 },
+	[GCC_LPASS_BCR] = {0x1F000, 0 },
+	[GCC_UBI32_TBU_BCR] = {0x65000, 0},
+	[GCC_LPASS_TBU_BCR] = {0x6C000, 0},
+	[GCC_WCSSAON_RESET] = {0x59010, 0},
+	[GCC_LPASS_Q6_AXIM_ARES] = {0x1F004, 0},
+	[GCC_LPASS_Q6SS_TSCTR_1TO2_ARES] = {0x1F004, 1},
+	[GCC_LPASS_Q6SS_TRIG_ARES] = {0x1F004, 2},
+	[GCC_LPASS_Q6_ATBM_AT_ARES] = {0x1F004, 3},
+	[GCC_LPASS_Q6_PCLKDBG_ARES] = {0x1F004, 4},
+	[GCC_LPASS_CORE_AXIM_ARES] = {0x1F004, 5},
+	[GCC_LPASS_SNOC_CFG_ARES] = {0x1F004, 6},
+	[GCC_WCSS_DBG_ARES] = {0x59008, 0},
+	[GCC_WCSS_ECAHB_ARES] = {0x59008, 1},
+	[GCC_WCSS_ACMT_ARES] = {0x59008, 2},
+	[GCC_WCSS_DBG_BDG_ARES] = {0x59008, 3},
+	[GCC_WCSS_AHB_S_ARES] = {0x59008, 4},
+	[GCC_WCSS_AXI_M_ARES] = {0x59008, 5},
+	[GCC_Q6SS_DBG_ARES] = {0x59110, 0},
+	[GCC_Q6_AHB_S_ARES] = {0x59110, 1},
+	[GCC_Q6_AHB_ARES] = {0x59110, 2},
+	[GCC_Q6_AXIM2_ARES] = {0x59110, 3},
+	[GCC_Q6_AXIM_ARES] = {0x59110, 4},
+};
+
+static const struct of_device_id gcc_ipq6018_match_table[] = {
+	{ .compatible = "qcom,gcc-ipq6018" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_ipq6018_match_table);
+
+static const struct regmap_config gcc_ipq6018_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register   = 0x7fffc,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_ipq6018_desc = {
+	.config = &gcc_ipq6018_regmap_config,
+	.clks = gcc_ipq6018_clks,
+	.num_clks = ARRAY_SIZE(gcc_ipq6018_clks),
+	.resets = gcc_ipq6018_resets,
+	.num_resets = ARRAY_SIZE(gcc_ipq6018_resets),
+	.clk_hws = gcc_ipq6018_hws,
+	.num_clk_hws = ARRAY_SIZE(gcc_ipq6018_hws),
+};
+
+static int gcc_ipq6018_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gcc_ipq6018_desc);
+}
+
+static int gcc_ipq6018_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver gcc_ipq6018_driver = {
+	.probe = gcc_ipq6018_probe,
+	.remove = gcc_ipq6018_remove,
+	.driver = {
+		.name   = "qcom,gcc-ipq6018",
+		.owner  = THIS_MODULE,
+		.of_match_table = gcc_ipq6018_match_table,
+	},
+};
+
+static int __init gcc_ipq6018_init(void)
+{
+	return platform_driver_register(&gcc_ipq6018_driver);
+}
+core_initcall(gcc_ipq6018_init);
+
+static void __exit gcc_ipq6018_exit(void)
+{
+	platform_driver_unregister(&gcc_ipq6018_driver);
+}
+module_exit(gcc_ipq6018_exit);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. GCC IPQ6018 Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:gcc-ipq6018");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

