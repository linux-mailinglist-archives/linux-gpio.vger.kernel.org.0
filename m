Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21B1314BD8C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2020 17:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgA1QSl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 11:18:41 -0500
Received: from mga09.intel.com ([134.134.136.24]:55846 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgA1QSl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jan 2020 11:18:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jan 2020 08:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; 
   d="scan'208";a="252305232"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2020 08:03:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C4E3813F; Tue, 28 Jan 2020 18:03:25 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Sort entries in database for GPIO
Date:   Tue, 28 Jan 2020 18:03:25 +0200
Message-Id: <20200128160325.67636-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Run parse-maintainers.pl and choose GPIO records. Fix them accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39b7dfb9006f..ffa3f37d4f48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2798,11 +2798,11 @@ F:	drivers/block/aoe/
 
 ATHEROS 71XX/9XXX GPIO DRIVER
 M:	Alban Bedel <albeu@free.fr>
+S:	Maintained
 W:	https://github.com/AlbanBedel/linux
 T:	git git://github.com/AlbanBedel/linux
-S:	Maintained
-F:	drivers/gpio/gpio-ath79.c
 F:	Documentation/devicetree/bindings/gpio/gpio-ath79.txt
+F:	drivers/gpio/gpio-ath79.c
 
 ATHEROS 71XX/9XXX USB PHY DRIVER
 M:	Alban Bedel <albeu@free.fr>
@@ -3424,8 +3424,8 @@ BROADCOM BRCMSTB GPIO DRIVER
 M:	Gregory Fong <gregory.0xf0@gmail.com>
 L:	bcm-kernel-feedback-list@broadcom.com
 S:	Supported
-F:	drivers/gpio/gpio-brcmstb.c
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.txt
+F:	drivers/gpio/gpio-brcmstb.c
 
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kdasu.kdev@gmail.com>
@@ -3483,8 +3483,8 @@ BROADCOM KONA GPIO DRIVER
 M:	Ray Jui <rjui@broadcom.com>
 L:	bcm-kernel-feedback-list@broadcom.com
 S:	Supported
-F:	drivers/gpio/gpio-bcm-kona.c
 F:	Documentation/devicetree/bindings/gpio/brcm,kona-gpio.txt
+F:	drivers/gpio/gpio-bcm-kona.c
 
 BROADCOM NETXTREME-E ROCE DRIVER
 M:	Selvin Xavier <selvin.xavier@broadcom.com>
@@ -3599,8 +3599,8 @@ F:	sound/pci/bt87x.c
 
 BT8XXGPIO DRIVER
 M:	Michael Buesch <m@bues.ch>
-W:	http://bu3sch.de/btgpio.php
 S:	Maintained
+W:	http://bu3sch.de/btgpio.php
 F:	drivers/gpio/gpio-bt8xx.c
 
 BTRFS FILE SYSTEM
@@ -7146,18 +7146,18 @@ GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
 M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
 L:	linux-gpio@vger.kernel.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
+F:	Documentation/ABI/obsolete/sysfs-gpio
+F:	Documentation/ABI/testing/gpio-cdev
+F:	Documentation/admin-guide/gpio/
 F:	Documentation/devicetree/bindings/gpio/
 F:	Documentation/driver-api/gpio/
-F:	Documentation/admin-guide/gpio/
-F:	Documentation/ABI/testing/gpio-cdev
-F:	Documentation/ABI/obsolete/sysfs-gpio
 F:	drivers/gpio/
+F:	include/asm-generic/gpio.h
 F:	include/linux/gpio/
 F:	include/linux/gpio.h
 F:	include/linux/of_gpio.h
-F:	include/asm-generic/gpio.h
 F:	include/uapi/linux/gpio.h
 F:	tools/gpio/
 
@@ -8059,8 +8059,8 @@ F:	drivers/scsi/ips.*
 ICH LPC AND GPIO DRIVER
 M:	Peter Tyser <ptyser@xes-inc.com>
 S:	Maintained
-F:	drivers/mfd/lpc_ich.c
 F:	drivers/gpio/gpio-ich.c
+F:	drivers/mfd/lpc_ich.c
 
 ICY I2C DRIVER
 M:	Max Staudt <max@enpas.org>
@@ -16089,8 +16089,8 @@ F:	Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
 SYNOPSYS CREG GPIO DRIVER
 M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
 S:	Maintained
-F:	drivers/gpio/gpio-creg-snps.c
 F:	Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
+F:	drivers/gpio/gpio-creg-snps.c
 
 SYNOPSYS DESIGNWARE 8250 UART DRIVER
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
@@ -16101,8 +16101,8 @@ SYNOPSYS DESIGNWARE APB GPIO DRIVER
 M:	Hoan Tran <hoan@os.amperecomputing.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	drivers/gpio/gpio-dwapb.c
 F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+F:	drivers/gpio/gpio-dwapb.c
 
 SYNOPSYS DESIGNWARE AXI DMAC DRIVER
 M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
@@ -18429,8 +18429,8 @@ M:	Nandor Han <nandor.han@ge.com>
 M:	Semi Malinen <semi.malinen@ge.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	drivers/gpio/gpio-xra1403.c
 F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
+F:	drivers/gpio/gpio-xra1403.c
 
 XTENSA XTFPGA PLATFORM SUPPORT
 M:	Max Filippov <jcmvbkbc@gmail.com>
-- 
2.24.1

