Return-Path: <linux-gpio+bounces-28555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D55C61F4B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 01:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35C884E8307
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 00:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA7F1DED57;
	Mon, 17 Nov 2025 00:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4rAORXE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0DD1D7E5C;
	Mon, 17 Nov 2025 00:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763339574; cv=none; b=ZQaL/ooTRZnE8SOwdI1z3C2LeTAzkl/EYJj5WuDp36i6d4MrWtSa1RcvHsfGWXzAM13elcCkH643FfeiSZf0u7JFoRvLLYM8xoLtrRvZz+j4STXapHD10YvZR9DAqbbjiTH6StRsoYJ+fADptnjGhIGBOTUiweH7M+QYH0t/om8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763339574; c=relaxed/simple;
	bh=DZsDUiu+SXkRggFDFwXJU8BenDPKw9Iy9D0wWP/jWss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOIDrpNNBZF1630IjFJv1qnJ4OKw4R6+75qhJWhsfj/mAfga/hNsUT15+W2DajsNI7nWCMORlrHuUNnNrlFzton2O/nPGyPuDHEsptubGUJbH177ajCjfQat7k5ikJrmeitJ37zMsrml/YbOi5+ReTWB8pucsn6QToBIi7267Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4rAORXE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE009C4CEF5;
	Mon, 17 Nov 2025 00:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763339573;
	bh=DZsDUiu+SXkRggFDFwXJU8BenDPKw9Iy9D0wWP/jWss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4rAORXE40/hb/8W0qdfTdXfTfosBy4I3eud5ID90M0eSgLT9k1duv+Gunx0g0HbC
	 /d39S5FGFcCwXU94yzgLbHQpIJo7tc+ifUpEHobNhg4J4yWX+5HpTPf3WZAFxZvMJr
	 MJZfi6Bq+Iht4OAPBe9dvgMT7yUHEeabb7G617PJ3xsFQTQtF7Ae9OpXKwz1V7ZtAY
	 amyySB4GX+khT4SD6ysjwJmFQNhevQbviM8dCU/wouraNty2ozssKoNxZxL9ZPHJKA
	 WosJVM+JYD8p/XQrIhjXo0mBRCoOiIO6gKt0esNtsIGie6sloFr5UMIhYPmqr/wF4A
	 xmCJ5hY7AhLfw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] gpio: fxl6408: Add suspend/resume support
Date: Mon, 17 Nov 2025 08:15:02 +0800
Message-ID: <20251117001502.12618-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117001502.12618-1-jszhang@kernel.org>
References: <20251117001502.12618-1-jszhang@kernel.org>
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
index 7074831639ce..89cf14b5e3a2 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -44,6 +44,10 @@
 
 #define FXL6408_NGPIO			8
 
+struct fxl6408_chip {
+	struct regmap *regmap;
+};
+
 static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
@@ -106,6 +110,7 @@ static int fxl6408_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct gpio_desc *reset_gpio;
+	struct fxl6408_chip *chip;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
 		.parent = dev,
@@ -116,6 +121,10 @@ static int fxl6408_probe(struct i2c_client *client)
 		.ngpio_per_reg = FXL6408_NGPIO,
 	};
 
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(reset_gpio), "Failed to get reset gpio\n");
@@ -129,6 +138,9 @@ static int fxl6408_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	chip->regmap = gpio_config.regmap;
+	i2c_set_clientdata(client, chip);
+
 	/* Disable High-Z of outputs, so that our OUTPUT updates actually take effect. */
 	ret = regmap_write(gpio_config.regmap, FXL6408_REG_OUTPUT_HIGH_Z, 0);
 	if (ret)
@@ -137,6 +149,16 @@ static int fxl6408_probe(struct i2c_client *client)
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
@@ -152,6 +174,7 @@ MODULE_DEVICE_TABLE(i2c, fxl6408_id);
 static struct i2c_driver fxl6408_driver = {
 	.driver = {
 		.name	= "fxl6408",
+		.pm	= pm_sleep_ptr(&fxl6408_pm_ops),
 		.of_match_table = fxl6408_dt_ids,
 	},
 	.probe		= fxl6408_probe,
-- 
2.51.0


