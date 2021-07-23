Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19393D376B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 11:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbhGWIdc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 04:33:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229771AbhGWIdb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 04:33:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2F1960ED4;
        Fri, 23 Jul 2021 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627031645;
        bh=OMlUWydw84Ocn+60ZUuBoG7SH3/q7EoF1PwUFSPi0p8=;
        h=From:To:Cc:Subject:Date:From;
        b=OX/A9XVWdg05IyIaQNvN+OaGruL40ZHfdhs5+aKf/za5h9iCeIcVCO7kNC8yNYQN7
         B8t8BF641FZumeICNB97MguEG1fsoioukEf9zEG02mGhnGrNxiGQnaihQq8LxbicSK
         6hQFYsjTJZXzMwzbY5cPXf5SQvBMmJEbo7TA1875z/mGW14OfNklpdkj812ZOm6Lzr
         l5Wg4mben5WHgtQ6bVo0WQYSlkPNSwXRNVXrdAY6LUdClTZQaDL0gmXee2qa3kPadH
         XmVxo2dAVm0xFxV9hriyZ2ulhRN/GtB29nhtR6uJj/rmy8PocQShyUJgdTtaIjIRvq
         X5I2w+YRK1nVA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Julian Braha <julianbraha@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: fix GPIOLIB dependencies
Date:   Fri, 23 Jul 2021 11:13:52 +0200
Message-Id: <20210723091400.1669716-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Enabling the PINCTRL_SM8350 symbol without GPIOLIB or SCM causes a build
failure:

WARNING: unmet direct dependencies detected for PINCTRL_MSM
  Depends on [m]: PINCTRL [=y] && (ARCH_QCOM [=y] || COMPILE_TEST [=y]) && GPIOLIB [=y] && (QCOM_SCM [=m] || !QCOM_SCM [=m])
  Selected by [y]:
  - PINCTRL_SM8350 [=y] && PINCTRL [=y] && (ARCH_QCOM [=y] || COMPILE_TEST [=y]) && GPIOLIB [=y] && OF [=y]
aarch64-linux-ld: drivers/pinctrl/qcom/pinctrl-msm.o: in function `msm_gpio_irq_set_type':
pinctrl-msm.c:(.text.msm_gpio_irq_set_type+0x1c8): undefined reference to `qcom_scm_io_readl'

The main problem here is the 'select PINCTRL_MSM', which needs to be a
'depends on' as it is for all the other front-ends. As the GPIOLIB
dependency is now implied by that, symbol, remove the duplicate
dependencies in the process.

Fixes: d5d348a3271f ("pinctrl: qcom: Add SM8350 pinctrl driver")
Fixes: 376f9e34c10f ("drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/qcom/Kconfig | 63 ++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 2f51b4f99393..cad4e60df618 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -13,7 +13,7 @@ config PINCTRL_MSM
 
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -21,7 +21,7 @@ config PINCTRL_APQ8064
 
 config PINCTRL_APQ8084
 	tristate "Qualcomm APQ8084 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -29,7 +29,7 @@ config PINCTRL_APQ8084
 
 config PINCTRL_IPQ4019
 	tristate "Qualcomm IPQ4019 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -37,7 +37,7 @@ config PINCTRL_IPQ4019
 
 config PINCTRL_IPQ8064
 	tristate "Qualcomm IPQ8064 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -45,7 +45,7 @@ config PINCTRL_IPQ8064
 
 config PINCTRL_IPQ8074
 	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -55,7 +55,7 @@ config PINCTRL_IPQ8074
 
 config PINCTRL_IPQ6018
 	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -65,7 +65,7 @@ config PINCTRL_IPQ6018
 
 config PINCTRL_MSM8226
 	tristate "Qualcomm 8226 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -74,7 +74,7 @@ config PINCTRL_MSM8226
 
 config PINCTRL_MSM8660
 	tristate "Qualcomm 8660 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -82,7 +82,7 @@ config PINCTRL_MSM8660
 
 config PINCTRL_MSM8960
 	tristate "Qualcomm 8960 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -90,7 +90,7 @@ config PINCTRL_MSM8960
 
 config PINCTRL_MDM9615
 	tristate "Qualcomm 9615 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -98,7 +98,7 @@ config PINCTRL_MDM9615
 
 config PINCTRL_MSM8X74
 	tristate "Qualcomm 8x74 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -106,7 +106,7 @@ config PINCTRL_MSM8X74
 
 config PINCTRL_MSM8916
 	tristate "Qualcomm 8916 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -114,7 +114,7 @@ config PINCTRL_MSM8916
 
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -124,7 +124,7 @@ config PINCTRL_MSM8953
 
 config PINCTRL_MSM8976
 	tristate "Qualcomm 8976 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -134,7 +134,7 @@ config PINCTRL_MSM8976
 
 config PINCTRL_MSM8994
 	tristate "Qualcomm 8994 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -143,7 +143,7 @@ config PINCTRL_MSM8994
 
 config PINCTRL_MSM8996
 	tristate "Qualcomm MSM8996 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -151,7 +151,7 @@ config PINCTRL_MSM8996
 
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -159,7 +159,7 @@ config PINCTRL_MSM8998
 
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -167,7 +167,7 @@ config PINCTRL_QCS404
 
 config PINCTRL_QDF2XXX
 	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
-	depends on GPIOLIB && ACPI
+	depends on ACPI
 	depends on PINCTRL_MSM
 	help
 	  This is the GPIO driver for the TLMM block found on the
@@ -175,7 +175,7 @@ config PINCTRL_QDF2XXX
 
 config PINCTRL_QCOM_SPMI_PMIC
 	tristate "Qualcomm SPMI PMIC pin controller driver"
-	depends on GPIOLIB && OF && SPMI
+	depends on OF && SPMI
 	select REGMAP_SPMI
 	select PINMUX
 	select PINCONF
@@ -190,7 +190,7 @@ config PINCTRL_QCOM_SPMI_PMIC
 
 config PINCTRL_QCOM_SSBI_PMIC
 	tristate "Qualcomm SSBI PMIC pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -204,7 +204,7 @@ config PINCTRL_QCOM_SSBI_PMIC
 
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -213,7 +213,7 @@ config PINCTRL_SC7180
 
 config PINCTRL_SC7280
 	tristate "Qualcomm Technologies Inc SC7280 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -222,7 +222,7 @@ config PINCTRL_SC7280
 
 config PINCTRL_SC8180X
 	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
-	depends on GPIOLIB && (OF || ACPI)
+	depends on (OF || ACPI)
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -231,7 +231,7 @@ config PINCTRL_SC8180X
 
 config PINCTRL_SDM660
 	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -240,7 +240,7 @@ config PINCTRL_SDM660
 
 config PINCTRL_SDM845
 	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
-	depends on GPIOLIB && (OF || ACPI)
+	depends on (OF || ACPI)
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -249,7 +249,7 @@ config PINCTRL_SDM845
 
 config PINCTRL_SDX55
 	tristate "Qualcomm Technologies Inc SDX55 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -258,7 +258,7 @@ config PINCTRL_SDX55
 
 config PINCTRL_SM6125
 	tristate "Qualcomm Technologies Inc SM6125 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -267,7 +267,7 @@ config PINCTRL_SM6125
 
 config PINCTRL_SM8150
 	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -276,7 +276,7 @@ config PINCTRL_SM8150
 
 config PINCTRL_SM8250
 	tristate "Qualcomm Technologies Inc SM8250 pin controller driver"
-	depends on GPIOLIB && OF
+	depends on OF
 	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -285,8 +285,7 @@ config PINCTRL_SM8250
 
 config PINCTRL_SM8350
 	tristate "Qualcomm Technologies Inc SM8350 pin controller driver"
-	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
-- 
2.29.2

