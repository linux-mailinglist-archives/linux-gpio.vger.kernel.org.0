Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41499C3F57
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 20:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731754AbfJASFz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 14:05:55 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:48674 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731751AbfJASFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 14:05:55 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id 8J5t2100E05gfCL01J5th0; Tue, 01 Oct 2019 20:05:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iFMX3-0008KP-4V; Tue, 01 Oct 2019 20:05:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iFMX3-0000CZ-1z; Tue, 01 Oct 2019 20:05:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Do not use platform_get_irq() to count interrupts
Date:   Tue,  1 Oct 2019 20:05:47 +0200
Message-Id: <20191001180547.734-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As platform_get_irq() now prints an error when the interrupt does not
exist, counting interrupts by looping until failure causes the printing
of scary messages like:

    sh-pfc e6060000.pin-controller: IRQ index 0 not found

Fix this by using the platform_irq_count() helper instead.

Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a fix for v5.4-rc1.
---
 drivers/pinctrl/sh-pfc/core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index b8640ad41bef26be..ce983247c9e28bfe 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -29,12 +29,12 @@
 static int sh_pfc_map_resources(struct sh_pfc *pfc,
 				struct platform_device *pdev)
 {
-	unsigned int num_windows, num_irqs;
 	struct sh_pfc_window *windows;
 	unsigned int *irqs = NULL;
+	unsigned int num_windows;
 	struct resource *res;
 	unsigned int i;
-	int irq;
+	int num_irqs;
 
 	/* Count the MEM and IRQ resources. */
 	for (num_windows = 0;; num_windows++) {
@@ -42,17 +42,13 @@ static int sh_pfc_map_resources(struct sh_pfc *pfc,
 		if (!res)
 			break;
 	}
-	for (num_irqs = 0;; num_irqs++) {
-		irq = platform_get_irq(pdev, num_irqs);
-		if (irq == -EPROBE_DEFER)
-			return irq;
-		if (irq < 0)
-			break;
-	}
-
 	if (num_windows == 0)
 		return -EINVAL;
 
+	num_irqs = platform_irq_count(pdev);
+	if (num_irqs < 0)
+		return num_irqs;
+
 	/* Allocate memory windows and IRQs arrays. */
 	windows = devm_kcalloc(pfc->dev, num_windows, sizeof(*windows),
 			       GFP_KERNEL);
-- 
2.17.1

