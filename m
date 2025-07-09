Return-Path: <linux-gpio+bounces-22972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89487AFE42F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5231C1C40FFB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 09:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B422868AD;
	Wed,  9 Jul 2025 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="gge3Z9LF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout1.mo533.mail-out.ovh.net (smtpout1.mo533.mail-out.ovh.net [51.210.94.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C09728642D
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.94.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053758; cv=none; b=abPcvAMnVTBmedMhblAbfg/h1XTtM3lgU7mdV1LebcimJcs4yNkfOClItwgml/yzz+/QctVdk7I1P+iiGx77hfCi8qAtj3QK92CoB+LPfwfu9KspWuMi0h6OwiPa8ivRxr0eujC9F3UteXQOCDzG8V8vtS0bx5iZhcRyoaAWvAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053758; c=relaxed/simple;
	bh=Yv8BbP04n2mdljxDK9mxSaaA/j4QNF1BC4tVvGCA7UI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=BehlRZst/0BU1Jbo86bxAWB44HGjMdFBZoq9CDObG0M22jGdc1+TLNcV44Ejn4cpZeQjlbi/gET0ErFHdnfx13SAeIOmVBPih/6a7nvoIV1zddWPA7rP/7UKOiJfe1sACpgUQcSNfLbNUBlNi0ldlFE9Y5cbc6X9mjVHMpsTXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=gge3Z9LF; arc=none smtp.client-ip=51.210.94.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [152.228.215.222])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4bcXQS6D8Zz5x3R;
	Wed,  9 Jul 2025 09:16:00 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Wed,  9 Jul 2025 09:16:00 +0000 (UTC)
Received: from mta10.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.96.120])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4bcXQS4H5gz5wDr;
	Wed,  9 Jul 2025 09:16:00 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.4])
	by mta10.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id D5712DA3D6F;
	Wed,  9 Jul 2025 09:15:59 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-109S00306fe7577-678e-4e69-acd1-6b957921765c,
                    841A8845AA9FBBFEBFD8DDB0E9B4047BA5E8FEDF) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:147.156.42.5
From: Marcos Del Sol Vives <marcos@orca.pet>
To: linux-kernel@vger.kernel.org
Cc: marcos@orca.pet,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2] gpio: vortex: add new GPIO device driver
Date: Wed,  9 Jul 2025 11:15:40 +0200
Message-Id: <20250709091542.968968-1-marcos@orca.pet>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3697455294322661083
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgtohhsucffvghlucfuohhlucggihhvvghsuceomhgrrhgtohhssehorhgtrgdrphgvtheqnecuggftrfgrthhtvghrnhepveeiueeugeeuteekgeegudegveeljeduieekkeeuleehiefhieeiudelhfdvieffnecuffhomhgrihhnpegumhhprdgtohhmrdhtfienucfkphepuddvjedrtddrtddruddpudegjedrudehiedrgedvrdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrghrtghoshesohhrtggrrdhpvghtpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrghrtghoshesohhrtggrrdhpvghtpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehfeefmgdpmhhoug
 gvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=IBt8JcX64nU+2L7HApDwNqwnjJsKbyhG0Ng8/z+Z1wM=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1752052561;
 v=1;
 b=gge3Z9LFFANw5eu7QVcwTM/eppdfhvL5DfRnQ0m8NWth+JEOOyObnGO3aznb56zrEZBpRDoe
 qHaIii3wTznne2tgqFea6m3L1lAjJalAVyJPgv2USe5pVBI1BzWfyKS2E+kHNkHVG07Pz85SmTd
 0mUdG5gsYFcwVt2c3TrmVBfsTwQrr5daE48R54vYP2GkIVv+0hIjN2MyHmkLv3g5uMEng4FuIYr
 D86Cdhmn4zt+2+6AQ5v6y8QW4LBlMacMIPm8L2qLOxaLl1uw732/MoyZQL81PbF2Zg4QLHBg3F5
 NsHM67tlb15wSeOrH+oFRP5Jy9YAjWGIjzjkOnUf93ATw==

Add a new simple GPIO device driver for Vortex86 lines of SoCs,
implemented according to their programming reference manual [1].

This is required for detecting the status of the poweroff button and
performing the poweroff sequence on ICOP eBox computers.

IRQs are not implemented as they are available for less than half the
GPIO pins, and they are not the ones required for the poweroff stuff, so
polling will be required anyway.

[1]: http://www.dmp.com.tw/tech/DMP_Vortex86_Series_Software_Programming_Reference_091216.pdf

Signed-off-by: Marcos Del Sol Vives <marcos@orca.pet>
---
 MAINTAINERS                |   6 ++
 drivers/gpio/Kconfig       |  10 +++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-vortex.c | 169 +++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 drivers/gpio/gpio-vortex.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ff244fe3e1a..0ad462e8cceb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26568,6 +26568,12 @@ VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
 R:	Matti Vaittinen <mazziesaccount@gmail.com>
 F:	drivers/regulator/irq_helpers.c
 
+VORTEX GPIO DRIVER
+R:	Marcos Del Sol Vives <marcos@orca.pet>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-vortex.c
+
 VRF
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 44f922e10db2..796fd6d43910 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1066,6 +1066,16 @@ config GPIO_TS5500
 	  blocks of the TS-5500: DIO1, DIO2 and the LCD port, and the TS-5600
 	  LCD port.
 
+config GPIO_VORTEX
+	tristate "Vortex86 SoC GPIO support"
+	depends on CPU_SUP_VORTEX_32 || COMPILE_TEST
+	help
+	  Driver to access the five 8-bit bidirectional GPIO ports present on
+	  all DM&P Vortex86 SoCs.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-vortex.
+
 config GPIO_WINBOND
 	tristate "Winbond Super I/O GPIO support"
 	select ISA_BUS_API
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88dedd298256..d226fc751686 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -196,6 +196,7 @@ obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
 obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
+obj-$(CONFIG_GPIO_VORTEX)		+= gpio-vortex.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
 obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
 obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
diff --git a/drivers/gpio/gpio-vortex.c b/drivers/gpio/gpio-vortex.c
new file mode 100644
index 000000000000..cf14d56d22d9
--- /dev/null
+++ b/drivers/gpio/gpio-vortex.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  GPIO driver for Vortex86 SoCs
+ *
+ *  Author: Marcos Del Sol Vives <marcos@orca.pet>
+ *
+ *  Based on the it87xx GPIO driver by Diego Elio Pettenò
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/ioport.h>
+#include <linux/spinlock.h>
+#include <linux/gpio/driver.h>
+#include <linux/platform_device.h>
+
+#define GPIO_PORTS	5
+#define GPIO_PER_PORT	8
+#define GPIO_COUNT	(GPIO_PORTS * GPIO_PER_PORT)
+
+#define GPIO_DATA_BASE		0x78
+#define GPIO_DIRECTION_BASE	0x98
+
+static struct platform_device *pdev;
+
+static DEFINE_SPINLOCK(gpio_lock);
+
+static int vortex_gpio_get(struct gpio_chip *chip, unsigned int gpio_num)
+{
+	uint8_t port = gpio_num / GPIO_PER_PORT;
+	uint8_t bit  = gpio_num % GPIO_PER_PORT;
+	uint8_t val;
+
+	val = inb(GPIO_DATA_BASE + port);
+	return !!(val & (1 << bit));
+}
+
+static int vortex_gpio_direction_in(struct gpio_chip *chip, unsigned int gpio_num)
+{
+	uint8_t port = gpio_num / GPIO_PER_PORT;
+	uint8_t bit  = gpio_num % GPIO_PER_PORT;
+	unsigned long flags;
+	uint8_t dir;
+
+	spin_lock_irqsave(&gpio_lock, flags);
+
+	dir = inb(GPIO_DIRECTION_BASE + port);
+	dir &= ~(1 << bit); /* 0 = input */
+	outb(dir, GPIO_DIRECTION_BASE + port);
+
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
+	return 0;
+}
+
+static int vortex_gpio_set(struct gpio_chip *chip, unsigned int gpio_num, int value)
+{
+	uint8_t port = gpio_num / GPIO_PER_PORT;
+	uint8_t bit  = gpio_num % GPIO_PER_PORT;
+	unsigned long flags;
+	uint8_t dat;
+
+	spin_lock_irqsave(&gpio_lock, flags);
+
+	dat = inb(GPIO_DATA_BASE + port);
+	if (value)
+		dat |= (1 << bit);
+	else
+		dat &= ~(1 << bit);
+	outb(dat, GPIO_DATA_BASE + port);
+
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
+	return 0;
+}
+
+static int vortex_gpio_direction_out(struct gpio_chip *chip, unsigned int gpio_num, int value)
+{
+	uint8_t port = gpio_num / GPIO_PER_PORT;
+	uint8_t bit  = gpio_num % GPIO_PER_PORT;
+	unsigned long flags;
+	uint8_t dir, dat;
+
+	spin_lock_irqsave(&gpio_lock, flags);
+
+	/* Have to set direction first. Else writes to data are ignored. */
+	dir = inb(GPIO_DIRECTION_BASE + port);
+	dir |= (1 << bit); /* 1 = output */
+	outb(dir, GPIO_DIRECTION_BASE + port);
+
+	dat = inb(GPIO_DATA_BASE + port);
+	if (value)
+		dat |= (1 << bit);
+	else
+		dat &= ~(1 << bit);
+	outb(dat, GPIO_DATA_BASE + port);
+
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
+	return 0;
+}
+
+static char labels[GPIO_COUNT][sizeof("vortex_gpXY")];
+static char *labels_table[GPIO_COUNT];
+
+static struct gpio_chip gpio_chip = {
+	.label			= KBUILD_MODNAME,
+	.owner			= THIS_MODULE,
+	.get			= vortex_gpio_get,
+	.direction_input	= vortex_gpio_direction_in,
+	.set_rv			= vortex_gpio_set,
+	.direction_output	= vortex_gpio_direction_out,
+	.base			= -1,
+	.ngpio			= GPIO_COUNT,
+	.names			= (const char * const *)labels_table,
+};
+
+static int vortex_gpio_probe(struct platform_device *pdev)
+{
+	/* Set up GPIO labels */
+	for (int i = 0; i < GPIO_COUNT; i++) {
+		sprintf(labels[i], "vortex_gp%u%u", i / 8, i % 8);
+		labels_table[i] = &labels[i][0];
+	}
+
+	return devm_gpiochip_add_data(&pdev->dev, &gpio_chip, NULL);
+}
+
+static struct platform_driver vortex_gpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.owner = THIS_MODULE,
+	},
+	.probe = vortex_gpio_probe,
+};
+
+static struct resource vortex_gpio_resources[] = {
+	DEFINE_RES_IO_NAMED(GPIO_DATA_BASE, GPIO_PORTS, KBUILD_MODNAME " data"),
+	DEFINE_RES_IO_NAMED(GPIO_DIRECTION_BASE, GPIO_PORTS, KBUILD_MODNAME " dir"),
+};
+
+static int __init vortex_gpio_init(void)
+{
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_VORTEX) {
+		pr_err("Not a Vortex86 CPU, refusing to load\n");
+		return -ENODEV;
+	}
+
+	pdev = platform_create_bundle(&vortex_gpio_driver, vortex_gpio_probe,
+			vortex_gpio_resources, ARRAY_SIZE(vortex_gpio_resources),
+			NULL, 0);
+	return PTR_ERR_OR_ZERO(pdev);
+}
+
+static void __exit vortex_gpio_exit(void)
+{
+	platform_device_unregister(pdev);
+	platform_driver_unregister(&vortex_gpio_driver);
+}
+
+module_init(vortex_gpio_init);
+module_exit(vortex_gpio_exit);
+
+MODULE_AUTHOR("Marcos Del Sol Vives <marcos@orca.pet>");
+MODULE_DESCRIPTION("GPIO driver for Vortex86 SoCs");
+MODULE_LICENSE("GPL");
-- 
2.34.1


