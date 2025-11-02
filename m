Return-Path: <linux-gpio+bounces-27922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B727FC28D3E
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 11:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD02118907EE
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 10:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E45F26C3AE;
	Sun,  2 Nov 2025 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdUQMdz1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B34026B08F;
	Sun,  2 Nov 2025 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762078982; cv=none; b=SmC8EoRIoz8MvAeq76z562/fTCxT7xZZ0N+KdPsNIZylKPFOyagShxQLH4DJAmvEqTVO1Xr0EOJSPyaVHcbvSnJZGgXZwtBz1aIOTGXug1ckyViv9DwQFLe4XYtuUcf5FAliQU5b9kSWqtIaIhse02a9RSswOMjn1TmtMYohJsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762078982; c=relaxed/simple;
	bh=paM6CQPxh4C3n81D8F6oMjgx9DMv0k+gpxswKZnGDdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6/J0ryzgNtnkmTS3yYS8P+ykyaHmsrlV+eowBtqkiuFK7z7otTCFzyLe8sSbKaZ7CPKn6k/WquQndVFLZ77J/lYJTSSqHCZoFUyRxV8I9kW4zJzlT9gCBrdY17TfHJxr+2BJZP6MFriKqz4D/8VrvY6V7kIudgMLmtxCtauej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdUQMdz1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01C9C116B1;
	Sun,  2 Nov 2025 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762078981;
	bh=paM6CQPxh4C3n81D8F6oMjgx9DMv0k+gpxswKZnGDdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VdUQMdz1md/0KgQ37V0wgDkybzAxaKJVHJrexHwEX9ukee3DTYtg9oSCXLOxh3exs
	 uDNuE6bm13lhoLNHwChcvZSyuI28LcOiXiJqUkPisxGIlz6YBZvLq9Lg3Yb4n1zOPy
	 rVMrUrsEreJ/Z/jixPy+kS8Nd8g1vA/7uFec2343r9GbaD5oH1cdeYTad+mOpDUhTl
	 LtYWV7dd3M9BMWhDMvgTpXQx264eiibEOe/lXHtF6NHL0psjylkZiHkBC2yDi0EGpD
	 UE1bDdgi/dLB19Nu7k8KLWYU7TQw7OqdnNjbUQAMeWWGdnipWCuy4+KOi4GiXyvBHK
	 q1yiMkSjf9Zzw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: fxl6408: Add optional reset gpio control
Date: Sun,  2 Nov 2025 18:05:14 +0800
Message-ID: <20251102100515.9506-2-jszhang@kernel.org>
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

Add optional active low reset-gpios pin control. If present, de-assert
the specified reset gpio pin to bring the chip out of reset.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/gpio/gpio-fxl6408.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 86ebc66b1104..ae520305f7a9 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -104,6 +104,7 @@ static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 static int fxl6408_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct gpio_desc *reset_gpio;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
 		.parent = dev,
@@ -114,6 +115,10 @@ static int fxl6408_probe(struct i2c_client *client)
 		.ngpio_per_reg = FXL6408_NGPIO,
 	};
 
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(reset_gpio), "Failed to get reset gpio\n");
+
 	gpio_config.regmap = devm_regmap_init_i2c(client, &regmap);
 	if (IS_ERR(gpio_config.regmap))
 		return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
-- 
2.51.0


