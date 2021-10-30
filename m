Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9312D44061A
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Oct 2021 02:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhJ3AEt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 20:04:49 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:49424 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231722AbhJ3AEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Oct 2021 20:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635552138; x=1667088138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/SjoDdMAwe0PPJF8TVSYiRcIABh5DiCPKsTt2DJslgI=;
  b=SZM0rR3GpFGFdFephcig2ZrzJAsCsvjEsjk6bE0pU7rTt9nIOUCsHjfj
   8+eWzPxt6gWF2a8KNSC63exDESAosEByK2TlZu3NtEn32zFiCRbLIUbDf
   jMUatsW/l1YARpatMmfmuF9ov/AdxYlyinmgkG6B2qDYs0iytJhrtoMkR
   A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 17:02:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 17:02:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:02:17 -0700
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:02:17 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <olof@lixom.net>, <soc@kernel.org>, <linus.walleij@linaro.org>,
        <sboyd@codeaurora.org>, <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        Vamsi krishna Lanka <quic_vamslank@quicinc.com>
Subject: [PATCH v3 2/3] ARM: dts: qcom: Add SDX65 platform and MTP board support
Date:   Fri, 29 Oct 2021 17:02:04 -0700
Message-ID: <1635552125-16407-3-git-send-email-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
References: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add basic devicetree support for SDX65 platform and MTP board from
Qualcomm. The SDX65 platform features an ARM Cortex A7 CPU which forms
the Application Processor Sub System (APSS) along with standard Qualcomm
peripherals like GCC, TLMM, BLSP, QPIC, and BAM etc... Also, there
exists the networking parts such as IPA, MHI, PCIE-EP, EMAC, and Modem
etc..

This commit adds basic devicetree support that includes GCC, RPMh clock, INTC
and Debug UART.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
---
 arch/arm/boot/dts/Makefile           |   3 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts |  25 +++++
 arch/arm/boot/dts/qcom-sdx65.dtsi    | 210 +++++++++++++++++++++++++++++++++++
 3 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e09341..a467c66 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -969,7 +969,8 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-mdm9615-wp8548-mangoh-green.dtb \
 	qcom-sdx55-mtp.dtb \
 	qcom-sdx55-t55.dtb \
-	qcom-sdx55-telit-fn980-tlb.dtb
+	qcom-sdx55-telit-fn980-tlb.dtb \
+	qcom-sdx65-mtp.dtb
 dtb-$(CONFIG_ARCH_RDA) += \
 	rda8810pl-orangepi-2g-iot.dtb \
 	rda8810pl-orangepi-i96.dtb
diff --git a/arch/arm/boot/dts/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
new file mode 100644
index 0000000..59457da
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "qcom-sdx65.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SDX65 MTP";
+	compatible = "qcom,sdx65-mtp", "qcom,sdx65";
+	qcom,board-id = <0x2010008 0x302>;
+
+	aliases {
+		serial0 = &blsp1_uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&blsp1_uart3 {
+	status = "ok";
+};
diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
new file mode 100644
index 0000000..5aecb00
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SDX65 SoC device tree source
+ *
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
+
+#include <dt-bindings/clock/qcom,gcc-sdx65.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	qcom,msm-id = <458 0x10000>, <483 0x10000>, <509 0x10000>;
+	interrupt-parent = <&intc>;
+
+	memory {
+		device_type = "memory";
+		reg = <0 0>;
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			clock-output-names = "xo_board";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			clock-output-names = "sleep_clk";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		cmd_db: reserved-memory@8fee0000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x8fee0000 0x20000>;
+			no-map;
+		};
+	};
+
+	soc: soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		compatible = "simple-bus";
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,gcc-sdx65";
+			reg = <0x00100000 0x001f7400>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>;
+			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		blsp1_uart3: serial@831000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x00831000 0x200>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		pdc: interrupt-controller@b210000 {
+			compatible = "qcom,sdx65-pdc", "qcom,pdc";
+			reg = <0xb210000 0x10000>;
+			qcom,pdc-ranges = <0 147 52>, <52 266 32>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		intc: interrupt-controller@17800000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			interrupt-parent = <&intc>;
+			#interrupt-cells = <3>;
+			reg = <0x17800000 0x1000>,
+			      <0x17802000 0x1000>;
+		};
+
+		timer@17820000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x17820000 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@17821000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 7 0x4>,
+					     <GIC_SPI 6 0x4>;
+				reg = <0x17821000 0x1000>,
+				      <0x17822000 0x1000>;
+			};
+
+			frame@17823000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 8 0x4>;
+				reg = <0x17823000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17824000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 9 0x4>;
+				reg = <0x17824000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17825000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 10 0x4>;
+				reg = <0x17825000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17826000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 11 0x4>;
+				reg = <0x17826000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17827000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 12 0x4>;
+				reg = <0x17827000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17828000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 13 0x4>;
+				reg = <0x17828000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17829000 {
+				frame-number = <7>;
+				interrupts = <GIC_SPI 14 0x4>;
+				reg = <0x17829000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		apps_rsc: rsc@17830000 {
+			label = "apps_rsc";
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x17830000 0x10000>,
+			    <0x17840000 0x10000>;
+			reg-names = "drv-0", "drv-1";
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				   <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <1>;
+			qcom,tcs-config = <ACTIVE_TCS  2>,
+				<SLEEP_TCS   2>,
+				<WAKE_TCS    2>,
+				<CONTROL_TCS 1>;
+
+			rpmhcc: clock-controller@1 {
+				compatible = "qcom,sdx65-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <1 13 0xf08>,
+			<1 12 0xf08>,
+			<1 10 0xf08>,
+			<1 11 0xf08>;
+		clock-frequency = <19200000>;
+	};
+};
-- 
2.7.4

