Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70344203104
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgFVH6S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbgFVH6Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:58:16 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C39C061794;
        Mon, 22 Jun 2020 00:58:16 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id y6so12875556edi.3;
        Mon, 22 Jun 2020 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3qiN9Q889K86I1/b4iDl+GuFwdf8syBpDSeWktazsiA=;
        b=LG5FXvzRyVpKgFHHkMRIsF+J4htH2YzV4iVVYFu0UfAbrkNf7OnG8URitHlE2yMWeK
         4ZKlIsOCKPmqnAz8bHmQAqwkHw01yHRWdGwri+PrtVaxiR+p+YvJ9AlGPM7QeguvN1R9
         iT8uRNowWhooWRTErM0ubRIVpJKiTZIcZC2j3Sua4uhEg2KeGO3eJwPgvhbzyqK+a3yK
         s0N+O3tk6vfOUa7+WjHM+/bfncX63sGIcpvaf8xgnZ/vd4wQ1F0gDWLsHJ+BCxHDz9Mx
         Jc3Mww6bCj5OnAsi/nccGf3tKc7xgjc2fB0CTuTkImvin3s5NQO3Nb53smvtH3CPGu69
         cXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3qiN9Q889K86I1/b4iDl+GuFwdf8syBpDSeWktazsiA=;
        b=BRYNma5InyX+ysyX0vQ5QW9l8m/Hd6p3CYkkrOu5deSVLtSCXsxhrXgeV5Z6Xz8M80
         ezIE2Bw70AhkQ6cRpeEbyBz6T5MXGh3jxvCyY7rpcaszkIO3DKaUbLqFL1m36/sSnqNN
         f0mKKCmB/hd9DKGfDjbAoa6ldPJbcJBPS8NX4/zg7wCMMinKy4uTrWf0OEh4ad3Ht8R5
         bYnMACB2TQ1GgLjrDq59FjXlGp+lV/IxLX2sXGWJxfpPULKWgNUz+jIAUOxSkWd4typj
         lf8n0jCeJ5PgFDSAzBzvYEs+0nw1Lrc3aDsAYueJP4Btx2IPuF+kAQ3xrpBrneRKpEhU
         bNLg==
X-Gm-Message-State: AOAM533KKUmsOKJTr5ccA3XUp63yBMlMorgjtqtkAsTPD6nO3BlAr/Ps
        3ZpkyyjNeyFWNg4fZZmrYwE=
X-Google-Smtp-Source: ABdhPJwFZ5T6ntpbNFxrmr8tPjgW3DQ6jS2XvdK7kzjjpZ0vk1zTPd00JQuFmtVO3xWpZkUoIvg89g==
X-Received: by 2002:a50:8465:: with SMTP id 92mr15118535edp.388.1592812694634;
        Mon, 22 Jun 2020 00:58:14 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b4sm10511606ejp.40.2020.06.22.00.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:58:14 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 6/8] arm64: dts: qcom: sdm630: Add sdm630 dts file
Date:   Mon, 22 Jun 2020 09:57:44 +0200
Message-Id: <20200622075749.21925-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622075749.21925-1-konradybcio@gmail.com>
References: <20200622075749.21925-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add devicetree files for SDM630 SoC and its pin configuration.
This commit adds basic nodes like cpu, psci and other required
configuration for booting up from eMMC to the serial console.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm630-pins.dtsi | 268 ++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi      | 991 ++++++++++++++++++++++
 2 files changed, 1259 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sdm630-pins.dtsi b/arch/arm64/boot/dts/qcom/sdm630-pins.dtsi
new file mode 100644
index 000000000000..55d80458f447
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-pins.dtsi
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+ &tlmm {
+	blsp1_uart1_default: blsp1_uart1_default {
+		config {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart1_sleep: blsp1_uart1_sleep {
+		config {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart2_default: blsp1_uart2_default {
+		config {
+			pins = "gpio4", "gpio5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart1_tx_active: blsp2_uart1_tx_active {
+		config {
+			pins = "gpio16";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart1_tx_sleep: blsp2_uart1_tx_sleep {
+		config {
+			pins = "gpio16";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	blsp2_uart1_rxcts_active: blsp2_uart1_rxcts_active {
+		config {
+			pins = "gpio17", "gpio18";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart1_rxcts_sleep: blsp2_uart1_rxcts_sleep {
+		config {
+			pins = "gpio17", "gpio18";
+			drive-strength = <2>;
+			bias-no-pull;
+		};
+	};
+
+	blsp2_uart1_rfr_active: blsp2_uart1_rfr_active {
+		config {
+			pins = "gpio19";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart1_rfr_sleep: blsp2_uart1_rfr_sleep {
+		config {
+			pins = "gpio19";
+			drive-strength = <2>;
+			bias-no-pull;
+		};
+	};
+
+	i2c1_default: i2c1_default {
+		config {
+			pins = "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c1_sleep: i2c1_sleep {
+		config {
+			pins = "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	i2c2_default: i2c2_default {
+		config {
+			pins = "gpio6", "gpio7";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c2_sleep: i2c2_sleep {
+		config {
+			pins = "gpio6", "gpio7";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	i2c3_default: i2c3_default {
+		config {
+			pins = "gpio10", "gpio11";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c3_sleep: i2c3_sleep {
+		config {
+			pins = "gpio10", "gpio11";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	i2c4_default: i2c4_default {
+		config {
+			pins = "gpio14", "gpio15";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c4_sleep: i2c4_sleep {
+		config {
+			pins = "gpio14", "gpio15";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	i2c5_default: i2c5_default {
+		config {
+			pins = "gpio18", "gpio19";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c5_sleep: i2c5_sleep {
+		config {
+			pins = "gpio18", "gpio19";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	i2c6_default: i2c6_default {
+		config {
+			pins = "gpio22", "gpio23";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c6_sleep: i2c6_sleep {
+		config {
+			pins = "gpio22", "gpio23";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	i2c7_default: i2c7_default {
+		config {
+			pins = "gpio26", "gpio27";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c7_sleep: i2c7_sleep {
+		config {
+			pins = "gpio26", "gpio27";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	i2c8_default: i2c8_default {
+		config {
+			pins = "gpio30", "gpio31";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c8_sleep: i2c8_sleep {
+		config {
+			pins = "gpio30", "gpio31";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	sdc1_clk_on: sdc1_clk_on {
+		config {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+	};
+
+	sdc1_clk_off: sdc1_clk_off {
+		config {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc1_cmd_on: sdc1_cmd_on {
+		config {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+	};
+
+	sdc1_cmd_off: sdc1_cmd_off {
+		config {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc1_data_on: sdc1_data_on {
+		config {
+			pins = "sdc1_data";
+			bias-pull-up;
+			drive-strength = <8>;
+		};
+	};
+
+	sdc1_data_off: sdc1_data_off {
+		config {
+			pins = "sdc1_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc1_rclk_on: sdc1_rclk_on {
+		config {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc1_rclk_off: sdc1_rclk_off {
+		config {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
new file mode 100644
index 000000000000..4bf84c44068c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -0,0 +1,991 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-sdm660.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Qualcomm Technologies, Inc. SDM630";
+	compatible = "qcom,sdm630";
+
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen { };
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		wlan_msa_guard: wlan_msa_guard@85600000 {
+			reg = <0x0 0x85600000 0x0 0x100000>;
+			no-map;
+		};
+
+		wlan_msa_mem: wlan_msa_mem@85700000 {
+			reg = <0x0 0x85700000 0x0 0x100000>;
+			no-map;
+		};
+
+		qhee_code: qhee_code@85800000 {
+			reg = <0x0 0x85800000 0x0 0x3700000>;
+			no-map;
+		};
+
+		smem_region: smem-mem@86000000 {
+			reg = <0 0x86000000 0 0x200000>;
+			no-map;
+		};
+
+		tz_mem: memory@86200000 {
+			reg = <0x0 0x86200000 0x0 0x3300000>;
+			no-map;
+		};
+
+		modem_fw_mem: modem_fw_region@8ac00000 {
+			reg = <0x0 0x8ac00000 0x0 0x7e00000>;
+			no-map;
+		};
+
+		adsp_fw_mem: adsp_fw_region@92a00000 {
+			reg = <0x0 0x92a00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_mba_mem: pil_mba_region@94800000 {
+			reg = <0x0 0x94800000 0x0 0x200000>;
+			no-map;
+		};
+
+		buffer_mem: buffer_region@94a00000 {
+			reg = <0x0 0x94a00000 0x0 0x100000>;
+			no-map;
+		};
+
+		venus_fw_mem: venus_fw_region@9f800000 {
+			reg = <0x0 0x9f800000 0x0 0x800000>;
+			no-map;
+		};
+
+		secure_region2: secure_region2@f7c00000 {
+			reg = <0x0 0xf7c00000 0x0 0x5c00000>;
+			no-map;
+		};
+
+		adsp_mem: adsp_region@f6000000 {
+			reg = <0x0 0xf6000000 0x0 0x800000>;
+			no-map;
+		};
+
+		qseecom_ta_mem: qseecom_ta_region@fec00000 {
+			reg = <0x0 0xfec00000 0x0 0x1000000>;
+			no-map;
+		};
+
+		qseecom_mem: qseecom_region@f6800000 {
+			reg = <0x0 0xf6800000 0x0 0x1400000>;
+			no-map;
+		};
+
+		secure_display_memory: secure_region@f5c00000 {
+			reg = <0x0 0xf5c00000 0x0 0x5c00000>;
+			no-map;
+		};
+
+		cont_splash_mem: cont_splash_region@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x23ff000>;
+			no-map;
+		};
+	};
+
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "xo_board";
+		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32764>;
+			clock-output-names = "sleep_clk";
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&PERF_CPU_SLEEP_0
+						&PERF_CPU_SLEEP_1
+						&PERF_CLUSTER_SLEEP_0
+						&PERF_CLUSTER_SLEEP_1
+						&PERF_CLUSTER_SLEEP_2>;
+			capacity-dmips-mhz = <1126>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_1>;
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU1: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			cpu-idle-states = <&PERF_CPU_SLEEP_0
+						&PERF_CPU_SLEEP_1
+						&PERF_CLUSTER_SLEEP_0
+						&PERF_CLUSTER_SLEEP_1
+						&PERF_CLUSTER_SLEEP_2>;
+			capacity-dmips-mhz = <1126>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_1>;
+		};
+
+		CPU2: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x102>;
+			enable-method = "psci";
+			cpu-idle-states = <&PERF_CPU_SLEEP_0
+						&PERF_CPU_SLEEP_1
+						&PERF_CLUSTER_SLEEP_0
+						&PERF_CLUSTER_SLEEP_1
+						&PERF_CLUSTER_SLEEP_2>;
+			capacity-dmips-mhz = <1126>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_1>;
+		};
+
+		CPU3: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x103>;
+			enable-method = "psci";
+			cpu-idle-states = <&PERF_CPU_SLEEP_0
+						&PERF_CPU_SLEEP_1
+						&PERF_CLUSTER_SLEEP_0
+						&PERF_CLUSTER_SLEEP_1
+						&PERF_CLUSTER_SLEEP_2>;
+			capacity-dmips-mhz = <1126>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_1>;
+		};
+
+		CPU4: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&PWR_CPU_SLEEP_0
+						&PWR_CPU_SLEEP_1
+						&PWR_CLUSTER_SLEEP_0
+						&PWR_CLUSTER_SLEEP_1
+						&PWR_CLUSTER_SLEEP_2>;
+			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU5: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			cpu-idle-states = <&PWR_CPU_SLEEP_0
+						&PWR_CPU_SLEEP_1
+						&PWR_CLUSTER_SLEEP_0
+						&PWR_CLUSTER_SLEEP_1
+						&PWR_CLUSTER_SLEEP_2>;
+			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU6: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+			cpu-idle-states = <&PWR_CPU_SLEEP_0
+						&PWR_CPU_SLEEP_1
+						&PWR_CLUSTER_SLEEP_0
+						&PWR_CLUSTER_SLEEP_1
+						&PWR_CLUSTER_SLEEP_2>;
+			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU7: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+			cpu-idle-states = <&PWR_CPU_SLEEP_0
+						&PWR_CPU_SLEEP_1
+						&PWR_CLUSTER_SLEEP_0
+						&PWR_CLUSTER_SLEEP_1
+						&PWR_CLUSTER_SLEEP_2>;
+			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
+
+				core2 {
+					cpu = <&CPU6>;
+				};
+
+				core3 {
+					cpu = <&CPU7>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			PWR_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "pwr-retention";
+				arm,psci-suspend-param = <0x40000002>;
+				entry-latency-us = <338>;
+				exit-latency-us = <423>;
+				min-residency-us = <200>;
+			};
+
+			PWR_CPU_SLEEP_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "pwr-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <515>;
+				exit-latency-us = <1821>;
+				min-residency-us = <1000>;
+				local-timer-stop;
+			};
+
+			PERF_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "perf-retention";
+				arm,psci-suspend-param = <0x40000002>;
+				entry-latency-us = <154>;
+				exit-latency-us = <87>;
+				min-residency-us = <200>;
+			};
+
+			PERF_CPU_SLEEP_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "perf-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <262>;
+				exit-latency-us = <301>;
+				min-residency-us = <1000>;
+				local-timer-stop;
+			};
+
+			PWR_CLUSTER_SLEEP_0: cluster-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "pwr-cluster-dynamic-retention";
+				arm,psci-suspend-param = <0x400000F2>;
+				entry-latency-us = <284>;
+				exit-latency-us = <384>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+
+			PWR_CLUSTER_SLEEP_1: cluster-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "pwr-cluster-retention";
+				arm,psci-suspend-param = <0x400000F3>;
+				entry-latency-us = <338>;
+				exit-latency-us = <423>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+
+			PWR_CLUSTER_SLEEP_2: cluster-sleep-0-2 {
+				compatible = "arm,idle-state";
+				idle-state-name = "pwr-cluster-retention";
+				arm,psci-suspend-param = <0x400000F4>;
+				entry-latency-us = <515>;
+				exit-latency-us = <1821>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+
+			PERF_CLUSTER_SLEEP_0: cluster-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "perf-cluster-dynamic-retention";
+				arm,psci-suspend-param = <0x400000F2>;
+				entry-latency-us = <272>;
+				exit-latency-us = <329>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+
+			PERF_CLUSTER_SLEEP_1: cluster-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "perf-cluster-retention";
+				arm,psci-suspend-param = <0x400000F3>;
+				entry-latency-us = <332>;
+				exit-latency-us = <368>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+
+			PERF_CLUSTER_SLEEP_2: cluster-sleep-1-2 {
+				compatible = "arm,idle-state";
+				idle-state-name = "perf-cluster-retention";
+				arm,psci-suspend-param = <0x400000F4>;
+				entry-latency-us = <545>;
+				exit-latency-us = <1609>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+		};
+	};
+
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8998", "qcom,scm";
+		};
+	};
+
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_block 0 0x1000>;
+		#hwlock-cells = <1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	rpm-glink {
+		compatible = "qcom,glink-rpm";
+
+		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		mboxes = <&apcs_glb 0>;
+
+		rpm_requests: rpm-requests {
+			compatible = "qcom,rpm-sdm660";
+			qcom,glink-channels = "rpm_requests";
+
+			rpmcc: clock-controller {
+				compatible = "qcom,rpmcc-sdm660", "qcom,rpmcc";
+				#clock-cells = <1>;
+			};
+		};
+	};
+
+	smem: smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_region>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	tcsr_mutex_block: syscon@1f40000 {
+		compatible = "syscon";
+		reg = <0 0x1f40000 0 0x20000>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 1 0xf08>,
+				 <GIC_PPI 2 0xf08>,
+				 <GIC_PPI 3 0xf08>,
+				 <GIC_PPI 0 0xf08>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+		compatible = "simple-bus";
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,gcc-sdm630";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x100000 0x94000>;
+
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo_board>,
+					<&sleep_clk>;
+		};
+
+		rng: rng@793000 {
+			compatible = "qcom,prng-ee";
+			reg = <0x793000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			reg = <0x17a00000 0x10000>,	   /* GICD */
+				  <0x17b00000 0x100000>;	  /* GICR * 8 */
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		restart@10ac000 {
+			compatible = "qcom,pshold";
+			reg = <0x10ac000 0x4>;
+		};
+
+		tcsr_mutex_regs: syscon@1f40000 {
+			compatible = "syscon";
+			reg = <0x01f40000 0x20000>;
+		};
+
+		rpm_msg_ram: memory@778000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x778000 0x7000>;
+		};
+
+		qfprom: qfprom@780000 {
+			compatible = "qcom,qfprom";
+			reg = <0x780000 0x621c>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
+		apcs_glb: mailbox@17911000 {
+			compatible = "qcom,msm8998-apcs-hmss-global";
+			reg = <0x17911000 0x1000>;
+
+			#mbox-cells = <1>;
+		};
+
+		tlmm: pinctrl@3000000 {
+			compatible = "qcom,sdm630-pinctrl";
+			reg = <0x3000000 0xc00000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <0x2>;
+			interrupt-controller;
+			#interrupt-cells = <0x2>;
+		};
+
+		spmi_bus: spmi@800f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg =	<0x0800f000 0x1000>,
+				<0x08400000 0x1000000>,
+				<0x09400000 0x1000000>,
+				<0x0a400000 0x220000>,
+				<0x0800a000 0x3000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
+		timer@17920000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x17920000 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@17921000 {
+				frame-number = <0>;
+				interrupts = <0 8 0x4>,
+						<0 7 0x4>;
+				reg = <0x17921000 0x1000>,
+					<0x17922000 0x1000>;
+			};
+
+			frame@17923000 {
+				frame-number = <1>;
+				interrupts = <0 9 0x4>;
+				reg = <0x17923000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17924000 {
+				frame-number = <2>;
+				interrupts = <0 10 0x4>;
+				reg = <0x17924000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17925000 {
+				frame-number = <3>;
+				interrupts = <0 11 0x4>;
+				reg = <0x17925000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17926000 {
+				frame-number = <4>;
+				interrupts = <0 12 0x4>;
+				reg = <0x17926000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17927000 {
+				frame-number = <5>;
+				interrupts = <0 13 0x4>;
+				reg = <0x17927000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17928000 {
+				frame-number = <6>;
+				interrupts = <0 14 0x4>;
+				reg = <0x17928000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		sdhc_1: sdhci@c0c4000 {
+			compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0xc0c4000 0x1000>,
+				<0xc0c5000 0x1000>;
+			reg-names = "hc", "cqhci";
+
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+					<&gcc GCC_SDCC1_AHB_CLK>,
+					<&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on &sdc1_rclk_on>;
+			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off &sdc1_rclk_off>;
+
+			bus-width = <8>;
+			non-removable;
+
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+
+			status = "disabled";
+		};
+
+		anoc2_smmu: iommu@16c0000 {
+			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
+			reg = <0x016c0000 0x40000>;
+			#iommu-cells = <1>;
+
+			#global-interrupts = <2>;
+			interrupts =
+				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+
+				<GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 374 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 375 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 376 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 377 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 378 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		lpass_smmu: iommu@5100000 {
+			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
+			reg = <0x5100000 0x40000>;
+			#iommu-cells = <1>;
+
+			#global-interrupts = <2>;
+			interrupts =
+				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+
+				<GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		mmss_smmu: iommu@cd00000 {
+			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
+			reg = <0xcd00000 0x40000>;
+			#iommu-cells = <1>;
+
+			#global-interrupts = <2>;
+			interrupts =
+				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+
+				<GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		kgsl_smmu: iommu@5040000 {
+			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
+			reg = <0x5040000 0x10000>;
+			#iommu-cells = <1>;
+
+			#global-interrupts = <2>;
+			interrupts =
+				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+
+				<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		blsp1_dma: dma@c144000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0c144000 0x1f000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <18>;
+			qcom,num-ees = <4>;
+		};
+
+		blsp2_dma: dma@c184000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0xc184000 0x1f000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <18>;
+			qcom,num-ees = <4>;
+		};
+
+		blsp_i2c1: i2c@c175000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c175000 0x600>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+					<&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c1_default>;
+			pinctrl-1 = <&i2c1_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c2: i2c@c176000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c176000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c2_default>;
+			pinctrl-1 = <&i2c2_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c3: i2c@c177000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c177000 0x600>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c3_default>;
+			pinctrl-1 = <&i2c3_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c4: i2c@c178000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c178000 0x600>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c4_default>;
+			pinctrl-1 = <&i2c4_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c5: i2c@c1b5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b5000 0x600>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c5_default>;
+			pinctrl-1 = <&i2c5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c6: i2c@c1b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b6000 0x600>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c6_default>;
+			pinctrl-1 = <&i2c6_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c7: i2c@c1b7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b7000 0x600>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c7_default>;
+			pinctrl-1 = <&i2c7_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c8: i2c@c1b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b8000 0x600>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c8_default>;
+			pinctrl-1 = <&i2c8_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_uart1: serial@c16f000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xc16f000 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 0>, <&blsp1_dma 1>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart1_default>;
+			pinctrl-1 = <&blsp1_uart1_sleep>;
+			status = "disabled";
+		};
+
+		blsp1_uart2: serial@c170000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xc170000 0x1000>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 2>, <&blsp1_dma 3>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			status = "disabled";
+		};
+
+		blsp2_uart1: serial@c1af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xc1af000 0x200>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART1_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 0>, <&blsp2_dma 1>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_uart1_tx_active &blsp2_uart1_rxcts_active
+				&blsp2_uart1_rfr_active>;
+			pinctrl-1 = <&blsp2_uart1_tx_sleep &blsp2_uart1_rxcts_sleep
+				&blsp2_uart1_rfr_sleep>;
+			status = "disabled";
+		};
+	};
+};
+
+#include "sdm630-pins.dtsi"
-- 
2.27.0

