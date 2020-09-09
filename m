Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75ECF26321C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 18:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731096AbgIIQfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 12:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730957AbgIIQ1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 12:27:01 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C84C061757
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 09:26:57 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id RsSr230054C55Sk01sSrGt; Wed, 09 Sep 2020 18:26:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kG2vq-0000Qv-W1; Wed, 09 Sep 2020 18:26:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kFzwm-0003Ms-Mg; Wed, 09 Sep 2020 15:15:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] pinctrl: Rename sh-pfc to renesas
Date:   Wed,  9 Sep 2020 15:15:33 +0200
Message-Id: <20200909131534.12897-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909131534.12897-1-geert+renesas@glider.be>
References: <20200909131534.12897-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The drivers/pinctrl/sh-pfc subdirectory was originally created to group
pin control drivers for various Renesas SuperH and SH-Mobile platforms.
However, the name "sh-pfc" no longer reflects its contents, as the
directory now contains pin control drivers for Renesas SuperH, ARM32,
and ARM64 SoCs.

Hence rename the subdirectory from drivers/pinctrl/sh-pfc to
drivers/pinctrl/renesas, and the related Kconfig symbol from
PINCTRL_SH_PFC to PINCTRL_RENESAS.

Rename the git branch in MAINTAINERS, too, for consistency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS                                        | 5 +++--
 drivers/pinctrl/Kconfig                            | 2 +-
 drivers/pinctrl/Makefile                           | 2 +-
 drivers/pinctrl/{sh-pfc => renesas}/Kconfig        | 2 +-
 drivers/pinctrl/{sh-pfc => renesas}/Makefile       | 4 ++--
 drivers/pinctrl/{sh-pfc => renesas}/core.c         | 0
 drivers/pinctrl/{sh-pfc => renesas}/core.h         | 0
 drivers/pinctrl/{sh-pfc => renesas}/gpio.c         | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-emev2.c    | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a73a4.c  | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7740.c  | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77470.c | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7778.c  | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7779.c  | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7790.c  | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7791.c  | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7792.c  | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7794.c  | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77950.c | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77951.c | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7796.c  | 2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77965.c | 2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77970.c | 2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77980.c | 2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77990.c | 2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77995.c | 2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7203.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7264.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7269.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh73a0.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7720.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7722.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7723.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7724.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7734.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7757.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7785.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7786.c   | 0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-shx3.c     | 0
 drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rza1.c | 0
 drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rza2.c | 0
 drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rzn1.c | 0
 drivers/pinctrl/{sh-pfc => renesas}/pinctrl.c      | 0
 drivers/pinctrl/{sh-pfc => renesas}/sh_pfc.h       | 0
 44 files changed, 14 insertions(+), 13 deletions(-)
 rename drivers/pinctrl/{sh-pfc => renesas}/Kconfig (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/Makefile (96%)
 rename drivers/pinctrl/{sh-pfc => renesas}/core.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/core.h (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/gpio.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-emev2.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a73a4.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7740.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77470.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7778.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7779.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7790.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7791.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7792.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7794.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77950.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77951.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7796.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77965.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77970.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77980.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77990.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77995.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7203.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7264.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7269.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh73a0.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7720.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7722.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7723.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7724.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7734.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7757.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7785.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7786.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-shx3.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rza1.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rza2.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rzn1.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/sh_pfc.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 73242e16e327b311..6ac6c8f71037d797 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13688,9 +13688,10 @@ PIN CONTROLLER - RENESAS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
+T:	git
+git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git pinctrl-renesas
 F:	Documentation/devicetree/bindings/pinctrl/renesas,*
-F:	drivers/pinctrl/sh-pfc/
+F:	drivers/pinctrl/renesas/
 
 PIN CONTROLLER - SAMSUNG
 M:	Tomasz Figa <tomasz.figa@gmail.com>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index f63c5a04a3f72a68..6ca1a6fc9756922b 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -383,8 +383,8 @@ source "drivers/pinctrl/nomadik/Kconfig"
 source "drivers/pinctrl/nuvoton/Kconfig"
 source "drivers/pinctrl/pxa/Kconfig"
 source "drivers/pinctrl/qcom/Kconfig"
+source "drivers/pinctrl/renesas/Kconfig"
 source "drivers/pinctrl/samsung/Kconfig"
-source "drivers/pinctrl/sh-pfc/Kconfig"
 source "drivers/pinctrl/spear/Kconfig"
 source "drivers/pinctrl/sprd/Kconfig"
 source "drivers/pinctrl/stm32/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 1da9f28aecbd34d6..113be648658f3d9c 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -59,8 +59,8 @@ obj-y				+= nomadik/
 obj-$(CONFIG_ARCH_NPCM7XX)	+= nuvoton/
 obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
+obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
-obj-$(CONFIG_PINCTRL_SH_PFC)	+= sh-pfc/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/renesas/Kconfig
similarity index 99%
rename from drivers/pinctrl/sh-pfc/Kconfig
rename to drivers/pinctrl/renesas/Kconfig
index 9eb793cb464b8806..fc1f2611063b0cd6 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -5,7 +5,7 @@
 
 menu "Renesas pinctrl drivers"
 
-config PINCTRL_SH_PFC
+config PINCTRL_RENESAS
 	bool "Renesas SoC pin control support" if COMPILE_TEST && !(ARCH_RENESAS || SUPERH)
 	default y if ARCH_RENESAS || SUPERH
 	select PINMUX
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/renesas/Makefile
similarity index 96%
rename from drivers/pinctrl/sh-pfc/Makefile
rename to drivers/pinctrl/renesas/Makefile
index 0b5640cf457b4e42..c96008c9ab59c175 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/renesas/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_PINCTRL_SH_PFC)	+= core.o pinctrl.o
+obj-$(CONFIG_PINCTRL_RENESAS)		+= core.o pinctrl.o
 obj-$(CONFIG_PINCTRL_SH_PFC_GPIO)	+= gpio.o
-obj-$(CONFIG_PINCTRL_PFC_EMEV2)	+= pfc-emev2.o
+obj-$(CONFIG_PINCTRL_PFC_EMEV2)		+= pfc-emev2.o
 obj-$(CONFIG_PINCTRL_PFC_R8A73A4)	+= pfc-r8a73a4.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7740)	+= pfc-r8a7740.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7742)	+= pfc-r8a7790.o
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/renesas/core.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/core.c
rename to drivers/pinctrl/renesas/core.c
diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/renesas/core.h
similarity index 100%
rename from drivers/pinctrl/sh-pfc/core.h
rename to drivers/pinctrl/renesas/core.h
diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/renesas/gpio.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/gpio.c
rename to drivers/pinctrl/renesas/gpio.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-emev2.c b/drivers/pinctrl/renesas/pfc-emev2.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-emev2.c
rename to drivers/pinctrl/renesas/pfc-emev2.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a73a4.c b/drivers/pinctrl/renesas/pfc-r8a73a4.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a73a4.c
rename to drivers/pinctrl/renesas/pfc-r8a73a4.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a7740.c
rename to drivers/pinctrl/renesas/pfc-r8a7740.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a77470.c
rename to drivers/pinctrl/renesas/pfc-r8a77470.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a7778.c
rename to drivers/pinctrl/renesas/pfc-r8a7778.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c b/drivers/pinctrl/renesas/pfc-r8a7779.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a7779.c
rename to drivers/pinctrl/renesas/pfc-r8a7779.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a7790.c
rename to drivers/pinctrl/renesas/pfc-r8a7790.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a7791.c
rename to drivers/pinctrl/renesas/pfc-r8a7791.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a7792.c
rename to drivers/pinctrl/renesas/pfc-r8a7792.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a7794.c
rename to drivers/pinctrl/renesas/pfc-r8a7794.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a77950.c
rename to drivers/pinctrl/renesas/pfc-r8a77950.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-r8a77951.c
rename to drivers/pinctrl/renesas/pfc-r8a77951.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
similarity index 99%
rename from drivers/pinctrl/sh-pfc/pfc-r8a7796.c
rename to drivers/pinctrl/renesas/pfc-r8a7796.c
index a2496baca85d23f8..55f0344a3d3e9af6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2016-2019 Renesas Electronics Corp.
  *
- * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+ * This file is based on the drivers/pinctrl/renesas/pfc-r8a7795.c
  *
  * R-Car Gen3 processor support - PFC hardware block.
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
similarity index 99%
rename from drivers/pinctrl/sh-pfc/pfc-r8a77965.c
rename to drivers/pinctrl/renesas/pfc-r8a77965.c
index 6616f5210b9d96d4..7a50b9b69a7dc4e3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
  * Copyright (C) 2016-2019 Renesas Electronics Corp.
  *
- * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+ * This file is based on the drivers/pinctrl/renesas/pfc-r8a7796.c
  *
  * R-Car Gen3 processor support - PFC hardware block.
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
similarity index 99%
rename from drivers/pinctrl/sh-pfc/pfc-r8a77970.c
rename to drivers/pinctrl/renesas/pfc-r8a77970.c
index 9f7d9c9238fcc9d9..e8a0fc468eb260c6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc. <source@cogentembedded.com>
  *
- * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+ * This file is based on the drivers/pinctrl/renesas/pfc-r8a7795.c
  *
  * R-Car Gen3 processor support - PFC hardware block.
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
similarity index 99%
rename from drivers/pinctrl/sh-pfc/pfc-r8a77980.c
rename to drivers/pinctrl/renesas/pfc-r8a77980.c
index 1055f98534049e6d..ebd07bebaeebca07 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2018 Renesas Electronics Corp.
  * Copyright (C) 2018 Cogent Embedded, Inc.
  *
- * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+ * This file is based on the drivers/pinctrl/renesas/pfc-r8a7795.c
  *
  * R-Car Gen3 processor support - PFC hardware block.
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
similarity index 99%
rename from drivers/pinctrl/sh-pfc/pfc-r8a77990.c
rename to drivers/pinctrl/renesas/pfc-r8a77990.c
index c926a59dd21ceadc..aed04a4c61163cb2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2018-2019 Renesas Electronics Corp.
  *
- * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+ * This file is based on the drivers/pinctrl/renesas/pfc-r8a7796.c
  *
  * R8A7796 processor support - PFC hardware block.
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
similarity index 99%
rename from drivers/pinctrl/sh-pfc/pfc-r8a77995.c
rename to drivers/pinctrl/renesas/pfc-r8a77995.c
index c10b756476b142e6..672251d86c2de3cd 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  *
- * This file is based on the drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+ * This file is based on the drivers/pinctrl/renesas/pfc-r8a7796.c
  *
  * R-Car Gen3 processor support - PFC hardware block.
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7203.c b/drivers/pinctrl/renesas/pfc-sh7203.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7203.c
rename to drivers/pinctrl/renesas/pfc-sh7203.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7264.c b/drivers/pinctrl/renesas/pfc-sh7264.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7264.c
rename to drivers/pinctrl/renesas/pfc-sh7264.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7269.c b/drivers/pinctrl/renesas/pfc-sh7269.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7269.c
rename to drivers/pinctrl/renesas/pfc-sh7269.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh73a0.c
rename to drivers/pinctrl/renesas/pfc-sh73a0.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7720.c b/drivers/pinctrl/renesas/pfc-sh7720.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7720.c
rename to drivers/pinctrl/renesas/pfc-sh7720.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7722.c b/drivers/pinctrl/renesas/pfc-sh7722.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7722.c
rename to drivers/pinctrl/renesas/pfc-sh7722.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7723.c b/drivers/pinctrl/renesas/pfc-sh7723.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7723.c
rename to drivers/pinctrl/renesas/pfc-sh7723.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7724.c b/drivers/pinctrl/renesas/pfc-sh7724.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7724.c
rename to drivers/pinctrl/renesas/pfc-sh7724.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7734.c b/drivers/pinctrl/renesas/pfc-sh7734.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7734.c
rename to drivers/pinctrl/renesas/pfc-sh7734.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7757.c b/drivers/pinctrl/renesas/pfc-sh7757.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7757.c
rename to drivers/pinctrl/renesas/pfc-sh7757.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7785.c b/drivers/pinctrl/renesas/pfc-sh7785.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7785.c
rename to drivers/pinctrl/renesas/pfc-sh7785.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7786.c b/drivers/pinctrl/renesas/pfc-sh7786.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-sh7786.c
rename to drivers/pinctrl/renesas/pfc-sh7786.c
diff --git a/drivers/pinctrl/sh-pfc/pfc-shx3.c b/drivers/pinctrl/renesas/pfc-shx3.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pfc-shx3.c
rename to drivers/pinctrl/renesas/pfc-shx3.c
diff --git a/drivers/pinctrl/sh-pfc/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pinctrl-rza1.c
rename to drivers/pinctrl/renesas/pinctrl-rza1.c
diff --git a/drivers/pinctrl/sh-pfc/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pinctrl-rza2.c
rename to drivers/pinctrl/renesas/pinctrl-rza2.c
diff --git a/drivers/pinctrl/sh-pfc/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pinctrl-rzn1.c
rename to drivers/pinctrl/renesas/pinctrl-rzn1.c
diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
similarity index 100%
rename from drivers/pinctrl/sh-pfc/pinctrl.c
rename to drivers/pinctrl/renesas/pinctrl.c
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
similarity index 100%
rename from drivers/pinctrl/sh-pfc/sh_pfc.h
rename to drivers/pinctrl/renesas/sh_pfc.h
-- 
2.17.1

