Return-Path: <linux-gpio+bounces-36295-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEeBKH9W+2n+ZQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36295-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:55:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F04DCB49
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B89F303EC14
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572D440F8C3;
	Wed,  6 May 2026 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Y+sNC/Ek";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="RhslPSKM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA7148166E;
	Wed,  6 May 2026 14:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078610; cv=none; b=NJZs55F0QvEMHpXSfh9UmYQD6eVr7mfja8dD1crggx+AR/5T2aPCn7+dv0SBnoUT05fKBrmMoilNWZaM1Hf205xv0vW9kbaersRqSADRdSuskL3DMjh2WWws4OGLdZ/YHAJ+wfrt2diQR31GHiLx6rJLTmycuJwtbMKhZCbrvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078610; c=relaxed/simple;
	bh=A1B3nJpY4ScbQWP11G5jpvKqoxxwkHCRodBvg0PzDdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFtATlzkMAnzeNdzxYRixqVABalzkCwXdpaXOEl2ZBeJ9a0KUhySV8xLFGUPzTPwIs9qiSp/CT9KRinsWodXhul5Lg5y39Nj2mEU9RCQvaTbGQAfsmxMu1GHC0X+ORX5Je/3+Crc+McdCMGAOQgu1ew8nCc5e/vDLEutTihBccc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Y+sNC/Ek; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=RhslPSKM; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1778078606; bh=A1B3nJpY4ScbQWP11G5jpvKqoxxwkHCRodBvg0PzDdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y+sNC/EklmcfadL/jIgi8uMI0OurI754hf1cY4LsNmuuJKeRR2zbS4f2IXSNHS9WI
	 cHHpJhmNXNmL1+a/SzF3Z/h8TfrBnS6w7Ps806fp8wup/l0LHGO62HwRe68WrZnSXA
	 Y7B+9vLs/mhqujP5c5UmqEjQ9OPylkv2Cbn8ThPdYMbWoUp+wuL7LypcGwgNWknD4w
	 6jZ3eeymkb7YuGt8jOJdJT0oj+Y8xXAqbXL+xqvGDAQwwd6NN0ZAc8cveAQPni+bQ9
	 UQexary2aS3ItEspz238uLu3sNTW60HSVvUTt4jFjU6czwMa0rjHOZjEgledAFi0JO
	 b2icS0BBPtC1g==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C2E5441CE2; Wed, 06 May 2026 15:43:26 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1778078590; bh=A1B3nJpY4ScbQWP11G5jpvKqoxxwkHCRodBvg0PzDdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhslPSKMuQUHbMtcvW5yJwF2caxDNLvs9lji3W7RBq0QS8BDNXY7jPJGGQptCedym
	 TxboVJq6ttADi/ICQRzB+80Obbu4wSlcPJn02JqWBHIGb463l06C8qAnI6132jAZfx
	 1vg3QNnBLZcGP6bM0waeP/nShmt5wxlJv96CBBh7IDfeGtBnDKNQeJCN6B4H6eu9+n
	 Vspgy2QpvsuEqYAVw3MVMjx426y4wHLsa41ItaXkJg3B0IUp4yCaeGyZoEW5ms2Xz/
	 0ePAFN8XP8NpDPHmjjGjngWZsFXV29gL6X4XT7sZKNPu4az0PgVuxp+VLMFp3fseFU
	 JqqIzRu9JYoKQ==
Received: from maru.local (unknown [140.228.74.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id A1A4441CE0;
	Wed, 06 May 2026 15:43:10 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH 5/8] gpio: ts5500: Remove gpio driver as board no longer supported
Date: Wed,  6 May 2026 15:42:50 +0100
Message-ID: <cd44c71752347272ee836b469e77f26dfb44d06c.1778071745.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778071745.git.sean@mess.org>
References: <cover.1778071745.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 984F04DCB49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36295-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[mess.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mess.org:email,mess.org:dkim,mess.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,savoirfairelinux.com:email]

Since commit 8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"),
this board is no longer supported. Remove the gpio driver too.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/gpio/Kconfig       |   9 -
 drivers/gpio/Makefile      |   1 -
 drivers/gpio/gpio-ts5500.c | 446 -------------------------------------
 3 files changed, 456 deletions(-)
 delete mode 100644 drivers/gpio/gpio-ts5500.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317..359a21cb093e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1093,15 +1093,6 @@ config GPIO_SCH311X
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
 	select ISA_BUS_API
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b267598b517d..dc9d1106e75f 100644
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
2.54.0


