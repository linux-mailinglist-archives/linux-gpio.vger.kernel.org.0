Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BE21E1D0C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 10:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgEZIP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 04:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgEZIP7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 04:15:59 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DC0C03E97E
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 01:15:59 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id z15so4572829pjb.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CvQOwDaca6EGCpgZKmqED62Ipjg/GnmnTO0HT5H7xns=;
        b=ZFEJtdNURaNlDsAZN791eES6Q9OyYY5z5cuh5nwl2g2SSoF9gmeI7+1CnbkK5RFG0y
         C2H51nAdpQcnxSWimbf/PW+NH8e8YcLsP/72Gi/8243fp6irJsa1asVMGXwi2arGSnmc
         P13SsXTgdLxezQ5oJOyi4Gj7Q/0ibpfYagUcJFHTigUd43YAw3J/NGXX8iC8ujTWrUl0
         eWFRyYMPjPk3Z857nSi/O3Kl+CuXUobMxPMSLbYff9XOZLT4L6MSLSIfs4gMEs1aHM+U
         mb33sCqdztNvIuBUXpszqiJI6N0FV9vsmOyFe2K8lM9CRA4QLNnWYg1uKPihy1Mw9VYO
         2bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CvQOwDaca6EGCpgZKmqED62Ipjg/GnmnTO0HT5H7xns=;
        b=AUY5WPpwsTLMcF18ZkmpFe+cW0Czg0+DXPevQhWUKm91ltlG++GYlL7gdhCp4Ew18K
         ySthtP2bhoUv+hA7t2ufpJUs/F0ATI7C/hGkSqTMUGEvIvTXPuT2tXy2Txg28BfqRrko
         vuLI8PbMCWcX1gVGlPHtexqbLLkNZA6cvgPFswIL5syVTf8S6KV6AOjSWjtMLOU2VRcu
         KQH8h168ITqWiS8gwUPbWBKT3llJSjFD5Atb0VyPyxte0Ydc5P6bavmqeQ/LKRgUq5PO
         Ig9wWIvD615hbqI5A2jCTVD8oWGBcetu5eLrTvygg8WBfA5nBovqpgkMyInh5K4lpYxU
         tF+w==
X-Gm-Message-State: AOAM531ShU7bpIboHQVB7YNlYPdIOvMLoKzcQX3d/lzBfmfbZbLwsP2R
        K6H6u/Ab6l2JNDRRSF/elIx1KaLtd5Y=
X-Google-Smtp-Source: ABdhPJy2UZP9BS37mcfhmIRWR2RFYIP74a1/DAl4b7ggRU2awi4GLddYODmlwajouxFv11HihQlpJA==
X-Received: by 2002:a17:902:c213:: with SMTP id 19mr31754227pll.190.1590480958622;
        Tue, 26 May 2020 01:15:58 -0700 (PDT)
Received: from localhost.localdomain ([49.216.48.63])
        by smtp.gmail.com with ESMTPSA id go1sm13835951pjb.26.2020.05.26.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 01:15:57 -0700 (PDT)
From:   Richard Hsu <saraon640529@gmail.com>
To:     Richard_Hsu@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
        Jesse1_Chang@asmedia.com.tw, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, Richard Hsu <saraon640529@gmail.com>
Subject: [PATCH] gpio:gpio-asm28xx-18xx: new driver
Date:   Tue, 26 May 2020 16:15:39 +0800
Message-Id: <20200526081539.3518-1-saraon640529@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz Golaszewski and Linux Walleij,
  Thanks for your reply.I have modified it according to your
suggestions.And our device is silmilar as AMD South Bridge(amd8111),
then i just take gpio-amd8111.c in kernel driver source as reference.
It says that we can't use plain pci_driver mechanism, as the device
is really a multiple function device,main driver that binds to the
pci_device is a bus driver.It seems reasonable then i follow it.

Signed-off-by: Richard Hsu <saraon640529@gmail.com>
---
 patch | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/patch b/patch
index a713f91..220a8cf 100644
--- a/patch
+++ b/patch
@@ -1,7 +1,7 @@
 diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c
 --- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c	1970-01-01 08:00:00.000000000 +0800
-+++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c	2020-05-22 11:55:13.736272177 +0800
-@@ -0,0 +1,282 @@
++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c	2020-05-26 10:41:11.401349769 +0800
+@@ -0,0 +1,281 @@
 +// SPDX-License-Identifier: GPL-2.0-only
 +/*
 + * Asmedia 28xx/18xx GPIO driver
@@ -17,6 +17,7 @@ diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpi
 +#include <linux/pci.h>
 +#include <linux/spinlock.h>
 +#include <linux/pm_runtime.h>
++#include <linux/bits.h>
 +
 +
 +/* GPIO registers offsets */
@@ -63,7 +64,6 @@ diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpi
 +};
 +MODULE_DEVICE_TABLE(pci, pci_tbl);
 +
-+
 +struct asm28xx_gpio {
 +	struct gpio_chip	chip;
 +	struct pci_dev		*pdev;
@@ -104,20 +104,12 @@ diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpi
 +
 +static int asm28xx_gpio_request(struct gpio_chip *chip, unsigned offset)
 +{
-+
-+	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d request\n", offset);
-+
 +	if (offset == ASM_GPIO_PIN5)
 +		return -ENODEV;
 +
 +	return 0;
 +}
 +
-+static void asm28xx_gpio_free(struct gpio_chip *chip, unsigned offset)
-+{
-+	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d free\n", offset);
-+}
-+
 +static void asm28xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 +{
 +	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
@@ -196,7 +188,6 @@ diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpi
 +		.owner		= THIS_MODULE,
 +		.ngpio		= 8,
 +		.request	= asm28xx_gpio_request,
-+		.free		= asm28xx_gpio_free,
 +		.set		= asm28xx_gpio_set,
 +		.get		= asm28xx_gpio_get,
 +		.direction_output = asm28xx_gpio_dirout,
@@ -213,6 +204,16 @@ diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpi
 +	unsigned long flags;
 +	int type;
 +
++	/* We look for our device - Asmedia 28XX and 18XX Bridge
++	 * I don't know about a system with two such bridges,
++	 * so we can assume that there is max. one device.
++	 *
++	 * We can't use plain pci_driver mechanism,
++	 * as the device is really a multiple function device,
++	 * main driver that binds to the pci_device is an bus
++	 * driver and have to find & bind to the device this way.
++	 */
++
 +	for_each_pci_dev(pdev) {
 +		ent = pci_match_id(pci_tbl, pdev);
 +		if (ent) {
@@ -282,11 +283,9 @@ diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpi
 +MODULE_LICENSE("GPL");
 +MODULE_AUTHOR("Richard Hsu <Richard_Hsu@asmedia.com.tw>");
 +MODULE_DESCRIPTION("Asmedia 28xx 18xx GPIO Driver");
-+
-+
 diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/Kconfig linux-5.7.0-rc6-patch/drivers/gpio/Kconfig
 --- linux-5.7.0-rc6/drivers/gpio/Kconfig	2020-05-22 11:54:00.862644198 +0800
-+++ linux-5.7.0-rc6-patch/drivers/gpio/Kconfig	2020-05-22 11:55:13.680270929 +0800
++++ linux-5.7.0-rc6-patch/drivers/gpio/Kconfig	2020-05-26 09:42:21.777312685 +0800
 @@ -113,6 +113,14 @@ config GPIO_AMDPT
  	  driver for GPIO functionality on Promontory IOHub
  	  Require ACPI ASL code to enumerate as a platform device.
@@ -296,7 +295,7 @@ diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpi
 +	depends on PCI
 +	select GPIO_GENERIC
 +	help
-+	  driver for GPIO functionality on Asmedia 28XX and 18XX PCI-E Bridge.
++	  Driver for GPIO functionality on Asmedia 28XX and 18XX PCI-E Bridge.
 +
 +
  config GPIO_ASPEED
@@ -304,9 +303,12 @@ diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpi
  	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
 diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/Makefile linux-5.7.0-rc6-patch/drivers/gpio/Makefile
 --- linux-5.7.0-rc6/drivers/gpio/Makefile	2020-05-22 11:54:00.862644198 +0800
-+++ linux-5.7.0-rc6-patch/drivers/gpio/Makefile	2020-05-22 11:55:13.680270929 +0800
-@@ -176,3 +176,4 @@ obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtens
- obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
- obj-$(CONFIG_GPIO_ZX)			+= gpio-zx.o
- obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
++++ linux-5.7.0-rc6-patch/drivers/gpio/Makefile	2020-05-26 09:45:42.092095882 +0800
+@@ -31,6 +31,7 @@ obj-$(CONFIG_GPIO_AMD8111)		+= gpio-amd8
+ obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
+ obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
+ obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
 +obj-$(CONFIG_GPIO_ASM28XX)		+= gpio-asm28xx-18xx.o
+ obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
+ obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
+ obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
-- 
2.17.1

