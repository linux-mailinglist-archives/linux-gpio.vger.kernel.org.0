Return-Path: <linux-gpio+bounces-25453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E57ABB4179C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BE6B4E4972
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F5F2E717C;
	Wed,  3 Sep 2025 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DFaafVCE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DFC2EA172
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886434; cv=none; b=RA/obJjFYxO7Zkj2UpRJSxlMn4ky64axPyXptMobNkIjyocY56pfmEWKBNgSWnTbXMDUulujNa0Qb4N3gYFSMPq8NKBcfIKKKU/hn7Mphdn+LrG3CZ1xXEj16Th0rf6OarTVMPHFJuVtm3SsLI3pQa58njxnJ24FXVzvLiEgP54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886434; c=relaxed/simple;
	bh=yEbSdWltyVaUiMW4qgmKj7r6Z1FdoB+9MIhAE+TP7/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZAUi+AB8wKcfCqCOLy69OKeeKbu8Rmh20zNWZnOIZUH5RAXbOo2GNLIawXU6IfCTnY1+Gw3RA/QDVuA2m1+0xkz7wA/JyAOFPpduxF81bk8IRTAYgL6Qw3mhK4hDDq2xXOgWd/J8hFKFJjC99VHwBsfgDM7x9h40TxUcHW52Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DFaafVCE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so56989375e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886430; x=1757491230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRYNdQy943R+RbklVUnqdkNQm9znH10Kv6CwsOXt8JY=;
        b=DFaafVCES+YCp83YoHBS296McoQ4ZtwJdjx57NKp1LMPQ3LUWRFQxJDFi+UNbUpFW0
         bun+GwJ4nDEVRvlphq2vV1n325GuAfUjEBaobvoOFtfBNk2Y1WF9mR0vErqFnmzp/gPk
         /eGPAVv/M/dh8njMr/8SRwDHOxZlKL9SBHnb2wLAoSqZq7Br2qfkbtlmJXpRpU1azaLb
         qg5462PoONqAf3QBcnLTwLlUAsbY8yfJBhdJS3Xn7cKJmyo1KmxXnhQjtKQB9yXrsBDg
         loRSPBjrupjDmTdSb+/snUHo9V5v9HcJs9KEWV6minDQn/6aC2KrnpeAJiOuz3y7PxlM
         GoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886430; x=1757491230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRYNdQy943R+RbklVUnqdkNQm9znH10Kv6CwsOXt8JY=;
        b=SJpJZYdXs/0pSooRo32+pv8yqJxZ4qRVANx6rLZEBzK68HoXeY40EPCB5mip+MEJbF
         AdW5MLdYbzjJ3XQAjgWsiBeAwHaYJf/fC2vVFDwOcNJbCZDeFScbQbmlBHbFWbAJs7VJ
         sZWMnYtWapVIkNlKzusezi88DsZfbaXOrxJmZRfayMc+x0y7y+o9FCcjU2MyF71ccGSl
         mrGyU4TfEHO9BLFrv4BnXkfnVkUz0rvaldwKUih4DZgB0JskK8/SBBWFm4ary3mYRm6L
         puT6Yl8yjrxLEqxdZdAigPKPHLDz5Zz9TgwqJ5yHregFzVzURyV2B9itzEKJRur9brUR
         67uw==
X-Gm-Message-State: AOJu0YyMbREwCTkhWcDk7EM2o9E6FLWzaGV4kzoQ9Qi2TXFyt0lz6Ucb
	V2bs25gfAvysTg1u4aRmFFUoFdBHyf/OYOQFYBfkmm23KNpE2wElV99VDBBefjzVIK0=
X-Gm-Gg: ASbGncvxfAvDmAjqtoUBqRTcK9SzC1EHzbbotFfNX/urB1ng992OUGsHt8wE4YqkhW7
	aKj+jKq3vmBH4oMlD4Q86uwEEer6sTax+DypiJbgZVs6Kf/1aDXmCHJ6SzjpRzGXbreqjZvLAsH
	xwXB9LLACF5xZZ2qhJKm5Nd99pJ7WOtdUUQdtBbhSE7ntD5yER9v0Ke69otysYCDzzSFb+evlhl
	X72snUwlISfNC3Q2enfpRk8brB2+WBR42pYxb2baru8an9yRC/gskl7hOfX9jpZsEZOKnH34IW9
	klOe4PqTVVFk8I0HP1XLkQMStt8wSeNZ4QWkrMZpwaNkIIFZEw2lJWv2pKFMgn8j3arPg2FoEH2
	3xNwTvIz/B41N/xcZ
X-Google-Smtp-Source: AGHT+IH5L6p5lvpQSzwb9hjpzehXqLyw7I5cuurgC7EW14rbfoWtVicCMxuvWIH2n3XlzV9uLU93gw==
X-Received: by 2002:a05:600c:3f0a:b0:45b:8703:741b with SMTP id 5b1f17b1804b1-45b870374demr111370805e9.32.1756886429754;
        Wed, 03 Sep 2025 01:00:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:12 +0200
Subject: [PATCH 08/12] gpio: mlxbf: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-8-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=66g+H3iGl27thfIix2l/34o5dDtfV0hzZHx7E1sHzqQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WS4EuSeP3PwfBxTOs72QjuheD/aV/Ni6ymV
 0R85woPrZqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 cu99EACjetDxjcdWuhQTiim9N6kLVVSx7Bg1OPnDIbnP2BjHXSd9Ipf/oD0zErLFA2hokK203dl
 2yu5aYgWG3HNeh+U+pcwQ2yc7SQR39jvjJ37VMdfAcPjm9gnW3SJLwNVLTYe6dxNh4aBJ91QVBN
 mtJ2XewpBUW4VuAJEKIkZkJYCtIFVkmQXHzYGIhOxbNljjSvcSWpxkk0joyMI0rETRkAcGqiufn
 GFx44a7XzxlpRJhBw5Py4BT7XCmwQ9baqnSe6fgbAYEqo2v/kn56xhwiBzxQc/YKTskAwnjN+6T
 8xobT+KF1HFXRCO9DR8gIXeaDNJK6sZbkjxMmXnT9Z0WgQxB15TNmVRrpDFzrcGGuo1Qq2pSnxq
 FaA/+P954JOguDE9aUgs9YJIcrWEGAn0O0qHGVBDPX0h1w4w0uS82lSepCfAa/toae3I+KatPyU
 COeO+QOJDMtrpjZVerEvf8e3CwzACwu8jAHcIq4xZFCZzoRGRrN1VqPD28gPGNuNIbBK1C47Lto
 O+aIbE4cvJwnWMb8EaeMBIm1tWoXDnOgTE0+z4snPgCOZNYbacxIUhKFbn1FcSB4+qJBf1X5iNe
 ERWDsjlC7YldDGwz1/3kAXitm7JMIppy3uh8mO7gcxSKpPIuWQ0HellutijrPGYY4L1hc9r2k9X
 8Rig4aSbT6TG4rA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mlxbf.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index 1fa9973f55b96a4b517b5864ffb92fbbf8626053..843f40496be7b723c300b3ea2f19fc698a56abba 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -4,6 +4,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -37,7 +38,7 @@ struct mlxbf_gpio_context_save_regs {
 
 /* Device state structure. */
 struct mlxbf_gpio_state {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 
 	/* Memory Address */
 	void __iomem *base;
@@ -49,6 +50,7 @@ struct mlxbf_gpio_state {
 
 static int mlxbf_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct mlxbf_gpio_state *gs;
 	struct device *dev = &pdev->dev;
 	struct gpio_chip *gc;
@@ -62,21 +64,24 @@ static int mlxbf_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gs->base))
 		return PTR_ERR(gs->base);
 
-	gc = &gs->gc;
-	ret = bgpio_init(gc, dev, 8,
-			 gs->base + MLXBF_GPIO_PIN_STATE,
-			 NULL,
-			 NULL,
-			 gs->base + MLXBF_GPIO_PIN_DIR_O,
-			 gs->base + MLXBF_GPIO_PIN_DIR_I,
-			 0);
+	gc = &gs->chip.gc;
+
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 8,
+		.dat = gs->base + MLXBF_GPIO_PIN_STATE,
+		.dirout = gs->base + MLXBF_GPIO_PIN_DIR_O,
+		.dirin =  gs->base + MLXBF_GPIO_PIN_DIR_I,
+	};
+
+	ret = gpio_generic_chip_init(&gs->chip, &config);
 	if (ret)
 		return -ENODEV;
 
 	gc->owner = THIS_MODULE;
 	gc->ngpio = MLXBF_GPIO_NR;
 
-	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
+	ret = devm_gpiochip_add_data(dev, &gs->chip.gc, gs);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
 		return ret;

-- 
2.48.1


