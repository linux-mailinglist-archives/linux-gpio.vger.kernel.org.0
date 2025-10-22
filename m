Return-Path: <linux-gpio+bounces-27466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7281BBFC4BC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4F8D544D3B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7963E34B1AE;
	Wed, 22 Oct 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vpfAq8cE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552334CFC9
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140491; cv=none; b=dFch73OE9k8F/D7Xb0l29zu+3XxMItQ9c2fiuTvAZApnoDVKefbQIN4NO4CTjZserLJaDccQA2lhI+mgMoH0I3d+h4B/vMOyBdihQ8fcnVwO/y8sB2qGejvWtJMSVK0Ej+Am/hde1Ut7BCyLCedL1tt10YReABkJVYAYGOf32Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140491; c=relaxed/simple;
	bh=m1JdDoMgh0ca95Wdi4jbY82dvu7Rf9JBxKnwAoP2oQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sRWy9MvbtRKRa/8mLFVZx2gU6sUL9b95R/Ljr4tjeuGwMdWv6cRXurJ1wSI7P81s6nStR9uyYlpm7hTDBQnMRehQtQz9igscIHSlQbzWNYxdyxVmk7DQTLjHgUnn7ftDZMFhSuzAwVR/PPz8nvzw8Ysh0pEq7zgkxA9f5/DK+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vpfAq8cE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4711825a02bso46067805e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140487; x=1761745287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6a1DjmvjfMTN2KJlpFLKmRLMiMsMuLAksFf8E70/QQ=;
        b=vpfAq8cE7LsNu6BAL7Vt4OiVZVbQ/RuHf92p9rg6iGqPSYlleMR5IG2BNPfC0OiuNV
         waOHrqMfWXVZUoXFnWwl9An7klGr+83QwOGJrmZn7EvkRpq5eNFKZtN6hRjvA5oqmdms
         6iDRdZgcKD3yUWt6dnq0jg56T9ubnuBUeqSJFdEALTpbVDStGcdj0S/3c5EG1TmlJkqd
         X1eh9YT0lyxqBcs/PJnmzMu4QAcmx5ncoXAmtWkSZpN136vj5AQZ13xBd4B/IciFc5Gu
         S1l/2Tq/Qxknlu5SekCY2qxhcTtHGpOZJia3pxqBqt4Yr0E72CmfPoNgG/pok2DPXTec
         JViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140487; x=1761745287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6a1DjmvjfMTN2KJlpFLKmRLMiMsMuLAksFf8E70/QQ=;
        b=XQ97eexkn3qil2ohQwuE3tLwFltUS5BpXt+2SlmYAhxYn27ULvYfjgCUEWOW/OZzLf
         gbLWQ9QTIAA3Sq4wdRzn7DZWA0Tq5dstQqPxIcUasoXzXM+SYm0xrCBqw2OOf6HLh2GR
         OzG1mqFcUmcYOD03mbeRkpHoKHAA6sLGuJ8YBG2pZZaKaDJKNoPFHVk4NesL3impRAtY
         cQdznPVOPM8FzLAOrXvdLN6I+Ox3ECvFAvf5W9YT+Ae2K0TOdaVssn2FQxU6rqcxcdyA
         a6Lya4iYCy1bPQmgKROGJ06VXYn5rSbl1JD8yqbPgk6/T11oBrNRydkIUYN1dIbpLjgj
         HMjA==
X-Gm-Message-State: AOJu0YwyOMP9frYjoPXRhdDxwqcfUIhRra8XbvuwbrcY746d6S/izpGZ
	Mn2VEDke84iwP0cFkj2XyIzhfKkG4EguSFdDd1DIIc1YgNG8Y3MWMF6Kl6V7iMKjRDo=
X-Gm-Gg: ASbGncvxwHEYhI33uwQFOTy8gs+jjO60Hwv++jf5B61zkIXggh+G5Om/t7BQb31o10P
	DsetXJP5THRBSLs5/7SKv2SStNuaanM8KGqfivlZgbMuwY8qgXyij/jxdkXzuYl6nI2qooqC5DD
	BqcpzqnndaOPzV1IXat4sAcnudnUI2o6vO/tV25AsZxisXSTfhuaPa3etEbIYtZpgN8k+cbWKSW
	iDsJMv02Q5xu0lOpym/9JG8C6elOBKp5Of8Fq3XBZNCJUSJH3pfe0UDETsFfShNGV/HZTMg4gE9
	M4+UDhsoi/xQh65aEKrJbbtFPc4I7EUTZqVzS+JpCoWWzOOe57uVgYhan7ho8ZrZ1L8STZiIUtG
	P2pIHQ4WTElmHh/YLKb0X4k6QUPV4qYwBYh+FKfPBbrqkN7tXWmxjq/djYC+JIwNfQcY6bubQqz
	XKhY2jJQ==
X-Google-Smtp-Source: AGHT+IHpoXoVmPxGH57ApO6bnzlIOoT7JPNqbzyRJBdcn3OmRzck3tv7+ZKYpLI8FbEQF1XOjLmk7Q==
X-Received: by 2002:a05:6000:4305:b0:427:809:effd with SMTP id ffacd0b85a97d-4270809f192mr12834301f8f.37.1761140487421;
        Wed, 22 Oct 2025 06:41:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm24863066f8f.36.2025.10.22.06.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:41:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:41:07 +0200
Subject: [PATCH v2 8/9] reset: gpio: convert the driver to using the
 auxiliary bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-reset-gpios-swnodes-v2-8-69088530291b@linaro.org>
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
In-Reply-To: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5033;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xbs7F/Lj9CLBjlX08WLa+wBJkZIyXIIqMlNQKiwhuNU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+N70RofZRYEECAhD3Ra4FsahYN4O5g++Ouau/
 RvNInoMnlqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPje9AAKCRARpy6gFHHX
 ci9KEACPGc4sRnW6ThD2w623/pdRIcJJ0ip7RNYm72P/8YY/6Nj7yDx+njaYDiB93Wp4vi/B5od
 4PVLJloCved+632IsEzsvImRKcg0czslGIpEFbjGwbo4jNQXAmI5uH5n+/aeTM0PXFakFot2kgB
 bdqzi55+2LRhk/UQwddLHa/ESTwAB2UI/gTuKxaW/cPEd27+NuE7XbOT8Hy4hQPTOYm3gnp3Czc
 wTi9HdloxsdxDAvUXTTaNW1lO6p5+qRxS6293VGbyCF2S315MFGuSEkL0K7bML2adhNAdZzfVS9
 6O4IyqdNLXgqm/SIcdqo1JX1Z7DXYYzu4gxzHwDeJCeeXIi9OSwB1VtZtCADCLsIE4EPiZxfSPz
 NMNz3nJdjZSWav3mhNQPBGc8M+2OOjJuS6q0tzSiijSmTVTvdBRWqZWwu/SPkxHxBC26Ssc2/VO
 /96yif6chplfaKcOTEX8CytjfwIhc+Q25JpkdfhKfH6bCyM5/WnTk62LYjyjOva5n82T12NCa29
 J2e3aAiBG4HP8UzNPH9iK6GHIAaFtMPBMT89hutvpiVKXUcBex4x9V585+3aZN5heWIC/3xs4G2
 qZDmnFkZ8yUzMKh/Uwt24PZ+enjt9Bn1UO+z6CWxhqiOWF/t1jGB1Ljg9cFQMUFr4HIAHzGX2Ff
 bhBMr6eq1NIP5mQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the reset-gpio devices are purely virtual and never instantiated from
real firmware nodes, let's convert the driver to using the - more
fitting - auxiliary bus.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/reset/Kconfig      |  1 +
 drivers/reset/core.c       | 14 ++++++--------
 drivers/reset/reset-gpio.c | 19 ++++++++++---------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 3102f5d7a93690f262722733e475b1215f61051c..24c9048cc7a31d3a6c9fb9af0726a8387bb3154a 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -89,6 +89,7 @@ config RESET_EYEQ
 config RESET_GPIO
 	tristate "GPIO reset controller"
 	depends on GPIOLIB
+	select AUXILIARY_BUS
 	help
 	  This enables a generic reset controller for resets attached via
 	  GPIOs.  Typically for OF platforms this driver expects "reset-gpios"
diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index ad85ddc8dd9fcf8b512cb09168586e0afca257f1..c9f13020ca3a7b9273488497a7d4240d0af762b0 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -7,6 +7,7 @@
 
 #include <linux/acpi.h>
 #include <linux/atomic.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -18,7 +19,6 @@
 #include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -882,7 +882,7 @@ static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
 	if (!lookup)
 		return -ENOMEM;
 
-	lookup->dev_id = kasprintf(GFP_KERNEL, "reset-gpio.%d", id);
+	lookup->dev_id = kasprintf(GFP_KERNEL, "reset.gpio.%d", id);
 	if (!lookup->dev_id)
 		return -ENOMEM;
 
@@ -903,7 +903,7 @@ static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
 static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 {
 	struct reset_gpio_lookup *rgpio_dev;
-	struct platform_device *pdev;
+	struct auxiliary_device *adev;
 	int id, ret;
 
 	/*
@@ -959,11 +959,9 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 * Hold reference as long as rgpio_dev memory is valid.
 	 */
 	of_node_get(rgpio_dev->of_args.np);
-	pdev = platform_device_register_data(gpio_device_to_device(gdev),
-					     "reset-gpio", id,
-					     &rgpio_dev->of_args,
-					     sizeof(rgpio_dev->of_args));
-	ret = PTR_ERR_OR_ZERO(pdev);
+	adev = auxiliary_device_create(gpio_device_to_device(gdev), "reset",
+				       "gpio", &rgpio_dev->of_args, id);
+	ret = PTR_ERR_OR_ZERO(adev);
 	if (ret)
 		goto err_put;
 
diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
index 2290b25b6703536f2245f15cab870bd7092d3453..7b43d61d0467aef5fbbad53d531294fa62f8084a 100644
--- a/drivers/reset/reset-gpio.c
+++ b/drivers/reset/reset-gpio.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/auxiliary_bus.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 
 struct reset_gpio_priv {
@@ -61,9 +61,10 @@ static void reset_gpio_of_node_put(void *data)
 	of_node_put(data);
 }
 
-static int reset_gpio_probe(struct platform_device *pdev)
+static int reset_gpio_probe(struct auxiliary_device *adev,
+			    const struct auxiliary_device_id *id)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &adev->dev;
 	struct of_phandle_args *platdata = dev_get_platdata(dev);
 	struct reset_gpio_priv *priv;
 	int ret;
@@ -75,7 +76,7 @@ static int reset_gpio_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, &priv->rc);
+	auxiliary_set_drvdata(adev, &priv->rc);
 
 	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->reset))
@@ -99,20 +100,20 @@ static int reset_gpio_probe(struct platform_device *pdev)
 	return devm_reset_controller_register(dev, &priv->rc);
 }
 
-static const struct platform_device_id reset_gpio_ids[] = {
-	{ .name = "reset-gpio", },
+static const struct auxiliary_device_id reset_gpio_ids[] = {
+	{ .name = "reset.gpio", },
 	{}
 };
-MODULE_DEVICE_TABLE(platform, reset_gpio_ids);
+MODULE_DEVICE_TABLE(auxiliary, reset_gpio_ids);
 
-static struct platform_driver reset_gpio_driver = {
+static struct auxiliary_driver reset_gpio_driver = {
 	.probe		= reset_gpio_probe,
 	.id_table	= reset_gpio_ids,
 	.driver	= {
 		.name = "reset-gpio",
 	},
 };
-module_platform_driver(reset_gpio_driver);
+module_auxiliary_driver(reset_gpio_driver);
 
 MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>");
 MODULE_DESCRIPTION("Generic GPIO reset driver");

-- 
2.48.1


