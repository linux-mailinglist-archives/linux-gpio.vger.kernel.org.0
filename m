Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3211AF190F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 15:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbfKFOsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 09:48:33 -0500
Received: from mga18.intel.com ([134.134.136.126]:8956 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729430AbfKFOsd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 09:48:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 06:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="285681069"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 06 Nov 2019 06:48:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 089516A; Wed,  6 Nov 2019 16:48:29 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/8] pinctrl: lynxpoint: Move GPIO driver to pin controller folder
Date:   Wed,  6 Nov 2019 16:48:22 +0200
Message-Id: <20191106144829.32275-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move Lynxpoint GPIO driver under Intel pin control umbrella
for further transformation to a real pin control driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                                            |  1 -
 drivers/gpio/Kconfig                                   |  8 --------
 drivers/gpio/Makefile                                  |  1 -
 drivers/pinctrl/intel/Kconfig                          | 10 ++++++++++
 drivers/pinctrl/intel/Makefile                         |  1 +
 .../intel/pinctrl-lynxpoint.c}                         |  0
 6 files changed, 11 insertions(+), 10 deletions(-)
 rename drivers/{gpio/gpio-lynxpoint.c => pinctrl/intel/pinctrl-lynxpoint.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1378491c223c..9b71250e3014 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8325,7 +8325,6 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	drivers/gpio/gpio-ich.c
 F:	drivers/gpio/gpio-intel-mid.c
-F:	drivers/gpio/gpio-lynxpoint.c
 F:	drivers/gpio/gpio-merrifield.c
 F:	drivers/gpio/gpio-ml-ioh.c
 F:	drivers/gpio/gpio-pch.c
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8adffd42f8cb..6923142fd874 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -335,14 +335,6 @@ config GPIO_LPC32XX
 	  Select this option to enable GPIO driver for
 	  NXP LPC32XX devices.
 
-config GPIO_LYNXPOINT
-	tristate "Intel Lynxpoint GPIO support"
-	depends on ACPI && X86
-	select GPIOLIB_IRQCHIP
-	help
-	  driver for GPIO functionality on Intel Lynxpoint PCH chipset
-	  Requires ACPI device enumeration code to set up a platform device.
-
 config GPIO_MB86S7X
 	tristate "GPIO support for Fujitsu MB86S7x Platforms"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 34eb8b2b12dd..55b2b645391e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -76,7 +76,6 @@ obj-$(CONFIG_GPIO_LP873X)		+= gpio-lp873x.o
 obj-$(CONFIG_GPIO_LP87565)		+= gpio-lp87565.o
 obj-$(CONFIG_GPIO_LPC18XX)		+= gpio-lpc18xx.o
 obj-$(CONFIG_GPIO_LPC32XX)		+= gpio-lpc32xx.o
-obj-$(CONFIG_GPIO_LYNXPOINT)		+= gpio-lynxpoint.o
 obj-$(CONFIG_GPIO_MADERA)		+= gpio-madera.o
 obj-$(CONFIG_GPIO_MAX3191X)		+= gpio-max3191x.o
 obj-$(CONFIG_GPIO_MAX7300)		+= gpio-max7300.o
diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index c091eb2f0aeb..260193c453b0 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -42,6 +42,16 @@ config PINCTRL_MERRIFIELD
 	  interface that allows configuring of SoC pins and using them as
 	  GPIOs.
 
+config PINCTRL_LYNXPOINT
+	tristate "Intel Lynxpoint pinctrl and GPIO driver"
+	depends on ACPI
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	help
+	  Lynxpoint is the PCH of Intel Haswell. This pinctrl driver
+	  provides an interface that allows configuring of PCH pins and
+	  using them as GPIOs.
+
 config PINCTRL_INTEL
 	tristate
 	select PINMUX
diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
index 5e92aba018ac..541b94cfe398 100644
--- a/drivers/pinctrl/intel/Makefile
+++ b/drivers/pinctrl/intel/Makefile
@@ -13,5 +13,6 @@ obj-$(CONFIG_PINCTRL_ELKHARTLAKE)	+= pinctrl-elkhartlake.o
 obj-$(CONFIG_PINCTRL_GEMINILAKE)	+= pinctrl-geminilake.o
 obj-$(CONFIG_PINCTRL_ICELAKE)		+= pinctrl-icelake.o
 obj-$(CONFIG_PINCTRL_LEWISBURG)		+= pinctrl-lewisburg.o
+obj-$(CONFIG_PINCTRL_LYNXPOINT)		+= pinctrl-lynxpoint.o
 obj-$(CONFIG_PINCTRL_SUNRISEPOINT)	+= pinctrl-sunrisepoint.o
 obj-$(CONFIG_PINCTRL_TIGERLAKE)		+= pinctrl-tigerlake.o
diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
similarity index 100%
rename from drivers/gpio/gpio-lynxpoint.c
rename to drivers/pinctrl/intel/pinctrl-lynxpoint.c
-- 
2.24.0.rc1

