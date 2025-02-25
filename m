Return-Path: <linux-gpio+bounces-16539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F8A4383E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 09:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C483A8A88
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 08:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB9A2627FC;
	Tue, 25 Feb 2025 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aTa3O6NT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25625EFAB;
	Tue, 25 Feb 2025 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473538; cv=none; b=XSet5TneKNpmsl4ALxctSyBcEjMnRqpnpGBMJ+2dp8ObcEU2nw5Yw2rsV9ISPkgBtg6ctOm6afFZi9Zrk1jHizDFiyypi0Q2MbsI2CyAErF1d+gvKdVynMAdzRgqpUZKkUjPQxwqIUvsz7Hqj8C+kOcgDQHx88m3TXU/+63Soxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473538; c=relaxed/simple;
	bh=iztAOqQ4NOYRaMk1P81xiA2ZjauH72u9D2X4LyJ9shQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IfYT88ymgNxlhRTLRojaQ67jQggQ0Knysfbq8/vaFE7MGmNP3qeQVeaEcZsjw1BJZ4nNvgBCOJps+6KzzPsHR/LCkjP2PseWF4qxKJjKS3qIjQ1IfohEY54eEj5623aLCZwE46Q2XaBJSBfDCffiTckoO6NzZIL/oCte601ZNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aTa3O6NT; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7VbrL025554;
	Tue, 25 Feb 2025 09:52:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DEnYecZ9bxA3ogrxmztmDHuaA4UedKniT4I6PXhC3Nc=; b=aTa3O6NTWMizL+0C
	EUy+HvayBzpe+HSK18Wu6n3TEzupgmkDlmA87/s10q6LoMc0WbivGw1QryO2hOFM
	PP34OBQu49BvDQghUDFF2WxOcqmzX1aEXK4uVMobNcMPq2koaZ4v6TQBHkkoYNik
	XNWXlJDzsfxXsm2Zcc8gnW490qFpQ25y+KbA6sCBCgsT41qKGe5wdSKmPKnbtbE6
	xmKWdHhPz7utjk8IA1HKN8LMXcErWnFK1xKIm8hRJfk0cVn0iTo47FaXE1etlqWJ
	eVUBgl6MF1eeomUa7A64zG+qYFcpuzLSU483+3HhSC7trwMitFPXwIDKlQKXvWF0
	V1H1fQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spstfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:52:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D74040059;
	Tue, 25 Feb 2025 09:50:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C563F47A6EA;
	Tue, 25 Feb 2025 09:48:06 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:06 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:00 +0100
Subject: [PATCH 1/9] dt-bindings: pinctrl: stm32: Add HDP includes for
 stm32mp platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250225-hdp-upstream-v1-1-9d049c65330a@foss.st.com>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
In-Reply-To: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-42535
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01

Each file introduces helpers to choose the signal to monitor through the
HDP pin.
Signals are different for each platforms: stm32mp13, stm32mp15, stm32mp25.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 include/dt-bindings/pinctrl/stm32mp13-hdp.h | 130 +++++++++++++++++++++++++
 include/dt-bindings/pinctrl/stm32mp15-hdp.h | 116 ++++++++++++++++++++++
 include/dt-bindings/pinctrl/stm32mp25-hdp.h | 144 ++++++++++++++++++++++++++++
 3 files changed, 390 insertions(+)

diff --git a/include/dt-bindings/pinctrl/stm32mp13-hdp.h b/include/dt-bindings/pinctrl/stm32mp13-hdp.h
new file mode 100644
index 000000000000..a3487e700143
--- /dev/null
+++ b/include/dt-bindings/pinctrl/stm32mp13-hdp.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
+ */
+
+#ifndef _DT_BINDINGS_STM32MP13_HDP_H
+#define _DT_BINDINGS_STM32MP13_HDP_H
+
+/* define a macro for each function a HDP pin can transmit */
+#define HDP0_PWR_PWRWAKE_SYS			 "0"
+#define HDP0_PWR_STOP_FORBIDDEN			 "1"
+#define HDP0_PWR_STDBY_WAKEUP			 "2"
+#define HDP0_PWR_ENCOMP_VDDCORE			 "3"
+#define HDP0_BSEC_OUT_SEC_NIDEN			 "4"
+#define HDP0_AIEC_SYS_WAKEUP			 "5"
+#define HDP0_DDRCTRL_LP_REQ			 "8"
+#define HDP0_PWR_DDR_RET_ENABLE_N		 "9"
+#define HDP0_DTS_CLK_PTAT			 "10"
+#define HDP0_SRAM3CTRL_TAMP_ERASE_ACT		 "12"
+#define HDP0_GPOVAL_0				 "15"
+
+#define HDP1_PWR_SEL_VTH_VDDCPU			 "0"
+#define HDP1_PWR_MPU_RAM_LOWSPEED		 "1"
+#define HDP1_CA7_NAXIERRIRQ			 "2"
+#define HDP1_PWR_OKIN_MR			 "3"
+#define HDP1_BSEC_OUT_SEC_DBGEN			 "4"
+#define HDP1_AIEC_C1_WAKEUP			 "5"
+#define HDP1_RCC_PWRDS_MPU			 "6"
+#define HDP1_DDRCTRL_DFI_CTRLUPD_REQ		 "8"
+#define HDP1_DDRCTRL_CACTIVE_DDRC_ASR		 "9"
+#define HDP1_SRAM3CTRL_HW_ERASE_ACT		 "12"
+#define HDP1_NIC400_S0_BREADY			 "13"
+#define HDP1_GPOVAL_1				 "15"
+
+#define HDP2_PWR_PWRWAKE_MPU			 "0"
+#define HDP2_PWR_MPU_CLOCK_DISABLE_ACK		 "1"
+#define HDP2_CA7_NDBGRESET_I			 "2"
+#define HDP2_BSEC_IN_RSTCORE_N			 "4"
+#define HDP2_BSEC_OUT_SEC_BSC_DIS		 "5"
+#define HDP2_DDRCTRL_DFI_INIT_COMPLETE		 "8"
+#define HDP2_DDRCTRL_PERF_OP_IS_REFRESH		 "9"
+#define HDP2_DDRCTRL_GSKP_DFI_LP_REQ		 "10"
+#define HDP2_SRAM3CTRL_SW_ERASE_ACT		 "12"
+#define HDP2_NIC400_S0_BVALID			 "13"
+#define HDP2_GPOVAL_2				 "15"
+
+#define HDP3_PWR_SEL_VTH_VDDCORE		 "0"
+#define HDP3_PWR_MPU_CLOCK_DISABLE_REQ		 "1"
+#define HDP3_CA7_NPMUIRQ0			 "2"
+#define HDP3_CA7_NFIQOUT0			 "3"
+#define HDP3_BSEC_OUT_SEC_DFTLOCK		 "4"
+#define HDP3_BSEC_OUT_SEC_JTAG_DIS		 "5"
+#define HDP3_RCC_PWRDS_SYS			 "6"
+#define HDP3_SRAM3CTRL_TAMP_ERASE_REQ		 "7"
+#define HDP3_DDRCTRL_STAT_DDRC_REG_SELFREF_TYPE0 "8"
+#define HDP3_DTS_VALOBUS1_0			 "10"
+#define HDP3_DTS_VALOBUS2_0			 "11"
+#define HDP3_TAMP_POTENTIAL_TAMP_ERFCFG		 "12"
+#define HDP3_NIC400_S0_WREADY			 "13"
+#define HDP3_NIC400_S0_RREADY			 "14"
+#define HDP3_GPOVAL_3				 "15"
+
+#define HDP4_PWR_STOP2_ACTIVE			 "1"
+#define HDP4_CA7_NL2RESET_I			 "2"
+#define HDP4_CA7_NPORESET_VARM_I		 "3"
+#define HDP4_BSEC_OUT_SEC_DFTEN			 "4"
+#define HDP4_BSEC_OUT_SEC_DBGSWENABLE		 "5"
+#define HDP4_ETH1_OUT_PMT_INTR_O		 "6"
+#define HDP4_ETH2_OUT_PMT_INTR_O		 "7"
+#define HDP4_DDRCTRL_STAT_DDRC_REG_SELFREF_TYPE1 "8"
+#define HDP4_DDRCTRL_CACTIVE_0			 "9"
+#define HDP4_DTS_VALOBUS1_1			 "10"
+#define HDP4_DTS_VALOBUS2_1			 "11"
+#define HDP4_TAMP_NRESET_SRAM_ERCFG		 "12"
+#define HDP4_NIC400_S0_WLAST			 "13"
+#define HDP4_NIC400_S0_RLAST			 "14"
+#define HDP4_GPOVAL_4				 "15"
+
+#define HDP5_CA7_STANDBYWFIL2			 "0"
+#define HDP5_PWR_VTH_VDDCORE_ACK		 "1"
+#define HDP5_CA7_NCORERESET_I			 "2"
+#define HDP5_CA7_NIRQOUT0			 "3"
+#define HDP5_BSEC_IN_PWROK			 "4"
+#define HDP5_BSEC_OUT_SEC_DEVICEEN		 "5"
+#define HDP5_ETH1_OUT_LPI_INTR_O		 "6"
+#define HDP5_ETH2_OUT_LPI_INTR_O		 "7"
+#define HDP5_DDRCTRL_CACTIVE_DDRC		 "8"
+#define HDP5_DDRCTRL_WR_CREDIT_CNT		 "9"
+#define HDP5_DTS_VALOBUS1_2			 "10"
+#define HDP5_DTS_VALOBUS2_2			 "11"
+#define HDP5_PKA_PKA_ITAMP_OUT			 "12"
+#define HDP5_NIC400_S0_WVALID			 "13"
+#define HDP5_NIC400_S0_RVALID			 "14"
+#define HDP5_GPOVAL_5				 "15"
+
+#define HDP6_CA7_STANDBYWFE0			 "0"
+#define HDP6_PWR_VTH_VDDCPU_ACK			 "1"
+#define HDP6_CA7_EVENTO				 "2"
+#define HDP6_BSEC_IN_TAMPER_DET			 "4"
+#define HDP6_BSEC_OUT_SEC_SPNIDEN		 "5"
+#define HDP6_ETH1_OUT_MAC_SPEED_O1		 "6"
+#define HDP6_ETH2_OUT_MAC_SPEED_O1		 "7"
+#define HDP6_DDRCTRL_CSYSACK_DDRC		 "8"
+#define HDP6_DDRCTRL_LPR_CREDIT_CNT		 "9"
+#define HDP6_DTS_VALOBUS1_3			 "10"
+#define HDP6_DTS_VALOBUS2_3			 "11"
+#define HDP6_SAES_TAMPER_OUT			 "12"
+#define HDP6_NIC400_S0_AWREADY			 "13"
+#define HDP6_NIC400_S0_ARREADY			 "14"
+#define HDP6_GPOVAL_6				 "15"
+
+#define HDP7_CA7_STANDBYWFI0			 "0"
+#define HDP7_PWR_RCC_VCPU_RDY			 "1"
+#define HDP7_CA7_EVENTI				 "2"
+#define HDP7_CA7_DBGACK0			 "3"
+#define HDP7_BSEC_OUT_FUSE_OK			 "4"
+#define HDP7_BSEC_OUT_SEC_SPIDEN		 "5"
+#define HDP7_ETH1_OUT_MAC_SPEED_O0		 "6"
+#define HDP7_ETH2_OUT_MAC_SPEED_O0		 "7"
+#define HDP7_DDRCTRL_CSYSREQ_DDRC		 "8"
+#define HDP7_DDRCTRL_HPR_CREDIT_CNT		 "9"
+#define HDP7_DTS_VALOBUS1_4			 "10"
+#define HDP7_DTS_VALOBUS2_4			 "11"
+#define HDP7_RNG_TAMPER_OUT			 "12"
+#define HDP7_NIC400_S0_AWAVALID			 "13"
+#define HDP7_NIC400_S0_ARAVALID			 "14"
+#define HDP7_GPOVAL_7				 "15"
+
+#endif /* _DT_BINDINGS_STM32MP13_HDP_H */
diff --git a/include/dt-bindings/pinctrl/stm32mp15-hdp.h b/include/dt-bindings/pinctrl/stm32mp15-hdp.h
new file mode 100644
index 000000000000..ac32cec5a9f6
--- /dev/null
+++ b/include/dt-bindings/pinctrl/stm32mp15-hdp.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
+ */
+
+#ifndef _DT_BINDINGS_STM32MP15_HDP_H
+#define _DT_BINDINGS_STM32MP15_HDP_H
+
+/* define a macro for each function a HDP pin can transmit */
+#define HDP0_PWR_PWRWAKE_SYS			 "0"
+#define HDP0_CM4_SLEEPDEEP			 "1"
+#define HDP0_PWR_STDBY_WKUP			 "2"
+#define HDP0_PWR_ENCOMP_VDDCORE			 "3"
+#define HDP0_BSEC_OUT_SEC_NIDEN			 "4"
+#define HDP0_RCC_CM4_SLEEPDEEP			 "6"
+#define HDP0_GPU_DBG7				 "7"
+#define HDP0_DDRCTRL_LP_REQ			 "8"
+#define HDP0_PWR_DDR_RET_ENABLE_N		 "9"
+#define HDP0_DTS_CLK_PTAT			 "10"
+#define HDP0_GPOVAL_0				 "15"
+
+#define HDP1_PWR_PWRWAKE_MCU			 "0"
+#define HDP1_CM4_HALTED				 "1"
+#define HDP1_CA7_NAXIERRIRQ			 "2"
+#define HDP1_PWR_OKIN_MR			 "3"
+#define HDP1_BSEC_OUT_SEC_DBGEN			 "4"
+#define HDP1_EXTI_SYS_WAKEUP			 "5"
+#define HDP1_RCC_PWRDS_MPU			 "6"
+#define HDP1_GPU_DBG6				 "7"
+#define HDP1_DDRCTRL_DFI_CTRLUPD_REQ		 "8"
+#define HDP1_DDRCTRL_CACTIVE_DDRC_ASR		 "9"
+#define HDP1_GPOVAL_1				 "15"
+
+#define HDP2_PWR_PWRWAKE_MPU			 "0"
+#define HDP2_CM4_RXEV				 "1"
+#define HDP2_CA7_NPMUIRQ1			 "2"
+#define HDP2_CA7_NFIQOUT1			 "3"
+#define HDP2_BSEC_IN_RSTCORE_N			 "4"
+#define HDP2_EXTI_C2_WAKEUP			 "5"
+#define HDP2_RCC_PWRDS_MCU			 "6"
+#define HDP2_GPU_DBG5				 "7"
+#define HDP2_DDRCTRL_DFI_INIT_COMPLETE		 "8"
+#define HDP2_DDRCTRL_PERF_OP_IS_REFRESH		 "9"
+#define HDP2_DDRCTRL_GSKP_DFI_LP_REQ		 "10"
+#define HDP2_GPOVAL_2				 "15"
+
+#define HDP3_PWR_SEL_VTH_VDDCORE		 "0"
+#define HDP3_CM4_TXEV				 "1"
+#define HDP3_CA7_NPMUIRQ0			 "2"
+#define HDP3_CA7_NFIQOUT0			 "3"
+#define HDP3_BSEC_OUT_SEC_DFTLOCK		 "4"
+#define HDP3_EXTI_C1_WAKEUP			 "5"
+#define HDP3_RCC_PWRDS_SYS			 "6"
+#define HDP3_GPU_DBG4				 "7"
+#define HDP3_DDRCTRL_STAT_DDRC_REG_SELFREF_TYPE0 "8"
+#define HDP3_DDRCTRL_CACTIVE_1			 "9"
+#define HDP3_DTS_VALOBUS1_0			 "10"
+#define HDP3_DTS_VALOBUS2_0			 "11"
+#define HDP3_GPOVAL_3				 "15"
+
+#define HDP4_PWR_PDDS_NOT_CSTBYDIS		 "0"
+#define HDP4_CM4_SLEEPING			 "1"
+#define HDP4_CA7_NRESET1			 "2"
+#define HDP4_CA7_NIRQOUT1			 "3"
+#define HDP4_BSEC_OUT_SEC_DFTEN			 "4"
+#define HDP4_BSEC_OUT_SEC_DBGSWENABLE		 "5"
+#define HDP4_ETH_OUT_PMT_INTR_O			 "6"
+#define HDP4_GPU_DBG3				 "7"
+#define HDP4_DDRCTRL_STAT_DDRC_REG_SELFREF_TYPE1 "8"
+#define HDP4_DDRCTRL_CACTIVE_0			 "9"
+#define HDP4_DTS_VALOBUS1_1			 "10"
+#define HDP4_DTS_VALOBUS2_1			 "11"
+#define HDP4_GPOVAL_4				 "15"
+
+#define HDP5_CA7_STANDBYWFIL2			 "0"
+#define HDP5_PWR_VTH_VDDCORE_ACK		 "1"
+#define HDP5_CA7_NRESET0			 "2"
+#define HDP5_CA7_NIRQOUT0			 "3"
+#define HDP5_BSEC_IN_PWROK			 "4"
+#define HDP5_BSEC_OUT_SEC_DEVICEEN		 "5"
+#define HDP5_ETH_OUT_LPI_INTR_O			 "6"
+#define HDP5_GPU_DBG2				 "7"
+#define HDP5_DDRCTRL_CACTIVE_DDRC		 "8"
+#define HDP5_DDRCTRL_WR_CREDIT_CNT		 "9"
+#define HDP5_DTS_VALOBUS1_2			 "10"
+#define HDP5_DTS_VALOBUS2_2			 "11"
+#define HDP5_GPOVAL_5				 "15"
+
+#define HDP6_CA7_STANDBYWFI1			 "0"
+#define HDP6_CA7_STANDBYWFE1			 "1"
+#define HDP6_CA7_EVENTO				 "2"
+#define HDP6_CA7_DBGACK1			 "3"
+#define HDP6_BSEC_OUT_SEC_SPNIDEN		 "5"
+#define HDP6_ETH_OUT_MAC_SPEED_O1		 "6"
+#define HDP6_GPU_DBG1				 "7"
+#define HDP6_DDRCTRL_CSYSACK_DDRC		 "8"
+#define HDP6_DDRCTRL_LPR_CREDIT_CNT		 "9"
+#define HDP6_DTS_VALOBUS1_3			 "10"
+#define HDP6_DTS_VALOBUS2_3			 "11"
+#define HDP6_GPOVAL_6				 "15"
+
+#define HDP7_CA7_STANDBYWFI0			 "0"
+#define HDP7_CA7_STANDBYWFE0			 "1"
+#define HDP7_CA7_DBGACK0			 "3"
+#define HDP7_BSEC_OUT_FUSE_OK			 "4"
+#define HDP7_BSEC_OUT_SEC_SPIDEN		 "5"
+#define HDP7_ETH_OUT_MAC_SPEED_O0		 "6"
+#define HDP7_GPU_DBG0				 "7"
+#define HDP7_DDRCTRL_CSYSREQ_DDRC		 "8"
+#define HDP7_DDRCTRL_HPR_CREDIT_CNT		 "9"
+#define HDP7_DTS_VALOBUS1_4			 "10"
+#define HDP7_DTS_VALOBUS2_4			 "11"
+#define HDP7_GPOVAL_7				 "15"
+
+#endif /* _DT_BINDINGS_STM32MP15_HDP_H */
diff --git a/include/dt-bindings/pinctrl/stm32mp25-hdp.h b/include/dt-bindings/pinctrl/stm32mp25-hdp.h
new file mode 100644
index 000000000000..bc84042f1605
--- /dev/null
+++ b/include/dt-bindings/pinctrl/stm32mp25-hdp.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
+ */
+
+#ifndef _DT_BINDINGS_STM32MP25_HDP_H
+#define _DT_BINDINGS_STM32MP25_HDP_H
+
+/* define a macro for each function a HDP pin can transmit */
+#define HDP0_PWR_PWRWAKE_SYS			     "0"
+#define HDP0_CPU2_SLEEP_DEEP			     "1"
+#define HDP0_BSEC_OUT_TST_SDR_UNLOCK_OR_DISABLE_SCAN "2"
+#define HDP0_BSEC_OUT_NIDENM			     "3"
+#define HDP0_BSEC_OUT_NIDENA			     "4"
+#define HDP0_CPU2_STATE_0			     "5"
+#define HDP0_RCC_PWRDS_SYS			     "6"
+#define HDP0_GPU_DBG7				     "7"
+#define HDP0_DDRSS_CSYSREQ_DDRC			     "8"
+#define HDP0_DDRSS_DFI_PHYUPD_REQ		     "9"
+#define HDP0_CPU3_SLEEP_DEEP			     "10"
+#define HDP0_D2_GBL_PER_CLK_BUS_REQ		     "11"
+#define HDP0_PCIE_USB_CXPL_DEBUG_INFO_EI_0	     "12"
+#define HDP0_PCIE_USB_CXPL_DEBUG_INFO_EI_8	     "13"
+#define HDP0_D3_STATE_0				     "14"
+#define HDP0_GPOVAL_0				     "15"
+
+#define HDP1_PWR_PWRWAKE_CPU2			     "0"
+#define HDP1_CPU2_HALTED			     "1"
+#define HDP1_CPU2_STATE_1			     "2"
+#define HDP1_BSEC_OUT_DBGENM			     "3"
+#define HDP1_BSEC_OUT_DBGENA			     "4"
+#define HDP1_EXTI1_SYS_WAKEUP			     "5"
+#define HDP1_RCC_PWRDS_CPU2			     "6"
+#define HDP1_GPU_DBG6				     "7"
+#define HDP1_DDRSS_CSYSACK_DDRC			     "8"
+#define HDP1_DDRSS_DFI_PHYMSTR_REQ		     "9"
+#define HDP1_CPU3_HALTED			     "10"
+#define HDP1_D2_GBL_PER_DMA_REQ			     "11"
+#define HDP1_PCIE_USB_CXPL_DEBUG_INFO_EI_1	     "12"
+#define HDP1_PCIE_USB_CXPL_DEBUG_INFO_EI_9	     "13"
+#define HDP1_D3_STATE_1				     "14"
+#define HDP1_GPOVAL_1				     "15"
+
+#define HDP2_PWR_PWRWAKE_CPU1			     "0"
+#define HDP2_CPU2_RXEV				     "1"
+#define HDP2_CPU1_NPMUIRQ1			     "2"
+#define HDP2_CPU1_NFIQOUT1			     "3"
+#define HDP2_BSEC_OUT_SHDBGEN			     "4"
+#define HDP2_EXTI1_CPU2_WAKEUP			     "5"
+#define HDP2_RCC_PWRDS_CPU1			     "6"
+#define HDP2_GPU_DBG5				     "7"
+#define HDP2_DDRSS_CACTIVE_DDRC			     "8"
+#define HDP2_DDRSS_DFI_LP_REQ			     "9"
+#define HDP2_CPU3_RXEV				     "10"
+#define HDP2_HPDMA1_CLK_BUS_REQ			     "11"
+#define HDP2_PCIE_USB_CXPL_DEBUG_INFO_EI_2	     "12"
+#define HDP2_PCIE_USB_CXPL_DEBUG_INFO_EI_10	     "13"
+#define HDP2_D3_STATE_2				     "14"
+#define HDP2_GPOVAL_2				     "15"
+
+#define HDP3_PWR_SEL_VTH_VDDCPU			     "0"
+#define HDP3_CPU2_TXEV				     "1"
+#define HDP3_CPU1_NPMUIRQ0			     "2"
+#define HDP3_CPU1_NFIQOUT0			     "3"
+#define HDP3_BSEC_OUT_DDBGEN			     "4"
+#define HDP3_EXTI1_CPU1_WAKEUP			     "5"
+#define HDP3_CPU3_STATE_0			     "6"
+#define HDP3_GPU_DBG4				     "7"
+#define HDP3_DDRSS_MCDCG_EN			     "8"
+#define HDP3_DDRSS_DFI_FREQ_0			     "9"
+#define HDP3_CPU3_TXEV				     "10"
+#define HDP3_HPDMA2_CLK_BUS_REQ			     "11"
+#define HDP3_PCIE_USB_CXPL_DEBUG_INFO_EI_3	     "12"
+#define HDP3_PCIE_USB_CXPL_DEBUG_INFO_EI_11	     "13"
+#define HDP3_D1_STATE_0				     "14"
+#define HDP3_GPOVAL_3				     "15"
+
+#define HDP4_PWR_SEL_VTH_VDDCORE		     "0"
+#define HDP4_CPU2_SLEEPING			     "1"
+#define HDP4_CPU1_EVENTO			     "2"
+#define HDP4_CPU1_NIRQOUT1			     "3"
+#define HDP4_BSEC_OUT_SPNIDENA			     "4"
+#define HDP4_EXTI2_D3_WAKEUP			     "5"
+#define HDP4_ETH1_OUT_PMT_INTR_O		     "6"
+#define HDP4_GPU_DBG3				     "7"
+#define HDP4_DDRSS_DPHYCG_EN			     "8"
+#define HDP4_DDRSS_OBSP0			     "9"
+#define HDP4_CPU3_SLEEPING			     "10"
+#define HDP4_HPDMA3_CLK_BUS_REQ			     "11"
+#define HDP4_PCIE_USB_CXPL_DEBUG_INFO_EI_4	     "12"
+#define HDP4_PCIE_USB_CXPL_DEBUG_INFO_EI_12	     "13"
+#define HDP4_D1_STATE_1				     "14"
+#define HDP4_GPOVAL_4				     "15"
+
+#define HDP5_CPU1_STANDBY_WFIL2			     "0"
+#define HDP5_CPU1_NIRQOUT0			     "3"
+#define HDP5_BSEC_OUT_SPIDENA			     "4"
+#define HDP5_EXTI2_CPU3_WAKEUP			     "5"
+#define HDP5_ETH1_OUT_LPI_INTR_O		     "6"
+#define HDP5_GPU_DBG2				     "7"
+#define HDP5_DDRCTRL_DFI_INIT_START		     "8"
+#define HDP5_DDRSS_OBSP1			     "9"
+#define HDP5_CPU3_STATE_1			     "10"
+#define HDP5_D3_GBL_PER_CLK_BUS_REQ		     "11"
+#define HDP5_PCIE_USB_CXPL_DEBUG_INFO_EI_5	     "12"
+#define HDP5_PCIE_USB_CXPL_DEBUG_INFO_EI_13	     "13"
+#define HDP5_D1_STATE_2				     "14"
+#define HDP5_GPOVAL_5				     "15"
+
+#define HDP6_CPU1_STANDBY_WFI1			     "0"
+#define HDP6_CPU1_STANDBY_WFE1			     "1"
+#define HDP6_CPU1_HALTED1			     "2"
+#define HDP6_CPU1_NAXIERRIRQ			     "3"
+#define HDP6_BSEC_OUT_SPNIDENM			     "4"
+#define HDP6_EXTI2_CPU2_WAKEUP			     "5"
+#define HDP6_ETH2_OUT_PMT_INTR_O		     "6"
+#define HDP6_GPU_DBG1				     "7"
+#define HDP6_DDRSS_DFI_INIT_COMPLETE		     "8"
+#define HDP6_DDRSS_OBSP2			     "9"
+#define HDP6_D2_STATE_0				     "10"
+#define HDP6_D3_GBL_PER_DMA_REQ			     "11"
+#define HDP6_PCIE_USB_CXPL_DEBUG_INFO_EI_6	     "12"
+#define HDP6_PCIE_USB_CXPL_DEBUG_INFO_EI_14	     "13"
+#define HDP6_CPU1_STATE_0			     "14"
+#define HDP6_GPOVAL_6				     "15"
+
+#define HDP7_CPU1_STANDBY_WFI0			     "0"
+#define HDP7_CPU1_STANDBY_WFE0			     "1"
+#define HDP7_CPU1_HALTED0			     "2"
+#define HDP7_BSEC_OUT_SPIDENM			     "4"
+#define HDP7_EXTI2_CPU1__WAKEUP			     "5"
+#define HDP7_ETH2_OUT_LPI_INTR_O		     "6"
+#define HDP7_GPU_DBG0				     "7"
+#define HDP7_DDRSS_DFI_CTRLUPD_REQ		     "8"
+#define HDP7_DDRSS_OBSP3			     "9"
+#define HDP7_D2_STATE_1				     "10"
+#define HDP7_LPDMA1_CLK_BUS_REQ			     "11"
+#define HDP7_PCIE_USB_CXPL_DEBUG_INFO_EI_7	     "12"
+#define HDP7_PCIE_USB_CXPL_DEBUG_INFO_EI_15	     "13"
+#define HDP7_CPU1_STATE_1			     "14"
+#define HDP7_GPOVAL_7				     "15"
+
+#endif /* _DT_BINDINGS_STM32MP25_HDP_H */

-- 
2.43.0


