Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6EE3AAB40
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 07:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhFQFst (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 01:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhFQFsp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 01:48:45 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEC5C06124C
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:46:37 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id g22so4038325pgk.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9udT7I8BfAMQefFS84W19kfaFhVv/R2kkzX0G2YdzLk=;
        b=VWxLIBB7V8EvMDoaIAzxOqEfJ3k9r1vGh6nsjC855M0IbtgGlL6l3i2NguVY7QSufc
         WDWmX+JN6SAua2Q/Z+9M9JeLX8jrpgZ6eVYFP2atRtxML+FvHEIPoJG4dNxloGJezqH1
         UH+frxVeL3yn1GBWOdQ+O3Yc0h/HlYm9FWjd+uOf12Zt7JgGiE9U31XKDrrH2uxUT8VE
         MkI+QBwLFEX+hAXmscEzo34bnytTL5IyJgz2v7OemUs0chcDT4AYAyq6DyfGgMHZupsh
         TJ685fnMetFBBdxyft+0UuZ/aL3q6XxlQu4IP7SFB44YrKdboqhdkDEJneyKjzNDBFPz
         B+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9udT7I8BfAMQefFS84W19kfaFhVv/R2kkzX0G2YdzLk=;
        b=Dn5b6w0RjCz+kGQFrkXk/BvLUEF2T7C1+nPtQ8OOfSmq6RamhQETTwN4tgsJt7J65E
         lwuTB1sLSd2BnQIVUO+6uVs5i8+YLlKGZPhyJf9QVXRX5gjP2RLaPmcQDT5VNl+CXOS3
         KZPcqtTjBo1oFu8Gx/z+DbBGoAeF4JL1MsrjF92UeILHR3rNrzhioMakrVDXLAAKeNDE
         YMDlfQKIl0dn+rdRVrRRD8ImmAwVwuzBsVWuhFtt4pOAFKlS19U9U6fot/LegMcH4s5p
         hba2JlJYzZRVpwUkfev+VN/7c21a0qKRVIkW8+nNpJDP1uXvLRIPZp/5wkkfjC56Z7b8
         hWsg==
X-Gm-Message-State: AOAM530lo94VRv3fcn42p2MO3PYo//jQv1vc0JE+N2DXa+IJcOqz7gsR
        SuUv8zmld6aimLyntHOWHU0TVQ==
X-Google-Smtp-Source: ABdhPJzLojvsg0C1FM/PUqLL04Jwi0B0jgdX08ndywkvtHQD5F0EXYbr8yZX0LZwwsH7ayw0T2MJ8Q==
X-Received: by 2002:a62:d447:0:b029:291:19f7:ddcd with SMTP id u7-20020a62d4470000b029029119f7ddcdmr3668686pfl.54.1623908797234;
        Wed, 16 Jun 2021 22:46:37 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id y27sm3882700pff.202.2021.06.16.22.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:46:36 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 5/5] arm64: dts: qcom: sa8155p-adp: Add base dts file
Date:   Thu, 17 Jun 2021 11:15:48 +0530
Message-Id: <20210617054548.353293-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
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

Cc: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile        |   1 +
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 360 +++++++++++++++++++++++
 2 files changed, 361 insertions(+)
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
index 000000000000..86bfbd29cda0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -0,0 +1,360 @@
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
+		regulator-allow-set-load;
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
+			regulator-allow-set-load;
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
+			regulator-allow-set-load;
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
+			regulator-allow-set-load;
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
+			regulator-allow-set-load;
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

