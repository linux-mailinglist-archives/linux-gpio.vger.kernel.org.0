Return-Path: <linux-gpio+bounces-10064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 349AC977F7E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 14:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8903FB26C98
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 12:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DFF1DA611;
	Fri, 13 Sep 2024 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I9BuDI4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695E1DA0FA;
	Fri, 13 Sep 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229639; cv=none; b=i/NXiBSgLoACv87S2Z4SXn9tMh3nHTwvwmhiJZ9WtXGxDu784qHIuz2kn3DhpCZJ7QytVPoaiIdk959b1LAqYdkxZ9IJRg5CtsHwdYH6Hm4i7Cnq/WQ+p0TaLdv2AGdhp209RAtrN0URyAI8f0VLatAOErVquJb1AUwEjigKTFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229639; c=relaxed/simple;
	bh=+ZIXCq6A4nxrzKI8V+J7gS9b4xDHQb8iuBYTt3Uelio=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bw0QoITktfvPJ0epw/y0xzy6Gwd6YlqEzFKpVe4cJ9MPiwsZWMRDDtzjR9zIV/u76b7aQ+X2TslD7oSjSIQxIImsXTwZ8Bq4v67/bdFHcM2zFoeW+CpTHUQtT2D2sNMRn1lHgXvmGpK3cpDRKs47+NhgO+4vTetdpIIu0SRUvVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I9BuDI4a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DALf9U004982;
	Fri, 13 Sep 2024 12:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhed4b1szWWrjjVk7km5pjx8J7D0XdGQZmQ+JRngnwg=; b=I9BuDI4avvXOX+IM
	chHN4QhQ1kTkQ1XCS5P8vwIuwpbO2SqMyXSzUghadNO4Lo0IHsaCbD36B2DpC7Pe
	3xFv88xJZf8gEA5EXnpty1kxMqg0MgNETRmoWiUmlONTrozibOJAnbDXRxXeQNeF
	iYvsqBzC79gb/COaWAa7S9Hht8SHoyDbkYixVdLj7nusKZyHPzKua3bNqvMpOBEr
	GMrlbWO1nLg73T9b8WWnyI1X04fpKAX38UtQHvFGtvrC/m/Nw+yx5S+bCx4U+V01
	z6Y0MELCeobby5azHtZzHiip7KbvmWzSqRd3nXH4xnL3fKMpChfz01nQpzv+PjWC
	kJjkoA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy738t3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:13:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DCDeUe031498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:13:40 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 05:13:33 -0700
From: Sricharan R <quic_srichara@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH 4/8] pinctrl: qcom: Introduce IPQ5424 TLMM driver
Date: Fri, 13 Sep 2024 17:42:46 +0530
Message-ID: <20240913121250.2995351-5-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913121250.2995351-1-quic_srichara@quicinc.com>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RlGDjT0FqslbMJ3NpR-cdpfZeHEmp42H
X-Proofpoint-GUID: RlGDjT0FqslbMJ3NpR-cdpfZeHEmp42H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130085

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The IPQ5424 SoC comes with a TLMM block, like all other Qualcomm
platforms, so add a driver for it.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 drivers/pinctrl/qcom/Kconfig.msm       |   9 +
 drivers/pinctrl/qcom/Makefile          |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq5424.c | 792 +++++++++++++++++++++++++
 3 files changed, 802 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq5424.c

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 8fe459d082ed..9738448f2a8a 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -46,6 +46,15 @@ config PINCTRL_IPQ5332
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
 	  Technologies Inc IPQ5332 platform.
 
+config PINCTRL_IPQ5424
+	tristate "Qualcomm Technologies, Inc. IPQ5424 pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
+          the Qualcomm Technologies Inc. TLMM block found on the
+          Qualcomm Technologies Inc. IPQ5424 platform. Select this for
+          IPQ5424.
+
 config PINCTRL_IPQ8074
 	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index eb04297b6388..5b4712146db5 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_IPQ4019)	+= pinctrl-ipq4019.o
 obj-$(CONFIG_PINCTRL_IPQ5018)	+= pinctrl-ipq5018.o
 obj-$(CONFIG_PINCTRL_IPQ8064)	+= pinctrl-ipq8064.o
 obj-$(CONFIG_PINCTRL_IPQ5332)	+= pinctrl-ipq5332.o
+obj-$(CONFIG_PINCTRL_IPQ5424)	+= pinctrl-ipq5424.o
 obj-$(CONFIG_PINCTRL_IPQ8074)	+= pinctrl-ipq8074.o
 obj-$(CONFIG_PINCTRL_IPQ6018)	+= pinctrl-ipq6018.o
 obj-$(CONFIG_PINCTRL_IPQ9574)	+= pinctrl-ipq9574.o
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5424.c b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
new file mode 100644
index 000000000000..796299cd2e4e
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
@@ -0,0 +1,792 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2016-2018,2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-msm.h"
+
+#define REG_SIZE 0x1000
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
+	{					        \
+		.grp = PINCTRL_PINGROUP("gpio" #id,     \
+			gpio##id##_pins,                \
+			ARRAY_SIZE(gpio##id##_pins)),   \
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
+		.ctl_reg = REG_SIZE * id,	        \
+		.io_reg = 0x4 + REG_SIZE * id,		\
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
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
+		.intr_target_kpss_val = 3,      \
+		.intr_raw_status_bit = 4,	\
+		.intr_polarity_bit = 1,		\
+		.intr_detection_bit = 2,	\
+		.intr_detection_width = 2,	\
+	}
+
+static const struct pinctrl_pin_desc ipq5424_pins[] = {
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
+
+enum ipq5424_functions {
+	msm_mux_atest_char,
+	msm_mux_atest_char0,
+	msm_mux_atest_char1,
+	msm_mux_atest_char2,
+	msm_mux_atest_char3,
+	msm_mux_atest_tic,
+	msm_mux_audio_pri,
+	msm_mux_audio_pri0,
+	msm_mux_audio_pri1,
+	msm_mux_audio_sec,
+	msm_mux_audio_sec0,
+	msm_mux_audio_sec1,
+	msm_mux_core_voltage,
+	msm_mux_cri_trng0,
+	msm_mux_cri_trng1,
+	msm_mux_cri_trng2,
+	msm_mux_cri_trng3,
+	msm_mux_cxc_clk,
+	msm_mux_cxc_data,
+	msm_mux_dbg_out,
+	msm_mux_gcc_plltest,
+	msm_mux_gcc_tlmm,
+	msm_mux_gpio,
+	msm_mux_i2c0_scl,
+	msm_mux_i2c0_sda,
+	msm_mux_i2c1_scl,
+	msm_mux_i2c1_sda,
+	msm_mux_i2c11,
+	msm_mux_mac0,
+	msm_mux_mac1,
+	msm_mux_mdc_mst,
+	msm_mux_mdc_slv,
+	msm_mux_mdio_mst,
+	msm_mux_mdio_slv,
+	msm_mux_pcie0_clk,
+	msm_mux_pcie0_wake,
+	msm_mux_pcie1_clk,
+	msm_mux_pcie1_wake,
+	msm_mux_pcie2_clk,
+	msm_mux_pcie2_wake,
+	msm_mux_pcie3_clk,
+	msm_mux_pcie3_wake,
+	msm_mux_pll_test,
+	msm_mux_prng_rosc0,
+	msm_mux_prng_rosc1,
+	msm_mux_prng_rosc2,
+	msm_mux_prng_rosc3,
+	msm_mux_PTA0_0,
+	msm_mux_PTA0_1,
+	msm_mux_PTA0_2,
+	msm_mux_PTA10,
+	msm_mux_PTA11,
+	msm_mux_pwm0,
+	msm_mux_pwm1,
+	msm_mux_pwm2,
+	msm_mux_qdss_cti_trig_in_a0,
+	msm_mux_qdss_cti_trig_out_a0,
+	msm_mux_qdss_cti_trig_in_a1,
+	msm_mux_qdss_cti_trig_out_a1,
+	msm_mux_qdss_cti_trig_in_b0,
+	msm_mux_qdss_cti_trig_out_b0,
+	msm_mux_qdss_cti_trig_in_b1,
+	msm_mux_qdss_cti_trig_out_b1,
+	msm_mux_qdss_traceclk_a,
+	msm_mux_qdss_tracectl_a,
+	msm_mux_qdss_tracedata_a,
+	msm_mux_qspi_clk,
+	msm_mux_qspi_cs,
+	msm_mux_qspi_data,
+	msm_mux_resout,
+	msm_mux_rx0,
+	msm_mux_rx1,
+	msm_mux_rx2,
+	msm_mux_sdc_clk,
+	msm_mux_sdc_cmd,
+	msm_mux_sdc_data,
+	msm_mux_spi0,
+	msm_mux_spi1,
+	msm_mux_spi10,
+	msm_mux_spi11,
+	msm_mux_tsens_max,
+	msm_mux_uart0,
+	msm_mux_uart1,
+	msm_mux_wci_txd,
+	msm_mux_wci_rxd,
+	msm_mux_wsi_clk,
+	msm_mux_wsi_data,
+	msm_mux__,
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
+};
+
+static const char * const sdc_data_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char * const qspi_data_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char * const pwm2_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char * const wci_txd_groups[] = {
+	"gpio0", "gpio1", "gpio8", "gpio10", "gpio11", "gpio40", "gpio41",
+};
+
+static const char * const wci_rxd_groups[] = {
+	"gpio0", "gpio1", "gpio8", "gpio10", "gpio11", "gpio40", "gpio41",
+};
+
+static const char * const sdc_cmd_groups[] = {
+	"gpio4",
+};
+
+static const char * const qspi_cs_groups[] = {
+	"gpio4",
+};
+
+static const char * const qdss_cti_trig_out_a1_groups[] = {
+	"gpio27",
+};
+
+static const char * const sdc_clk_groups[] = {
+	"gpio5",
+};
+
+static const char * const qspi_clk_groups[] = {
+	"gpio5",
+};
+
+static const char * const spi0_groups[] = {
+	"gpio6", "gpio7", "gpio8", "gpio9",
+};
+
+static const char * const pwm1_groups[] = {
+	"gpio6", "gpio7", "gpio8", "gpio9",
+};
+
+static const char * const cri_trng0_groups[] = {
+	"gpio6",
+};
+
+static const char * const qdss_tracedata_a_groups[] = {
+	"gpio6", "gpio7", "gpio8", "gpio9", "gpio10", "gpio11", "gpio12",
+	"gpio13", "gpio14", "gpio15", "gpio20", "gpio21", "gpio36", "gpio37",
+	"gpio38", "gpio39",
+};
+
+static const char * const cri_trng1_groups[] = {
+	"gpio7",
+};
+
+static const char * const cri_trng2_groups[] = {
+	"gpio8",
+};
+
+static const char * const cri_trng3_groups[] = {
+	"gpio9",
+};
+
+static const char * const uart0_groups[] = {
+	"gpio10", "gpio11", "gpio12", "gpio13",
+};
+
+static const char * const pwm0_groups[] = {
+	"gpio10", "gpio11", "gpio12", "gpio13",
+};
+
+static const char * const prng_rosc0_groups[] = {
+	"gpio12",
+};
+
+static const char * const prng_rosc1_groups[] = {
+	"gpio13",
+};
+
+static const char * const i2c0_scl_groups[] = {
+	"gpio14",
+};
+
+static const char * const tsens_max_groups[] = {
+	"gpio14",
+};
+
+static const char * const prng_rosc2_groups[] = {
+	"gpio14",
+};
+
+static const char * const i2c0_sda_groups[] = {
+	"gpio15",
+};
+
+static const char * const prng_rosc3_groups[] = {
+	"gpio15",
+};
+
+static const char * const core_voltage_groups[] = {
+	"gpio16", "gpio17",
+};
+
+static const char * const i2c1_scl_groups[] = {
+	"gpio16",
+};
+
+static const char * const i2c1_sda_groups[] = {
+	"gpio17",
+};
+
+static const char * const mdc_slv_groups[] = {
+	"gpio20",
+};
+
+static const char * const atest_char0_groups[] = {
+	"gpio20",
+};
+
+static const char * const mdio_slv_groups[] = {
+	"gpio21",
+};
+
+static const char * const atest_char1_groups[] = {
+	"gpio21",
+};
+
+static const char * const mdc_mst_groups[] = {
+	"gpio22",
+};
+
+static const char * const atest_char2_groups[] = {
+	"gpio22",
+};
+
+static const char * const mdio_mst_groups[] = {
+	"gpio23",
+};
+
+static const char * const atest_char3_groups[] = {
+	"gpio23",
+};
+
+static const char * const pcie0_clk_groups[] = {
+	"gpio24",
+};
+
+static const char * const PTA10_groups[] = {
+	"gpio24", "gpio26", "gpio27",
+};
+
+static const char * const mac0_groups[] = {
+	"gpio24", "gpio26",
+};
+
+static const char * const atest_char_groups[] = {
+	"gpio24",
+};
+
+static const char * const pcie0_wake_groups[] = {
+	"gpio26",
+};
+
+static const char * const pcie1_clk_groups[] = {
+	"gpio27",
+};
+
+static const char * const i2c11_groups[] = {
+	"gpio27", "gpio29",
+};
+
+static const char * const pcie1_wake_groups[] = {
+	"gpio29",
+};
+
+static const char * const pcie2_clk_groups[] = {
+	"gpio30",
+};
+
+static const char * const mac1_groups[] = {
+	"gpio30", "gpio32",
+};
+
+static const char * const pcie2_wake_groups[] = {
+	"gpio32",
+};
+
+static const char * const PTA11_groups[] = {
+	"gpio30", "gpio32", "gpio33",
+};
+
+static const char * const audio_pri0_groups[] = {
+	"gpio32", "gpio32",
+};
+
+static const char * const pcie3_clk_groups[] = {
+	"gpio33",
+};
+
+static const char * const audio_pri1_groups[] = {
+	"gpio33", "gpio33",
+};
+
+static const char * const pcie3_wake_groups[] = {
+	"gpio35",
+};
+
+static const char * const audio_sec1_groups[] = {
+	"gpio35", "gpio35",
+};
+
+static const char * const audio_pri_groups[] = {
+	"gpio36", "gpio37", "gpio38", "gpio39",
+};
+
+static const char * const spi1_groups[] = {
+	"gpio11", "gpio36", "gpio37", "gpio38", "gpio46",
+};
+
+static const char * const audio_sec0_groups[] = {
+	"gpio36", "gpio36",
+};
+
+static const char * const rx1_groups[] = {
+	"gpio38", "gpio46",
+};
+
+static const char * const pll_test_groups[] = {
+	"gpio38",
+};
+
+static const char * const dbg_out_groups[] = {
+	"gpio46",
+};
+
+static const char * const PTA0_0_groups[] = {
+	"gpio40",
+};
+
+static const char * const atest_tic_groups[] = {
+	"gpio40",
+};
+
+static const char * const PTA0_1_groups[] = {
+	"gpio41",
+};
+
+static const char * const cxc_data_groups[] = {
+	"gpio41",
+};
+
+static const char * const PTA0_2_groups[] = {
+	"gpio42",
+};
+
+static const char * const cxc_clk_groups[] = {
+	"gpio42",
+};
+
+static const char * const uart1_groups[] = {
+	"gpio43", "gpio44",
+};
+
+static const char * const audio_sec_groups[] = {
+	"gpio45", "gpio46", "gpio47", "gpio48",
+};
+
+static const char * const gcc_plltest_groups[] = {
+	"gpio43", "gpio45",
+};
+
+static const char * const gcc_tlmm_groups[] = {
+	"gpio44",
+};
+
+static const char * const qdss_cti_trig_out_b1_groups[] = {
+	"gpio33",
+};
+
+static const char * const rx0_groups[] = {
+	"gpio39", "gpio47",
+};
+
+static const char * const qdss_traceclk_a_groups[] = {
+	"gpio45",
+};
+
+static const char * const qdss_tracectl_a_groups[] = {
+	"gpio46",
+};
+
+static const char * const qdss_cti_trig_out_a0_groups[] = {
+	"gpio24",
+};
+
+static const char * const qdss_cti_trig_in_a0_groups[] = {
+	"gpio26",
+};
+
+static const char * const resout_groups[] = {
+	"gpio49",
+};
+
+static const char * const qdss_cti_trig_in_a1_groups[] = {
+	"gpio29",
+};
+
+static const char * const qdss_cti_trig_out_b0_groups[] = {
+	"gpio30",
+};
+
+static const char * const qdss_cti_trig_in_b0_groups[] = {
+	"gpio32",
+};
+
+static const char * const qdss_cti_trig_in_b1_groups[] = {
+	"gpio35",
+};
+
+static const char * const spi10_groups[] = {
+	"gpio45", "gpio47", "gpio48",
+};
+
+static const char * const spi11_groups[] = {
+	"gpio10", "gpio12", "gpio13",
+};
+
+static const char * const wsi_clk_groups[] = {
+	"gpio24", "gpio27",
+};
+
+static const char * const wsi_data_groups[] = {
+	"gpio26", "gpio29",
+};
+
+static const char * const rx2_groups[] = {
+	"gpio37", "gpio45",
+};
+
+static const struct pinfunction ipq5424_functions[] = {
+	MSM_PIN_FUNCTION(atest_char),
+	MSM_PIN_FUNCTION(atest_char0),
+	MSM_PIN_FUNCTION(atest_char1),
+	MSM_PIN_FUNCTION(atest_char2),
+	MSM_PIN_FUNCTION(atest_char3),
+	MSM_PIN_FUNCTION(atest_tic),
+	MSM_PIN_FUNCTION(audio_pri),
+	MSM_PIN_FUNCTION(audio_pri0),
+	MSM_PIN_FUNCTION(audio_pri1),
+	MSM_PIN_FUNCTION(audio_sec),
+	MSM_PIN_FUNCTION(audio_sec0),
+	MSM_PIN_FUNCTION(audio_sec1),
+	MSM_PIN_FUNCTION(core_voltage),
+	MSM_PIN_FUNCTION(cri_trng0),
+	MSM_PIN_FUNCTION(cri_trng1),
+	MSM_PIN_FUNCTION(cri_trng2),
+	MSM_PIN_FUNCTION(cri_trng3),
+	MSM_PIN_FUNCTION(cxc_clk),
+	MSM_PIN_FUNCTION(cxc_data),
+	MSM_PIN_FUNCTION(dbg_out),
+	MSM_PIN_FUNCTION(gcc_plltest),
+	MSM_PIN_FUNCTION(gcc_tlmm),
+	MSM_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(i2c0_scl),
+	MSM_PIN_FUNCTION(i2c0_sda),
+	MSM_PIN_FUNCTION(i2c1_scl),
+	MSM_PIN_FUNCTION(i2c1_sda),
+	MSM_PIN_FUNCTION(i2c11),
+	MSM_PIN_FUNCTION(mac0),
+	MSM_PIN_FUNCTION(mac1),
+	MSM_PIN_FUNCTION(mdc_mst),
+	MSM_PIN_FUNCTION(mdc_slv),
+	MSM_PIN_FUNCTION(mdio_mst),
+	MSM_PIN_FUNCTION(mdio_slv),
+	MSM_PIN_FUNCTION(pcie0_clk),
+	MSM_PIN_FUNCTION(pcie0_wake),
+	MSM_PIN_FUNCTION(pcie1_clk),
+	MSM_PIN_FUNCTION(pcie1_wake),
+	MSM_PIN_FUNCTION(pcie2_clk),
+	MSM_PIN_FUNCTION(pcie2_wake),
+	MSM_PIN_FUNCTION(pcie3_clk),
+	MSM_PIN_FUNCTION(pcie3_wake),
+	MSM_PIN_FUNCTION(pll_test),
+	MSM_PIN_FUNCTION(prng_rosc0),
+	MSM_PIN_FUNCTION(prng_rosc1),
+	MSM_PIN_FUNCTION(prng_rosc2),
+	MSM_PIN_FUNCTION(prng_rosc3),
+	MSM_PIN_FUNCTION(PTA0_0),
+	MSM_PIN_FUNCTION(PTA0_1),
+	MSM_PIN_FUNCTION(PTA0_2),
+	MSM_PIN_FUNCTION(PTA10),
+	MSM_PIN_FUNCTION(PTA11),
+	MSM_PIN_FUNCTION(pwm0),
+	MSM_PIN_FUNCTION(pwm1),
+	MSM_PIN_FUNCTION(pwm2),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_a0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_a0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_a1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_a1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_b0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_b0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_b1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_b1),
+	MSM_PIN_FUNCTION(qdss_traceclk_a),
+	MSM_PIN_FUNCTION(qdss_tracectl_a),
+	MSM_PIN_FUNCTION(qdss_tracedata_a),
+	MSM_PIN_FUNCTION(qspi_clk),
+	MSM_PIN_FUNCTION(qspi_cs),
+	MSM_PIN_FUNCTION(qspi_data),
+	MSM_PIN_FUNCTION(resout),
+	MSM_PIN_FUNCTION(rx0),
+	MSM_PIN_FUNCTION(rx1),
+	MSM_PIN_FUNCTION(rx2),
+	MSM_PIN_FUNCTION(sdc_clk),
+	MSM_PIN_FUNCTION(sdc_cmd),
+	MSM_PIN_FUNCTION(sdc_data),
+	MSM_PIN_FUNCTION(spi0),
+	MSM_PIN_FUNCTION(spi1),
+	MSM_PIN_FUNCTION(spi10),
+	MSM_PIN_FUNCTION(spi11),
+	MSM_PIN_FUNCTION(tsens_max),
+	MSM_PIN_FUNCTION(uart0),
+	MSM_PIN_FUNCTION(uart1),
+	MSM_PIN_FUNCTION(wci_txd),
+	MSM_PIN_FUNCTION(wci_rxd),
+	MSM_PIN_FUNCTION(wsi_clk),
+	MSM_PIN_FUNCTION(wsi_data),
+};
+
+static const struct msm_pingroup ipq5424_groups[] = {
+	PINGROUP(0, sdc_data, qspi_data, pwm2, wci_txd, wci_rxd, _, _, _, _),
+	PINGROUP(1, sdc_data, qspi_data, pwm2, wci_txd, wci_rxd, _, _, _, _),
+	PINGROUP(2, sdc_data, qspi_data, pwm2, _, _, _, _, _, _),
+	PINGROUP(3, sdc_data, qspi_data, pwm2, _, _, _, _, _, _),
+	PINGROUP(4, sdc_cmd, qspi_cs, _, _, _, _, _, _, _),
+	PINGROUP(5, sdc_clk, qspi_clk, _, _, _, _, _, _, _),
+	PINGROUP(6, spi0, pwm1, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(7, spi0, pwm1, _, cri_trng1, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(8, spi0, pwm1, wci_txd, wci_rxd, _, cri_trng2, qdss_tracedata_a, _, _),
+	PINGROUP(9, spi0, pwm1, _, cri_trng3, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(10, uart0, pwm0, spi11, _, wci_txd, wci_rxd, _, qdss_tracedata_a, _),
+	PINGROUP(11, uart0, pwm0, spi1, _, wci_txd, wci_rxd, _, qdss_tracedata_a, _),
+	PINGROUP(12, uart0, pwm0, spi11, _, prng_rosc0, qdss_tracedata_a, _, _, _),
+	PINGROUP(13, uart0, pwm0, spi11, _, prng_rosc1, qdss_tracedata_a, _, _, _),
+	PINGROUP(14, i2c0_scl, tsens_max, _, prng_rosc2, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(15, i2c0_sda, _, prng_rosc3, qdss_tracedata_a, _, _, _, _, _),
+	PINGROUP(16, core_voltage, i2c1_scl, _, _, _, _, _, _, _),
+	PINGROUP(17, core_voltage, i2c1_sda, _, _, _, _, _, _, _),
+	PINGROUP(18, _, _, _, _, _, _, _, _, _),
+	PINGROUP(19, _, _, _, _, _, _, _, _, _),
+	PINGROUP(20, mdc_slv, atest_char0, _, qdss_tracedata_a, _, _, _, _, _),
+	PINGROUP(21, mdio_slv, atest_char1, _, qdss_tracedata_a, _, _, _, _, _),
+	PINGROUP(22, mdc_mst, atest_char2, _, _, _, _, _, _, _),
+	PINGROUP(23, mdio_mst, atest_char3, _, _, _, _, _, _, _),
+	PINGROUP(24, pcie0_clk, PTA10, mac0, _, wsi_clk, _, atest_char, qdss_cti_trig_out_a0, _),
+	PINGROUP(25, _, _, _, _, _, _, _, _, _),
+	PINGROUP(26, pcie0_wake, PTA10, mac0, _, wsi_data, _, qdss_cti_trig_in_a0, _, _),
+	PINGROUP(27, pcie1_clk, i2c11, PTA10, wsi_clk, qdss_cti_trig_out_a1, _, _, _, _),
+	PINGROUP(28, _, _, _, _, _, _, _, _, _),
+	PINGROUP(29, pcie1_wake, i2c11, wsi_data, qdss_cti_trig_in_a1, _, _, _, _, _),
+	PINGROUP(30, pcie2_clk, PTA11, mac1, qdss_cti_trig_out_b0, _, _, _, _, _),
+	PINGROUP(31, _, _, _, _, _, _, _, _, _),
+	PINGROUP(32, pcie2_wake, PTA11, mac1, audio_pri0, audio_pri0, qdss_cti_trig_in_b0, _, _, _),
+	PINGROUP(33, pcie3_clk, PTA11, audio_pri1, audio_pri1, qdss_cti_trig_out_b1, _, _, _, _),
+	PINGROUP(34, _, _, _, _, _, _, _, _, _),
+	PINGROUP(35, pcie3_wake, audio_sec1, audio_sec1, qdss_cti_trig_in_b1, _, _, _, _, _),
+	PINGROUP(36, audio_pri, spi1, audio_sec0, audio_sec0, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(37, audio_pri, spi1, rx2, qdss_tracedata_a, _, _, _, _, _),
+	PINGROUP(38, audio_pri, spi1, pll_test, rx1, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(39, audio_pri, rx0, _, qdss_tracedata_a, _, _, _, _, _),
+	PINGROUP(40, PTA0_0, wci_txd, wci_rxd, _, atest_tic, _, _, _, _),
+	PINGROUP(41, PTA0_1, wci_txd, wci_rxd, cxc_data, _, _, _, _, _),
+	PINGROUP(42, PTA0_2, cxc_clk, _, _, _, _, _, _, _),
+	PINGROUP(43, uart1, gcc_plltest, _, _, _, _, _, _, _),
+	PINGROUP(44, uart1, gcc_tlmm, _, _, _, _, _, _, _),
+	PINGROUP(45, spi10, rx2, audio_sec, gcc_plltest, _, qdss_traceclk_a, _, _, _),
+	PINGROUP(46, spi1, rx1, audio_sec, dbg_out, qdss_tracectl_a, _, _, _, _),
+	PINGROUP(47, spi10, rx0, audio_sec, _, _, _, _, _, _),
+	PINGROUP(48, spi10, audio_sec, _, _, _, _, _, _, _),
+	PINGROUP(49, resout, _, _, _, _, _, _, _, _),
+};
+
+static const struct msm_pinctrl_soc_data ipq5424_pinctrl = {
+	.pins = ipq5424_pins,
+	.npins = ARRAY_SIZE(ipq5424_pins),
+	.functions = ipq5424_functions,
+	.nfunctions = ARRAY_SIZE(ipq5424_functions),
+	.groups = ipq5424_groups,
+	.ngroups = ARRAY_SIZE(ipq5424_groups),
+	.ngpios = 50,
+};
+
+static int ipq5424_pinctrl_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &ipq5424_pinctrl);
+}
+
+static const struct of_device_id ipq5424_pinctrl_of_match[] = {
+	{ .compatible = "qcom,ipq5424-tlmm", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ipq5424_pinctrl_of_match);
+
+static struct platform_driver ipq5424_pinctrl_driver = {
+	.driver = {
+		.name = "ipq5424-tlmm",
+		.of_match_table = ipq5424_pinctrl_of_match,
+	},
+	.probe = ipq5424_pinctrl_probe,
+	.remove = msm_pinctrl_remove,
+};
+
+static int __init ipq5424_pinctrl_init(void)
+{
+	return platform_driver_register(&ipq5424_pinctrl_driver);
+}
+arch_initcall(ipq5424_pinctrl_init);
+
+static void __exit ipq5424_pinctrl_exit(void)
+{
+	platform_driver_unregister(&ipq5424_pinctrl_driver);
+}
+module_exit(ipq5424_pinctrl_exit);
+
+MODULE_DESCRIPTION("QTI IPQ5424 TLMM driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


