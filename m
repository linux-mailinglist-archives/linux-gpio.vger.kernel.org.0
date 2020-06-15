Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABBE1F9B71
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730821AbgFOPGH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:06:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:23640 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730943AbgFOPFy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:05:54 -0400
IronPort-SDR: muWXif3KHqqBtWKw6XsEThwdSAWUU+EsqKbdej+wE5it323HhzU2AJtL4OyXfZyRM5s8Ae8SAz
 3GSJRASroKIg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:05:53 -0700
IronPort-SDR: jaGr7mN7dTErDz+1e07TjCRCD+i7UlYbjyVQbjev5eRsSUM15JQOctHIicGetbvmThs9J0TE93
 tSxbLC2Y8a6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="298550804"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2020 08:05:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1CC9F8FD; Mon, 15 Jun 2020 18:05:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v1 5/5] pinctrl: at91: Make use of for_each_requested_gpio()
Date:   Mon, 15 Jun 2020 18:05:45 +0300
Message-Id: <20200615150545.87964-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/pinctrl/pinctrl-at91.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 52386ad29f28..9c5213087659 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1486,14 +1486,11 @@ static void at91_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int i;
 	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
+	const char *gpio_label;
 
-	for (i = 0; i < chip->ngpio; i++) {
+	for_each_requested_gpio(chip, i, gpio_label) {
 		unsigned mask = pin_to_mask(i);
-		const char *gpio_label;
 
-		gpio_label = gpiochip_is_requested(chip, i);
-		if (!gpio_label)
-			continue;
 		mode = at91_gpio->ops->get_periph(pio, mask);
 		seq_printf(s, "[%s] GPIO%s%d: ",
 			   gpio_label, chip->label, i);
-- 
2.27.0.rc2

