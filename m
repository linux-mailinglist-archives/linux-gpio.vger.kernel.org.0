Return-Path: <linux-gpio+bounces-24098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D071B1EC10
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4ECE189787C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28B4285048;
	Fri,  8 Aug 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYpkHOFD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB23283144;
	Fri,  8 Aug 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666720; cv=none; b=VF6gih816jqN7LkAVGNIILHmiTnhE3ufs618px8Mt1Jzf6lj37WMDxrBkLmHQTUqzk/uTnJQS6qajWib5ifRo2Lp3szvnagwtbFJNN+I30EQzx6NA5psXbShqEaa7oFrpzZfNBFhZqf7RGRxMpobuFSZOrcdNnAr/ZPLtS+KxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666720; c=relaxed/simple;
	bh=LkFYcsA0BuFkevXBP8rh1QCjNzyb8wILJJ74GWv73ww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NW9sy5ifHazRrzB3eAcgrWQ5vuqartK5Ij6JtMLreFa/FAZeoTb8IYGF0DdSjfYbBT2ezNWj0FcxXDGiBbSOmmiGeau6JtdwMDTdG0WbnfWNkPgCK2hUwtlbiv5E3E3c7liCIQnYQbr+pcxvn1GgEm4O7O4RNLPYq5DvKCw0aSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYpkHOFD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468E6C4CEED;
	Fri,  8 Aug 2025 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666720;
	bh=LkFYcsA0BuFkevXBP8rh1QCjNzyb8wILJJ74GWv73ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aYpkHOFDWiJ3r6/BXVEEGVYRXPaoT9GzAZBnr/uFx4keft92ivzJoGNwCU6v+IW8N
	 /BLJ0mKvUm7BftbPUV3p7VFWD08rtOYUGlKVwMpGZSwfG/ZBa5cuDuTdQDJKPDVWIG
	 eQraUHZZZHhgN/LtzGm7rN2uGm4yEppWQ50KhYRsGPSIVQPmINYXoi1WVvJPNIV0/K
	 47V2p7OwlVSQ+6i/v+crQAgQWpsuo0eTU8pN6ypQ1S/NxR3wywX4wswTPfrgZBkctU
	 Yxa+XiH91d3AciU3m+n8irx9DF3C2hXvulTdGkyq1/B+7jztPti58Wvb8AfSV8sc0I
	 dkYBxz/TRLfhw==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 19/21] usb: udc: pxa: remove unused platform_data
Date: Fri,  8 Aug 2025 17:18:04 +0200
Message-Id: <20250808151822.536879-20-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

None of the remaining boards put useful data into the platform_data
structures, so effectively this only works with DT based probing.

Remove all code that references this data, to stop using the legacy
gpiolib interfaces. The pxa27x version already supports gpio
descriptors, while the pxa25x version now does it the same way.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/devices.c              |  7 ----
 arch/arm/mach-pxa/gumstix.c              |  1 -
 arch/arm/mach-pxa/udc.h                  |  8 -----
 drivers/usb/gadget/udc/pxa25x_udc.c      | 41 ++++++++----------------
 drivers/usb/gadget/udc/pxa25x_udc.h      |  2 +-
 drivers/usb/gadget/udc/pxa27x_udc.c      | 35 +++-----------------
 drivers/usb/gadget/udc/pxa27x_udc.h      |  2 --
 include/linux/platform_data/pxa2xx_udc.h | 15 ---------
 8 files changed, 19 insertions(+), 92 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/udc.h

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index 7695cfce01a1..edad956a1483 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -11,7 +11,6 @@
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/soc/pxa/cpu.h>
 
-#include "udc.h"
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include "irqs.h"
@@ -83,10 +82,6 @@ void __init pxa_set_mci_info(const struct pxamci_platform_data *info,
 		pr_err("Unable to create mci device: %d\n", err);
 }
 
-static struct pxa2xx_udc_mach_info pxa_udc_info = {
-	.gpio_pullup = -1,
-};
-
 static struct resource pxa2xx_udc_resources[] = {
 	[0] = {
 		.start	= 0x40600000,
@@ -108,7 +103,6 @@ struct platform_device pxa25x_device_udc = {
 	.resource	= pxa2xx_udc_resources,
 	.num_resources	= ARRAY_SIZE(pxa2xx_udc_resources),
 	.dev		=  {
-		.platform_data	= &pxa_udc_info,
 		.dma_mask	= &udc_dma_mask,
 	}
 };
@@ -119,7 +113,6 @@ struct platform_device pxa27x_device_udc = {
 	.resource	= pxa2xx_udc_resources,
 	.num_resources	= ARRAY_SIZE(pxa2xx_udc_resources),
 	.dev		=  {
-		.platform_data	= &pxa_udc_info,
 		.dma_mask	= &udc_dma_mask,
 	}
 };
diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
index 1713bdf3b71e..6074815a4bca 100644
--- a/arch/arm/mach-pxa/gumstix.c
+++ b/arch/arm/mach-pxa/gumstix.c
@@ -39,7 +39,6 @@
 
 #include "pxa25x.h"
 #include <linux/platform_data/mmc-pxamci.h>
-#include "udc.h"
 #include "gumstix.h"
 #include "devices.h"
 
diff --git a/arch/arm/mach-pxa/udc.h b/arch/arm/mach-pxa/udc.h
deleted file mode 100644
index 9a827e32db98..000000000000
--- a/arch/arm/mach-pxa/udc.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/*
- * arch/arm/mach-pxa/include/mach/udc.h
- *
- */
-#include <linux/platform_data/pxa2xx_udc.h>
-
-extern void pxa_set_udc_info(struct pxa2xx_udc_mach_info *info);
-
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index b97fb7b0cb2c..bad151aedec1 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -12,7 +12,7 @@
 /* #define VERBOSE_DEBUG */
 
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/ioport.h>
@@ -261,24 +261,12 @@ static void nuke (struct pxa25x_ep *, int status);
 /* one GPIO should control a D+ pullup, so host sees this device (or not) */
 static void pullup_off(void)
 {
-	struct pxa2xx_udc_mach_info		*mach = the_controller->mach;
-	int off_level = mach->gpio_pullup_inverted;
-
-	if (gpio_is_valid(mach->gpio_pullup))
-		gpio_set_value(mach->gpio_pullup, off_level);
-	else if (mach->udc_command)
-		mach->udc_command(PXA2XX_UDC_CMD_DISCONNECT);
+	gpiod_set_value(the_controller->pullup_gpio, 0);
 }
 
 static void pullup_on(void)
 {
-	struct pxa2xx_udc_mach_info		*mach = the_controller->mach;
-	int on_level = !mach->gpio_pullup_inverted;
-
-	if (gpio_is_valid(mach->gpio_pullup))
-		gpio_set_value(mach->gpio_pullup, on_level);
-	else if (mach->udc_command)
-		mach->udc_command(PXA2XX_UDC_CMD_CONNECT);
+	gpiod_set_value(the_controller->pullup_gpio, 1);
 }
 
 #if defined(CONFIG_CPU_BIG_ENDIAN)
@@ -1190,8 +1178,7 @@ static int pxa25x_udc_pullup(struct usb_gadget *_gadget, int is_active)
 
 	udc = container_of(_gadget, struct pxa25x_udc, gadget);
 
-	/* not all boards support pullup control */
-	if (!gpio_is_valid(udc->mach->gpio_pullup) && !udc->mach->udc_command)
+	if (!udc->pullup_gpio)
 		return -EOPNOTSUPP;
 
 	udc->pullup = (is_active != 0);
@@ -2343,19 +2330,17 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 
 	/* other non-static parts of init */
 	dev->dev = &pdev->dev;
-	dev->mach = dev_get_platdata(&pdev->dev);
 
 	dev->transceiver = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 
-	if (gpio_is_valid(dev->mach->gpio_pullup)) {
-		retval = devm_gpio_request_one(&pdev->dev, dev->mach->gpio_pullup,
-					       GPIOF_OUT_INIT_LOW, "pca25x_udc GPIO PULLUP");
-		if (retval) {
-			dev_dbg(&pdev->dev,
-				"can't get pullup gpio %d, err: %d\n",
-				dev->mach->gpio_pullup, retval);
-			goto err;
-		}
+	dev->pullup_gpio = devm_gpiod_get_index_optional(&pdev->dev, "pullup", 0,
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(dev->pullup_gpio)) {
+		dev_dbg(&pdev->dev,
+			"can't get pullup gpio err: %ld\n",
+			PTR_ERR(dev->pullup_gpio));
+		retval = PTR_ERR(dev->pullup_gpio);
+		goto err;
 	}
 
 	timer_setup(&dev->timer, udc_watchdog, 0);
@@ -2439,7 +2424,7 @@ static int pxa25x_udc_suspend(struct platform_device *dev, pm_message_t state)
 	struct pxa25x_udc	*udc = platform_get_drvdata(dev);
 	unsigned long flags;
 
-	if (!gpio_is_valid(udc->mach->gpio_pullup) && !udc->mach->udc_command)
+	if (!udc->pullup_gpio)
 		WARNING("USB host won't detect disconnect!\n");
 	udc->suspended = 1;
 
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.h b/drivers/usb/gadget/udc/pxa25x_udc.h
index 6ab6047edc83..3452cf54286c 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.h
+++ b/drivers/usb/gadget/udc/pxa25x_udc.h
@@ -112,7 +112,7 @@ struct pxa25x_udc {
 
 	struct device				*dev;
 	struct clk				*clk;
-	struct pxa2xx_udc_mach_info		*mach;
+	struct gpio_desc			*pullup_gpio;
 	struct usb_phy				*transceiver;
 	u64					dma_mask;
 	struct pxa25x_ep			ep [PXA_UDC_NUM_ENDPOINTS];
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..dbce931d7d3b 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -17,7 +17,6 @@
 #include <linux/proc_fs.h>
 #include <linux/clk.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -1423,14 +1422,7 @@ static const struct usb_ep_ops pxa_ep_ops = {
  */
 static void dplus_pullup(struct pxa_udc *udc, int on)
 {
-	if (udc->gpiod) {
-		gpiod_set_value(udc->gpiod, on);
-	} else if (udc->udc_command) {
-		if (on)
-			udc->udc_command(PXA2XX_UDC_CMD_CONNECT);
-		else
-			udc->udc_command(PXA2XX_UDC_CMD_DISCONNECT);
-	}
+	gpiod_set_value(udc->gpiod, on);
 	udc->pullup_on = on;
 }
 
@@ -1520,7 +1512,7 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
 
-	if (!udc->gpiod && !udc->udc_command)
+	if (!udc->gpiod)
 		return -EOPNOTSUPP;
 
 	dplus_pullup(udc, is_active);
@@ -2354,26 +2346,9 @@ MODULE_DEVICE_TABLE(of, udc_pxa_dt_ids);
 static int pxa_udc_probe(struct platform_device *pdev)
 {
 	struct pxa_udc *udc = &memory;
-	int retval = 0, gpio;
-	struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
-
-	if (mach) {
-		gpio = mach->gpio_pullup;
-		if (gpio_is_valid(gpio)) {
-			retval = devm_gpio_request_one(&pdev->dev, gpio,
-						       GPIOF_OUT_INIT_LOW,
-						       "USB D+ pullup");
-			if (retval)
-				return retval;
-			udc->gpiod = gpio_to_desc(mach->gpio_pullup);
-
-			if (mach->gpio_pullup_inverted ^ gpiod_is_active_low(udc->gpiod))
-				gpiod_toggle_active_low(udc->gpiod);
-		}
-		udc->udc_command = mach->udc_command;
-	} else {
-		udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
-	}
+	int retval = 0;
+
+	udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
 
 	udc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->regs))
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.h b/drivers/usb/gadget/udc/pxa27x_udc.h
index 31bf79ce931c..2c28b691010a 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.h
+++ b/drivers/usb/gadget/udc/pxa27x_udc.h
@@ -426,7 +426,6 @@ struct udc_stats {
  * @usb_gadget: udc gadget structure
  * @driver: bound gadget (zero, g_ether, g_mass_storage, ...)
  * @dev: device
- * @udc_command: machine specific function to activate D+ pullup
  * @gpiod: gpio descriptor of gpio for D+ pullup (or NULL if none)
  * @transceiver: external transceiver to handle vbus sense and D+ pullup
  * @ep0state: control endpoint state machine state
@@ -452,7 +451,6 @@ struct pxa_udc {
 	struct usb_gadget			gadget;
 	struct usb_gadget_driver		*driver;
 	struct device				*dev;
-	void					(*udc_command)(int);
 	struct gpio_desc			*gpiod;
 	struct usb_phy				*transceiver;
 
diff --git a/include/linux/platform_data/pxa2xx_udc.h b/include/linux/platform_data/pxa2xx_udc.h
index bc99cc6a3c5f..c1e4d03bae2c 100644
--- a/include/linux/platform_data/pxa2xx_udc.h
+++ b/include/linux/platform_data/pxa2xx_udc.h
@@ -10,21 +10,6 @@
 #ifndef PXA2XX_UDC_H
 #define PXA2XX_UDC_H
 
-struct pxa2xx_udc_mach_info {
-        int  (*udc_is_connected)(void);		/* do we see host? */
-        void (*udc_command)(int cmd);
-#define	PXA2XX_UDC_CMD_CONNECT		0	/* let host see us */
-#define	PXA2XX_UDC_CMD_DISCONNECT	1	/* so host won't see us */
-
-	/* Boards following the design guidelines in the developer's manual,
-	 * with on-chip GPIOs not Lubbock's weird hardware, can have a sane
-	 * VBUS IRQ and omit the methods above.  Store the GPIO number
-	 * here.  Note that sometimes the signals go through inverters...
-	 */
-	bool	gpio_pullup_inverted;
-	int	gpio_pullup;			/* high == pullup activated */
-};
-
 #ifdef CONFIG_PXA27x
 extern void pxa27x_clear_otgph(void);
 #else
-- 
2.39.5


