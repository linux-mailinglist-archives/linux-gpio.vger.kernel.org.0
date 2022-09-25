Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD6985E91CA
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Sep 2022 11:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiIYJTP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Sep 2022 05:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiIYJTO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Sep 2022 05:19:14 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFF82870F
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 02:19:12 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q17so4424054lji.11
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RJEC3Wa3Nu/j2szdJxfJeQwaQLH0rdEerwg0n34MB5w=;
        b=T5H4otdQs+z7xVO7xIy7aZwQbJ1JSeZ2oer1kyFurbWCaiPfhoNpGrRvPgL7XCPNly
         rffW+NOuRYOve6uePF6qklLO47ZjZlButFZ9wz7vuowzdEMBAf6SxkAsLx0HA+1Pz/8r
         t7D35021C/3lnvaGZ+l3+LiJU+b+2ke1nzgfgO8NJB/tL+l128456UMAfzucQZXw85Si
         QYx9E2YD3kuengMXfu+mer0ae8q4UZVgA3wB3a0NDvkIdPGxg5xOnIPz51XcbmFoNgXf
         TS87APXrGooXlH6+fnycxhyGfP1I9NofD8ZIdGXhaIqGCs3Br90Nnnn9VjqFABrZK41K
         tk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RJEC3Wa3Nu/j2szdJxfJeQwaQLH0rdEerwg0n34MB5w=;
        b=UoIvLXMblLLsR3HG9T9yczVji8VkSyOLkvx+k4Py/J/wDSQq2bYHomcvE9l2/EQ3Rr
         dl7C3TFTmRPtZBEBsM6PoYZJYce1SwDCXa3ZjYONkfKIJ+R8JttOGspQtQe8j8pgHkVj
         CvbYxaAFzPLzzGWSwj8CAFOroIfUAeB+H2cxG6Quo7AXWynMOF0fjpYm7JuL4lKteaS4
         Y2bIVAz7mWJJGJ16DXRtGPRCr/DX+ogEjWxGMDkuU7w9hii9VPj8u+F/8544xQMAZ1wO
         Zzk/97DMw5Tzl83seru5+Gkcic7Dwnj0PlSL8IG3FdSKp+8YRMa+WF9ooL8n1EKMsV5a
         TwwA==
X-Gm-Message-State: ACrzQf2eo8bYyxclqTzR+snjQLPoz9T01EhSVWX9v7AiFB24AjPr8Yut
        BrebGBRrrUkmwEfrKXpTjPzqY+k1gyy2wQ==
X-Google-Smtp-Source: AMsMyM7Hzb3nowFz0AWYzqKa0PUChFiBG4aXbZWcZlO3jA/NU60uXMvo5dxpu78aHwHgkXqh9yf96A==
X-Received: by 2002:a2e:575c:0:b0:26a:9f39:b3f7 with SMTP id r28-20020a2e575c000000b0026a9f39b3f7mr5806229ljd.315.1664097551180;
        Sun, 25 Sep 2022 02:19:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b00492e98c27ebsm2161301lfo.91.2022.09.25.02.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 02:19:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: qcom: restrict drivers per ARM/ARM64
Date:   Sun, 25 Sep 2022 11:19:08 +0200
Message-Id: <20220925091908.34836-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no point to allow selecting pin-controller drivers for Qualcomm
ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
kernel configuration more difficult as many do not remember the Qualcomm
SoCs.  There won't be a single image for ARMv7 and ARMv8/9 SoCs, so no
features/options are lost.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 2961b5eb8e10..bb1b4dd440d0 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -15,6 +15,7 @@ config PINCTRL_MSM
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -23,6 +24,7 @@ config PINCTRL_APQ8064
 config PINCTRL_APQ8084
 	tristate "Qualcomm APQ8084 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -31,6 +33,7 @@ config PINCTRL_APQ8084
 config PINCTRL_IPQ4019
 	tristate "Qualcomm IPQ4019 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -39,6 +42,7 @@ config PINCTRL_IPQ4019
 config PINCTRL_IPQ8064
 	tristate "Qualcomm IPQ8064 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -47,6 +51,7 @@ config PINCTRL_IPQ8064
 config PINCTRL_IPQ8074
 	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -57,6 +62,7 @@ config PINCTRL_IPQ8074
 config PINCTRL_IPQ6018
 	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -67,6 +73,7 @@ config PINCTRL_IPQ6018
 config PINCTRL_MSM8226
 	tristate "Qualcomm 8226 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -76,6 +83,7 @@ config PINCTRL_MSM8226
 config PINCTRL_MSM8660
 	tristate "Qualcomm 8660 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -84,6 +92,7 @@ config PINCTRL_MSM8660
 config PINCTRL_MSM8960
 	tristate "Qualcomm 8960 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -100,6 +109,7 @@ config PINCTRL_MDM9607
 config PINCTRL_MDM9615
 	tristate "Qualcomm 9615 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -108,6 +118,7 @@ config PINCTRL_MDM9615
 config PINCTRL_MSM8X74
 	tristate "Qualcomm 8x74 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -116,6 +127,7 @@ config PINCTRL_MSM8X74
 config PINCTRL_MSM8909
 	tristate "Qualcomm 8909 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -132,6 +144,7 @@ config PINCTRL_MSM8916
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -152,6 +165,7 @@ config PINCTRL_MSM8976
 config PINCTRL_MSM8994
 	tristate "Qualcomm 8994 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -161,6 +175,7 @@ config PINCTRL_MSM8994
 config PINCTRL_MSM8996
 	tristate "Qualcomm MSM8996 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -169,6 +184,7 @@ config PINCTRL_MSM8996
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -177,6 +193,7 @@ config PINCTRL_MSM8998
 config PINCTRL_QCM2290
 	tristate "Qualcomm QCM2290 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -185,6 +202,7 @@ config PINCTRL_QCM2290
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -232,6 +250,7 @@ config PINCTRL_QCOM_SSBI_PMIC
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -241,6 +260,7 @@ config PINCTRL_SC7180
 config PINCTRL_SC7280
 	tristate "Qualcomm Technologies Inc SC7280 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -250,6 +270,7 @@ config PINCTRL_SC7280
 config PINCTRL_SC7280_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SC7280 LPASS LPI pin controller driver"
 	depends on GPIOLIB
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -259,6 +280,7 @@ config PINCTRL_SC7280_LPASS_LPI
 config PINCTRL_SC8180X
 	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
 	depends on (OF || ACPI)
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -268,6 +290,7 @@ config PINCTRL_SC8180X
 config PINCTRL_SC8280XP
 	tristate "Qualcomm Technologies Inc SC8280xp pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -277,6 +300,7 @@ config PINCTRL_SC8280XP
 config PINCTRL_SDM660
 	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -286,6 +310,7 @@ config PINCTRL_SDM660
 config PINCTRL_SDM845
 	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
 	depends on (OF || ACPI)
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -295,6 +320,7 @@ config PINCTRL_SDM845
 config PINCTRL_SDX55
 	tristate "Qualcomm Technologies Inc SDX55 pin controller driver"
 	depends on OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -304,6 +330,7 @@ config PINCTRL_SDX55
 config PINCTRL_SM6115
 	tristate "Qualcomm Technologies Inc SM6115,SM4250 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -313,6 +340,7 @@ config PINCTRL_SM6115
 config PINCTRL_SM6125
 	tristate "Qualcomm Technologies Inc SM6125 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -322,6 +350,7 @@ config PINCTRL_SM6125
 config PINCTRL_SM6350
 	tristate "Qualcomm Technologies Inc SM6350 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -331,6 +360,7 @@ config PINCTRL_SM6350
 config PINCTRL_SM6375
 	tristate "Qualcomm Technologies Inc SM6375 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -340,6 +370,7 @@ config PINCTRL_SM6375
 config PINCTRL_SDX65
 	tristate "Qualcomm Technologies Inc SDX65 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on ARM || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -349,6 +380,7 @@ config PINCTRL_SDX65
 config PINCTRL_SM8150
 	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -358,6 +390,7 @@ config PINCTRL_SM8150
 config PINCTRL_SM8250
 	tristate "Qualcomm Technologies Inc SM8250 pin controller driver"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -367,6 +400,7 @@ config PINCTRL_SM8250
 config PINCTRL_SM8250_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SM8250 LPASS LPI pin controller driver"
 	depends on GPIOLIB
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -375,6 +409,7 @@ config PINCTRL_SM8250_LPASS_LPI
 
 config PINCTRL_SM8350
 	tristate "Qualcomm Technologies Inc SM8350 pin controller driver"
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -384,6 +419,7 @@ config PINCTRL_SM8350
 config PINCTRL_SM8450
 	tristate "Qualcomm Technologies Inc SM8450 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -393,6 +429,7 @@ config PINCTRL_SM8450
 config PINCTRL_SM8450_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SM8450 LPASS LPI pin controller driver"
 	depends on GPIOLIB
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -402,6 +439,7 @@ config PINCTRL_SM8450_LPASS_LPI
 config PINCTRL_SC8280XP_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SC8280XP LPASS LPI pin controller driver"
 	depends on GPIOLIB
+	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-- 
2.34.1

