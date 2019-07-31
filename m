Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC9047C382
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 15:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbfGaN3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 09:29:46 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:41624 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbfGaN3a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 09:29:30 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id jRVV2000J05gfCL06RVVwS; Wed, 31 Jul 2019 15:29:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsofZ-0001Ap-JN; Wed, 31 Jul 2019 15:29:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsofZ-0004ax-Hu; Wed, 31 Jul 2019 15:29:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] pinctrl: xway: Use devm_kasprintf() instead of fixed buffer formatting
Date:   Wed, 31 Jul 2019 15:29:17 +0200
Message-Id: <20190731132917.17607-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731132917.17607-1-geert+renesas@glider.be>
References: <20190731132917.17607-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Improve readability and maintainability by replacing a hardcoded string
allocation and formatting by the use of the devm_kasprintf() helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/pinctrl-xway.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 376222d0e5c570eb..913d38f29b7306f3 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1731,13 +1731,11 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < xway_chip.ngpio; i++) {
-		/* strlen("ioXY") + 1 = 5 */
-		char *name = devm_kzalloc(&pdev->dev, 5, GFP_KERNEL);
+		char *name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "io%d", i);
 
 		if (!name)
 			return -ENOMEM;
 
-		snprintf(name, 5, "io%d", i);
 		xway_info.pads[i].number = GPIO0 + i;
 		xway_info.pads[i].name = name;
 	}
-- 
2.17.1

