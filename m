Return-Path: <linux-gpio+bounces-37515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAksMz13FWrpVAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:34:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CBA5D43CD
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD9153028F54
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BE33DD872;
	Tue, 26 May 2026 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I77h3nE2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3983DD854;
	Tue, 26 May 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791674; cv=none; b=PKTxsNBeJSCHGJg5xhRxlcJ7NS2mFNDkc7iRpfYMwtwYsq2jODwp4Pn6k3hFr6SLvWZzWqc1BNxVQUvfaveVV8vvqTlxjc3Yx5Ov/5ExMSrg6/ylYEEdw2lBSxiX78uFA08S/B7afA9N9B0lZvBWQtRErwtP2rafx1q2jIpGBDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791674; c=relaxed/simple;
	bh=+7G4A6FZWu3fpkn3fZ8+ifPgvnHeWhbVg9Ezk44nE88=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JYhuDKxcoqQSz1sBFZT3qRqhqDNxxtlejsLxbBae/tGmH3SSjwhMD4cnT8na/En6JC/V0+bpX92C2g2PqpiVZKMAIBLKbhmEgUqPngTPkIKjbRiYObNZFcu+DUuskXpzp+bleUlIeRcsxCtVHC66aL7JHwAB0HEu/JiFWAMOlq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I77h3nE2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835641F000E9;
	Tue, 26 May 2026 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791672;
	bh=6cgGtqicu3xk0wKP2nsnZtvWqYfru4oYgTPbRuiURps=;
	h=From:To:Cc:Subject:Date;
	b=I77h3nE2+7cv0p7AWYtznfo4RFcCC1FMLaI2UqKQ3OjYTbCuI0y9ON6Xh6miaTxNn
	 jrEKVCojDTTQBU6gRQmE06H24Y9UGJ6bnRJp/G/CCKkLvTJdUS2ts9xoSCjXZNbgrR
	 4mPinT3Fx4n1RAD3lmmjJjcJ1Z8EBulkADrAEpe+2Fc2Nf4DSBSZ6oM2JpYq01f/3F
	 DTmSnKZqgbyaiuVnPqoIv2qM2t5xXYkQwsnyw+CiZJfPKQx3J5NJ/6fh57wyRKGVPj
	 z1AQsyMZbnwr8oUAYPVpbdj7MkfuP9Tzf7+wrpLz3QtAxL/q/12fCg2yrsKJNQ2yAd
	 jS+UghO8mk3sA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: ts5500: remove obsolete driver
Date: Tue, 26 May 2026 12:33:54 +0200
Message-Id: <20260526103424.3246915-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37515-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arndb.de:email,embeddedts.com:url]
X-Rspamd-Queue-Id: 64CBA5D43CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The ts5500 platform is no longer functional because it is
based on the removed AMD Élan i486 SoC. Remove the now
obsolete driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig       |   9 -
 drivers/gpio/Makefile      |   1 -
 drivers/gpio/gpio-ts5500.c | 446 -------------------------------------
 3 files changed, 456 deletions(-)
 delete mode 100644 drivers/gpio/gpio-ts5500.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3cefc43351f7..c565272a7996 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1111,15 +1111,6 @@ config GPIO_SCH311X
 	  To compile this driver as a module, choose M here: the module will
 	  be called gpio-sch311x.
 
-config GPIO_TS5500
-	tristate "TS-5500 DIO blocks and compatibles"
-	depends on TS5500 || COMPILE_TEST
-	help
-	  This driver supports Digital I/O exposed by pin blocks found on some
-	  Technologic Systems platforms. It includes, but is not limited to, 3
-	  blocks of the TS-5500: DIO1, DIO2 and the LCD port, and the TS-5600
-	  LCD port.
-
 config GPIO_WINBOND
 	tristate "Winbond Super I/O GPIO support"
 	depends on PC104
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2ea47d9d3dca..1f9945e7944e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -194,7 +194,6 @@ obj-$(CONFIG_GPIO_TPS68470)		+= gpio-tps68470.o
 obj-$(CONFIG_GPIO_TQMX86)		+= gpio-tqmx86.o
 obj-$(CONFIG_GPIO_TS4800)		+= gpio-ts4800.o
 obj-$(CONFIG_GPIO_TS4900)		+= gpio-ts4900.o
-obj-$(CONFIG_GPIO_TS5500)		+= gpio-ts5500.o
 obj-$(CONFIG_GPIO_TWL4030)		+= gpio-twl4030.o
 obj-$(CONFIG_GPIO_TWL6040)		+= gpio-twl6040.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
deleted file mode 100644
index 3c7f2efe10fd..000000000000
--- a/drivers/gpio/gpio-ts5500.c
+++ /dev/null
@@ -1,446 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Digital I/O driver for Technologic Systems TS-5500
- *
- * Copyright (c) 2012 Savoir-faire Linux Inc.
- *	Vivien Didelot <vivien.didelot@savoirfairelinux.com>
- *
- * Technologic Systems platforms have pin blocks, exposing several Digital
- * Input/Output lines (DIO). This driver aims to support single pin blocks.
- * In that sense, the support is not limited to the TS-5500 blocks.
- * Actually, the following platforms have DIO support:
- *
- * TS-5500:
- *   Documentation: https://docs.embeddedts.com/TS-5500
- *   Blocks: DIO1, DIO2 and LCD port.
- *
- * TS-5600:
- *   Documentation: https://docs.embeddedts.com/TS-5600
- *   Blocks: LCD port (identical to TS-5500 LCD).
- */
-
-#include <linux/bitops.h>
-#include <linux/gpio/driver.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-/* List of supported Technologic Systems platforms DIO blocks */
-enum ts5500_blocks { TS5500_DIO1, TS5500_DIO2, TS5500_LCD, TS5600_LCD };
-
-struct ts5500_priv {
-	const struct ts5500_dio *pinout;
-	struct gpio_chip gpio_chip;
-	spinlock_t lock;
-	bool strap;
-	u8 hwirq;
-};
-
-/*
- * Hex 7D is used to control several blocks (e.g. DIO2 and LCD port).
- * This flag ensures that the region has been requested by this driver.
- */
-static bool hex7d_reserved;
-
-/*
- * This structure is used to describe capabilities of DIO lines,
- * such as available directions and connected interrupt (if any).
- */
-struct ts5500_dio {
-	const u8 value_addr;
-	const u8 value_mask;
-	const u8 control_addr;
-	const u8 control_mask;
-	const bool no_input;
-	const bool no_output;
-	const u8 irq;
-};
-
-#define TS5500_DIO_IN_OUT(vaddr, vbit, caddr, cbit)	\
-	{						\
-		.value_addr = vaddr,			\
-		.value_mask = BIT(vbit),		\
-		.control_addr = caddr,			\
-		.control_mask = BIT(cbit),		\
-	}
-
-#define TS5500_DIO_IN(addr, bit)		\
-	{					\
-		.value_addr = addr,		\
-		.value_mask = BIT(bit),		\
-		.no_output = true,		\
-	}
-
-#define TS5500_DIO_IN_IRQ(addr, bit, _irq)	\
-	{					\
-		.value_addr = addr,		\
-		.value_mask = BIT(bit),		\
-		.no_output = true,		\
-		.irq = _irq,			\
-	}
-
-#define TS5500_DIO_OUT(addr, bit)		\
-	{					\
-		.value_addr = addr,		\
-		.value_mask = BIT(bit),		\
-		.no_input = true,		\
-	}
-
-/*
- * Input/Output DIO lines are programmed in groups of 4. Their values are
- * available through 4 consecutive bits in a value port, whereas the direction
- * of these 4 lines is driven by only 1 bit in a control port.
- */
-#define TS5500_DIO_GROUP(vaddr, vbitfrom, caddr, cbit)		\
-	TS5500_DIO_IN_OUT(vaddr, vbitfrom + 0, caddr, cbit),	\
-	TS5500_DIO_IN_OUT(vaddr, vbitfrom + 1, caddr, cbit),	\
-	TS5500_DIO_IN_OUT(vaddr, vbitfrom + 2, caddr, cbit),	\
-	TS5500_DIO_IN_OUT(vaddr, vbitfrom + 3, caddr, cbit)
-
-/*
- * TS-5500 DIO1 block
- *
- *  value    control  dir    hw
- *  addr bit addr bit in out irq name     pin offset
- *
- *  0x7b  0  0x7a  0  x   x      DIO1_0   1   0
- *  0x7b  1  0x7a  0  x   x      DIO1_1   3   1
- *  0x7b  2  0x7a  0  x   x      DIO1_2   5   2
- *  0x7b  3  0x7a  0  x   x      DIO1_3   7   3
- *  0x7b  4  0x7a  1  x   x      DIO1_4   9   4
- *  0x7b  5  0x7a  1  x   x      DIO1_5   11  5
- *  0x7b  6  0x7a  1  x   x      DIO1_6   13  6
- *  0x7b  7  0x7a  1  x   x      DIO1_7   15  7
- *  0x7c  0  0x7a  5  x   x      DIO1_8   4   8
- *  0x7c  1  0x7a  5  x   x      DIO1_9   6   9
- *  0x7c  2  0x7a  5  x   x      DIO1_10  8   10
- *  0x7c  3  0x7a  5  x   x      DIO1_11  10  11
- *  0x7c  4           x          DIO1_12  12  12
- *  0x7c  5           x      7   DIO1_13  14  13
- */
-static const struct ts5500_dio ts5500_dio1[] = {
-	TS5500_DIO_GROUP(0x7b, 0, 0x7a, 0),
-	TS5500_DIO_GROUP(0x7b, 4, 0x7a, 1),
-	TS5500_DIO_GROUP(0x7c, 0, 0x7a, 5),
-	TS5500_DIO_IN(0x7c, 4),
-	TS5500_DIO_IN_IRQ(0x7c, 5, 7),
-};
-
-/*
- * TS-5500 DIO2 block
- *
- *  value    control  dir    hw
- *  addr bit addr bit in out irq name     pin offset
- *
- *  0x7e  0  0x7d  0  x   x      DIO2_0   1   0
- *  0x7e  1  0x7d  0  x   x      DIO2_1   3   1
- *  0x7e  2  0x7d  0  x   x      DIO2_2   5   2
- *  0x7e  3  0x7d  0  x   x      DIO2_3   7   3
- *  0x7e  4  0x7d  1  x   x      DIO2_4   9   4
- *  0x7e  5  0x7d  1  x   x      DIO2_5   11  5
- *  0x7e  6  0x7d  1  x   x      DIO2_6   13  6
- *  0x7e  7  0x7d  1  x   x      DIO2_7   15  7
- *  0x7f  0  0x7d  5  x   x      DIO2_8   4   8
- *  0x7f  1  0x7d  5  x   x      DIO2_9   6   9
- *  0x7f  2  0x7d  5  x   x      DIO2_10  8   10
- *  0x7f  3  0x7d  5  x   x      DIO2_11  10  11
- *  0x7f  4           x      6   DIO2_13  14  12
- */
-static const struct ts5500_dio ts5500_dio2[] = {
-	TS5500_DIO_GROUP(0x7e, 0, 0x7d, 0),
-	TS5500_DIO_GROUP(0x7e, 4, 0x7d, 1),
-	TS5500_DIO_GROUP(0x7f, 0, 0x7d, 5),
-	TS5500_DIO_IN_IRQ(0x7f, 4, 6),
-};
-
-/*
- * TS-5500 LCD port used as DIO block
- * TS-5600 LCD port is identical
- *
- *  value    control  dir    hw
- *  addr bit addr bit in out irq name    pin offset
- *
- *  0x72  0  0x7d  2  x   x      LCD_0   8   0
- *  0x72  1  0x7d  2  x   x      LCD_1   7   1
- *  0x72  2  0x7d  2  x   x      LCD_2   10  2
- *  0x72  3  0x7d  2  x   x      LCD_3   9   3
- *  0x72  4  0x7d  3  x   x      LCD_4   12  4
- *  0x72  5  0x7d  3  x   x      LCD_5   11  5
- *  0x72  6  0x7d  3  x   x      LCD_6   14  6
- *  0x72  7  0x7d  3  x   x      LCD_7   13  7
- *  0x73  0               x      LCD_EN  5   8
- *  0x73  6           x          LCD_WR  6   9
- *  0x73  7           x      1   LCD_RS  3   10
- */
-static const struct ts5500_dio ts5500_lcd[] = {
-	TS5500_DIO_GROUP(0x72, 0, 0x7d, 2),
-	TS5500_DIO_GROUP(0x72, 4, 0x7d, 3),
-	TS5500_DIO_OUT(0x73, 0),
-	TS5500_DIO_IN(0x73, 6),
-	TS5500_DIO_IN_IRQ(0x73, 7, 1),
-};
-
-static inline void ts5500_set_mask(u8 mask, u8 addr)
-{
-	u8 val = inb(addr);
-	val |= mask;
-	outb(val, addr);
-}
-
-static inline void ts5500_clear_mask(u8 mask, u8 addr)
-{
-	u8 val = inb(addr);
-	val &= ~mask;
-	outb(val, addr);
-}
-
-static int ts5500_gpio_input(struct gpio_chip *chip, unsigned offset)
-{
-	struct ts5500_priv *priv = gpiochip_get_data(chip);
-	const struct ts5500_dio line = priv->pinout[offset];
-	unsigned long flags;
-
-	if (line.no_input)
-		return -ENXIO;
-
-	if (line.no_output)
-		return 0;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	ts5500_clear_mask(line.control_mask, line.control_addr);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
-}
-
-static int ts5500_gpio_get(struct gpio_chip *chip, unsigned offset)
-{
-	struct ts5500_priv *priv = gpiochip_get_data(chip);
-	const struct ts5500_dio line = priv->pinout[offset];
-
-	return !!(inb(line.value_addr) & line.value_mask);
-}
-
-static int ts5500_gpio_output(struct gpio_chip *chip, unsigned offset, int val)
-{
-	struct ts5500_priv *priv = gpiochip_get_data(chip);
-	const struct ts5500_dio line = priv->pinout[offset];
-	unsigned long flags;
-
-	if (line.no_output)
-		return -ENXIO;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	if (!line.no_input)
-		ts5500_set_mask(line.control_mask, line.control_addr);
-
-	if (val)
-		ts5500_set_mask(line.value_mask, line.value_addr);
-	else
-		ts5500_clear_mask(line.value_mask, line.value_addr);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
-}
-
-static int ts5500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
-{
-	struct ts5500_priv *priv = gpiochip_get_data(chip);
-	const struct ts5500_dio line = priv->pinout[offset];
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	if (val)
-		ts5500_set_mask(line.value_mask, line.value_addr);
-	else
-		ts5500_clear_mask(line.value_mask, line.value_addr);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
-}
-
-static int ts5500_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct ts5500_priv *priv = gpiochip_get_data(chip);
-	const struct ts5500_dio *block = priv->pinout;
-	const struct ts5500_dio line = block[offset];
-
-	/* Only one pin is connected to an interrupt */
-	if (line.irq)
-		return line.irq;
-
-	/* As this pin is input-only, we may strap it to another in/out pin */
-	if (priv->strap)
-		return priv->hwirq;
-
-	return -ENXIO;
-}
-
-static int ts5500_enable_irq(struct ts5500_priv *priv)
-{
-	int ret = 0;
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	if (priv->hwirq == 7)
-		ts5500_set_mask(BIT(7), 0x7a); /* DIO1_13 on IRQ7 */
-	else if (priv->hwirq == 6)
-		ts5500_set_mask(BIT(7), 0x7d); /* DIO2_13 on IRQ6 */
-	else if (priv->hwirq == 1)
-		ts5500_set_mask(BIT(6), 0x7d); /* LCD_RS on IRQ1 */
-	else
-		ret = -EINVAL;
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return ret;
-}
-
-static void ts5500_disable_irq(struct ts5500_priv *priv)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	if (priv->hwirq == 7)
-		ts5500_clear_mask(BIT(7), 0x7a); /* DIO1_13 on IRQ7 */
-	else if (priv->hwirq == 6)
-		ts5500_clear_mask(BIT(7), 0x7d); /* DIO2_13 on IRQ6 */
-	else if (priv->hwirq == 1)
-		ts5500_clear_mask(BIT(6), 0x7d); /* LCD_RS on IRQ1 */
-	else
-		dev_err(priv->gpio_chip.parent, "invalid hwirq %d\n",
-			priv->hwirq);
-	spin_unlock_irqrestore(&priv->lock, flags);
-}
-
-static int ts5500_dio_probe(struct platform_device *pdev)
-{
-	enum ts5500_blocks block = platform_get_device_id(pdev)->driver_data;
-	struct device *dev = &pdev->dev;
-	const char *name = dev_name(dev);
-	struct ts5500_priv *priv;
-	unsigned long flags;
-	int ret;
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
-
-	priv = devm_kzalloc(dev, sizeof(struct ts5500_priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, priv);
-	priv->hwirq = ret;
-	spin_lock_init(&priv->lock);
-
-	priv->gpio_chip.owner = THIS_MODULE;
-	priv->gpio_chip.label = name;
-	priv->gpio_chip.parent = dev;
-	priv->gpio_chip.direction_input = ts5500_gpio_input;
-	priv->gpio_chip.direction_output = ts5500_gpio_output;
-	priv->gpio_chip.get = ts5500_gpio_get;
-	priv->gpio_chip.set = ts5500_gpio_set;
-	priv->gpio_chip.to_irq = ts5500_gpio_to_irq;
-	priv->gpio_chip.base = -1;
-
-	switch (block) {
-	case TS5500_DIO1:
-		priv->pinout = ts5500_dio1;
-		priv->gpio_chip.ngpio = ARRAY_SIZE(ts5500_dio1);
-
-		if (!devm_request_region(dev, 0x7a, 3, name)) {
-			dev_err(dev, "failed to request %s ports\n", name);
-			return -EBUSY;
-		}
-		break;
-	case TS5500_DIO2:
-		priv->pinout = ts5500_dio2;
-		priv->gpio_chip.ngpio = ARRAY_SIZE(ts5500_dio2);
-
-		if (!devm_request_region(dev, 0x7e, 2, name)) {
-			dev_err(dev, "failed to request %s ports\n", name);
-			return -EBUSY;
-		}
-
-		if (hex7d_reserved)
-			break;
-
-		if (!devm_request_region(dev, 0x7d, 1, name)) {
-			dev_err(dev, "failed to request %s 7D\n", name);
-			return -EBUSY;
-		}
-
-		hex7d_reserved = true;
-		break;
-	case TS5500_LCD:
-	case TS5600_LCD:
-		priv->pinout = ts5500_lcd;
-		priv->gpio_chip.ngpio = ARRAY_SIZE(ts5500_lcd);
-
-		if (!devm_request_region(dev, 0x72, 2, name)) {
-			dev_err(dev, "failed to request %s ports\n", name);
-			return -EBUSY;
-		}
-
-		if (!hex7d_reserved) {
-			if (!devm_request_region(dev, 0x7d, 1, name)) {
-				dev_err(dev, "failed to request %s 7D\n", name);
-				return -EBUSY;
-			}
-
-			hex7d_reserved = true;
-		}
-
-		/* Ensure usage of LCD port as DIO */
-		spin_lock_irqsave(&priv->lock, flags);
-		ts5500_clear_mask(BIT(4), 0x7d);
-		spin_unlock_irqrestore(&priv->lock, flags);
-		break;
-	}
-
-	ret = devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
-	if (ret) {
-		dev_err(dev, "failed to register the gpio chip\n");
-		return ret;
-	}
-
-	ret = ts5500_enable_irq(priv);
-	if (ret) {
-		dev_err(dev, "invalid interrupt %d\n", priv->hwirq);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void ts5500_dio_remove(struct platform_device *pdev)
-{
-	struct ts5500_priv *priv = platform_get_drvdata(pdev);
-
-	ts5500_disable_irq(priv);
-}
-
-static const struct platform_device_id ts5500_dio_ids[] = {
-	{ "ts5500-dio1", TS5500_DIO1 },
-	{ "ts5500-dio2", TS5500_DIO2 },
-	{ "ts5500-dio-lcd", TS5500_LCD },
-	{ "ts5600-dio-lcd", TS5600_LCD },
-	{ }
-};
-MODULE_DEVICE_TABLE(platform, ts5500_dio_ids);
-
-static struct platform_driver ts5500_dio_driver = {
-	.driver = {
-		.name = "ts5500-dio",
-	},
-	.probe = ts5500_dio_probe,
-	.remove = ts5500_dio_remove,
-	.id_table = ts5500_dio_ids,
-};
-
-module_platform_driver(ts5500_dio_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Savoir-faire Linux Inc. <kernel@savoirfairelinux.com>");
-MODULE_DESCRIPTION("Technologic Systems TS-5500 Digital I/O driver");
-- 
2.39.5


