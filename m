Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FAC2D250E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgLHH4R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgLHH4R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:56:17 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A11C061793;
        Mon,  7 Dec 2020 23:55:30 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id u12so15301647wrt.0;
        Mon, 07 Dec 2020 23:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ayd3fQc8l6P/RxnDS6QWsiDxVLFEYSLFLxEtwtNZ46c=;
        b=OWCB4kcU+bpPtAwpPOS26YAwXm9aqlP0G0V0pT/iMoUpfagWuJVx9m2noZHBLeVL1F
         /nH2tE7NvotMlNTGqQ2CRdGClEaCSvGP4sD1N2ZbSUCpS/D1yVevQH4L2ZhLc2e0H1pV
         UQEPWY9N1BtkMrusKeZQXOAIwp3qTD5g+04z14T/AYIp3AM+iHqFLWkSz7yhL7EK1ctM
         5sqQJh14+DIYtOkwaZVJ/hEB5BZrdPuHnxknXUqyiyNY6y1Pp6dmRhjs1ZLzc+Gocnly
         06WWuZxQradZF3gPUxBIJOxd+0x9EVohqOnENdFTsDcb60z3CNRqwxVVM2T1dG4owzKx
         hEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ayd3fQc8l6P/RxnDS6QWsiDxVLFEYSLFLxEtwtNZ46c=;
        b=q7xXlZMYYzZ5q+tlKGzg9FpLVb8LC7YkfDnxTGWG9/oMIrJpDvhxEahsIpiQInu9Nu
         5FNS1xKcfinAiAqvgdZFXj6vgAFSmHqMF/UU3ayhs9I0C56zc6NNDfggUCqpKQ0CfLsw
         A5A/B+kIpNASknJ5jd98eMEOhKK0AQ6EwTDglWyR8Ps7FDf64cnQ1G8y3+AJlzSsoo7d
         ytzQDCXviDuJXrtbdkjZHORW/FfQLr4ITcrBS04KecjqKOuDjljs7wnN6fM5yu6ENIzS
         4dWnpd9oesKFffDcJAagZtplg+R+oPeRyI+l3CLlCFGz8sgyNArObjUdU3LvTp0XlTJq
         aphw==
X-Gm-Message-State: AOAM531GiZPSXLWI++45Ct5hfXPkrkEbD8EptYkhMAIqAvZzoPXqtogG
        4Jfr3X0VT/Pq3CUC8f/XvVDX6EkHDd0=
X-Google-Smtp-Source: ABdhPJzWKwwhUjmCuQc6/DlRyZiq9PJ+Q3SycIsMVD9G10Z/AMU9xu7YWObyh5P5es4N/QHPszKm3g==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr78869wra.252.1607414129564;
        Mon, 07 Dec 2020 23:55:29 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id h184sm1620735wmh.23.2020.12.07.23.55.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 23:55:29 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH v2 2/2] pinctrl: ralink: add a pinctrl driver for the rt2880 family
Date:   Tue,  8 Dec 2020 08:55:23 +0100
Message-Id: <20201208075523.7060-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
References: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These Socs have 1-3 banks of 8-32 gpios. Rather then setting the muxing of each
pin individually, these socs have mux groups that when set will effect 1-N pins.
Pin groups have a 2, 4 or 8 different muxes.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/Kconfig                            |  1 +
 drivers/pinctrl/Makefile                           |  1 +
 drivers/pinctrl/ralink/Kconfig                     | 14 ++++++++++++++
 .../mt7621-pinctrl => pinctrl/ralink}/Makefile     |  2 --
 .../ralink}/pinctrl-rt2880.c                       |  4 ++--
 drivers/staging/Kconfig                            |  2 --
 drivers/staging/Makefile                           |  1 -
 drivers/staging/mt7621-pinctrl/Kconfig             |  6 ------
 drivers/staging/mt7621-pinctrl/TODO                |  6 ------
 9 files changed, 18 insertions(+), 19 deletions(-)
 create mode 100644 drivers/pinctrl/ralink/Kconfig
 rename drivers/{staging/mt7621-pinctrl => pinctrl/ralink}/Makefile (66%)
 rename drivers/{staging/mt7621-pinctrl => pinctrl/ralink}/pinctrl-rt2880.c (99%)
 delete mode 100644 drivers/staging/mt7621-pinctrl/Kconfig
 delete mode 100644 drivers/staging/mt7621-pinctrl/TODO

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 815095326e2d..453acce3d0c3 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -385,6 +385,7 @@ source "drivers/pinctrl/nomadik/Kconfig"
 source "drivers/pinctrl/nuvoton/Kconfig"
 source "drivers/pinctrl/pxa/Kconfig"
 source "drivers/pinctrl/qcom/Kconfig"
+source "drivers/pinctrl/ralink/Kconfig"
 source "drivers/pinctrl/renesas/Kconfig"
 source "drivers/pinctrl/samsung/Kconfig"
 source "drivers/pinctrl/spear/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f53933b2ff02..3cdb6529db95 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -59,6 +59,7 @@ obj-y				+= nomadik/
 obj-$(CONFIG_ARCH_NPCM7XX)	+= nuvoton/
 obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
+obj-$(CONFIG_PINCTRL_RALINK)	+= ralink/
 obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
diff --git a/drivers/pinctrl/ralink/Kconfig b/drivers/pinctrl/ralink/Kconfig
new file mode 100644
index 000000000000..8c5f6341477f
--- /dev/null
+++ b/drivers/pinctrl/ralink/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Ralink pinctrl drivers"
+        depends on RALINK
+
+config PINCTRL_RALINK
+        bool "Ralink pin control support"
+        default y if RALINK
+
+config PINCTRL_RT2880
+        bool "RT2880 pinctrl driver for RALINK/Mediatek SOCs"
+        select PINMUX
+        select GENERIC_PINCONF
+
+endmenu
diff --git a/drivers/staging/mt7621-pinctrl/Makefile b/drivers/pinctrl/ralink/Makefile
similarity index 66%
rename from drivers/staging/mt7621-pinctrl/Makefile
rename to drivers/pinctrl/ralink/Makefile
index 49445f40c3cd..242554298d07 100644
--- a/drivers/staging/mt7621-pinctrl/Makefile
+++ b/drivers/pinctrl/ralink/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PINCTRL_RT2880)   += pinctrl-rt2880.o
-
-ccflags-y += -I$(srctree)/drivers/pinctrl
diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
similarity index 99%
rename from drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
rename to drivers/pinctrl/ralink/pinctrl-rt2880.c
index e61dbe186bc9..42b1c6cecb57 100644
--- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -20,8 +20,8 @@
 #include <asm/mach-ralink/pinmux.h>
 #include <asm/mach-ralink/mt7620.h>
 
-#include "core.h"
-#include "pinctrl-utils.h"
+#include "../core.h"
+#include "../pinctrl-utils.h"
 
 #define SYSC_REG_GPIO_MODE	0x60
 #define SYSC_REG_GPIO_MODE2	0x64
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 9b7cb7c5766a..c42708e60afc 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -94,8 +94,6 @@ source "drivers/staging/mt7621-pci/Kconfig"
 
 source "drivers/staging/mt7621-pci-phy/Kconfig"
 
-source "drivers/staging/mt7621-pinctrl/Kconfig"
-
 source "drivers/staging/mt7621-dma/Kconfig"
 
 source "drivers/staging/ralink-gdma/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 38226737c9f3..ebcc646d7b51 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -37,7 +37,6 @@ obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
 obj-$(CONFIG_PI433)		+= pi433/
 obj-$(CONFIG_PCI_MT7621)	+= mt7621-pci/
 obj-$(CONFIG_PCI_MT7621_PHY)	+= mt7621-pci-phy/
-obj-$(CONFIG_PINCTRL_RT2880)	+= mt7621-pinctrl/
 obj-$(CONFIG_SOC_MT7621)	+= mt7621-dma/
 obj-$(CONFIG_DMA_RALINK)	+= ralink-gdma/
 obj-$(CONFIG_SOC_MT7621)	+= mt7621-dts/
diff --git a/drivers/staging/mt7621-pinctrl/Kconfig b/drivers/staging/mt7621-pinctrl/Kconfig
deleted file mode 100644
index f42974026480..000000000000
--- a/drivers/staging/mt7621-pinctrl/Kconfig
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config PINCTRL_RT2880
-	bool "RT2800 pinctrl driver for RALINK/Mediatek SOCs"
-	depends on RALINK
-	select PINMUX
-	select GENERIC_PINCONF
diff --git a/drivers/staging/mt7621-pinctrl/TODO b/drivers/staging/mt7621-pinctrl/TODO
deleted file mode 100644
index b2c235a16d5c..000000000000
--- a/drivers/staging/mt7621-pinctrl/TODO
+++ /dev/null
@@ -1,6 +0,0 @@
-
-- general code review and cleanup
-- should probably be always selected by 'config RALINK'
-- ensure device-tree requirements are documented
-
-Cc: NeilBrown <neil@brown.name>
-- 
2.25.1

