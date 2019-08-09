Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFCBB883DB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 22:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbfHIU2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 16:28:30 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56133 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfHIU23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 16:28:29 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MatZr-1iTKFv1eOZ-00cNuB; Fri, 09 Aug 2019 22:28:24 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 03/16] gpio: remove ks8695 driver
Date:   Fri,  9 Aug 2019 22:27:31 +0200
Message-Id: <20190809202749.742267-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809202749.742267-1-arnd@arndb.de>
References: <20190809202749.742267-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:E7nBF4LfPcGf1UtY9oqFhzllxYnnt4naJwExzBwiSQrlI4pVGRN
 aRwUaUtGC5jSU68hoOJidiwrAHd2X0W1UoURS2/YF3tJIAv3W6jeJHjjEPlzwj40hTQ7P9Q
 lw+X26NIvRR62yUaHo1+bd6KT2Ke5PexYl0jtHTVGDQZl5QecRja7VrCyGL8s329BIi/gAe
 /zUEmiKVJM08nSIeFGQfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:84GdanFCoFU=:izKT5wpwMWi6/RUL+CkXBs
 IYpBhnUt6UJEPOusKrqVak8lqHc5fe3+UiJnY8em4Pj0ViYXyg6ao2sOrGnF5a0T4EPfvBdxg
 yigdk9u2t+hEnr7t6oa9sTzfM140op8cZYQMLI341fW7G9zYMegwWB6DwenjgRo+EweIPsmyr
 P/nF/UHR/a32SoHVp8LTGVUgM4zq055qZifbHyjRzXo0i7LcA+5ZMnAFVrZVk46ZU3fhZB089
 ThBAeaI0d0S6/o80okSNGmyzgk0Ad0ktM8JX+TOfI9KId6JGJXeGTE+TRiEuOeRtslk4C7L8i
 OxDwYaxBPbrf02Vwwge72NHZAlnzRB3/F35pgIdSB6aO3IaxYX1Gy9x9QmmgXDnACK3S0VksI
 C6onNyuGxja5iWnx0RBvVwvSDgflawW1hZ4D4yw6LQKObQZYVBr47PfrOdSNWS26soSq0H4uy
 C5BT5z+eWQ72oO7NDsYRNCZs+ppzcwBp6EnQ36fh01UKDJIikj5a4efCWoRa4bmOnIE8y/jTP
 Bmdjn5tZ5lbBlQKVawgZgMqfGrrRht88UDnptEXXaAY6gbbfko99zvpQbwUXW+L2WWCRPmTfy
 muxJnjEHjv1wzLEHDUbyqCy4PeYpV6kVC9AVa2RMuS56jntzMHXl6FgynDWIllD7efvWLS5vA
 HHMRSvutbdLR8zAJkoJ0c+ZoJo+coKzQVjgODPGFYuHbrhdbLGQ19TfTXF/OeoX5p72RT55dy
 xkrKi1aOr8ids8e99Qckk4nc0B2H02SewP17Zg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform is getting removed, so there are no remaining
users of this driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Makefile      |   1 -
 drivers/gpio/gpio-ks8695.c | 284 -------------------------------------
 2 files changed, 285 deletions(-)
 delete mode 100644 drivers/gpio/gpio-ks8695.c

diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a4e91175c708..65d74084c9b2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -67,7 +67,6 @@ obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
 obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
 obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
-obj-$(CONFIG_ARCH_KS8695)		+= gpio-ks8695.o
 obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
 obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
 obj-$(CONFIG_GPIO_LP3943)		+= gpio-lp3943.o
diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
deleted file mode 100644
index a0f87c124894..000000000000
--- a/drivers/gpio/gpio-ks8695.c
+++ /dev/null
@@ -1,284 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-ks8695/gpio.c
- *
- * Copyright (C) 2006 Andrew Victor
- * Updated to GPIOLIB, Copyright 2008 Simtec Electronics
- *                     Daniel Silverstone <dsilvers@simtec.co.uk>
- */
-#include <linux/gpio/driver.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/debugfs.h>
-#include <linux/seq_file.h>
-#include <linux/module.h>
-#include <linux/io.h>
-
-#include <mach/hardware.h>
-#include <asm/mach/irq.h>
-
-#include <mach/regs-gpio.h>
-#include <mach/gpio-ks8695.h>
-
-/*
- * Configure a GPIO line for either GPIO function, or its internal
- * function (Interrupt, Timer, etc).
- */
-static void ks8695_gpio_mode(unsigned int pin, short gpio)
-{
-	unsigned int enable[] = { IOPC_IOEINT0EN, IOPC_IOEINT1EN, IOPC_IOEINT2EN, IOPC_IOEINT3EN, IOPC_IOTIM0EN, IOPC_IOTIM1EN };
-	unsigned long x, flags;
-
-	if (pin > KS8695_GPIO_5)	/* only GPIO 0..5 have internal functions */
-		return;
-
-	local_irq_save(flags);
-
-	x = __raw_readl(KS8695_GPIO_VA + KS8695_IOPC);
-	if (gpio)			/* GPIO: set bit to 0 */
-		x &= ~enable[pin];
-	else				/* Internal function: set bit to 1 */
-		x |= enable[pin];
-	__raw_writel(x, KS8695_GPIO_VA + KS8695_IOPC);
-
-	local_irq_restore(flags);
-}
-
-
-static unsigned short gpio_irq[] = { KS8695_IRQ_EXTERN0, KS8695_IRQ_EXTERN1, KS8695_IRQ_EXTERN2, KS8695_IRQ_EXTERN3 };
-
-/*
- * Configure GPIO pin as external interrupt source.
- */
-int ks8695_gpio_interrupt(unsigned int pin, unsigned int type)
-{
-	unsigned long x, flags;
-
-	if (pin > KS8695_GPIO_3)	/* only GPIO 0..3 can generate IRQ */
-		return -EINVAL;
-
-	local_irq_save(flags);
-
-	/* set pin as input */
-	x = __raw_readl(KS8695_GPIO_VA + KS8695_IOPM);
-	x &= ~IOPM(pin);
-	__raw_writel(x, KS8695_GPIO_VA + KS8695_IOPM);
-
-	local_irq_restore(flags);
-
-	/* Set IRQ triggering type */
-	irq_set_irq_type(gpio_irq[pin], type);
-
-	/* enable interrupt mode */
-	ks8695_gpio_mode(pin, 0);
-
-	return 0;
-}
-EXPORT_SYMBOL(ks8695_gpio_interrupt);
-
-
-
-/* .... Generic GPIO interface .............................................. */
-
-/*
- * Configure the GPIO line as an input.
- */
-static int ks8695_gpio_direction_input(struct gpio_chip *gc, unsigned int pin)
-{
-	unsigned long x, flags;
-
-	if (pin > KS8695_GPIO_15)
-		return -EINVAL;
-
-	/* set pin to GPIO mode */
-	ks8695_gpio_mode(pin, 1);
-
-	local_irq_save(flags);
-
-	/* set pin as input */
-	x = __raw_readl(KS8695_GPIO_VA + KS8695_IOPM);
-	x &= ~IOPM(pin);
-	__raw_writel(x, KS8695_GPIO_VA + KS8695_IOPM);
-
-	local_irq_restore(flags);
-
-	return 0;
-}
-
-
-/*
- * Configure the GPIO line as an output, with default state.
- */
-static int ks8695_gpio_direction_output(struct gpio_chip *gc,
-					unsigned int pin, int state)
-{
-	unsigned long x, flags;
-
-	if (pin > KS8695_GPIO_15)
-		return -EINVAL;
-
-	/* set pin to GPIO mode */
-	ks8695_gpio_mode(pin, 1);
-
-	local_irq_save(flags);
-
-	/* set line state */
-	x = __raw_readl(KS8695_GPIO_VA + KS8695_IOPD);
-	if (state)
-		x |= IOPD(pin);
-	else
-		x &= ~IOPD(pin);
-	__raw_writel(x, KS8695_GPIO_VA + KS8695_IOPD);
-
-	/* set pin as output */
-	x = __raw_readl(KS8695_GPIO_VA + KS8695_IOPM);
-	x |= IOPM(pin);
-	__raw_writel(x, KS8695_GPIO_VA + KS8695_IOPM);
-
-	local_irq_restore(flags);
-
-	return 0;
-}
-
-
-/*
- * Set the state of an output GPIO line.
- */
-static void ks8695_gpio_set_value(struct gpio_chip *gc,
-				  unsigned int pin, int state)
-{
-	unsigned long x, flags;
-
-	if (pin > KS8695_GPIO_15)
-		return;
-
-	local_irq_save(flags);
-
-	/* set output line state */
-	x = __raw_readl(KS8695_GPIO_VA + KS8695_IOPD);
-	if (state)
-		x |= IOPD(pin);
-	else
-		x &= ~IOPD(pin);
-	__raw_writel(x, KS8695_GPIO_VA + KS8695_IOPD);
-
-	local_irq_restore(flags);
-}
-
-
-/*
- * Read the state of a GPIO line.
- */
-static int ks8695_gpio_get_value(struct gpio_chip *gc, unsigned int pin)
-{
-	unsigned long x;
-
-	if (pin > KS8695_GPIO_15)
-		return -EINVAL;
-
-	x = __raw_readl(KS8695_GPIO_VA + KS8695_IOPD);
-	return (x & IOPD(pin)) != 0;
-}
-
-
-/*
- * Map GPIO line to IRQ number.
- */
-static int ks8695_gpio_to_irq(struct gpio_chip *gc, unsigned int pin)
-{
-	if (pin > KS8695_GPIO_3)	/* only GPIO 0..3 can generate IRQ */
-		return -EINVAL;
-
-	return gpio_irq[pin];
-}
-
-/* GPIOLIB interface */
-
-static struct gpio_chip ks8695_gpio_chip = {
-	.label			= "KS8695",
-	.direction_input	= ks8695_gpio_direction_input,
-	.direction_output	= ks8695_gpio_direction_output,
-	.get			= ks8695_gpio_get_value,
-	.set			= ks8695_gpio_set_value,
-	.to_irq			= ks8695_gpio_to_irq,
-	.base			= 0,
-	.ngpio			= 16,
-	.can_sleep		= false,
-};
-
-/* Register the GPIOs */
-void ks8695_register_gpios(void)
-{
-	if (gpiochip_add_data(&ks8695_gpio_chip, NULL))
-		printk(KERN_ERR "Unable to register core GPIOs\n");
-}
-
-/* .... Debug interface ..................................................... */
-
-#ifdef CONFIG_DEBUG_FS
-
-static int ks8695_gpio_show(struct seq_file *s, void *unused)
-{
-	unsigned int enable[] = { IOPC_IOEINT0EN, IOPC_IOEINT1EN, IOPC_IOEINT2EN, IOPC_IOEINT3EN, IOPC_IOTIM0EN, IOPC_IOTIM1EN };
-	unsigned int intmask[] = { IOPC_IOEINT0TM, IOPC_IOEINT1TM, IOPC_IOEINT2TM, IOPC_IOEINT3TM };
-	unsigned long mode, ctrl, data;
-	int i;
-
-	mode = __raw_readl(KS8695_GPIO_VA + KS8695_IOPM);
-	ctrl = __raw_readl(KS8695_GPIO_VA + KS8695_IOPC);
-	data = __raw_readl(KS8695_GPIO_VA + KS8695_IOPD);
-
-	seq_printf(s, "Pin\tI/O\tFunction\tState\n\n");
-
-	for (i = KS8695_GPIO_0; i <= KS8695_GPIO_15 ; i++) {
-		seq_printf(s, "%i:\t", i);
-
-		seq_printf(s, "%s\t", (mode & IOPM(i)) ? "Output" : "Input");
-
-		if (i <= KS8695_GPIO_3) {
-			if (ctrl & enable[i]) {
-				seq_printf(s, "EXT%i ", i);
-
-				switch ((ctrl & intmask[i]) >> (4 * i)) {
-				case IOPC_TM_LOW:
-					seq_printf(s, "(Low)");		break;
-				case IOPC_TM_HIGH:
-					seq_printf(s, "(High)");	break;
-				case IOPC_TM_RISING:
-					seq_printf(s, "(Rising)");	break;
-				case IOPC_TM_FALLING:
-					seq_printf(s, "(Falling)");	break;
-				case IOPC_TM_EDGE:
-					seq_printf(s, "(Edges)");	break;
-				}
-			} else
-				seq_printf(s, "GPIO\t");
-		} else if (i <= KS8695_GPIO_5) {
-			if (ctrl & enable[i])
-				seq_printf(s, "TOUT%i\t", i - KS8695_GPIO_4);
-			else
-				seq_printf(s, "GPIO\t");
-		} else {
-			seq_printf(s, "GPIO\t");
-		}
-
-		seq_printf(s, "\t");
-
-		seq_printf(s, "%i\n", (data & IOPD(i)) ? 1 : 0);
-	}
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(ks8695_gpio);
-
-static int __init ks8695_gpio_debugfs_init(void)
-{
-	/* /sys/kernel/debug/ks8695_gpio */
-	debugfs_create_file("ks8695_gpio", S_IFREG | S_IRUGO, NULL, NULL,
-				&ks8695_gpio_fops);
-	return 0;
-}
-postcore_initcall(ks8695_gpio_debugfs_init);
-
-#endif
-- 
2.20.0

