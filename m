Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4713A7876
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 09:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbhFOHwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 03:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhFOHwK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 03:52:10 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08EFC0613A4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:50:05 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id e7so8026825plj.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GMhPu3BiG5kAU5dJHB11IoT/djSJ1XjVnSCY4gcI06g=;
        b=YyZVwktBXjMFhvQVZcpFcEEzN+k8Lfb+ohGd0bWY+HDCI27+MopnD3GskmC+JxVGXI
         u0zzEqcL6cV/YSpTbUT5jjzA7CZHzRnfAvzYYUQAcrGFY0x2jUa/qmGCf1ry4bIwc4et
         QyzAu5wseC5LVC/2Z/qPUrnWdyC0M1B2z5SXh97W/dQVg4qqtFZ4V72Q7vmR/BPZ4EhO
         Es+w93w9SbgdwtuCn1LQHvgGt/epBLJhpWNde/q6+KvZrmqwCYXldl7TSSL7ZMHIEYKD
         JqlBoUOWcMQ0dPPONZ5p97hLLadA+pYpLvUJ06Sqd4WnTVMMLBx/K3i7tJUHgpohUGho
         IgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GMhPu3BiG5kAU5dJHB11IoT/djSJ1XjVnSCY4gcI06g=;
        b=N4cZXOsYmBHxYJel0m8aK09yLyrymenDoTJAsn7saRafRa5X34WLbNGavD6UUmcUjd
         /of+YRiAaxsCPewErRz4TnJo2iXO1ExIc9Y3p47h0TXeHXqWoPr3Hroe5Gqmxi0eA8S0
         noAVkF2wRL1MWZUccjd6Zg+kHi0QDHaeWSawqUv+nfSKX3I3vF2HPnr2b6aHb9MOjBEi
         Z2AwBdOsV7o6ZLaWRnlY0l/X1ULzx5TfJq0/2sWTlB6PlW7gnMjoM6xEu3XOqPw9Crks
         EL/X0nAM2SS5JcO/AjaZonewq3VeeB8hsTsJ/JHslnOzNQxIMfglVB2lYxo3Mwd0iuut
         Gsaw==
X-Gm-Message-State: AOAM53366ip0tjry4IHYGhkOrX5FugdxBC0ppkt8ZMw48tFA8vFcWVGZ
        V3tiDeEmoflruF7suBGZX+O95w==
X-Google-Smtp-Source: ABdhPJzMLLh2FGnKBaUEAk1b5liA91SuEiLtD/c3udH4Ljtz82RNPfydMj7VPHHjLlS0rfdL0piNUw==
X-Received: by 2002:a17:902:d3ca:b029:104:ebfd:a554 with SMTP id w10-20020a170902d3cab0290104ebfda554mr2325454plb.13.1623743405280;
        Tue, 15 Jun 2021 00:50:05 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:50:04 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 10/10] arm64: dts: qcom: sa8155p-adp: Add base dts file
Date:   Tue, 15 Jun 2021 13:15:43 +0530
Message-Id: <20210615074543.26700-11-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add base DTS file for SA8155p Automotive Development Platform.
It enables boot to console, adds tlmm reserved range and ufs flash.
It also includes pmic file.

SA8155p-adp board is based on sa8155p Qualcomm Snapdragon SoC.
SA8155p platform is similar to the SM8150, so use this as base
for now.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile        |   1 +
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 355 +++++++++++++++++++++++
 2 files changed, 356 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8155p-adp.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 456502aeee49..666f3528697d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-oneplus-dumpling.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
new file mode 100644
index 000000000000..95e0a6612e6b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "sm8150.dtsi"
+#include "pmm8155au_1.dtsi"
+#include "pmm8155au_2.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8155P ADP";
+	compatible = "qcom,sa8155p-adp", "qcom,sa8155p";
+
+	aliases {
+		serial0 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	vreg_3p3: vreg_3p3_regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	/*
+	 * S4A is always on and not controllable through RPMh.
+	 * So model it as a fixed regulator.
+	 */
+	vreg_s4a_1p8: smps4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_3p3>;
+	};
+};
+
+&apps_rsc {
+	pmm8155au-1-rpmh-regulators {
+		compatible = "qcom,pmm8155au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vreg_3p3>;
+		vdd-s2-supply = <&vreg_3p3>;
+		vdd-s3-supply = <&vreg_3p3>;
+		vdd-s4-supply = <&vreg_3p3>;
+		vdd-s5-supply = <&vreg_3p3>;
+		vdd-s6-supply = <&vreg_3p3>;
+		vdd-s7-supply = <&vreg_3p3>;
+		vdd-s8-supply = <&vreg_3p3>;
+		vdd-s9-supply = <&vreg_3p3>;
+		vdd-s10-supply = <&vreg_3p3>;
+
+		vdd-l1-l8-l11-supply = <&vreg_s6a_0p92>;
+		vdd-l2-l10-supply = <&vreg_3p3>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p92>;
+		vdd-l6-l9-supply = <&vreg_s6a_0p92>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
+		vdd-l13-l16-l17-supply = <&vreg_3p3>;
+
+		vreg_s5a_2p04: smps5 {
+			regulator-name = "vreg_s5a_2p04";
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_s6a_0p92: smps6 {
+			regulator-name = "vreg_s6a_0p92";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		vreg_l1a_0p752: ldo1 {
+			regulator-name = "vreg_l1a_0p752";
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_usb_hs_3p1:
+		vreg_l2a_3p072: ldo2 {
+			regulator-name = "vreg_l2a_3p072";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_0p8: ldo3 {
+			regulator-name = "vreg_l3a_0p8";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_usb_hs_core:
+		vdda_usb_ss_dp_core_1:
+		vreg_l5a_0p88: ldo5 {
+			regulator-name = "vreg_l5a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-name = "vreg_l7a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_2p96: ldo10 {
+			regulator-name = "vreg_l10a_2p96";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a_0p8: ldo11 {
+			regulator-name = "vreg_l11a_0p8";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_usb_hs_1p8:
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_2p7: ldo13 {
+			regulator-name = "vreg_l13a_2p7";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p7: ldo15 {
+			regulator-name = "vreg_l15a_1p7";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-name = "vreg_l16a_2p7";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_2p96: ldo17 {
+			regulator-name = "vreg_l17a_2p96";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pmm8155au-2-rpmh-regulators {
+		compatible = "qcom,pmm8155au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vreg_3p3>;
+		vdd-s2-supply = <&vreg_3p3>;
+		vdd-s3-supply = <&vreg_3p3>;
+		vdd-s4-supply = <&vreg_3p3>;
+		vdd-s5-supply = <&vreg_3p3>;
+		vdd-s6-supply = <&vreg_3p3>;
+		vdd-s7-supply = <&vreg_3p3>;
+		vdd-s8-supply = <&vreg_3p3>;
+		vdd-s9-supply = <&vreg_3p3>;
+		vdd-s10-supply = <&vreg_3p3>;
+
+		vdd-l1-l8-l11-supply = <&vreg_s4c_1p352>;
+		vdd-l2-l10-supply = <&vreg_3p3>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s4c_1p352>;
+		vdd-l6-l9-supply = <&vreg_s6c_1p128>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5c_2p04>;
+		vdd-l13-l16-l17-supply = <&vreg_3p3>;
+
+		vreg_s4c_1p352: smps4 {
+			regulator-name = "vreg_s4c_1p352";
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		vreg_s5c_2p04: smps5 {
+			regulator-name = "vreg_s5c_2p04";
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_s6c_1p128: smps6 {
+			regulator-name = "vreg_s6c_1p128";
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		vreg_l1c_1p304: ldo1 {
+			regulator-name = "vreg_l1c_1p304";
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p808: ldo2 {
+			regulator-name = "vreg_l2c_1p808";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p2: ldo5 {
+			regulator-name = "vreg_l5c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_1p8: ldo7 {
+			regulator-name = "vreg_l7c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p2: ldo8 {
+			regulator-name = "vreg_l8c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-name = "vreg_l10c_3p3";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_0p8: ldo11 {
+			regulator-name = "vreg_l11c_0p8";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12c_1p808: ldo12 {
+			regulator-name = "vreg_l12c_1p808";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13c_2p96: ldo13 {
+			regulator-name = "vreg_l13c_2p96";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15c_1p9: ldo15 {
+			regulator-name = "vreg_l15c_1p9";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16c_3p008: ldo16 {
+			regulator-name = "vreg_l16c_3p008";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18c_0p88: ldo18 {
+			regulator-name = "vreg_l18c_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>;
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l10a_2p96>;
+	vcc-max-microamp = <750000>;
+	vccq-supply = <&vreg_l5c_1p2>;
+	vccq-max-microamp = <700000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <750000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l8c_1p2>;
+	vdda-max-microamp = <87100>;
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda-pll-max-microamp = <18300>;
+};
+
+
+&usb_1_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vdd_usb_hs_core>;
+	vdda33-supply = <&vdda_usb_hs_3p1>;
+	vdda18-supply = <&vdda_usb_hs_1p8>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l8c_1p2>;
+	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
-- 
2.31.1

