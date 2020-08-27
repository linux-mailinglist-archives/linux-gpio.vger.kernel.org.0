Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3579B254F1D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgH0TsK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 15:48:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:42020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgH0TsJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 15:48:09 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FD1A207DF;
        Thu, 27 Aug 2020 19:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598557688;
        bh=S7+ytNvy4Ms5HI/eVO4FDsU8aXgDwpeOVIrlQEqYQZI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hxfcnR1bLSaTFTPs0qXEnwKXtAxe0Som9YeDELU9IFUddMrykmithPUghN7+mCpgm
         EWy8/WYWGiYxCB0bNS1UIP2Pp/xi3DMhXawyn+74GswLeSyCPBKEDZm9+7whwUpbJ2
         N9mfe01B6lf5jKtp7DPgah+V787G3cIyxoDhED5A=
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
Subject: [PATCH v3.1] Input: bu21013_ts - Use local 'client->dev' variable in probe()
Date:   Thu, 27 Aug 2020 21:47:45 +0200
Message-Id: <20200827194745.10721-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827185829.30096-27-krzk@kernel.org>
References: <20200827185829.30096-27-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

'dev' is shorter and simpler than '&client->dev' and in few cases it
allows to skip line wrapping. Probe function uses '&client->dev' a lot,
so this improves readability slightly.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

---

Changes since v3:
1. Correct suggested-by tag,
2. Add Reviewed-by tag.

Changes since v2:
1. New patch
---
 drivers/input/touchscreen/bu21013_ts.c | 61 ++++++++++++--------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 86bd38243d6c..f09204091ba5 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -411,31 +411,32 @@ static int bu21013_probe(struct i2c_client *client,
 	struct input_dev *in_dev;
 	struct input_absinfo *info;
 	u32 max_x = 0, max_y = 0;
+	struct device *dev = &client->dev;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&client->dev, "i2c smbus byte data not supported\n");
+		dev_err(dev, "i2c smbus byte data not supported\n");
 		return -EIO;
 	}
 
 	if (!client->irq) {
-		dev_err(&client->dev, "No IRQ set up\n");
+		dev_err(dev, "No IRQ set up\n");
 		return -EINVAL;
 	}
 
-	ts = devm_kzalloc(&client->dev, sizeof(*ts), GFP_KERNEL);
+	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
 	if (!ts)
 		return -ENOMEM;
 
 	ts->client = client;
 
-	ts->x_flip = device_property_read_bool(&client->dev, "rohm,flip-x");
-	ts->y_flip = device_property_read_bool(&client->dev, "rohm,flip-y");
+	ts->x_flip = device_property_read_bool(dev, "rohm,flip-x");
+	ts->y_flip = device_property_read_bool(dev, "rohm,flip-y");
 
-	in_dev = devm_input_allocate_device(&client->dev);
+	in_dev = devm_input_allocate_device(dev);
 	if (!in_dev) {
-		dev_err(&client->dev, "device memory alloc failed\n");
+		dev_err(dev, "device memory alloc failed\n");
 		return -ENOMEM;
 	}
 	ts->in_dev = in_dev;
@@ -445,8 +446,8 @@ static int bu21013_probe(struct i2c_client *client,
 	in_dev->name = DRIVER_TP;
 	in_dev->id.bustype = BUS_I2C;
 
-	device_property_read_u32(&client->dev, "rohm,touch-max-x", &max_x);
-	device_property_read_u32(&client->dev, "rohm,touch-max-y", &max_y);
+	device_property_read_u32(dev, "rohm,touch-max-x", &max_x);
+	device_property_read_u32(dev, "rohm,touch-max-y", &max_y);
 
 	input_set_abs_params(in_dev, ABS_MT_POSITION_X, 0, max_x, 0, 0);
 	input_set_abs_params(in_dev, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
@@ -455,14 +456,14 @@ static int bu21013_probe(struct i2c_client *client,
 
 	/* Adjust for the legacy "flip" properties, if present */
 	if (!ts->props.invert_x &&
-	    device_property_read_bool(&client->dev, "rohm,flip-x")) {
+	    device_property_read_bool(dev, "rohm,flip-x")) {
 		info = &in_dev->absinfo[ABS_MT_POSITION_X];
 		info->maximum -= info->minimum;
 		info->minimum = 0;
 	}
 
 	if (!ts->props.invert_y &&
-	    device_property_read_bool(&client->dev, "rohm,flip-y")) {
+	    device_property_read_bool(dev, "rohm,flip-y")) {
 		info = &in_dev->absinfo[ABS_MT_POSITION_Y];
 		info->maximum -= info->minimum;
 		info->minimum = 0;
@@ -472,50 +473,46 @@ static int bu21013_probe(struct i2c_client *client,
 				    INPUT_MT_DIRECT | INPUT_MT_TRACK |
 					INPUT_MT_DROP_UNUSED);
 	if (error) {
-		dev_err(&client->dev, "failed to initialize MT slots");
+		dev_err(dev, "failed to initialize MT slots");
 		return error;
 	}
 
-	ts->regulator = devm_regulator_get(&client->dev, "avdd");
+	ts->regulator = devm_regulator_get(dev, "avdd");
 	if (IS_ERR(ts->regulator)) {
-		dev_err(&client->dev, "regulator_get failed\n");
+		dev_err(dev, "regulator_get failed\n");
 		return PTR_ERR(ts->regulator);
 	}
 
 	error = regulator_enable(ts->regulator);
 	if (error) {
-		dev_err(&client->dev, "regulator enable failed\n");
+		dev_err(dev, "regulator enable failed\n");
 		return error;
 	}
 
-	error = devm_add_action_or_reset(&client->dev, bu21013_power_off, ts);
+	error = devm_add_action_or_reset(dev, bu21013_power_off, ts);
 	if (error) {
-		dev_err(&client->dev, "failed to install power off handler\n");
+		dev_err(dev, "failed to install power off handler\n");
 		return error;
 	}
 
 	/* Named "CS" on the chip, DT binding is "reset" */
-	ts->cs_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	ts->cs_gpiod = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ts->cs_gpiod))
-		return dev_err_probe(&client->dev, PTR_ERR(ts->cs_gpiod),
-				     "failed to get CS GPIO\n");
+		return dev_err_probe(dev, PTR_ERR(ts->cs_gpiod), "failed to get CS GPIO\n");
 
 	gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");
 
-	error = devm_add_action_or_reset(&client->dev,
-					 bu21013_disable_chip, ts);
+	error = devm_add_action_or_reset(dev, bu21013_disable_chip, ts);
 	if (error) {
-		dev_err(&client->dev,
-			"failed to install chip disable handler\n");
+		dev_err(dev, "failed to install chip disable handler\n");
 		return error;
 	}
 
 	/* Named "INT" on the chip, DT binding is "touch" */
-	ts->int_gpiod = devm_gpiod_get_optional(&client->dev,
-						"touch", GPIOD_IN);
+	ts->int_gpiod = devm_gpiod_get_optional(dev, "touch", GPIOD_IN);
 	error = PTR_ERR_OR_ZERO(ts->int_gpiod);
 	if (error)
-		return dev_err_probe(&client->dev, error, "failed to get INT GPIO\n");
+		return dev_err_probe(dev, error, "failed to get INT GPIO\n");
 
 	if (ts->int_gpiod)
 		gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
@@ -523,22 +520,20 @@ static int bu21013_probe(struct i2c_client *client,
 	/* configure the touch panel controller */
 	error = bu21013_init_chip(ts);
 	if (error) {
-		dev_err(&client->dev, "error in bu21013 config\n");
+		dev_err(dev, "error in bu21013 config\n");
 		return error;
 	}
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, bu21013_gpio_irq,
+	error = devm_request_threaded_irq(dev, client->irq, NULL, bu21013_gpio_irq,
 					  IRQF_ONESHOT, DRIVER_TP, ts);
 	if (error) {
-		dev_err(&client->dev, "request irq %d failed\n",
-			client->irq);
+		dev_err(dev, "request irq %d failed\n", client->irq);
 		return error;
 	}
 
 	error = input_register_device(in_dev);
 	if (error) {
-		dev_err(&client->dev, "failed to register input device\n");
+		dev_err(dev, "failed to register input device\n");
 		return error;
 	}
 
-- 
2.17.1

