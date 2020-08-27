Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA02254D88
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 20:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgH0S7b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:59:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:49802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728109AbgH0S73 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:59:29 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C9F022BEB;
        Thu, 27 Aug 2020 18:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554768;
        bh=1aI34oflIhzPRAI0UU1xJacHYtSBrAKdYvjEbULjxgc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aZ5SeS7/or+YYxyw8LKT7pd5+Sbn8tF2kNZ+KYwBareZGJe7MR7z1YEDE3TzDF6UE
         DOFBGa3fjUEh1VFYz3ZluCyw1VCk5NgXL8Dm2vq01VXIqfu7Vwj6W38GMwFMWtzpgU
         j+YY9wLeJt8vtrPUjv2IOOmWm2Xq+a9rEEOL3Lso=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        clang-built-linux@googlegroups.com
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 14/27] Input: goodix - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:16 +0200
Message-Id: <20200827185829.30096-15-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
References: <20200827185829.30096-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/touchscreen/goodix.c | 40 ++++++++----------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 02c75ea385e0..48c4c3d297fe 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -864,7 +864,6 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
  */
 static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 {
-	int error;
 	struct device *dev;
 	struct gpio_desc *gpiod;
 	bool added_acpi_mappings = false;
@@ -874,33 +873,20 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	dev = &ts->client->dev;
 
 	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
-	if (IS_ERR(ts->avdd28)) {
-		error = PTR_ERR(ts->avdd28);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev,
-				"Failed to get AVDD28 regulator: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->avdd28))
+		return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");
 
 	ts->vddio = devm_regulator_get(dev, "VDDIO");
-	if (IS_ERR(ts->vddio)) {
-		error = PTR_ERR(ts->vddio);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev,
-				"Failed to get VDDIO regulator: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->vddio))
+		return dev_err_probe(dev, PTR_ERR(ts->vddio), "Failed to get VDDIO regulator\n");
 
 retry_get_irq_gpio:
 	/* Get the interrupt GPIO pin number */
 	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME, GPIOD_IN);
-	if (IS_ERR(gpiod)) {
-		error = PTR_ERR(gpiod);
-		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
-				GOODIX_GPIO_INT_NAME, error);
-		return error;
-	}
+	if (IS_ERR(gpiod))
+		return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
+				     GOODIX_GPIO_INT_NAME);
+
 	if (!gpiod && has_acpi_companion(dev) && !added_acpi_mappings) {
 		added_acpi_mappings = true;
 		if (goodix_add_acpi_gpio_mappings(ts) == 0)
@@ -911,13 +897,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 
 	/* Get the reset line GPIO pin number */
 	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, GPIOD_IN);
-	if (IS_ERR(gpiod)) {
-		error = PTR_ERR(gpiod);
-		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
-				GOODIX_GPIO_RST_NAME, error);
-		return error;
-	}
+	if (IS_ERR(gpiod))
+		return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
+				     GOODIX_GPIO_RST_NAME);
 
 	ts->gpiod_rst = gpiod;
 
-- 
2.17.1

