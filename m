Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3C920FE17
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 22:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgF3UsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 16:48:08 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:45064 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgF3UsI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 16:48:08 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 59C978011F;
        Wed,  1 Jul 2020 08:48:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1593550083;
        bh=dkA9lCTZ8l7sxxsW0Hb4m+Cx86l4iCV5ssAnMigH/7Q=;
        h=From:To:Cc:Subject:Date;
        b=hPnwIOP5QE4UL/Sst4tj6aPbwJKT+wvvXSa1u8wzTVJt9NxtjHPraq5z9fz7mYwZG
         t7S5ZYEJrSqpBte23GvqZKC0kcRJ5AfRS6gHxEQeCv9z5d5gycCR4pwQ1UeNeQraAY
         3+UR0CvRkvcYsfrQk+ZudjTKDtHNJVzGOGi8P6KVDDf6eOy18gQwXoCatczdLQAfz2
         s/JyRgdEj55v8EHUeVkpwc0QjywjRZXa55PIB3p6jTKvGzOvmPjnfMp0vxd8ZtQ+Q0
         t1gznhalwiRbNekqRoMHm4n7Gyt+ZPKXjKQtre8D3k2sll9H89gk3gKMAuHOsOMHM7
         yJqHoxOaz131g==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5efba5030000>; Wed, 01 Jul 2020 08:48:03 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id 03CEB13EEB5;
        Wed,  1 Jul 2020 08:48:02 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 03FC533E9BD; Wed,  1 Jul 2020 08:48:03 +1200 (NZST)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] pinctrl: nsp: Set irq handler based on trig type
Date:   Wed,  1 Jul 2020 08:47:04 +1200
Message-Id: <20200630204704.17736-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rather than always using handle_simple_irq() as the gpio_irq_chip
handler, set a more appropriate handler based on the IRQ trigger type
requested. This is important for level triggered interrupts which need
to be masked during handling. Also, always acknowledge the interrupt
regardless of whether it is edge or level triggered.

Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm=
/pinctrl-nsp-gpio.c
index bed0124388c0..349fb384113e 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -174,11 +174,8 @@ static void nsp_gpio_irq_ack(struct irq_data *d)
 	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
 	unsigned gpio =3D d->hwirq;
 	u32 val =3D BIT(gpio);
-	u32 trigger_type;
=20
-	trigger_type =3D irq_get_trigger_type(d->irq);
-	if (trigger_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
-		nsp_set_bit(chip, REG, NSP_GPIO_EVENT, gpio, val);
+	nsp_set_bit(chip, REG, NSP_GPIO_EVENT, gpio, val);
 }
=20
 /*
@@ -262,6 +259,12 @@ static int nsp_gpio_irq_set_type(struct irq_data *d,=
 unsigned int type)
=20
 	nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_POLARITY, gpio, falling);
 	nsp_set_bit(chip, REG, NSP_GPIO_INT_POLARITY, gpio, level_low);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
=20
 	dev_dbg(chip->dev, "gpio:%u level_low:%s falling:%s\n", gpio,
@@ -691,7 +694,7 @@ static int nsp_gpio_probe(struct platform_device *pde=
v)
 		girq->num_parents =3D 0;
 		girq->parents =3D NULL;
 		girq->default_type =3D IRQ_TYPE_NONE;
-		girq->handler =3D handle_simple_irq;
+		girq->handler =3D handle_bad_irq;
 	}
=20
 	ret =3D devm_gpiochip_add_data(dev, gc, chip);
--=20
2.27.0

