Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524C2103D62
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 15:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730945AbfKTOht (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 09:37:49 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:59280 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730648AbfKTOht (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 09:37:49 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id UEdn2100D5USYZQ01Edno2; Wed, 20 Nov 2019 15:37:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iXR75-00021U-6T; Wed, 20 Nov 2019 15:37:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iXR75-0000Ky-4y; Wed, 20 Nov 2019 15:37:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpiolib: Grammar s/manager/managed/
Date:   Wed, 20 Nov 2019 15:37:45 +0100
Message-Id: <20191120143745.1254-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 03ab8c040a2d9e72..59d998462eff97f5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1671,7 +1671,7 @@ static void devm_gpio_chip_release(struct device *dev, void *res)
 }
 
 /**
- * devm_gpiochip_add_data() - Resource manager gpiochip_add_data()
+ * devm_gpiochip_add_data() - Resource managed gpiochip_add_data()
  * @dev: pointer to the device that gpio_chip belongs to.
  * @chip: the chip to register, with chip->base initialized
  * @data: driver-private data associated with this chip
-- 
2.17.1

