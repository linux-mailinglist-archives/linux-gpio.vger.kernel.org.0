Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A60AFEDB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 16:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbfIKOjM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 10:39:12 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:34308 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbfIKOjM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 10:39:12 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id 0Ef42100205gfCL01Ef4Ro; Wed, 11 Sep 2019 16:39:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0006T7-V5; Wed, 11 Sep 2019 16:39:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0003PC-Tp; Wed, 11 Sep 2019 16:39:03 +0200
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
Subject: [PATCH/RFC v2 3/5] gpio: Export gpio_name_to_desc() to modular GPIO code
Date:   Wed, 11 Sep 2019 16:38:56 +0200
Message-Id: <20190911143858.13024-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190911143858.13024-1-geert+renesas@glider.be>
References: <20190911143858.13024-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make gpio_name_to_desc() global, and export its symbol, so modular GPIO
driver can make use of this function.

This will be used by the GPIO Aggregator.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c | 3 ++-
 drivers/gpio/gpiolib.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c2cf01fb72a9de87..c0caafd111e6ff51 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -288,7 +288,7 @@ static int gpiodev_add_to_list(struct gpio_device *gdev)
 /*
  * Convert a GPIO name to its descriptor
  */
-static struct gpio_desc *gpio_name_to_desc(const char * const name)
+struct gpio_desc *gpio_name_to_desc(const char * const name)
 {
 	struct gpio_device *gdev;
 	unsigned long flags;
@@ -315,6 +315,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(gpio_name_to_desc);
 
 /*
  * Takes the names from gc->names and checks if they are all unique. If they
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b8b10a409c7b9c65..240d2868a3024b52 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -117,6 +117,7 @@ struct gpio_desc {
 	const char		*name;
 };
 
+struct gpio_desc *gpio_name_to_desc(const char * const name);
 int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
-- 
2.17.1

