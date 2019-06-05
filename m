Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8523629A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 19:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfFER3X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 13:29:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39446 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfFER3W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 13:29:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 766A460E5A; Wed,  5 Jun 2019 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559755758;
        bh=FSJzBo/VU3W8uxZEp5TOtovVZhJ9D/rw0SpXVcGQ1LU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JfN8JW/r5nUYfZJBIEtynSSguAirRA3IX3OC4BB+w4919IXNUX3WDRozULq/+RQ1s
         nWQJWQJbtcxnKSxwMKU/dJUKFqs3keOwWx17n/Hlw+GRg2oji6OcKnmfEvamwvugHr
         0AixPuwPBL4dkuNPFeF45It24bgOyzRTPoTOlBGM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 01DCC60312;
        Wed,  5 Jun 2019 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559755756;
        bh=FSJzBo/VU3W8uxZEp5TOtovVZhJ9D/rw0SpXVcGQ1LU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=W7Oswg+AKSLeI2SSwMDlZIVzoJ8o4fkVsmQnq+SaKvK260vML53aUev8PCujNlSlz
         PCOBChdDnkXfT7sjpiq+7scgf//HDyo6oQjE92yUlrOwGhPHbngfKNJ1IAC80vTZ70
         hOMdMCK5tiSLSSl5A2i3FvNq4BH5gWi3WHWgbUwc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01DCC60312
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     robh+dt@kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/6] pinctrl: qcom: Add ipq6018 pinctrl driver
Date:   Wed,  5 Jun 2019 22:58:53 +0530
Message-Id: <1559755738-28643-2-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial pinctrl driver to support pin configuration with
pinctrl framework for ipq6018.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Signed-off-by: speriaka <speriaka@codeaurora.org>
---
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.txt      |  186 +++
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             | 1183 ++++++++++++++++++++
 4 files changed, 1380 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq6018.c

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt
new file mode 100644
index 0000000..5a3edb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt
@@ -0,0 +1,186 @@
+Qualcomm Technologies, Inc. IPQ6018 TLMM block
+
+This binding describes the Top Level Mode Multiplexer block found in the
+IPQ6018 platform.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be "qcom,ipq6018-pinctrl"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: the base address and size of the TLMM register space.
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the TLMM summary IRQ.
+
+- interrupt-controller:
+	Usage: required
+	Value type: <none>
+	Definition: identifies this node as an interrupt controller
+
+- #interrupt-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 2. Specifying the pin number and flags, as defined
+		    in <dt-bindings/interrupt-controller/irq.h>
+
+- gpio-controller:
+	Usage: required
+	Value type: <none>
+	Definition: identifies this node as a gpio controller
+
+- #gpio-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 2. Specifying the pin number and flags, as defined
+		    in <dt-bindings/gpio/gpio.h>
+
+Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
+a general description of GPIO and interrupt bindings.
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices, including the meaning of the
+phrase "pin configuration node".
+
+The pin configuration nodes act as a container for an arbitrary number of
+subnodes. Each of these subnodes represents some desired configuration for a
+pin, a group, or a list of pins or groups. This configuration can include the
+mux function to select on those pin(s)/group(s), and various pin configuration
+parameters, such as pull-up, drive strength, etc.
+
+
+PIN CONFIGURATION NODES:
+
+The name of each subnode is not important; all subnodes should be enumerated
+and processed purely based on their content.
+
+Each subnode only affects those parameters that are explicitly listed. In
+other words, a subnode that lists a mux function but no pin configuration
+parameters implies no information about any pin configuration parameters.
+Similarly, a pin subnode that describes a pullup parameter implies no
+information about e.g. the mux function.
+
+
+The following generic properties as defined in pinctrl-bindings.txt are valid
+to specify in a pin configuration subnode:
+
+- pins:
+	Usage: required
+	Value type: <string-array>
+	Definition: List of gpio pins affected by the properties specified in
+		    this subnode.  Valid pins are:
+		    gpio0-gpio121,
+		    sdc1_clk,
+		    sdc1_cmd,
+		    sdc1_data
+		    sdc2_clk,
+		    sdc2_cmd,
+		    sdc2_data,
+		    qdsd_cmd,
+		    qdsd_data0,
+		    qdsd_data1,
+		    qdsd_data2,
+		    qdsd_data3
+
+- function:
+	Usage: required
+	Value type: <string>
+	Definition: Specify the alternative function to be configured for the
+		    specified pins. Functions are only valid for gpio pins.
+		    Valid values are:
+	adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char, atest_char0,
+	atest_char1, atest_char2, atest_char3, atest_combodac, atest_gpsadc0,
+	atest_gpsadc1, atest_tsens, atest_wlan0, atest_wlan1, backlight_en,
+	bimc_dte0,bimc_dte1, blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c4,
+	blsp_i2c5, blsp_i2c6, blsp_spi1, blsp_spi1_cs1, blsp_spi1_cs2,
+	blsp_spi1_cs3, blsp_spi2, blsp_spi2_cs1, blsp_spi2_cs2, blsp_spi2_cs3,
+	blsp_spi3, blsp_spi3_cs1, blsp_spi3_cs2, blsp_spi3_cs3, blsp_spi4,
+	blsp_spi5, blsp_spi6, blsp_uart1, blsp_uart2, blsp_uim1, blsp_uim2,
+	cam1_rst, cam1_standby, cam_mclk0, cam_mclk1, cci_async, cci_i2c,
+	cci_timer0, cci_timer1, cci_timer2, cdc_pdm0, codec_mad, dbg_out,
+	display_5v, dmic0_clk, dmic0_data, dsi_rst, ebi0_wrcdc, euro_us,
+	ext_lpass, flash_strobe, gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a,
+	gcc_gp2_clk_b, gcc_gp3_clk_a, gcc_gp3_clk_b, gpio, gsm0_tx0, gsm0_tx1,
+	gsm1_tx0, gsm1_tx1, gyro_accl, kpsns0, kpsns1, kpsns2, ldo_en,
+	ldo_update, mag_int, mdp_vsync, modem_tsync, m_voc, nav_pps, nav_tsync,
+	pa_indicator, pbs0, pbs1, pbs2, pri_mi2s, pri_mi2s_ws, prng_rosc,
+	pwr_crypto_enabled_a, pwr_crypto_enabled_b, pwr_modem_enabled_a,
+	pwr_modem_enabled_b, pwr_nav_enabled_a, pwr_nav_enabled_b,
+	qdss_ctitrig_in_a0, qdss_ctitrig_in_a1, qdss_ctitrig_in_b0,
+	qdss_ctitrig_in_b1, qdss_ctitrig_out_a0, qdss_ctitrig_out_a1,
+	qdss_ctitrig_out_b0, qdss_ctitrig_out_b1, qdss_traceclk_a,
+	qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b, qdss_tracedata_a,
+	qdss_tracedata_b, reset_n, sd_card, sd_write, sec_mi2s, smb_int,
+	ssbi_wtr0, ssbi_wtr1, uim1, uim2, uim3, uim_batt, wcss_bt, wcss_fm,
+	wcss_wlan, webcam1_rst
+
+- bias-disable:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configued as no pull.
+
+- bias-pull-down:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configued as pull down.
+
+- bias-pull-up:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configued as pull up.
+
+- output-high:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins are configured in output mode, driven
+		    high.
+		    Not valid for sdc pins.
+
+- output-low:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins are configured in output mode, driven
+		    low.
+		    Not valid for sdc pins.
+
+- drive-strength:
+	Usage: optional
+	Value type: <u32>
+	Definition: Selects the drive strength for the specified pins, in mA.
+		    Valid values are: 2, 4, 6, 8, 10, 12, 14 and 16
+
+Example:
+
+	tlmm: pinctrl@1000000 {
+		compatible = "qcom,ipq6018-pinctrl";
+		reg = <0x1000000 0x300000>;
+		interrupts = <0 208 0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		uart2: uart2-default {
+			mux {
+				pins = "gpio4", "gpio5";
+				function = "blsp_uart2";
+			};
+
+			tx {
+				pins = "gpio4";
+				drive-strength = <4>;
+				bias-disable;
+			};
+
+			rx {
+				pins = "gpio5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+		};
+	};
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 890d0a3..c7b32e8 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -50,6 +50,16 @@ config PINCTRL_IPQ8074
 	  Qualcomm Technologies Inc. IPQ8074 platform. Select this for
 	  IPQ8074.
 
+config PINCTRL_IPQ6018
+	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_MSM
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
+	  the Qualcomm Technologies Inc. TLMM block found on the
+	  Qualcomm Technologies Inc. IPQ6018 platform. Select this for
+	  IPQ6018.
+
 config PINCTRL_MSM8660
 	tristate "Qualcomm 8660 pin controller driver"
 	depends on GPIOLIB && OF
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 344b4c6..0b8b769 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
 obj-$(CONFIG_PINCTRL_IPQ4019)	+= pinctrl-ipq4019.o
 obj-$(CONFIG_PINCTRL_IPQ8064)	+= pinctrl-ipq8064.o
 obj-$(CONFIG_PINCTRL_IPQ8074)	+= pinctrl-ipq8074.o
+obj-$(CONFIG_PINCTRL_IPQ6018)	+= pinctrl-ipq6018.o
 obj-$(CONFIG_PINCTRL_MSM8660)	+= pinctrl-msm8660.o
 obj-$(CONFIG_PINCTRL_MSM8960)	+= pinctrl-msm8960.o
 obj-$(CONFIG_PINCTRL_MSM8X74)	+= pinctrl-msm8x74.o
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
new file mode 100644
index 0000000..cdc05af9
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
@@ -0,0 +1,1183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-msm.h"
+
+#define FUNCTION(fname)			                \
+	[msm_mux_##fname] = {		                \
+		.name = #fname,				\
+		.groups = fname##_groups,               \
+		.ngroups = ARRAY_SIZE(fname##_groups),	\
+	}
+
+#define REG_SIZE 0x1000
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
+	{					        \
+		.name = "gpio" #id,			\
+		.pins = gpio##id##_pins,		\
+		.npins = (unsigned int)ARRAY_SIZE(gpio##id##_pins),	\
+		.funcs = (int[]){			\
+			msm_mux_gpio, /* gpio mode */	\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9			\
+		},				        \
+		.nfuncs = 10,				\
+		.ctl_reg = REG_SIZE * id,			\
+		.io_reg = 0x4 + REG_SIZE * id,		\
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
+		.intr_status_reg = 0xc + REG_SIZE * id,	\
+		.intr_target_reg = 0x8 + REG_SIZE * id,	\
+		.mux_bit = 2,			\
+		.pull_bit = 0,			\
+		.drv_bit = 6,			\
+		.oe_bit = 9,			\
+		.in_bit = 0,			\
+		.out_bit = 1,			\
+		.intr_enable_bit = 0,		\
+		.intr_status_bit = 0,		\
+		.intr_target_bit = 5,		\
+		.intr_target_kpss_val = 3,	\
+		.intr_raw_status_bit = 4,	\
+		.intr_polarity_bit = 1,		\
+		.intr_detection_bit = 2,	\
+		.intr_detection_width = 2,	\
+	}
+
+static const struct pinctrl_pin_desc ipq6018_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(63, "GPIO_63"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+};
+
+#define DECLARE_MSM_GPIO_PINS(pin) \
+	static const unsigned int gpio##pin##_pins[] = { pin }
+DECLARE_MSM_GPIO_PINS(0);
+DECLARE_MSM_GPIO_PINS(1);
+DECLARE_MSM_GPIO_PINS(2);
+DECLARE_MSM_GPIO_PINS(3);
+DECLARE_MSM_GPIO_PINS(4);
+DECLARE_MSM_GPIO_PINS(5);
+DECLARE_MSM_GPIO_PINS(6);
+DECLARE_MSM_GPIO_PINS(7);
+DECLARE_MSM_GPIO_PINS(8);
+DECLARE_MSM_GPIO_PINS(9);
+DECLARE_MSM_GPIO_PINS(10);
+DECLARE_MSM_GPIO_PINS(11);
+DECLARE_MSM_GPIO_PINS(12);
+DECLARE_MSM_GPIO_PINS(13);
+DECLARE_MSM_GPIO_PINS(14);
+DECLARE_MSM_GPIO_PINS(15);
+DECLARE_MSM_GPIO_PINS(16);
+DECLARE_MSM_GPIO_PINS(17);
+DECLARE_MSM_GPIO_PINS(18);
+DECLARE_MSM_GPIO_PINS(19);
+DECLARE_MSM_GPIO_PINS(20);
+DECLARE_MSM_GPIO_PINS(21);
+DECLARE_MSM_GPIO_PINS(22);
+DECLARE_MSM_GPIO_PINS(23);
+DECLARE_MSM_GPIO_PINS(24);
+DECLARE_MSM_GPIO_PINS(25);
+DECLARE_MSM_GPIO_PINS(26);
+DECLARE_MSM_GPIO_PINS(27);
+DECLARE_MSM_GPIO_PINS(28);
+DECLARE_MSM_GPIO_PINS(29);
+DECLARE_MSM_GPIO_PINS(30);
+DECLARE_MSM_GPIO_PINS(31);
+DECLARE_MSM_GPIO_PINS(32);
+DECLARE_MSM_GPIO_PINS(33);
+DECLARE_MSM_GPIO_PINS(34);
+DECLARE_MSM_GPIO_PINS(35);
+DECLARE_MSM_GPIO_PINS(36);
+DECLARE_MSM_GPIO_PINS(37);
+DECLARE_MSM_GPIO_PINS(38);
+DECLARE_MSM_GPIO_PINS(39);
+DECLARE_MSM_GPIO_PINS(40);
+DECLARE_MSM_GPIO_PINS(41);
+DECLARE_MSM_GPIO_PINS(42);
+DECLARE_MSM_GPIO_PINS(43);
+DECLARE_MSM_GPIO_PINS(44);
+DECLARE_MSM_GPIO_PINS(45);
+DECLARE_MSM_GPIO_PINS(46);
+DECLARE_MSM_GPIO_PINS(47);
+DECLARE_MSM_GPIO_PINS(48);
+DECLARE_MSM_GPIO_PINS(49);
+DECLARE_MSM_GPIO_PINS(50);
+DECLARE_MSM_GPIO_PINS(51);
+DECLARE_MSM_GPIO_PINS(52);
+DECLARE_MSM_GPIO_PINS(53);
+DECLARE_MSM_GPIO_PINS(54);
+DECLARE_MSM_GPIO_PINS(55);
+DECLARE_MSM_GPIO_PINS(56);
+DECLARE_MSM_GPIO_PINS(57);
+DECLARE_MSM_GPIO_PINS(58);
+DECLARE_MSM_GPIO_PINS(59);
+DECLARE_MSM_GPIO_PINS(60);
+DECLARE_MSM_GPIO_PINS(61);
+DECLARE_MSM_GPIO_PINS(62);
+DECLARE_MSM_GPIO_PINS(63);
+DECLARE_MSM_GPIO_PINS(64);
+DECLARE_MSM_GPIO_PINS(65);
+DECLARE_MSM_GPIO_PINS(66);
+DECLARE_MSM_GPIO_PINS(67);
+DECLARE_MSM_GPIO_PINS(68);
+DECLARE_MSM_GPIO_PINS(69);
+DECLARE_MSM_GPIO_PINS(70);
+DECLARE_MSM_GPIO_PINS(71);
+DECLARE_MSM_GPIO_PINS(72);
+DECLARE_MSM_GPIO_PINS(73);
+DECLARE_MSM_GPIO_PINS(74);
+DECLARE_MSM_GPIO_PINS(75);
+DECLARE_MSM_GPIO_PINS(76);
+DECLARE_MSM_GPIO_PINS(77);
+DECLARE_MSM_GPIO_PINS(78);
+DECLARE_MSM_GPIO_PINS(79);
+
+enum ipq6018_functions {
+	msm_mux_gpio,
+	msm_mux_blsp3_uart,
+	msm_mux_blsp3_i2c,
+	msm_mux_blsp3_spi,
+	msm_mux_wci20,
+	msm_mux_qpic_pad,
+	msm_mux_burn0,
+	msm_mux_mac12,
+	msm_mux_qdss_tracectl_b,
+	msm_mux_burn1,
+	msm_mux_qdss_traceclk_b,
+	msm_mux_qdss_tracedata_b,
+	msm_mux_mac01,
+	msm_mux_qpic_pad4,
+	msm_mux_mac21,
+	msm_mux_qpic_pad5,
+	msm_mux_qpic_pad6,
+	msm_mux_qpic_pad7,
+	msm_mux_atest_char,
+	msm_mux_cxc0,
+	msm_mux_mac13,
+	msm_mux_dbg_out,
+	msm_mux_wci22,
+	msm_mux_qpic_pad1,
+	msm_mux_qpic_pad2,
+	msm_mux_qpic_pad3,
+	msm_mux_qpic_pad0,
+	msm_mux_qpic_pad8,
+	msm_mux_pwm00,
+	msm_mux_atest_char0,
+	msm_mux_wci23,
+	msm_mux_mac11,
+	msm_mux_pwm10,
+	msm_mux_atest_char1,
+	msm_mux_pwm20,
+	msm_mux_atest_char2,
+	msm_mux_pwm30,
+	msm_mux_atest_char3,
+	msm_mux_audio_txmclk,
+	msm_mux_audio_txmclkin,
+	msm_mux_pwm02,
+	msm_mux_tx_swrm0,
+	msm_mux_qdss_cti_trig_out_b0,
+	msm_mux_audio_txbclk,
+	msm_mux_pwm12,
+	msm_mux_wsa_swrm,
+	msm_mux_tx_swrm1,
+	msm_mux_qdss_cti_trig_in_b0,
+	msm_mux_audio_txfsync,
+	msm_mux_pwm22,
+	msm_mux_tx_swrm2,
+	msm_mux_qdss_cti_trig_out_b1,
+	msm_mux_audio0,
+	msm_mux_pwm32,
+	msm_mux_tx_swrm,
+	msm_mux_qdss_cti_trig_in_b1,
+	msm_mux_audio1,
+	msm_mux_pwm04,
+	msm_mux_audio2,
+	msm_mux_pwm14,
+	msm_mux_audio3,
+	msm_mux_pwm24,
+	msm_mux_audio_rxmclk,
+	msm_mux_audio_rxmclkin,
+	msm_mux_pwm03,
+	msm_mux_lpass_pdm,
+	msm_mux_lpass_aud,
+	msm_mux_qdss_cti_trig_in_a1,
+	msm_mux_audio_rxbclk,
+	msm_mux_pwm13,
+	msm_mux_lpass_aud0,
+	msm_mux_rx_swrm,
+	msm_mux_qdss_cti_trig_out_a1,
+	msm_mux_audio_rxfsync,
+	msm_mux_pwm23,
+	msm_mux_lpass_aud1,
+	msm_mux_rx_swrm0,
+	msm_mux_qdss_cti_trig_in_a0,
+	msm_mux_pwm33,
+	msm_mux_lpass_aud2,
+	msm_mux_rx_swrm1,
+	msm_mux_qdss_cti_trig_out_a0,
+	msm_mux_lpass_pcm,
+	msm_mux_mac10,
+	msm_mux_mac00,
+	msm_mux_mac20,
+	msm_mux_blsp0_uart,
+	msm_mux_blsp0_i2c,
+	msm_mux_blsp0_spi,
+	msm_mux_blsp2_uart,
+	msm_mux_blsp2_i2c,
+	msm_mux_blsp2_spi,
+	msm_mux_blsp5_i2c,
+	msm_mux_blsp5_uart,
+	msm_mux_qdss_traceclk_a,
+	msm_mux_qdss_tracectl_a,
+	msm_mux_pwm01,
+	msm_mux_pta1_1,
+	msm_mux_pwm11,
+	msm_mux_rx1,
+	msm_mux_pta1_2,
+	msm_mux_pwm21,
+	msm_mux_pta1_0,
+	msm_mux_pwm31,
+	msm_mux_prng_rosc,
+	msm_mux_blsp4_uart,
+	msm_mux_blsp4_i2c,
+	msm_mux_blsp4_spi,
+	msm_mux_pcie0_clk,
+	msm_mux_cri_trng0,
+	msm_mux_pcie0_rst,
+	msm_mux_cri_trng1,
+	msm_mux_pcie0_wake,
+	msm_mux_cri_trng,
+	msm_mux_sd_card,
+	msm_mux_sd_write,
+	msm_mux_rx0,
+	msm_mux_tsens_max,
+	msm_mux_mdc,
+	msm_mux_qdss_tracedata_a,
+	msm_mux_mdio,
+	msm_mux_pta2_0,
+	msm_mux_wci21,
+	msm_mux_cxc1,
+	msm_mux_pta2_1,
+	msm_mux_pta2_2,
+	msm_mux_blsp1_uart,
+	msm_mux_blsp1_i2c,
+	msm_mux_blsp1_spi,
+	msm_mux_gcc_plltest,
+	msm_mux_gcc_tlmm,
+	msm_mux_NA,
+};
+
+static const char * const blsp3_uart_groups[] = {
+	"gpio73", "gpio74", "gpio75", "gpio76",
+};
+
+static const char * const blsp3_i2c_groups[] = {
+	"gpio73", "gpio74",
+};
+
+static const char * const blsp3_spi_groups[] = {
+	"gpio73", "gpio74", "gpio75", "gpio76", "gpio77", "gpio78", "gpio79",
+};
+
+static const char * const wci20_groups[] = {
+	"gpio0", "gpio2",
+};
+
+static const char * const qpic_pad_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio9", "gpio10",
+	"gpio11", "gpio17",
+};
+
+static const char * const burn0_groups[] = {
+	"gpio0",
+};
+
+static const char * const mac12_groups[] = {
+	"gpio1", "gpio11",
+};
+
+static const char * const qdss_tracectl_b_groups[] = {
+	"gpio1",
+};
+
+static const char * const burn1_groups[] = {
+	"gpio1",
+};
+
+static const char * const qdss_traceclk_b_groups[] = {
+	"gpio0",
+};
+
+static const char * const qdss_tracedata_b_groups[] = {
+	"gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7", "gpio8", "gpio9",
+	"gpio10", "gpio11", "gpio12", "gpio13", "gpio14", "gpio15", "gpio16",
+	"gpio17",
+};
+
+static const char * const mac01_groups[] = {
+	"gpio3", "gpio4",
+};
+
+static const char * const qpic_pad4_groups[] = {
+	"gpio5",
+};
+
+static const char * const mac21_groups[] = {
+	"gpio5", "gpio6",
+};
+
+static const char * const qpic_pad5_groups[] = {
+	"gpio6",
+};
+
+static const char * const qpic_pad6_groups[] = {
+	"gpio7",
+};
+
+static const char * const qpic_pad7_groups[] = {
+	"gpio8",
+};
+
+static const char * const atest_char_groups[] = {
+	"gpio9",
+};
+
+static const char * const cxc0_groups[] = {
+	"gpio9", "gpio16",
+};
+
+static const char * const mac13_groups[] = {
+	"gpio9", "gpio16",
+};
+
+static const char * const dbg_out_groups[] = {
+	"gpio9",
+};
+
+static const char * const wci22_groups[] = {
+	"gpio11", "gpio17",
+};
+
+static const char * const qpic_pad1_groups[] = {
+	"gpio12",
+};
+
+static const char * const qpic_pad2_groups[] = {
+	"gpio13",
+};
+
+static const char * const qpic_pad3_groups[] = {
+	"gpio14",
+};
+
+static const char * const qpic_pad0_groups[] = {
+	"gpio15",
+};
+
+static const char * const qpic_pad8_groups[] = {
+	"gpio16",
+};
+
+static const char * const pwm00_groups[] = {
+	"gpio18",
+};
+
+static const char * const atest_char0_groups[] = {
+	"gpio18",
+};
+
+static const char * const wci23_groups[] = {
+	"gpio18", "gpio19",
+};
+
+static const char * const mac11_groups[] = {
+	"gpio18", "gpio19",
+};
+
+static const char * const pwm10_groups[] = {
+	"gpio19",
+};
+
+static const char * const atest_char1_groups[] = {
+	"gpio19",
+};
+
+static const char * const pwm20_groups[] = {
+	"gpio20",
+};
+
+static const char * const atest_char2_groups[] = {
+	"gpio20",
+};
+
+static const char * const pwm30_groups[] = {
+	"gpio21",
+};
+
+static const char * const atest_char3_groups[] = {
+	"gpio21",
+};
+
+static const char * const audio_txmclk_groups[] = {
+	"gpio22",
+};
+
+static const char * const audio_txmclkin_groups[] = {
+	"gpio22",
+};
+
+static const char * const pwm02_groups[] = {
+	"gpio22",
+};
+
+static const char * const tx_swrm0_groups[] = {
+	"gpio22",
+};
+
+static const char * const qdss_cti_trig_out_b0_groups[] = {
+	"gpio22",
+};
+
+static const char * const audio_txbclk_groups[] = {
+	"gpio23",
+};
+
+static const char * const pwm12_groups[] = {
+	"gpio23",
+};
+
+static const char * const wsa_swrm_groups[] = {
+	"gpio23", "gpio24",
+};
+
+static const char * const tx_swrm1_groups[] = {
+	"gpio23",
+};
+
+static const char * const qdss_cti_trig_in_b0_groups[] = {
+	"gpio23",
+};
+
+static const char * const audio_txfsync_groups[] = {
+	"gpio24",
+};
+
+static const char * const pwm22_groups[] = {
+	"gpio24",
+};
+
+static const char * const tx_swrm2_groups[] = {
+	"gpio24",
+};
+
+static const char * const qdss_cti_trig_out_b1_groups[] = {
+	"gpio24",
+};
+
+static const char * const audio0_groups[] = {
+	"gpio25", "gpio32",
+};
+
+static const char * const pwm32_groups[] = {
+	"gpio25",
+};
+
+static const char * const tx_swrm_groups[] = {
+	"gpio25",
+};
+
+static const char * const qdss_cti_trig_in_b1_groups[] = {
+	"gpio25",
+};
+
+static const char * const audio1_groups[] = {
+	"gpio26", "gpio33",
+};
+
+static const char * const pwm04_groups[] = {
+	"gpio26",
+};
+
+static const char * const audio2_groups[] = {
+	"gpio27",
+};
+
+static const char * const pwm14_groups[] = {
+	"gpio27",
+};
+
+static const char * const audio3_groups[] = {
+	"gpio28",
+};
+
+static const char * const pwm24_groups[] = {
+	"gpio28",
+};
+
+static const char * const audio_rxmclk_groups[] = {
+	"gpio29",
+};
+
+static const char * const audio_rxmclkin_groups[] = {
+	"gpio29",
+};
+
+static const char * const pwm03_groups[] = {
+	"gpio29",
+};
+
+static const char * const lpass_pdm_groups[] = {
+	"gpio29", "gpio30", "gpio31", "gpio32",
+};
+
+static const char * const lpass_aud_groups[] = {
+	"gpio29",
+};
+
+static const char * const qdss_cti_trig_in_a1_groups[] = {
+	"gpio29",
+};
+
+static const char * const audio_rxbclk_groups[] = {
+	"gpio30",
+};
+
+static const char * const pwm13_groups[] = {
+	"gpio30",
+};
+
+static const char * const lpass_aud0_groups[] = {
+	"gpio30",
+};
+
+static const char * const rx_swrm_groups[] = {
+	"gpio30",
+};
+
+static const char * const qdss_cti_trig_out_a1_groups[] = {
+	"gpio30",
+};
+
+static const char * const audio_rxfsync_groups[] = {
+	"gpio31",
+};
+
+static const char * const pwm23_groups[] = {
+	"gpio31",
+};
+
+static const char * const lpass_aud1_groups[] = {
+	"gpio31",
+};
+
+static const char * const rx_swrm0_groups[] = {
+	"gpio31",
+};
+
+static const char * const qdss_cti_trig_in_a0_groups[] = {
+	"gpio31",
+};
+
+static const char * const pwm33_groups[] = {
+	"gpio32",
+};
+
+static const char * const lpass_aud2_groups[] = {
+	"gpio32",
+};
+
+static const char * const rx_swrm1_groups[] = {
+	"gpio32",
+};
+
+static const char * const qdss_cti_trig_out_a0_groups[] = {
+	"gpio32",
+};
+
+static const char * const lpass_pcm_groups[] = {
+	"gpio34", "gpio35", "gpio36", "gpio37",
+};
+
+static const char * const mac10_groups[] = {
+	"gpio34", "gpio35",
+};
+
+static const char * const mac00_groups[] = {
+	"gpio34", "gpio35",
+};
+
+static const char * const mac20_groups[] = {
+	"gpio36", "gpio37",
+};
+
+static const char * const blsp0_uart_groups[] = {
+	"gpio38", "gpio39", "gpio40", "gpio41",
+};
+
+static const char * const blsp0_i2c_groups[] = {
+	"gpio38", "gpio39",
+};
+
+static const char * const blsp0_spi_groups[] = {
+	"gpio38", "gpio39", "gpio40", "gpio41",
+};
+
+static const char * const blsp2_uart_groups[] = {
+	"gpio42", "gpio43", "gpio44", "gpio45",
+};
+
+static const char * const blsp2_i2c_groups[] = {
+	"gpio42", "gpio43",
+};
+
+static const char * const blsp2_spi_groups[] = {
+	"gpio42", "gpio43", "gpio44", "gpio45",
+};
+
+static const char * const blsp5_i2c_groups[] = {
+	"gpio46", "gpio47",
+};
+
+static const char * const blsp5_uart_groups[] = {
+	"gpio48", "gpio49",
+};
+
+static const char * const qdss_traceclk_a_groups[] = {
+	"gpio48",
+};
+
+static const char * const qdss_tracectl_a_groups[] = {
+	"gpio49",
+};
+
+static const char * const pwm01_groups[] = {
+	"gpio50",
+};
+
+static const char * const pta1_1_groups[] = {
+	"gpio51",
+};
+
+static const char * const pwm11_groups[] = {
+	"gpio51",
+};
+
+static const char * const rx1_groups[] = {
+	"gpio51",
+};
+
+static const char * const pta1_2_groups[] = {
+	"gpio52",
+};
+
+static const char * const pwm21_groups[] = {
+	"gpio52",
+};
+
+static const char * const pta1_0_groups[] = {
+	"gpio53",
+};
+
+static const char * const pwm31_groups[] = {
+	"gpio53",
+};
+
+static const char * const prng_rosc_groups[] = {
+	"gpio53",
+};
+
+static const char * const blsp4_uart_groups[] = {
+	"gpio55", "gpio56", "gpio57", "gpio58",
+};
+
+static const char * const blsp4_i2c_groups[] = {
+	"gpio55", "gpio56",
+};
+
+static const char * const blsp4_spi_groups[] = {
+	"gpio55", "gpio56", "gpio57", "gpio58",
+};
+
+static const char * const pcie0_clk_groups[] = {
+	"gpio59",
+};
+
+static const char * const cri_trng0_groups[] = {
+	"gpio59",
+};
+
+static const char * const pcie0_rst_groups[] = {
+	"gpio60",
+};
+
+static const char * const cri_trng1_groups[] = {
+	"gpio60",
+};
+
+static const char * const pcie0_wake_groups[] = {
+	"gpio61",
+};
+
+static const char * const cri_trng_groups[] = {
+	"gpio61",
+};
+
+static const char * const sd_card_groups[] = {
+	"gpio62",
+};
+
+static const char * const sd_write_groups[] = {
+	"gpio63",
+};
+
+static const char * const rx0_groups[] = {
+	"gpio63",
+};
+
+static const char * const tsens_max_groups[] = {
+	"gpio63",
+};
+
+static const char * const mdc_groups[] = {
+	"gpio64",
+};
+
+static const char * const qdss_tracedata_a_groups[] = {
+	"gpio64", "gpio65", "gpio66", "gpio67", "gpio68", "gpio69", "gpio70",
+	"gpio71", "gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
+	"gpio78", "gpio79",
+};
+
+static const char * const mdio_groups[] = {
+	"gpio65",
+};
+
+static const char * const pta2_0_groups[] = {
+	"gpio66",
+};
+
+static const char * const wci21_groups[] = {
+	"gpio66", "gpio68",
+};
+
+static const char * const cxc1_groups[] = {
+	"gpio66", "gpio68",
+};
+
+static const char * const pta2_1_groups[] = {
+	"gpio67",
+};
+
+static const char * const pta2_2_groups[] = {
+	"gpio68",
+};
+
+static const char * const blsp1_uart_groups[] = {
+	"gpio69", "gpio70", "gpio71", "gpio72",
+};
+
+static const char * const blsp1_i2c_groups[] = {
+	"gpio69", "gpio70",
+};
+
+static const char * const blsp1_spi_groups[] = {
+	"gpio69", "gpio70", "gpio71", "gpio72",
+};
+
+static const char * const gcc_plltest_groups[] = {
+	"gpio69", "gpio71",
+};
+
+static const char * const gcc_tlmm_groups[] = {
+	"gpio70",
+};
+
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
+	"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio28",
+	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
+	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
+	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48", "gpio49",
+	"gpio50", "gpio51", "gpio52", "gpio53", "gpio54", "gpio55", "gpio56",
+	"gpio57", "gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63",
+	"gpio64", "gpio65", "gpio66", "gpio67", "gpio68", "gpio69", "gpio70",
+	"gpio71", "gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
+	"gpio78", "gpio79",
+};
+
+static const struct msm_function ipq6018_functions[] = {
+	FUNCTION(gpio),
+	FUNCTION(blsp3_uart),
+	FUNCTION(blsp3_i2c),
+	FUNCTION(blsp3_spi),
+	FUNCTION(wci20),
+	FUNCTION(qpic_pad),
+	FUNCTION(burn0),
+	FUNCTION(mac12),
+	FUNCTION(qdss_tracectl_b),
+	FUNCTION(burn1),
+	FUNCTION(qdss_traceclk_b),
+	FUNCTION(qdss_tracedata_b),
+	FUNCTION(mac01),
+	FUNCTION(qpic_pad4),
+	FUNCTION(mac21),
+	FUNCTION(qpic_pad5),
+	FUNCTION(qpic_pad6),
+	FUNCTION(qpic_pad7),
+	FUNCTION(atest_char),
+	FUNCTION(cxc0),
+	FUNCTION(mac13),
+	FUNCTION(dbg_out),
+	FUNCTION(wci22),
+	FUNCTION(qpic_pad1),
+	FUNCTION(qpic_pad2),
+	FUNCTION(qpic_pad3),
+	FUNCTION(qpic_pad0),
+	FUNCTION(qpic_pad8),
+	FUNCTION(pwm00),
+	FUNCTION(atest_char0),
+	FUNCTION(wci23),
+	FUNCTION(mac11),
+	FUNCTION(pwm10),
+	FUNCTION(atest_char1),
+	FUNCTION(pwm20),
+	FUNCTION(atest_char2),
+	FUNCTION(pwm30),
+	FUNCTION(atest_char3),
+	FUNCTION(audio_txmclk),
+	FUNCTION(audio_txmclkin),
+	FUNCTION(pwm02),
+	FUNCTION(tx_swrm0),
+	FUNCTION(qdss_cti_trig_out_b0),
+	FUNCTION(audio_txbclk),
+	FUNCTION(pwm12),
+	FUNCTION(wsa_swrm),
+	FUNCTION(tx_swrm1),
+	FUNCTION(qdss_cti_trig_in_b0),
+	FUNCTION(audio_txfsync),
+	FUNCTION(pwm22),
+	FUNCTION(tx_swrm2),
+	FUNCTION(qdss_cti_trig_out_b1),
+	FUNCTION(audio0),
+	FUNCTION(pwm32),
+	FUNCTION(tx_swrm),
+	FUNCTION(qdss_cti_trig_in_b1),
+	FUNCTION(audio1),
+	FUNCTION(pwm04),
+	FUNCTION(audio2),
+	FUNCTION(pwm14),
+	FUNCTION(audio3),
+	FUNCTION(pwm24),
+	FUNCTION(audio_rxmclk),
+	FUNCTION(audio_rxmclkin),
+	FUNCTION(pwm03),
+	FUNCTION(lpass_pdm),
+	FUNCTION(lpass_aud),
+	FUNCTION(qdss_cti_trig_in_a1),
+	FUNCTION(audio_rxbclk),
+	FUNCTION(pwm13),
+	FUNCTION(lpass_aud0),
+	FUNCTION(rx_swrm),
+	FUNCTION(qdss_cti_trig_out_a1),
+	FUNCTION(audio_rxfsync),
+	FUNCTION(pwm23),
+	FUNCTION(lpass_aud1),
+	FUNCTION(rx_swrm0),
+	FUNCTION(qdss_cti_trig_in_a0),
+	FUNCTION(pwm33),
+	FUNCTION(lpass_aud2),
+	FUNCTION(rx_swrm1),
+	FUNCTION(qdss_cti_trig_out_a0),
+	FUNCTION(lpass_pcm),
+	FUNCTION(mac10),
+	FUNCTION(mac00),
+	FUNCTION(mac20),
+	FUNCTION(blsp0_uart),
+	FUNCTION(blsp0_i2c),
+	FUNCTION(blsp0_spi),
+	FUNCTION(blsp2_uart),
+	FUNCTION(blsp2_i2c),
+	FUNCTION(blsp2_spi),
+	FUNCTION(blsp5_i2c),
+	FUNCTION(blsp5_uart),
+	FUNCTION(qdss_traceclk_a),
+	FUNCTION(qdss_tracectl_a),
+	FUNCTION(pwm01),
+	FUNCTION(pta1_1),
+	FUNCTION(pwm11),
+	FUNCTION(rx1),
+	FUNCTION(pta1_2),
+	FUNCTION(pwm21),
+	FUNCTION(pta1_0),
+	FUNCTION(pwm31),
+	FUNCTION(prng_rosc),
+	FUNCTION(blsp4_uart),
+	FUNCTION(blsp4_i2c),
+	FUNCTION(blsp4_spi),
+	FUNCTION(pcie0_clk),
+	FUNCTION(cri_trng0),
+	FUNCTION(pcie0_rst),
+	FUNCTION(cri_trng1),
+	FUNCTION(pcie0_wake),
+	FUNCTION(cri_trng),
+	FUNCTION(sd_card),
+	FUNCTION(sd_write),
+	FUNCTION(rx0),
+	FUNCTION(tsens_max),
+	FUNCTION(mdc),
+	FUNCTION(qdss_tracedata_a),
+	FUNCTION(mdio),
+	FUNCTION(pta2_0),
+	FUNCTION(wci21),
+	FUNCTION(cxc1),
+	FUNCTION(pta2_1),
+	FUNCTION(pta2_2),
+	FUNCTION(blsp1_uart),
+	FUNCTION(blsp1_i2c),
+	FUNCTION(blsp1_spi),
+	FUNCTION(gcc_plltest),
+	FUNCTION(gcc_tlmm),
+};
+
+static const struct msm_pingroup ipq6018_groups[] = {
+	PINGROUP(0, qpic_pad, wci20, qdss_traceclk_b, NA, burn0, NA, NA, NA,
+		 NA),
+	PINGROUP(1, qpic_pad, mac12, qdss_tracectl_b, NA, burn1, NA, NA, NA,
+		 NA),
+	PINGROUP(2, qpic_pad, wci20, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
+	PINGROUP(3, qpic_pad, mac01, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
+	PINGROUP(4, qpic_pad, mac01, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
+	PINGROUP(5, qpic_pad4, mac21, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
+	PINGROUP(6, qpic_pad5, mac21, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
+	PINGROUP(7, qpic_pad6, qdss_tracedata_b, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(8, qpic_pad7, qdss_tracedata_b, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(9, qpic_pad, atest_char, cxc0, mac13, dbg_out,
+		 qdss_tracedata_b, NA, NA, NA),
+	PINGROUP(10, qpic_pad, qdss_tracedata_b, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(11, qpic_pad, wci22, mac12, qdss_tracedata_b, NA, NA, NA, NA,
+		 NA),
+	PINGROUP(12, qpic_pad1, qdss_tracedata_b, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(13, qpic_pad2, qdss_tracedata_b, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(14, qpic_pad3, qdss_tracedata_b, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(15, qpic_pad0, qdss_tracedata_b, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(16, qpic_pad8, cxc0, mac13, qdss_tracedata_b, NA, NA, NA, NA,
+		 NA),
+	PINGROUP(17, qpic_pad, qdss_tracedata_b, wci22, NA, NA, NA, NA, NA, NA),
+	PINGROUP(18, pwm00, atest_char0, wci23, mac11, NA, NA, NA, NA, NA),
+	PINGROUP(19, pwm10, atest_char1, wci23, mac11, NA, NA, NA, NA, NA),
+	PINGROUP(20, pwm20, atest_char2, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(21, pwm30, atest_char3, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(22, audio_txmclk, audio_txmclkin, pwm02, tx_swrm0, NA,
+		 qdss_cti_trig_out_b0, NA, NA, NA),
+	PINGROUP(23, audio_txbclk, pwm12, wsa_swrm, tx_swrm1, NA,
+		 qdss_cti_trig_in_b0, NA, NA, NA),
+	PINGROUP(24, audio_txfsync, pwm22, wsa_swrm, tx_swrm2, NA,
+		 qdss_cti_trig_out_b1, NA, NA, NA),
+	PINGROUP(25, audio0, pwm32, tx_swrm, NA, qdss_cti_trig_in_b1, NA, NA,
+		 NA, NA),
+	PINGROUP(26, audio1, pwm04, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(27, audio2, pwm14, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(28, audio3, pwm24, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(29, audio_rxmclk, audio_rxmclkin, pwm03, lpass_pdm, lpass_aud,
+		 qdss_cti_trig_in_a1, NA, NA, NA),
+	PINGROUP(30, audio_rxbclk, pwm13, lpass_pdm, lpass_aud0, rx_swrm, NA,
+		 qdss_cti_trig_out_a1, NA, NA),
+	PINGROUP(31, audio_rxfsync, pwm23, lpass_pdm, lpass_aud1, rx_swrm0, NA,
+		 qdss_cti_trig_in_a0, NA, NA),
+	PINGROUP(32, audio0, pwm33, lpass_pdm, lpass_aud2, rx_swrm1, NA,
+		 qdss_cti_trig_out_a0, NA, NA),
+	PINGROUP(33, audio1, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(34, lpass_pcm, mac10, mac00, NA, NA, NA, NA, NA, NA),
+	PINGROUP(35, lpass_pcm, mac10, mac00, NA, NA, NA, NA, NA, NA),
+	PINGROUP(36, lpass_pcm, mac20, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(37, lpass_pcm, mac20, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(38, blsp0_uart, blsp0_i2c, blsp0_spi, NA, NA, NA, NA, NA, NA),
+	PINGROUP(39, blsp0_uart, blsp0_i2c, blsp0_spi, NA, NA, NA, NA, NA, NA),
+	PINGROUP(40, blsp0_uart, blsp0_spi, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(41, blsp0_uart, blsp0_spi, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(42, blsp2_uart, blsp2_i2c, blsp2_spi, NA, NA, NA, NA, NA, NA),
+	PINGROUP(43, blsp2_uart, blsp2_i2c, blsp2_spi, NA, NA, NA, NA, NA, NA),
+	PINGROUP(44, blsp2_uart, blsp2_spi, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(45, blsp2_uart, blsp2_spi, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(46, blsp5_i2c, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(47, blsp5_i2c, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(48, blsp5_uart, NA, qdss_traceclk_a, NA, NA, NA, NA, NA, NA),
+	PINGROUP(49, blsp5_uart, NA, qdss_tracectl_a, NA, NA, NA, NA, NA, NA),
+	PINGROUP(50, pwm01, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(51, pta1_1, pwm11, NA, rx1, NA, NA, NA, NA, NA),
+	PINGROUP(52, pta1_2, pwm21, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(53, pta1_0, pwm31, prng_rosc, NA, NA, NA, NA, NA, NA),
+	PINGROUP(54, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(55, blsp4_uart, blsp4_i2c, blsp4_spi, NA, NA, NA, NA, NA, NA),
+	PINGROUP(56, blsp4_uart, blsp4_i2c, blsp4_spi, NA, NA, NA, NA, NA, NA),
+	PINGROUP(57, blsp4_uart, blsp4_spi, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(58, blsp4_uart, blsp4_spi, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(59, pcie0_clk, NA, NA, cri_trng0, NA, NA, NA, NA, NA),
+	PINGROUP(60, pcie0_rst, NA, NA, cri_trng1, NA, NA, NA, NA, NA),
+	PINGROUP(61, pcie0_wake, NA, NA, cri_trng, NA, NA, NA, NA, NA),
+	PINGROUP(62, sd_card, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(63, sd_write, rx0, NA, tsens_max, NA, NA, NA, NA, NA),
+	PINGROUP(64, mdc, NA, qdss_tracedata_a, NA, NA, NA, NA, NA, NA),
+	PINGROUP(65, mdio, NA, qdss_tracedata_a, NA, NA, NA, NA, NA, NA),
+	PINGROUP(66, pta2_0, wci21, cxc1, qdss_tracedata_a, NA, NA, NA, NA, NA),
+	PINGROUP(67, pta2_1, qdss_tracedata_a, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(68, pta2_2, wci21, cxc1, qdss_tracedata_a, NA, NA, NA, NA, NA),
+	PINGROUP(69, blsp1_uart, blsp1_i2c, blsp1_spi, gcc_plltest,
+		 qdss_tracedata_a, NA, NA, NA, NA),
+	PINGROUP(70, blsp1_uart, blsp1_i2c, blsp1_spi, gcc_tlmm,
+		 qdss_tracedata_a, NA, NA, NA, NA),
+	PINGROUP(71, blsp1_uart, blsp1_spi, gcc_plltest, qdss_tracedata_a, NA,
+		 NA, NA, NA, NA),
+	PINGROUP(72, blsp1_uart, blsp1_spi, qdss_tracedata_a, NA, NA, NA, NA,
+		 NA, NA),
+	PINGROUP(73, blsp3_uart, blsp3_i2c, blsp3_spi, NA, qdss_tracedata_a,
+		 NA, NA, NA, NA),
+	PINGROUP(74, blsp3_uart, blsp3_i2c, blsp3_spi, NA, qdss_tracedata_a,
+		 NA, NA, NA, NA),
+	PINGROUP(75, blsp3_uart, blsp3_spi, NA, qdss_tracedata_a, NA, NA, NA,
+		 NA, NA),
+	PINGROUP(76, blsp3_uart, blsp3_spi, NA, qdss_tracedata_a, NA, NA, NA,
+		 NA, NA),
+	PINGROUP(77, blsp3_spi, NA, qdss_tracedata_a, NA, NA, NA, NA, NA, NA),
+	PINGROUP(78, blsp3_spi, NA, qdss_tracedata_a, NA, NA, NA, NA, NA, NA),
+	PINGROUP(79, blsp3_spi, NA, qdss_tracedata_a, NA, NA, NA, NA, NA, NA),
+};
+
+static const struct msm_pinctrl_soc_data ipq6018_pinctrl = {
+	.pins = ipq6018_pins,
+	.npins = ARRAY_SIZE(ipq6018_pins),
+	.functions = ipq6018_functions,
+	.nfunctions = ARRAY_SIZE(ipq6018_functions),
+	.groups = ipq6018_groups,
+	.ngroups = ARRAY_SIZE(ipq6018_groups),
+	.ngpios = 80,
+};
+
+static int ipq6018_pinctrl_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &ipq6018_pinctrl);
+}
+
+static const struct of_device_id ipq6018_pinctrl_of_match[] = {
+	{ .compatible = "qcom,ipq6018-pinctrl", },
+	{ },
+};
+
+static struct platform_driver ipq6018_pinctrl_driver = {
+	.driver = {
+		.name = "ipq6018-pinctrl",
+		.owner = THIS_MODULE,
+		.of_match_table = ipq6018_pinctrl_of_match,
+	},
+	.probe = ipq6018_pinctrl_probe,
+	.remove = msm_pinctrl_remove,
+};
+
+static int __init ipq6018_pinctrl_init(void)
+{
+	return platform_driver_register(&ipq6018_pinctrl_driver);
+}
+arch_initcall(ipq6018_pinctrl_init);
+
+static void __exit ipq6018_pinctrl_exit(void)
+{
+	platform_driver_unregister(&ipq6018_pinctrl_driver);
+}
+module_exit(ipq6018_pinctrl_exit);
+
+MODULE_DESCRIPTION("QTI ipq6018 pinctrl driver");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, ipq6018_pinctrl_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

