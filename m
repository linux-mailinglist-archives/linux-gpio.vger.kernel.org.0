Return-Path: <linux-gpio+bounces-27923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E715EC28D48
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 11:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 503AE343ABC
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4393226ED23;
	Sun,  2 Nov 2025 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyVxCaW3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F326926E71B;
	Sun,  2 Nov 2025 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762078984; cv=none; b=r4uoZJm4H2pVBWWT2v/sJ+s35qZjP6yDtXTm1D0eCpY2m+5gpSrZWJiGZ7aDy5zp2okcStSHOWKJ2zdtPcv8cm7gCIi+oS9XTWqgH3PkK6r2mpMX/t/mVQGG6Gs8RlKp79+t0nfsS3JV3OunhsJ+096QfdUnypfG3qbqc3TE7XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762078984; c=relaxed/simple;
	bh=Y8hWnynLiqeIN5xdT/N1ihtdP6znADV+s3faGr+WVNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMemjT+8T3DtHszCNl44ZIlmU00MD7SG0Ko0J1g0CzEEQdO398OyzoZ0Gm5mPVz6gLUePxCREpXlCxz0ImK6jqowD0m5BgylM9DLod3Gm+OpJsvilE3j5DNm9NR9EslioNaIYmykq224aqVMuCXD8vCTn4LlBrJMNKD2rBpwuV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyVxCaW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6ABC4CEF7;
	Sun,  2 Nov 2025 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762078983;
	bh=Y8hWnynLiqeIN5xdT/N1ihtdP6znADV+s3faGr+WVNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fyVxCaW3JhUooT/8++TfY38faupalwIiZLLNJsWmG/WJUVu8JUWqMFtHcxRhxgXrd
	 ubJ6QZCiqUeluqy0xUVLtueAy3MEhvhBUwkDgynNFmtFK3l8MJdVYj2P6WEpJTp5jg
	 F29PAAOp6dUtfD91gZ48JjeUotdZrfBgOE6ik30iaIV2CozZnlJUqkkXnDd3HfKAYv
	 AxzsMf5rBo1Ks98R40rE5E9XwRC/Jzo5Jhx/xxaPY8EfdhdcztZ9IGQ+3YQNK3oC3G
	 q7UcbI+88TMXbcRqqcYWs9ekWoyuNXlhiA4/enrMk/cwfz0tBQPYeeV1oTiDrXyHf0
	 da+DKdUPBrC4w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: fxl6408: Add suspend/resume support
Date: Sun,  2 Nov 2025 18:05:15 +0800
Message-ID: <20251102100515.9506-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20251102100515.9506-1-jszhang@kernel.org>
References: <20251102100515.9506-1-jszhang@kernel.org>
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
 drivers/gpio/gpio-fxl6408.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index ae520305f7a9..805a623ef89c 100644
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
@@ -105,6 +109,7 @@ static int fxl6408_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct gpio_desc *reset_gpio;
+	struct fxl6408_chip *chip;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
 		.parent = dev,
@@ -115,6 +120,10 @@ static int fxl6408_probe(struct i2c_client *client)
 		.ngpio_per_reg = FXL6408_NGPIO,
 	};
 
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(reset_gpio), "Failed to get reset gpio\n");
@@ -128,6 +137,9 @@ static int fxl6408_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	chip->regmap = gpio_config.regmap;
+	i2c_set_clientdata(client, chip);
+
 	/* Disable High-Z of outputs, so that our OUTPUT updates actually take effect. */
 	ret = regmap_write(gpio_config.regmap, FXL6408_REG_OUTPUT_HIGH_Z, 0);
 	if (ret)
@@ -136,6 +148,16 @@ static int fxl6408_probe(struct i2c_client *client)
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
@@ -151,6 +173,7 @@ MODULE_DEVICE_TABLE(i2c, fxl6408_id);
 static struct i2c_driver fxl6408_driver = {
 	.driver = {
 		.name	= "fxl6408",
+		.pm	= pm_sleep_ptr(&fxl6408_pm_ops),
 		.of_match_table = fxl6408_dt_ids,
 	},
 	.probe		= fxl6408_probe,
-- 
2.51.0


