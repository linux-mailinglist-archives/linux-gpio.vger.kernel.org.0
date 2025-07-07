Return-Path: <linux-gpio+bounces-22885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE19AFB57F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A9DE3AB574
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 13:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7F7191499;
	Mon,  7 Jul 2025 14:00:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout2.mo533.mail-out.ovh.net (smtpout2.mo533.mail-out.ovh.net [51.210.94.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659752BD5BC
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.94.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751896805; cv=none; b=b0h0Rcs6NccKDtT8CnwLxjdC1OkngtFHV5dwhrdsCDGD/QCXcH5ZtE8n1i8ac4PJZGTBcQOBQtikc98sHIhY2wjBHAb75BL5i4+GZIkQ/YMI48jUuNjPLAvnW6oXJhoOdvXOYmEdCWa2+ZtX2/+e7YCxtEnByJm0q97W/aim2a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751896805; c=relaxed/simple;
	bh=MwcR/DXMTj/JAiWzH/o5SeI/n04Ums7+03DlTeSZFYs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Nk2TNbXCJWyxEO0f/32M1Z0Zjb9kwuY56dQGwIUe1oZJO4B07g/ivzIhuteop+OeT0arBpeUuMNl9C4S8vVTQM7ROfY/UegVLbaCE/kRTEgrjgR7/rk19/KCihwCConYrSblOjXwU4AQIOsDm0hiNPIJHVVOSFlumt4+UpnAwSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; arc=none smtp.client-ip=51.210.94.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4bbPzb43ZSz6Mmp;
	Mon,  7 Jul 2025 13:22:19 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Mon,  7 Jul 2025 13:22:19 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.168.57])
	by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4bbPzb2ZL9z1xrj;
	Mon,  7 Jul 2025 13:22:19 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.7])
	by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id A2E14BA429A;
	Mon,  7 Jul 2025 13:22:18 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-102R004443e23e6-7882-48e7-9962-a2a9bd782506,
                    F886D19416C0B9BC8E07D11B456840F184BAC853) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:147.156.42.5
From: Marcos Del Sol Vives <marcos@orca.pet>
To: linux-kernel@vger.kernel.org
Cc: marcos@orca.pet,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: vortex86: add new GPIO device driver
Date: Mon,  7 Jul 2025 15:21:51 +0200
Message-Id: <20250707132154.771758-1-marcos@orca.pet>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14558730224674428635
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgtohhsucffvghlucfuohhlucggihhvvghsuceomhgrrhgtohhssehorhgtrgdrphgvtheqnecuggftrfgrthhtvghrnhepveeiueeugeeuteekgeegudegveeljeduieekkeeuleehiefhieeiudelhfdvieffnecuffhomhgrihhnpegumhhprdgtohhmrdhtfienucfkphepuddvjedrtddrtddruddpudegjedrudehiedrgedvrdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrghrtghoshesohhrtggrrdhpvghtpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrghrtghoshesohhrtggrrdhpvghtpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehfeefmgdpmhhoug
 gvpehsmhhtphhouhht

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
 MAINTAINERS                  |   6 ++
 drivers/gpio/Kconfig         |  10 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-vortex86.c | 161 +++++++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 drivers/gpio/gpio-vortex86.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fad6cb025a19..3e0ef902d003 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26574,6 +26574,12 @@ VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
 R:	Matti Vaittinen <mazziesaccount@gmail.com>
 F:	drivers/regulator/irq_helpers.c
 
+VORTEX86 GPIO DRIVER
+R:	Marcos Del Sol Vives <marcos@orca.pet>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-vortex86.c
+
 VRF
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 44f922e10db2..b51aa06bb11b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1066,6 +1066,16 @@ config GPIO_TS5500
 	  blocks of the TS-5500: DIO1, DIO2 and the LCD port, and the TS-5600
 	  LCD port.
 
+config GPIO_VORTEX86
+	tristate "Vortex86 GPIO support"
+	depends on CPU_SUP_VORTEX_32 || COMPILE_TEST
+	help
+	  Driver to access the five 8-bit bidirectional GPIO ports present on
+	  all DM&P Vortex86 SoCs.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-vortex86.
+
 config GPIO_WINBOND
 	tristate "Winbond Super I/O GPIO support"
 	select ISA_BUS_API
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88dedd298256..9d9ce589cc78 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -196,6 +196,7 @@ obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
 obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
+obj-$(CONFIG_GPIO_VORTEX86)		+= gpio-vortex86.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
 obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
 obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
diff --git a/drivers/gpio/gpio-vortex86.c b/drivers/gpio/gpio-vortex86.c
new file mode 100644
index 000000000000..6f79db392baa
--- /dev/null
+++ b/drivers/gpio/gpio-vortex86.c
@@ -0,0 +1,161 @@
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/ioport.h>
+#include <linux/gpio/driver.h>
+#include <linux/spinlock.h>
+
+#define GPIO_PORTS	5
+#define GPIO_PER_PORT	8
+#define GPIO_COUNT	(GPIO_PORTS * GPIO_PER_PORT)
+
+#define GPIO_DATA_BASE		0x78
+#define GPIO_DIRECTION_BASE	0x98
+
+static DEFINE_SPINLOCK(gpio_lock);
+
+static int vortex86_gpio_get(struct gpio_chip *chip, unsigned int gpio_num)
+{
+	uint8_t port = gpio_num / GPIO_PER_PORT;
+	uint8_t bit  = gpio_num % GPIO_PER_PORT;
+	uint8_t val;
+
+	val = inb(GPIO_DATA_BASE + port);
+	return !!(val & (1 << bit));
+}
+
+static int vortex86_gpio_direction_in(struct gpio_chip *chip, unsigned int gpio_num)
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
+static void vortex86_gpio_set(struct gpio_chip *chip, unsigned int gpio_num, int value)
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
+}
+
+static int vortex86_gpio_direction_out(struct gpio_chip *chip, unsigned int gpio_num, int value)
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
+static char labels[GPIO_COUNT][sizeof("vortex86_gpXY")];
+static char *labels_table[GPIO_COUNT];
+
+static struct gpio_chip gpio_chip = {
+	.label			= KBUILD_MODNAME,
+	.owner			= THIS_MODULE,
+	.get			= vortex86_gpio_get,
+	.direction_input	= vortex86_gpio_direction_in,
+	.set			= vortex86_gpio_set,
+	.direction_output	= vortex86_gpio_direction_out,
+	.base			= -1,
+	.ngpio			= GPIO_COUNT,
+	.names			= (const char * const *)labels_table,
+};
+
+static int __init vortex86_gpio_init(void)
+{
+	int rc = 0, i;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_VORTEX) {
+		pr_err("Not a Vortex86 CPU, refusing to load\n");
+		return -ENODEV;
+	}
+
+	/* Request I/O regions for data and direction registers */
+	if (!request_region(GPIO_DATA_BASE, GPIO_PORTS, KBUILD_MODNAME))
+		return -EBUSY;
+	if (!request_region(GPIO_DIRECTION_BASE, GPIO_PORTS, KBUILD_MODNAME)) {
+		release_region(GPIO_DATA_BASE, GPIO_PORTS);
+		return -EBUSY;
+	}
+
+	/* Set up GPIO labels */
+	for (i = 0; i < GPIO_COUNT; i++) {
+		sprintf(labels[i], "vortex86_gp%u%u", i / 8, i % 8);
+		labels_table[i] = &labels[i][0];
+	}
+
+	rc = gpiochip_add_data(&gpio_chip, &gpio_chip);
+	if (rc) {
+		release_region(GPIO_DATA_BASE, GPIO_PORTS);
+		release_region(GPIO_DIRECTION_BASE, GPIO_PORTS);
+		return rc;
+	}
+
+	return 0;
+}
+
+static void __exit vortex86_gpio_exit(void)
+{
+	gpiochip_remove(&gpio_chip);
+	release_region(GPIO_DATA_BASE, GPIO_PORTS);
+	release_region(GPIO_DIRECTION_BASE, GPIO_PORTS);
+}
+
+module_init(vortex86_gpio_init);
+module_exit(vortex86_gpio_exit);
+
+MODULE_AUTHOR("Marcos Del Sol Vives <marcos@orca.pet>");
+MODULE_DESCRIPTION("GPIO driver for Vortex86 SoCs");
+MODULE_LICENSE("GPL");
-- 
2.34.1


