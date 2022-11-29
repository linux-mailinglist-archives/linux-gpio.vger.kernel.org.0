Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 019DD63C506
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 17:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbiK2QXd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 11:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbiK2QXc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 11:23:32 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0386D28724
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 08:23:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id qGPT2802r4C55Sk06GPTuz; Tue, 29 Nov 2022 17:23:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p03OJ-0023Kq-56; Tue, 29 Nov 2022 17:23:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p03OI-003Lee-OO; Tue, 29 Nov 2022 17:23:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: mpfs: Make the irqchip immutable
Date:   Tue, 29 Nov 2022 17:23:22 +0100
Message-Id: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips.  Following this change the following warning is
now observed for the gpio-mpfs driver:

    gpio gpiochip0: (20122000.gpio): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the gpio-mpfs driver immutable.

While at it, drop of the unneeded masking of the hwirq number, as it is
always smaller than the number of GPIOs/interrupts handled by the
controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not tested with interrupts, as there are no inputs described in the
Icicle DTS yet.
---
 drivers/gpio/gpio-mpfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 168be0b90cf8c656..fd294b581ae77369 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -168,8 +168,9 @@ static void mpfs_gpio_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
+	int gpio_index = irqd_to_hwirq(data);
 
+	gpiochip_enable_irq(gc, gpio_index);
 	mpfs_gpio_direction_input(gc, gpio_index);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
@@ -180,11 +181,12 @@ static void mpfs_gpio_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
+	int gpio_index = irqd_to_hwirq(data);
 
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
 			     MPFS_GPIO_EN_INT, 0);
+	gpiochip_disable_irq(gc, gpio_index);
 }
 
 static const struct irq_chip mpfs_gpio_irqchip = {
@@ -192,7 +194,8 @@ static const struct irq_chip mpfs_gpio_irqchip = {
 	.irq_set_type = mpfs_gpio_irq_set_type,
 	.irq_mask	= mpfs_gpio_irq_mask,
 	.irq_unmask	= mpfs_gpio_irq_unmask,
-	.flags = IRQCHIP_MASK_ON_SUSPEND,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void mpfs_gpio_irq_handler(struct irq_desc *desc)
-- 
2.25.1

