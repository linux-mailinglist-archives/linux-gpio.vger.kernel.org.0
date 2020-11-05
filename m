Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595A52A7E03
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbgKEMFD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:05:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730375AbgKEMEX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 07:04:23 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C6DC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 04:04:22 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id d142so1335159wmd.4
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 04:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yv4SZqbcCRpsnHuqM1vAYRLM7HFQfMIiZAAZZ6enUhQ=;
        b=bbXrjhXDchtMpjBB45NuYxEC9hRG/RHAI9/w30Z+5bmOPN04rTsQjzLPpqnLrYb13i
         eREvpolbpgUXuBxL1WgJzxBDp+1Dzh4XgCFn+1wtTbEoGCEtJAPPom0Kc3m11lES4mkA
         5+GrBN6KT69SASYqm8qjCJZj+DPDBJHfJNhDehE4IB8vgJUfjaN1EcaLXxXGgc1qogGg
         jWIjZB27mDDCnUxN3jsHMt/GCd90W4hcbJDcf7Qc+M8SweowKChfphKEWkOvKhiKj/FR
         bXmJeFvPjMyqWqCJPkHGZfJ7DPIw9hgwXm5F/9J3+jklCB59N0EimnrsxZQdcTdMSYlm
         d9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yv4SZqbcCRpsnHuqM1vAYRLM7HFQfMIiZAAZZ6enUhQ=;
        b=HJfVL7XO7ey1Wlzmun6S5/9akl4r4N5ZSEIiEBEKDP3osCj0bvpQnv4mYZkyWz1h1f
         xThBsedQXIiGZ11ou4FxfaN9SjxYkIa9Rj6YQS372XuFGNmAvqkeSer8/wGoH10EwMFC
         96M2miy6wjCoHe/v5p7/SAxbsY72yvfCW/pXfIhvVkbOvA84jP4YzoUR4y4xkRD2Byqy
         uiE8+GYG9Gess8NG9c+bGMQLmL8qPkjsGNOQ2z4nAprfcNIeZMWEn1t+0zEisaxHXHsv
         IpaRgx25Pespy6gEnYuDoPHpz2uj9Mq0O4+8fAiPgKR9Iqa8GjK66RMURGcqATQjK/wt
         5PbQ==
X-Gm-Message-State: AOAM530mssVN9Go19/Atn+Xg/C8CgE5KhRcmbIb25wMKdV4XqFYHuIfx
        hAzXhCgxdCboJ0IhsTZYj4BUPQ==
X-Google-Smtp-Source: ABdhPJzrzVtS/pi1l4Af25IKI1U/PiZYz/J5Na5Vjeu9+mc0+vCO3pQ03VzRSIuvyiuZASkvCiXCsA==
X-Received: by 2002:a1c:e482:: with SMTP id b124mr2491288wmh.25.1604577861077;
        Thu, 05 Nov 2020 04:04:21 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id f4sm2363094wrq.54.2020.11.05.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 04:04:20 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
Date:   Thu,  5 Nov 2020 12:04:09 +0000
Message-Id: <20201105120410.18305-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201105120410.18305-1-srinivas.kandagatla@linaro.org>
References: <20201105120410.18305-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial pinctrl driver to support pin configuration for
LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
on SM8250.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig             |   8 +
 drivers/pinctrl/qcom/Makefile            |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 781 +++++++++++++++++++++++
 3 files changed, 790 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 5fe7b8aaf69d..af26f4c51f77 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -236,4 +236,12 @@ config PINCTRL_SM8250
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
 	  Technologies Inc SM8250 platform.
 
+config PINCTRL_LPASS_LPI
+	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
+	depends on GPIOLIB && OF
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
+
 endif
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 9e3d9c91a444..c8520155fb1b 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
 obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
+obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
new file mode 100644
index 000000000000..3b30c4397773
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -0,0 +1,781 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020 Linaro Ltd.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/gpio.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include "../core.h"
+#include "../pinctrl-utils.h"
+
+#define LPI_GPIO_REG_VAL_CTL             0x00
+#define LPI_GPIO_REG_DIR_CTL             0x04
+#define LPI_SLEW_REG_VAL_CTL             0x00
+#define LPI_SLEW_RATE_MAX                0x03
+#define LPI_SLEW_BITS_SIZE               0x02
+#define LPI_GPIO_REG_PULL_SHIFT		0x0
+#define LPI_GPIO_REG_PULL_MASK		GENMASK(1, 0)
+#define LPI_GPIO_REG_FUNCTION_SHIFT	0x2
+#define LPI_GPIO_REG_FUNCTION_MASK	GENMASK(5, 2)
+#define LPI_GPIO_REG_OUT_STRENGTH_SHIFT	0x6
+#define LPI_GPIO_REG_OUT_STRENGTH_MASK	GENMASK(8, 6)
+#define LPI_GPIO_REG_OE_SHIFT		0x9
+#define LPI_GPIO_REG_OE_MASK		BIT(9)
+#define LPI_GPIO_REG_DIR_SHIFT		0x1
+#define LPI_GPIO_REG_DIR_MASK		0x2
+#define LPI_GPIO_BIAS_DISABLE		0x0
+#define LPI_GPIO_PULL_DOWN		0x1
+#define LPI_GPIO_KEEPER			0x2
+#define LPI_GPIO_PULL_UP		0x3
+
+#define LPI_FUNCTION(fname)			                \
+	[LPI_MUX_##fname] = {		                \
+		.name = #fname,				\
+		.groups = fname##_groups,               \
+		.ngroups = ARRAY_SIZE(fname##_groups),	\
+	}
+
+#define LPI_PINGROUP(id, f1, f2, f3, f4)			\
+	{						\
+		.name = "gpio" #id,			\
+		.pins = gpio##id##_pins,		\
+		.pin = id,				\
+		.npins = ARRAY_SIZE(gpio##id##_pins),	\
+		.funcs = (int[]){			\
+			LPI_MUX_gpio,			\
+			LPI_MUX_##f1,			\
+			LPI_MUX_##f2,			\
+			LPI_MUX_##f3,			\
+			LPI_MUX_##f4,			\
+		},					\
+		.nfuncs = 5,				\
+	}
+struct lpi_pingroup {
+	const char *name;
+	const unsigned int *pins;
+	unsigned int npins;
+	unsigned int pin;
+	unsigned int *funcs;
+	unsigned int nfuncs;
+};
+
+struct lpi_function {
+	const char *name;
+	const char * const *groups;
+	unsigned int ngroups;
+};
+
+struct lpi_pinctrl_variant_data {
+	int tlmm_reg_offset;
+	const struct pinctrl_pin_desc *pins;
+	int npins;
+	const struct lpi_pingroup *groups;
+	int ngroups;
+	const struct lpi_function *functions;
+	int nfunctions;
+	int *slew_reg_pin_offsets;
+};
+
+struct lpi_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *ctrl;
+	struct gpio_chip chip;
+	struct pinctrl_desc desc;
+	char __iomem *tlmm_base;
+	char __iomem *slew_base;
+	struct clk *core_vote;
+	struct clk *audio_vote;
+	struct mutex slew_access_lock;
+	const struct lpi_pinctrl_variant_data *data;
+};
+
+/* sm8250 variant specific data */
+#define SM8250_LPASS_PINS	14
+
+static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+};
+
+enum sm8250_lpi_functions {
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_qua_mi2s_sclk,
+	LPI_MUX_swr_tx_data1,
+	LPI_MUX_qua_mi2s_ws,
+	LPI_MUX_swr_tx_data2,
+	LPI_MUX_qua_mi2s_data0,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_qua_mi2s_data1,
+	LPI_MUX_swr_rx_data1,
+	LPI_MUX_qua_mi2s_data2,
+	LPI_MUX_swr_tx_data3,
+	LPI_MUX_swr_rx_data2,
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_i2s1_data0,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_i2s1_data1,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_wsa_swr_clk,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_wsa_swr_data,
+	LPI_MUX_dmic3_clk,
+	LPI_MUX_i2s2_data0,
+	LPI_MUX_dmic3_data,
+	LPI_MUX_i2s2_data1,
+	LPI_MUX_gpio,
+	LPI_MUX_NA,
+};
+
+static const unsigned int gpio0_pins[] = { 0 };
+static const unsigned int gpio1_pins[] = { 1 };
+static const unsigned int gpio2_pins[] = { 2 };
+static const unsigned int gpio3_pins[] = { 3 };
+static const unsigned int gpio4_pins[] = { 4 };
+static const unsigned int gpio5_pins[] = { 5 };
+static const unsigned int gpio6_pins[] = { 6 };
+static const unsigned int gpio7_pins[] = { 7 };
+static const unsigned int gpio8_pins[] = { 8 };
+static const unsigned int gpio9_pins[] = { 9 };
+static const unsigned int gpio10_pins[] = { 10 };
+static const unsigned int gpio11_pins[] = { 11 };
+static const unsigned int gpio12_pins[] = { 12 };
+static const unsigned int gpio13_pins[] = { 13 };
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data1_groups[] = { "gpio1" };
+static const char * const swr_tx_data2_groups[] = { "gpio2" };
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const swr_rx_data1_groups[] = { "gpio4" };
+static const char * const swr_tx_data3_groups[] = { "gpio5" };
+static const char * const dmic1_clk_groups[] = { "gpio6" };
+static const char * const dmic1_data_groups[] = { "gpio7" };
+static const char * const dmic2_clk_groups[] = { "gpio8" };
+static const char * const dmic2_data_groups[] = { "gpio9" };
+static const char * const i2s2_clk_groups[] = { "gpio10" };
+static const char * const i2s2_ws_groups[] = { "gpio11" };
+static const char * const dmic3_clk_groups[] = { "gpio12" };
+static const char * const dmic3_data_groups[] = { "gpio13" };
+static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
+static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
+static const char * const qua_mi2s_data0_groups[] = { "gpio2" };
+static const char * const qua_mi2s_data1_groups[] = { "gpio3" };
+static const char * const qua_mi2s_data2_groups[] = { "gpio4" };
+static const char * const swr_rx_data2_groups[] = { "gpio5" };
+static const char * const i2s1_clk_groups[] = { "gpio6" };
+static const char * const i2s1_ws_groups[] = { "gpio7" };
+static const char * const i2s1_data0_groups[] = { "gpio8" };
+static const char * const i2s1_data1_groups[] = { "gpio9" };
+static const char * const wsa_swr_clk_groups[] = { "gpio10" };
+static const char * const wsa_swr_data_groups[] = { "gpio11" };
+static const char * const i2s2_data0_groups[] = { "gpio12" };
+static const char * const i2s2_data1_groups[] = { "gpio13" };
+
+static const struct lpi_pingroup sm8250_groups[] = {
+	LPI_PINGROUP(0, swr_tx_clk, qua_mi2s_sclk, NA, NA),
+	LPI_PINGROUP(1, swr_tx_data1, qua_mi2s_ws, NA, NA),
+	LPI_PINGROUP(2, swr_tx_data2, qua_mi2s_data0, NA, NA),
+	LPI_PINGROUP(3, swr_rx_clk, qua_mi2s_data1, NA, NA),
+	LPI_PINGROUP(4, swr_rx_data1, qua_mi2s_data2, NA, NA),
+	LPI_PINGROUP(5, swr_tx_data3, swr_rx_data2, NA, NA),
+	LPI_PINGROUP(6, dmic1_clk, i2s1_clk, NA,  NA),
+	LPI_PINGROUP(7, dmic1_data, i2s1_ws, NA, NA),
+	LPI_PINGROUP(8, dmic2_clk, i2s1_data0, NA, NA),
+	LPI_PINGROUP(9, dmic2_data, i2s1_data1, NA, NA),
+	LPI_PINGROUP(10, i2s2_clk, wsa_swr_clk, NA, NA),
+	LPI_PINGROUP(11, i2s2_ws, wsa_swr_data, NA, NA),
+	LPI_PINGROUP(12, dmic3_clk, i2s2_data0, NA, NA),
+	LPI_PINGROUP(13, dmic3_data, i2s2_data1, NA, NA),
+};
+
+static const struct lpi_function sm8250_functions[] = {
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(qua_mi2s_sclk),
+	LPI_FUNCTION(swr_tx_data1),
+	LPI_FUNCTION(qua_mi2s_ws),
+	LPI_FUNCTION(swr_tx_data2),
+	LPI_FUNCTION(qua_mi2s_data0),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(qua_mi2s_data1),
+	LPI_FUNCTION(swr_rx_data1),
+	LPI_FUNCTION(qua_mi2s_data2),
+	LPI_FUNCTION(swr_tx_data3),
+	LPI_FUNCTION(swr_rx_data2),
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(i2s1_data0),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(i2s1_data1),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(wsa_swr_clk),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(dmic3_clk),
+	LPI_FUNCTION(i2s2_data0),
+	LPI_FUNCTION(dmic3_data),
+	LPI_FUNCTION(i2s2_data1),
+};
+
+static int sm8250_slew_reg_offsets[] = {
+		0x0, 0x2, 0x4, 0x8, 0xa,
+		0xc, 0x0, 0x0, 0x0, 0x0,
+		0x10, 0x12, 0x0, 0x0,
+};
+
+static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
+	.tlmm_reg_offset = 0x1000,
+	.pins = sm8250_lpi_pins,
+	.npins = ARRAY_SIZE(sm8250_lpi_pins),
+	.slew_reg_pin_offsets = sm8250_slew_reg_offsets,
+	.groups = sm8250_groups,
+	.ngroups = ARRAY_SIZE(sm8250_groups),
+	.functions = sm8250_functions,
+	.nfunctions = ARRAY_SIZE(sm8250_functions),
+};
+
+static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
+			 unsigned int addr)
+{
+	return ioread32(state->tlmm_base +
+			state->data->tlmm_reg_offset * pin + addr);
+}
+
+static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
+			  unsigned int addr, unsigned int val)
+{
+	iowrite32(val, state->tlmm_base +
+		  state->data->tlmm_reg_offset * pin + addr);
+
+	return 0;
+}
+
+static int lpi_gpio_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->ngroups;
+}
+
+static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
+					   unsigned int group)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->groups[group].name;
+}
+
+static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
+				   unsigned int group,
+				   const unsigned int **pins,
+				   unsigned int *num_pins)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = pctrl->data->groups[group].pins;
+	*num_pins = pctrl->data->groups[group].npins;
+
+	return 0;
+}
+
+static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
+	.get_groups_count	= lpi_gpio_get_groups_count,
+	.get_group_name		= lpi_gpio_get_group_name,
+	.get_group_pins		= lpi_gpio_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+static int lpi_gpio_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->nfunctions;
+}
+
+static const char *lpi_gpio_get_function_name(struct pinctrl_dev *pctldev,
+					      unsigned int function)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->functions[function].name;
+}
+
+static int lpi_gpio_get_function_groups(struct pinctrl_dev *pctldev,
+					unsigned int function,
+					const char *const **groups,
+					unsigned *const num_qgroups)
+{
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pctrl->data->functions[function].groups;
+	*num_qgroups = pctrl->data->functions[function].ngroups;
+
+	return 0;
+}
+
+static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
+			    unsigned int group_num)
+{
+	const struct lpi_pingroup *g = &sm8250_groups[group_num];
+	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int val;
+	int i, pin = g->pin;
+
+	for (i = 0; i < g->nfuncs; i++) {
+		if (g->funcs[i] == function)
+			break;
+	}
+
+	if (WARN_ON(i == g->nfuncs))
+		return -EINVAL;
+
+	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_REG_VAL_CTL);
+	val &= ~(LPI_GPIO_REG_FUNCTION_MASK);
+	val |= i << LPI_GPIO_REG_FUNCTION_SHIFT;
+	lpi_gpio_write(pctrl, pin, LPI_GPIO_REG_VAL_CTL, val);
+
+	return 0;
+}
+
+static const struct pinmux_ops lpi_gpio_pinmux_ops = {
+	.get_functions_count	= lpi_gpio_get_functions_count,
+	.get_function_name	= lpi_gpio_get_function_name,
+	.get_function_groups	= lpi_gpio_get_function_groups,
+	.set_mux		= lpi_gpio_set_mux,
+};
+
+static int lpi_config_get(struct pinctrl_dev *pctldev,
+			  unsigned int pin, unsigned long *config)
+{
+	unsigned int param = pinconf_to_config_param(*config);
+	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
+	unsigned int arg = 0;
+	int is_out;
+	int pull;
+	u32 ctl_reg;
+
+	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_REG_DIR_CTL);
+
+	is_out = (ctl_reg & LPI_GPIO_REG_DIR_MASK) >> LPI_GPIO_REG_DIR_SHIFT;
+
+	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_REG_VAL_CTL);
+
+	pull = (ctl_reg & LPI_GPIO_REG_PULL_MASK) >> LPI_GPIO_REG_PULL_SHIFT;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (pull == LPI_GPIO_BIAS_DISABLE)
+			arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (pull == LPI_GPIO_PULL_DOWN)
+			arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+		if (pull == LPI_GPIO_KEEPER)
+			arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (pull == LPI_GPIO_PULL_UP)
+			arg = 1;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_OUTPUT:
+		if (is_out)
+			arg = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return 0;
+}
+
+static unsigned int lpi_drive_to_regval(u32 arg)
+{
+	return (arg/2 - 1);
+}
+
+static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			  unsigned long *configs, unsigned int nconfs)
+{
+	unsigned int param, arg;
+	int i, ret = 0;
+	unsigned long val;
+	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
+	bool            output_enabled;
+	unsigned int    pullup;
+	unsigned int    strength;
+	unsigned int	offset;
+	bool            value;
+
+	for (i = 0; i < nconfs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			pullup = LPI_GPIO_BIAS_DISABLE;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			pullup = LPI_GPIO_PULL_DOWN;
+			break;
+		case PIN_CONFIG_BIAS_BUS_HOLD:
+			pullup = LPI_GPIO_KEEPER;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			pullup = LPI_GPIO_PULL_UP;
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			output_enabled = false;
+			break;
+		case PIN_CONFIG_OUTPUT:
+			output_enabled = true;
+			lpi_gpio_write(state, pin, LPI_GPIO_REG_DIR_CTL,
+			output_enabled << LPI_GPIO_REG_DIR_SHIFT);
+			value = arg;
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			strength = arg;
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (arg > LPI_SLEW_RATE_MAX) {
+				dev_err(pctldev->dev, "%s: invalid slew rate %u for pin: %d\n",
+					__func__, arg, pin);
+				goto set_gpio;
+			}
+
+			mutex_lock(&state->slew_access_lock);
+
+			val = ioread32(state->slew_base + LPI_SLEW_REG_VAL_CTL);
+
+			offset = state->data->slew_reg_pin_offsets[pin];
+			for (i = 0; i < LPI_SLEW_BITS_SIZE; i++) {
+				if (arg & 0x01)
+					set_bit(offset, &val);
+				else
+					clear_bit(offset, &val);
+				offset++;
+				arg = arg >> 1;
+			}
+
+			iowrite32(val, state->slew_base + LPI_SLEW_REG_VAL_CTL);
+
+			mutex_unlock(&state->slew_access_lock);
+			break;
+		default:
+			ret = -EINVAL;
+			goto done;
+		}
+	}
+
+set_gpio:
+
+	val = lpi_gpio_read(state, pin, LPI_GPIO_REG_VAL_CTL);
+	val &= ~(LPI_GPIO_REG_PULL_MASK | LPI_GPIO_REG_OUT_STRENGTH_MASK |
+		 LPI_GPIO_REG_OE_MASK);
+	val |= pullup << LPI_GPIO_REG_PULL_SHIFT;
+	val |= lpi_drive_to_regval(strength) << LPI_GPIO_REG_OUT_STRENGTH_SHIFT;
+	if (output_enabled)
+		val |= value << LPI_GPIO_REG_OE_SHIFT;
+
+	lpi_gpio_write(state, pin, LPI_GPIO_REG_VAL_CTL, val);
+	lpi_gpio_write(state, pin, LPI_GPIO_REG_DIR_CTL,
+		       output_enabled << LPI_GPIO_REG_DIR_SHIFT);
+done:
+	return ret;
+}
+
+static const struct pinconf_ops lpi_gpio_pinconf_ops = {
+	.is_generic			= true,
+	.pin_config_group_get		= lpi_config_get,
+	.pin_config_group_set		= lpi_config_set,
+};
+
+static int lpi_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
+
+	return lpi_config_set(state->ctrl, pin, &config, 1);
+}
+
+static int lpi_gpio_direction_output(struct gpio_chip *chip,
+				     unsigned int pin, int val)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
+
+	return lpi_config_set(state->ctrl, pin, &config, 1);
+}
+
+static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	int value;
+
+	value = lpi_gpio_read(state, pin, LPI_GPIO_REG_VAL_CTL);
+	return value;
+}
+
+static void lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+
+	lpi_config_set(state->ctrl, pin, &config, 1);
+}
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/seq_file.h>
+
+static unsigned int lpi_regval_to_drive(u32 val)
+{
+	return (val + 1) * 2;
+}
+
+static void lpi_gpio_dbg_show_one(struct seq_file *s,
+				  struct pinctrl_dev *pctldev,
+				  struct gpio_chip *chip,
+				  unsigned int offset,
+				  unsigned int gpio)
+{
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	struct pinctrl_pin_desc pindesc;
+	unsigned int func;
+	int is_out;
+	int drive;
+	int pull;
+	u32 ctl_reg;
+
+	static const char * const pulls[] = {
+		"no pull",
+		"pull down",
+		"keeper",
+		"pull up"
+	};
+
+	pctldev = pctldev ? : state->ctrl;
+	pindesc = pctldev->desc->pins[offset];
+	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_REG_DIR_CTL);
+	is_out = (ctl_reg & LPI_GPIO_REG_DIR_MASK) >> LPI_GPIO_REG_DIR_SHIFT;
+	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_REG_VAL_CTL);
+
+	func = (ctl_reg & LPI_GPIO_REG_FUNCTION_MASK) >>
+		LPI_GPIO_REG_FUNCTION_SHIFT;
+	drive = (ctl_reg & LPI_GPIO_REG_OUT_STRENGTH_MASK) >>
+		 LPI_GPIO_REG_OUT_STRENGTH_SHIFT;
+	pull = (ctl_reg & LPI_GPIO_REG_PULL_MASK) >> LPI_GPIO_REG_PULL_SHIFT;
+
+	seq_printf(s, " %-8s: %-3s %d",
+		   pindesc.name, is_out ? "out" : "in", func);
+	seq_printf(s, " %dmA", lpi_regval_to_drive(drive));
+	seq_printf(s, " %s", pulls[pull]);
+}
+
+static void lpi_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+	unsigned int gpio = chip->base;
+	unsigned int i;
+
+	for (i = 0; i < chip->ngpio; i++, gpio++) {
+		lpi_gpio_dbg_show_one(s, NULL, chip, i, gpio);
+		seq_puts(s, "\n");
+	}
+}
+
+#else
+#define lpi_gpio_dbg_show NULL
+#endif
+
+static const struct gpio_chip lpi_gpio_template = {
+	.direction_input	= lpi_gpio_direction_input,
+	.direction_output	= lpi_gpio_direction_output,
+	.get			= lpi_gpio_get,
+	.set			= lpi_gpio_set,
+	.request		= gpiochip_generic_request,
+	.free			= gpiochip_generic_free,
+	.dbg_show		= lpi_gpio_dbg_show,
+};
+
+static int lpi_pinctrl_probe(struct platform_device *pdev)
+{
+	int ret, npins;
+	struct clk *core_vote = NULL;
+	struct clk *audio_vote = NULL;
+
+	struct lpi_pinctrl *pctrl;
+	const struct lpi_pinctrl_variant_data *data;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pctrl);
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	pctrl->data = data;
+	pctrl->dev = &pdev->dev;
+	npins = data->npins;
+
+	/* Register LPASS core hw vote */
+	core_vote = devm_clk_get(&pdev->dev, "core");
+	if (IS_ERR(core_vote)) {
+		dev_dbg(&pdev->dev, "%s: clk get %s failed %d\n",
+			__func__, "core_vote", ret);
+		return PTR_ERR(core_vote);
+	}
+	pctrl->core_vote = core_vote;
+
+	/* Register LPASS audio hw vote */
+	audio_vote = devm_clk_get(&pdev->dev, "audio");
+	if (IS_ERR(audio_vote)) {
+		dev_dbg(&pdev->dev, "%s: clk get %s failed %d\n",
+			__func__, "audio_vote", ret);
+		return PTR_ERR(audio_vote);
+	}
+	clk_prepare_enable(pctrl->core_vote);
+	clk_prepare_enable(pctrl->audio_vote);
+
+	pctrl->audio_vote = audio_vote;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pctrl->tlmm_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pctrl->tlmm_base)) {
+		ret = PTR_ERR(pctrl->tlmm_base);
+		goto err;
+	}
+
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	pctrl->slew_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pctrl->slew_base)) {
+		ret = PTR_ERR(pctrl->slew_base);
+		goto err;
+	}
+
+	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
+	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
+	pctrl->desc.confops = &lpi_gpio_pinconf_ops;
+
+	pctrl->desc.owner = THIS_MODULE;
+	pctrl->desc.name = dev_name(dev);
+	pctrl->desc.pins = data->pins;
+	pctrl->desc.npins = data->npins;
+
+	pctrl->chip = lpi_gpio_template;
+	pctrl->chip.parent = dev;
+	pctrl->chip.base = -1;
+	pctrl->chip.ngpio = npins;
+	pctrl->chip.label = dev_name(dev);
+	pctrl->chip.of_gpio_n_cells = 2;
+	pctrl->chip.can_sleep = false;
+
+	mutex_init(&pctrl->slew_access_lock);
+
+	pctrl->ctrl = devm_pinctrl_register(dev, &pctrl->desc, pctrl);
+	if (IS_ERR(pctrl->ctrl)) {
+		ret = PTR_ERR(pctrl->ctrl);
+		goto err_pinctrl;
+	}
+
+	ret = gpiochip_add_data(&pctrl->chip, pctrl);
+	if (ret) {
+		dev_err(pctrl->dev, "can't add gpio chip\n");
+		goto err_pinctrl;
+	}
+
+	ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(dev), 0, 0, npins);
+	if (ret) {
+		dev_err(dev, "failed to add pin range\n");
+		goto err_range;
+	}
+
+	return 0;
+
+err_range:
+	gpiochip_remove(&pctrl->chip);
+err_pinctrl:
+	mutex_destroy(&pctrl->slew_access_lock);
+err:
+	clk_disable_unprepare(pctrl->core_vote);
+	clk_disable_unprepare(pctrl->audio_vote);
+
+	return ret;
+}
+
+static int lpi_pinctrl_remove(struct platform_device *pdev)
+{
+	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&pctrl->chip);
+	mutex_destroy(&pctrl->slew_access_lock);
+	clk_disable_unprepare(pctrl->core_vote);
+	clk_disable_unprepare(pctrl->audio_vote);
+
+	return 0;
+}
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
+	       .data = &sm8250_lpi_data,
+	},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		   .name = "qcom-lpass-lpi-pinctrl",
+		   .of_match_table = lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+
+MODULE_DESCRIPTION("QTI LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

