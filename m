Return-Path: <linux-gpio+bounces-28554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B46C61F45
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 01:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 676774E63CC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 00:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B581A9F97;
	Mon, 17 Nov 2025 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8Bzmt4I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEDD199E94;
	Mon, 17 Nov 2025 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763339572; cv=none; b=fTYnCkPObnDqUTQxbxH9swLylordyrHO3zBZEeLQVVVTWh4aI7rOEvSQz2UxIN1Hi4/7g9ANdVq8gXYvPInmaM+kJgwyeb1u0q8OwKKMLAg4JZSMyW7hYF6cVSsUpeCQlrRhyMfbXmc55GhLJybgyKJ/ZBO6bn2qNq3zn37qaUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763339572; c=relaxed/simple;
	bh=o2bQqLF8u/ZHanTGISB3CEToiXI/T2FMMohIktZ+gA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDIjM/VvLLDny3kiN+9mti7412JfzELGbcxOnM/MCezzjFC0ZBun62OFKEolC2rhtwoEDv3+8qlGm9eFVFHPHH8aSajrl4olqlkC4XPPWLNHdj0RF9uWK8zWYCYsdGpOS2yMrDdK0NPHw7oS5lB/C27552MxD5m6vHfSNn/pk6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8Bzmt4I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AADC4CEF5;
	Mon, 17 Nov 2025 00:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763339572;
	bh=o2bQqLF8u/ZHanTGISB3CEToiXI/T2FMMohIktZ+gA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8Bzmt4I5wRQ5oqu25YYXn5AMklAHZnchQlnH/Rz+svEJRuF1ETTC9GVfOi5z0gaf
	 cspQtB+St3JwRESCtBClMLpO0LV/Md9xky1ntql1dcFbaRccp8CUxagPEIp9od9EaC
	 fVUm8osCsYyi6GtNMsO9rg58ivTKbgzgrtYDnADzg0ZuslvbciAdqWNeWOEyeE6zIt
	 jcY9C1IbDQNikOK/N7vJ2juveCMygyS/e2fIzpJCUCh7z8ZRUgxEC/aO92btLtLR9F
	 MStupxbxGg2+FWUvdmJkc+Ihs9/wQ/Jgy8zLyY9uzDbNpwhlmKn25QqaiY1nEeiGJs
	 qWidvsEaODRaw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] gpio: fxl6408: Add optional reset gpio control
Date: Mon, 17 Nov 2025 08:15:01 +0800
Message-ID: <20251117001502.12618-2-jszhang@kernel.org>
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

Add optional active low reset-gpios pin control. If present, de-assert
the specified reset gpio pin to bring the chip out of reset.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/gpio/gpio-fxl6408.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 86ebc66b1104..7074831639ce 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #define FXL6408_REG_DEVICE_ID		0x01
 #define FXL6408_MF_FAIRCHILD		0b101
@@ -104,6 +105,7 @@ static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 static int fxl6408_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct gpio_desc *reset_gpio;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
 		.parent = dev,
@@ -114,6 +116,10 @@ static int fxl6408_probe(struct i2c_client *client)
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


