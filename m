Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5C3103C18
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 14:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbfKTNk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 08:40:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:48202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728864AbfKTNkZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 08:40:25 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEE382251E;
        Wed, 20 Nov 2019 13:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574257224;
        bh=TNLZGml8CKecnxF0PNc2xpp8PoCrtU685Fl9tpYxIng=;
        h=From:To:Cc:Subject:Date:From;
        b=SYcuhSqUUWT3+8kdKpV/V1W39uTvAm1oox0iJNJK80w73m9Cqn5oFP4IWxgpcaDb5
         UshMXRQqp5Dk19a6LEbCptcvaJEOh7sZXhhy85gPfG2P5WKlddCHXuC4pWEGdaL/Wx
         BoUQa9slmafjIdVkvMEe4C8mGV+0P6mG9pFzAfG8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] pinctrl: Fix Kconfig indentation
Date:   Wed, 20 Nov 2019 21:40:19 +0800
Message-Id: <20191120134019.14333-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/Kconfig           | 18 ++++++++--------
 drivers/pinctrl/freescale/Kconfig | 12 +++++------
 drivers/pinctrl/qcom/Kconfig      | 34 +++++++++++++++----------------
 3 files changed, 32 insertions(+), 32 deletions(-)

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
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 4f5645245b06..dbdf615da94f 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -151,10 +151,10 @@ config PINCTRL_QCOM_SPMI_PMIC
        select GPIOLIB_IRQCHIP
        select IRQ_DOMAIN_HIERARCHY
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
-         which are using SPMI for communication with SoC. Example PMIC's
-         devices are pm8841, pm8941 and pma8084.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
+	 which are using SPMI for communication with SoC. Example PMIC's
+	 devices are pm8841, pm8941 and pma8084.
 
 config PINCTRL_QCOM_SSBI_PMIC
        tristate "Qualcomm SSBI PMIC pin controller driver"
@@ -165,10 +165,10 @@ config PINCTRL_QCOM_SSBI_PMIC
        select GPIOLIB_IRQCHIP
        select IRQ_DOMAIN_HIERARCHY
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
-         which are using SSBI for communication with SoC. Example PMIC's
-         devices are pm8058 and pm8921.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
+	 which are using SSBI for communication with SoC. Example PMIC's
+	 devices are pm8058 and pm8921.
 
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
@@ -184,26 +184,26 @@ config PINCTRL_SDM660
        depends on GPIOLIB && OF
        select PINCTRL_MSM
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SDM660 platform.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SDM660 platform.
 
 config PINCTRL_SDM845
        tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
        depends on GPIOLIB && (OF || ACPI)
        select PINCTRL_MSM
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SDM845 platform.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SDM845 platform.
 
 config PINCTRL_SM8150
        tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
        depends on GPIOLIB && OF
        select PINCTRL_MSM
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SM8150 platform.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SM8150 platform.
 
 endif
-- 
2.17.1

