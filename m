Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5968C3D8FD5
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236701AbhG1N4A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbhG1Nz7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:55:59 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077D8C061757;
        Wed, 28 Jul 2021 06:55:57 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id a19so1384828qtx.1;
        Wed, 28 Jul 2021 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fzfJBpsW9LQ1byhl5Qbe52ryPkD6kD9sFlfbAy36zEo=;
        b=vZJGJbTbSrB8Rn0kzviwisWYTIbSDRtg0XNJN0Va58F+7Iorqmzy2QnV6WHsKutK+T
         vEAoTf17u2vNh1pUp0s4Hko4jMTDJ9hupwN2xtxznHnAGZ1EMCnU+oCW/Yg0vaBJoas8
         qA6cYnBbsveqraOcCE8rsbNbO6zCDRLuzEC+xNrcg1wsNBrH5alS8Kg1Z/0Qo0dAbMxP
         0q1yzDP7hrgO+9amUCdczFIILYoDDD2ClSXTMyUOQA2FvlP/3cAmVp7NrYxn0y1zasqC
         F87TetUZH9SpzIoBkm9JpNiCvaBt4EaaNPxmAH9JG6yzC+LGm+2MW8cgWCRfcTDLOU+H
         o++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fzfJBpsW9LQ1byhl5Qbe52ryPkD6kD9sFlfbAy36zEo=;
        b=fJoAi3doSPSqoMUUBXPMWu9NM7SYxv0hC/Pm5O0yBAIeNmqDfyZ7D6ASEP8bbjFAuc
         5Te8txmHzr1luNbRx4+xAvaJlzUPBd/FuGcN9TFQMrW2eKC6X8u404Mkg03ymvWOj9MJ
         UgOoOIorYydd2+y6kwG1eqzisZYjNJm//xv9rkO4drmWY2tvxkv92taNBhSdtBf8/h2C
         jQxnXK0p/7VM41Y1FdmVw0j0BIemIhKvn/G3y1ffImN55o2+Tapdt98RY+I/3oqFAsiU
         8/8mhI/jFN26TBvQzmOop4yhkDa1qqYIzX/prDetVz30VG0kb50WdCRLwq2WoNeHF2HK
         Idgg==
X-Gm-Message-State: AOAM531Kwx2JvtozTCVaX4Fr0tBmcjkwDechQSjvIvorsPUaWeLDl2r1
        7wAlnEJ80HH9MfofxtOSn6c=
X-Google-Smtp-Source: ABdhPJxuxPUzKe2BkmJUdEAKLZHA+kAye4TqqEzzemHQEfGQv1NrXoOCzHztSASET+boWh59n2jouQ==
X-Received: by 2002:ac8:7691:: with SMTP id g17mr23970620qtr.287.1627480556152;
        Wed, 28 Jul 2021 06:55:56 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:55 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 5/9] arm64: dts: rockchip: add rk3568 tsadc nodes
Date:   Wed, 28 Jul 2021 09:55:30 -0400
Message-Id: <20210728135534.703028-6-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the thermal and tsadc nodes to the rk3568 device tree.
There are two sensors, one for the cpu, one for the gpu.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 .../boot/dts/rockchip/rk3568-pinctrl.dtsi     |  6 ++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 71 +++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
index a588ca95ace2..b464c7bda1f7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
@@ -2420,6 +2420,12 @@ spi3m1_cs1: spi3m1-cs1 {
 	};
 
 	tsadc {
+		/omit-if-no-ref/
+		tsadc_gpio: tsadc-gpio {
+			rockchip,pins =
+				<0 RK_PA1 0 &pcfg_pull_none>;
+		};
+
 		/omit-if-no-ref/
 		tsadcm0_shut: tsadcm0-shut {
 			rockchip,pins =
diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 77c679304916..0905fac0726a 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -51,6 +51,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			clocks = <&scmi_clk 0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
@@ -59,6 +60,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
@@ -67,6 +69,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
@@ -75,6 +78,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x300>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
@@ -774,6 +778,73 @@ uart9: serial@fe6d0000 {
 		status = "disabled";
 	};
 
+	thermal_zones: thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsadc 0>;
+
+			trips {
+				cpu_alert0: cpu_alert0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_alert1: cpu_alert1 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit: cpu_crit {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu_thermal: gpu-thermal {
+			polling-delay-passive = <20>; /* milliseconds */
+			polling-delay = <1000>; /* milliseconds */
+
+			thermal-sensors = <&tsadc 1>;
+		};
+	};
+
+	tsadc: tsadc@fe710000 {
+		compatible = "rockchip,rk3568-tsadc";
+		reg = <0x0 0xfe710000 0x0 0x100>;
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks = <&cru CLK_TSADC_TSEN>, <&cru CLK_TSADC>;
+		assigned-clock-rates = <17000000>, <700000>;
+		clocks = <&cru CLK_TSADC>, <&cru PCLK_TSADC>;
+		clock-names = "tsadc", "apb_pclk";
+		resets = <&cru SRST_TSADC>, <&cru SRST_P_TSADC>,
+			 <&cru SRST_TSADCPHY>;
+		reset-names = "tsadc", "tsadc-apb", "tsadc-phy";
+		rockchip,grf = <&grf>;
+		rockchip,hw-tshut-temp = <95000>;
+		rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
+		rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
+		pinctrl-names = "gpio", "otpout";
+		pinctrl-0 = <&tsadc_gpio>;
+		pinctrl-1 = <&tsadc_shutorg>;
+		#thermal-sensor-cells = <1>;
+		status = "disabled";
+	};
+
 	saradc: saradc@fe720000 {
 		compatible = "rockchip,rk3568-saradc", "rockchip,rk3399-saradc";
 		reg = <0x0 0xfe720000 0x0 0x100>;
-- 
2.25.1

