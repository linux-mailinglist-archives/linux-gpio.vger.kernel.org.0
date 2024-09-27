Return-Path: <linux-gpio+bounces-10481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AB987EED
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 08:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24786280E5A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 06:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EC4189B82;
	Fri, 27 Sep 2024 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NuPTPHxK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF5F17C9FA;
	Fri, 27 Sep 2024 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420061; cv=none; b=ZW1b1X3NXs40bqtiRp2hF48QS1REoAzu2LJ+weYdJFsUshwuhAJM2omxysX5NxFySzkMprJXe6fqCvZbh5HAFB37hXUstvYovZYXWysHQd43YX3wEfLrM0GHFp2D7zbDeh6jmLooWPWl5HAdp5hK+FqLv0f+DfiX+bO27UeRSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420061; c=relaxed/simple;
	bh=CEa0uwR0uwSS5rC0Qlb92ahZe8wQstSxdoD4eoD+Sy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAcwKf8vTSOD0byBA15IOtFy+auBZ0kgCNSPWGGl5oZA0XqEG9L+g9qsuysD3zooN1Yc/yaaQnw5JQCek0G1B/i0yLk7TMx9V7HvwuHwz0/H4IqeaghWe/XYKXjzHtoGKulD7B5n0tW8xBGzAFobOX7A47jC8r86bLrWt3Y+Vf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NuPTPHxK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R66Zj3002100;
	Fri, 27 Sep 2024 06:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lV+V0Thr8zRLDoVJYfFu0qFaf2V5VYs9oKYGxMWdJMQ=; b=NuPTPHxKsD9IxBix
	ijVQSB79dkyMBqWOpDI097u9jydFf2sj/gSf3J+LBBFZlVY1J8WdbBPoneeolLb9
	hg+JR+lN2wED7RBy6S4hdV61ay1wjZWcPUL0FjtsucnTD1KtfgT2PcA+Mss1rgeV
	+Ict7ccEx4KwoTBsfC9yVhBb0dAwiN7J8bFPFUtR+gvCm2jK8Sq4UrLc5G4gV8wQ
	u5iKwyMrQ3eL9FuX3MPhop/oiAtVCLkudqf8jof1Yq6nWMgk1bxoxqnLKiHO0n8j
	/NLQPQTYlPfUBvxsT9tcOd34h8K5AHuIBmyjt0BAr8oqc7WRQMu4phNFatzOAPO7
	mBc4Vg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnjh21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:54:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48R6s5pJ032638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:54:05 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Sep 2024 23:53:58 -0700
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
Subject: [PATCH V2 8/9] arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support
Date: Fri, 27 Sep 2024 12:22:43 +0530
Message-ID: <20240927065244.3024604-9-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927065244.3024604-1-quic_srichara@quicinc.com>
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gfO-sVqtNeCIRLG5PLgKsPPyKqBzOx24
X-Proofpoint-GUID: gfO-sVqtNeCIRLG5PLgKsPPyKqBzOx24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270046

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Add initial device tree support for the Qualcomm IPQ5424 SoC and
rdp466 board.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
  [v2] Sorted nodes based on address, fixed labels case.
       Removed CPU_MASK for all nodes
       Dropped the chosen node
       Removed the redundant 'status=okay', ordered clocks
       child nodes alphabetically.

 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  59 ++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 291 ++++++++++++++++++++
 3 files changed, 351 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 197ab325c0b9..46c4eb758799 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp474.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5424-rdp466.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
new file mode 100644
index 000000000000..d4d31026a026
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * IPQ5424 RDP466 board device tree source
+ *
+ * Copyright (c) 2024 The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "ipq5424.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5424 RDP466";
+	compatible = "qcom,ipq5424-rdp466", "qcom,ipq5424";
+
+	aliases {
+		serial0 = &uart1;
+	};
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	sdc_default_state: sdc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
+
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
new file mode 100644
index 000000000000..76af0d87e9a8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * IPQ5424 device tree source
+ *
+ * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq5424-gcc.h>
+#include <dt-bindings/reset/qcom,ipq5424-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x100>;
+			next-level-cache = <&l2_100>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x200>;
+			next-level-cache = <&l2_200>;
+
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x300>;
+			next-level-cache = <&l2_300>;
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-dsu {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tz@8a600000 {
+			reg = <0x0 0x8a600000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,ipq5424-tlmm";
+			reg = <0 0x01000000 0 0x300000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 50>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			uart1_pins: uart1-state {
+				pins = "gpio43", "gpio44";
+				function = "uart1";
+				drive-strength = <8>;
+				bias-pull-up;
+			};
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,ipq5424-gcc";
+			reg = <0 0x01800000 0 0x40000>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
+
+		qupv3: geniqup@1ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x01ac0000 0 0x2000>;
+			ranges;
+			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
+				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			uart1: serial@1a84000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x01a84000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_UART1_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		sdhc: mmc@7804000 {
+			compatible = "qcom,ipq5424-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x07804000 0 0x1000>, <0 0x07805000 0 0x1000>;
+			reg-names = "hc", "cqhci";
+
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo_board>;
+			clock-names = "iface", "core", "xo";
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0 0xf200000 0 0x10000>, /* GICD */
+			      <0 0xf240000 0 0x80000>; /* GICR * 4 regions */
+			#interrupt-cells = <0x3>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			mbi-ranges = <672 128>;
+			msi-controller;
+		};
+
+		timer@f420000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0 0xf420000 0 0x1000>;
+			ranges = <0 0 0 0x10000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@f421000 {
+				reg = <0xf421000 0x1000>,
+				      <0xf422000 0x1000>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <0>;
+			};
+
+			frame@f423000 {
+				reg = <0xf423000 0x1000>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <1>;
+				status = "disabled";
+			};
+
+			frame@f425000 {
+				reg = <0xf425000 0x1000>,
+				      <0xf426000 0x1000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <2>;
+				status = "disabled";
+			};
+
+			frame@f427000 {
+				reg = <0xf427000 0x1000>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <3>;
+				status = "disabled";
+			};
+
+			frame@f429000 {
+				reg = <0xf429000 0x1000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <4>;
+				status = "disabled";
+			};
+
+			frame@f42b000 {
+				reg = <0xf42b000 0x1000>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <5>;
+				status = "disabled";
+			};
+
+			frame@f42d000 {
+				reg = <0xf42d000 0x1000>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <6>;
+				status = "disabled";
+			};
+		};
+
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.34.1


