Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA5A53FB47
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 12:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239223AbiFGKdh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 06:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238083AbiFGKdh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 06:33:37 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995EA36153
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jun 2022 03:33:30 -0700 (PDT)
Received: from localhost.localdomain ([37.4.249.155]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N1xZX-1nnPaB1OdV-012GtX; Tue, 07 Jun 2022 12:33:10 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Phil Elwell <phil@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC] pinctrl: bcm2835: Make the irqchip immutable
Date:   Tue,  7 Jun 2022 12:33:02 +0200
Message-Id: <20220607103302.37558-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wc2Paej9uS/fFX4ddH7GuB6OXiMnchWUjsPHePnuASwdDMvG21E
 /ZUO3vQTyb56rVze+MbldfisZrEyzFA/dCbeiZkZwDvc28sU0x38Wx6hPOjvcmSACLe+kIi
 btK8MnG3KDfaoqnOGN83zO+jlNEB86DauMF8D/mNUWl9zTRY8fliTBoUQWkov+Z9pWLmJG+
 FuXv6HfXCiv76OJnmN5Lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1bkrg0gViak=:j2gyLm/krd9nKD91j8zKDP
 MACvqL7+p5SS40WQNKUcwSe/+0vkT9PuRzYLaK404yMykQs2p7yIiqEXliFl6cHWo8ms32MkG
 3027CLkWhq/gK+r+05fPpLG/sxQHLSn46Z/vXU5aQL267wYNSAUGK/bj4Ga7NLkXV7hNfmZrO
 FKIgygphoDEKoU213EbZ42t98S+nCSyEFNT1TJpoUDhaAeF+ebqOjQdAC/fJ+QXrWtg+Zcg55
 136CHoukWvaFbQ5HJRZMLtOjAsswLMiuFMSzq+WhsOTGR0BbNNeR2LO/FDY8i/GFT2r4KnjTr
 FqnMEic5AcGlBnCPXpKgHgypHcQd02gFmxHxXnasnsE5SWWAlTMkxj3XXZOt7I0l3NDr5eGZ3
 qnMVMv+exMdlS5pkiui6XVeGauyZ0JArpAVfomoRsp8EA9Tpz1057C+aPlf/rAe8YIagH+4/y
 +yPp/hKmzMD40gylHUfKRYy/yxcWnDEiBqbhsuF6jCUe8roqKk3tz0caBByzwbk56KL1ihXmR
 uXsDOPwDBYfTVdiRygLv3H5OgidxTm00cWwHZy9jWKpNBP5foW0vdgR1tS3NaCxndMJvz1MNT
 VVnqo8e59RGGb7jwa8nLyfcSKWSQExp8MdWvjr3M3ISGOrIpkDYs53tLh07i2ngp5ZE272uLR
 vK6KVGxamC1kewmeVjNm+6GsEvTdGyBvjjCdpB22jcu9odqo3ooIAs6Dq9tTeioQe95OosOS9
 sSHLDI/AHCNNkvEzKJmUOgV7EYPaeCDbL3JVWLxc5x3Q62qBthaCnRcH3KY=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips. The bcm2835 pinctrl is also affected by this
warning.

Fix this by making the irqchip in the bcm2835 pinctrl driver immutable.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---

Hi, not sure about this change because irq_mask/unmask also uses the
enable/disable callbacks.

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index dad453054776..f754f7ed9eb9 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -516,6 +516,8 @@ static void bcm2835_gpio_irq_enable(struct irq_data *data)
 	unsigned bank = GPIO_REG_OFFSET(gpio);
 	unsigned long flags;
 
+	gpiochip_enable_irq(chip, gpio);
+
 	raw_spin_lock_irqsave(&pc->irq_lock[bank], flags);
 	set_bit(offset, &pc->enabled_irq_map[bank]);
 	bcm2835_gpio_irq_config(pc, gpio, true);
@@ -537,6 +539,8 @@ static void bcm2835_gpio_irq_disable(struct irq_data *data)
 	bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
 	clear_bit(offset, &pc->enabled_irq_map[bank]);
 	raw_spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
+
+	gpiochip_disable_irq(chip, gpio);
 }
 
 static int __bcm2835_gpio_irq_set_type_disabled(struct bcm2835_pinctrl *pc,
@@ -693,7 +697,7 @@ static int bcm2835_gpio_irq_set_wake(struct irq_data *data, unsigned int on)
 	return ret;
 }
 
-static struct irq_chip bcm2835_gpio_irq_chip = {
+static const struct irq_chip bcm2835_gpio_irq_chip = {
 	.name = MODULE_NAME,
 	.irq_enable = bcm2835_gpio_irq_enable,
 	.irq_disable = bcm2835_gpio_irq_disable,
@@ -702,7 +706,7 @@ static struct irq_chip bcm2835_gpio_irq_chip = {
 	.irq_mask = bcm2835_gpio_irq_disable,
 	.irq_unmask = bcm2835_gpio_irq_enable,
 	.irq_set_wake = bcm2835_gpio_irq_set_wake,
-	.flags = IRQCHIP_MASK_ON_SUSPEND,
+	.flags = (IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE),
 };
 
 static int bcm2835_pctl_get_groups_count(struct pinctrl_dev *pctldev)
@@ -1280,7 +1284,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
 
 	girq = &pc->gpio_chip.irq;
-	girq->chip = &bcm2835_gpio_irq_chip;
+	gpio_irq_chip_set_chip(girq, &bcm2835_gpio_irq_chip);
 	girq->parent_handler = bcm2835_gpio_irq_handler;
 	girq->num_parents = BCM2835_NUM_IRQS;
 	girq->parents = devm_kcalloc(dev, BCM2835_NUM_IRQS,
-- 
2.25.1

