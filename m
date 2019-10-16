Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF90D93C1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 16:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394006AbfJPO0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 10:26:06 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41698 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393926AbfJPO0F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 10:26:05 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id EES22100P05gfCL01ES2kr; Wed, 16 Oct 2019 16:26:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkFW-0003ls-9s; Wed, 16 Oct 2019 16:26:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkFW-0007MT-88; Wed, 16 Oct 2019 16:26:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pinctrl: sh-pfc: Do not use platform_get_irq() to count interrupts
Date:   Wed, 16 Oct 2019 16:26:01 +0200
Message-Id: <20191016142601.28255-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by, Tested-by.

Linus: Can you please take this one, as it is a fix for v5.4? Thx!
---
 drivers/pinctrl/sh-pfc/core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 1745c0639932c7a7..a5a794cbf997f7a3 100644
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

