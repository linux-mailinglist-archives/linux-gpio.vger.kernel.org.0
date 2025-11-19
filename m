Return-Path: <linux-gpio+bounces-28790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 69148C6FA8D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6F7AE3A3406
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CB8366DA3;
	Wed, 19 Nov 2025 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LHDTEt6q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C550F364E9D
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 15:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565717; cv=none; b=JDYAiEn8DUqxzY7Ajb0cO+x5PPL3LoIwBAhb/Rxu4MgZRT4F54rDzDkzuitAfs3tycv0UCXCBA4uAjAaR0pR4sxIIGDJku6qn8pJVHwTHqMGTWINAe+lvtAjWfu9jkV/0HEXdKZ7opsX9DwRFzxBBj0AfWvQo0xSN0GoeL4gTo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565717; c=relaxed/simple;
	bh=pCyof7wpaaJnTNYVQB5wytgT0h1Vlvk7iBUsVGcz4O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sNV6xYqZj3xMOGyFio8WpEnNXTbes2sMGRHPqRd93ap1ZGQdWII3Nxb3jFhq3GmAbmidYgPyYmyo7mSXaHO1JICVC2I4756aekH71xib25nSnQk4apTm9CViSduZsHL1EcugsxXOdXBbkbBTV3OkXPS6izi+MRDCZhiQdSvZ+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LHDTEt6q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so49761725e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 07:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763565714; x=1764170514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Wokim2MnbflW2UCaKEy7940kyHB29tB77UTXT5rzIo=;
        b=LHDTEt6qJmE8V9d26nEWThQVQKMaK+P4tBhXt95sDl+ThXUmAhuGW3JuXjl0T5RVIY
         JpDKGUjovuaziiP4ZxPuWjsPue3rnO6ZbZ/4ZLRzVgdivJFu6gUKi+9I4I8mGqfwtbQF
         a9e3IVSd86hvS3+J5mx3Ewkau4oxCe8lbJnSJ0A9Z+lFuSHL1RbQ+/vjyKU0OWQHDcqb
         1rHKvbT0s2dO0n6RM8k584iikZVUL7se9c2fykCRWBNw8zK2ZwqS6p0GD5L5V97ZCXOm
         lb1/7AlSCCsAJe2IWtOhRelKhOoPytfwX0nq/oUKRwmFSbgNelr221KejmJI2Wc/vJGb
         faBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763565714; x=1764170514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Wokim2MnbflW2UCaKEy7940kyHB29tB77UTXT5rzIo=;
        b=a7aYnH/Xc987cPYedaIkHAQyURkfvZ41Tb76b/FXhmBjcuZDqL8eXZz5h1l3agU9Ra
         CBaKdI3YWVSjnPCNQUTMpM03L0YgVE9WjdymNfCqsVIDwAqLCwHvw4b5BuT0A79G87et
         2naV7HAsonl2sGuGyJmM4rmFdGEjcazySNANslItGwDo5fbDyK+z9HBAyz0nhor+RTm4
         qtX2Wjo9J2ZxtWzRGB/Y3WoizwX679hQTR0b0d2PAKmDKswI0EKxv1L0m3LEpkmIvHmk
         i+tQIetB1Nb/GPPfU6B5z7brFJvJVohc1I8ahvHrnvdS4z+HYJYLO49Oc/0lizVA9/U9
         kW0g==
X-Gm-Message-State: AOJu0YymztKAZ5uLR506MMOynAZ2aoOmZd71B4YeJSyxRYvWh7W7T6KF
	awZ0dctX0e/HiOIty6mYa7zNKOCZGWa9WDD9mfezBtloHHAbdpsXrcdNomy60jXJULM=
X-Gm-Gg: ASbGncsR71eh5smroBLoBLmFR3qXMwLjHS/TvEDwnMOBWGUzQoGPkFwZNLUl/7qzFSx
	zsVqC4tQnwTmAxV9PFjAVS+XpEZGgjdNWIwGJshcfJTXG6q268cNzmWZSj4iDucpLOxlzTsj2Bd
	ODi8d3bHpwvHcBkO0gP4Bf4vfeFYIbzIEWSXTHHoCRDztRBkKx+GkMQK15QF1JtsUogecdaIktJ
	g2dnNIXwP9Y8kYP2b0Tho7e1MtaQnUvjuZmMSKWpR5FikxNJ/gM2StmWRY31EYtVK2I3hQ0vsJp
	fJ7x83mJh0csEU1pCgMIqhU8FsxDb5aLkIs55MGK7J6I48xx42IEfXVnI1oMkIF9J09M/7wKvjB
	iwQM9Mptp1VZljVPSrRIy07cj9F1WF/pXsE8HwBx4h89XN65OyFnEeESMwSEz0yzPJVzKjZObpX
	DcisyfJMJEnbuwUsY=
X-Google-Smtp-Source: AGHT+IEIqa8r3x+XvV4zwMPPkOaNTfhmxNDifLzSTQW5ijcuh1xO+A13RMoY6j4TwrH7+wc5ucNKtw==
X-Received: by 2002:a05:600c:1c23:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-477aed0fb8bmr59304935e9.19.1763565714049;
        Wed, 19 Nov 2025 07:21:54 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1076865sm54429375e9.13.2025.11.19.07.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:21:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 16:21:29 +0100
Subject: [PATCH RFT/RFC 2/2] mfd: cs42l43: use GPIO machine lookup for
 cs-gpios
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cs42l43-gpio-lookup-v1-2-029b1d9e1843@linaro.org>
References: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org>
In-Reply-To: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-spi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5081;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0NCKcXGMy5kZcnsdXSMWxn5BADFkeKJ4N2fCRMr3Rl8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHeCMyt/IxRPrdK2pSzNuP0fxbrQ46lELbDKsU
 TC2U/8J/hOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR3gjAAKCRAFnS7L/zaE
 w1PvD/9PCqRFIaRGrxOJK2NzRI/juuIGcJFYBpti9MuLFrVzljNhJTJsMtKXU4TLRUonZ1/BOL0
 Qoh2W7g1sNRHidNy21szrrUAeAdpyAbMOJoTqxik40sFAm9MOeBTieJuMc4OcEf3scH62lGE/p7
 jBiqMCTvZVxO8cbnx+4NgA+4iklexHzBe9rcYGqgBXAsW2NXJnje1Fa1bBSlzVz8exy3m/NTu1y
 pIR5QY1puVfLr8pUJRhk2P/GhI3tCzbS+DffsREWJBH3U+JEdfedQkJbXRK5s5t+SW/FNmakBlH
 IclKr1RB3l48rGV8/7PMEo8YrR9vKHZ7BCk5sOdEcot0k9n9iidIZAdLWWlQ5q+9VbAvW8N8sEw
 yhyTEnTzfILvX8Ff4bStY9mUNsYOskFExO3xzjQApAQn072BiImMWPwk2nU8F3qPadscCsXXBi4
 xHYZ3LAOH2qr4MmzsI9RC8bJE/uvou/j8mU8ZSbLx9ETseBY9ZI980SSdBSJNHMffqCD6lXorTW
 pUlz3HRuX6nvYkiPBrSDwqWBjMVYUOizBKupmFx0tU4zFNJZI1YFra2Qg+G73yq2ElHuMkY+8xR
 Ov5bMmBL1bjEAt9hUlpZNgtQvA0tRB4G4Ww6O8Y72Lpk7XFej2Dd/HhPuTxR5MJo+gkuMKtmEFD
 ulqqaZ/vVclAiVg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently the SPI driver sets up a software node referencing the GPIO
controller exposing the chip-select GPIO but this node never gets
attached to the actual GPIO provider. The lookup uses the weird way GPIO
core performs the software node lookup by the swnode's name. We want to
switch to a true firmware node lookup in GPIO core but without the true
link, this driver will break.

We can't use software nodes as only one software node per device is
allowed and the ACPI node the MFD device uses has a secondary node
already attached.

Let's switch to GPIO machine lookup instead.

Fixes: 439fbc97502a ("spi: cs42l43: Add bridged cs35l56 amplifiers")
Reported-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Closes: https://lore.kernel.org/all/aRyf7qDdHKABppP8@opensource.cirrus.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/cs42l43.c     | 23 +++++++++++++++++++++++
 drivers/spi/spi-cs42l43.c | 35 -----------------------------------
 2 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 107cfb983fec416bbdd31caa1e6a569026467735..098b95a21b38158b5ea765ad55fdcf703a2454c0 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/cs42l43.h>
@@ -522,6 +523,15 @@ static const struct mfd_cell cs42l43_devs[] = {
 	},
 };
 
+static struct gpiod_lookup_table cs42l43_gpio_lookup = {
+	.dev_id = "cs42l43-spi",
+	.table = {
+		GPIO_LOOKUP("cs42l43-pinctrl", 0, "cs", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP(INIT_ERR_PTR(-ENOENT), 0, "cs", 0),
+		{ }
+	},
+};
+
 /*
  * If the device is connected over Soundwire, as well as soft resetting the
  * device, this function will also way for the device to detach from the bus
@@ -900,6 +910,11 @@ static int cs42l43_irq_config(struct cs42l43 *cs42l43)
 	return 0;
 }
 
+static void cs42l43_remove_gpio_lookup(void *data)
+{
+	gpiod_remove_lookup_table(&cs42l43_gpio_lookup);
+}
+
 static void cs42l43_boot_work(struct work_struct *work)
 {
 	struct cs42l43 *cs42l43 = container_of(work, struct cs42l43, boot_work);
@@ -954,6 +969,14 @@ static void cs42l43_boot_work(struct work_struct *work)
 	if (ret)
 		goto err;
 
+	gpiod_add_lookup_table(&cs42l43_gpio_lookup);
+
+	ret = devm_add_action_or_reset(cs42l43->dev, cs42l43_remove_gpio_lookup, NULL);
+	if (ret) {
+		dev_err(cs42l43->dev, "Failed to schedule a devres action: %d\n", ret);
+		goto err;
+	}
+
 	ret = devm_mfd_add_devices(cs42l43->dev, PLATFORM_DEVID_NONE,
 				   cs42l43_devs, ARRAY_SIZE(cs42l43_devs),
 				   NULL, 0, NULL);
diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index 14307dd800b744fee17edd864688a68c65666c68..7430a1ba829cbd68d4bfdb1cf9cf8fa7a1cf23a6 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -13,8 +13,6 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio/machine.h>
-#include <linux/gpio/property.h>
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
 #include <linux/mod_devicetable.h>
@@ -52,20 +50,6 @@ static struct spi_board_info amp_info_template = {
 	.mode			= SPI_MODE_0,
 };
 
-static const struct software_node cs42l43_gpiochip_swnode = {
-	.name			= "cs42l43-pinctrl",
-};
-
-static const struct software_node_ref_args cs42l43_cs_refs[] = {
-	SOFTWARE_NODE_REFERENCE(&cs42l43_gpiochip_swnode, 0, GPIO_ACTIVE_LOW),
-	SOFTWARE_NODE_REFERENCE(&swnode_gpio_undefined),
-};
-
-static const struct property_entry cs42l43_cs_props[] = {
-	PROPERTY_ENTRY_REF_ARRAY("cs-gpios", cs42l43_cs_refs),
-	{}
-};
-
 static int cs42l43_spi_tx(struct regmap *regmap, const u8 *buf, unsigned int len)
 {
 	const u8 *end = buf + len;
@@ -324,11 +308,6 @@ static void cs42l43_release_of_node(void *data)
 	fwnode_handle_put(data);
 }
 
-static void cs42l43_release_sw_node(void *data)
-{
-	software_node_unregister(&cs42l43_gpiochip_swnode);
-}
-
 static int cs42l43_spi_probe(struct platform_device *pdev)
 {
 	struct cs42l43 *cs42l43 = dev_get_drvdata(pdev->dev.parent);
@@ -402,20 +381,6 @@ static int cs42l43_spi_probe(struct platform_device *pdev)
 				return dev_err_probe(priv->dev, ret,
 						     "Failed to get spk-id-gpios\n");
 		}
-
-		ret = software_node_register(&cs42l43_gpiochip_swnode);
-		if (ret)
-			return dev_err_probe(priv->dev, ret,
-					     "Failed to register gpio swnode\n");
-
-		ret = devm_add_action_or_reset(priv->dev, cs42l43_release_sw_node, NULL);
-		if (ret)
-			return ret;
-
-		ret = device_create_managed_software_node(&priv->ctlr->dev,
-							  cs42l43_cs_props, NULL);
-		if (ret)
-			return dev_err_probe(priv->dev, ret, "Failed to add swnode\n");
 	} else {
 		device_set_node(&priv->ctlr->dev, fwnode);
 	}

-- 
2.51.0


