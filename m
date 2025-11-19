Return-Path: <linux-gpio+bounces-28755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A55C6EFB3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C67F50509A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8028359FA1;
	Wed, 19 Nov 2025 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oz+iX+j5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B133D6C4;
	Wed, 19 Nov 2025 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558828; cv=none; b=mZnrriVy5Us84kjsJDGS1B8vT4ZoptuvYKSN3CTYC0GbBYnIZ6wcNTLudAA9rUL3rkE7UEGMqZT+Na47SvqmuAZuFG2iYLCt/Fb7u5q6A97WKTtlwHgy7+UeDq6F4z7XBXupvimny9HyUt+eZO9qIoKPmTx2FcEF8swUmJxDj9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558828; c=relaxed/simple;
	bh=TPajnZciI5WL8cMxQnzB8FgdGwHzLF5B6WbonwsBUYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpf4BonlH0T3coRmEpBhzlnUnuTuKt7aJivNlQc/yLKV0Bikl53gRcCGmuPigi1GoyrXBXxAj3NvH+57faRXJcQHWumN+s1GoYqHTUyVOQQR35AxmHT0S8W1bb9gBGxOfsEJ0HPkPmEZlOhkTFgmoNO1ibNUoSlQHvLgTdrykw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oz+iX+j5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD2DC2BCB5;
	Wed, 19 Nov 2025 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763558825;
	bh=TPajnZciI5WL8cMxQnzB8FgdGwHzLF5B6WbonwsBUYc=;
	h=From:To:Cc:Subject:Date:From;
	b=Oz+iX+j50OouZrvPAx1LNj5+5Hr0qIDZUHu6HLB1Hmpol74GWGoFZ/22qh26/7iNt
	 rDucjCTrLyJLWs//g64+H3qtPoPCXjvO0kI3vUEor3eKfhgh9iSgsm6PgZ1pA7OuLj
	 AAUkcSEMLoJ+/YfoM5FVsCbCjY7z/63Wz5dt1yvBpbja5iSInz9vqKN0XK1p/3DFsU
	 iwBnoFA4PUceXAn9qlQvViOdM9gjaMKV3SQkxShT2DHuipj19BKrJgepQ8sLhbncn0
	 ObFk2F7DEB+il0s/jGFBr0zdWB1MTY/W/D7js6CEZ24gwzh0Joi+P9II6lD5aEGv/M
	 OuXaFyoyCJ+yQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] gpio: fxl6408: Add suspend/resume support
Date: Wed, 19 Nov 2025 21:09:14 +0800
Message-ID: <20251119130914.7431-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, during suspend, do nothing; during resume, just sync the
regmap cache to hw regs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

since v2:
  - drop the reset pin support patch since no users now

since v1:
  -fix W=1 build error on nios2 platform

 drivers/gpio/gpio-fxl6408.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 86ebc66b1104..165c48e9cb9c 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -43,6 +43,10 @@
 
 #define FXL6408_NGPIO			8
 
+struct fxl6408_chip {
+	struct regmap *regmap;
+};
+
 static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
@@ -104,6 +108,7 @@ static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 static int fxl6408_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct fxl6408_chip *chip;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
 		.parent = dev,
@@ -114,6 +119,10 @@ static int fxl6408_probe(struct i2c_client *client)
 		.ngpio_per_reg = FXL6408_NGPIO,
 	};
 
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
 	gpio_config.regmap = devm_regmap_init_i2c(client, &regmap);
 	if (IS_ERR(gpio_config.regmap))
 		return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
@@ -123,6 +132,9 @@ static int fxl6408_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	chip->regmap = gpio_config.regmap;
+	i2c_set_clientdata(client, chip);
+
 	/* Disable High-Z of outputs, so that our OUTPUT updates actually take effect. */
 	ret = regmap_write(gpio_config.regmap, FXL6408_REG_OUTPUT_HIGH_Z, 0);
 	if (ret)
@@ -131,6 +143,16 @@ static int fxl6408_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
 }
 
+static int fxl6408_resume(struct device *dev)
+{
+	struct fxl6408_chip *chip = dev_get_drvdata(dev);
+
+	regcache_mark_dirty(chip->regmap);
+	return regcache_sync(chip->regmap);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(fxl6408_pm_ops, NULL, fxl6408_resume);
+
 static const __maybe_unused struct of_device_id fxl6408_dt_ids[] = {
 	{ .compatible = "fcs,fxl6408" },
 	{ }
@@ -146,6 +168,7 @@ MODULE_DEVICE_TABLE(i2c, fxl6408_id);
 static struct i2c_driver fxl6408_driver = {
 	.driver = {
 		.name	= "fxl6408",
+		.pm	= pm_sleep_ptr(&fxl6408_pm_ops),
 		.of_match_table = fxl6408_dt_ids,
 	},
 	.probe		= fxl6408_probe,
-- 
2.51.0


