Return-Path: <linux-gpio+bounces-16937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847BA4C1BD
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E66D5189707D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2E0214A94;
	Mon,  3 Mar 2025 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LQO+QnhA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B814A214A93
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007935; cv=none; b=JuYRgbL/gS76GGjTS1XaP4kbZuKhOOhfezkUeM5H9BUghmU1pmE03mPe4enWeQbFqAdALiLM1dY7YgjAIcUq33hGZVLNJYj3TwtFwDu9daP2IY6J1ZZ522TExmS5iJQU2UBv87qgm9DkhJ/9iLpPnjPmID5moyHpxu3zFV3nNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007935; c=relaxed/simple;
	bh=9ppF4aag/8mUCwmIT6ILS41aDAnaQNDafsOCHhvzm30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1GZAaORUWm9hNnUGAFWdOGxmdm9OBPWuI3ct9vizywGsDJmq8f0eWADR4iJ8plQgpDbmgmjZ2THqLF57cu8Ywmaa8SI6bGuYybOF9qHn5K6rRoi48PvhfJrUtsKB4Kdsp9B6Qv0wTuYWVkMnlOAbrWQVbpw8mgbxWHofLlebp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LQO+QnhA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43995b907cfso27907655e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007932; x=1741612732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2T+qUj1+rhYU/lDMmm7CtWMW53IZ3sreca30Qhdgoo=;
        b=LQO+QnhA7NN9y+aVv9UpJlhkjW6jhXrxDTzKKhIxLxPRWEdg30GiLNZt1WDreOZ7UR
         ZM5Yx7m3phKi3nKmwuvBx5Zo1MyooV1tETZYSb9dlZAGegPvNc/DAdqgVCywSTRhlliV
         egrC5oRc71KdbcU46doWNfkKEA9yvtbkCW41UUQgFWLF1RrIVD/H5M75+XWNL/nVS/Q7
         FX0oGbEbSbuQLTiXaVdmB0LNKI5Rz7TFNIA7Smfw5rLzGmsx9ptp0vzsEnj6S2qdM73C
         FkWIkvlVN0iyD5BZ04UXGvK3nI+gFPnb0JMvRB7iE/83Ddq0VNfOmcNLWAfIwBNb8zzv
         rULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007932; x=1741612732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2T+qUj1+rhYU/lDMmm7CtWMW53IZ3sreca30Qhdgoo=;
        b=DrKqnRFbANrTpBd6Iq3R6JqMwqcwsBi5rnkK6xYcyZfxXhHp4umb3xRqIPbjhMveuG
         aP8xw+PPnvU/8yhy/iieK7qy7IAQ+IGsdTVSqmHgUulTapNTNYL247wSBPIZutMZocTC
         QC/cOARt/V/kSTI4WQLmXDFSqFytQ/wvDF84WIINyfOgof5gevxt5DxvoIIRK9Ln2tmF
         kRjH1QUZDyl5MlwJj43V6THDrIChf3OXPM8Vr5WUoVsDfug4RQOuh6SHxY2V6nJ4CLhU
         B8xzoUK8qVkJ9uxNitfnYgpNj9o6+5Sos2uAqD7uSoR3KA+BCuC4lJ1wDeTIMqPjJ+o/
         h32Q==
X-Gm-Message-State: AOJu0YwB92d6qG7i0CjQauQr1Eqm4uUM28y2PkVRewBkFaDCWYsIj29p
	yOZhcRx4jQjtGDyiC+cdUPQAMKsieZTULi9YCJV4d7Vp+KQfdJikWbNShZ6pQ0I=
X-Gm-Gg: ASbGncu4DMGCdu1NCLk2jyMEwj6cGBWGIYh9mE4AQqDUC6xSB8PftcKhNpaVzBeXOmp
	+FFgeKjw56OLtqy2IPuueso/0jv9qgBH+vmkFXbGKn3zcime+MqDra+aHt8tH69YDy2VxtooIiM
	7JqH5MLT97X00Xa/8RfVNpMEj9Rt+0XlVvwG1Rz5UM+4lKPNybHkSgDgJZgfLzwD59PqhFCRi5Z
	UlhpU4C8w3Mmo0KgUkEPEu5q7QUyoMb5tFqifiHubEE5c7I0KKgxETpmZ2ygO8iBMOBjMdwsgVW
	SoS61ye58iklFMkoOcCn8ZGGzgcxDruVoHnV5w==
X-Google-Smtp-Source: AGHT+IHrsk8va2f9jUFz0ftD8VEqOjTpXEeQwyIxP0GRFd+ut72EYxcmyfAXXHA/8ZZERm1Ku2/BTQ==
X-Received: by 2002:a05:600c:4595:b0:439:955d:c4e2 with SMTP id 5b1f17b1804b1-43ba66f9f99mr109740985e9.13.1741007932175;
        Mon, 03 Mar 2025 05:18:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:38 +0100
Subject: [PATCH 13/15] gpio: aspeed: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-13-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LYFIGRtuwl4aJkBrIp7QZ91bKDFoO6rlmaJc/Y3YEoE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxaws9K4avm5a3/nXOZWmIQcBvBwL1Vb6W/sh9
 OznmQXSmESJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsLAAKCRARpy6gFHHX
 chT8EADTj6ZZXdeJj6Iyu1AzAb4IyTbPKUbO8J/z8nzq3PyDc5bnoj4WHzueOKKmjcxZKh/WYoI
 FFA/pLjrW+4GZKcD9eBnMz4mRz8lpCmTpcNAFjkQQHqmQULsLzb+wtCk9oR1vgC13G+/mWED0EC
 pTlhcx4vALIKG+WXXE9jWt7TlQvoM0lE0PXKW30/ll3nG7gFQOS7PA4eNP9PgMrlv7jX0HurDoi
 KbgabP3JdgvBY1MD2E4m+O3cRHM98gJTDS5qKQEvlC3GzHeppaYDJDPd03NBaAwPtLZ7as52saM
 +vGxlehYqbNPl92p66PzhTnKVa2rmQy/9MnGUrxoDJFuLkLi4S8CkMbqZRu+qy+yt9tpeIzFUL1
 eXoBzY9hs+kO9qq0cPab32Cs4kvJ0pj6cgWnTlXqwbpk8isnBLDd5Dvy8O5E4y6zlGSWa5qiTC3
 MBRxF/68eGz1AeVeDcCuH4xz9FZd0EGTeNoH4nuC5S8kVMwn6hD1lD+nCEs3Y52xMNLU6PHLk5F
 5lCN56djX30Hd2YWYLdCvEYrZzprzHncFQgl6CmHJcvnFt4Ln7gVNj1zjO5eY9ZRw9z0JHHY6F3
 GUnF5ZKdktPzZ+VnH9pYOOyEqrPpcBmkG24xaMnAg+8iGk6JJVKLigkXXE4Q6aQOsSnvnLWmH32
 7R+I4hEhoMhBI9g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index e2535aad1026..2d340a343a17 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -424,8 +424,7 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	gpio->config->llops->reg_bit_get(gpio, offset, reg_val);
 }
 
-static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			    int val)
+static int aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	bool copro = false;
@@ -438,6 +437,8 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
+
+	return 0;
 }
 
 static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -1351,7 +1352,7 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.request = aspeed_gpio_request;
 	gpio->chip.free = aspeed_gpio_free;
 	gpio->chip.get = aspeed_gpio_get;
-	gpio->chip.set = aspeed_gpio_set;
+	gpio->chip.set_rv = aspeed_gpio_set;
 	gpio->chip.set_config = aspeed_gpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;

-- 
2.45.2


