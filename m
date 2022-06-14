Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED1F54BBB1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 22:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiFNU32 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 16:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358171AbiFNU31 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 16:29:27 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE714EDC2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2022 13:29:24 -0700 (PDT)
Received: from localhost.localdomain ([37.4.249.155]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MbAUg-1nPfQ20Vrs-00baRl; Tue, 14 Jun 2022 22:29:06 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Phil Elwell <phil@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 1/2] pinctrl: bcm2835: drop irq_enable/disable callbacks
Date:   Tue, 14 Jun 2022 22:28:30 +0200
Message-Id: <20220614202831.236341-2-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614202831.236341-1-stefan.wahren@i2se.com>
References: <20220614202831.236341-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SYHy4K1i151YMhm/X3GFFP86lIOtAoQO8ZFRgOBkiVGriDx0m0T
 2LaWllpduCyw4tbfK7HQH+5OY/d08Ju9CU4R4hsD6jifG5fxT3d5vsY6DUOl/xJX9l5Rrzz
 boahKOdeER67vuBVWAy7aDO592d2bZU2kkx9QlGAgidui9WnX+3l1sEO1yXsYRRxMNGcWRw
 nKEj3f5WAwNqxZEUP0JyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZCqHn3IchWA=:01s7A/9kXDZ9XwVmpmE9ej
 spE91dJxY9xkXRjEyyp66nEAGXLtgn5pj9LdwkEhisZAYsnmxf4w+mCOESgCCZovwPSu4PF+4
 lgDAwcRj8Qth/B5MDzqYgDzV6IJMu28UAA4kbvU3/4FmqL7HG3dLmRjY1sSOcSZqIrF3zXZeC
 5Ry3F2bpIfZGjJYMMZ3wqHKz24oFp4Y0iuH7WWDJqwe8qJPHW4D5QQdmLjHkT+eEn1Fd61gXK
 XngiISm8s0MmcTWfEMCEFAn0BTHQmrhDgYhqE7mWFF1Xn98uFdzvfC22HXlW0M4SXSg2hdCKJ
 BtNE6eL+ksyH/Ls0WVGf/YtGx7rWPACKjOjeu5EXN9s2Bq2ycS3Kpl+dM+CRsZRKe2QGj+y8i
 KL/MvPMIxf5uH7XqaK6owGFfTJm+7tRI7lNtuWMudXMdi0m4qAs645N0MdvCsPxzDYD446ykH
 A2aJmUUcLlwU8DDW0Pou9HP1DvVoRBqH+vZmfvJUMG04xSluTxa0FQrryxBvJGFqyx+yDGDfZ
 fiMU98MSeOFIkXJ1bNgd+ubC8a3E9LdtjXDzvatp641IfQvpk1JU+AMle8MGOR1qJ6NfdOBVJ
 HnL7t6L0S4Tb93yuJU/wyAYq2eXCAYTpt4AJrMjWBXfisR/mufwE9fLpjYLwYBfQ7KyoCP/OO
 tP1Vsd9NU3DRDsiQr36bF231A58I6hGqbuoG2GHMptntW/0ercz13kjNYLf7V4fA9n4+xAZ/a
 QUGO2YVOoKd0xeoYaY7ugwxp7tPp2dCsmUbkiMLeSN3rouf7CT/Pf8rser8=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit b8a19382ac62 ("pinctrl: bcm2835: Fix support for threaded level
triggered IRQs") assigned the irq_mask/unmask callbacks with the
already existing functions for irq_enable/disable. The wasn't completely
the right way (tm) to fix the issue, because these callbacks shouldn't
be identical. So fix this by rename the functions to represent their
intension and drop the unnecessary irq_enable/disable assigment.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index dad453054776..807824bc9a10 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -507,7 +507,7 @@ static void bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
 	}
 }
 
-static void bcm2835_gpio_irq_enable(struct irq_data *data)
+static void bcm2835_gpio_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
@@ -522,7 +522,7 @@ static void bcm2835_gpio_irq_enable(struct irq_data *data)
 	raw_spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
 }
 
-static void bcm2835_gpio_irq_disable(struct irq_data *data)
+static void bcm2835_gpio_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
@@ -695,12 +695,10 @@ static int bcm2835_gpio_irq_set_wake(struct irq_data *data, unsigned int on)
 
 static struct irq_chip bcm2835_gpio_irq_chip = {
 	.name = MODULE_NAME,
-	.irq_enable = bcm2835_gpio_irq_enable,
-	.irq_disable = bcm2835_gpio_irq_disable,
 	.irq_set_type = bcm2835_gpio_irq_set_type,
 	.irq_ack = bcm2835_gpio_irq_ack,
-	.irq_mask = bcm2835_gpio_irq_disable,
-	.irq_unmask = bcm2835_gpio_irq_enable,
+	.irq_mask = bcm2835_gpio_irq_mask,
+	.irq_unmask = bcm2835_gpio_irq_unmask,
 	.irq_set_wake = bcm2835_gpio_irq_set_wake,
 	.flags = IRQCHIP_MASK_ON_SUSPEND,
 };
-- 
2.25.1

