Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E20C2A8E4F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 05:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgKFE1P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 23:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgKFE1P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 23:27:15 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED058C0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 20:27:14 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id z3so137734pfb.10
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 20:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=dEjXCFn2GLT5bjrqUgKUeF496DPENv6ARAooxO6dLXo=;
        b=zZ1+tlMPB0oMfHlatbJiOBxKGsw3wHKAlAa+C7Bu1rVuo+/LSONXdfoQpL7HNH7mT3
         sCWNeAUAcDX9Y73R4wznUGhoJGrAtt8jhyovrpb3OCSaStM+uPMPD+BD+G87sDzVhUIX
         TPapo+B8uT0bYbme/0KHVgDznfWyRUClaS9X2VJgGF8EyG0gr49q99LgHQytM2UXFxre
         P7x11bndOd8FD/osuu8l5Vp+G2c7Ud4hF6ZFIgwng3EdLsgZ/6ffV1Db7YgAe6WQCzH+
         CVFXdNDJI7nwufITiU2iV5ux5+EJpgaix83dHcofWM06Ae+HsPNgR2BGJG9XXJVTDOBm
         n5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dEjXCFn2GLT5bjrqUgKUeF496DPENv6ARAooxO6dLXo=;
        b=JcfNeDz/u+TLxg8btCebher5+MHbQZb2HmGHgbMeOBaATKtJw3y9fbCUI+fpr64HVu
         3J+Bqb1h4RilvPzDHGF5ZBMSy4sesi46oDESCUqr70JZZp29TBUPwvFs/IRymwPZ0U+P
         ORh/eG55yBD93z891zhS54a1y3r6lNKRTQlXarHKcTjJkm9FaS24s8sveVHD/Xkz0w0G
         O7Pby3Ypv1uIPsnDspAZkS/8tXhEZz4X+AxWhsQTS6hVLugH96c1J4EEZVdf/4i4MPiF
         StXU65lf3I+RkolndlQS0x1TBf+YsNMBCIeuOpwHvhIbbJxYcE7YZ07BVDhuVEZGkQqg
         TLlA==
X-Gm-Message-State: AOAM5335prvyBhZA/TcF23s4EhSBbeAOIpVR+6OyI/b5ZfPP287nIoba
        2IKiJZExI3SzhTe+oPhhpNV3wQ==
X-Google-Smtp-Source: ABdhPJy3L4zRFTt32HvdpkXrpAgAFtdGFQrnhIcbKANtnnWK+kymIStOHEJymU6KCDj2rFD0IOpHDg==
X-Received: by 2002:a17:90b:310e:: with SMTP id gc14mr366254pjb.147.1604636834398;
        Thu, 05 Nov 2020 20:27:14 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id e24sm179864pfl.149.2020.11.05.20.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 20:27:13 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v6 1/3] pinctrl: qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then a selected config
Date:   Fri,  6 Nov 2020 04:27:08 +0000
Message-Id: <20201106042710.55979-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch reworks PINCTRL_MSM to be a visible option, and
instead of having the various SoC specific drivers select
PINCTRL_MSM, this switches those configs to depend on
PINCTRL_MSM.

This is useful, as it will be needed in order to cleanly support
having the qcom-scm driver, which pinctrl-msm calls into,
configured as a module. Without this change, we would eventually
have to add dependency lines to every config that selects
PINCTRL_MSM, and that would becomes a maintenance headache.

We also add PINCTRL_MSM to the arm64 defconfig to avoid
surprises as otherwise PINCTRL_MSM/IPQ* options previously
enabled, will be off.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v6:
* Split PINCTRL_MSM dependency bit out into its own patch
---
 arch/arm64/configs/defconfig |  1 +
 drivers/pinctrl/qcom/Kconfig | 48 ++++++++++++++++++------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5cfe3cf6f2acb..2ac53d8ae76a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -483,6 +483,7 @@ CONFIG_PINCTRL_IMX8MP=y
 CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IMX8DXL=y
+CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_MSM8916=y
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 5fe7b8aaf69d8..c9bb2d9e49d47 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -2,7 +2,7 @@
 if (ARCH_QCOM || COMPILE_TEST)
 
 config PINCTRL_MSM
-	bool
+	bool "Qualcomm core pin controller driver"
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -13,7 +13,7 @@ config PINCTRL_MSM
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm APQ8064 platform.
@@ -21,7 +21,7 @@ config PINCTRL_APQ8064
 config PINCTRL_APQ8084
 	tristate "Qualcomm APQ8084 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm APQ8084 platform.
@@ -29,7 +29,7 @@ config PINCTRL_APQ8084
 config PINCTRL_IPQ4019
 	tristate "Qualcomm IPQ4019 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ4019 platform.
@@ -37,7 +37,7 @@ config PINCTRL_IPQ4019
 config PINCTRL_IPQ8064
 	tristate "Qualcomm IPQ8064 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ8064 platform.
@@ -45,7 +45,7 @@ config PINCTRL_IPQ8064
 config PINCTRL_IPQ8074
 	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -55,7 +55,7 @@ config PINCTRL_IPQ8074
 config PINCTRL_IPQ6018
 	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -65,7 +65,7 @@ config PINCTRL_IPQ6018
 config PINCTRL_MSM8226
 	tristate "Qualcomm 8226 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -74,7 +74,7 @@ config PINCTRL_MSM8226
 config PINCTRL_MSM8660
 	tristate "Qualcomm 8660 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8660 platform.
@@ -82,7 +82,7 @@ config PINCTRL_MSM8660
 config PINCTRL_MSM8960
 	tristate "Qualcomm 8960 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8960 platform.
@@ -90,7 +90,7 @@ config PINCTRL_MSM8960
 config PINCTRL_MDM9615
 	tristate "Qualcomm 9615 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 9615 platform.
@@ -98,7 +98,7 @@ config PINCTRL_MDM9615
 config PINCTRL_MSM8X74
 	tristate "Qualcomm 8x74 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8974 platform.
@@ -106,7 +106,7 @@ config PINCTRL_MSM8X74
 config PINCTRL_MSM8916
 	tristate "Qualcomm 8916 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
@@ -114,7 +114,7 @@ config PINCTRL_MSM8916
 config PINCTRL_MSM8976
 	tristate "Qualcomm 8976 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8976 platform.
@@ -124,7 +124,7 @@ config PINCTRL_MSM8976
 config PINCTRL_MSM8994
 	tristate "Qualcomm 8994 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8994 platform. The
@@ -133,7 +133,7 @@ config PINCTRL_MSM8994
 config PINCTRL_MSM8996
 	tristate "Qualcomm MSM8996 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8996 platform.
@@ -141,7 +141,7 @@ config PINCTRL_MSM8996
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
@@ -149,7 +149,7 @@ config PINCTRL_MSM8998
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCS404 platform.
@@ -157,7 +157,7 @@ config PINCTRL_QCS404
 config PINCTRL_QDF2XXX
 	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
 	depends on GPIOLIB && ACPI
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the GPIO driver for the TLMM block found on the
 	  Qualcomm Technologies QDF2xxx SOCs.
@@ -194,7 +194,7 @@ config PINCTRL_QCOM_SSBI_PMIC
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -203,7 +203,7 @@ config PINCTRL_SC7180
 config PINCTRL_SDM660
 	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -212,7 +212,7 @@ config PINCTRL_SDM660
 config PINCTRL_SDM845
 	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
 	depends on GPIOLIB && (OF || ACPI)
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -221,7 +221,7 @@ config PINCTRL_SDM845
 config PINCTRL_SM8150
 	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -230,7 +230,7 @@ config PINCTRL_SM8150
 config PINCTRL_SM8250
 	tristate "Qualcomm Technologies Inc SM8250 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
-- 
2.17.1

