Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4CB1104904
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 04:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfKUDTs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 22:19:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:33224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727295AbfKUDTs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 22:19:48 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8C1A208A3;
        Thu, 21 Nov 2019 03:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574306387;
        bh=LSzFWPpsVO+DHMVTB1mAdrxBaXS9PyPnO6OGbCDZ6n0=;
        h=From:To:Cc:Subject:Date:From;
        b=jiF6umi+XcgpJlFZE8vEjUctCZj2HQWnz9Sy8ndxleVr2m/4yCtQEgB7M1+o/oNEN
         ccZP47LhIHcpySVlkZc6yl8aZgRYhf2bPtrtmqTWAAgtdbZtkVCEs0+fcffnMrNDfz
         DiqkNnfdHY81g9j3ZbdT+xnb2RVUdf8AZAVB5XMc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] pinctrl: Fix Kconfig indentation
Date:   Thu, 21 Nov 2019 04:19:41 +0100
Message-Id: <1574306382-32516-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix also 7-space and tab+1 space indentation issues.
---
 drivers/pinctrl/Kconfig           | 18 ++++----
 drivers/pinctrl/freescale/Kconfig | 12 ++---
 drivers/pinctrl/mvebu/Kconfig     | 10 ++---
 drivers/pinctrl/qcom/Kconfig      | 92 +++++++++++++++++++--------------------
 4 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b372419d61f2..25b6c830f2f1 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -32,15 +32,15 @@ config DEBUG_PINCTRL
 	  Say Y here to add some extra checks and diagnostics to PINCTRL calls.
 
 config PINCTRL_ARTPEC6
-        bool "Axis ARTPEC-6 pin controller driver"
-        depends on MACH_ARTPEC6
-        select PINMUX
-        select GENERIC_PINCONF
-        help
-          This is the driver for the Axis ARTPEC-6 pin controller. This driver
-          supports pin function multiplexing as well as pin bias and drive
-          strength configuration. Device tree integration instructions can be
-          found in Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
+	bool "Axis ARTPEC-6 pin controller driver"
+	depends on MACH_ARTPEC6
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  This is the driver for the Axis ARTPEC-6 pin controller. This driver
+	  supports pin function multiplexing as well as pin bias and drive
+	  strength configuration. Device tree integration instructions can be
+	  found in Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
 
 config PINCTRL_AS3722
 	tristate "Pinctrl and GPIO driver for ams AS3722 PMIC"
diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 5f4058033ec6..3ea9ce3e0cd9 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -39,12 +39,12 @@ config PINCTRL_IMX27
 
 
 config PINCTRL_IMX25
-        bool "IMX25 pinctrl driver"
-        depends on OF
-        depends on SOC_IMX25
-        select PINCTRL_IMX
-        help
-          Say Y here to enable the imx25 pinctrl driver
+	bool "IMX25 pinctrl driver"
+	depends on OF
+	depends on SOC_IMX25
+	select PINCTRL_IMX
+	help
+	  Say Y here to enable the imx25 pinctrl driver
 
 config PINCTRL_IMX35
 	bool "IMX35 pinctrl driver"
diff --git a/drivers/pinctrl/mvebu/Kconfig b/drivers/pinctrl/mvebu/Kconfig
index d69c25798871..0d12894d3ee1 100644
--- a/drivers/pinctrl/mvebu/Kconfig
+++ b/drivers/pinctrl/mvebu/Kconfig
@@ -46,8 +46,8 @@ config PINCTRL_ORION
 	select PINCTRL_MVEBU
 
 config PINCTRL_ARMADA_37XX
-       bool
-       select GENERIC_PINCONF
-       select MFD_SYSCON
-       select PINCONF
-       select PINMUX
+	bool
+	select GENERIC_PINCONF
+	select MFD_SYSCON
+	select PINCONF
+	select PINMUX
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 4f5645245b06..811af2f81c39 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -142,33 +142,33 @@ config PINCTRL_QDF2XXX
 	  Qualcomm Technologies QDF2xxx SOCs.
 
 config PINCTRL_QCOM_SPMI_PMIC
-       tristate "Qualcomm SPMI PMIC pin controller driver"
-       depends on GPIOLIB && OF && SPMI
-       select REGMAP_SPMI
-       select PINMUX
-       select PINCONF
-       select GENERIC_PINCONF
-       select GPIOLIB_IRQCHIP
-       select IRQ_DOMAIN_HIERARCHY
-       help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
-         which are using SPMI for communication with SoC. Example PMIC's
-         devices are pm8841, pm8941 and pma8084.
+	tristate "Qualcomm SPMI PMIC pin controller driver"
+	depends on GPIOLIB && OF && SPMI
+	select REGMAP_SPMI
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
+	 which are using SPMI for communication with SoC. Example PMIC's
+	 devices are pm8841, pm8941 and pma8084.
 
 config PINCTRL_QCOM_SSBI_PMIC
-       tristate "Qualcomm SSBI PMIC pin controller driver"
-       depends on GPIOLIB && OF
-       select PINMUX
-       select PINCONF
-       select GENERIC_PINCONF
-       select GPIOLIB_IRQCHIP
-       select IRQ_DOMAIN_HIERARCHY
-       help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
-         which are using SSBI for communication with SoC. Example PMIC's
-         devices are pm8058 and pm8921.
+	tristate "Qualcomm SSBI PMIC pin controller driver"
+	depends on GPIOLIB && OF
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
+	 which are using SSBI for communication with SoC. Example PMIC's
+	 devices are pm8058 and pm8921.
 
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
@@ -180,30 +180,30 @@ config PINCTRL_SC7180
 	  Technologies Inc SC7180 platform.
 
 config PINCTRL_SDM660
-       tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
-       depends on GPIOLIB && OF
-       select PINCTRL_MSM
-       help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SDM660 platform.
+	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_MSM
+	help
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SDM660 platform.
 
 config PINCTRL_SDM845
-       tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
-       depends on GPIOLIB && (OF || ACPI)
-       select PINCTRL_MSM
-       help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SDM845 platform.
+	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
+	depends on GPIOLIB && (OF || ACPI)
+	select PINCTRL_MSM
+	help
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SDM845 platform.
 
 config PINCTRL_SM8150
-       tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
-       depends on GPIOLIB && OF
-       select PINCTRL_MSM
-       help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SM8150 platform.
+	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_MSM
+	help
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SM8150 platform.
 
 endif
-- 
2.7.4

