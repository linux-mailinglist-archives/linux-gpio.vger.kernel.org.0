Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD76FE322E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 14:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfJXMW3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 08:22:29 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:39740 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJXMW3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 08:22:29 -0400
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id HQNS2100Q5USYZQ06QNSt7; Thu, 24 Oct 2019 14:22:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNc8I-0005pV-FT; Thu, 24 Oct 2019 14:22:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNc8I-00034s-ES; Thu, 24 Oct 2019 14:22:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] gpio: rcar: Use proper irq_chip name
Date:   Thu, 24 Oct 2019 14:22:24 +0200
Message-Id: <20191024122224.11776-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024122224.11776-1-geert+renesas@glider.be>
References: <20191024122224.11776-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The irq_chip .name field should contain the device's class name, not the
instance's name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.

---
 drivers/gpio/gpio-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 187984d26f47a940..cea6124317857bf4 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -483,7 +483,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->ngpio = npins;
 
 	irq_chip = &p->irq_chip;
-	irq_chip->name = name;
+	irq_chip->name = "gpio-rcar";
 	irq_chip->parent_device = dev;
 	irq_chip->irq_mask = gpio_rcar_irq_disable;
 	irq_chip->irq_unmask = gpio_rcar_irq_enable;
-- 
2.17.1

