Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E132427A6C5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 07:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgI1FRI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 01:17:08 -0400
Received: from z5.mailgun.us ([104.130.96.5]:43441 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbgI1FRI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 01:17:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601270221; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=LXvOgvo/7RH2fH2R0Lq4AsmHibESNtZlzUy7ydAxe0k=; b=rIJ/Q/9KoygG0iDP9yOw0Y4dxFIkz6xNFft1zhsZX7DBhxFBxU9pq5dS/1AvpE4igwqzhdAY
 XzlbXtZSV03u4+mYxcn65EunW97xpbDPLsN4EWhY+VkWDp3eCrSjKNAYIZM5trKg/M7Gi6Nc
 hWqqn+E35PXKApz/sCKpaS4WBGM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7171cd557d03a9f43c0b4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 05:17:01
 GMT
Sender: varada=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0FED2C433CA; Mon, 28 Sep 2020 05:17:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from varda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: varada)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8675CC433F1;
        Mon, 28 Sep 2020 05:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8675CC433F1
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
Subject: [PATCH 3/7] clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018
Date:   Mon, 28 Sep 2020 10:45:36 +0530
Message-Id: <1601270140-4306-4-git-send-email-varada@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the global clock controller found on IPQ5018
based devices.

Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
---
 drivers/clk/qcom/Kconfig       |    8 +
 drivers/clk/qcom/Makefile      |    1 +
 drivers/clk/qcom/gcc-ipq5018.c | 3833 ++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h   |    4 +-
 4 files changed, 3844 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-ipq5018.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 0583273..d1a2504 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -155,6 +155,14 @@ config IPQ_GCC_8074
 	  i2c, USB, SD/eMMC, etc. Select this for the root clock
 	  of ipq8074.
 
+config IPQ_GCC_5018
+	tristate "IPQ5018 Global Clock Controller"
+	help
+	 Support for global clock controller on ipq5018 devices.
+	 Say Y if you want to use peripheral devices such as UART, SPI,
+	 i2c, USB, SD/eMMC, etc. Select this for the root clock
+	 of ipq5018.
+
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9677e76..1283f70 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
+obj-$(CONFIG_IPQ_GCC_5018) += gcc-ipq5018.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
 obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
 obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
new file mode 100644
index 00000000..9056386
--- /dev/null
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -0,0 +1,3833 @@
+// SPDX-License-Identifier: GPL-2.0+
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
+#include <dt-bindings/clock/qcom,gcc-ipq5018.h>
+#include <dt-bindings/reset/qcom,gcc-ipq5018.h>
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
+	P_GPLL0,
+	P_GPLL0_DIV2,
+	P_GPLL2,
+	P_GPLL4,
+	P_UBI32_PLL,
+	P_GEPHY_RX,
+	P_GEPHY_TX,
+	P_UNIPHY_RX,
+	P_UNIPHY_TX,
+	P_CORE_PI_SLEEP_CLK,
+	P_PCIE20_PHY0_PIPE,
+	P_PCIE20_PHY1_PIPE,
+	P_USB3PHY_0_PIPE,
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
+static const char * const gcc_xo_ubi32_gpll0[] = {
+	"xo",
+	"ubi32_pll",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_ubi32_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_UBI32_PLL, 1 },
+	{ P_GPLL0, 2 },
+};
+
+static const char * const gcc_xo_gpll0_gpll2[] = {
+	"xo",
+	"gpll0",
+	"gpll2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2, 2 },
+};
+
+static const char * const gcc_xo_gpll0_gpll2_gpll4[] = {
+	"xo",
+	"gpll0",
+	"gpll2",
+	"gpll4",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll2_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2, 2 },
+	{ P_GPLL4, 3 },
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
+	{ P_CORE_PI_SLEEP_CLK, 6 },
+};
+
+static const char * const gcc_xo_gpll0_gpll0_out_main_div2_sleep_clk[] = {
+	"xo",
+	"gpll0",
+	"gpll0_out_main_div2",
+	"sleep_clk",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll0_out_main_div2_sleep_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL0_DIV2, 4 },
+	{ P_CORE_PI_SLEEP_CLK, 6 },
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
+static const char * const gcc_xo_gpll4_gpll0_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll4",
+	"gpll0",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll4_gpll0_gpll0_out_main_div2_map1[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4, 1 },
+	{ P_GPLL0, 2 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const struct parent_map gcc_xo_gpll4_gpll0_gpll0_out_main_div2_map2[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4, 1 },
+	{ P_GPLL0, 3 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const char * const gcc_xo_gpll0_gpll4_gpll2[] = {
+	"xo",
+	"gpll0",
+	"gpll4",
+	"gpll2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_gpll2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 3 },
+	{ P_GPLL2, 4 },
+};
+
+static const char * const gcc_xo_gephy_gcc_rx_gephy_gcc_tx_ubi32_pll_gpll0[] = {
+	"xo",
+	"gephy_gcc_rx",
+	"gephy_gcc_tx",
+	"ubi32_pll",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_gephy_gcc_rx_gephy_gcc_tx_ubi32_pll_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GEPHY_RX, 1 },
+	{ P_GEPHY_TX, 2 },
+	{ P_UBI32_PLL, 3 },
+	{ P_GPLL0, 4 },
+};
+
+static const char * const gcc_xo_gephy_gcc_tx_gephy_gcc_rx_ubi32_pll_gpll0[] = {
+	"xo",
+	"gephy_gcc_tx",
+	"gephy_gcc_rx",
+	"ubi32_pll",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_gephy_gcc_tx_gephy_gcc_rx_ubi32_pll_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GEPHY_TX, 1 },
+	{ P_GEPHY_RX, 2 },
+	{ P_UBI32_PLL, 3 },
+	{ P_GPLL0, 4 },
+};
+
+static const char * const gcc_xo_uniphy_gcc_rx_uniphy_gcc_tx_ubi32_pll_gpll0[] = {
+	"xo",
+	"uniphy_gcc_rx",
+	"uniphy_gcc_tx",
+	"ubi32_pll",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_uniphy_gcc_rx_uniphy_gcc_tx_ubi32_pll_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY_RX, 1 },
+	{ P_UNIPHY_TX, 2 },
+	{ P_UBI32_PLL, 3 },
+	{ P_GPLL0, 4 },
+};
+
+static const char * const gcc_xo_uniphy_gcc_tx_uniphy_gcc_rx_ubi32_pll_gpll0[] = {
+	"xo",
+	"uniphy_gcc_tx",
+	"uniphy_gcc_rx",
+	"ubi32_pll",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_uniphy_gcc_tx_uniphy_gcc_rx_ubi32_pll_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY_TX, 1 },
+	{ P_UNIPHY_RX, 2 },
+	{ P_UBI32_PLL, 3 },
+	{ P_GPLL0, 4 },
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
+static const char * const gcc_pcie20_phy1_pipe_clk_xo[] = {
+	"pcie20_phy1_pipe_clk",
+	"xo",
+};
+
+static const struct parent_map gcc_pcie20_phy1_pipe_clk_xo_map[] = {
+	{ P_PCIE20_PHY1_PIPE, 0 },
+	{ P_XO, 2 },
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
+			.ops = &clk_alpha_pll_stromer_ops,
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
+			.ops = &clk_alpha_pll_stromer_ops,
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
+			.ops = &clk_alpha_pll_stromer_ops,
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
+static struct clk_alpha_pll ubi32_pll_main = {
+	.offset = 0x25000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "ubi32_pll_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_stromer_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv ubi32_pll = {
+	.offset = 0x25000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
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
+static const struct freq_tbl ftbl_apss_ahb_clk_src[] = {
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 apss_ahb_clk_src = {
+	.cmd_rcgr = 0x46000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.freq_tbl = ftbl_apss_ahb_clk_src,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "apss_ahb_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IS_CRITICAL | CLK_IGNORE_UNUSED,
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
+static const struct freq_tbl ftbl_apss_axi_clk_src[] = {
+	F(400000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 apss_axi_clk_src = {
+	.cmd_rcgr = 0x38048,
+	.freq_tbl = ftbl_apss_axi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll4_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "apss_axi_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll4,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_blsp1_qup_i2c_apps_clk_src[] = {
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
+static const struct freq_tbl ftbl_blsp1_qup_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 2, 5),
+	F(4800000, P_XO, 5, 0, 0),
+	F(9600000, P_XO, 2, 4, 5),
+	F(16000000, P_GPLL0, 10, 1, 5),
+	F(24000000, P_XO, 1, 0, 0),
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
+static const struct freq_tbl ftbl_blsp1_uart_apps_clk_src[] = {
+	F(3686400, P_GPLL0_DIV2, 1, 144, 15625),
+	F(7372800, P_GPLL0_DIV2, 1, 288, 15625),
+	F(14745600, P_GPLL0_DIV2, 1, 576, 15625),
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0, 16, 1, 2),
+	F(40000000, P_GPLL0, 1, 1, 20),
+	F(46400000, P_GPLL0, 1, 29, 500),
+	F(48000000, P_GPLL0, 1, 3, 50),
+	F(51200000, P_GPLL0, 1, 8, 125),
+	F(56000000, P_GPLL0, 1, 7, 100),
+	F(58982400, P_GPLL0, 1, 1152, 15625),
+	F(60000000, P_GPLL0, 1, 3, 40),
+	F(64000000, P_GPLL0, 10, 4, 5),
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
+static const struct freq_tbl ftbl_crypto_clk_src[] = {
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
+static const struct freq_tbl ftbl_gmac0_tx_clk_src[] = {
+	F(2500000, P_GEPHY_TX, 5, 0, 0),
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_GEPHY_TX, 5, 0, 0),
+	F(125000000, P_GEPHY_TX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gmac0_rx_clk_src = {
+	.cmd_rcgr = 0x68020,
+	.parent_map = gcc_xo_gephy_gcc_rx_gephy_gcc_tx_ubi32_pll_gpll0_map,
+	.hid_width = 5,
+	.freq_tbl = ftbl_gmac0_tx_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gmac0_rx_clk_src",
+		.parent_names = gcc_xo_gephy_gcc_rx_gephy_gcc_tx_ubi32_pll_gpll0,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gmac0_rx_div_clk_src = {
+	.reg = 0x68420,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gmac0_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"gmac0_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 gmac0_tx_clk_src = {
+	.cmd_rcgr = 0x68028,
+	.parent_map = gcc_xo_gephy_gcc_tx_gephy_gcc_rx_ubi32_pll_gpll0_map,
+	.hid_width = 5,
+	.freq_tbl = ftbl_gmac0_tx_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gmac0_tx_clk_src",
+		.parent_names = gcc_xo_gephy_gcc_tx_gephy_gcc_rx_ubi32_pll_gpll0,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gmac0_tx_div_clk_src = {
+	.reg = 0x68424,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gmac0_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"gmac0_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_gmac1_rx_clk_src[] = {
+	F(2500000, P_UNIPHY_RX, 12.5, 0, 0),
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY_RX, 2.5, 0, 0),
+	F(125000000, P_UNIPHY_RX, 2.5, 0, 0),
+	F(125000000, P_UNIPHY_RX, 1, 0, 0),
+	F(312500000, P_UNIPHY_RX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gmac1_rx_clk_src = {
+	.cmd_rcgr = 0x68030,
+	.parent_map = gcc_xo_uniphy_gcc_rx_uniphy_gcc_tx_ubi32_pll_gpll0_map,
+	.hid_width = 5,
+	.freq_tbl = ftbl_gmac1_rx_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gmac1_rx_clk_src",
+		.parent_names = gcc_xo_uniphy_gcc_rx_uniphy_gcc_tx_ubi32_pll_gpll0,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gmac1_rx_div_clk_src = {
+	.reg = 0x68430,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gmac1_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"gmac1_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_gmac1_tx_clk_src[] = {
+	F(2500000, P_UNIPHY_TX, 12.5, 0, 0),
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY_TX, 2.5, 0, 0),
+	F(125000000, P_UNIPHY_TX, 2.5, 0, 0),
+	F(125000000, P_UNIPHY_TX, 1, 0, 0),
+	F(312500000, P_UNIPHY_TX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gmac1_tx_clk_src = {
+	.cmd_rcgr = 0x68038,
+	.parent_map = gcc_xo_uniphy_gcc_tx_uniphy_gcc_rx_ubi32_pll_gpll0_map,
+	.hid_width = 5,
+	.freq_tbl = ftbl_gmac1_tx_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gmac1_tx_clk_src",
+		.parent_names = gcc_xo_uniphy_gcc_tx_uniphy_gcc_rx_ubi32_pll_gpll0,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gmac1_tx_div_clk_src = {
+	.reg = 0x68434,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gmac1_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"gmac1_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_gmac_clk_src[] = {
+	F(240000000, P_GPLL4, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gmac_clk_src = {
+	.cmd_rcgr = 0x68080,
+	.parent_map = gcc_xo_gpll0_gpll4_map,
+	.hid_width = 5,
+	.freq_tbl = ftbl_gmac_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gmac_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll4,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gp_clk_src[] = {
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp1_clk_src = {
+	.cmd_rcgr = 0x08004,
+	.freq_tbl = ftbl_gp_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp1_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2_sleep_clk,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gp2_clk_src = {
+	.cmd_rcgr = 0x09004,
+	.freq_tbl = ftbl_gp_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp2_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2_sleep_clk,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gp3_clk_src = {
+	.cmd_rcgr = 0x0a004,
+	.freq_tbl = ftbl_gp_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp3_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2_sleep_clk,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_axim_clk_src[] = {
+	F(133333334, P_GPLL0, 6, 0, 0),
+	{ }
+};
+
+struct clk_rcg2 lpass_axim_clk_src = {
+	.cmd_rcgr = 0x2E028,
+	.freq_tbl = ftbl_lpass_axim_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_axim_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_sway_clk_src[] = {
+	F(66666667, P_GPLL0, 12, 0, 0),
+	{ }
+};
+
+struct clk_rcg2 lpass_sway_clk_src = {
+	.cmd_rcgr = 0x2E040,
+	.freq_tbl = ftbl_lpass_sway_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_sway_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IGNORE_UNUSED,
+	},
+};
+
+static const struct freq_tbl ftbl_pcie0_aux_clk_src[] = {
+	F(2000000, P_XO, 12, 0, 0),
+};
+
+static struct clk_rcg2 pcie0_aux_clk_src = {
+	.cmd_rcgr = 0x75020,
+	.freq_tbl = ftbl_pcie0_aux_clk_src,
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
+static const struct freq_tbl ftbl_pcie0_axi_clk_src[] = {
+	F(240000000, P_GPLL4, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 pcie0_axi_clk_src = {
+	.cmd_rcgr = 0x75050,
+	.freq_tbl = ftbl_pcie0_axi_clk_src,
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
+static struct clk_rcg2 pcie1_aux_clk_src = {
+	.cmd_rcgr = 0x76020,
+	.freq_tbl = ftbl_pcie0_aux_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_core_pi_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie1_aux_clk_src",
+		.parent_names = gcc_xo_gpll0_core_pi_sleep_clk,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_rcg2 pcie1_axi_clk_src = {
+	.cmd_rcgr = 0x76050,
+	.freq_tbl = ftbl_gp_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie1_axi_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
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
+static struct clk_regmap_mux pcie1_pipe_clk_src = {
+	.reg = 0x7601c,
+	.shift = 8,
+	.width = 2,
+	.parent_map = gcc_pcie20_phy1_pipe_clk_xo_map,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "pcie1_pipe_clk_src",
+			.parent_names = gcc_pcie20_phy1_pipe_clk_xo,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] = {
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
+static const struct freq_tbl ftbl_qdss_at_clk_src[] = {
+	F(240000000, P_GPLL4, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 qdss_at_clk_src = {
+	.cmd_rcgr = 0x2900c,
+	.freq_tbl = ftbl_qdss_at_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll4_gpll0_gpll0_out_main_div2_map1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "qdss_at_clk_src",
+		.parent_names = gcc_xo_gpll4_gpll0_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_qdss_stm_clk_src[] = {
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 qdss_stm_clk_src = {
+	.cmd_rcgr = 0x2902C,
+	.freq_tbl = ftbl_qdss_stm_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "qdss_stm_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_qdss_traceclkin_clk_src[] = {
+	F(266666667, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 qdss_traceclkin_clk_src = {
+	.cmd_rcgr = 0x29048,
+	.freq_tbl = ftbl_qdss_traceclkin_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll4_gpll0_gpll0_out_main_div2_map1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "qdss_traceclkin_clk_src",
+		.parent_names = gcc_xo_gpll4_gpll0_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_qdss_tsctr_clk_src[] = {
+	F(600000000, P_GPLL4, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 qdss_tsctr_clk_src = {
+	.cmd_rcgr = 0x29064,
+	.freq_tbl = ftbl_qdss_tsctr_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll4_gpll0_gpll0_out_main_div2_map1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "qdss_tsctr_clk_src",
+		.parent_names = gcc_xo_gpll4_gpll0_gpll0_out_main_div2,
+		.num_parents = 4,
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
+static struct clk_fixed_factor eud_at_clk_src = {
+	.mult = 1,
+	.div = 6,
+	.hw.init = &(struct clk_init_data){
+		.name = "eud_at_clk_src",
+		.parent_names = (const char *[]){
+			"qdss_at_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_qpic_io_macro_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
+};
+
+static struct clk_rcg2 qpic_io_macro_clk_src = {
+	.cmd_rcgr = 0x57010,
+	.freq_tbl = ftbl_qpic_io_macro_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "qpic_io_macro_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IGNORE_UNUSED,
+	},
+};
+
+static const struct freq_tbl ftbl_sdcc1_apps_clk_src[] = {
+	F(143713, P_XO, 1, 1, 167),
+	F(400000, P_XO, 1, 1, 60),
+	F(24000000, P_XO, 1, 0, 0),
+	F(48000000, P_GPLL2, 12, 1, 2),
+	F(96000000, P_GPLL2, 12, 0, 0),
+	F(177777778, P_GPLL0, 1, 2, 9),
+	F(192000000, P_GPLL2, 6, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x42004,
+	.freq_tbl = ftbl_sdcc1_apps_clk_src,
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
+static const struct freq_tbl ftbl_system_noc_bfdcd_clk_src[] = {
+	F(266666667, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 system_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x26004,
+	.freq_tbl = ftbl_system_noc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "system_noc_bfdcd_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IS_CRITICAL,
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
+static struct clk_rcg2 ubi0_axi_clk_src = {
+	.cmd_rcgr = 0x68088,
+	.freq_tbl = ftbl_apss_axi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ubi0_axi_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_ubi0_core_clk_src[] = {
+	F(850000000, P_UBI32_PLL, 1, 0, 0),
+	F(1000000000, P_UBI32_PLL, 1, 0, 0),
+};
+
+static struct clk_rcg2 ubi0_core_clk_src = {
+	.cmd_rcgr = 0x68100,
+	.freq_tbl = ftbl_ubi0_core_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_ubi32_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ubi0_core_clk_src",
+		.parent_names = gcc_xo_ubi32_gpll0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_rcg2 usb0_aux_clk_src = {
+	.cmd_rcgr = 0x3e05c,
+	.freq_tbl = ftbl_pcie0_aux_clk_src,
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
+static const struct freq_tbl ftbl_usb0_lfps_clk_src[] = {
+	F(25000000, P_GPLL0, 16, 1, 2),
+	{ }
+};
+
+static struct clk_rcg2 usb0_lfps_clk_src = {
+	.cmd_rcgr = 0x3e090,
+	.freq_tbl = ftbl_usb0_lfps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb0_lfps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 usb0_master_clk_src = {
+	.cmd_rcgr = 0x3e00c,
+	.freq_tbl = ftbl_gp_clk_src,
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
+static const struct freq_tbl ftbl_usb0_mock_utmi_clk_src[] = {
+	F(60000000, P_GPLL4, 10, 1, 2),
+	{ }
+};
+
+static struct clk_rcg2 usb0_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x3e020,
+	.freq_tbl = ftbl_usb0_mock_utmi_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll4_gpll0_gpll0_out_main_div2_map2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb0_mock_utmi_clk_src",
+		.parent_names = gcc_xo_gpll4_gpll0_gpll0_out_main_div2,
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
+static const struct freq_tbl ftbl_q6_axi_clk_src[] = {
+	F(400000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 q6_axi_clk_src = {
+	.cmd_rcgr = 0x59120,
+	.freq_tbl = ftbl_q6_axi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_gpll4_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "q6_axi_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2_gpll4,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IGNORE_UNUSED,
+	},
+};
+
+static const struct freq_tbl ftbl_wcss_ahb_clk_src[] = {
+	F(133333333, P_GPLL0, 6, 0, 0),
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
+				"apss_ahb_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+static struct clk_branch gcc_btss_lpo_clk = {
+	.halt_reg = 0x1c004,
+	.clkr = {
+		.enable_reg = 0x1c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_btss_lpo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cmn_blk_ahb_clk = {
+	.halt_reg = 0x56308,
+	.clkr = {
+		.enable_reg = 0x56308,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cmn_blk_ahb_clk",
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
+static struct clk_branch gcc_cmn_blk_sys_clk = {
+	.halt_reg = 0x5630c,
+	.clkr = {
+		.enable_reg = 0x5630c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cmn_blk_sys_clk",
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
+static struct clk_branch gcc_gephy_rx_clk = {
+	.halt_reg = 0x56010,
+	.clkr = {
+		.enable_reg = 0x56010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gephy_rx_clk",
+			.parent_names = (const char *[]){
+				"gmac0_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gcc_gephy_tx_clk = {
+	.halt_reg = 0x56014,
+	.clkr = {
+		.enable_reg = 0x56014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gephy_tx_clk",
+			.parent_names = (const char *[]){
+				"gmac0_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac0_cfg_clk = {
+	.halt_reg = 0x68304,
+	.clkr = {
+		.enable_reg = 0x68304,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac0_cfg_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac0_ptp_clk = {
+	.halt_reg = 0x68300,
+	.clkr = {
+		.enable_reg = 0x68300,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac0_ptp_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac0_rx_clk = {
+	.halt_reg = 0x68240,
+	.clkr = {
+		.enable_reg = 0x68240,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac0_rx_clk",
+			.parent_names = (const char *[]){
+				"gmac0_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac0_sys_clk = {
+	.halt_reg = 0x68190,
+	.halt_check = BRANCH_HALT_DELAY,
+	.halt_bit = 31,
+	.clkr = {
+		.enable_reg = 0x683190,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac0_sys_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac0_tx_clk = {
+	.halt_reg = 0x68244,
+	.clkr = {
+		.enable_reg = 0x68244,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac0_tx_clk",
+			.parent_names = (const char *[]){
+				"gmac0_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac1_cfg_clk = {
+	.halt_reg = 0x68324,
+	.clkr = {
+		.enable_reg = 0x68324,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac1_cfg_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac1_ptp_clk = {
+	.halt_reg = 0x68320,
+	.clkr = {
+		.enable_reg = 0x68320,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac1_ptp_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac1_rx_clk = {
+	.halt_reg = 0x68248,
+	.clkr = {
+		.enable_reg = 0x68248,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac1_rx_clk",
+			.parent_names = (const char *[]){
+				"gmac1_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac1_sys_clk = {
+	.halt_reg = 0x68310,
+	.clkr = {
+		.enable_reg = 0x68310,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac1_sys_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gmac1_tx_clk = {
+	.halt_reg = 0x6824c,
+	.clkr = {
+		.enable_reg = 0x6824c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gmac1_tx_clk",
+			.parent_names = (const char *[]){
+				"gmac1_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
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
+static struct clk_branch gcc_lpass_core_axim_clk = {
+	.halt_reg = 0x2E048,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x2E048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_core_axim_clk",
+			.parent_names = (const char *[]){
+				"lpass_axim_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_sway_clk = {
+	.halt_reg = 0x2E04C,
+	.clkr = {
+		.enable_reg = 0x2E04C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_sway_clk",
+			.parent_names = (const char *[]){
+				"lpass_sway_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdio0_ahb_clk = {
+	.halt_reg = 0x58004,
+	.clkr = {
+		.enable_reg = 0x58004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdioi0_ahb_clk",
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
+static struct clk_branch gcc_mdio1_ahb_clk = {
+	.halt_reg = 0x58014,
+	.clkr = {
+		.enable_reg = 0x58014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdio1_ahb_clk",
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
+static struct clk_branch gcc_pcie0_pipe_clk = {
+	.halt_reg = 0x75018,
+	.halt_check = BRANCH_HALT_DELAY,
+	.halt_bit = 31,
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
+static struct clk_branch gcc_pcie1_ahb_clk = {
+	.halt_reg = 0x76010,
+	.clkr = {
+		.enable_reg = 0x76010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_ahb_clk",
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
+static struct clk_branch gcc_pcie1_aux_clk = {
+	.halt_reg = 0x76014,
+	.clkr = {
+		.enable_reg = 0x76014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_aux_clk",
+			.parent_names = (const char *[]){
+				"pcie1_aux_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_m_clk = {
+	.halt_reg = 0x76008,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_axi_m_clk",
+			.parent_names = (const char *[]){
+				"pcie1_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_s_bridge_clk = {
+	.halt_reg = 0x76048,
+	.clkr = {
+		.enable_reg = 0x76048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_axi_s_bridge_clk",
+			.parent_names = (const char *[]){
+				"pcie1_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_s_clk = {
+	.halt_reg = 0x7600c,
+	.clkr = {
+		.enable_reg = 0x7600c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_axi_s_clk",
+			.parent_names = (const char *[]){
+				"pcie1_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_pipe_clk = {
+	.halt_reg = 0x76018,
+	.halt_check = BRANCH_HALT_DELAY,
+	.halt_bit = 31,
+	.clkr = {
+		.enable_reg = 0x76018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_pipe_clk",
+			.parent_names = (const char *[]){
+				"pcie1_pipe_clk_src"
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6_axis_clk = {
+	.halt_reg = 0x59154,
+	.clkr = {
+		.enable_reg = 0x59154,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6_axis_clk",
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+static struct clk_branch gcc_q6ss_trig_clk = {
+	.halt_reg = 0x59128,
+	.clkr = {
+		.enable_reg = 0x59128,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_q6ss_trig_clk",
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
+				"qdss_tsctr_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_cfg_ahb_clk = {
+	.halt_reg = 0x29008,
+	.clkr = {
+		.enable_reg = 0x29008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_cfg_ahb_clk",
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
+static struct clk_branch gcc_qdss_dap_ahb_clk = {
+	.halt_reg = 0x29004,
+	.clkr = {
+		.enable_reg = 0x29004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_dap_ahb_clk",
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
+static struct clk_branch gcc_qdss_etr_usb_clk = {
+	.halt_reg = 0x29028,
+	.clkr = {
+		.enable_reg = 0x29028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_etr_usb_clk",
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
+static struct clk_branch gcc_qdss_eud_at_clk = {
+	.halt_reg = 0x29020,
+	.clkr = {
+		.enable_reg = 0x29020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_eud_at_clk",
+			.parent_names = (const char *[]){
+				"eud_at_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_stm_clk = {
+	.halt_reg = 0x29044,
+	.clkr = {
+		.enable_reg = 0x29044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_stm_clk",
+			.parent_names = (const char *[]){
+				"qdss_stm_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_traceclkin_clk = {
+	.halt_reg = 0x29060,
+	.clkr = {
+		.enable_reg = 0x29060,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_traceclkin_clk",
+			.parent_names = (const char *[]){
+				"qdss_traceclkin_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_tsctr_div8_clk = {
+	.halt_reg = 0x2908c,
+	.clkr = {
+		.enable_reg = 0x2908c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_tsctr_div8_clk",
+			.parent_names = (const char *[]){
+				"qdss_tsctr_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+static struct clk_branch gcc_qpic_io_macro_clk = {
+	.halt_reg = 0x5701c,
+	.clkr = {
+		.enable_reg = 0x5701c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qpic_io_macro_clk",
+			.parent_names = (const char *[]){
+				"qpic_io_macro_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+static struct clk_branch gcc_snoc_gmac0_ahb_clk = {
+	.halt_reg = 0x260a0,
+	.clkr = {
+		.enable_reg = 0x260a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_gmac0_ahb_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_gmac0_axi_clk = {
+	.halt_reg = 0x26084,
+	.clkr = {
+		.enable_reg = 0x26084,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_gmac0_axi_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_gmac1_ahb_clk = {
+	.halt_reg = 0x260a4,
+	.clkr = {
+		.enable_reg = 0x260a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_gmac1_ahb_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_gmac1_axi_clk = {
+	.halt_reg = 0x26088,
+	.clkr = {
+		.enable_reg = 0x26088,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_gmac1_axi_clk",
+			.parent_names = (const char *[]){
+				"gmac_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_lpass_axim_clk = {
+	.halt_reg = 0x26074,
+	.clkr = {
+		.enable_reg = 0x26074,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_lpass_axim_clk",
+			.parent_names = (const char *[]){
+				"lpass_axim_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_lpass_sway_clk = {
+	.halt_reg = 0x26078,
+	.clkr = {
+		.enable_reg = 0x26078,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_lpass_sway_clk",
+			.parent_names = (const char *[]){
+				"lpass_sway_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_ubi0_axi_clk = {
+	.halt_reg = 0x26094,
+	.clkr = {
+		.enable_reg = 0x26094,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_snoc_ubi0_axi_clk",
+			.parent_names = (const char *[]){
+				"ubi0_axi_clk_src"
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
+static struct clk_branch gcc_sys_noc_pcie1_axi_clk = {
+	.halt_reg = 0x2604c,
+	.clkr = {
+		.enable_reg = 0x2604c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_pcie1_axi_clk",
+			.parent_names = (const char *[]){
+				"pcie1_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_qdss_stm_axi_clk = {
+	.halt_reg = 0x26024,
+	.clkr = {
+		.enable_reg = 0x26024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_qdss_stm_axi_clk",
+			.parent_names = (const char *[]){
+				"qdss_stm_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+				"ubi0_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_cfg_clk = {
+	.halt_reg = 0x68160,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x68160,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_cfg_clk",
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
+static struct clk_branch gcc_ubi0_dbg_clk = {
+	.halt_reg = 0x68214,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x68214,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_dbg_clk",
+			.parent_names = (const char *[]){
+				"qdss_tsctr_clk_src"
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
+				"ubi0_core_clk_src"
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
+				"system_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_utcm_clk = {
+	.halt_reg = 0x68208,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x68208,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_utcm_clk",
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
+static struct clk_branch gcc_uniphy_ahb_clk = {
+	.halt_reg = 0x56108,
+	.clkr = {
+		.enable_reg = 0x56108,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy_ahb_clk",
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
+static struct clk_branch gcc_uniphy_rx_clk = {
+	.halt_reg = 0x56110,
+	.clkr = {
+		.enable_reg = 0x56110,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy_rx_clk",
+			.parent_names = (const char *[]){
+				"gmac1_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy_tx_clk = {
+	.halt_reg = 0x56114,
+	.clkr = {
+		.enable_reg = 0x56114,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy_tx_clk",
+			.parent_names = (const char *[]){
+				"gmac1_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy_sys_clk = {
+	.halt_reg = 0x5610C,
+	.clkr = {
+		.enable_reg = 0x5610C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy_sys_clk",
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
+static struct clk_branch gcc_usb0_eud_at_clk = {
+	.halt_reg = 0x3e04c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x3e04c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_eud_at_clk",
+			.parent_names = (const char *[]){
+				"eud_at_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_lfps_clk = {
+	.halt_reg = 0x3e050,
+	.clkr = {
+		.enable_reg = 0x3e050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_lfps_clk",
+			.parent_names = (const char *[]){
+				"usb0_lfps_clk_src"
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_axi_s_clk = {
+	.halt_reg = 0x59068,
+	.clkr = {
+		.enable_reg = 0x59068,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wcss_axi_s_clk",
+			.parent_names = (const char *[]){
+				"system_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
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
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_hw *gcc_ipq5018_hws[] = {
+	&gpll0_out_main_div2.hw,
+	&pcnoc_clk_src.hw,
+	&system_noc_clk_src.hw,
+	&qdss_dap_sync_clk_src.hw,
+	&qdss_tsctr_div2_clk_src.hw,
+	&eud_at_clk_src.hw,
+};
+
+static const struct alpha_pll_config ubi32_pll_config = {
+	.l = 0x29,
+	.alpha = 0xAAAAAAAA,
+	.alpha_hi = 0xAA,
+	.config_ctl_val = 0x4001075b,
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.alpha_en_mask = BIT(24),
+	.vco_val = 0x1,
+	.vco_mask = GENMASK(21, 20),
+	.test_ctl_val = 0x0,
+	.test_ctl_hi_val = 0x0,
+};
+
+static struct clk_regmap *gcc_ipq5018_clks[] = {
+	[GPLL0_MAIN] = &gpll0_main.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL2_MAIN] = &gpll2_main.clkr,
+	[GPLL2] = &gpll2.clkr,
+	[GPLL4_MAIN] = &gpll4_main.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[UBI32_PLL_MAIN] = &ubi32_pll_main.clkr,
+	[UBI32_PLL] = &ubi32_pll.clkr,
+	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
+	[APSS_AHB_POSTDIV_CLK_SRC] = &apss_ahb_postdiv_clk_src.clkr,
+	[APSS_AXI_CLK_SRC] = &apss_axi_clk_src.clkr,
+	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,
+	[BLSP1_QUP2_I2C_APPS_CLK_SRC] = &blsp1_qup2_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP2_SPI_APPS_CLK_SRC] = &blsp1_qup2_spi_apps_clk_src.clkr,
+	[BLSP1_QUP3_I2C_APPS_CLK_SRC] = &blsp1_qup3_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP3_SPI_APPS_CLK_SRC] = &blsp1_qup3_spi_apps_clk_src.clkr,
+	[BLSP1_UART1_APPS_CLK_SRC] = &blsp1_uart1_apps_clk_src.clkr,
+	[BLSP1_UART2_APPS_CLK_SRC] = &blsp1_uart2_apps_clk_src.clkr,
+	[CRYPTO_CLK_SRC] = &crypto_clk_src.clkr,
+	[GCC_APSS_AHB_CLK] = &gcc_apss_ahb_clk.clkr,
+	[GCC_APSS_AXI_CLK] = &gcc_apss_axi_clk.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
+	[GCC_BTSS_LPO_CLK] = &gcc_btss_lpo_clk.clkr,
+	[GCC_CMN_BLK_AHB_CLK] = &gcc_cmn_blk_ahb_clk.clkr,
+	[GCC_CMN_BLK_SYS_CLK] = &gcc_cmn_blk_sys_clk.clkr,
+	[GCC_CRYPTO_AHB_CLK] = &gcc_crypto_ahb_clk.clkr,
+	[GCC_CRYPTO_AXI_CLK] = &gcc_crypto_axi_clk.clkr,
+	[GCC_CRYPTO_CLK] = &gcc_crypto_clk.clkr,
+	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
+	[GCC_GEPHY_RX_CLK] = &gcc_gephy_rx_clk.clkr,
+	[GCC_GEPHY_TX_CLK] = &gcc_gephy_tx_clk.clkr,
+	[GCC_GMAC0_CFG_CLK] = &gcc_gmac0_cfg_clk.clkr,
+	[GCC_GMAC0_PTP_CLK] = &gcc_gmac0_ptp_clk.clkr,
+	[GCC_GMAC0_RX_CLK] = &gcc_gmac0_rx_clk.clkr,
+	[GCC_GMAC0_SYS_CLK] = &gcc_gmac0_sys_clk.clkr,
+	[GCC_GMAC0_TX_CLK] = &gcc_gmac0_tx_clk.clkr,
+	[GCC_GMAC1_CFG_CLK] = &gcc_gmac1_cfg_clk.clkr,
+	[GCC_GMAC1_PTP_CLK] = &gcc_gmac1_ptp_clk.clkr,
+	[GCC_GMAC1_RX_CLK] = &gcc_gmac1_rx_clk.clkr,
+	[GCC_GMAC1_SYS_CLK] = &gcc_gmac1_sys_clk.clkr,
+	[GCC_GMAC1_TX_CLK] = &gcc_gmac1_tx_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_LPASS_CORE_AXIM_CLK] = &gcc_lpass_core_axim_clk.clkr,
+	[GCC_LPASS_SWAY_CLK] = &gcc_lpass_sway_clk.clkr,
+	[GCC_MDIO0_AHB_CLK] = &gcc_mdio0_ahb_clk.clkr,
+	[GCC_MDIO1_AHB_CLK] = &gcc_mdio1_ahb_clk.clkr,
+	[GCC_PCIE0_AHB_CLK] = &gcc_pcie0_ahb_clk.clkr,
+	[GCC_PCIE0_AUX_CLK] = &gcc_pcie0_aux_clk.clkr,
+	[GCC_PCIE0_AXI_M_CLK] = &gcc_pcie0_axi_m_clk.clkr,
+	[GCC_PCIE0_AXI_S_BRIDGE_CLK] = &gcc_pcie0_axi_s_bridge_clk.clkr,
+	[GCC_PCIE0_AXI_S_CLK] = &gcc_pcie0_axi_s_clk.clkr,
+	[GCC_PCIE1_AHB_CLK] = &gcc_pcie1_ahb_clk.clkr,
+	[GCC_PCIE1_AUX_CLK] = &gcc_pcie1_aux_clk.clkr,
+	[GCC_PCIE1_AXI_M_CLK] = &gcc_pcie1_axi_m_clk.clkr,
+	[GCC_PCIE1_AXI_S_BRIDGE_CLK] = &gcc_pcie1_axi_s_bridge_clk.clkr,
+	[GCC_PCIE1_AXI_S_CLK] = &gcc_pcie1_axi_s_clk.clkr,
+	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_Q6_AXIM_CLK] = &gcc_q6_axim_clk.clkr,
+	[GCC_Q6_AXIM2_CLK] = &gcc_q6_axim2_clk.clkr,
+	[GCC_Q6_AXIS_CLK] = &gcc_q6_axis_clk.clkr,
+	[GCC_Q6_AHB_CLK] = &gcc_q6_ahb_clk.clkr,
+	[GCC_Q6_AHB_S_CLK] = &gcc_q6_ahb_s_clk.clkr,
+	[GCC_Q6_TSCTR_1TO2_CLK] = &gcc_q6_tsctr_1to2_clk.clkr,
+	[GCC_Q6SS_ATBM_CLK] = &gcc_q6ss_atbm_clk.clkr,
+	[GCC_Q6SS_PCLKDBG_CLK] = &gcc_q6ss_pclkdbg_clk.clkr,
+	[GCC_Q6SS_TRIG_CLK] = &gcc_q6ss_trig_clk.clkr,
+	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
+	[GCC_QDSS_CFG_AHB_CLK] = &gcc_qdss_cfg_ahb_clk.clkr,
+	[GCC_QDSS_DAP_AHB_CLK] = &gcc_qdss_dap_ahb_clk.clkr,
+	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
+	[GCC_QDSS_ETR_USB_CLK] = &gcc_qdss_etr_usb_clk.clkr,
+	[GCC_QDSS_EUD_AT_CLK] = &gcc_qdss_eud_at_clk.clkr,
+	[GCC_QDSS_STM_CLK] = &gcc_qdss_stm_clk.clkr,
+	[GCC_QDSS_TRACECLKIN_CLK] = &gcc_qdss_traceclkin_clk.clkr,
+	[GCC_QDSS_TSCTR_DIV8_CLK] = &gcc_qdss_tsctr_div8_clk.clkr,
+	[GCC_QPIC_AHB_CLK] = &gcc_qpic_ahb_clk.clkr,
+	[GCC_QPIC_CLK] = &gcc_qpic_clk.clkr,
+	[GCC_QPIC_IO_MACRO_CLK] = &gcc_qpic_io_macro_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
+	[GCC_SNOC_GMAC0_AHB_CLK] = &gcc_snoc_gmac0_ahb_clk.clkr,
+	[GCC_SNOC_GMAC0_AXI_CLK] = &gcc_snoc_gmac0_axi_clk.clkr,
+	[GCC_SNOC_GMAC1_AHB_CLK] = &gcc_snoc_gmac1_ahb_clk.clkr,
+	[GCC_SNOC_GMAC1_AXI_CLK] = &gcc_snoc_gmac1_axi_clk.clkr,
+	[GCC_SNOC_LPASS_AXIM_CLK] = &gcc_snoc_lpass_axim_clk.clkr,
+	[GCC_SNOC_LPASS_SWAY_CLK] = &gcc_snoc_lpass_sway_clk.clkr,
+	[GCC_SNOC_UBI0_AXI_CLK] = &gcc_snoc_ubi0_axi_clk.clkr,
+	[GCC_SYS_NOC_PCIE0_AXI_CLK] = &gcc_sys_noc_pcie0_axi_clk.clkr,
+	[GCC_SYS_NOC_PCIE1_AXI_CLK] = &gcc_sys_noc_pcie1_axi_clk.clkr,
+	[GCC_SYS_NOC_QDSS_STM_AXI_CLK] = &gcc_sys_noc_qdss_stm_axi_clk.clkr,
+	[GCC_SYS_NOC_USB0_AXI_CLK] = &gcc_sys_noc_usb0_axi_clk.clkr,
+	[GCC_SYS_NOC_WCSS_AHB_CLK] = &gcc_sys_noc_wcss_ahb_clk.clkr,
+	[GCC_UBI0_AXI_CLK] = &gcc_ubi0_axi_clk.clkr,
+	[GCC_UBI0_CFG_CLK] = &gcc_ubi0_cfg_clk.clkr,
+	[GCC_UBI0_CORE_CLK] = &gcc_ubi0_core_clk.clkr,
+	[GCC_UBI0_DBG_CLK] = &gcc_ubi0_dbg_clk.clkr,
+	[GCC_UBI0_NC_AXI_CLK] = &gcc_ubi0_nc_axi_clk.clkr,
+	[GCC_UBI0_UTCM_CLK] = &gcc_ubi0_utcm_clk.clkr,
+	[GCC_UNIPHY_AHB_CLK] = &gcc_uniphy_ahb_clk.clkr,
+	[GCC_UNIPHY_RX_CLK] = &gcc_uniphy_rx_clk.clkr,
+	[GCC_UNIPHY_SYS_CLK] = &gcc_uniphy_sys_clk.clkr,
+	[GCC_UNIPHY_TX_CLK] = &gcc_uniphy_tx_clk.clkr,
+	[GCC_USB0_AUX_CLK] = &gcc_usb0_aux_clk.clkr,
+	[GCC_USB0_EUD_AT_CLK] = &gcc_usb0_eud_at_clk.clkr,
+	[GCC_USB0_LFPS_CLK] = &gcc_usb0_lfps_clk.clkr,
+	[GCC_USB0_MASTER_CLK] = &gcc_usb0_master_clk.clkr,
+	[GCC_USB0_MOCK_UTMI_CLK] = &gcc_usb0_mock_utmi_clk.clkr,
+	[GCC_USB0_PHY_CFG_AHB_CLK] = &gcc_usb0_phy_cfg_ahb_clk.clkr,
+	[GCC_USB0_SLEEP_CLK] = &gcc_usb0_sleep_clk.clkr,
+	[GCC_WCSS_ACMT_CLK] = &gcc_wcss_acmt_clk.clkr,
+	[GCC_WCSS_AHB_S_CLK] = &gcc_wcss_ahb_s_clk.clkr,
+	[GCC_WCSS_AXI_M_CLK] = &gcc_wcss_axi_m_clk.clkr,
+	[GCC_WCSS_AXI_S_CLK] = &gcc_wcss_axi_s_clk.clkr,
+	[GCC_WCSS_DBG_IFC_APB_BDG_CLK] = &gcc_wcss_dbg_ifc_apb_bdg_clk.clkr,
+	[GCC_WCSS_DBG_IFC_APB_CLK] = &gcc_wcss_dbg_ifc_apb_clk.clkr,
+	[GCC_WCSS_DBG_IFC_ATB_BDG_CLK] = &gcc_wcss_dbg_ifc_atb_bdg_clk.clkr,
+	[GCC_WCSS_DBG_IFC_ATB_CLK] = &gcc_wcss_dbg_ifc_atb_clk.clkr,
+	[GCC_WCSS_DBG_IFC_DAPBUS_BDG_CLK] = &gcc_wcss_dbg_ifc_dapbus_bdg_clk.clkr,
+	[GCC_WCSS_DBG_IFC_DAPBUS_CLK] = &gcc_wcss_dbg_ifc_dapbus_clk.clkr,
+	[GCC_WCSS_DBG_IFC_NTS_BDG_CLK] = &gcc_wcss_dbg_ifc_nts_bdg_clk.clkr,
+	[GCC_WCSS_DBG_IFC_NTS_CLK] = &gcc_wcss_dbg_ifc_nts_clk.clkr,
+	[GCC_WCSS_ECAHB_CLK] = &gcc_wcss_ecahb_clk.clkr,
+	[GCC_XO_CLK] = &gcc_xo_clk.clkr,
+	[GCC_XO_CLK_SRC] = &gcc_xo_clk_src.clkr,
+	[GMAC0_RX_CLK_SRC] = &gmac0_rx_clk_src.clkr,
+	[GMAC0_RX_DIV_CLK_SRC] = &gmac0_rx_div_clk_src.clkr,
+	[GMAC0_TX_CLK_SRC] = &gmac0_tx_clk_src.clkr,
+	[GMAC0_TX_DIV_CLK_SRC] = &gmac0_tx_div_clk_src.clkr,
+	[GMAC1_RX_CLK_SRC] = &gmac1_rx_clk_src.clkr,
+	[GMAC1_RX_DIV_CLK_SRC] = &gmac1_rx_div_clk_src.clkr,
+	[GMAC1_TX_CLK_SRC] = &gmac1_tx_clk_src.clkr,
+	[GMAC1_TX_DIV_CLK_SRC] = &gmac1_tx_div_clk_src.clkr,
+	[GMAC_CLK_SRC] = &gmac_clk_src.clkr,
+	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
+	[GP2_CLK_SRC] = &gp2_clk_src.clkr,
+	[GP3_CLK_SRC] = &gp3_clk_src.clkr,
+	[LPASS_AXIM_CLK_SRC] = &lpass_axim_clk_src.clkr,
+	[LPASS_SWAY_CLK_SRC] = &lpass_sway_clk_src.clkr,
+	[PCIE0_AUX_CLK_SRC] = &pcie0_aux_clk_src.clkr,
+	[PCIE0_AXI_CLK_SRC] = &pcie0_axi_clk_src.clkr,
+	[PCIE1_AUX_CLK_SRC] = &pcie1_aux_clk_src.clkr,
+	[PCIE1_AXI_CLK_SRC] = &pcie1_axi_clk_src.clkr,
+	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
+	[Q6_AXI_CLK_SRC] = &q6_axi_clk_src.clkr,
+	[QDSS_AT_CLK_SRC] = &qdss_at_clk_src.clkr,
+	[QDSS_STM_CLK_SRC] = &qdss_stm_clk_src.clkr,
+	[QDSS_TSCTR_CLK_SRC] = &qdss_tsctr_clk_src.clkr,
+	[QDSS_TRACECLKIN_CLK_SRC] = &qdss_traceclkin_clk_src.clkr,
+	[QPIC_IO_MACRO_CLK_SRC] = &qpic_io_macro_clk_src.clkr,
+	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
+	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
+	[UBI0_AXI_CLK_SRC] = &ubi0_axi_clk_src.clkr,
+	[UBI0_CORE_CLK_SRC] = &ubi0_core_clk_src.clkr,
+	[USB0_AUX_CLK_SRC] = &usb0_aux_clk_src.clkr,
+	[USB0_LFPS_CLK_SRC] = &usb0_lfps_clk_src.clkr,
+	[USB0_MASTER_CLK_SRC] = &usb0_master_clk_src.clkr,
+	[USB0_MOCK_UTMI_CLK_SRC] = &usb0_mock_utmi_clk_src.clkr,
+	[WCSS_AHB_CLK_SRC] = &wcss_ahb_clk_src.clkr,
+	[PCIE0_PIPE_CLK_SRC] = &pcie0_pipe_clk_src.clkr,
+	[PCIE1_PIPE_CLK_SRC] = &pcie1_pipe_clk_src.clkr,
+	[GCC_PCIE0_PIPE_CLK] = &gcc_pcie0_pipe_clk.clkr,
+	[GCC_PCIE1_PIPE_CLK] = &gcc_pcie1_pipe_clk.clkr,
+	[USB0_PIPE_CLK_SRC] = &usb0_pipe_clk_src.clkr,
+	[GCC_USB0_PIPE_CLK] = &gcc_usb0_pipe_clk.clkr,
+};
+
+static const struct qcom_reset_map gcc_ipq5018_resets[] = {
+	[GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR] = { 0x78000, 0 },
+	[GCC_BLSP1_BCR] = { 0x01000, 0 },
+	[GCC_BLSP1_QUP1_BCR] = { 0x02000, 0 },
+	[GCC_BLSP1_QUP2_BCR] = { 0x03008, 0 },
+	[GCC_BLSP1_QUP3_BCR] = { 0x04008, 0 },
+	[GCC_BLSP1_UART1_BCR] = { 0x02038, 0 },
+	[GCC_BLSP1_UART2_BCR] = { 0x03028, 0 },
+	[GCC_BOOT_ROM_BCR] = { 0x13008, 0 },
+	[GCC_BTSS_BCR] = { 0x1c000, 0 },
+	[GCC_CMN_BLK_BCR] = { 0x56300, 0 },
+	[GCC_CMN_LDO_BCR] = { 0x33000, 0 },
+	[GCC_CE_BCR] = { 0x33014, 0 },
+	[GCC_CRYPTO_BCR] = { 0x16000, 0 },
+	[GCC_DCC_BCR] = { 0x77000, 0 },
+	[GCC_DCD_BCR] = { 0x2a000, 0 },
+	[GCC_DDRSS_BCR] = { 0x1e000, 0 },
+	[GCC_EDPD_BCR] = { 0x3a000, 0 },
+	[GCC_GEPHY_BCR] = { 0x56000, 0 },
+	[GCC_GEPHY_MDC_SW_ARES] = { 0x56004, 0 },
+	[GCC_GEPHY_DSP_HW_ARES] = { 0x56004, 1 },
+	[GCC_GEPHY_RX_ARES] = { 0x56004, 2 },
+	[GCC_GEPHY_TX_ARES] = { 0x56004, 3 },
+	[GCC_GMAC0_BCR] = { 0x19000, 0 },
+	[GCC_GMAC0_CFG_ARES] = { 0x68428, 0 },
+	[GCC_GMAC0_SYS_ARES] = { 0x68428, 1 },
+	[GCC_GMAC1_BCR] = { 0x19100, 0 },
+	[GCC_GMAC1_CFG_ARES] = { 0x68438, 0 },
+	[GCC_GMAC1_SYS_ARES] = { 0x68438, 1 },
+	[GCC_IMEM_BCR] = { 0x0e000, 0 },
+	[GCC_LPASS_BCR] = { 0x2e000, 0 },
+	[GCC_MDIO0_BCR] = { 0x58000, 0 },
+	[GCC_MDIO1_BCR] = { 0x58010, 0 },
+	[GCC_MPM_BCR] = { 0x2c000, 0 },
+	[GCC_PCIE0_BCR] = { 0x75004, 0 },
+	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x750a8, 0 },
+	[GCC_PCIE0_PHY_BCR] = { 0x75038, 0 },
+	[GCC_PCIE0PHY_PHY_BCR] = { 0x7503c, 0 },
+	[GCC_PCIE0_PIPE_ARES] = { 0x75040, 0 },
+	[GCC_PCIE0_SLEEP_ARES] = { 0x75040, 1 },
+	[GCC_PCIE0_CORE_STICKY_ARES] = { 0x75040, 2 },
+	[GCC_PCIE0_AXI_MASTER_ARES] = { 0x75040, 3 },
+	[GCC_PCIE0_AXI_SLAVE_ARES] = { 0x75040, 4 },
+	[GCC_PCIE0_AHB_ARES] = { 0x75040, 5 },
+	[GCC_PCIE0_AXI_MASTER_STICKY_ARES] = { 0x75040, 6 },
+	[GCC_PCIE0_AXI_SLAVE_STICKY_ARES] = { 0x75040, 7 },
+	[GCC_PCIE1_BCR] = { 0x76004, 0 },
+	[GCC_PCIE1_LINK_DOWN_BCR] = { 0x76044, 0 },
+	[GCC_PCIE1_PHY_BCR] = { 0x76038, 0 },
+	[GCC_PCIE1PHY_PHY_BCR] = { 0x7603c, 0 },
+	[GCC_PCIE1_PIPE_ARES] = { 0x76040, 0 },
+	[GCC_PCIE1_SLEEP_ARES] = { 0x76040, 1 },
+	[GCC_PCIE1_CORE_STICKY_ARES] = { 0x76040, 2 },
+	[GCC_PCIE1_AXI_MASTER_ARES] = { 0x76040, 3 },
+	[GCC_PCIE1_AXI_SLAVE_ARES] = { 0x76040, 4 },
+	[GCC_PCIE1_AHB_ARES] = { 0x76040, 5 },
+	[GCC_PCIE1_AXI_MASTER_STICKY_ARES] = { 0x76040, 6 },
+	[GCC_PCIE1_AXI_SLAVE_STICKY_ARES] = { 0x76040, 7 },
+	[GCC_PCNOC_BCR] = { 0x27018, 0 },
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
+	[GCC_PCNOC_BUS_TIMEOUT10_BCR] = { 0x48050, 0 },
+	[GCC_PCNOC_BUS_TIMEOUT11_BCR] = { 0x48058, 0 },
+	[GCC_PRNG_BCR] = { 0x13000, 0 },
+	[GCC_Q6SS_DBG_ARES] = { 0x59110, 0 },
+	[GCC_Q6_AHB_S_ARES] = { 0x59110, 1 },
+	[GCC_Q6_AHB_ARES] = { 0x59110, 2 },
+	[GCC_Q6_AXIM2_ARES] = { 0x59110, 3 },
+	[GCC_Q6_AXIM_ARES] = { 0x59110, 4 },
+	[GCC_Q6_AXIS_ARES] = { 0x59158, 0 },
+	[GCC_QDSS_BCR] = { 0x29000, 0 },
+	[GCC_QPIC_BCR] = { 0x57018, 0 },
+	[GCC_QUSB2_0_PHY_BCR] = { 0x41030, 0 },
+	[GCC_SDCC1_BCR] = { 0x42000, 0 },
+	[GCC_SEC_CTRL_BCR] = { 0x1a000, 0 },
+	[GCC_SPDM_BCR] = { 0x2f000, 0 },
+	[GCC_SYSTEM_NOC_BCR] = { 0x26000, 0 },
+	[GCC_TCSR_BCR] = { 0x28000, 0 },
+	[GCC_TLMM_BCR] = { 0x34000, 0 },
+	[GCC_UBI0_AXI_ARES] = { 0x68010, 0 },
+	[GCC_UBI0_AHB_ARES] = { 0x68010, 1 },
+	[GCC_UBI0_NC_AXI_ARES] = { 0x68010, 2 },
+	[GCC_UBI0_DBG_ARES] = { 0x68010, 3 },
+	[GCC_UBI0_UTCM_ARES] = { 0x68010, 6 },
+	[GCC_UBI0_CORE_ARES] = { 0x68010, 7 },
+	[GCC_UBI32_BCR] = { 0x19064, 0 },
+	[GCC_UNIPHY_BCR] = { 0x56100, 0 },
+	[GCC_UNIPHY_AHB_ARES] = { 0x56104, 0 },
+	[GCC_UNIPHY_SYS_ARES] = { 0x56104, 1 },
+	[GCC_UNIPHY_RX_ARES] = { 0x56104, 4 },
+	[GCC_UNIPHY_TX_ARES] = { 0x56104, 5 },
+	[GCC_UNIPHY_SOFT_RESET] = {0x56104, 0 },
+	[GCC_USB0_BCR] = { 0x3e070, 0 },
+	[GCC_USB0_PHY_BCR] = { 0x3e034, 0 },
+	[GCC_WCSS_BCR] = { 0x18000, 0 },
+	[GCC_WCSS_DBG_ARES] = { 0x59008, 0 },
+	[GCC_WCSS_ECAHB_ARES] = { 0x59008, 1 },
+	[GCC_WCSS_ACMT_ARES] = { 0x59008, 2 },
+	[GCC_WCSS_DBG_BDG_ARES] = { 0x59008, 3 },
+	[GCC_WCSS_AHB_S_ARES] = { 0x59008, 4 },
+	[GCC_WCSS_AXI_M_ARES] = { 0x59008, 5 },
+	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
+	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
+	[GCC_WCSSAON_RESET] = { 0x59010, 0},
+	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
+};
+
+static const struct of_device_id gcc_ipq5018_match_table[] = {
+	{ .compatible = "qcom,gcc-ipq5018" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_ipq5018_match_table);
+
+static const struct regmap_config gcc_ipq5018_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register   = 0x7fffc,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_ipq5018_desc = {
+	.config = &gcc_ipq5018_regmap_config,
+	.clks = gcc_ipq5018_clks,
+	.num_clks = ARRAY_SIZE(gcc_ipq5018_clks),
+	.resets = gcc_ipq5018_resets,
+	.num_resets = ARRAY_SIZE(gcc_ipq5018_resets),
+};
+
+static int gcc_ipq5018_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	struct regmap *regmap;
+	struct clk *clk;
+	struct qcom_cc_desc ipq5018_desc = gcc_ipq5018_desc;
+
+	regmap = qcom_cc_map(pdev, &ipq5018_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	for (i = 0; i < ARRAY_SIZE(gcc_ipq5018_hws); i++) {
+		clk = devm_clk_register(&pdev->dev, gcc_ipq5018_hws[i]);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+	}
+	/*Gen2 PHY*/
+	clk_register_fixed_rate(&pdev->dev, "pcie20_phy0_pipe_clk", NULL,
+					CLK_IS_ROOT, 125000000);
+	clk_register_fixed_rate(&pdev->dev, "pcie20_phy1_pipe_clk", NULL,
+					CLK_IS_ROOT, 125000000);
+
+	clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
+
+	ret = qcom_cc_really_probe(pdev, &ipq5018_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register ipq5018 GCC clocks\n");
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "Registered ipq5018 GCC clocks provider");
+
+	return ret;
+}
+
+static int gcc_ipq5018_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver gcc_ipq5018_driver = {
+	.probe = gcc_ipq5018_probe,
+	.remove = gcc_ipq5018_remove,
+	.driver = {
+		.name   = "qcom,gcc-ipq5018",
+		.owner  = THIS_MODULE,
+		.of_match_table = gcc_ipq5018_match_table,
+	},
+};
+
+static int __init gcc_ipq5018_init(void)
+{
+	return platform_driver_register(&gcc_ipq5018_driver);
+}
+core_initcall(gcc_ipq5018_init);
+
+static void __exit gcc_ipq5018_exit(void)
+{
+	platform_driver_unregister(&gcc_ipq5018_driver);
+}
+module_exit(gcc_ipq5018_exit);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. GCC IPQ5018 Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:gcc-ipq5018");
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 03a5de5..31fde45 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -20,8 +20,8 @@
 #define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
 #define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
 #define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
-				/* unused */
-				/* unused */
+#define CLK_IS_ROOT		BIT(4) /* root clk, has no parent */
+#define CLK_IS_BASIC		BIT(5) /* Basic clk, can't do a to_clk_foo() */
 #define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
 #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
 #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
-- 
2.7.4

