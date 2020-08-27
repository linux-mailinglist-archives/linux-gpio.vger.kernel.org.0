Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63239254DC7
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgH0S7i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:59:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:49950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728140AbgH0S7g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:59:36 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA3AD22CAF;
        Thu, 27 Aug 2020 18:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554775;
        bh=+sCZf4QqZftn2qRoSs7JjNAyL5o05Qs6eKp7oldk8O8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qp/WwPiHeQAN4vaC3bm30YMRpTpoY8Vfm+505NKC12/OLIrHyJ5oEQuaeZy4la7+J
         YMqom7EapQ9bZ2cS4ar8Xe6O3+XCOZiwmWoSQhJSkYh8zdGWS45rDnNWMF88ZEJmDD
         uFNVkZqsOJAFNQc5iEW+eE3dgzBpm7W1j8lMWTWU=
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
Subject: [PATCH v3 16/27] Input: pixcir_i2c_ts - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:18 +0200
Message-Id: <20200827185829.30096-17-krzk@kernel.org>
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
 drivers/input/touchscreen/pixcir_i2c_ts.c | 38 +++++++----------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index 9aa098577350..fb37567e2d7e 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -515,41 +515,27 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
 	input_set_drvdata(input, tsdata);
 
 	tsdata->gpio_attb = devm_gpiod_get(dev, "attb", GPIOD_IN);
-	if (IS_ERR(tsdata->gpio_attb)) {
-		error = PTR_ERR(tsdata->gpio_attb);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request ATTB gpio: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(tsdata->gpio_attb))
+		return dev_err_probe(dev, PTR_ERR(tsdata->gpio_attb),
+				     "Failed to request ATTB gpio\n");
 
 	tsdata->gpio_reset = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_LOW);
-	if (IS_ERR(tsdata->gpio_reset)) {
-		error = PTR_ERR(tsdata->gpio_reset);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request RESET gpio: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(tsdata->gpio_reset))
+		return dev_err_probe(dev, PTR_ERR(tsdata->gpio_reset),
+				     "Failed to request RESET gpio\n");
 
 	tsdata->gpio_wake = devm_gpiod_get_optional(dev, "wake",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(tsdata->gpio_wake)) {
-		error = PTR_ERR(tsdata->gpio_wake);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get wake gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(tsdata->gpio_wake))
+		return dev_err_probe(dev, PTR_ERR(tsdata->gpio_wake),
+				     "Failed to get wake gpio\n");
 
 	tsdata->gpio_enable = devm_gpiod_get_optional(dev, "enable",
 						      GPIOD_OUT_HIGH);
-	if (IS_ERR(tsdata->gpio_enable)) {
-		error = PTR_ERR(tsdata->gpio_enable);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get enable gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(tsdata->gpio_enable))
+		return dev_err_probe(dev, PTR_ERR(tsdata->gpio_enable),
+				     "Failed to get enable gpio\n");
 
 	if (tsdata->gpio_enable)
 		msleep(100);
-- 
2.17.1

