Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC007AFEE5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 16:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbfIKOjM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 10:39:12 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:39698 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbfIKOjM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 10:39:12 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id 0Ef42100205gfCL01Ef4fw; Wed, 11 Sep 2019 16:39:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0006T4-UL; Wed, 11 Sep 2019 16:39:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0003P8-T2; Wed, 11 Sep 2019 16:39:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v2 2/5] gpio: Export gpiochip_get_desc() to modular GPIO code
Date:   Wed, 11 Sep 2019 16:38:55 +0200
Message-Id: <20190911143858.13024-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190911143858.13024-1-geert+renesas@glider.be>
References: <20190911143858.13024-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export the gpiochip_get_desc() symbol, so modular GPIO driver can make
use of this function again.

This is a partial revert of commit 1bd6b601fe196b6f ("gpio: make
gpiochip_get_desc() gpiolib-private").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
ERROR: "gpiochip_get_desc" [drivers/gpio/gpio-aggregator.ko] undefined!
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index dbecf266be5a5a2a..c2cf01fb72a9de87 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -95,6 +95,7 @@ static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
 	d->label = label;
 }
+EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 
 /**
  * gpio_to_desc - Convert a GPIO number to its descriptor
-- 
2.17.1

