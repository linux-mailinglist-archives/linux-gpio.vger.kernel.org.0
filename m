Return-Path: <linux-gpio+bounces-23125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E5B014F7
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 09:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D4E87B25BC
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 07:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DE71F582B;
	Fri, 11 Jul 2025 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gJ/7kuQR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679111F1301;
	Fri, 11 Jul 2025 07:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219841; cv=none; b=skXxYfLwazSSgF/11OtzjGFk1SybtkOWrrCP9op3kWufGTbOfDiCb5nUeaY3SKdN1PP0QRdjHPb5JWIFHuXv4is7Mb4r/sQh8J4+XCuQeBkNTK4U9vNGU6sTiKQkJtnXT1+8vjqNtYcIgKBl+Y4FI3MSxFr5B57LE/z0L6NWMsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219841; c=relaxed/simple;
	bh=XsLGGYt3oYTh54BIG4nuTjGPLYTTK+pxLDS7s0CYimk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=r8PMQSo/+ko7VP1BC/7TdKmSaHFe81SdEM7TzkIcOx5+LQ0Ta+PyUAYTwBIzjoQt2jeffF9SAgsW05WBrBqvrzdXWSvoBOGZGipclkc2i37IG66M801Swx4t76XEayAwdEjmD7jXMWVfKjqzTWIMCVLYQ3H0dSlbxcvHhVFyh+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gJ/7kuQR; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B6YfhM030642;
	Fri, 11 Jul 2025 09:43:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	avR+GpQPpaDGo4Q1ED6pE/Gou0bR3VwtsV1xrGzA/ro=; b=gJ/7kuQRYj6TjbNz
	shyRw6YNaHxSa9KU91/Pi2zf1Lr6pNxSeMwIMAQxQ246TQ8taxsMsNhty6HVp/5i
	bJBoiHwaI2zsripV8kILBg1XZ/CKA7BYINIfp8L3+YuFRWLY9FtfzN8KnX0D86Y9
	yBseeejtHyx59rhF0uNiDGvpf8BLIgyQ2atsJbSDr6oexQhQ04joQWRJqKqbh3JU
	9N2Ovw+zbIAtrVaMYv1LPRL+ClJ8WHof9f7MDrdSotruVzhMpU3I50tEPgw8D5nW
	dGj73FPkfXuFLmUn/CqE4maKA4jdXzHriCBTdSXOQVcBeX98naJ4ND3g5u6V3W2W
	kt0znQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3ne8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:43:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B1E794004A;
	Fri, 11 Jul 2025 09:42:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4665B1484B;
	Fri, 11 Jul 2025 09:41:38 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:39 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 09:41:20 +0200
Subject: [PATCH v7 2/8] pinctrl: stm32: Introduce HDP driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250711-hdp-upstream-v7-2-faeecf7aaee1@foss.st.com>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-7616d
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01

This patch introduce the driver for the Hardware Debug Port available on
STM32MP platforms. The HDP allows the observation of internal SoC
signals by using multiplexers. Each HDP port can provide up to 16
internal signals (one of them can be software controlled as a GPO).

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/pinctrl/stm32/Kconfig             |  14 +
 drivers/pinctrl/stm32/Makefile            |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 720 ++++++++++++++++++++++++++++++
 3 files changed, 735 insertions(+)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index 297a2f088bc1..5f67e1ee66dd 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -57,4 +57,18 @@ config PINCTRL_STM32MP257
 	depends on OF && HAS_IOMEM
 	default MACH_STM32MP25 || (ARCH_STM32 && ARM64)
 	select PINCTRL_STM32
+
+config PINCTRL_STM32_HDP
+	tristate "STMicroelectronics STM32 Hardware Debug Port (HDP) pin control"
+	depends on OF && HAS_IOMEM
+	default ARCH_STM32 && !ARM_SINGLE_ARMV7M
+	select PINMUX
+	select GENERIC_PINCONF
+	select GPIOLIB
+	help
+	  The Hardware Debug Port allows the observation of internal signals.
+	  It uses configurable multiplexer to route signals in a dedicated observation register.
+	  This driver also permits the observation of signals on external SoC pins.
+	  It permits the observation of up to 16 signals per HDP line.
+
 endif
diff --git a/drivers/pinctrl/stm32/Makefile b/drivers/pinctrl/stm32/Makefile
index 7b17464d8de1..98a1bbc7e16c 100644
--- a/drivers/pinctrl/stm32/Makefile
+++ b/drivers/pinctrl/stm32/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_PINCTRL_STM32H743)	+= pinctrl-stm32h743.o
 obj-$(CONFIG_PINCTRL_STM32MP135) += pinctrl-stm32mp135.o
 obj-$(CONFIG_PINCTRL_STM32MP157) += pinctrl-stm32mp157.o
 obj-$(CONFIG_PINCTRL_STM32MP257) += pinctrl-stm32mp257.o
+obj-$(CONFIG_PINCTRL_STM32_HDP) += pinctrl-stm32-hdp.o
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
new file mode 100644
index 000000000000..e91442eb566b
--- /dev/null
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -0,0 +1,720 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
+ */
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+
+#include "../core.h"
+
+#define DRIVER_NAME		"stm32_hdp"
+#define HDP_CTRL_ENABLE		1
+#define HDP_CTRL_DISABLE	0
+
+#define HDP_CTRL		0x000
+#define HDP_MUX			0x004
+#define HDP_VAL			0x010
+#define HDP_GPOSET		0x014
+#define HDP_GPOCLR		0x018
+#define HDP_GPOVAL		0x01c
+#define HDP_VERR		0x3f4
+#define HDP_IPIDR		0x3f8
+#define HDP_SIDR		0x3fc
+
+#define HDP_MUX_SHIFT(n)	((n) * 4)
+#define HDP_MUX_MASK(n)		(GENMASK(3, 0) << HDP_MUX_SHIFT(n))
+#define HDP_MUX_GPOVAL(n)	(0xf << HDP_MUX_SHIFT(n))
+
+#define HDP_PIN			8
+#define HDP_FUNC		16
+#define HDP_FUNC_TOTAL		(HDP_PIN * HDP_FUNC)
+
+struct stm32_hdp {
+	struct device *dev;
+	void __iomem *base;
+	struct clk *clk;
+	struct pinctrl_dev *pctl_dev;
+	struct gpio_chip gpio_chip;
+	u32 mux_conf;
+	u32 gposet_conf;
+	const char * const *func_name;
+};
+
+static const struct pinctrl_pin_desc stm32_hdp_pins[] = {
+	PINCTRL_PIN(0, "HDP0"),
+	PINCTRL_PIN(1, "HDP1"),
+	PINCTRL_PIN(2, "HDP2"),
+	PINCTRL_PIN(3, "HDP3"),
+	PINCTRL_PIN(4, "HDP4"),
+	PINCTRL_PIN(5, "HDP5"),
+	PINCTRL_PIN(6, "HDP6"),
+	PINCTRL_PIN(7, "HDP7"),
+};
+
+static const char * const func_name_mp13[] = {
+	//HDP0 functions:
+	"pwr_pwrwake_sys",
+	"pwr_stop_forbidden",
+	"pwr_stdby_wakeup",
+	"pwr_encomp_vddcore",
+	"bsec_out_sec_niden",
+	"aiec_sys_wakeup",
+	"none",
+	"none",
+	"ddrctrl_lp_req",
+	"pwr_ddr_ret_enable_n",
+	"dts_clk_ptat",
+	"none",
+	"sram3ctrl_tamp_erase_act",
+	"none",
+	"none",
+	"gpoval0",
+	//HDP1 functions:
+	"pwr_sel_vth_vddcpu",
+	"pwr_mpu_ram_lowspeed",
+	"ca7_naxierrirq",
+	"pwr_okin_mr",
+	"bsec_out_sec_dbgen",
+	"aiec_c1_wakeup",
+	"rcc_pwrds_mpu",
+	"none",
+	"ddrctrl_dfi_ctrlupd_req",
+	"ddrctrl_cactive_ddrc_asr",
+	"none",
+	"none",
+	"sram3ctrl_hw_erase_act",
+	"nic400_s0_bready",
+	"none",
+	"gpoval1",
+	//HDP2 functions:
+	"pwr_pwrwake_mpu",
+	"pwr_mpu_clock_disable_ack",
+	"ca7_ndbgreset_i",
+	"none",
+	"bsec_in_rstcore_n",
+	"bsec_out_sec_bsc_dis",
+	"none",
+	"none",
+	"ddrctrl_dfi_init_complete",
+	"ddrctrl_perf_op_is_refresh",
+	"ddrctrl_gskp_dfi_lp_req",
+	"none",
+	"sram3ctrl_sw_erase_act",
+	"nic400_s0_bvalid",
+	"none",
+	"gpoval2",
+	//HDP3 functions:
+	"pwr_sel_vth_vddcore",
+	"pwr_mpu_clock_disable_req",
+	"ca7_npmuirq0",
+	"ca7_nfiqout0",
+	"bsec_out_sec_dftlock",
+	"bsec_out_sec_jtag_dis",
+	"rcc_pwrds_sys",
+	"sram3ctrl_tamp_erase_req",
+	"ddrctrl_stat_ddrc_reg_selfref_type0",
+	"none",
+	"dts_valobus1_0",
+	"dts_valobus2_0",
+	"tamp_potential_tamp_erfcfg",
+	"nic400_s0_wready",
+	"nic400_s0_rready",
+	"gpoval3",
+	//HDP4 functions:
+	"none",
+	"pwr_stop2_active",
+	"ca7_nl2reset_i",
+	"ca7_npreset_varm_i",
+	"bsec_out_sec_dften",
+	"bsec_out_sec_dbgswenable",
+	"eth1_out_pmt_intr_o",
+	"eth2_out_pmt_intr_o",
+	"ddrctrl_stat_ddrc_reg_selfref_type1",
+	"ddrctrl_cactive_0",
+	"dts_valobus1_1",
+	"dts_valobus2_1",
+	"tamp_nreset_sram_ercfg",
+	"nic400_s0_wlast",
+	"nic400_s0_rlast",
+	"gpoval4",
+	//HDP5 functions:
+	"ca7_standbywfil2",
+	"pwr_vth_vddcore_ack",
+	"ca7_ncorereset_i",
+	"ca7_nirqout0",
+	"bsec_in_pwrok",
+	"bsec_out_sec_deviceen",
+	"eth1_out_lpi_intr_o",
+	"eth2_out_lpi_intr_o",
+	"ddrctrl_cactive_ddrc",
+	"ddrctrl_wr_credit_cnt",
+	"dts_valobus1_2",
+	"dts_valobus2_2",
+	"pka_pka_itamp_out",
+	"nic400_s0_wvalid",
+	"nic400_s0_rvalid",
+	"gpoval5",
+	//HDP6 functions:
+	"ca7_standbywfe0",
+	"pwr_vth_vddcpu_ack",
+	"ca7_evento",
+	"none",
+	"bsec_in_tamper_det",
+	"bsec_out_sec_spniden",
+	"eth1_out_mac_speed_o1",
+	"eth2_out_mac_speed_o1",
+	"ddrctrl_csysack_ddrc",
+	"ddrctrl_lpr_credit_cnt",
+	"dts_valobus1_3",
+	"dts_valobus2_3",
+	"saes_tamper_out",
+	"nic400_s0_awready",
+	"nic400_s0_arready",
+	"gpoval6",
+	//HDP7 functions:
+	"ca7_standbywfi0",
+	"pwr_rcc_vcpu_rdy",
+	"ca7_eventi",
+	"ca7_dbgack0",
+	"bsec_out_fuse_ok",
+	"bsec_out_sec_spiden",
+	"eth1_out_mac_speed_o0",
+	"eth2_out_mac_speed_o0",
+	"ddrctrl_csysreq_ddrc",
+	"ddrctrl_hpr_credit_cnt",
+	"dts_valobus1_4",
+	"dts_valobus2_4",
+	"rng_tamper_out",
+	"nic400_s0_awavalid",
+	"nic400_s0_aravalid",
+	"gpoval7",
+};
+
+static const char * const func_name_mp15[] = {
+	//HDP0 functions:
+	"pwr_pwrwake_sys",
+	"cm4_sleepdeep",
+	"pwr_stdby_wkup",
+	"pwr_encomp_vddcore",
+	"bsec_out_sec_niden",
+	"none",
+	"rcc_cm4_sleepdeep",
+	"gpu_dbg7",
+	"ddrctrl_lp_req",
+	"pwr_ddr_ret_enable_n",
+	"dts_clk_ptat",
+	"none",
+	"none",
+	"none",
+	"none",
+	"gpoval0",
+	//HDP1 functions:
+	"pwr_pwrwake_mcu",
+	"cm4_halted",
+	"ca7_naxierrirq",
+	"pwr_okin_mr",
+	"bsec_out_sec_dbgen",
+	"exti_sys_wakeup",
+	"rcc_pwrds_mpu",
+	"gpu_dbg6",
+	"ddrctrl_dfi_ctrlupd_req",
+	"ddrctrl_cactive_ddrc_asr",
+	"none",
+	"none",
+	"none",
+	"none",
+	"none",
+	"gpoval1",
+	//HDP2 functions:
+	"pwr_pwrwake_mpu",
+	"cm4_rxev",
+	"ca7_npmuirq1",
+	"ca7_nfiqout1",
+	"bsec_in_rstcore_n",
+	"exti_c2_wakeup",
+	"rcc_pwrds_mcu",
+	"gpu_dbg5",
+	"ddrctrl_dfi_init_complete",
+	"ddrctrl_perf_op_is_refresh",
+	"ddrctrl_gskp_dfi_lp_req",
+	"none",
+	"none",
+	"none",
+	"none",
+	"gpoval2",
+	//HDP3 functions:
+	"pwr_sel_vth_vddcore",
+	"cm4_txev",
+	"ca7_npmuirq0",
+	"ca7_nfiqout0",
+	"bsec_out_sec_dftlock",
+	"exti_c1_wakeup",
+	"rcc_pwrds_sys",
+	"gpu_dbg4",
+	"ddrctrl_stat_ddrc_reg_selfref_type0",
+	"ddrctrl_cactive_1",
+	"dts_valobus1_0",
+	"dts_valobus2_0",
+	"none",
+	"none",
+	"none",
+	"gpoval3",
+	//HDP4 functions:
+	"pwr_mpu_pdds_not_cstbydis",
+	"cm4_sleeping",
+	"ca7_nreset1",
+	"ca7_nirqout1",
+	"bsec_out_sec_dften",
+	"bsec_out_sec_dbgswenable",
+	"eth_out_pmt_intr_o",
+	"gpu_dbg3",
+	"ddrctrl_stat_ddrc_reg_selfref_type1",
+	"ddrctrl_cactive_0",
+	"dts_valobus1_1",
+	"dts_valobus2_1",
+	"none",
+	"none",
+	"none",
+	"gpoval4",
+	//HDP5 functions:
+	"ca7_standbywfil2",
+	"pwr_vth_vddcore_ack",
+	"ca7_nreset0",
+	"ca7_nirqout0",
+	"bsec_in_pwrok",
+	"bsec_out_sec_deviceen",
+	"eth_out_lpi_intr_o",
+	"gpu_dbg2",
+	"ddrctrl_cactive_ddrc",
+	"ddrctrl_wr_credit_cnt",
+	"dts_valobus1_2",
+	"dts_valobus2_2",
+	"none",
+	"none",
+	"none",
+	"gpoval5",
+	//HDP6 functions:
+	"ca7_standbywfi1",
+	"ca7_standbywfe1",
+	"ca7_evento",
+	"ca7_dbgack1",
+	"none",
+	"bsec_out_sec_spniden",
+	"eth_out_mac_speed_o1",
+	"gpu_dbg1",
+	"ddrctrl_csysack_ddrc",
+	"ddrctrl_lpr_credit_cnt",
+	"dts_valobus1_3",
+	"dts_valobus2_3",
+	"none",
+	"none",
+	"none",
+	"gpoval6",
+	//HDP7 functions:
+	"ca7_standbywfi0",
+	"ca7_standbywfe0",
+	"none",
+	"ca7_dbgack0",
+	"bsec_out_fuse_ok",
+	"bsec_out_sec_spiden",
+	"eth_out_mac_speed_o0",
+	"gpu_dbg0",
+	"ddrctrl_csysreq_ddrc",
+	"ddrctrl_hpr_credit_cnt",
+	"dts_valobus1_4",
+	"dts_valobus2_4",
+	"none",
+	"none",
+	"none",
+	"gpoval7"
+};
+
+static const char * const func_name_mp25[] = {
+	//HDP0 functions:
+	"pwr_pwrwake_sys",
+	"cpu2_sleep_deep",
+	"bsec_out_tst_sdr_unlock_or_disable_scan",
+	"bsec_out_nidenm",
+	"bsec_out_nidena",
+	"cpu2_state_0",
+	"rcc_pwrds_sys",
+	"gpu_dbg7",
+	"ddrss_csysreq_ddrc",
+	"ddrss_dfi_phyupd_req",
+	"cpu3_sleep_deep",
+	"d2_gbl_per_clk_bus_req",
+	"pcie_usb_cxpl_debug_info_ei_0",
+	"pcie_usb_cxpl_debug_info_ei_8",
+	"d3_state_0",
+	"gpoval0",
+	//HDP1 functions:
+	"pwr_pwrwake_cpu2",
+	"cpu2_halted",
+	"cpu2_state_1",
+	"bsec_out_dbgenm",
+	"bsec_out_dbgena",
+	"exti1_sys_wakeup",
+	"rcc_pwrds_cpu2",
+	"gpu_dbg6",
+	"ddrss_csysack_ddrc",
+	"ddrss_dfi_phymstr_req",
+	"cpu3_halted",
+	"d2_gbl_per_dma_req",
+	"pcie_usb_cxpl_debug_info_ei_1",
+	"pcie_usb_cxpl_debug_info_ei_9",
+	"d3_state_1",
+	"gpoval1",
+	//HDP2 functions:
+	"pwr_pwrwake_cpu1",
+	"cpu2_rxev",
+	"cpu1_npumirq1",
+	"cpu1_nfiqout1",
+	"bsec_out_shdbgen",
+	"exti1_cpu2_wakeup",
+	"rcc_pwrds_cpu1",
+	"gpu_dbg5",
+	"ddrss_cactive_ddrc",
+	"ddrss_dfi_lp_req",
+	"cpu3_rxev",
+	"hpdma1_clk_bus_req",
+	"pcie_usb_cxpl_debug_info_ei_2",
+	"pcie_usb_cxpl_debug_info_ei_10",
+	"d3_state_2",
+	"gpoval2",
+	//HDP3 functions:
+	"pwr_sel_vth_vddcpu",
+	"cpu2_txev",
+	"cpu1_npumirq0",
+	"cpu1_nfiqout0",
+	"bsec_out_ddbgen",
+	"exti1_cpu1_wakeup",
+	"cpu3_state_0",
+	"gpu_dbg4",
+	"ddrss_mcdcg_en",
+	"ddrss_dfi_freq_0",
+	"cpu3_txev",
+	"hpdma2_clk_bus_req",
+	"pcie_usb_cxpl_debug_info_ei_3",
+	"pcie_usb_cxpl_debug_info_ei_11",
+	"d1_state_0",
+	"gpoval3",
+	//HDP4 functions:
+	"pwr_sel_vth_vddcore",
+	"cpu2_sleeping",
+	"cpu1_evento",
+	"cpu1_nirqout1",
+	"bsec_out_spnidena",
+	"exti2_d3_wakeup",
+	"eth1_out_pmt_intr_o",
+	"gpu_dbg3",
+	"ddrss_dphycg_en",
+	"ddrss_obsp0",
+	"cpu3_sleeping",
+	"hpdma3_clk_bus_req",
+	"pcie_usb_cxpl_debug_info_ei_4",
+	"pcie_usb_cxpl_debug_info_ei_12",
+	"d1_state_1",
+	"gpoval4",
+	//HDP5 functions:
+	"cpu1_standby_wfil2",
+	"none",
+	"none",
+	"cpu1_nirqout0",
+	"bsec_out_spidena",
+	"exti2_cpu3_wakeup",
+	"eth1_out_lpi_intr_o",
+	"gpu_dbg2",
+	"ddrctrl_dfi_init_start",
+	"ddrss_obsp1",
+	"cpu3_state_1",
+	"d3_gbl_per_clk_bus_req",
+	"pcie_usb_cxpl_debug_info_ei_5",
+	"pcie_usb_cxpl_debug_info_ei_13",
+	"d1_state_2",
+	"gpoval5",
+	//HDP6 functions:
+	"cpu1_standby_wfi1",
+	"cpu1_standby_wfe1",
+	"cpu1_halted1",
+	"cpu1_naxierrirq",
+	"bsec_out_spnidenm",
+	"exti2_cpu2_wakeup",
+	"eth2_out_pmt_intr_o",
+	"gpu_dbg1",
+	"ddrss_dfi_init_complete",
+	"ddrss_obsp2",
+	"d2_state_0",
+	"d3_gbl_per_dma_req",
+	"pcie_usb_cxpl_debug_info_ei_6",
+	"pcie_usb_cxpl_debug_info_ei_14",
+	"cpu1_state_0",
+	"gpoval6",
+	//HDP7 functions:
+	"cpu1_standby_wfi0",
+	"cpu1_standby_wfe0",
+	"cpu1_halted0",
+	"none",
+	"bsec_out_spidenm",
+	"exti2_cpu1__wakeup",
+	"eth2_out_lpi_intr_o",
+	"gpu_dbg0",
+	"ddrss_dfi_ctrlupd_req",
+	"ddrss_obsp3",
+	"d2_state_1",
+	"lpdma1_clk_bus_req",
+	"pcie_usb_cxpl_debug_info_ei_7",
+	"pcie_usb_cxpl_debug_info_ei_15",
+	"cpu1_state_1",
+	"gpoval7",
+};
+
+static const char * const stm32_hdp_pins_group[] = {
+	"HDP0",
+	"HDP1",
+	"HDP2",
+	"HDP3",
+	"HDP4",
+	"HDP5",
+	"HDP6",
+	"HDP7"
+};
+
+static int stm32_hdp_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int stm32_hdp_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(stm32_hdp_pins);
+}
+
+static const char *stm32_hdp_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						    unsigned int selector)
+{
+	return stm32_hdp_pins[selector].name;
+}
+
+static int stm32_hdp_pinctrl_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+					    const unsigned int **pins, unsigned int *num_pins)
+{
+	*pins = &stm32_hdp_pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops stm32_hdp_pinctrl_ops = {
+	.get_groups_count = stm32_hdp_pinctrl_get_groups_count,
+	.get_group_name	  = stm32_hdp_pinctrl_get_group_name,
+	.get_group_pins	  = stm32_hdp_pinctrl_get_group_pins,
+	.dt_node_to_map	  = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map	  = pinconf_generic_dt_free_map,
+};
+
+static int stm32_hdp_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return HDP_FUNC_TOTAL;
+}
+
+static const char *stm32_hdp_pinmux_get_function_name(struct pinctrl_dev *pctldev,
+							  unsigned int selector)
+{
+	struct stm32_hdp *hdp = pinctrl_dev_get_drvdata(pctldev);
+
+	return hdp->func_name[selector];
+}
+
+static int stm32_hdp_pinmux_get_function_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+						const char *const **groups,
+						unsigned int *num_groups)
+{
+	u32 index = selector / HDP_FUNC;
+
+	*groups = &stm32_hdp_pins[index].name;
+	*num_groups = 1;
+
+	return 0;
+}
+
+static int stm32_hdp_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+				    unsigned int group_selector)
+{
+	struct stm32_hdp *hdp = pinctrl_dev_get_drvdata(pctldev);
+
+	unsigned int pin = stm32_hdp_pins[group_selector].number;
+	u32 mux;
+
+	func_selector %= HDP_FUNC;
+	mux = readl_relaxed(hdp->base + HDP_MUX);
+	mux &= ~HDP_MUX_MASK(pin);
+	mux |= func_selector << HDP_MUX_SHIFT(pin);
+
+	writel_relaxed(mux, hdp->base + HDP_MUX);
+	hdp->mux_conf = mux;
+
+	return 0;
+}
+
+static const struct pinmux_ops stm32_hdp_pinmux_ops = {
+	.get_functions_count = stm32_hdp_pinmux_get_functions_count,
+	.get_function_name   = stm32_hdp_pinmux_get_function_name,
+	.get_function_groups = stm32_hdp_pinmux_get_function_groups,
+	.set_mux	     = stm32_hdp_pinmux_set_mux,
+	.gpio_set_direction  = NULL,
+};
+
+static struct pinctrl_desc stm32_hdp_pdesc = {
+	.name	 = DRIVER_NAME,
+	.pins	 = stm32_hdp_pins,
+	.npins	 = ARRAY_SIZE(stm32_hdp_pins),
+	.pctlops = &stm32_hdp_pinctrl_ops,
+	.pmxops	 = &stm32_hdp_pinmux_ops,
+	.owner	 = THIS_MODULE,
+};
+
+static const struct of_device_id stm32_hdp_of_match[] = {
+	{
+		.compatible = "st,stm32mp131-hdp",
+		.data = &func_name_mp13,
+	},
+	{
+		.compatible = "st,stm32mp151-hdp",
+		.data = &func_name_mp15,
+	},
+	{
+		.compatible = "st,stm32mp251-hdp",
+		.data = &func_name_mp25,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
+
+static int stm32_hdp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct stm32_hdp *hdp;
+	u8 version;
+	int err;
+
+	hdp = devm_kzalloc(dev, sizeof(*hdp), GFP_KERNEL);
+	if (!hdp)
+		return -ENOMEM;
+	hdp->dev = dev;
+
+	platform_set_drvdata(pdev, hdp);
+
+	hdp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdp->base))
+		return PTR_ERR(hdp->base);
+
+	hdp->func_name = of_device_get_match_data(dev);
+	if (!hdp->func_name)
+		return dev_err_probe(dev, -ENODEV, "No function name provided\n");
+
+	hdp->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(hdp->clk))
+		return dev_err_probe(dev, PTR_ERR(hdp->clk), "No HDP clock provided\n");
+
+	err = devm_pinctrl_register_and_init(dev, &stm32_hdp_pdesc, hdp, &hdp->pctl_dev);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to register pinctrl\n");
+
+	err = pinctrl_enable(hdp->pctl_dev);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to enable pinctrl\n");
+
+	hdp->gpio_chip.get_direction = stm32_hdp_gpio_get_direction;
+	hdp->gpio_chip.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
+	hdp->gpio_chip.can_sleep     = true;
+	hdp->gpio_chip.names	     = stm32_hdp_pins_group;
+
+	err = bgpio_init(&hdp->gpio_chip, dev, 4,
+			 hdp->base + HDP_GPOVAL,
+			 hdp->base + HDP_GPOSET,
+			 hdp->base + HDP_GPOCLR,
+			 NULL, NULL, BGPIOF_NO_INPUT);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to init bgpio\n");
+
+
+	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip, hdp);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to add gpiochip\n");
+
+	writel_relaxed(HDP_CTRL_ENABLE, hdp->base + HDP_CTRL);
+
+	version = readl_relaxed(hdp->base + HDP_VERR);
+	dev_dbg(dev, "STM32 HDP version %u.%u initialized\n", version >> 4, version & 0x0f);
+
+	return 0;
+}
+
+static void stm32_hdp_remove(struct platform_device *pdev)
+{
+	struct stm32_hdp *hdp = platform_get_drvdata(pdev);
+
+	writel_relaxed(HDP_CTRL_DISABLE, hdp->base + HDP_CTRL);
+}
+
+static int stm32_hdp_suspend(struct device *dev)
+{
+	struct stm32_hdp *hdp = dev_get_drvdata(dev);
+
+	hdp->gposet_conf = readl_relaxed(hdp->base + HDP_GPOSET);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	clk_disable_unprepare(hdp->clk);
+
+	return 0;
+}
+
+static int stm32_hdp_resume(struct device *dev)
+{
+	struct stm32_hdp *hdp = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(hdp->clk);
+	if (err) {
+		dev_err(dev, "Failed to prepare_enable clk (%d)\n", err);
+		return err;
+	}
+
+	writel_relaxed(HDP_CTRL_ENABLE, hdp->base + HDP_CTRL);
+	writel_relaxed(hdp->gposet_conf, hdp->base + HDP_GPOSET);
+	writel_relaxed(hdp->mux_conf, hdp->base + HDP_MUX);
+
+	pinctrl_pm_select_default_state(dev);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(stm32_hdp_pm_ops, stm32_hdp_suspend, stm32_hdp_resume);
+
+static struct platform_driver stm32_hdp_driver = {
+	.probe = stm32_hdp_probe,
+	.remove = stm32_hdp_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.pm = pm_sleep_ptr(&stm32_hdp_pm_ops),
+		.of_match_table = stm32_hdp_of_match,
+	}
+};
+
+module_platform_driver(stm32_hdp_driver);
+
+MODULE_AUTHOR("Clément Le Goffic");
+MODULE_DESCRIPTION("STMicroelectronics STM32 Hardware Debug Port driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


