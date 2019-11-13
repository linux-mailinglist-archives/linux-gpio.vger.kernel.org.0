Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA1BFAE56
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 11:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfKMKSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 05:18:12 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:35098 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbfKMKSM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 05:18:12 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id RNJA2100Q5USYZQ01NJAGJ; Wed, 13 Nov 2019 11:18:10 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUpj0-0002N1-Do; Wed, 13 Nov 2019 11:18:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUpj0-0007S2-CL; Wed, 13 Nov 2019 11:18:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Make legacy function GPIO handling less fragile
Date:   Wed, 13 Nov 2019 11:18:09 +0100
Message-Id: <20191113101809.28600-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there are no function GPIOs, sh_pfc_register_gpiochip() returns early
with a success indicator.  This is fragile, as new code may be added
after the #ifdef block, which won't be executed in case of early return.

Invert the logic, so the code always continues until the end of the
function on success.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.6.

 drivers/pinctrl/sh-pfc/gpio.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index 5a55b8da7919520e..8213e118aa408573 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -386,12 +386,11 @@ int sh_pfc_register_gpiochip(struct sh_pfc *pfc)
 	}
 
 	/* Register the function GPIOs chip. */
-	if (pfc->info->nr_func_gpios == 0)
-		return 0;
-
-	chip = sh_pfc_add_gpiochip(pfc, gpio_function_setup, NULL);
-	if (IS_ERR(chip))
-		return PTR_ERR(chip);
+	if (pfc->info->nr_func_gpios) {
+		chip = sh_pfc_add_gpiochip(pfc, gpio_function_setup, NULL);
+		if (IS_ERR(chip))
+			return PTR_ERR(chip);
+	}
 #endif /* CONFIG_PINCTRL_SH_FUNC_GPIO */
 
 	return 0;
-- 
2.17.1

