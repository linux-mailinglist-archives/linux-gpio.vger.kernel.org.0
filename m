Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE4036FB26
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 15:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbhD3NHm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 09:07:42 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:36599 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhD3NHl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 09:07:41 -0400
Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 8342722255;
        Fri, 30 Apr 2021 15:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1619788011;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M0/f9T9xCQCVQ2k6HHiJrTlUxlM31VrlnC9F+1WUCPE=;
        b=PIZuxJ1BsOlf+dds+IC60FwR76QL3YGqa3CaNT1CysjkS0Eh7I3Dmzk3mnwxp0079zN8o3
        K3k1k5ULuatQWpG1lPThGygZolgr7Ag6FS46FM/17kPpQshOut1uSQ755EZ+gIcm9UBOlJ
        wRIh0RLIQ5umjQuG15Eleigd66lKTaQ=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH 2/2] gpio: regmap: use new regmap_might_sleep()
Date:   Fri, 30 Apr 2021 15:06:45 +0200
Message-Id: <20210430130645.31562-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430130645.31562-1-michael@walle.cc>
References: <20210430130645.31562-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that the regmap can be queried whether it might sleep, we can get
rid of the conservative setting "can_sleep = true". New drivers which
want to use gpio-regmap and can access the registers memory-mapped won't
have the restriction that their consumers have to use the
gpiod_*cansleep() variants anymore.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/gpio/gpio-regmap.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..706f6c34696e 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -259,14 +259,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	chip->of_node = to_of_node(config->fwnode);
 #endif /* CONFIG_OF_GPIO */
 
-	/*
-	 * If our regmap is fast_io we should probably set can_sleep to false.
-	 * Right now, the regmap doesn't save this property, nor is there any
-	 * access function for it.
-	 * The only regmap type which uses fast_io is regmap-mmio. For now,
-	 * assume a safe default of true here.
-	 */
-	chip->can_sleep = true;
+	chip->can_sleep = regmap_might_sleep(gpio->regmap);
 
 	chip->get = gpio_regmap_get;
 	if (gpio->reg_set_base && gpio->reg_clr_base)
-- 
2.20.1

