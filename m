Return-Path: <linux-gpio+bounces-10944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E86D992961
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4326C1F23ECA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 10:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2DF1CC14B;
	Mon,  7 Oct 2024 10:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JR2MLbZi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948941C9B6B
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728297659; cv=none; b=GNR001hEyv/pul564KXUmED6N9DrZoXlxdC85eC4hKFYprIqUMMcrwd6Tu4icLfxCA1vq6TwQd+XCfodt3BtppTVbZM5uhfj4TyYL8pGmpZJdrCnm9oYwKrmmYrA3d9bxe5ENQOMqNVpxRZdhX/UO1H2dC6v+kCtfJea94hgckI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728297659; c=relaxed/simple;
	bh=nZiIh8wnlcFC+dC0TYEiUd7EAPU85KmiRp50eWjyx7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rR/TmgtEbRHxgYGj/za35gTD6K1+PjDVb7zZORuE7DjwQbSGM/zR5JCsGrj22Ll1KHaMd7A1QNQ76Ihz7n00sUQugOBxfU09Wz2j6gPfd79sW+OlOUcXau33iK/3StaeItoSS3UUobeaaTms1McoQB5e3ex4XIF7JexYufvq1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JR2MLbZi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cfff59d04so3365684f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728297656; x=1728902456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gtX24rM5dRR0MpdZIAsxYJR5vb0OJDvfm8ACG2rLjE=;
        b=JR2MLbZiFOutfBRmHFa9FEwHUax0HjnsdoqQotrMHyUyNvJD2PXdW7maYbGHVmHWrd
         zYZ5qKo6sbL2Nkog+Pl57+uDEPhlVUEDSJmgd3D/9hoU30gI03ViPiymoIvykTWR0aW5
         WSnCTbkXHCmtCBIdAVDbgpx4f+s0AxWhz6DGtMwgussWkBt8MYVCcIBTorWo3qTWMKwS
         p9fZilryPjOIgzNwFOu4HFUkWeN8AjNoVNXRShPcQmsf1FvVOw1cx6oa7Lwg1tvNi/KD
         8tbbLX8Gsxfa914fm4GKdnxINKzIXsl03ol5PlMm220k3bo1CJWId86OV+p4zzYx86Bm
         wEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728297656; x=1728902456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gtX24rM5dRR0MpdZIAsxYJR5vb0OJDvfm8ACG2rLjE=;
        b=n+O57l/8RsmQu6G58XLUqqJwhGVD5A8PkJrc86H9kflum+0lP7xxdvDDKxKwswX5gp
         /8K4UecqMxlEupaxPE/pl5koJdUe4qYLex98OU10eYXI4gnZZqgPpJsYAdmCrgqJkG51
         7gQeiVtOcaoy+/c7vXJPHCaHM/9wbxSy5GlGgceBJweqW4z651ep0XmVr2OC9DgrJu0s
         v+4m9mbVMn7imMBemJlYhBa/FYwhEIQN5e20QKXepTc7Dmw9CfSLXAvxkcz3QFKWG6Do
         TInMDZzMoNyRfVlEBc7Emf3VV7YSPj0HFCEjCiZcDTCa4usSj2qQJXbYDNsGM02lBywB
         rGow==
X-Gm-Message-State: AOJu0Yx9A1+P2c7nQPfHL7yOndIZmqUMBAKyvQprNhf4hViiyWCQwsvL
	3oucn9YieVrTKQHz1/1pyHSKqxpn9q9zVBbiJU1+h8IIBAb8ingpuTDKMU3Fvzc=
X-Google-Smtp-Source: AGHT+IGN+INg7r1OPDUzlA14lgX4GmFkJL4YfoB6G2zzkWnUEno8sj+zxEMpBokOQaUuFIDxm/83vw==
X-Received: by 2002:a5d:4904:0:b0:374:be11:22d7 with SMTP id ffacd0b85a97d-37d0f6a4f46mr6254010f8f.13.1728297655930;
        Mon, 07 Oct 2024 03:40:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690fc53sm5474682f8f.4.2024.10.07.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 03:40:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: ts4900: use generic device properties
Date: Mon,  7 Oct 2024 12:40:52 +0200
Message-ID: <20241007104052.39374-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason to use OF-specific variants of property getters.
Switch to using the preferred, generic device property helpers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4900.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index 0f6397b77c9d..5c806140fdf0 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -8,8 +8,8 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #define DEFAULT_PIN_NUMBER	32
@@ -142,7 +142,7 @@ static int ts4900_gpio_probe(struct i2c_client *client)
 	u32 ngpio;
 	int ret;
 
-	if (of_property_read_u32(client->dev.of_node, "ngpios", &ngpio))
+	if (device_property_read_u32(&client->dev, "ngpios", &ngpio))
 		ngpio = DEFAULT_PIN_NUMBER;
 
 	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
@@ -153,7 +153,7 @@ static int ts4900_gpio_probe(struct i2c_client *client)
 	priv->gpio_chip.label = "ts4900-gpio";
 	priv->gpio_chip.ngpio = ngpio;
 	priv->gpio_chip.parent = &client->dev;
-	priv->input_bit = (uintptr_t)of_device_get_match_data(&client->dev);
+	priv->input_bit = (uintptr_t)device_get_match_data(&client->dev);
 
 	priv->regmap = devm_regmap_init_i2c(client, &ts4900_regmap_config);
 	if (IS_ERR(priv->regmap)) {
-- 
2.43.0


