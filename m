Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A7B254DD6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgH0S7H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:59:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbgH0S7G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:59:06 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8E0A22BEA;
        Thu, 27 Aug 2020 18:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554745;
        bh=JUb3zuXLRCIJMwL7fDm3Li7eKTZnqM4btxV54IXuXgQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VKiQ07/7odXGNddU3tMkEZjgzz3zZk0SIYWXCjLtwrS6YeTHdDyJQIB8G1axnL92i
         eC9HxdKPr8mK7bipqX6bAGcq0zAHjt0otYH/Dsr5AqIiqZAFBiKbtzex+gfiblz3Af
         5fW5ZhUsPqQJLA45dsHMPOHptoSHwQno8LHHLrjc=
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
Subject: [PATCH v3 07/27] Input: bu21013_ts - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:09 +0200
Message-Id: <20200827185829.30096-8-krzk@kernel.org>
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

---

Changes since v1:
1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
---
 drivers/input/touchscreen/bu21013_ts.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 2f1f0d7607f8..86bd38243d6c 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -496,12 +496,10 @@ static int bu21013_probe(struct i2c_client *client,
 
 	/* Named "CS" on the chip, DT binding is "reset" */
 	ts->cs_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
-	error = PTR_ERR_OR_ZERO(ts->cs_gpiod);
-	if (error) {
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev, "failed to get CS GPIO\n");
-		return error;
-	}
+	if (IS_ERR(ts->cs_gpiod))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->cs_gpiod),
+				     "failed to get CS GPIO\n");
+
 	gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");
 
 	error = devm_add_action_or_reset(&client->dev,
@@ -516,11 +514,8 @@ static int bu21013_probe(struct i2c_client *client,
 	ts->int_gpiod = devm_gpiod_get_optional(&client->dev,
 						"touch", GPIOD_IN);
 	error = PTR_ERR_OR_ZERO(ts->int_gpiod);
-	if (error) {
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev, "failed to get INT GPIO\n");
-		return error;
-	}
+	if (error)
+		return dev_err_probe(&client->dev, error, "failed to get INT GPIO\n");
 
 	if (ts->int_gpiod)
 		gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
-- 
2.17.1

