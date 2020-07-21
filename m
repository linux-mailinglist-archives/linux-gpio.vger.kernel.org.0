Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556D5227A06
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 10:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgGUIAs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 04:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUIAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 04:00:46 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA743C061794;
        Tue, 21 Jul 2020 01:00:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z2so20252803wrp.2;
        Tue, 21 Jul 2020 01:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jG/ODGoZmmcME4iI0eF1mfiEGpGUukxVWguBdIcBE3E=;
        b=ABTI0RCB7Fkqtrh+SGq1/O5Y8fak+aXMb/ffNYP/SXS2FE3g110Bp332u8Fe6JnkZz
         wigzKuMEfz7nNNeqf4buf7RdZ/V18n5Ka/4x0i8lmPosArEG8hn3en1bWCvg+3087G06
         wYd3rW3Kpss25ABgdLLRND+jE6QmWINNNgB2UzKrGBEDO2xZ4UCB7KDE594MDWK4v8hb
         LbX/MSj7zji1kQaxeWj0ulOgjT31puKbxz30mhIbaX2hjzejX50g3xdAE7TJ44/GAnyM
         0z7vWqGVZo8DQMoBKx+c1gUPi4NXd85B/riXGRgrTVjr6sX087PObehRwCoBqC1ePMkM
         xdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jG/ODGoZmmcME4iI0eF1mfiEGpGUukxVWguBdIcBE3E=;
        b=Gaxu1MDxRXxwxrozROjD6/lKpQ0/h9yyjqSRqfp9lpaBYICNV/mUHs4+RAc1WRmfem
         27W6uNq8onH7GHHFbSaKxS8pLPqFEvt5feo5kkXgEe2b1JB7G4nlGBOm2kxlBeHzHqat
         cs6HOIH67PhdRELNx9Iut9p1QjQemg0lkvkNoxVN/krW5vcm9a7iDkw/5z0OC7/kSu24
         gkzHFG47AjVvIHjMtmM9vTNmkF/5IKecuOsaaY7zoxyYKeSuAlO6bN9shOxJ7WDIFErx
         l9e37kaaWZwWqIIMzxG/zzu3kI0n1coNbEQRdhQSVcl3FkdhOW+9l0Gg+5EuBcH9vQla
         +5fg==
X-Gm-Message-State: AOAM531At1ehXDiIFU6N5llGI/E6GyKfz0NtD12I8LAJ1zYxgLwhMd+8
        0XDbTrilcab3g1YiGrSluBI=
X-Google-Smtp-Source: ABdhPJzyL9pq0WJxKs0VbIqYBIosjjimeISpCUMOxY/gce6VUy+KNHxCmOe2mEfLuH2ofLy+AV7IKQ==
X-Received: by 2002:adf:bb83:: with SMTP id q3mr12508267wrg.58.1595318442731;
        Tue, 21 Jul 2020 01:00:42 -0700 (PDT)
Received: from localhost ([41.37.22.226])
        by smtp.gmail.com with ESMTPSA id e23sm2308899wme.35.2020.07.21.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 01:00:42 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH] gpio: fixed some coding style issues in the gpio files
Date:   Tue, 21 Jul 2020 10:00:12 +0200
Message-Id: <20200721080012.1329263-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds the word int to unsigned in more than 600 locations,
(and changed one long int into int)
I recompiled the files except some that had no make rules,
and I can make another patch only for the files that did compile.

If you want, I can split it into smaller ones. I don't think that this patch
causes any problem, except maybe causing diff and patch to fail because
of the number of lines changed, so maybe if you have any patches that
need to be applied just apply them before you do that one.

if the word int was intentionally left out, a sed command can be
run, now that the code is more uniform, to change every instance of
unsigned int to unsigned, and if you want I can supply a patch for that.

I can also add more patches to fix the rest of the code style errors,
that are stand alone or apply after this one.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 48 +++++++++++++-------------
 drivers/gpio/gpio-104-idi-48.c  | 34 +++++++++----------
 drivers/gpio/gpio-104-idio-16.c | 20 +++++------
 drivers/gpio/gpio-74x164.c      |  6 ++--
 drivers/gpio/gpio-74xx-mmio.c   |  4 +--
 drivers/gpio/gpio-adnp.c        | 14 ++++----
 drivers/gpio/gpio-adp5520.c     |  8 ++---
 drivers/gpio/gpio-adp5588.c     | 20 +++++------
 drivers/gpio/gpio-altera.c      |  8 ++---
 drivers/gpio/gpio-amd8111.c     | 12 +++----
 drivers/gpio/gpio-amdpt.c       |  4 +--
 drivers/gpio/gpio-arizona.c     |  8 ++---
 drivers/gpio/gpio-aspeed.c      |  2 +-
 drivers/gpio/gpio-ath79.c       |  6 ++--
 drivers/gpio/gpio-bcm-kona.c    | 34 +++++++++----------
 drivers/gpio/gpio-brcmstb.c     |  2 +-
 drivers/gpio/gpio-bt8xx.c       |  8 ++---
 drivers/gpio/gpio-crystalcove.c | 10 +++---
 drivers/gpio/gpio-cs5535.c      | 24 ++++++-------
 drivers/gpio/gpio-da9052.c      | 10 +++---
 drivers/gpio/gpio-da9055.c      |  8 ++---
 drivers/gpio/gpio-davinci.c     | 26 +++++++-------
 drivers/gpio/gpio-dln2.c        | 28 +++++++--------
 drivers/gpio/gpio-dwapb.c       |  6 ++--
 drivers/gpio/gpio-em.c          | 16 ++++-----
 drivers/gpio/gpio-ep93xx.c      |  6 ++--
 drivers/gpio/gpio-f7188x.c      | 24 ++++++-------
 drivers/gpio/gpio-grgpio.c      |  2 +-
 drivers/gpio/gpio-gw-pld.c      |  8 ++---
 drivers/gpio/gpio-htc-egpio.c   | 12 +++----
 drivers/gpio/gpio-ich.c         | 26 +++++++-------
 drivers/gpio/gpio-intel-mid.c   | 22 ++++++------
 drivers/gpio/gpio-it87.c        | 10 +++---
 drivers/gpio/gpio-janz-ttl.c    |  4 +--
 drivers/gpio/gpio-kempld.c      | 10 +++---
 drivers/gpio/gpio-logicvc.c     |  8 ++---
 drivers/gpio/gpio-loongson.c    |  8 ++---
 drivers/gpio/gpio-lp3943.c      | 16 ++++-----
 drivers/gpio/gpio-lp873x.c      |  2 +-
 drivers/gpio/gpio-lpc18xx.c     | 10 +++---
 drivers/gpio/gpio-lpc32xx.c     | 52 ++++++++++++++--------------
 drivers/gpio/gpio-max730x.c     | 10 +++---
 drivers/gpio/gpio-max732x.c     | 20 +++++------
 drivers/gpio/gpio-mb86s7x.c     | 12 +++----
 drivers/gpio/gpio-mc33880.c     |  4 +--
 drivers/gpio/gpio-mc9s08dz60.c  |  8 ++---
 drivers/gpio/gpio-menz127.c     |  8 ++---
 drivers/gpio/gpio-ml-ioh.c      | 10 +++---
 drivers/gpio/gpio-mm-lantiq.c   |  4 +--
 drivers/gpio/gpio-mmio.c        |  2 +-
 drivers/gpio/gpio-mpc8xxx.c     |  4 +--
 drivers/gpio/gpio-msic.c        | 22 ++++++------
 drivers/gpio/gpio-mxc.c         | 24 ++++++-------
 drivers/gpio/gpio-mxs.c         |  4 +--
 drivers/gpio/gpio-octeon.c      |  8 ++---
 drivers/gpio/gpio-omap.c        | 60 ++++++++++++++++-----------------
 drivers/gpio/gpio-palmas.c      | 10 +++---
 drivers/gpio/gpio-pca953x.c     | 12 +++----
 drivers/gpio/gpio-pcf857x.c     | 22 ++++++------
 drivers/gpio/gpio-pch.c         | 10 +++---
 drivers/gpio/gpio-pisosr.c      |  8 ++---
 drivers/gpio/gpio-pl061.c       | 12 +++----
 drivers/gpio/gpio-pxa.c         | 14 ++++----
 drivers/gpio/gpio-rc5t583.c     |  6 ++--
 drivers/gpio/gpio-rcar.c        | 12 +++----
 drivers/gpio/gpio-rdc321x.c     | 10 +++---
 drivers/gpio/gpio-reg.c         | 12 +++----
 drivers/gpio/gpio-sa1100.c      | 12 +++----
 drivers/gpio/gpio-sch.c         | 22 ++++++------
 drivers/gpio/gpio-sch311x.c     | 18 +++++-----
 drivers/gpio/gpio-spear-spics.c | 12 +++----
 drivers/gpio/gpio-sta2x11.c     | 14 ++++----
 drivers/gpio/gpio-stmpe.c       | 18 +++++-----
 drivers/gpio/gpio-stp-xway.c    |  6 ++--
 drivers/gpio/gpio-syscon.c      | 12 +++----
 drivers/gpio/gpio-tb10x.c       |  2 +-
 drivers/gpio/gpio-timberdale.c  | 16 ++++-----
 drivers/gpio/gpio-tpic2810.c    | 10 +++---
 drivers/gpio/gpio-tps65086.c    | 10 +++---
 drivers/gpio/gpio-tps65218.c    | 12 +++----
 drivers/gpio/gpio-tps6586x.c    |  8 ++---
 drivers/gpio/gpio-tps65910.c    |  8 ++---
 drivers/gpio/gpio-tps65912.c    | 10 +++---
 drivers/gpio/gpio-ts5500.c      | 10 +++---
 drivers/gpio/gpio-twl4030.c     | 20 +++++------
 drivers/gpio/gpio-twl6040.c     |  8 ++---
 drivers/gpio/gpio-ucb1400.c     |  8 ++---
 drivers/gpio/gpio-vf610.c       |  4 +--
 drivers/gpio/gpio-vr41xx.c      | 12 +++----
 drivers/gpio/gpio-wm831x.c      | 14 ++++----
 drivers/gpio/gpio-wm8350.c      | 10 +++---
 drivers/gpio/gpio-wm8994.c      | 12 +++----
 drivers/gpio/gpio-ws16c48.c     | 48 +++++++++++++-------------
 drivers/gpio/gpio-xlp.c         | 12 +++----
 drivers/gpio/gpio-xtensa.c      | 12 +++----
 drivers/gpio/gpio-zevio.c       | 22 ++++++------
 drivers/gpio/gpio-zx.c          | 10 +++---
 drivers/gpio/gpiolib-devres.c   | 16 ++++-----
 drivers/gpio/gpiolib-legacy.c   |  6 ++--
 drivers/gpio/gpiolib.c          | 26 +++++++-------
 100 files changed, 677 insertions(+), 677 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 1f7d9bbec0fc..96177512f07c 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -49,15 +49,15 @@ struct dio48e_gpio {
 	unsigned char out_state[6];
 	unsigned char control[2];
 	raw_spinlock_t lock;
-	unsigned base;
+	unsigned int base;
 	unsigned char irq_mask;
 };
 
-static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
 
 	if (dio48egpio->io_state[port] & mask)
 		return  GPIO_LINE_DIRECTION_IN;
@@ -65,14 +65,14 @@ static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned io_port = offset / 8;
+	const unsigned int io_port = offset / 8;
 	const unsigned int control_port = io_port / 3;
-	const unsigned control_addr = dio48egpio->base + 3 + control_port*4;
+	const unsigned int control_addr = dio48egpio->base + 3 + control_port*4;
 	unsigned long flags;
-	unsigned control;
+	unsigned int control;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
 
@@ -104,17 +104,17 @@ static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 	int value)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned io_port = offset / 8;
+	const unsigned int io_port = offset / 8;
 	const unsigned int control_port = io_port / 3;
-	const unsigned mask = BIT(offset % 8);
-	const unsigned control_addr = dio48egpio->base + 3 + control_port*4;
-	const unsigned out_port = (io_port > 2) ? io_port + 1 : io_port;
+	const unsigned int mask = BIT(offset % 8);
+	const unsigned int control_addr = dio48egpio->base + 3 + control_port*4;
+	const unsigned int out_port = (io_port > 2) ? io_port + 1 : io_port;
 	unsigned long flags;
-	unsigned control;
+	unsigned int control;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
 
@@ -154,14 +154,14 @@ static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static int dio48e_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int dio48e_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
-	const unsigned in_port = (port > 2) ? port + 1 : port;
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
+	const unsigned int in_port = (port > 2) ? port + 1 : port;
 	unsigned long flags;
-	unsigned port_state;
+	unsigned int port_state;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
 
@@ -202,12 +202,12 @@ static int dio48e_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	return 0;
 }
 
-static void dio48e_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void dio48e_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
-	const unsigned out_port = (port > 2) ? port + 1 : port;
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
+	const unsigned int out_port = (port > 2) ? port + 1 : port;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
@@ -306,7 +306,7 @@ static void dio48e_irq_unmask(struct irq_data *data)
 	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
 }
 
-static int dio48e_irq_set_type(struct irq_data *data, unsigned flow_type)
+static int dio48e_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	const unsigned long offset = irqd_to_hwirq(data);
 
diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index d350ac0de06b..dde49e2bf5a6 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -47,27 +47,27 @@ struct idi_48_gpio {
 	raw_spinlock_t lock;
 	spinlock_t ack_lock;
 	unsigned char irq_mask[6];
-	unsigned base;
+	unsigned int base;
 	unsigned char cos_enb;
 };
 
-static int idi_48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int idi_48_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int idi_48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int idi_48_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	return 0;
 }
 
-static int idi_48_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int idi_48_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
-	unsigned i;
+	unsigned int i;
 	static const unsigned int register_offset[6] = { 0, 1, 2, 4, 5, 6 };
-	unsigned base_offset;
-	unsigned mask;
+	unsigned int base_offset;
+	unsigned int mask;
 
 	for (i = 0; i < 48; i += 8)
 		if (offset < i + 8) {
@@ -112,10 +112,10 @@ static void idi_48_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
-	const unsigned offset = irqd_to_hwirq(data);
-	unsigned i;
-	unsigned mask;
-	unsigned boundary;
+	const unsigned int offset = irqd_to_hwirq(data);
+	unsigned int i;
+	unsigned int mask;
+	unsigned int boundary;
 	unsigned long flags;
 
 	for (i = 0; i < 48; i += 8)
@@ -144,11 +144,11 @@ static void idi_48_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
-	const unsigned offset = irqd_to_hwirq(data);
-	unsigned i;
-	unsigned mask;
-	unsigned boundary;
-	unsigned prev_irq_mask;
+	const unsigned int offset = irqd_to_hwirq(data);
+	unsigned int i;
+	unsigned int mask;
+	unsigned int boundary;
+	unsigned int prev_irq_mask;
 	unsigned long flags;
 
 	for (i = 0; i < 48; i += 8)
@@ -174,7 +174,7 @@ static void idi_48_irq_unmask(struct irq_data *data)
 		}
 }
 
-static int idi_48_irq_set_type(struct irq_data *data, unsigned flow_type)
+static int idi_48_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	/* The only valid irq types are none and both-edges */
 	if (flow_type != IRQ_TYPE_NONE &&
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 5752d9dab148..5eae01635fcf 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -44,11 +44,11 @@ struct idio_16_gpio {
 	struct gpio_chip chip;
 	raw_spinlock_t lock;
 	unsigned long irq_mask;
-	unsigned base;
-	unsigned out_state;
+	unsigned int base;
+	unsigned int out_state;
 };
 
-static int idio_16_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int idio_16_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	if (offset > 15)
 		return GPIO_LINE_DIRECTION_IN;
@@ -56,22 +56,22 @@ static int idio_16_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int idio_16_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int idio_16_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	return 0;
 }
 
 static int idio_16_gpio_direction_output(struct gpio_chip *chip,
-	unsigned offset, int value)
+	unsigned int offset, int value)
 {
 	chip->set(chip, offset, value);
 	return 0;
 }
 
-static int idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int idio_16_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
-	const unsigned mask = BIT(offset-16);
+	const unsigned int mask = BIT(offset-16);
 
 	if (offset < 16)
 		return -EINVAL;
@@ -96,10 +96,10 @@ static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
 	return 0;
 }
 
-static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void idio_16_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
-	const unsigned mask = BIT(offset);
+	const unsigned int mask = BIT(offset);
 	unsigned long flags;
 
 	if (offset > 15)
@@ -180,7 +180,7 @@ static void idio_16_irq_unmask(struct irq_data *data)
 	}
 }
 
-static int idio_16_irq_set_type(struct irq_data *data, unsigned flow_type)
+static int idio_16_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	/* The only valid irq types are none and both-edges */
 	if (flow_type != IRQ_TYPE_NONE &&
diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 05637d585152..4c6e8951847c 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -38,7 +38,7 @@ static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 			 chip->registers);
 }
 
-static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
+static int gen_74x164_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gen_74x164_chip *chip = gpiochip_get_data(gc);
 	u8 bank = chip->registers - 1 - offset / 8;
@@ -53,7 +53,7 @@ static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
 }
 
 static void gen_74x164_set_value(struct gpio_chip *gc,
-		unsigned offset, int val)
+		unsigned int offset, int val)
 {
 	struct gen_74x164_chip *chip = gpiochip_get_data(gc);
 	u8 bank = chip->registers - 1 - offset / 8;
@@ -91,7 +91,7 @@ static void gen_74x164_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 }
 
 static int gen_74x164_direction_output(struct gpio_chip *gc,
-		unsigned offset, int val)
+		unsigned int offset, int val)
 {
 	gen_74x164_set_value(gc, offset, val);
 	return 0;
diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 173e06758e6c..8876bc2be7a5 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -17,7 +17,7 @@
 
 struct mmio_74xx_gpio_priv {
 	struct gpio_chip	gc;
-	unsigned		flags;
+	unsigned int		flags;
 };
 
 static const struct of_device_id mmio_74xx_gpio_ids[] = {
@@ -73,7 +73,7 @@ static const struct of_device_id mmio_74xx_gpio_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mmio_74xx_gpio_ids);
 
-static int mmio_74xx_get_direction(struct gpio_chip *gc, unsigned offset)
+static int mmio_74xx_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index b9fcaab2a931..41a2b9b38676 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -33,7 +33,7 @@ struct adnp {
 	u8 *irq_low;
 };
 
-static int adnp_read(struct adnp *adnp, unsigned offset, uint8_t *value)
+static int adnp_read(struct adnp *adnp, unsigned int offset, uint8_t *value)
 {
 	int err;
 
@@ -48,7 +48,7 @@ static int adnp_read(struct adnp *adnp, unsigned offset, uint8_t *value)
 	return 0;
 }
 
-static int adnp_write(struct adnp *adnp, unsigned offset, uint8_t value)
+static int adnp_write(struct adnp *adnp, unsigned int offset, uint8_t value)
 {
 	int err;
 
@@ -62,7 +62,7 @@ static int adnp_write(struct adnp *adnp, unsigned offset, uint8_t value)
 	return 0;
 }
 
-static int adnp_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int adnp_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct adnp *adnp = gpiochip_get_data(chip);
 	unsigned int reg = offset >> adnp->reg_shift;
@@ -77,7 +77,7 @@ static int adnp_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (value & BIT(pos)) ? 1 : 0;
 }
 
-static void __adnp_gpio_set(struct adnp *adnp, unsigned offset, int value)
+static void __adnp_gpio_set(struct adnp *adnp, unsigned int offset, int value)
 {
 	unsigned int reg = offset >> adnp->reg_shift;
 	unsigned int pos = offset & 7;
@@ -96,7 +96,7 @@ static void __adnp_gpio_set(struct adnp *adnp, unsigned offset, int value)
 	adnp_write(adnp, GPIO_PLR(adnp) + reg, val);
 }
 
-static void adnp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void adnp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct adnp *adnp = gpiochip_get_data(chip);
 
@@ -105,7 +105,7 @@ static void adnp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	mutex_unlock(&adnp->i2c_lock);
 }
 
-static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct adnp *adnp = gpiochip_get_data(chip);
 	unsigned int reg = offset >> adnp->reg_shift;
@@ -141,7 +141,7 @@ static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return err;
 }
 
-static int adnp_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+static int adnp_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				      int value)
 {
 	struct adnp *adnp = gpiochip_get_data(chip);
diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
index 0386ede53f3a..c1ccf7f31c88 100644
--- a/drivers/gpio/gpio-adp5520.c
+++ b/drivers/gpio/gpio-adp5520.c
@@ -20,7 +20,7 @@ struct adp5520_gpio {
 	unsigned long output;
 };
 
-static int adp5520_gpio_get_value(struct gpio_chip *chip, unsigned off)
+static int adp5520_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5520_gpio *dev;
 	uint8_t reg_val;
@@ -41,7 +41,7 @@ static int adp5520_gpio_get_value(struct gpio_chip *chip, unsigned off)
 }
 
 static void adp5520_gpio_set_value(struct gpio_chip *chip,
-		unsigned off, int val)
+		unsigned int off, int val)
 {
 	struct adp5520_gpio *dev;
 	dev = gpiochip_get_data(chip);
@@ -52,7 +52,7 @@ static void adp5520_gpio_set_value(struct gpio_chip *chip,
 		adp5520_clr_bits(dev->master, ADP5520_GPIO_OUT, dev->lut[off]);
 }
 
-static int adp5520_gpio_direction_input(struct gpio_chip *chip, unsigned off)
+static int adp5520_gpio_direction_input(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5520_gpio *dev;
 	dev = gpiochip_get_data(chip);
@@ -64,7 +64,7 @@ static int adp5520_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 }
 
 static int adp5520_gpio_direction_output(struct gpio_chip *chip,
-		unsigned off, int val)
+		unsigned int off, int val)
 {
 	struct adp5520_gpio *dev;
 	int ret = 0;
diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index 49f423d7beba..6e1656f7f0b6 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -62,11 +62,11 @@ static int adp5588_gpio_write(struct i2c_client *client, u8 reg, u8 val)
 	return ret;
 }
 
-static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
+static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5588_gpio *dev = gpiochip_get_data(chip);
-	unsigned bank = ADP5588_BANK(off);
-	unsigned bit = ADP5588_BIT(off);
+	unsigned int bank = ADP5588_BANK(off);
+	unsigned int bit = ADP5588_BIT(off);
 	int val;
 
 	mutex_lock(&dev->lock);
@@ -82,9 +82,9 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
 }
 
 static void adp5588_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+				   unsigned int off, int val)
 {
-	unsigned bank, bit;
+	unsigned int bank, bit;
 	struct adp5588_gpio *dev = gpiochip_get_data(chip);
 
 	bank = ADP5588_BANK(off);
@@ -101,10 +101,10 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	mutex_unlock(&dev->lock);
 }
 
-static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
+static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned int off)
 {
 	int ret;
-	unsigned bank;
+	unsigned int bank;
 	struct adp5588_gpio *dev = gpiochip_get_data(chip);
 
 	bank = ADP5588_BANK(off);
@@ -118,10 +118,10 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 }
 
 static int adp5588_gpio_direction_output(struct gpio_chip *chip,
-					 unsigned off, int val)
+					 unsigned int off, int val)
 {
 	int ret;
-	unsigned bank, bit;
+	unsigned int bank, bit;
 	struct adp5588_gpio *dev = gpiochip_get_data(chip);
 
 	bank = ADP5588_BANK(off);
@@ -209,7 +209,7 @@ static int adp5588_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct adp5588_gpio *dev = gpiochip_get_data(gc);
 	uint16_t gpio = d->hwirq;
-	unsigned bank, bit;
+	unsigned int bank, bit;
 
 	bank = ADP5588_BANK(gpio);
 	bit = ADP5588_BIT(gpio);
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index cc4ba71e4fe3..540d4d3f63a2 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -102,7 +102,7 @@ static unsigned int altera_gpio_irq_startup(struct irq_data *d)
 	return 0;
 }
 
-static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int altera_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct of_mm_gpio_chip *mm_gc;
 
@@ -111,7 +111,7 @@ static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(readl(mm_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));
 }
 
-static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static void altera_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct of_mm_gpio_chip *mm_gc;
 	struct altera_gpio_chip *chip;
@@ -131,7 +131,7 @@ static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
-static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct of_mm_gpio_chip *mm_gc;
 	struct altera_gpio_chip *chip;
@@ -152,7 +152,7 @@ static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 }
 
 static int altera_gpio_direction_output(struct gpio_chip *gc,
-		unsigned offset, int value)
+		unsigned int offset, int value)
 {
 	struct of_mm_gpio_chip *mm_gc;
 	struct altera_gpio_chip *chip;
diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index fdcebe59510d..35c83c95349b 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -76,7 +76,7 @@ struct amd_gpio {
 	u8			orig[32];
 };
 
-static int amd_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int amd_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct amd_gpio *agp = gpiochip_get_data(chip);
 
@@ -88,7 +88,7 @@ static int amd_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void amd_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void amd_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct amd_gpio *agp = gpiochip_get_data(chip);
 
@@ -97,7 +97,7 @@ static void amd_gpio_free(struct gpio_chip *chip, unsigned offset)
 	iowrite8(agp->orig[offset], agp->pm + AMD_REG_GPIO(offset));
 }
 
-static void amd_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void amd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
@@ -112,7 +112,7 @@ static void amd_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	dev_dbg(&agp->pdev->dev, "Setting gpio %d, value %d, reg=%02x\n", offset, !!value, temp);
 }
 
-static int amd_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int amd_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
@@ -124,7 +124,7 @@ static int amd_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (temp & AMD_GPIO_RTIN) ? 1 : 0;
 }
 
-static int amd_gpio_dirout(struct gpio_chip *chip, unsigned offset, int value)
+static int amd_gpio_dirout(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
@@ -141,7 +141,7 @@ static int amd_gpio_dirout(struct gpio_chip *chip, unsigned offset, int value)
 	return 0;
 }
 
-static int amd_gpio_dirin(struct gpio_chip *chip, unsigned offset)
+static int amd_gpio_dirin(struct gpio_chip *chip, unsigned int offset)
 {
 	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 44398992ae15..958a9e27ec3d 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -27,7 +27,7 @@ struct pt_gpio_chip {
 	void __iomem             *reg_base;
 };
 
-static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
+static int pt_gpio_request(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -52,7 +52,7 @@ static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
+static void pt_gpio_free(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	unsigned long flags;
diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 5bda38e0780f..8ab4273b7dfe 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -24,7 +24,7 @@ struct arizona_gpio {
 	struct gpio_chip gpio_chip;
 };
 
-static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
@@ -47,7 +47,7 @@ static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int arizona_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
@@ -94,7 +94,7 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 }
 
 static int arizona_gpio_direction_out(struct gpio_chip *chip,
-				     unsigned offset, int value)
+				     unsigned int offset, int value)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
@@ -122,7 +122,7 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
 				  ARIZONA_GPN_DIR | ARIZONA_GPN_LVL, value);
 }
 
-static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void arizona_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 879db23d8454..576e069f9d22 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -692,7 +692,7 @@ static void aspeed_init_irq_valid_mask(struct gpio_chip *gc,
 
 	while (!is_bank_props_sentinel(props)) {
 		unsigned int offset;
-		const unsigned long int input = props->input;
+		const unsigned long input = props->input;
 
 		/* Pretty crummy approach, but similar to GPIO core */
 		for_each_clear_bit(offset, &input, 32) {
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 53fae02c40ad..33567fb8a5c7 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -40,19 +40,19 @@ static struct ath79_gpio_ctrl *irq_data_to_ath79_gpio(struct irq_data *data)
 	return container_of(gc, struct ath79_gpio_ctrl, gc);
 }
 
-static u32 ath79_gpio_read(struct ath79_gpio_ctrl *ctrl, unsigned reg)
+static u32 ath79_gpio_read(struct ath79_gpio_ctrl *ctrl, unsigned int reg)
 {
 	return readl(ctrl->base + reg);
 }
 
 static void ath79_gpio_write(struct ath79_gpio_ctrl *ctrl,
-			unsigned reg, u32 val)
+			unsigned int reg, u32 val)
 {
 	writel(val, ctrl->base + reg);
 }
 
 static bool ath79_gpio_update_bits(
-	struct ath79_gpio_ctrl *ctrl, unsigned reg, u32 mask, u32 bits)
+	struct ath79_gpio_ctrl *ctrl, unsigned int reg, u32 mask, u32 bits)
 {
 	u32 old_val, new_val;
 
diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index cf3687a7925f..19446c0892be 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -88,7 +88,7 @@ static inline void bcm_kona_gpio_write_lock_regs(void __iomem *reg_base,
 }
 
 static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
-					unsigned gpio)
+					unsigned int gpio)
 {
 	u32 val;
 	unsigned long flags;
@@ -104,7 +104,7 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 }
 
 static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
-					unsigned gpio)
+					unsigned int gpio)
 {
 	u32 val;
 	unsigned long flags;
@@ -119,7 +119,7 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
-static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
+static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct bcm_kona_gpio *kona_gpio = gpiochip_get_data(chip);
 	void __iomem *reg_base = kona_gpio->reg_base;
@@ -129,7 +129,7 @@ static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
 	return val ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
-static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
@@ -156,7 +156,7 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
-static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
+static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
@@ -183,7 +183,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & BIT(bit));
 }
 
-static int bcm_kona_gpio_request(struct gpio_chip *chip, unsigned gpio)
+static int bcm_kona_gpio_request(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct bcm_kona_gpio *kona_gpio = gpiochip_get_data(chip);
 
@@ -191,14 +191,14 @@ static int bcm_kona_gpio_request(struct gpio_chip *chip, unsigned gpio)
 	return 0;
 }
 
-static void bcm_kona_gpio_free(struct gpio_chip *chip, unsigned gpio)
+static void bcm_kona_gpio_free(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct bcm_kona_gpio *kona_gpio = gpiochip_get_data(chip);
 
 	bcm_kona_gpio_lock_gpio(kona_gpio, gpio);
 }
 
-static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
@@ -220,7 +220,7 @@ static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 }
 
 static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
-					  unsigned gpio, int value)
+					  unsigned int gpio, int value)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
@@ -248,7 +248,7 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int bcm_kona_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
+static int bcm_kona_gpio_to_irq(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct bcm_kona_gpio *kona_gpio;
 
@@ -258,8 +258,8 @@ static int bcm_kona_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 	return irq_create_mapping(kona_gpio->irq_domain, gpio);
 }
 
-static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
-				      unsigned debounce)
+static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned int gpio,
+				      unsigned int debounce)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
@@ -307,7 +307,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	return 0;
 }
 
-static int bcm_kona_gpio_set_config(struct gpio_chip *chip, unsigned gpio,
+static int bcm_kona_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
 				    unsigned long config)
 {
 	u32 debounce;
@@ -338,7 +338,7 @@ static void bcm_kona_gpio_irq_ack(struct irq_data *d)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
-	unsigned gpio = d->hwirq;
+	unsigned int gpio = d->hwirq;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
@@ -359,7 +359,7 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
-	unsigned gpio = d->hwirq;
+	unsigned int gpio = d->hwirq;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
@@ -381,7 +381,7 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
-	unsigned gpio = d->hwirq;
+	unsigned int gpio = d->hwirq;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
@@ -403,7 +403,7 @@ static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
-	unsigned gpio = d->hwirq;
+	unsigned int gpio = d->hwirq;
 	u32 lvl_type;
 	u32 val;
 	unsigned long flags;
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index fcfc1a1f1a5c..2c63d149fad4 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -124,7 +124,7 @@ static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
-static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct brcmstb_gpio_priv *priv = brcmstb_gpio_gc_to_priv(gc);
 	/* gc_offset is relative to this gpio_chip; want real offset */
diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index a6f30ad6750f..8e0aece1541e 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -66,7 +66,7 @@ module_param_named(gpiobase, modparam_gpiobase, int, 0444);
 MODULE_PARM_DESC(gpiobase, "The GPIO number base. -1 means dynamic, which is the default.");
 
 
-static int bt8xxgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int bt8xxgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	unsigned long flags;
@@ -87,7 +87,7 @@ static int bt8xxgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	return 0;
 }
 
-static int bt8xxgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
+static int bt8xxgpio_gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	unsigned long flags;
@@ -101,7 +101,7 @@ static int bt8xxgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
 }
 
 static int bt8xxgpio_gpio_direction_output(struct gpio_chip *gpio,
-					unsigned nr, int val)
+					unsigned int nr, int val)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	unsigned long flags;
@@ -126,7 +126,7 @@ static int bt8xxgpio_gpio_direction_output(struct gpio_chip *gpio,
 }
 
 static void bt8xxgpio_gpio_set(struct gpio_chip *gpio,
-			    unsigned nr, int val)
+			    unsigned int nr, int val)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	unsigned long flags;
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 14d1f4c933b6..9391722ec107 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -129,7 +129,7 @@ static void crystalcove_update_irq_ctrl(struct crystalcove_gpio *cg, int gpio)
 	regmap_update_bits(cg->regmap, reg, CTLI_INTCNT_BE, cg->intcnt_value);
 }
 
-static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned gpio)
+static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
@@ -140,7 +140,7 @@ static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned gpio)
 	return regmap_write(cg->regmap, reg, CTLO_INPUT_SET);
 }
 
-static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned gpio,
+static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
 				    int value)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
@@ -152,7 +152,7 @@ static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned gpio,
 	return regmap_write(cg->regmap, reg, CTLO_OUTPUT_SET | value);
 }
 
-static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned gpio)
+static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	unsigned int val;
@@ -169,7 +169,7 @@ static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned gpio)
 }
 
 static void crystalcove_gpio_set(struct gpio_chip *chip,
-				 unsigned gpio, int value)
+				 unsigned int gpio, int value)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
@@ -183,7 +183,7 @@ static void crystalcove_gpio_set(struct gpio_chip *chip,
 		regmap_update_bits(cg->regmap, reg, 1, 0);
 }
 
-static int crystalcove_irq_type(struct irq_data *data, unsigned type)
+static int crystalcove_irq_type(struct irq_data *data, unsigned int type)
 {
 	struct crystalcove_gpio *cg =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 53b24e3ae7de..63dfeb4e89cb 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -80,7 +80,7 @@ static void errata_outl(struct cs5535_gpio_chip *chip, u32 val,
 	outl(val, addr);
 }
 
-static void __cs5535_gpio_set(struct cs5535_gpio_chip *chip, unsigned offset,
+static void __cs5535_gpio_set(struct cs5535_gpio_chip *chip, unsigned int offset,
 		unsigned int reg)
 {
 	if (offset < 16)
@@ -91,7 +91,7 @@ static void __cs5535_gpio_set(struct cs5535_gpio_chip *chip, unsigned offset,
 		errata_outl(chip, 1 << (offset - 16), reg);
 }
 
-void cs5535_gpio_set(unsigned offset, unsigned int reg)
+void cs5535_gpio_set(unsigned int offset, unsigned int reg)
 {
 	struct cs5535_gpio_chip *chip = &cs5535_gpio_chip;
 	unsigned long flags;
@@ -102,7 +102,7 @@ void cs5535_gpio_set(unsigned offset, unsigned int reg)
 }
 EXPORT_SYMBOL_GPL(cs5535_gpio_set);
 
-static void __cs5535_gpio_clear(struct cs5535_gpio_chip *chip, unsigned offset,
+static void __cs5535_gpio_clear(struct cs5535_gpio_chip *chip, unsigned int offset,
 		unsigned int reg)
 {
 	if (offset < 16)
@@ -113,7 +113,7 @@ static void __cs5535_gpio_clear(struct cs5535_gpio_chip *chip, unsigned offset,
 		errata_outl(chip, 1 << offset, reg);
 }
 
-void cs5535_gpio_clear(unsigned offset, unsigned int reg)
+void cs5535_gpio_clear(unsigned int offset, unsigned int reg)
 {
 	struct cs5535_gpio_chip *chip = &cs5535_gpio_chip;
 	unsigned long flags;
@@ -124,7 +124,7 @@ void cs5535_gpio_clear(unsigned offset, unsigned int reg)
 }
 EXPORT_SYMBOL_GPL(cs5535_gpio_clear);
 
-int cs5535_gpio_isset(unsigned offset, unsigned int reg)
+int cs5535_gpio_isset(unsigned int offset, unsigned int reg)
 {
 	struct cs5535_gpio_chip *chip = &cs5535_gpio_chip;
 	unsigned long flags;
@@ -145,7 +145,7 @@ int cs5535_gpio_isset(unsigned offset, unsigned int reg)
 }
 EXPORT_SYMBOL_GPL(cs5535_gpio_isset);
 
-int cs5535_gpio_set_irq(unsigned group, unsigned irq)
+int cs5535_gpio_set_irq(unsigned int group, unsigned int irq)
 {
 	uint32_t lo, hi;
 
@@ -162,7 +162,7 @@ int cs5535_gpio_set_irq(unsigned group, unsigned irq)
 }
 EXPORT_SYMBOL_GPL(cs5535_gpio_set_irq);
 
-void cs5535_gpio_setup_event(unsigned offset, int pair, int pme)
+void cs5535_gpio_setup_event(unsigned int offset, int pair, int pme)
 {
 	struct cs5535_gpio_chip *chip = &cs5535_gpio_chip;
 	uint32_t shift = (offset % 8) * 4;
@@ -200,7 +200,7 @@ EXPORT_SYMBOL_GPL(cs5535_gpio_setup_event);
  * Generic gpio_chip API support.
  */
 
-static int chip_gpio_request(struct gpio_chip *c, unsigned offset)
+static int chip_gpio_request(struct gpio_chip *c, unsigned int offset)
 {
 	struct cs5535_gpio_chip *chip = gpiochip_get_data(c);
 	unsigned long flags;
@@ -227,12 +227,12 @@ static int chip_gpio_request(struct gpio_chip *c, unsigned offset)
 	return 0;
 }
 
-static int chip_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int chip_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	return cs5535_gpio_isset(offset, GPIO_READ_BACK);
 }
 
-static void chip_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static void chip_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	if (val)
 		cs5535_gpio_set(offset, GPIO_OUTPUT_VAL);
@@ -240,7 +240,7 @@ static void chip_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 		cs5535_gpio_clear(offset, GPIO_OUTPUT_VAL);
 }
 
-static int chip_direction_input(struct gpio_chip *c, unsigned offset)
+static int chip_direction_input(struct gpio_chip *c, unsigned int offset)
 {
 	struct cs5535_gpio_chip *chip = gpiochip_get_data(c);
 	unsigned long flags;
@@ -253,7 +253,7 @@ static int chip_direction_input(struct gpio_chip *c, unsigned offset)
 	return 0;
 }
 
-static int chip_direction_output(struct gpio_chip *c, unsigned offset, int val)
+static int chip_direction_output(struct gpio_chip *c, unsigned int offset, int val)
 {
 	struct cs5535_gpio_chip *chip = gpiochip_get_data(c);
 	unsigned long flags;
diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
index 9aa59afdcbbf..d3e77075402b 100644
--- a/drivers/gpio/gpio-da9052.c
+++ b/drivers/gpio/gpio-da9052.c
@@ -46,12 +46,12 @@ struct da9052_gpio {
 	struct gpio_chip gp;
 };
 
-static unsigned char da9052_gpio_port_odd(unsigned offset)
+static unsigned char da9052_gpio_port_odd(unsigned int offset)
 {
 	return offset % 2;
 }
 
-static int da9052_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int da9052_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	int da9052_port_direction = 0;
@@ -90,7 +90,7 @@ static int da9052_gpio_get(struct gpio_chip *gc, unsigned offset)
 	}
 }
 
-static void da9052_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static void da9052_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	int ret;
@@ -116,7 +116,7 @@ static void da9052_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	}
 }
 
-static int da9052_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+static int da9052_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	unsigned char register_value;
@@ -142,7 +142,7 @@ static int da9052_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 }
 
 static int da9052_gpio_direction_output(struct gpio_chip *gc,
-					unsigned offset, int value)
+					unsigned int offset, int value)
 {
 	struct da9052_gpio *gpio = gpiochip_get_data(gc);
 	unsigned char register_value;
diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 6ad0c37b862e..531f3babf341 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -30,7 +30,7 @@ struct da9055_gpio {
 	struct gpio_chip gp;
 };
 
-static int da9055_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int da9055_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 	int gpio_direction = 0;
@@ -59,7 +59,7 @@ static int da9055_gpio_get(struct gpio_chip *gc, unsigned offset)
 
 }
 
-static void da9055_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static void da9055_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 
@@ -69,7 +69,7 @@ static void da9055_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 			value << offset);
 }
 
-static int da9055_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+static int da9055_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 	unsigned char reg_byte;
@@ -85,7 +85,7 @@ static int da9055_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 }
 
 static int da9055_gpio_direction_output(struct gpio_chip *gc,
-					unsigned offset, int value)
+					unsigned int offset, int value)
 {
 	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 	unsigned char reg_byte;
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 085b874db2a9..4c1cdfc07a92 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -64,7 +64,7 @@ struct davinci_gpio_controller {
 	int			irqs[MAX_INT_PER_BANK];
 };
 
-static inline u32 __gpio_mask(unsigned gpio)
+static inline u32 __gpio_mask(unsigned int gpio)
 {
 	return 1 << (gpio % 32);
 }
@@ -84,7 +84,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev);
 
 /* board setup code *MUST* setup pinmux and enable the GPIO clock. */
 static inline int __davinci_direction(struct gpio_chip *chip,
-			unsigned offset, bool out, int value)
+			unsigned int offset, bool out, int value)
 {
 	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 	struct davinci_gpio_regs __iomem *g;
@@ -108,13 +108,13 @@ static inline int __davinci_direction(struct gpio_chip *chip,
 	return 0;
 }
 
-static int davinci_direction_in(struct gpio_chip *chip, unsigned offset)
+static int davinci_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
 	return __davinci_direction(chip, offset, false, 0);
 }
 
 static int
-davinci_direction_out(struct gpio_chip *chip, unsigned offset, int value)
+davinci_direction_out(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	return __davinci_direction(chip, offset, true, value);
 }
@@ -126,7 +126,7 @@ davinci_direction_out(struct gpio_chip *chip, unsigned offset, int value)
  * Note that changes are synched to the GPIO clock, so reading values back
  * right after you've set them may give old values.
  */
-static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int davinci_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 	struct davinci_gpio_regs __iomem *g;
@@ -141,7 +141,7 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
  * Assuming the pin is muxed as a gpio output, set its output value.
  */
 static void
-davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+davinci_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 	struct davinci_gpio_regs __iomem *g;
@@ -305,7 +305,7 @@ static void gpio_irq_enable(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g = irq2regs(d);
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
-	unsigned status = irqd_get_trigger_type(d);
+	unsigned int status = irqd_get_trigger_type(d);
 
 	status &= IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
 	if (!status)
@@ -317,7 +317,7 @@ static void gpio_irq_enable(struct irq_data *d)
 		writel_relaxed(mask, &g->set_rising);
 }
 
-static int gpio_irq_type(struct irq_data *d, unsigned trigger)
+static int gpio_irq_type(struct irq_data *d, unsigned int trigger)
 {
 	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
 		return -EINVAL;
@@ -381,7 +381,7 @@ static void gpio_irq_handler(struct irq_desc *desc)
 	/* now it may re-trigger */
 }
 
-static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
+static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned int offset)
 {
 	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 
@@ -391,7 +391,7 @@ static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
 		return -ENXIO;
 }
 
-static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
+static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned int offset)
 {
 	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 
@@ -405,7 +405,7 @@ static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
 		return -ENODEV;
 }
 
-static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
+static int gpio_irq_type_unbanked(struct irq_data *data, unsigned int trigger)
 {
 	struct davinci_gpio_controller *d;
 	struct davinci_gpio_regs __iomem *g;
@@ -484,12 +484,12 @@ static const struct of_device_id davinci_gpio_ids[];
 
 static int davinci_gpio_irq_setup(struct platform_device *pdev)
 {
-	unsigned	gpio, bank;
+	unsigned int	gpio, bank;
 	int		irq;
 	int		ret;
 	struct clk	*clk;
 	u32		binten = 0;
-	unsigned	ngpio;
+	unsigned int	ngpio;
 	struct device *dev = &pdev->dev;
 	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
 	struct davinci_gpio_platform_data *pdata = dev->platform_data;
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 26b40c8b8a12..1e8dbf76b3ed 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -85,7 +85,7 @@ static int dln2_gpio_get_pin_count(struct platform_device *pdev)
 	return le16_to_cpu(count);
 }
 
-static int dln2_gpio_pin_cmd(struct dln2_gpio *dln2, int cmd, unsigned pin)
+static int dln2_gpio_pin_cmd(struct dln2_gpio *dln2, int cmd, unsigned int pin)
 {
 	struct dln2_gpio_pin req = {
 		.pin = cpu_to_le16(pin),
@@ -147,7 +147,7 @@ static int dln2_gpio_pin_set_out_val(struct dln2_gpio *dln2,
 #define DLN2_GPIO_DIRECTION_IN		0
 #define DLN2_GPIO_DIRECTION_OUT		1
 
-static int dln2_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int dln2_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 	struct dln2_gpio_pin req = {
@@ -188,14 +188,14 @@ static int dln2_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static void dln2_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void dln2_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
 	dln2_gpio_pin_cmd(dln2, DLN2_GPIO_PIN_DISABLE, offset);
 }
 
-static int dln2_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int dln2_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
@@ -220,15 +220,15 @@ static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return dln2_gpio_pin_get_out_val(dln2, offset);
 }
 
-static void dln2_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void dln2_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
 	dln2_gpio_pin_set_out_val(dln2, offset, value);
 }
 
-static int dln2_gpio_set_direction(struct gpio_chip *chip, unsigned offset,
-				   unsigned dir)
+static int dln2_gpio_set_direction(struct gpio_chip *chip, unsigned int offset,
+				   unsigned int dir)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 	struct dln2_gpio_pin_val req = {
@@ -250,12 +250,12 @@ static int dln2_gpio_set_direction(struct gpio_chip *chip, unsigned offset,
 	return ret;
 }
 
-static int dln2_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int dln2_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	return dln2_gpio_set_direction(chip, offset, DLN2_GPIO_DIRECTION_IN);
 }
 
-static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				      int value)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
@@ -268,7 +268,7 @@ static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return dln2_gpio_set_direction(chip, offset, DLN2_GPIO_DIRECTION_OUT);
 }
 
-static int dln2_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+static int dln2_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				unsigned long config)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
@@ -282,8 +282,8 @@ static int dln2_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				&duration, sizeof(duration));
 }
 
-static int dln2_gpio_set_event_cfg(struct dln2_gpio *dln2, unsigned pin,
-				   unsigned type, unsigned period)
+static int dln2_gpio_set_event_cfg(struct dln2_gpio *dln2, unsigned int pin,
+				   unsigned int type, unsigned int period)
 {
 	struct {
 		__le16 pin;
@@ -317,7 +317,7 @@ static void dln2_irq_mask(struct irq_data *irqd)
 	clear_bit(pin, dln2->unmasked_irqs);
 }
 
-static int dln2_irq_set_type(struct irq_data *irqd, unsigned type)
+static int dln2_irq_set_type(struct irq_data *irqd, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct dln2_gpio *dln2 = gpiochip_get_data(gc);
@@ -360,7 +360,7 @@ static void dln2_irq_bus_unlock(struct irq_data *irqd)
 	struct dln2_gpio *dln2 = gpiochip_get_data(gc);
 	int pin = irqd_to_hwirq(irqd);
 	int enabled, unmasked;
-	unsigned type;
+	unsigned int type;
 	int ret;
 
 	enabled = test_bit(pin, dln2->enabled_irqs);
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 1d8d55bd63aa..dfcc27a6a02b 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -147,7 +147,7 @@ static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
 	gc->write_reg(reg_base + gpio_reg_convert(gpio, offset), val);
 }
 
-static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct dwapb_gpio_port *port = gpiochip_get_data(gc);
 	struct dwapb_gpio *gpio = port->gpio;
@@ -316,7 +316,7 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 #endif
 
 static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
-				   unsigned offset, unsigned debounce)
+				   unsigned int offset, unsigned int debounce)
 {
 	struct dwapb_gpio_port *port = gpiochip_get_data(gc);
 	struct dwapb_gpio *gpio = port->gpio;
@@ -337,7 +337,7 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 	return 0;
 }
 
-static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned offset,
+static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				 unsigned long config)
 {
 	u32 debounce;
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 17a243c528ad..a134b0d3c957 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -185,26 +185,26 @@ static inline struct em_gio_priv *gpio_to_priv(struct gpio_chip *chip)
 	return gpiochip_get_data(chip);
 }
 
-static int em_gio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int em_gio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	em_gio_write(gpio_to_priv(chip), GIO_E0, BIT(offset));
 	return 0;
 }
 
-static int em_gio_get(struct gpio_chip *chip, unsigned offset)
+static int em_gio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	return !!(em_gio_read(gpio_to_priv(chip), GIO_I) & BIT(offset));
 }
 
 static void __em_gio_set(struct gpio_chip *chip, unsigned int reg,
-			 unsigned shift, int value)
+			 unsigned int shift, int value)
 {
 	/* upper 16 bits contains mask and lower 16 actual value */
 	em_gio_write(gpio_to_priv(chip), reg,
 		     (BIT(shift + 16)) | (value << shift));
 }
 
-static void em_gio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void em_gio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	/* output is split into two registers */
 	if (offset < 16)
@@ -213,7 +213,7 @@ static void em_gio_set(struct gpio_chip *chip, unsigned offset, int value)
 		__em_gio_set(chip, GIO_OH, offset - 16, value);
 }
 
-static int em_gio_direction_output(struct gpio_chip *chip, unsigned offset,
+static int em_gio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				   int value)
 {
 	/* write GPIO value to output before selecting output mode of pin */
@@ -222,17 +222,17 @@ static int em_gio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static int em_gio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int em_gio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	return irq_create_mapping(gpio_to_priv(chip)->irq_domain, offset);
 }
 
-static int em_gio_request(struct gpio_chip *chip, unsigned offset)
+static int em_gio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	return pinctrl_gpio_request(chip->base + offset);
 }
 
-static void em_gio_free(struct gpio_chip *chip, unsigned offset)
+static void em_gio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	pinctrl_gpio_free(chip->base + offset);
 
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 226da8df6f10..acf44c880042 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -55,7 +55,7 @@ static const u8 eoi_register_offset[3]		= { 0x98, 0xb4, 0x54 };
 static const u8 int_en_register_offset[3]	= { 0x9c, 0xb8, 0x58 };
 static const u8 int_debounce_register_offset[3]	= { 0xa8, 0xc4, 0x64 };
 
-static void ep93xx_gpio_update_int_params(struct ep93xx_gpio *epg, unsigned port)
+static void ep93xx_gpio_update_int_params(struct ep93xx_gpio *epg, unsigned int port)
 {
 	BUG_ON(port > 2);
 
@@ -307,7 +307,7 @@ static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
 };
 
-static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
+static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				  unsigned long config)
 {
 	u32 debounce;
@@ -321,7 +321,7 @@ static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
+static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	return EP93XX_GPIO_F_IRQ_BASE + offset;
 }
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 18a3147f5a42..1d5171d52fc3 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -137,13 +137,13 @@ static inline void superio_exit(int base)
  * GPIO chip.
  */
 
-static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset);
-static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset);
-static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset);
+static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned int offset);
+static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned int offset);
+static int f7188x_gpio_get(struct gpio_chip *chip, unsigned int offset);
 static int f7188x_gpio_direction_out(struct gpio_chip *chip,
-				     unsigned offset, int value);
-static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
-static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+				     unsigned int offset, int value);
+static void f7188x_gpio_set(struct gpio_chip *chip, unsigned int offset, int value);
+static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				  unsigned long config);
 
 #define F7188X_GPIO_BANK(_base, _ngpio, _regbase)			\
@@ -254,7 +254,7 @@ static struct f7188x_gpio_bank f81865_gpio_bank[] = {
 	F7188X_GPIO_BANK(60, 5, 0x90),
 };
 
-static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	int err;
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
@@ -276,7 +276,7 @@ static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
 	int err;
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
@@ -297,7 +297,7 @@ static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int f7188x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	int err;
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
@@ -322,7 +322,7 @@ static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset)
 }
 
 static int f7188x_gpio_direction_out(struct gpio_chip *chip,
-				     unsigned offset, int value)
+				     unsigned int offset, int value)
 {
 	int err;
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
@@ -350,7 +350,7 @@ static int f7188x_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
-static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void f7188x_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	int err;
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
@@ -372,7 +372,7 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	superio_exit(sio->addr);
 }
 
-static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				  unsigned long config)
 {
 	int err;
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index f954359c9544..b57aad4184d9 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -99,7 +99,7 @@ static void grgpio_set_imask(struct grgpio_priv *priv, unsigned int offset,
 	gc->write_reg(priv->regs + GRGPIO_IMASK, priv->imask);
 }
 
-static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int grgpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct grgpio_priv *priv = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
index 242112ff60ee..06e80aa30681 100644
--- a/drivers/gpio/gpio-gw-pld.c
+++ b/drivers/gpio/gpio-gw-pld.c
@@ -32,7 +32,7 @@ struct gw_pld {
  * Writing a "one" bit (to match the reset state) lets that pin be used as an
  * input. It is an open-drain model.
  */
-static int gw_pld_input8(struct gpio_chip *gc, unsigned offset)
+static int gw_pld_input8(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gw_pld *gw = gpiochip_get_data(gc);
 
@@ -40,7 +40,7 @@ static int gw_pld_input8(struct gpio_chip *gc, unsigned offset)
 	return i2c_smbus_write_byte(gw->client, gw->out);
 }
 
-static int gw_pld_get8(struct gpio_chip *gc, unsigned offset)
+static int gw_pld_get8(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gw_pld *gw = gpiochip_get_data(gc);
 	s32 val;
@@ -50,7 +50,7 @@ static int gw_pld_get8(struct gpio_chip *gc, unsigned offset)
 	return (val < 0) ? 0 : !!(val & BIT(offset));
 }
 
-static int gw_pld_output8(struct gpio_chip *gc, unsigned offset, int value)
+static int gw_pld_output8(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gw_pld *gw = gpiochip_get_data(gc);
 
@@ -62,7 +62,7 @@ static int gw_pld_output8(struct gpio_chip *gc, unsigned offset, int value)
 	return i2c_smbus_write_byte(gw->client, gw->out);
 }
 
-static void gw_pld_set8(struct gpio_chip *gc, unsigned offset, int value)
+static void gw_pld_set8(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	gw_pld_output8(gc, offset, value);
 }
diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index a40bd56673fe..e659dea6e016 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -132,11 +132,11 @@ static inline int egpio_bit(struct egpio_info *ei, int bit)
  * Input pins
  */
 
-static int egpio_get(struct gpio_chip *chip, unsigned offset)
+static int egpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct egpio_chip *egpio;
 	struct egpio_info *ei;
-	unsigned           bit;
+	unsigned int           bit;
 	int                reg;
 	int                value;
 
@@ -157,7 +157,7 @@ static int egpio_get(struct gpio_chip *chip, unsigned offset)
 	}
 }
 
-static int egpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int egpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct egpio_chip *egpio;
 
@@ -170,7 +170,7 @@ static int egpio_direction_input(struct gpio_chip *chip, unsigned offset)
  * Output pins
  */
 
-static void egpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void egpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	unsigned long     flag;
 	struct egpio_chip *egpio;
@@ -201,7 +201,7 @@ static void egpio_set(struct gpio_chip *chip, unsigned offset, int value)
 }
 
 static int egpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
+					unsigned int offset, int value)
 {
 	struct egpio_chip *egpio;
 
@@ -214,7 +214,7 @@ static int egpio_direction_output(struct gpio_chip *chip,
 	}
 }
 
-static int egpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int egpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct egpio_chip *egpio;
 
diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 9960bb8b0f5b..de56c013a658 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -74,8 +74,8 @@ struct ichx_desc {
 	u32 use_sel_ignore[3];
 
 	/* Some chipsets have quirks, let these use their own request/get */
-	int (*request)(struct gpio_chip *chip, unsigned offset);
-	int (*get)(struct gpio_chip *chip, unsigned offset);
+	int (*request)(struct gpio_chip *chip, unsigned int offset);
+	int (*get)(struct gpio_chip *chip, unsigned int offset);
 
 	/*
 	 * Some chipsets don't let reading output values on GPIO_LVL register
@@ -100,7 +100,7 @@ static int modparam_gpiobase = -1;	/* dynamic */
 module_param_named(gpiobase, modparam_gpiobase, int, 0444);
 MODULE_PARM_DESC(gpiobase, "The GPIO number base. -1 means dynamic, which is the default.");
 
-static int ichx_write_bit(int reg, unsigned nr, int val, int verify)
+static int ichx_write_bit(int reg, unsigned int nr, int val, int verify)
 {
 	unsigned long flags;
 	u32 data, tmp;
@@ -132,7 +132,7 @@ static int ichx_write_bit(int reg, unsigned nr, int val, int verify)
 	return (verify && data != tmp) ? -EPERM : 0;
 }
 
-static int ichx_read_bit(int reg, unsigned nr)
+static int ichx_read_bit(int reg, unsigned int nr)
 {
 	unsigned long flags;
 	u32 data;
@@ -152,12 +152,12 @@ static int ichx_read_bit(int reg, unsigned nr)
 	return !!(data & BIT(bit));
 }
 
-static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned nr)
+static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned int nr)
 {
 	return !!(ichx_priv.use_gpio & BIT(nr / 32));
 }
 
-static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned nr)
+static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned int nr)
 {
 	if (ichx_read_bit(GPIO_IO_SEL, nr))
 		return GPIO_LINE_DIRECTION_IN;
@@ -165,7 +165,7 @@ static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned nr)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	/*
 	 * Try setting pin as an input and verify it worked since many pins
@@ -174,7 +174,7 @@ static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	return ichx_write_bit(GPIO_IO_SEL, nr, 1, 1);
 }
 
-static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
+static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 					int val)
 {
 	/* Disable blink hardware which is available for GPIOs from 0 to 31. */
@@ -191,12 +191,12 @@ static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	return ichx_write_bit(GPIO_IO_SEL, nr, 0, 1);
 }
 
-static int ichx_gpio_get(struct gpio_chip *chip, unsigned nr)
+static int ichx_gpio_get(struct gpio_chip *chip, unsigned int nr)
 {
 	return ichx_read_bit(GPIO_LVL, nr);
 }
 
-static int ich6_gpio_get(struct gpio_chip *chip, unsigned nr)
+static int ich6_gpio_get(struct gpio_chip *chip, unsigned int nr)
 {
 	unsigned long flags;
 	u32 data;
@@ -223,7 +223,7 @@ static int ich6_gpio_get(struct gpio_chip *chip, unsigned nr)
 	}
 }
 
-static int ichx_gpio_request(struct gpio_chip *chip, unsigned nr)
+static int ichx_gpio_request(struct gpio_chip *chip, unsigned int nr)
 {
 	if (!ichx_gpio_check_available(chip, nr))
 		return -ENXIO;
@@ -240,7 +240,7 @@ static int ichx_gpio_request(struct gpio_chip *chip, unsigned nr)
 	return ichx_read_bit(GPIO_USE_SEL, nr) ? 0 : -ENODEV;
 }
 
-static int ich6_gpio_request(struct gpio_chip *chip, unsigned nr)
+static int ich6_gpio_request(struct gpio_chip *chip, unsigned int nr)
 {
 	/*
 	 * Fixups for bits 16 and 17 are necessary on the Intel ICH6/3100
@@ -254,7 +254,7 @@ static int ich6_gpio_request(struct gpio_chip *chip, unsigned nr)
 	return ichx_gpio_request(chip, nr);
 }
 
-static void ichx_gpio_set(struct gpio_chip *chip, unsigned nr, int val)
+static void ichx_gpio_set(struct gpio_chip *chip, unsigned int nr, int val)
 {
 	ichx_write_bit(GPIO_LVL, nr, val, 0);
 }
diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 86a10c808ef6..6487acab104c 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -64,27 +64,27 @@ struct intel_mid_gpio {
 	struct pci_dev			*pdev;
 };
 
-static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned offset,
+static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned int offset,
 			      enum GPIO_REG reg_type)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
-	unsigned nreg = chip->ngpio / 32;
+	unsigned int nreg = chip->ngpio / 32;
 	u8 reg = offset / 32;
 
 	return priv->reg_base + reg_type * nreg * 4 + reg * 4;
 }
 
-static void __iomem *gpio_reg_2bit(struct gpio_chip *chip, unsigned offset,
+static void __iomem *gpio_reg_2bit(struct gpio_chip *chip, unsigned int offset,
 				   enum GPIO_REG reg_type)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
-	unsigned nreg = chip->ngpio / 32;
+	unsigned int nreg = chip->ngpio / 32;
 	u8 reg = offset / 16;
 
 	return priv->reg_base + reg_type * nreg * 4 + reg * 4;
 }
 
-static int intel_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int intel_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gafr = gpio_reg_2bit(chip, offset, GAFR);
 	u32 value = readl(gafr);
@@ -97,14 +97,14 @@ static int intel_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int intel_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gplr = gpio_reg(chip, offset, GPLR);
 
 	return !!(readl(gplr) & BIT(offset % 32));
 }
 
-static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void intel_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	void __iomem *gpsr, *gpcr;
 
@@ -117,7 +117,7 @@ static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	}
 }
 
-static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
@@ -140,7 +140,7 @@ static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 }
 
 static int intel_gpio_direction_output(struct gpio_chip *chip,
-			unsigned offset, int value)
+			unsigned int offset, int value)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
@@ -163,7 +163,7 @@ static int intel_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int intel_mid_irq_type(struct irq_data *d, unsigned type)
+static int intel_mid_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct intel_mid_gpio *priv = gpiochip_get_data(gc);
@@ -297,7 +297,7 @@ static int intel_mid_irq_init_hw(struct gpio_chip *chip)
 {
 	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *reg;
-	unsigned base;
+	unsigned int base;
 
 	for (base = 0; base < priv->chip.ngpio; base += 32) {
 		/* Clear the rising-edge detect register */
diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index b497a1d18ca9..f33a5c485d65 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -151,7 +151,7 @@ static inline void superio_clear_mask(int mask, int reg)
 		superio_outb(new_val, reg);
 }
 
-static int it87_gpio_request(struct gpio_chip *chip, unsigned gpio_num)
+static int it87_gpio_request(struct gpio_chip *chip, unsigned int gpio_num)
 {
 	u8 mask, group;
 	int rc = 0;
@@ -184,7 +184,7 @@ static int it87_gpio_request(struct gpio_chip *chip, unsigned gpio_num)
 	return rc;
 }
 
-static int it87_gpio_get(struct gpio_chip *chip, unsigned gpio_num)
+static int it87_gpio_get(struct gpio_chip *chip, unsigned int gpio_num)
 {
 	u16 reg;
 	u8 mask;
@@ -196,7 +196,7 @@ static int it87_gpio_get(struct gpio_chip *chip, unsigned gpio_num)
 	return !!(inb(reg) & mask);
 }
 
-static int it87_gpio_direction_in(struct gpio_chip *chip, unsigned gpio_num)
+static int it87_gpio_direction_in(struct gpio_chip *chip, unsigned int gpio_num)
 {
 	u8 mask, group;
 	int rc = 0;
@@ -222,7 +222,7 @@ static int it87_gpio_direction_in(struct gpio_chip *chip, unsigned gpio_num)
 }
 
 static void it87_gpio_set(struct gpio_chip *chip,
-			  unsigned gpio_num, int val)
+			  unsigned int gpio_num, int val)
 {
 	u8 mask, curr_vals;
 	u16 reg;
@@ -239,7 +239,7 @@ static void it87_gpio_set(struct gpio_chip *chip,
 }
 
 static int it87_gpio_direction_out(struct gpio_chip *chip,
-				   unsigned gpio_num, int val)
+				   unsigned int gpio_num, int val)
 {
 	u8 mask, group;
 	int rc = 0;
diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index cdf50e4ea165..b5fdc1d1d290 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -54,7 +54,7 @@ struct ttl_module {
 	spinlock_t lock;
 };
 
-static int ttl_get_value(struct gpio_chip *gpio, unsigned offset)
+static int ttl_get_value(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct ttl_module *mod = dev_get_drvdata(gpio->parent);
 	u8 *shadow;
@@ -76,7 +76,7 @@ static int ttl_get_value(struct gpio_chip *gpio, unsigned offset)
 	return !!ret;
 }
 
-static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int value)
+static void ttl_set_value(struct gpio_chip *gpio, unsigned int offset, int value)
 {
 	struct ttl_module *mod = dev_get_drvdata(gpio->parent);
 	void __iomem *port;
diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 4ea15f08e0f4..2aa185297417 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -55,7 +55,7 @@ static int kempld_gpio_get_bit(struct kempld_device_data *pld, u8 reg, u8 bit)
 	return !!(status & KEMPLD_GPIO_MASK(bit));
 }
 
-static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int kempld_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
@@ -63,7 +63,7 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
 }
 
-static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void kempld_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
@@ -73,7 +73,7 @@ static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	kempld_release_mutex(pld);
 }
 
-static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
@@ -85,7 +85,7 @@ static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int kempld_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+static int kempld_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 					int value)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
@@ -99,7 +99,7 @@ static int kempld_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static int kempld_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int kempld_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index 015632cf159f..ea4d24157dc7 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -27,7 +27,7 @@ struct logicvc_gpio {
 	struct regmap *regmap;
 };
 
-static void logicvc_gpio_offset(struct logicvc_gpio *logicvc, unsigned offset,
+static void logicvc_gpio_offset(struct logicvc_gpio *logicvc, unsigned int offset,
 				unsigned int *reg, unsigned int *bit)
 {
 	if (offset >= LOGICVC_CTRL_GPIO_BITS) {
@@ -47,7 +47,7 @@ static void logicvc_gpio_offset(struct logicvc_gpio *logicvc, unsigned offset,
 	*bit = BIT(offset);
 }
 
-static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int logicvc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct logicvc_gpio *logicvc = gpiochip_get_data(chip);
 	unsigned int reg, bit, value;
@@ -62,7 +62,7 @@ static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(value & bit);
 }
 
-static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void logicvc_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct logicvc_gpio *logicvc = gpiochip_get_data(chip);
 	unsigned int reg, bit;
@@ -73,7 +73,7 @@ static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 }
 
 static int logicvc_gpio_direction_output(struct gpio_chip *chip,
-					 unsigned offset, int value)
+					 unsigned int offset, int value)
 {
 	/* Pins are always configured as output, so just set the value. */
 	logicvc_gpio_set(chip, offset, value);
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index a42145873cc9..2713ed8e6eeb 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -37,7 +37,7 @@
 
 static DEFINE_SPINLOCK(gpio_lock);
 
-static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
+static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned int gpio)
 {
 	u32 val;
 
@@ -49,7 +49,7 @@ static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 }
 
 static void loongson_gpio_set_value(struct gpio_chip *chip,
-		unsigned gpio, int value)
+		unsigned int gpio, int value)
 {
 	u32 val;
 
@@ -63,7 +63,7 @@ static void loongson_gpio_set_value(struct gpio_chip *chip,
 	spin_unlock(&gpio_lock);
 }
 
-static int loongson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+static int loongson_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	u32 temp;
 
@@ -77,7 +77,7 @@ static int loongson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 }
 
 static int loongson_gpio_direction_output(struct gpio_chip *chip,
-		unsigned gpio, int level)
+		unsigned int gpio, int level)
 {
 	u32 temp;
 
diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index 8a30fb185aab..79edd5db49d2 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -42,7 +42,7 @@ struct lp3943_gpio {
 	u16 input_mask;		/* 1 = GPIO is input direction, 0 = output */
 };
 
-static int lp3943_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int lp3943_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	struct lp3943 *lp3943 = lp3943_gpio->lp3943;
@@ -54,7 +54,7 @@ static int lp3943_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void lp3943_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void lp3943_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	struct lp3943 *lp3943 = lp3943_gpio->lp3943;
@@ -72,7 +72,7 @@ static int lp3943_gpio_set_mode(struct lp3943_gpio *lp3943_gpio, u8 offset,
 				  val << mux[offset].shift);
 }
 
-static int lp3943_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int lp3943_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 
@@ -82,7 +82,7 @@ static int lp3943_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 }
 
 static int lp3943_get_gpio_in_status(struct lp3943_gpio *lp3943_gpio,
-				     struct gpio_chip *chip, unsigned offset)
+				     struct gpio_chip *chip, unsigned int offset)
 {
 	u8 addr, read;
 	int err;
@@ -107,7 +107,7 @@ static int lp3943_get_gpio_in_status(struct lp3943_gpio *lp3943_gpio,
 }
 
 static int lp3943_get_gpio_out_status(struct lp3943_gpio *lp3943_gpio,
-				      struct gpio_chip *chip, unsigned offset)
+				      struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp3943 *lp3943 = lp3943_gpio->lp3943;
 	const struct lp3943_reg_cfg *mux = lp3943->mux_cfg;
@@ -128,7 +128,7 @@ static int lp3943_get_gpio_out_status(struct lp3943_gpio *lp3943_gpio,
 		return -EINVAL;
 }
 
-static int lp3943_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int lp3943_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 
@@ -147,7 +147,7 @@ static int lp3943_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return lp3943_get_gpio_out_status(lp3943_gpio, chip, offset);
 }
 
-static void lp3943_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	u8 data;
@@ -160,7 +160,7 @@ static void lp3943_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	lp3943_gpio_set_mode(lp3943_gpio, offset, data);
 }
 
-static int lp3943_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+static int lp3943_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 					int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 70fad87ff2db..9df3905126fd 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -100,7 +100,7 @@ static int lp873x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
-static int lp873x_gpio_set_config(struct gpio_chip *gc, unsigned offset,
+static int lp873x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				  unsigned long config)
 {
 	struct lp873x_gpio *gpio = gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index d711ae06747e..cc200edd9f9b 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -265,19 +265,19 @@ static int lpc18xx_gpio_pin_ic_probe(struct lpc18xx_gpio_chip *gc)
 	return ret;
 }
 
-static void lpc18xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void lpc18xx_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct lpc18xx_gpio_chip *gc = gpiochip_get_data(chip);
 	writeb(value ? 1 : 0, gc->base + offset);
 }
 
-static int lpc18xx_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int lpc18xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lpc18xx_gpio_chip *gc = gpiochip_get_data(chip);
 	return !!readb(gc->base + offset);
 }
 
-static int lpc18xx_gpio_direction(struct gpio_chip *chip, unsigned offset,
+static int lpc18xx_gpio_direction(struct gpio_chip *chip, unsigned int offset,
 				  bool out)
 {
 	struct lpc18xx_gpio_chip *gc = gpiochip_get_data(chip);
@@ -300,13 +300,13 @@ static int lpc18xx_gpio_direction(struct gpio_chip *chip, unsigned offset,
 }
 
 static int lpc18xx_gpio_direction_input(struct gpio_chip *chip,
-					unsigned offset)
+					unsigned int offset)
 {
 	return lpc18xx_gpio_direction(chip, offset, false);
 }
 
 static int lpc18xx_gpio_direction_output(struct gpio_chip *chip,
-					 unsigned offset, int value)
+					 unsigned int offset, int value)
 {
 	lpc18xx_gpio_set(chip, offset, value);
 	return lpc18xx_gpio_direction(chip, offset, true);
diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 4e626c4235c2..7fbaf2fcab87 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -176,7 +176,7 @@ static inline void gpreg_write(struct lpc32xx_gpio_chip *group, u32 val, unsigne
 }
 
 static void __set_gpio_dir_p012(struct lpc32xx_gpio_chip *group,
-	unsigned pin, int input)
+	unsigned int pin, int input)
 {
 	if (input)
 		gpreg_write(group, GPIO012_PIN_TO_BIT(pin),
@@ -187,7 +187,7 @@ static void __set_gpio_dir_p012(struct lpc32xx_gpio_chip *group,
 }
 
 static void __set_gpio_dir_p3(struct lpc32xx_gpio_chip *group,
-	unsigned pin, int input)
+	unsigned int pin, int input)
 {
 	u32 u = GPIO3_PIN_TO_BIT(pin);
 
@@ -198,7 +198,7 @@ static void __set_gpio_dir_p3(struct lpc32xx_gpio_chip *group,
 }
 
 static void __set_gpio_level_p012(struct lpc32xx_gpio_chip *group,
-	unsigned pin, int high)
+	unsigned int pin, int high)
 {
 	if (high)
 		gpreg_write(group, GPIO012_PIN_TO_BIT(pin),
@@ -209,7 +209,7 @@ static void __set_gpio_level_p012(struct lpc32xx_gpio_chip *group,
 }
 
 static void __set_gpio_level_p3(struct lpc32xx_gpio_chip *group,
-	unsigned pin, int high)
+	unsigned int pin, int high)
 {
 	u32 u = GPIO3_PIN_TO_BIT(pin);
 
@@ -220,7 +220,7 @@ static void __set_gpio_level_p3(struct lpc32xx_gpio_chip *group,
 }
 
 static void __set_gpo_level_p3(struct lpc32xx_gpio_chip *group,
-	unsigned pin, int high)
+	unsigned int pin, int high)
 {
 	if (high)
 		gpreg_write(group, GPO3_PIN_TO_BIT(pin), group->gpio_grp->outp_set);
@@ -229,14 +229,14 @@ static void __set_gpo_level_p3(struct lpc32xx_gpio_chip *group,
 }
 
 static int __get_gpio_state_p012(struct lpc32xx_gpio_chip *group,
-	unsigned pin)
+	unsigned int pin)
 {
 	return GPIO012_PIN_IN_SEL(gpreg_read(group, group->gpio_grp->inp_state),
 		pin);
 }
 
 static int __get_gpio_state_p3(struct lpc32xx_gpio_chip *group,
-	unsigned pin)
+	unsigned int pin)
 {
 	int state = gpreg_read(group, group->gpio_grp->inp_state);
 
@@ -248,13 +248,13 @@ static int __get_gpio_state_p3(struct lpc32xx_gpio_chip *group,
 }
 
 static int __get_gpi_state_p3(struct lpc32xx_gpio_chip *group,
-	unsigned pin)
+	unsigned int pin)
 {
 	return GPI3_PIN_IN_SEL(gpreg_read(group, group->gpio_grp->inp_state), pin);
 }
 
 static int __get_gpo_state_p3(struct lpc32xx_gpio_chip *group,
-	unsigned pin)
+	unsigned int pin)
 {
 	return GPO3_PIN_IN_SEL(gpreg_read(group, group->gpio_grp->outp_state), pin);
 }
@@ -263,7 +263,7 @@ static int __get_gpo_state_p3(struct lpc32xx_gpio_chip *group,
  * GPIO primitives.
  */
 static int lpc32xx_gpio_dir_input_p012(struct gpio_chip *chip,
-	unsigned pin)
+	unsigned int pin)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
@@ -273,7 +273,7 @@ static int lpc32xx_gpio_dir_input_p012(struct gpio_chip *chip,
 }
 
 static int lpc32xx_gpio_dir_input_p3(struct gpio_chip *chip,
-	unsigned pin)
+	unsigned int pin)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
@@ -283,33 +283,33 @@ static int lpc32xx_gpio_dir_input_p3(struct gpio_chip *chip,
 }
 
 static int lpc32xx_gpio_dir_in_always(struct gpio_chip *chip,
-	unsigned pin)
+	unsigned int pin)
 {
 	return 0;
 }
 
-static int lpc32xx_gpio_get_value_p012(struct gpio_chip *chip, unsigned pin)
+static int lpc32xx_gpio_get_value_p012(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	return !!__get_gpio_state_p012(group, pin);
 }
 
-static int lpc32xx_gpio_get_value_p3(struct gpio_chip *chip, unsigned pin)
+static int lpc32xx_gpio_get_value_p3(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	return !!__get_gpio_state_p3(group, pin);
 }
 
-static int lpc32xx_gpi_get_value(struct gpio_chip *chip, unsigned pin)
+static int lpc32xx_gpi_get_value(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	return !!__get_gpi_state_p3(group, pin);
 }
 
-static int lpc32xx_gpio_dir_output_p012(struct gpio_chip *chip, unsigned pin,
+static int lpc32xx_gpio_dir_output_p012(struct gpio_chip *chip, unsigned int pin,
 	int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
@@ -320,7 +320,7 @@ static int lpc32xx_gpio_dir_output_p012(struct gpio_chip *chip, unsigned pin,
 	return 0;
 }
 
-static int lpc32xx_gpio_dir_output_p3(struct gpio_chip *chip, unsigned pin,
+static int lpc32xx_gpio_dir_output_p3(struct gpio_chip *chip, unsigned int pin,
 	int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
@@ -331,7 +331,7 @@ static int lpc32xx_gpio_dir_output_p3(struct gpio_chip *chip, unsigned pin,
 	return 0;
 }
 
-static int lpc32xx_gpio_dir_out_always(struct gpio_chip *chip, unsigned pin,
+static int lpc32xx_gpio_dir_out_always(struct gpio_chip *chip, unsigned int pin,
 	int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
@@ -340,7 +340,7 @@ static int lpc32xx_gpio_dir_out_always(struct gpio_chip *chip, unsigned pin,
 	return 0;
 }
 
-static void lpc32xx_gpio_set_value_p012(struct gpio_chip *chip, unsigned pin,
+static void lpc32xx_gpio_set_value_p012(struct gpio_chip *chip, unsigned int pin,
 	int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
@@ -348,7 +348,7 @@ static void lpc32xx_gpio_set_value_p012(struct gpio_chip *chip, unsigned pin,
 	__set_gpio_level_p012(group, pin, value);
 }
 
-static void lpc32xx_gpio_set_value_p3(struct gpio_chip *chip, unsigned pin,
+static void lpc32xx_gpio_set_value_p3(struct gpio_chip *chip, unsigned int pin,
 	int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
@@ -356,7 +356,7 @@ static void lpc32xx_gpio_set_value_p3(struct gpio_chip *chip, unsigned pin,
 	__set_gpio_level_p3(group, pin, value);
 }
 
-static void lpc32xx_gpo_set_value(struct gpio_chip *chip, unsigned pin,
+static void lpc32xx_gpo_set_value(struct gpio_chip *chip, unsigned int pin,
 	int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
@@ -364,14 +364,14 @@ static void lpc32xx_gpo_set_value(struct gpio_chip *chip, unsigned pin,
 	__set_gpo_level_p3(group, pin, value);
 }
 
-static int lpc32xx_gpo_get_value(struct gpio_chip *chip, unsigned pin)
+static int lpc32xx_gpo_get_value(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	return !!__get_gpo_state_p3(group, pin);
 }
 
-static int lpc32xx_gpio_request(struct gpio_chip *chip, unsigned pin)
+static int lpc32xx_gpio_request(struct gpio_chip *chip, unsigned int pin)
 {
 	if (pin < chip->ngpio)
 		return 0;
@@ -379,17 +379,17 @@ static int lpc32xx_gpio_request(struct gpio_chip *chip, unsigned pin)
 	return -EINVAL;
 }
 
-static int lpc32xx_gpio_to_irq_p01(struct gpio_chip *chip, unsigned offset)
+static int lpc32xx_gpio_to_irq_p01(struct gpio_chip *chip, unsigned int offset)
 {
 	return -ENXIO;
 }
 
-static int lpc32xx_gpio_to_irq_gpio_p3(struct gpio_chip *chip, unsigned offset)
+static int lpc32xx_gpio_to_irq_gpio_p3(struct gpio_chip *chip, unsigned int offset)
 {
 	return -ENXIO;
 }
 
-static int lpc32xx_gpio_to_irq_gpi_p3(struct gpio_chip *chip, unsigned offset)
+static int lpc32xx_gpio_to_irq_gpi_p3(struct gpio_chip *chip, unsigned int offset)
 {
 	return -ENXIO;
 }
diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index b8c1fe20f49a..0a4cbf582146 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -45,7 +45,7 @@
 
 #define PIN_NUMBER 28
 
-static int max7301_direction_input(struct gpio_chip *chip, unsigned offset)
+static int max7301_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct max7301 *ts = container_of(chip, struct max7301, chip);
 	u8 *config;
@@ -75,7 +75,7 @@ static int max7301_direction_input(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static int __max7301_set(struct max7301 *ts, unsigned offset, int value)
+static int __max7301_set(struct max7301 *ts, unsigned int offset, int value)
 {
 	if (value) {
 		ts->out_level |= 1 << offset;
@@ -86,7 +86,7 @@ static int __max7301_set(struct max7301 *ts, unsigned offset, int value)
 	}
 }
 
-static int max7301_direction_output(struct gpio_chip *chip, unsigned offset,
+static int max7301_direction_output(struct gpio_chip *chip, unsigned int offset,
 				    int value)
 {
 	struct max7301 *ts = container_of(chip, struct max7301, chip);
@@ -115,7 +115,7 @@ static int max7301_direction_output(struct gpio_chip *chip, unsigned offset,
 	return ret;
 }
 
-static int max7301_get(struct gpio_chip *chip, unsigned offset)
+static int max7301_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct max7301 *ts = gpiochip_get_data(chip);
 	int config, level = -EINVAL;
@@ -143,7 +143,7 @@ static int max7301_get(struct gpio_chip *chip, unsigned offset)
 	return level;
 }
 
-static void max7301_set(struct gpio_chip *chip, unsigned offset, int value)
+static void max7301_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct max7301 *ts = gpiochip_get_data(chip);
 
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 5fb0bcf31142..98f7d4eb27c4 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -186,12 +186,12 @@ static int max732x_readb(struct max732x_chip *chip, int group_a, uint8_t *val)
 	return 0;
 }
 
-static inline int is_group_a(struct max732x_chip *chip, unsigned off)
+static inline int is_group_a(struct max732x_chip *chip, unsigned int off)
 {
 	return (1u << off) & chip->mask_group_a;
 }
 
-static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned off)
+static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned int off)
 {
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 	uint8_t reg_val;
@@ -204,7 +204,7 @@ static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 	return !!(reg_val & (1u << (off & 0x7)));
 }
 
-static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
+static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned int off, int mask,
 				  int val)
 {
 	struct max732x_chip *chip = gpiochip_get_data(gc);
@@ -229,9 +229,9 @@ static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
 	mutex_unlock(&chip->lock);
 }
 
-static void max732x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
+static void max732x_gpio_set_value(struct gpio_chip *gc, unsigned int off, int val)
 {
-	unsigned base = off & ~0x7;
+	unsigned int base = off & ~0x7;
 	uint8_t mask = 1u << (off & 0x7);
 
 	max732x_gpio_set_mask(gc, base, mask, val << (off & 0x7));
@@ -240,8 +240,8 @@ static void max732x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 static void max732x_gpio_set_multiple(struct gpio_chip *gc,
 				      unsigned long *mask, unsigned long *bits)
 {
-	unsigned mask_lo = mask[0] & 0xff;
-	unsigned mask_hi = (mask[0] >> 8) & 0xff;
+	unsigned int mask_lo = mask[0] & 0xff;
+	unsigned int mask_hi = (mask[0] >> 8) & 0xff;
 
 	if (mask_lo)
 		max732x_gpio_set_mask(gc, 0, mask_lo, bits[0] & 0xff);
@@ -249,7 +249,7 @@ static void max732x_gpio_set_multiple(struct gpio_chip *gc,
 		max732x_gpio_set_mask(gc, 8, mask_hi, (bits[0] >> 8) & 0xff);
 }
 
-static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
+static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned int off)
 {
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 	unsigned int mask = 1u << off;
@@ -271,7 +271,7 @@ static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 }
 
 static int max732x_gpio_direction_output(struct gpio_chip *gc,
-		unsigned off, int val)
+		unsigned int off, int val)
 {
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 	unsigned int mask = 1u << off;
@@ -552,7 +552,7 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 
 static int max732x_setup_gpio(struct max732x_chip *chip,
 					const struct i2c_device_id *id,
-					unsigned gpio_start)
+					unsigned int gpio_start)
 {
 	struct gpio_chip *gc = &chip->gpio_chip;
 	uint32_t id_data = (uint32_t)max732x_features[id->driver_data];
diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 37c5363e391e..bd7a672322a2 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -40,7 +40,7 @@ struct mb86s70_gpio_chip {
 	spinlock_t lock;
 };
 
-static int mb86s70_gpio_request(struct gpio_chip *gc, unsigned gpio)
+static int mb86s70_gpio_request(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -57,7 +57,7 @@ static int mb86s70_gpio_request(struct gpio_chip *gc, unsigned gpio)
 	return 0;
 }
 
-static void mb86s70_gpio_free(struct gpio_chip *gc, unsigned gpio)
+static void mb86s70_gpio_free(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -72,7 +72,7 @@ static void mb86s70_gpio_free(struct gpio_chip *gc, unsigned gpio)
 	spin_unlock_irqrestore(&gchip->lock, flags);
 }
 
-static int mb86s70_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
+static int mb86s70_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -90,7 +90,7 @@ static int mb86s70_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 }
 
 static int mb86s70_gpio_direction_output(struct gpio_chip *gc,
-					 unsigned gpio, int value)
+					 unsigned int gpio, int value)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -114,14 +114,14 @@ static int mb86s70_gpio_direction_output(struct gpio_chip *gc,
 	return 0;
 }
 
-static int mb86s70_gpio_get(struct gpio_chip *gc, unsigned gpio)
+static int mb86s70_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 
 	return !!(readl(gchip->base + PDR(gpio)) & OFFSET(gpio));
 }
 
-static void mb86s70_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
+static void mb86s70_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index f8194f7c6186..1fb20894ce27 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -46,7 +46,7 @@ static int mc33880_write_config(struct mc33880 *mc)
 }
 
 
-static int __mc33880_set(struct mc33880 *mc, unsigned offset, int value)
+static int __mc33880_set(struct mc33880 *mc, unsigned int offset, int value)
 {
 	if (value)
 		mc->port_config |= 1 << offset;
@@ -57,7 +57,7 @@ static int __mc33880_set(struct mc33880 *mc, unsigned offset, int value)
 }
 
 
-static void mc33880_set(struct gpio_chip *chip, unsigned offset, int value)
+static void mc33880_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct mc33880 *mc = gpiochip_get_data(chip);
 
diff --git a/drivers/gpio/gpio-mc9s08dz60.c b/drivers/gpio/gpio-mc9s08dz60.c
index a9f17cebd5ed..bcd5ee311228 100644
--- a/drivers/gpio/gpio-mc9s08dz60.c
+++ b/drivers/gpio/gpio-mc9s08dz60.c
@@ -26,7 +26,7 @@ static void mc9s_gpio_to_reg_and_bit(int offset, u8 *reg, u8 *bit)
 	*bit = offset % GPIO_NUM_PER_GROUP;
 }
 
-static int mc9s08dz60_get_value(struct gpio_chip *gc, unsigned offset)
+static int mc9s08dz60_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	u8 reg, bit;
 	s32 value;
@@ -38,7 +38,7 @@ static int mc9s08dz60_get_value(struct gpio_chip *gc, unsigned offset)
 	return (value >= 0) ? (value >> bit) & 0x1 : 0;
 }
 
-static int mc9s08dz60_set(struct mc9s08dz60 *mc9s, unsigned offset, int val)
+static int mc9s08dz60_set(struct mc9s08dz60 *mc9s, unsigned int offset, int val)
 {
 	u8 reg, bit;
 	s32 value;
@@ -58,7 +58,7 @@ static int mc9s08dz60_set(struct mc9s08dz60 *mc9s, unsigned offset, int val)
 }
 
 
-static void mc9s08dz60_set_value(struct gpio_chip *gc, unsigned offset, int val)
+static void mc9s08dz60_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct mc9s08dz60 *mc9s = gpiochip_get_data(gc);
 
@@ -66,7 +66,7 @@ static void mc9s08dz60_set_value(struct gpio_chip *gc, unsigned offset, int val)
 }
 
 static int mc9s08dz60_direction_output(struct gpio_chip *gc,
-				       unsigned offset, int val)
+				       unsigned int offset, int val)
 {
 	struct mc9s08dz60 *mc9s = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index 1e21c661d79d..76da72670d82 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -35,8 +35,8 @@ struct men_z127_gpio {
 	struct resource *mem;
 };
 
-static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
-			     unsigned debounce)
+static int men_z127_debounce(struct gpio_chip *gc, unsigned int gpio,
+			     unsigned int debounce)
 {
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
 	struct device *dev = gc->parent;
@@ -85,7 +85,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 }
 
 static int men_z127_set_single_ended(struct gpio_chip *gc,
-				     unsigned offset,
+				     unsigned int offset,
 				     enum pin_config_param param)
 {
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
@@ -106,7 +106,7 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 	return 0;
 }
 
-static int men_z127_set_config(struct gpio_chip *gc, unsigned offset,
+static int men_z127_set_config(struct gpio_chip *gc, unsigned int offset,
 			       unsigned long config)
 {
 	enum pin_config_param param = pinconf_to_config_param(config);
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 92b6e958cfed..f1b754b60413 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -89,7 +89,7 @@ struct ioh_gpio {
 
 static const int num_ports[] = {6, 12, 16, 16, 15, 16, 16, 12};
 
-static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
+static void ioh_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
@@ -106,14 +106,14 @@ static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 }
 
-static int ioh_gpio_get(struct gpio_chip *gpio, unsigned nr)
+static int ioh_gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 
 	return !!(ioread32(&chip->reg->regs[chip->ch].pi) & (1 << nr));
 }
 
-static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
+static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 				     int val)
 {
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
@@ -139,7 +139,7 @@ static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	return 0;
 }
 
-static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
@@ -209,7 +209,7 @@ static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 }
 #endif
 
-static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
+static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct ioh_gpio *chip = gpiochip_get_data(gpio);
 	return chip->irq_base + offset;
diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 538e31fe8903..3d0080d1433e 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -57,7 +57,7 @@ static void ltq_mm_apply(struct ltq_mm *chip)
  *
  * Set the shadow value and call ltq_mm_apply.
  */
-static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
+static void ltq_mm_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ltq_mm *chip = gpiochip_get_data(gc);
 
@@ -76,7 +76,7 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
  *
  * Same as ltq_mm_set, always returns 0.
  */
-static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
+static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	ltq_mm_set(gc, offset, value);
 
diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index b778f33cc6af..bc2dc9f93dbb 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -567,7 +567,7 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
 	return 0;
 }
 
-static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
+static int bgpio_request(struct gpio_chip *chip, unsigned int gpio_pin)
 {
 	if (gpio_pin < chip->ngpio)
 		return 0;
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 604dfec353a1..57ae98ee8036 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -41,7 +41,7 @@ struct mpc8xxx_gpio_chip {
 	raw_spinlock_t lock;
 
 	int (*direction_output)(struct gpio_chip *chip,
-				unsigned offset, int value);
+				unsigned int offset, int value);
 
 	struct irq_domain *irq;
 	unsigned int irqn;
@@ -118,7 +118,7 @@ static int mpc5125_gpio_dir_out(struct gpio_chip *gc,
 	return mpc8xxx_gc->direction_output(gc, gpio, val);
 }
 
-static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 7e3c96e4ab2c..ea5ff2c84a26 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -43,9 +43,9 @@ struct msic_gpio {
 	struct mutex		buslock;
 	struct gpio_chip	chip;
 	int			irq;
-	unsigned		irq_base;
+	unsigned int		irq_base;
 	unsigned long		trig_change_mask;
-	unsigned		trig_type;
+	unsigned int		trig_type;
 };
 
 /*
@@ -58,7 +58,7 @@ struct msic_gpio {
  * GPIO1HV0..GPIO1HV3: high voltage, bank 1, gpio_base + 20
  */
 
-static int msic_gpio_to_ireg(unsigned offset)
+static int msic_gpio_to_ireg(unsigned int offset)
 {
 	if (offset >= MSIC_NUM_GPIO)
 		return -EINVAL;
@@ -73,7 +73,7 @@ static int msic_gpio_to_ireg(unsigned offset)
 	return INTEL_MSIC_GPIO1HV0CTLI - offset + 20;
 }
 
-static int msic_gpio_to_oreg(unsigned offset)
+static int msic_gpio_to_oreg(unsigned int offset)
 {
 	if (offset >= MSIC_NUM_GPIO)
 		return -EINVAL;
@@ -88,7 +88,7 @@ static int msic_gpio_to_oreg(unsigned offset)
 	return INTEL_MSIC_GPIO1HV0CTLO - offset + 20;
 }
 
-static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	int reg;
 
@@ -100,10 +100,10 @@ static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 }
 
 static int msic_gpio_direction_output(struct gpio_chip *chip,
-			unsigned offset, int value)
+			unsigned int offset, int value)
 {
 	int reg;
-	unsigned mask;
+	unsigned int mask;
 
 	value = (!!value) | MSIC_GPIO_DIR_OUT;
 	mask = MSIC_GPIO_DIR_MASK | MSIC_GPIO_DOUT_MASK;
@@ -115,7 +115,7 @@ static int msic_gpio_direction_output(struct gpio_chip *chip,
 	return intel_msic_reg_update(reg, value, mask);
 }
 
-static int msic_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	u8 r;
 	int ret;
@@ -132,7 +132,7 @@ static int msic_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(r & MSIC_GPIO_DIN_MASK);
 }
 
-static void msic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void msic_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	int reg;
 
@@ -148,7 +148,7 @@ static void msic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
  * irq_desc->lock held. We can not access the scu bus here, so we
  * store the change and update in the bus_sync_unlock() function below
  */
-static int msic_irq_type(struct irq_data *data, unsigned type)
+static int msic_irq_type(struct irq_data *data, unsigned int type)
 {
 	struct msic_gpio *mg = irq_data_get_irq_chip_data(data);
 	u32 gpio = data->irq - mg->irq_base;
@@ -163,7 +163,7 @@ static int msic_irq_type(struct irq_data *data, unsigned type)
 	return 0;
 }
 
-static int msic_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct msic_gpio *mg = gpiochip_get_data(chip);
 	return mg->irq_base + offset;
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 64278a4756f0..ba047122e66a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -32,18 +32,18 @@ enum mxc_gpio_hwtype {
 
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
-	unsigned dr_reg;
-	unsigned gdir_reg;
-	unsigned psr_reg;
-	unsigned icr1_reg;
-	unsigned icr2_reg;
-	unsigned imr_reg;
-	unsigned isr_reg;
+	unsigned int dr_reg;
+	unsigned int gdir_reg;
+	unsigned int psr_reg;
+	unsigned int icr1_reg;
+	unsigned int icr2_reg;
+	unsigned int imr_reg;
+	unsigned int isr_reg;
 	int edge_sel_reg;
-	unsigned low_level;
-	unsigned high_level;
-	unsigned rise_edge;
-	unsigned fall_edge;
+	unsigned int low_level;
+	unsigned int high_level;
+	unsigned int rise_edge;
+	unsigned int fall_edge;
 };
 
 struct mxc_gpio_reg_saved {
@@ -400,7 +400,7 @@ static void mxc_gpio_get_hw(struct platform_device *pdev)
 	mxc_gpio_hwtype = hwtype;
 }
 
-static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct mxc_gpio_port *port = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index c4a314c68555..4da52f51b40c 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -234,14 +234,14 @@ static int mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 	return rv;
 }
 
-static int mxs_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int mxs_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct mxs_gpio_port *port = gpiochip_get_data(gc);
 
 	return irq_find_mapping(port->domain, offset);
 }
 
-static int mxs_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
+static int mxs_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct mxs_gpio_port *port = gpiochip_get_data(gc);
 	u32 mask = 1 << offset;
diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index afb0e8a791e5..77aafaf7e68c 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -39,7 +39,7 @@ struct octeon_gpio {
 	u64 register_base;
 };
 
-static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
+static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned int offset)
 {
 	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 
@@ -47,7 +47,7 @@ static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void octeon_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	u64 mask = 1ull << offset;
@@ -55,7 +55,7 @@ static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	cvmx_write_csr(reg, mask);
 }
 
-static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
+static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned int offset,
 			       int value)
 {
 	struct octeon_gpio *gpio = gpiochip_get_data(chip);
@@ -70,7 +70,7 @@ static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static int octeon_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int octeon_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	u64 read_bits = cvmx_read_csr(gpio->register_base + RX_DAT);
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index b8e2ecc3eade..203c1857ac92 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -72,7 +72,7 @@ struct gpio_bank {
 	u32 width;
 	int context_loss_count;
 
-	void (*set_dataout)(struct gpio_bank *bank, unsigned gpio, int enable);
+	void (*set_dataout)(struct gpio_bank *bank, unsigned int gpio, int enable);
 	int (*get_context_loss_count)(struct device *dev);
 };
 
@@ -112,7 +112,7 @@ static void omap_set_gpio_direction(struct gpio_bank *bank, int gpio,
 
 
 /* set data out value using dedicate set/clear register */
-static void omap_set_gpio_dataout_reg(struct gpio_bank *bank, unsigned offset,
+static void omap_set_gpio_dataout_reg(struct gpio_bank *bank, unsigned int offset,
 				      int enable)
 {
 	void __iomem *reg = bank->base;
@@ -130,7 +130,7 @@ static void omap_set_gpio_dataout_reg(struct gpio_bank *bank, unsigned offset,
 }
 
 /* set data out value using mask register */
-static void omap_set_gpio_dataout_mask(struct gpio_bank *bank, unsigned offset,
+static void omap_set_gpio_dataout_mask(struct gpio_bank *bank, unsigned int offset,
 				       int enable)
 {
 	bank->context.dataout = omap_gpio_rmw(bank->base + bank->regs->dataout,
@@ -175,8 +175,8 @@ static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
  *
  * Return: 0 on success, negative error otherwise.
  */
-static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
-				   unsigned debounce)
+static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned int offset,
+				   unsigned int debounce)
 {
 	u32			val;
 	u32			l;
@@ -227,7 +227,7 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
  * time too. The debounce clock will also be disabled when calling this function
  * if this is the only gpio in the bank using debounce.
  */
-static void omap_clear_gpio_debounce(struct gpio_bank *bank, unsigned offset)
+static void omap_clear_gpio_debounce(struct gpio_bank *bank, unsigned int offset)
 {
 	u32 gpio_bit = BIT(offset);
 
@@ -268,7 +268,7 @@ static bool omap_gpio_is_off_wakeup_capable(struct gpio_bank *bank, u32 gpio_mas
 }
 
 static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
-						unsigned trigger)
+						unsigned int trigger)
 {
 	void __iomem *base = bank->base;
 	u32 gpio_bit = BIT(gpio);
@@ -329,7 +329,7 @@ static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio)
 }
 
 static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
-				    unsigned trigger)
+				    unsigned int trigger)
 {
 	void __iomem *reg = bank->base;
 	u32 l = 0;
@@ -368,7 +368,7 @@ static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
 	return 0;
 }
 
-static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned offset)
+static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned int offset)
 {
 	if (bank->regs->pinctrl) {
 		void __iomem *reg = bank->base + bank->regs->pinctrl;
@@ -389,7 +389,7 @@ static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned offset)
 	}
 }
 
-static void omap_disable_gpio_module(struct gpio_bank *bank, unsigned offset)
+static void omap_disable_gpio_module(struct gpio_bank *bank, unsigned int offset)
 {
 	if (bank->regs->ctrl && !BANK_USED(bank)) {
 		void __iomem *reg = bank->base + bank->regs->ctrl;
@@ -403,14 +403,14 @@ static void omap_disable_gpio_module(struct gpio_bank *bank, unsigned offset)
 	}
 }
 
-static int omap_gpio_is_input(struct gpio_bank *bank, unsigned offset)
+static int omap_gpio_is_input(struct gpio_bank *bank, unsigned int offset)
 {
 	void __iomem *reg = bank->base + bank->regs->direction;
 
 	return readl_relaxed(reg) & BIT(offset);
 }
 
-static void omap_gpio_init_irq(struct gpio_bank *bank, unsigned offset)
+static void omap_gpio_init_irq(struct gpio_bank *bank, unsigned int offset)
 {
 	if (!LINE_USED(bank->mod_usage, offset)) {
 		omap_enable_gpio_module(bank, offset);
@@ -419,12 +419,12 @@ static void omap_gpio_init_irq(struct gpio_bank *bank, unsigned offset)
 	bank->irq_usage |= BIT(offset);
 }
 
-static int omap_gpio_irq_type(struct irq_data *d, unsigned type)
+static int omap_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
 	int retval;
 	unsigned long flags;
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 
 	if (type & ~IRQ_TYPE_SENSE_MASK)
 		return -EINVAL;
@@ -482,7 +482,7 @@ static void omap_clear_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
 }
 
 static inline void omap_clear_gpio_irqstatus(struct gpio_bank *bank,
-					     unsigned offset)
+					     unsigned int offset)
 {
 	omap_clear_gpio_irqbank(bank, BIT(offset));
 }
@@ -502,7 +502,7 @@ static u32 omap_get_gpio_irqbank_mask(struct gpio_bank *bank)
 }
 
 static inline void omap_set_gpio_irqenable(struct gpio_bank *bank,
-					   unsigned offset, int enable)
+					   unsigned int offset, int enable)
 {
 	void __iomem *reg = bank->base;
 	u32 gpio_mask = BIT(offset);
@@ -624,7 +624,7 @@ static unsigned int omap_gpio_irq_startup(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned long flags;
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 
@@ -643,7 +643,7 @@ static void omap_gpio_irq_shutdown(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned long flags;
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->irq_usage &= ~(BIT(offset));
@@ -673,7 +673,7 @@ static void gpio_irq_bus_sync_unlock(struct irq_data *data)
 static void omap_gpio_mask_irq(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
@@ -685,7 +685,7 @@ static void omap_gpio_mask_irq(struct irq_data *d)
 static void omap_gpio_unmask_irq(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 	u32 trigger = irqd_get_trigger_type(d);
 	unsigned long flags;
 
@@ -769,7 +769,7 @@ static inline void omap_mpuio_init(struct gpio_bank *bank)
 
 /*---------------------------------------------------------------------*/
 
-static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int omap_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -784,7 +784,7 @@ static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void omap_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -801,7 +801,7 @@ static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
 	pm_runtime_put(chip->parent);
 }
 
-static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 
@@ -811,7 +811,7 @@ static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
+static int omap_gpio_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -823,7 +823,7 @@ static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int omap_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int omap_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	void __iomem *reg;
@@ -836,7 +836,7 @@ static int omap_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (readl_relaxed(reg) & BIT(offset)) != 0;
 }
 
-static int omap_gpio_output(struct gpio_chip *chip, unsigned offset, int value)
+static int omap_gpio_output(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -871,8 +871,8 @@ static int omap_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	return 0;
 }
 
-static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
-			      unsigned debounce)
+static int omap_gpio_debounce(struct gpio_chip *chip, unsigned int offset,
+			      unsigned int debounce)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -892,7 +892,7 @@ static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
 	return ret;
 }
 
-static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+static int omap_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				unsigned long config)
 {
 	u32 debounce;
@@ -904,7 +904,7 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	return omap_gpio_debounce(chip, offset, debounce);
 }
 
-static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void omap_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index e8e9029ba5bd..7041fc1b3066 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -24,7 +24,7 @@ struct palmas_device_data {
 	int ngpio;
 };
 
-static int palmas_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int palmas_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
@@ -55,7 +55,7 @@ static int palmas_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
+static void palmas_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			int value)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
@@ -77,7 +77,7 @@ static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
 		dev_err(gc->parent, "Reg 0x%02x write failed, %d\n", reg, ret);
 }
 
-static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
+static int palmas_gpio_output(struct gpio_chip *gc, unsigned int offset,
 				int value)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
@@ -100,7 +100,7 @@ static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
 	return ret;
 }
 
-static int palmas_gpio_input(struct gpio_chip *gc, unsigned offset)
+static int palmas_gpio_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
@@ -118,7 +118,7 @@ static int palmas_gpio_input(struct gpio_chip *gc, unsigned offset)
 	return ret;
 }
 
-static int palmas_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int palmas_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index a3b9bdedbe44..cd31e6138bbc 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -219,7 +219,7 @@ static const struct pca953x_reg_config pca957x_regs = {
 };
 
 struct pca953x_chip {
-	unsigned gpio_start;
+	unsigned int gpio_start;
 	struct mutex i2c_lock;
 	struct regmap *regmap;
 
@@ -451,7 +451,7 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
 	return 0;
 }
 
-static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
+static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned int off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off);
@@ -465,7 +465,7 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 }
 
 static int pca953x_gpio_direction_output(struct gpio_chip *gc,
-		unsigned off, int val)
+		unsigned int off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off);
@@ -486,7 +486,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	return ret;
 }
 
-static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
+static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned int off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 inreg = pca953x_recalc_addr(chip, chip->regs->input, off);
@@ -510,7 +510,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 	return !!(reg_val & bit);
 }
 
-static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
+static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned int off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off);
@@ -521,7 +521,7 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 	mutex_unlock(&chip->i2c_lock);
 }
 
-static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
+static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off);
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 14fb8f6a1ad2..0cd7e704e7e3 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -74,11 +74,11 @@ struct pcf857x {
 	struct irq_chip		irqchip;
 	struct i2c_client	*client;
 	struct mutex		lock;		/* protect 'out' */
-	unsigned		out;		/* software latch */
-	unsigned		status;		/* current status */
-	unsigned		irq_enabled;	/* enabled irqs */
+	unsigned int		out;		/* software latch */
+	unsigned int		status;		/* current status */
+	unsigned int		irq_enabled;	/* enabled irqs */
 
-	int (*write)(struct i2c_client *client, unsigned data);
+	int (*write)(struct i2c_client *client, unsigned int data);
 	int (*read)(struct i2c_client *client);
 };
 
@@ -86,7 +86,7 @@ struct pcf857x {
 
 /* Talk to 8-bit I/O expander */
 
-static int i2c_write_le8(struct i2c_client *client, unsigned data)
+static int i2c_write_le8(struct i2c_client *client, unsigned int data)
 {
 	return i2c_smbus_write_byte(client, data);
 }
@@ -98,7 +98,7 @@ static int i2c_read_le8(struct i2c_client *client)
 
 /* Talk to 16-bit I/O expander */
 
-static int i2c_write_le16(struct i2c_client *client, unsigned word)
+static int i2c_write_le16(struct i2c_client *client, unsigned int word)
 {
 	u8 buf[2] = { word & 0xff, word >> 8, };
 	int status;
@@ -120,7 +120,7 @@ static int i2c_read_le16(struct i2c_client *client)
 
 /*-------------------------------------------------------------------------*/
 
-static int pcf857x_input(struct gpio_chip *chip, unsigned offset)
+static int pcf857x_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pcf857x	*gpio = gpiochip_get_data(chip);
 	int		status;
@@ -133,7 +133,7 @@ static int pcf857x_input(struct gpio_chip *chip, unsigned offset)
 	return status;
 }
 
-static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
+static int pcf857x_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pcf857x	*gpio = gpiochip_get_data(chip);
 	int		value;
@@ -142,10 +142,10 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
 	return (value < 0) ? value : !!(value & (1 << offset));
 }
 
-static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
+static int pcf857x_output(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct pcf857x	*gpio = gpiochip_get_data(chip);
-	unsigned	bit = 1 << offset;
+	unsigned int	bit = 1 << offset;
 	int		status;
 
 	mutex_lock(&gpio->lock);
@@ -159,7 +159,7 @@ static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
 	return status;
 }
 
-static void pcf857x_set(struct gpio_chip *chip, unsigned offset, int value)
+static void pcf857x_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	pcf857x_output(chip, offset, value);
 }
diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index e96d28bf43b4..71dde7ceb7af 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -95,7 +95,7 @@ struct pch_gpio {
 	spinlock_t spinlock;
 };
 
-static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
+static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -112,14 +112,14 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 }
 
-static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
+static int pch_gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 
 	return !!(ioread32(&chip->reg->pi) & BIT(nr));
 }
 
-static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
+static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 				     int val)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -146,7 +146,7 @@ static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	return 0;
 }
 
-static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
@@ -196,7 +196,7 @@ static void __maybe_unused pch_gpio_restore_reg_conf(struct pch_gpio *chip)
 		iowrite32(chip->pch_gpio_reg.gpio_use_sel_reg, &chip->reg->gpio_use_sel);
 }
 
-static int pch_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
+static int pch_gpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct pch_gpio *chip = gpiochip_get_data(gpio);
 	return chip->irq_base + offset;
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 6698feabaced..b21a2c798404 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -62,27 +62,27 @@ static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
 }
 
 static int pisosr_gpio_get_direction(struct gpio_chip *chip,
-				     unsigned offset)
+				     unsigned int offset)
 {
 	/* This device always input */
 	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int pisosr_gpio_direction_input(struct gpio_chip *chip,
-				       unsigned offset)
+				       unsigned int offset)
 {
 	/* This device always input */
 	return 0;
 }
 
 static int pisosr_gpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
+					unsigned int offset, int value)
 {
 	/* This device is input only */
 	return -EINVAL;
 }
 
-static int pisosr_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int pisosr_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pisosr_gpio *gpio = gpiochip_get_data(chip);
 
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index f1b53dd1df1a..76f957f8327e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -60,7 +60,7 @@ struct pl061 {
 #endif
 };
 
-static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
+static int pl061_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
@@ -70,7 +70,7 @@ static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
+static int pl061_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -85,7 +85,7 @@ static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
+static int pl061_direction_output(struct gpio_chip *gc, unsigned int offset,
 		int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
@@ -108,21 +108,21 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
+static int pl061_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
 	return !!readb(pl061->base + (BIT(offset + 2)));
 }
 
-static void pl061_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static void pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
 	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
 }
 
-static int pl061_irq_type(struct irq_data *d, unsigned trigger)
+static int pl061_irq_type(struct irq_data *d, unsigned int trigger)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pl061 *pl061 = gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 0cb6600b8eee..5f8884e36869 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -166,7 +166,7 @@ static inline void __iomem *gpio_bank_base(struct gpio_chip *c, int gpio)
 }
 
 static inline struct pxa_gpio_bank *gpio_to_pxabank(struct gpio_chip *c,
-						    unsigned gpio)
+						    unsigned int gpio)
 {
 	return chip_to_pxachip(c)->banks + gpio / 32;
 }
@@ -197,7 +197,7 @@ static inline int __gpio_is_inverted(int gpio)
  * is attributed as "occupied" here (I know this terminology isn't
  * accurate, you are welcome to propose a better one :-)
  */
-static inline int __gpio_is_occupied(struct pxa_gpio_chip *pchip, unsigned gpio)
+static inline int __gpio_is_occupied(struct pxa_gpio_chip *pchip, unsigned int gpio)
 {
 	void __iomem *base;
 	unsigned long gafr = 0, gpdr = 0;
@@ -250,14 +250,14 @@ static bool pxa_gpio_has_pinctrl(void)
 	}
 }
 
-static int pxa_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int pxa_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pxa_gpio_chip *pchip = chip_to_pxachip(chip);
 
 	return irq_find_mapping(pchip->irqdomain, offset);
 }
 
-static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *base = gpio_bank_base(chip, offset);
 	uint32_t value, mask = GPIO_bit(offset);
@@ -284,7 +284,7 @@ static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 }
 
 static int pxa_gpio_direction_output(struct gpio_chip *chip,
-				     unsigned offset, int value)
+				     unsigned int offset, int value)
 {
 	void __iomem *base = gpio_bank_base(chip, offset);
 	uint32_t tmp, mask = GPIO_bit(offset);
@@ -312,7 +312,7 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int pxa_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int pxa_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *base = gpio_bank_base(chip, offset);
 	u32 gplr = readl_relaxed(base + GPLR_OFFSET);
@@ -320,7 +320,7 @@ static int pxa_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(gplr & GPIO_bit(offset));
 }
 
-static void pxa_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void pxa_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	void __iomem *base = gpio_bank_base(chip, offset);
 
diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index 4fae3ebea790..4460e1e091ae 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -59,7 +59,7 @@ static int rc5t583_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
 	return rc5t583_clear_bits(parent, RC5T583_GPIO_PGSEL, BIT(offset));
 }
 
-static int rc5t583_gpio_dir_output(struct gpio_chip *gc, unsigned offset,
+static int rc5t583_gpio_dir_output(struct gpio_chip *gc, unsigned int offset,
 			int value)
 {
 	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
@@ -75,7 +75,7 @@ static int rc5t583_gpio_dir_output(struct gpio_chip *gc, unsigned offset,
 	return rc5t583_clear_bits(parent, RC5T583_GPIO_PGSEL, BIT(offset));
 }
 
-static int rc5t583_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int rc5t583_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 
@@ -85,7 +85,7 @@ static int rc5t583_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	return -EINVAL;
 }
 
-static void rc5t583_gpio_free(struct gpio_chip *gc, unsigned offset)
+static void rc5t583_gpio_free(struct gpio_chip *gc, unsigned int offset)
 {
 	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index eac1582c70da..e1c5953132c2 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -244,7 +244,7 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 	spin_unlock_irqrestore(&p->lock, flags);
 }
 
-static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
+static int gpio_rcar_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	int error;
@@ -262,7 +262,7 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 	return error;
 }
 
-static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
+static void gpio_rcar_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 
@@ -287,13 +287,13 @@ static int gpio_rcar_get_direction(struct gpio_chip *chip, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned offset)
+static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	gpio_rcar_config_general_input_output_mode(chip, offset, false);
 	return 0;
 }
 
-static int gpio_rcar_get(struct gpio_chip *chip, unsigned offset)
+static int gpio_rcar_get(struct gpio_chip *chip, unsigned int offset)
 {
 	u32 bit = BIT(offset);
 
@@ -305,7 +305,7 @@ static int gpio_rcar_get(struct gpio_chip *chip, unsigned offset)
 		return !!(gpio_rcar_read(gpiochip_get_data(chip), INDT) & bit);
 }
 
-static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
+static void gpio_rcar_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -337,7 +337,7 @@ static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	spin_unlock_irqrestore(&p->lock, flags);
 }
 
-static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
+static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned int offset,
 				      int value)
 {
 	/* write GPIO value to output before selecting output mode of pin */
diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index 01ed2517e9fd..61d633b33f2a 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -27,7 +27,7 @@ struct rdc321x_gpio {
 };
 
 /* read GPIO pin */
-static int rdc_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
+static int rdc_gpio_get_value(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct rdc321x_gpio *gpch;
 	u32 value = 0;
@@ -46,7 +46,7 @@ static int rdc_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 }
 
 static void rdc_gpio_set_value_impl(struct gpio_chip *chip,
-				unsigned gpio, int value)
+				unsigned int gpio, int value)
 {
 	struct rdc321x_gpio *gpch;
 	int reg = (gpio < 32) ? 0 : 1;
@@ -65,7 +65,7 @@ static void rdc_gpio_set_value_impl(struct gpio_chip *chip,
 
 /* set GPIO pin to value */
 static void rdc_gpio_set_value(struct gpio_chip *chip,
-				unsigned gpio, int value)
+				unsigned int gpio, int value)
 {
 	struct rdc321x_gpio *gpch;
 
@@ -76,7 +76,7 @@ static void rdc_gpio_set_value(struct gpio_chip *chip,
 }
 
 static int rdc_gpio_config(struct gpio_chip *chip,
-				unsigned gpio, int value)
+				unsigned int gpio, int value)
 {
 	struct rdc321x_gpio *gpch;
 	int err;
@@ -106,7 +106,7 @@ static int rdc_gpio_config(struct gpio_chip *chip,
 }
 
 /* configure GPIO pin as input */
-static int rdc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+static int rdc_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	return rdc_gpio_config(chip, gpio, 1);
 }
diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index d35169bde25a..98766574fa10 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -22,7 +22,7 @@ struct gpio_reg {
 
 #define to_gpio_reg(x) container_of(x, struct gpio_reg, gc)
 
-static int gpio_reg_get_direction(struct gpio_chip *gc, unsigned offset)
+static int gpio_reg_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 
@@ -30,7 +30,7 @@ static int gpio_reg_get_direction(struct gpio_chip *gc, unsigned offset)
 					    GPIO_LINE_DIRECTION_OUT;
 }
 
-static int gpio_reg_direction_output(struct gpio_chip *gc, unsigned offset,
+static int gpio_reg_direction_output(struct gpio_chip *gc, unsigned int offset,
 	int value)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
@@ -42,14 +42,14 @@ static int gpio_reg_direction_output(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int gpio_reg_direction_input(struct gpio_chip *gc, unsigned offset)
+static int gpio_reg_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 
 	return r->direction & BIT(offset) ? 0 : -ENOTSUPP;
 }
 
-static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
+static void gpio_reg_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	unsigned long flags;
@@ -66,7 +66,7 @@ static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
 	spin_unlock_irqrestore(&r->lock, flags);
 }
 
-static int gpio_reg_get(struct gpio_chip *gc, unsigned offset)
+static int gpio_reg_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	u32 val, mask = BIT(offset);
@@ -96,7 +96,7 @@ static void gpio_reg_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	spin_unlock_irqrestore(&r->lock, flags);
 }
 
-static int gpio_reg_to_irq(struct gpio_chip *gc, unsigned offset)
+static int gpio_reg_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	int irq = r->irqs[offset];
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index edff5e81489f..92e0dd5d022c 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -36,20 +36,20 @@ enum {
 	R_GAFR = 0x1c,
 };
 
-static int sa1100_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int sa1100_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	return readl_relaxed(sa1100_gpio_chip(chip)->membase + R_GPLR) &
 		BIT(offset);
 }
 
-static void sa1100_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void sa1100_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	int reg = value ? R_GPSR : R_GPCR;
 
 	writel_relaxed(BIT(offset), sa1100_gpio_chip(chip)->membase + reg);
 }
 
-static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
+static int sa1100_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gpdr = sa1100_gpio_chip(chip)->membase + R_GPDR;
 
@@ -59,7 +59,7 @@ static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int sa1100_direction_input(struct gpio_chip *chip, unsigned offset)
+static int sa1100_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gpdr = sa1100_gpio_chip(chip)->membase + R_GPDR;
 	unsigned long flags;
@@ -71,7 +71,7 @@ static int sa1100_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int sa1100_direction_output(struct gpio_chip *chip, unsigned offset, int value)
+static int sa1100_direction_output(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	void __iomem *gpdr = sa1100_gpio_chip(chip)->membase + R_GPDR;
 	unsigned long flags;
@@ -84,7 +84,7 @@ static int sa1100_direction_output(struct gpio_chip *chip, unsigned offset, int
 	return 0;
 }
 
-static int sa1100_to_irq(struct gpio_chip *chip, unsigned offset)
+static int sa1100_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	return sa1100_gpio_chip(chip)->irqbase + offset;
 }
diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index c65f35b68202..d7cade67717b 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -26,10 +26,10 @@ struct sch_gpio {
 	unsigned short resume_base;
 };
 
-static unsigned sch_gpio_offset(struct sch_gpio *sch, unsigned gpio,
-				unsigned reg)
+static unsigned int sch_gpio_offset(struct sch_gpio *sch, unsigned int gpio,
+				unsigned int reg)
 {
-	unsigned base = 0;
+	unsigned int base = 0;
 
 	if (gpio >= sch->resume_base) {
 		gpio -= sch->resume_base;
@@ -39,14 +39,14 @@ static unsigned sch_gpio_offset(struct sch_gpio *sch, unsigned gpio,
 	return base + reg + gpio / 8;
 }
 
-static unsigned sch_gpio_bit(struct sch_gpio *sch, unsigned gpio)
+static unsigned int sch_gpio_bit(struct sch_gpio *sch, unsigned int gpio)
 {
 	if (gpio >= sch->resume_base)
 		gpio -= sch->resume_base;
 	return gpio % 8;
 }
 
-static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned gpio, unsigned reg)
+static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned int gpio, unsigned int reg)
 {
 	unsigned short offset, bit;
 	u8 reg_val;
@@ -59,7 +59,7 @@ static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned gpio, unsigned reg)
 	return reg_val;
 }
 
-static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned gpio, unsigned reg,
+static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned int gpio, unsigned int reg,
 			     int val)
 {
 	unsigned short offset, bit;
@@ -76,7 +76,7 @@ static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned gpio, unsigned reg,
 		outb((reg_val & ~BIT(bit)), sch->iobase + offset);
 }
 
-static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
@@ -86,13 +86,13 @@ static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned gpio_num)
 	return 0;
 }
 
-static int sch_gpio_get(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 	return sch_gpio_reg_get(sch, gpio_num, GLV);
 }
 
-static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
+static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
@@ -101,7 +101,7 @@ static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
 	spin_unlock(&sch->lock);
 }
 
-static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned gpio_num,
+static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
 				  int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
@@ -123,7 +123,7 @@ static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned gpio_num,
 	return 0;
 }
 
-static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index da01e1cad7cb..ef0f4cfaa9cd 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -129,7 +129,7 @@ static inline void sch311x_sio_outb(int sio_config_port, int reg, int val)
  *	GPIO functions
  */
 
-static int sch311x_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int sch311x_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
@@ -145,7 +145,7 @@ static int sch311x_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void sch311x_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void sch311x_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
@@ -155,7 +155,7 @@ static void sch311x_gpio_free(struct gpio_chip *chip, unsigned offset)
 	release_region(block->runtime_reg + block->config_regs[offset], 1);
 }
 
-static int sch311x_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int sch311x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 	u8 data;
@@ -168,7 +168,7 @@ static int sch311x_gpio_get(struct gpio_chip *chip, unsigned offset)
 }
 
 static void __sch311x_gpio_set(struct sch311x_gpio_block *block,
-			       unsigned offset, int value)
+			       unsigned int offset, int value)
 {
 	u8 data = inb(block->runtime_reg + block->data_reg);
 	if (value)
@@ -178,7 +178,7 @@ static void __sch311x_gpio_set(struct sch311x_gpio_block *block,
 	outb(data, block->runtime_reg + block->data_reg);
 }
 
-static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset,
+static void sch311x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			     int value)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
@@ -188,7 +188,7 @@ static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset,
 	spin_unlock(&block->lock);
 }
 
-static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 	u8 data;
@@ -202,7 +202,7 @@ static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int sch311x_gpio_direction_out(struct gpio_chip *chip, unsigned offset,
+static int sch311x_gpio_direction_out(struct gpio_chip *chip, unsigned int offset,
 				      int value)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
@@ -219,7 +219,7 @@ static int sch311x_gpio_direction_out(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static int sch311x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int sch311x_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 	u8 data;
@@ -234,7 +234,7 @@ static int sch311x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int sch311x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+static int sch311x_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				   unsigned long config)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 6eca531b7d96..6cc321703711 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -55,12 +55,12 @@ struct spear_spics {
 };
 
 /* gpio framework specific routines */
-static int spics_get_value(struct gpio_chip *chip, unsigned offset)
+static int spics_get_value(struct gpio_chip *chip, unsigned int offset)
 {
 	return -ENXIO;
 }
 
-static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
+static void spics_set_value(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
@@ -79,19 +79,19 @@ static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 	writel_relaxed(tmp, spics->base + spics->perip_cfg);
 }
 
-static int spics_direction_input(struct gpio_chip *chip, unsigned offset)
+static int spics_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	return -ENXIO;
 }
 
-static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
+static int spics_direction_output(struct gpio_chip *chip, unsigned int offset,
 		int value)
 {
 	spics_set_value(chip, offset, value);
 	return 0;
 }
 
-static int spics_request(struct gpio_chip *chip, unsigned offset)
+static int spics_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
@@ -106,7 +106,7 @@ static int spics_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void spics_free(struct gpio_chip *chip, unsigned offset)
+static void spics_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
index a74bb97a41e2..d1d2ecd6188f 100644
--- a/drivers/gpio/gpio-sta2x11.c
+++ b/drivers/gpio/gpio-sta2x11.c
@@ -43,14 +43,14 @@ struct gsta_gpio {
 	struct gpio_chip		gpio;
 	int				irq_base;
 	/* FIXME: save the whole config here (AF, ...) */
-	unsigned			irq_type[GSTA_NR_GPIO];
+	unsigned int			irq_type[GSTA_NR_GPIO];
 };
 
 /*
  * gpio methods
  */
 
-static void gsta_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
+static void gsta_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	struct gsta_regs __iomem *regs = chip->regs[nr / GSTA_GPIO_PER_BLOCK];
@@ -62,7 +62,7 @@ static void gsta_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 		writel(bit, &regs->datc);
 }
 
-static int gsta_gpio_get(struct gpio_chip *gpio, unsigned nr)
+static int gsta_gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	struct gsta_regs __iomem *regs = chip->regs[nr / GSTA_GPIO_PER_BLOCK];
@@ -71,7 +71,7 @@ static int gsta_gpio_get(struct gpio_chip *gpio, unsigned nr)
 	return !!(readl(&regs->dat) & bit);
 }
 
-static int gsta_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
+static int gsta_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 				      int val)
 {
 	struct gsta_gpio *chip = gpiochip_get_data(gpio);
@@ -87,7 +87,7 @@ static int gsta_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	return 0;
 }
 
-static int gsta_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int gsta_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	struct gsta_regs __iomem *regs = chip->regs[nr / GSTA_GPIO_PER_BLOCK];
@@ -97,7 +97,7 @@ static int gsta_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	return 0;
 }
 
-static int gsta_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
+static int gsta_gpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	return chip->irq_base + offset;
@@ -141,7 +141,7 @@ static void gsta_gpio_setup(struct gsta_gpio *chip) /* called from probe */
  * FIXME : this functionality shall be managed (and exported to other drivers)
  * via the pin control subsystem.
  */
-static void gsta_set_config(struct gsta_gpio *chip, int nr, unsigned cfg)
+static void gsta_set_config(struct gsta_gpio *chip, int nr, unsigned int cfg)
 {
 	struct gsta_regs __iomem *regs = chip->regs[nr / GSTA_GPIO_PER_BLOCK];
 	unsigned long flags;
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 542706a852e6..381d716367fd 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -38,7 +38,7 @@ struct stmpe_gpio {
 	u8 oldregs[CACHE_NR_REGS][CACHE_NR_BANKS];
 };
 
-static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int stmpe_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -53,7 +53,7 @@ static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(ret & mask);
 }
 
-static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static void stmpe_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -72,7 +72,7 @@ static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 }
 
 static int stmpe_gpio_get_direction(struct gpio_chip *chip,
-				    unsigned offset)
+				    unsigned int offset)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -91,7 +91,7 @@ static int stmpe_gpio_get_direction(struct gpio_chip *chip,
 }
 
 static int stmpe_gpio_direction_output(struct gpio_chip *chip,
-					 unsigned offset, int val)
+					 unsigned int offset, int val)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -104,7 +104,7 @@ static int stmpe_gpio_direction_output(struct gpio_chip *chip,
 }
 
 static int stmpe_gpio_direction_input(struct gpio_chip *chip,
-					unsigned offset)
+					unsigned int offset)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -114,7 +114,7 @@ static int stmpe_gpio_direction_input(struct gpio_chip *chip,
 	return stmpe_set_bits(stmpe, reg, mask, 0);
 }
 
-static int stmpe_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int stmpe_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -249,7 +249,7 @@ static void stmpe_gpio_irq_unmask(struct irq_data *d)
 
 static void stmpe_dbg_show_one(struct seq_file *s,
 			       struct gpio_chip *gc,
-			       unsigned offset, unsigned gpio)
+			       unsigned int offset, unsigned int gpio)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -348,8 +348,8 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 static void stmpe_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 {
-	unsigned i;
-	unsigned gpio = gc->base;
+	unsigned int i;
+	unsigned int gpio = gc->base;
 
 	for (i = 0; i < gc->ngpio; i++, gpio++) {
 		stmpe_dbg_show_one(s, gc, i, gpio);
diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 9e23a5ae8108..d9842610b0c2 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -105,7 +105,7 @@ static int xway_stp_get(struct gpio_chip *gc, unsigned int gpio)
  *
  * Set the shadow value and call ltq_ebu_apply.
  */
-static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
+static void xway_stp_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct xway_stp *chip = gpiochip_get_data(gc);
 
@@ -125,7 +125,7 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
  *
  * Same as xway_stp_set, always returns 0.
  */
-static int xway_stp_dir_out(struct gpio_chip *gc, unsigned gpio, int val)
+static int xway_stp_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	xway_stp_set(gc, gpio, val);
 
@@ -139,7 +139,7 @@ static int xway_stp_dir_out(struct gpio_chip *gc, unsigned gpio, int val)
  *
  * We mask out the HW driven pins
  */
-static int xway_stp_request(struct gpio_chip *gc, unsigned gpio)
+static int xway_stp_request(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct xway_stp *chip = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 31f332074d7d..fdca04a3bee3 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -44,7 +44,7 @@ struct syscon_gpio_data {
 	unsigned int	dat_bit_offset;
 	unsigned int	dir_bit_offset;
 	void		(*set)(struct gpio_chip *chip,
-			       unsigned offset, int value);
+			       unsigned int offset, int value);
 };
 
 struct syscon_gpio_priv {
@@ -55,7 +55,7 @@ struct syscon_gpio_priv {
 	u32				dir_reg_offset;
 };
 
-static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int syscon_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int val, offs;
@@ -71,7 +71,7 @@ static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offs % SYSCON_REG_BITS));
 }
 
-static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static void syscon_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -84,7 +84,7 @@ static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 			   val ? BIT(offs % SYSCON_REG_BITS) : 0);
 }
 
-static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
+static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned int offset)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 
@@ -102,7 +102,7 @@ static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
+static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 
@@ -160,7 +160,7 @@ static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
 
 #define KEYSTONE_LOCK_BIT BIT(0)
 
-static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static void keystone_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 866201cf5f65..25352c61b8d7 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -72,7 +72,7 @@ static inline void tb10x_set_bits(struct tb10x_gpio *gpio, unsigned int offs,
 	spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
 }
 
-static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
 
diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index de14949a3fe5..3f28947fe844 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -39,8 +39,8 @@ struct timbgpio {
 	unsigned long		last_ier;
 };
 
-static int timbgpio_update_bit(struct gpio_chip *gpio, unsigned index,
-	unsigned offset, bool enabled)
+static int timbgpio_update_bit(struct gpio_chip *gpio, unsigned int index,
+	unsigned int offset, bool enabled)
 {
 	struct timbgpio *tgpio = gpiochip_get_data(gpio);
 	u32 reg;
@@ -59,12 +59,12 @@ static int timbgpio_update_bit(struct gpio_chip *gpio, unsigned index,
 	return 0;
 }
 
-static int timbgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int timbgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	return timbgpio_update_bit(gpio, nr, TGPIODIR, true);
 }
 
-static int timbgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
+static int timbgpio_gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct timbgpio *tgpio = gpiochip_get_data(gpio);
 	u32 value;
@@ -74,18 +74,18 @@ static int timbgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
 }
 
 static int timbgpio_gpio_direction_output(struct gpio_chip *gpio,
-						unsigned nr, int val)
+						unsigned int nr, int val)
 {
 	return timbgpio_update_bit(gpio, nr, TGPIODIR, false);
 }
 
 static void timbgpio_gpio_set(struct gpio_chip *gpio,
-				unsigned nr, int val)
+				unsigned int nr, int val)
 {
 	timbgpio_update_bit(gpio, nr, TGPIOVAL, val != 0);
 }
 
-static int timbgpio_to_irq(struct gpio_chip *gpio, unsigned offset)
+static int timbgpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct timbgpio *tgpio = gpiochip_get_data(gpio);
 
@@ -122,7 +122,7 @@ static void timbgpio_irq_enable(struct irq_data *d)
 	spin_unlock_irqrestore(&tgpio->lock, flags);
 }
 
-static int timbgpio_irq_type(struct irq_data *d, unsigned trigger)
+static int timbgpio_irq_type(struct irq_data *d, unsigned int trigger)
 {
 	struct timbgpio *tgpio = irq_data_get_irq_chip_data(d);
 	int offset = d->irq - tgpio->irq_base;
diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index 99d5a84a9129..f542a03e21cb 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -33,24 +33,24 @@ struct tpic2810 {
 	struct mutex lock;
 };
 
-static void tpic2810_set(struct gpio_chip *chip, unsigned offset, int value);
+static void tpic2810_set(struct gpio_chip *chip, unsigned int offset, int value);
 
 static int tpic2810_get_direction(struct gpio_chip *chip,
-				  unsigned offset)
+				  unsigned int offset)
 {
 	/* This device always output */
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int tpic2810_direction_input(struct gpio_chip *chip,
-				    unsigned offset)
+				    unsigned int offset)
 {
 	/* This device is output only */
 	return -EINVAL;
 }
 
 static int tpic2810_direction_output(struct gpio_chip *chip,
-				     unsigned offset, int value)
+				     unsigned int offset, int value)
 {
 	/* This device always output */
 	tpic2810_set(chip, offset, value);
@@ -76,7 +76,7 @@ static void tpic2810_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
 	mutex_unlock(&gpio->lock);
 }
 
-static void tpic2810_set(struct gpio_chip *chip, unsigned offset, int value)
+static void tpic2810_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	tpic2810_set_mask_bits(chip, BIT(offset), value ? BIT(offset) : 0);
 }
diff --git a/drivers/gpio/gpio-tps65086.c b/drivers/gpio/gpio-tps65086.c
index 1e9d8262d0ff..152bc99cb3a0 100644
--- a/drivers/gpio/gpio-tps65086.c
+++ b/drivers/gpio/gpio-tps65086.c
@@ -18,21 +18,21 @@ struct tps65086_gpio {
 };
 
 static int tps65086_gpio_get_direction(struct gpio_chip *chip,
-				       unsigned offset)
+				       unsigned int offset)
 {
 	/* This device is output only */
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int tps65086_gpio_direction_input(struct gpio_chip *chip,
-					 unsigned offset)
+					 unsigned int offset)
 {
 	/* This device is output only */
 	return -EINVAL;
 }
 
 static int tps65086_gpio_direction_output(struct gpio_chip *chip,
-					  unsigned offset, int value)
+					  unsigned int offset, int value)
 {
 	struct tps65086_gpio *gpio = gpiochip_get_data(chip);
 
@@ -43,7 +43,7 @@ static int tps65086_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int tps65086_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int tps65086_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tps65086_gpio *gpio = gpiochip_get_data(chip);
 	int ret, val;
@@ -55,7 +55,7 @@ static int tps65086_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return val & BIT(4 + offset);
 }
 
-static void tps65086_gpio_set(struct gpio_chip *chip, unsigned offset,
+static void tps65086_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			      int value)
 {
 	struct tps65086_gpio *gpio = gpiochip_get_data(chip);
diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 43a1150055ce..dcee15f4467f 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -20,7 +20,7 @@ struct tps65218_gpio {
 	struct gpio_chip gpio_chip;
 };
 
-static int tps65218_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int tps65218_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
 	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
@@ -34,7 +34,7 @@ static int tps65218_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & (TPS65218_ENABLE2_GPIO1 << offset));
 }
 
-static void tps65218_gpio_set(struct gpio_chip *gc, unsigned offset,
+static void tps65218_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			      int value)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
@@ -51,7 +51,7 @@ static void tps65218_gpio_set(struct gpio_chip *gc, unsigned offset,
 				    TPS65218_PROTECT_L1);
 }
 
-static int tps65218_gpio_output(struct gpio_chip *gc, unsigned offset,
+static int tps65218_gpio_output(struct gpio_chip *gc, unsigned int offset,
 				int value)
 {
 	/* Only drives GPOs */
@@ -59,12 +59,12 @@ static int tps65218_gpio_output(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int tps65218_gpio_input(struct gpio_chip *gc, unsigned offset)
+static int tps65218_gpio_input(struct gpio_chip *gc, unsigned int offset)
 {
 	return -EPERM;
 }
 
-static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
+static int tps65218_gpio_request(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
 	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
@@ -135,7 +135,7 @@ static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static int tps65218_gpio_set_config(struct gpio_chip *gc, unsigned offset,
+static int tps65218_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				    unsigned long config)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index 9b6cc74f47c8..644c21a54183 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -27,7 +27,7 @@ struct tps6586x_gpio {
 	struct device *parent;
 };
 
-static int tps6586x_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int tps6586x_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 	uint8_t val;
@@ -40,7 +40,7 @@ static int tps6586x_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & (1 << offset));
 }
 
-static void tps6586x_gpio_set(struct gpio_chip *gc, unsigned offset,
+static void tps6586x_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			      int value)
 {
 	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
@@ -49,7 +49,7 @@ static void tps6586x_gpio_set(struct gpio_chip *gc, unsigned offset,
 			value << offset, 1 << offset);
 }
 
-static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned offset,
+static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned int offset,
 				int value)
 {
 	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
@@ -64,7 +64,7 @@ static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned offset,
 				val, mask);
 }
 
-static int tps6586x_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int tps6586x_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 0c785b0fd161..a352811cafde 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -22,7 +22,7 @@ struct tps65910_gpio {
 	struct tps65910 *tps65910;
 };
 
-static int tps65910_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int tps65910_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
@@ -36,7 +36,7 @@ static int tps65910_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static void tps65910_gpio_set(struct gpio_chip *gc, unsigned offset,
+static void tps65910_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			      int value)
 {
 	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
@@ -50,7 +50,7 @@ static void tps65910_gpio_set(struct gpio_chip *gc, unsigned offset,
 						GPIO_SET_MASK);
 }
 
-static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
+static int tps65910_gpio_output(struct gpio_chip *gc, unsigned int offset,
 				int value)
 {
 	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
@@ -63,7 +63,7 @@ static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
 						GPIO_CFG_MASK);
 }
 
-static int tps65910_gpio_input(struct gpio_chip *gc, unsigned offset)
+static int tps65910_gpio_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index 510d9ed9fd2a..754182b65056 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -21,7 +21,7 @@ struct tps65912_gpio {
 };
 
 static int tps65912_gpio_get_direction(struct gpio_chip *gc,
-				       unsigned offset)
+				       unsigned int offset)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
 
@@ -37,7 +37,7 @@ static int tps65912_gpio_get_direction(struct gpio_chip *gc,
 		return GPIO_LINE_DIRECTION_IN;
 }
 
-static int tps65912_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+static int tps65912_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
 
@@ -46,7 +46,7 @@ static int tps65912_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 }
 
 static int tps65912_gpio_direction_output(struct gpio_chip *gc,
-					  unsigned offset, int value)
+					  unsigned int offset, int value)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
 
@@ -58,7 +58,7 @@ static int tps65912_gpio_direction_output(struct gpio_chip *gc,
 				  GPIO_CFG_MASK, GPIO_CFG_MASK);
 }
 
-static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int tps65912_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
 	int ret, val;
@@ -73,7 +73,7 @@ static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
+static void tps65912_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			      int value)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
index c91890488402..5f0bcd6e7216 100644
--- a/drivers/gpio/gpio-ts5500.c
+++ b/drivers/gpio/gpio-ts5500.c
@@ -195,7 +195,7 @@ static inline void ts5500_clear_mask(u8 mask, u8 addr)
 	outb(val, addr);
 }
 
-static int ts5500_gpio_input(struct gpio_chip *chip, unsigned offset)
+static int ts5500_gpio_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
@@ -214,7 +214,7 @@ static int ts5500_gpio_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int ts5500_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int ts5500_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
@@ -222,7 +222,7 @@ static int ts5500_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(inb(line.value_addr) & line.value_mask);
 }
 
-static int ts5500_gpio_output(struct gpio_chip *chip, unsigned offset, int val)
+static int ts5500_gpio_output(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
@@ -244,7 +244,7 @@ static int ts5500_gpio_output(struct gpio_chip *chip, unsigned offset, int val)
 	return 0;
 }
 
-static void ts5500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static void ts5500_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
@@ -258,7 +258,7 @@ static void ts5500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-static int ts5500_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int ts5500_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio *block = priv->pinout;
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index de249726230e..a1870c1cfd10 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -202,7 +202,7 @@ static int twl4030_get_gpio_datain(int gpio)
 
 /*----------------------------------------------------------------------*/
 
-static int twl_request(struct gpio_chip *chip, unsigned offset)
+static int twl_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int status = 0;
@@ -270,7 +270,7 @@ static int twl_request(struct gpio_chip *chip, unsigned offset)
 	return status;
 }
 
-static void twl_free(struct gpio_chip *chip, unsigned offset)
+static void twl_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 
@@ -290,7 +290,7 @@ static void twl_free(struct gpio_chip *chip, unsigned offset)
 	mutex_unlock(&priv->mutex);
 }
 
-static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
+static int twl_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret;
@@ -309,7 +309,7 @@ static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static int twl_get(struct gpio_chip *chip, unsigned offset)
+static int twl_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret;
@@ -332,7 +332,7 @@ static int twl_get(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
+static void twl_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 
@@ -350,7 +350,7 @@ static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
 	mutex_unlock(&priv->mutex);
 }
 
-static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
+static int twl_direction_out(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret = 0;
@@ -376,7 +376,7 @@ static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
 	return ret;
 }
 
-static int twl_get_direction(struct gpio_chip *chip, unsigned offset)
+static int twl_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	/*
@@ -398,7 +398,7 @@ static int twl_get_direction(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static int twl_to_irq(struct gpio_chip *chip, unsigned offset)
+static int twl_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 
@@ -426,14 +426,14 @@ static const struct gpio_chip template_chip = {
 static int gpio_twl4030_pulls(u32 ups, u32 downs)
 {
 	u8		message[5];
-	unsigned	i, gpio_bit;
+	unsigned int	i, gpio_bit;
 
 	/* For most pins, a pulldown was enabled by default.
 	 * We should have data that's specific to this board.
 	 */
 	for (gpio_bit = 1, i = 0; i < 5; i++) {
 		u8		bit_mask;
-		unsigned	j;
+		unsigned int	j;
 
 		for (bit_mask = 0, j = 0; j < 8; j += 2, gpio_bit <<= 1) {
 			if (ups & gpio_bit)
diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index 648fb418d775..a9fc6b2eb4c4 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -20,7 +20,7 @@
 
 #include <linux/mfd/twl6040.h>
 
-static int twl6040gpo_get(struct gpio_chip *chip, unsigned offset)
+static int twl6040gpo_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct twl6040 *twl6040 = dev_get_drvdata(chip->parent->parent);
 	int ret = 0;
@@ -32,19 +32,19 @@ static int twl6040gpo_get(struct gpio_chip *chip, unsigned offset)
 	return !!(ret & BIT(offset));
 }
 
-static int twl6040gpo_get_direction(struct gpio_chip *chip, unsigned offset)
+static int twl6040gpo_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
+static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned int offset,
 				    int value)
 {
 	/* This only drives GPOs, and can't change direction */
 	return 0;
 }
 
-static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, int value)
+static void twl6040gpo_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct twl6040 *twl6040 = dev_get_drvdata(chip->parent->parent);
 	int ret;
diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index d2a8644864c3..a03ca6bff580 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -8,7 +8,7 @@
 #include <linux/module.h>
 #include <linux/ucb1400.h>
 
-static int ucb1400_gpio_dir_in(struct gpio_chip *gc, unsigned off)
+static int ucb1400_gpio_dir_in(struct gpio_chip *gc, unsigned int off)
 {
 	struct ucb1400_gpio *gpio;
 	gpio = gpiochip_get_data(gc);
@@ -16,7 +16,7 @@ static int ucb1400_gpio_dir_in(struct gpio_chip *gc, unsigned off)
 	return 0;
 }
 
-static int ucb1400_gpio_dir_out(struct gpio_chip *gc, unsigned off, int val)
+static int ucb1400_gpio_dir_out(struct gpio_chip *gc, unsigned int off, int val)
 {
 	struct ucb1400_gpio *gpio;
 	gpio = gpiochip_get_data(gc);
@@ -25,7 +25,7 @@ static int ucb1400_gpio_dir_out(struct gpio_chip *gc, unsigned off, int val)
 	return 0;
 }
 
-static int ucb1400_gpio_get(struct gpio_chip *gc, unsigned off)
+static int ucb1400_gpio_get(struct gpio_chip *gc, unsigned int off)
 {
 	struct ucb1400_gpio *gpio;
 
@@ -33,7 +33,7 @@ static int ucb1400_gpio_get(struct gpio_chip *gc, unsigned off)
 	return !!ucb1400_gpio_get_value(gpio->ac97, off);
 }
 
-static void ucb1400_gpio_set(struct gpio_chip *gc, unsigned off, int val)
+static void ucb1400_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
 {
 	struct ucb1400_gpio *gpio;
 	gpio = gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 58776f2d69ff..3769866dbd77 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -105,7 +105,7 @@ static void vf610_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	vf610_gpio_writel(mask, port->gpio_base + offset);
 }
 
-static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(chip);
 	unsigned long mask = BIT(gpio);
@@ -120,7 +120,7 @@ static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	return pinctrl_gpio_direction_input(chip->base + gpio);
 }
 
-static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
+static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				       int value)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(chip);
diff --git a/drivers/gpio/gpio-vr41xx.c b/drivers/gpio/gpio-vr41xx.c
index 98cd715ccc33..faf5c2030c46 100644
--- a/drivers/gpio/gpio-vr41xx.c
+++ b/drivers/gpio/gpio-vr41xx.c
@@ -323,7 +323,7 @@ void vr41xx_set_irq_level(unsigned int pin, irq_level_t level)
 }
 EXPORT_SYMBOL_GPL(vr41xx_set_irq_level);
 
-static int giu_set_direction(struct gpio_chip *chip, unsigned pin, int dir)
+static int giu_set_direction(struct gpio_chip *chip, unsigned int pin, int dir)
 {
 	u16 offset, mask, reg;
 	unsigned long flags;
@@ -371,7 +371,7 @@ static int giu_set_direction(struct gpio_chip *chip, unsigned pin, int dir)
 	return 0;
 }
 
-static int vr41xx_gpio_get(struct gpio_chip *chip, unsigned pin)
+static int vr41xx_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	u16 reg, mask;
 
@@ -398,7 +398,7 @@ static int vr41xx_gpio_get(struct gpio_chip *chip, unsigned pin)
 	return 0;
 }
 
-static void vr41xx_gpio_set(struct gpio_chip *chip, unsigned pin,
+static void vr41xx_gpio_set(struct gpio_chip *chip, unsigned int pin,
 			    int value)
 {
 	u16 offset, mask, reg;
@@ -434,12 +434,12 @@ static void vr41xx_gpio_set(struct gpio_chip *chip, unsigned pin,
 }
 
 
-static int vr41xx_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int vr41xx_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	return giu_set_direction(chip, offset, GPIO_INPUT);
 }
 
-static int vr41xx_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+static int vr41xx_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				int value)
 {
 	vr41xx_gpio_set(chip, offset, value);
@@ -447,7 +447,7 @@ static int vr41xx_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return giu_set_direction(chip, offset, GPIO_OUTPUT);
 }
 
-static int vr41xx_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int vr41xx_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	if (offset >= chip->ngpio)
 		return -EINVAL;
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index a3a32a77041f..63c85978fe66 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -26,7 +26,7 @@ struct wm831x_gpio {
 	struct gpio_chip gpio_chip;
 };
 
-static int wm831x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+static int wm831x_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
@@ -40,7 +40,7 @@ static int wm831x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 			       WM831X_GPN_FN_MASK, val);
 }
 
-static int wm831x_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int wm831x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
@@ -56,7 +56,7 @@ static int wm831x_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return 0;
 }
 
-static void wm831x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void wm831x_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
@@ -66,7 +66,7 @@ static void wm831x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 }
 
 static int wm831x_gpio_direction_out(struct gpio_chip *chip,
-				     unsigned offset, int value)
+				     unsigned int offset, int value)
 {
 	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
@@ -88,7 +88,7 @@ static int wm831x_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
-static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
@@ -97,8 +97,8 @@ static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 				  WM831X_IRQ_GPIO_1 + offset);
 }
 
-static int wm831x_gpio_set_debounce(struct wm831x *wm831x, unsigned offset,
-				    unsigned debounce)
+static int wm831x_gpio_set_debounce(struct wm831x *wm831x, unsigned int offset,
+				    unsigned int debounce)
 {
 	int reg = WM831X_GPIO1_CONTROL + offset;
 	int ret, fn;
diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 460f0a4b04bd..28e46807553c 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -24,7 +24,7 @@ struct wm8350_gpio_data {
 	struct gpio_chip gpio_chip;
 };
 
-static int wm8350_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+static int wm8350_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
@@ -33,7 +33,7 @@ static int wm8350_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 			       1 << offset);
 }
 
-static int wm8350_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int wm8350_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
@@ -49,7 +49,7 @@ static int wm8350_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return 0;
 }
 
-static void wm8350_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void wm8350_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
@@ -61,7 +61,7 @@ static void wm8350_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 }
 
 static int wm8350_gpio_direction_out(struct gpio_chip *chip,
-				     unsigned offset, int value)
+				     unsigned int offset, int value)
 {
 	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
@@ -78,7 +78,7 @@ static int wm8350_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
-static int wm8350_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int wm8350_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index 9af89cf7f6bc..42ffca2118f4 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -27,7 +27,7 @@ struct wm8994_gpio {
 	struct gpio_chip gpio_chip;
 };
 
-static int wm8994_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int wm8994_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
@@ -50,7 +50,7 @@ static int wm8994_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int wm8994_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
+static int wm8994_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
@@ -59,7 +59,7 @@ static int wm8994_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 			       WM8994_GPN_DIR, WM8994_GPN_DIR);
 }
 
-static int wm8994_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int wm8994_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
@@ -76,7 +76,7 @@ static int wm8994_gpio_get(struct gpio_chip *chip, unsigned offset)
 }
 
 static int wm8994_gpio_direction_out(struct gpio_chip *chip,
-				     unsigned offset, int value)
+				     unsigned int offset, int value)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
@@ -88,7 +88,7 @@ static int wm8994_gpio_direction_out(struct gpio_chip *chip,
 			       WM8994_GPN_DIR | WM8994_GPN_LVL, value);
 }
 
-static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void wm8994_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
@@ -120,7 +120,7 @@ static int wm8994_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	return -ENOTSUPP;
 }
 
-static int wm8994_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int wm8994_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index cb510df2b014..6c4368055a9b 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -47,14 +47,14 @@ struct ws16c48_gpio {
 	raw_spinlock_t lock;
 	unsigned long irq_mask;
 	unsigned long flow_mask;
-	unsigned base;
+	unsigned int base;
 };
 
-static int ws16c48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int ws16c48_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
 
 	if (ws16c48gpio->io_state[port] & mask)
 		return GPIO_LINE_DIRECTION_IN;
@@ -62,11 +62,11 @@ static int ws16c48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int ws16c48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int ws16c48_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
@@ -81,11 +81,11 @@ static int ws16c48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 }
 
 static int ws16c48_gpio_direction_output(struct gpio_chip *chip,
-	unsigned offset, int value)
+	unsigned int offset, int value)
 {
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
@@ -102,13 +102,13 @@ static int ws16c48_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int ws16c48_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int ws16c48_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
 	unsigned long flags;
-	unsigned port_state;
+	unsigned int port_state;
 
 	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
 
@@ -147,11 +147,11 @@ static int ws16c48_gpio_get_multiple(struct gpio_chip *chip,
 	return 0;
 }
 
-static void ws16c48_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void ws16c48_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
@@ -206,10 +206,10 @@ static void ws16c48_irq_ack(struct irq_data *data)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
 	const unsigned long offset = irqd_to_hwirq(data);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
 	unsigned long flags;
-	unsigned port_state;
+	unsigned int port_state;
 
 	/* only the first 3 ports support interrupts */
 	if (port > 2)
@@ -233,7 +233,7 @@ static void ws16c48_irq_mask(struct irq_data *data)
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
 	const unsigned long offset = irqd_to_hwirq(data);
 	const unsigned long mask = BIT(offset);
-	const unsigned port = offset / 8;
+	const unsigned int port = offset / 8;
 	unsigned long flags;
 
 	/* only the first 3 ports support interrupts */
@@ -257,7 +257,7 @@ static void ws16c48_irq_unmask(struct irq_data *data)
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
 	const unsigned long offset = irqd_to_hwirq(data);
 	const unsigned long mask = BIT(offset);
-	const unsigned port = offset / 8;
+	const unsigned int port = offset / 8;
 	unsigned long flags;
 
 	/* only the first 3 ports support interrupts */
@@ -275,13 +275,13 @@ static void ws16c48_irq_unmask(struct irq_data *data)
 	raw_spin_unlock_irqrestore(&ws16c48gpio->lock, flags);
 }
 
-static int ws16c48_irq_set_type(struct irq_data *data, unsigned flow_type)
+static int ws16c48_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(chip);
 	const unsigned long offset = irqd_to_hwirq(data);
 	const unsigned long mask = BIT(offset);
-	const unsigned port = offset / 8;
+	const unsigned int port = offset / 8;
 	unsigned long flags;
 
 	/* only the first 3 ports support interrupts */
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index d7b16bb9e4e4..d3cdbb3c84f9 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -94,7 +94,7 @@ struct xlp_gpio_priv {
 	spinlock_t lock;
 };
 
-static int xlp_gpio_get_reg(void __iomem *addr, unsigned gpio)
+static int xlp_gpio_get_reg(void __iomem *addr, unsigned int gpio)
 {
 	u32 pos, regset;
 
@@ -103,7 +103,7 @@ static int xlp_gpio_get_reg(void __iomem *addr, unsigned gpio)
 	return !!(readl(addr + regset) & BIT(pos));
 }
 
-static void xlp_gpio_set_reg(void __iomem *addr, unsigned gpio, int state)
+static void xlp_gpio_set_reg(void __iomem *addr, unsigned int gpio, int state)
 {
 	u32 value, pos, regset;
 
@@ -222,7 +222,7 @@ static void xlp_gpio_generic_handler(struct irq_desc *desc)
 	chained_irq_exit(irqchip, desc);
 }
 
-static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned gpio, int state)
+static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned int gpio, int state)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
@@ -232,7 +232,7 @@ static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned gpio, int state)
 	return 0;
 }
 
-static int xlp_gpio_dir_input(struct gpio_chip *gc, unsigned gpio)
+static int xlp_gpio_dir_input(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
@@ -242,7 +242,7 @@ static int xlp_gpio_dir_input(struct gpio_chip *gc, unsigned gpio)
 	return 0;
 }
 
-static int xlp_gpio_get(struct gpio_chip *gc, unsigned gpio)
+static int xlp_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
@@ -250,7 +250,7 @@ static int xlp_gpio_get(struct gpio_chip *gc, unsigned gpio)
 	return xlp_gpio_get_reg(priv->gpio_paddrv, gpio);
 }
 
-static void xlp_gpio_set(struct gpio_chip *gc, unsigned gpio, int state)
+static void xlp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int state)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index c8af34a6368f..e71a55382015 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -69,12 +69,12 @@ static inline void disable_cp(unsigned long flags, unsigned long cpenable)
 
 #endif /* XCHAL_HAVE_CP */
 
-static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned offset)
+static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	return GPIO_LINE_DIRECTION_IN; /* input only */
 }
 
-static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
+static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	unsigned long flags, saved_cpenable;
 	u32 impwire;
@@ -86,18 +86,18 @@ static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(impwire & BIT(offset));
 }
 
-static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
+static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned int offset,
 				    int value)
 {
 	BUG(); /* output only; should never be called */
 }
 
-static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
+static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	return GPIO_LINE_DIRECTION_OUT; /* output only */
 }
 
-static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned offset)
+static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	unsigned long flags, saved_cpenable;
 	u32 expstate;
@@ -109,7 +109,7 @@ static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(expstate & BIT(offset));
 }
 
-static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
+static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned int offset,
 				     int value)
 {
 	unsigned long flags, saved_cpenable;
diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index f6f8a541348f..4f658f6c0cbd 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -57,22 +57,22 @@ struct zevio_gpio {
 	struct of_mm_gpio_chip	chip;
 };
 
-static inline u32 zevio_gpio_port_get(struct zevio_gpio *c, unsigned pin,
-					unsigned port_offset)
+static inline u32 zevio_gpio_port_get(struct zevio_gpio *c, unsigned int pin,
+					unsigned int port_offset)
 {
-	unsigned section_offset = ((pin >> 3) & 3)*ZEVIO_GPIO_SECTION_SIZE;
+	unsigned int section_offset = ((pin >> 3) & 3)*ZEVIO_GPIO_SECTION_SIZE;
 	return readl(IOMEM(c->chip.regs + section_offset + port_offset));
 }
 
-static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned pin,
-					unsigned port_offset, u32 val)
+static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned int pin,
+					unsigned int port_offset, u32 val)
 {
-	unsigned section_offset = ((pin >> 3) & 3)*ZEVIO_GPIO_SECTION_SIZE;
+	unsigned int section_offset = ((pin >> 3) & 3)*ZEVIO_GPIO_SECTION_SIZE;
 	writel(val, IOMEM(c->chip.regs + section_offset + port_offset));
 }
 
 /* Functions for struct gpio_chip */
-static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
+static int zevio_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val, dir;
@@ -88,7 +88,7 @@ static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
 	return (val >> ZEVIO_GPIO_BIT(pin)) & 0x1;
 }
 
-static void zevio_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
+static void zevio_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val;
@@ -104,7 +104,7 @@ static void zevio_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 	spin_unlock(&controller->lock);
 }
 
-static int zevio_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
+static int zevio_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
 {
 	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val;
@@ -121,7 +121,7 @@ static int zevio_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 }
 
 static int zevio_gpio_direction_output(struct gpio_chip *chip,
-				       unsigned pin, int value)
+				       unsigned int pin, int value)
 {
 	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val;
@@ -143,7 +143,7 @@ static int zevio_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static int zevio_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
+static int zevio_gpio_to_irq(struct gpio_chip *chip, unsigned int pin)
 {
 	/*
 	 * TODO: Implement IRQs.
diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index 64bfb722756a..f7234b1bba1a 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -44,7 +44,7 @@ struct zx_gpio {
 	struct gpio_chip	gc;
 };
 
-static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
+static int zx_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct zx_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -62,7 +62,7 @@ static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
+static int zx_direction_output(struct gpio_chip *gc, unsigned int offset,
 		int value)
 {
 	struct zx_gpio *chip = gpiochip_get_data(gc);
@@ -86,14 +86,14 @@ static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int zx_get_value(struct gpio_chip *gc, unsigned offset)
+static int zx_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	struct zx_gpio *chip = gpiochip_get_data(gc);
 
 	return !!(readw_relaxed(chip->base + ZX_GPIO_DI) & BIT(offset));
 }
 
-static void zx_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static void zx_set_value(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct zx_gpio *chip = gpiochip_get_data(gc);
 
@@ -103,7 +103,7 @@ static void zx_set_value(struct gpio_chip *gc, unsigned offset, int value)
 		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO0);
 }
 
-static int zx_irq_type(struct irq_data *d, unsigned trigger)
+static int zx_irq_type(struct irq_data *d, unsigned int trigger)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct zx_gpio *chip = gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 5c91c4365da1..a138928d21cf 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -382,14 +382,14 @@ EXPORT_SYMBOL_GPL(devm_gpiod_put_array);
 
 static void devm_gpio_release(struct device *dev, void *res)
 {
-	unsigned *gpio = res;
+	unsigned int *gpio = res;
 
 	gpio_free(*gpio);
 }
 
 static int devm_gpio_match(struct device *dev, void *res, void *data)
 {
-	unsigned *this = res, *gpio = data;
+	unsigned int *this = res, *gpio = data;
 
 	return *this == *gpio;
 }
@@ -409,12 +409,12 @@ static int devm_gpio_match(struct device *dev, void *res, void *data)
  *      separately, devm_gpio_free() must be used.
  */
 
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label)
+int devm_gpio_request(struct device *dev, unsigned int gpio, const char *label)
 {
-	unsigned *dr;
+	unsigned int *dr;
 	int rc;
 
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
+	dr = devres_alloc(devm_gpio_release, sizeof(unsigned int), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
@@ -438,13 +438,13 @@ EXPORT_SYMBOL_GPL(devm_gpio_request);
  *	@flags:	GPIO configuration as specified by GPIOF_*
  *	@label:	a literal description string of this GPIO
  */
-int devm_gpio_request_one(struct device *dev, unsigned gpio,
+int devm_gpio_request_one(struct device *dev, unsigned int gpio,
 			  unsigned long flags, const char *label)
 {
-	unsigned *dr;
+	unsigned int *dr;
 	int rc;
 
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
+	dr = devres_alloc(devm_gpio_release, sizeof(unsigned int), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 30e2476a6dc4..c4f2e8eb4c98 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -6,7 +6,7 @@
 
 #include "gpiolib.h"
 
-void gpio_free(unsigned gpio)
+void gpio_free(unsigned int gpio)
 {
 	gpiod_free(gpio_to_desc(gpio));
 }
@@ -18,7 +18,7 @@ EXPORT_SYMBOL_GPL(gpio_free);
  * @flags:	GPIO configuration as specified by GPIOF_*
  * @label:	a literal description string of this GPIO
  */
-int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
+int gpio_request_one(unsigned int gpio, unsigned long flags, const char *label)
 {
 	struct gpio_desc *desc;
 	int err;
@@ -65,7 +65,7 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 }
 EXPORT_SYMBOL_GPL(gpio_request_one);
 
-int gpio_request(unsigned gpio, const char *label)
+int gpio_request(unsigned int gpio, const char *label)
 {
 	struct gpio_desc *desc = gpio_to_desc(gpio);
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4fa075d49fbc..de77c0e07e89 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -105,7 +105,7 @@ static inline void desc_set_label(struct gpio_desc *d, const char *label)
  * The GPIO descriptor associated with the given GPIO, or %NULL if no GPIO
  * with the given number exists in the system.
  */
-struct gpio_desc *gpio_to_desc(unsigned gpio)
+struct gpio_desc *gpio_to_desc(unsigned int gpio)
 {
 	struct gpio_device *gdev;
 	unsigned long flags;
@@ -215,7 +215,7 @@ static int gpiochip_find_base(int ngpio)
 int gpiod_get_direction(struct gpio_desc *desc)
 {
 	struct gpio_chip *gc;
-	unsigned offset;
+	unsigned int offset;
 	int ret;
 
 	gc = gpiod_to_chip(desc);
@@ -1620,7 +1620,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 {
 	unsigned long	flags;
 	int		ret = 0;
-	unsigned	i;
+	unsigned int	i;
 	int		base = gc->base;
 	struct gpio_device *gdev;
 
@@ -2441,7 +2441,7 @@ void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 }
 EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
 
-static int gpiochip_to_irq(struct gpio_chip *gc, unsigned offset)
+static int gpiochip_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct irq_domain *domain = gc->irq.domain;
 
@@ -2835,7 +2835,7 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
  * @gc: the gpiochip owning the GPIO
  * @offset: the offset of the GPIO to request for GPIO function
  */
-int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset)
+int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset)
 {
 #ifdef CONFIG_PINCTRL
 	if (list_empty(&gc->gpiodev->pin_ranges))
@@ -2851,7 +2851,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
  * @gc: the gpiochip to request the gpio function for
  * @offset: the offset of the GPIO to free from GPIO function
  */
-void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset)
+void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset)
 {
 	pinctrl_gpio_free(gc->gpiodev->base + offset);
 }
@@ -2863,7 +2863,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
  * @offset: the offset of the GPIO to apply the configuration
  * @config: the configuration to be applied
  */
-int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,
+int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
 	return pinctrl_gpio_set_config(gc->gpiodev->base + offset, config);
@@ -3011,7 +3011,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	struct gpio_chip	*gc = desc->gdev->chip;
 	int			ret;
 	unsigned long		flags;
-	unsigned		offset;
+	unsigned int		offset;
 
 	if (label) {
 		label = kstrdup_const(label, GFP_KERNEL);
@@ -3188,7 +3188,7 @@ void gpiod_free(struct gpio_desc *desc)
  * help with diagnostics, and knowing that the signal is used as a GPIO
  * can help avoid accidentally multiplexing it to another controller.
  */
-const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned offset)
+const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_desc *desc;
 
@@ -3292,7 +3292,7 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
 	unsigned long config;
-	unsigned arg;
+	unsigned int arg;
 
 	switch (mode) {
 	case PIN_CONFIG_BIAS_PULL_DOWN:
@@ -3547,7 +3547,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_config);
  * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
  * debounce time.
  */
-int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
+int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce)
 {
 	unsigned long config;
 
@@ -5407,9 +5407,9 @@ core_initcall(gpiolib_dev_init);
 
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 {
-	unsigned		i;
+	unsigned int		i;
 	struct gpio_chip	*gc = gdev->chip;
-	unsigned		gpio = gdev->base;
+	unsigned int		gpio = gdev->base;
 	struct gpio_desc	*gdesc = &gdev->descs[0];
 	bool			is_out;
 	bool			is_irq;
-- 
2.28.0.rc0

