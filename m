Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 325A211FB55
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 22:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfLOVFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 16:05:13 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:49498 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfLOVFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 16:05:13 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CD457891B0;
        Mon, 16 Dec 2019 10:05:11 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576443911;
        bh=Vlmbh7Wfj/vOHyWeHWs/Hj+XcJMWfw+hdSIPCcGDSzI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MZwogzFt47XEaCkDE1MuGcnZJKljOAnNyXGFNSb4I+gSW3UhNt3n4YJ/QXQ/aDvjd
         h08atFws7uqzdmgQT0zAbL4/oEuUHu2MjPZ0vmdVHrnWxu3deM7ryB3NBsgFhL09tA
         uOS/40E4BgG1WPL1HwDJMBYiVT9CmvyEvBtVEJJl7zoR86jcKVng9PRP/KDiK4hBy0
         Cbxct733goH2CKfPbn8J2CbrQ+puRsuWFwseDDKmwmcXAom6TALY3PStru8pTisvrY
         L0+jKmB6Ry8IYnX8CbkiDAN3OuwhGxH9N3uZGsTs3Chum7AUHgUsyRaumHU0bj0sJm
         oR8mT2BhrQ/4Q==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5df6a0070000>; Mon, 16 Dec 2019 10:05:11 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
        by smtp (Postfix) with ESMTP id CE3BF13EEA8;
        Mon, 16 Dec 2019 10:05:08 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 967B4540430; Mon, 16 Dec 2019 10:05:11 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH v2 1/1] pinctrl: iproc: Set irq handler based on trig type
Date:   Mon, 16 Dec 2019 10:05:03 +1300
Message-Id: <20191215210503.15488-2-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191215210503.15488-1-hamish.martin@alliedtelesis.co.nz>
References: <20191215210503.15488-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rather than always using handle_simple_irq() as the gpio_irq_chip
handler, set a more appropriate handler based on the IRQ trigger type
requested.
This is important for level triggered interrupts which need to be
masked during handling.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
v2: Alterations based on Ray Jui's review comments
- shift setting of handler type inside spinlocked region
- install handle_bad_irq as default handler for uninitialised interrupts

 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/b=
cm/pinctrl-iproc-gpio.c
index 831a9318c384..aa9b5ba1bf38 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -286,6 +286,12 @@ static int iproc_gpio_irq_set_type(struct irq_data *=
d, unsigned int type)
 	iproc_set_bit(chip, IPROC_GPIO_INT_DE_OFFSET, gpio, dual_edge);
 	iproc_set_bit(chip, IPROC_GPIO_INT_EDGE_OFFSET, gpio,
 		       rising_or_high);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
=20
 	dev_dbg(chip->dev,
@@ -868,7 +874,7 @@ static int iproc_gpio_probe(struct platform_device *p=
dev)
 			return -ENOMEM;
 		girq->parents[0] =3D irq;
 		girq->default_type =3D IRQ_TYPE_NONE;
-		girq->handler =3D handle_simple_irq;
+		girq->handler =3D handle_bad_irq;
 	}
=20
 	ret =3D gpiochip_add_data(gc, chip);
--=20
2.24.1

