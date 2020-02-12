Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A616E15A44C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 10:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgBLJLu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 04:11:50 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:48376 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbgBLJLu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2020 04:11:50 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1lBo220155USYZQ06lBoQM; Wed, 12 Feb 2020 10:11:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1o3g-0000Zh-Ka; Wed, 12 Feb 2020 10:11:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1nuD-0002tr-Bm; Wed, 12 Feb 2020 10:02:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: gpio: Return early in gpio_pin_to_irq()
Date:   Wed, 12 Feb 2020 10:02:00 +0100
Message-Id: <20200212090200.11106-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As of commit 4adeabd042422cee ("pinctrl: sh-pfc: Remove hardcoded IRQ
numbers"), only a single operation needs to be performed after finding
the wanted pin.  Hence decrease the needed attention span of the casual
reader by replacing the goto by a direct return.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.7.
---
 drivers/pinctrl/sh-pfc/gpio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index 8213e118aa408573..9c6e931ae766edf7 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -205,14 +205,11 @@ static int gpio_pin_to_irq(struct gpio_chip *gc, unsigned offset)
 
 		for (k = 0; gpios[k] >= 0; k++) {
 			if (gpios[k] == offset)
-				goto found;
+				return pfc->irqs[i];
 		}
 	}
 
 	return 0;
-
-found:
-	return pfc->irqs[i];
 }
 
 static int gpio_pin_setup(struct sh_pfc_chip *chip)
-- 
2.17.1

