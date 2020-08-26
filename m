Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A382538E9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Aug 2020 22:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHZUIm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Aug 2020 16:08:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726753AbgHZUIg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Aug 2020 16:08:36 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C20802080C;
        Wed, 26 Aug 2020 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598472515;
        bh=p0i0gDJ2jS4t7JJ4ocLozJvGErG8heeVM4U3k61ApPg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PKGrrwPE5hIfuaNKgGIpKkhl0nZqny54lvbaklqusmvYoVIQySnCHWsyZ4d1GJ5tz
         IOnx9dgeJXpxP4577acpOrimdDYTH7Zf4G4en6bnC46fQSHWY9HgpNM4LbXalcXkc+
         mUtcNFmR/5XeZktf4hhwYi9TzjN3XjyGOL3uu9ww=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 2/2] Input: gpio_keys - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 22:08:27 +0200
Message-Id: <20200826200827.30931-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826200827.30931-1-krzk@kernel.org>
References: <20200826200827.30931-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe() and devm_fwnode_gpiod_get_optional().   Less code and
the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

---

Changes since v1:
1. Use devm_fwnode_gpiod_get_optional
---
 drivers/input/keyboard/gpio_keys.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f2d4e4daa818..a07ac6fa25ed 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -494,23 +494,10 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	spin_lock_init(&bdata->lock);
 
 	if (child) {
-		bdata->gpiod = devm_fwnode_gpiod_get(dev, child,
-						     NULL, GPIOD_IN, desc);
-		if (IS_ERR(bdata->gpiod)) {
-			error = PTR_ERR(bdata->gpiod);
-			if (error == -ENOENT) {
-				/*
-				 * GPIO is optional, we may be dealing with
-				 * purely interrupt-driven setup.
-				 */
-				bdata->gpiod = NULL;
-			} else {
-				if (error != -EPROBE_DEFER)
-					dev_err(dev, "failed to get gpio: %d\n",
-						error);
-				return error;
-			}
-		}
+		bdata->gpiod = devm_fwnode_gpiod_get_optional(dev, child, NULL,
+							      GPIOD_IN, desc);
+		if (IS_ERR(bdata->gpiod))
+			return dev_err_probe(dev, error, "failed to get gpio\n");
 	} else if (gpio_is_valid(button->gpio)) {
 		/*
 		 * Legacy GPIO number, so request the GPIO here and
-- 
2.17.1

