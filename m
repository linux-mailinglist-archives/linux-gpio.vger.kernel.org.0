Return-Path: <linux-gpio+bounces-24403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD69B276FD
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 05:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D131CC73B5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 03:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D25C2BE023;
	Fri, 15 Aug 2025 03:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4kkLnsj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B122BE032;
	Fri, 15 Aug 2025 03:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755229349; cv=none; b=pMZ+u3YcHAJc5j8XSotZkGbYJ9r6+21or7z5P4lRZRstjcsdxDzvxXkDXOi2gjYy0zIHEVPLwk9bYpC9gGdbsnZ7ur5ckXNp4TomHC6WVsbIRFW72UmAIG1UptN8t8QRIL6aOLLBgfNTVsRpe9Na72I57D/+SOu1GUm70KKJMZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755229349; c=relaxed/simple;
	bh=I5dapaNLIkvMc00JO/07Q1B0pE1zKzAGg28kVhyJFvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y2wC+ElUuQZv2P3y/AQMIv+N5oDKnfpOrXq63jtnxfyWZCELahCnyKAXT66FXc772mgv6iYarog5iEnJ1jLuuLhSejKeLBtt7tmHCmWwoRrWsuJ0E8+S7YgSePdq5m2ZbIH0BaDv4UpHXf9bj+2b2lDcue7pMQJFS5mlz024vyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4kkLnsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69BAC4CEEB;
	Fri, 15 Aug 2025 03:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755229348;
	bh=I5dapaNLIkvMc00JO/07Q1B0pE1zKzAGg28kVhyJFvg=;
	h=From:To:Cc:Subject:Date:From;
	b=m4kkLnsjnh4uPOs14lH0FWJB2Wy/6dxQLCQXkR5x6SlqDQMBzt7mPAnrbaKJsHT6D
	 nxbVKAkrASmSOWT/JUVRWWF2t54uMhqQ3wuL4dCP4Jb6YwwQGVOjF6+itNGGAQ5NXy
	 BgxLnh3mkQio00qXalExqyi/nHrMaqqtEbobNNiJKZl0eRm6wjQAojdlbqQNG98XBo
	 utLdxHGAXgZwXsCS3fdZWOJw5t/I9ZtXiP1cqbOvTCVQlZjCmGmvMqEVdNNsf5XXbx
	 xBvzJ9MIlSVl2iwnVpH+LdumiKidR1AUEGt9lRJw0VqG4PHLWDMP7QAO99u0s9+Ha6
	 +hIKcRf7rQVwQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: fx6408: Add suspend/resume support
Date: Fri, 15 Aug 2025 11:25:18 +0800
Message-ID: <20250815032518.1524-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add suspend and resume support to the fxl6408 gpio driver.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/gpio/gpio-fxl6408.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 86ebc66b1104..e7f92b37e060 100644
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
@@ -103,6 +107,7 @@ static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 
 static int fxl6408_probe(struct i2c_client *client)
 {
+	struct fxl6408_chip *chip;
 	struct device *dev = &client->dev;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
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
2.50.0


