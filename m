Return-Path: <linux-gpio+bounces-22171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456EAE7F87
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 12:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF05B3B7E7C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDF529C33C;
	Wed, 25 Jun 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kDkvPJc/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313A2BEFF9
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847630; cv=none; b=G6ccgD0QCNaxTtr9AyRbttFxMHKnc0LpWvwW1jjyaIJmd5ehuQInITNy0z18NQLtEDEcJbFMgjBTjmx8DWiFaCX6iHAnhYDR8+5VnWI0+1K4cO4nMuy/xJypymdt7ogCW8oZ7K/63XHlyO7ENpLzVie7ImrKeU2KSzHR5/2jJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847630; c=relaxed/simple;
	bh=/D31nXRZN62lyyN7INw9F+q2ocTvI4v3vtlufAszE+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jY1hk957ReccOpfGVHsGqx7o+Gm4EChXHBdYEpQrUm0ceaNO95xhnItj2aOhNSD29HTgdKbwHuK+3n3/Y2cPt/UtY1yFXwzO3/9RL27FB6fQbnLaQ3CEM9pOf2np8Pi30Aalbq/XyJ1wtwNf10ReTTz8qcwHs5998bp3KW/LwMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kDkvPJc/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4530921461aso11642725e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847626; x=1751452426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=;
        b=kDkvPJc/r1C5cRpU3Ff+58kWFkkeabY6+/Pso5nhoJ+SqWEqIHvj0dI63/N7IRg+w2
         xNVomV3VxicrTa2xJg97oWZUw/qG9WwYGvr4vVE5qAmtgTjm0OvLMBiT68RS5UW5Pcw+
         ECS43KTCPNz0JoWXW6B1BFeWo8PsUL3dop8TzJru704SQz5Ca15RC0QnrftQvzEbvcLB
         n8xRqHhOWeCWLu5FHoZfu19VT8RlRjBeiX7XWfBFgYJDab5ypztuaHD/MygyaIRIZ2CF
         i6aTxVfSlceoS0My7LkYwJm67SFcgmHJL90n23BW0xa5I5LUS+pDRPgL5orx3aHxRHaM
         WYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847626; x=1751452426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=;
        b=lVyarcmK68LRKn1FfnaFPyFLqO78qJ8rxSy4j/4g2d883YWUIS+OhNAvnRld42NfcL
         S1gwlJDAUwcrctL7ba9rfF5uARjaDBWXfqmbeovQrElFbgI0M9ujEcSv4h1x1GBW6hPd
         E9fwnMnExKPPcMzR7cuYze0oC2HNQxD4GIhBje2EHZNW6DngVEP2xLcOyUrV8bMAKpzq
         JSU2weP5yFS81oObTo9hoktOE+Gc1n8Wma8uNb+Fbt3Dix0BuUfztxNeTQWONqRH+S/R
         dgvnD0b2DWYoaolwPZUizrtTnG31dmf907ywBwp7QSsaA/77V2pj+AJ7gD368y4bS2he
         SfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyipheTZtcOUYWZH49IaM5OFCw68YYlFaX0QawLx9XiBVAIcKQ6R+KYGP2cdRrryI4TExXL35caU+l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21TmM0nyI4FDyZF0n1xTh3Ber86B/MVnIcTwkCFCbAFqcm87f
	/mKiHHbAFqxmd4A9sJwoK8g6lnwG6X004gKqV9uSzM/yxvoHEhop/UM50EpEDivwbQPbpaT0P61
	BuLNIBFY=
X-Gm-Gg: ASbGncvtIUSWC2iNd6hN2Z6leL77LY4HwJJBP6Mhvb+iCuLxhn2jOhj5C0xRHZWDGKd
	XJzYYbJOe727/S0vTby4k8l/mb59I6CkVTuVltGB3C5SqyLtOA+01gj+x0NuTaAe3vW14aiyCQK
	6MdsfUZLwlrnfhOL2G0ny9Xep4e0NfyOy+5h9nxVYHk6iSgbrV2in0+uFmaQBFWv7qw44h16j8K
	E+AL501CmPWvHiP6nnkqlDBF9UhK1aPnN8fVkyqbxwEKz041lNg8bGlL3oshFgXyHwXkyrvJskU
	IDxLwE/htbX3g/DPlmExj724+WfRS5iBivu3n3uTyhHcKV46McmfhMmx
X-Google-Smtp-Source: AGHT+IGJBQOkw6eJT7V+Tc/6OJa3rfu5ZRr5gF6yKyzRI/QtnAOx+SjmcHMjXnKIxCo+GCFyhzPYEw==
X-Received: by 2002:a05:600c:c04b:10b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-4538269fd07mr10337845e9.25.1750847626370;
        Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:29 +0200
Subject: [PATCH 06/12] gpio: spear-spics: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-6-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vMdNPd5jRPkJ9QwKPdJC9QQNnWlRPg8OHEfjS70PZL8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/CBkqsRRCcLd0UFu9RXVYmSHO9jQsckaJE
 pp2PCUKjOGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 ctwSD/9Mp/zVOVvyZVeHYqyme3BxhbzcR9pcx5ATfalyilg7HNmKg/32h7u72xZD3I1wE5lhqu7
 w1czMVrQqd7UfT4/BpolTbZNq9c4D3ZR6dAUhktF/cx5bXVfMauk7BkwSn/SJ585lE4Rgj7ZYes
 0IFjVz8KTIXc/AA23Ck60F7M//fVSTCpR1IWgTGE1a9T/V9chKJksSUZ5JBQZ1ipj4wfDSEQzhf
 1lFx4i72i4HLleD2elpfccU1Z0Cor3a0tMywrN+NIfQfzrEG+7Y7qHyaxkLWDEar4rv7Vc+o0V0
 jy1ZuwHHuNu4SKKem9Lj4cKuaTkMACootTDGvZUNhooPVv0m2fGdM3yp+5i6jR0GGwXBt9mwBfu
 QxawwHxMpmWMlppx0csAhOiLpiVq+BSklp/hxYTLzJJl0D5g699IYJyJNdZtHYm5tE+jpt5pT5J
 DHx9ueCiReim7jnqdaBEvDJcE8BjSaO3VjKA5GfwRzcoJ7qxZdVKxg8K6dHxTXxop8RnO1nd74z
 g2tQcIMknTnWHIgH6qp0O919ogwx8HRPwKJ765jHeAi13F7btqMOI3SivTQSSRwVxBhG/3zGbp+
 YQhLXkbn8Z1A2YZoc4REvxRZeJ3E4dSx3HuNv92T8bO1c9MPNpwQRjNICxgXuDOuXAGDFcdwZ9M
 etbIQJG4192v+3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spear-spics.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 964b7dcb30b7a5bccda964a637f7fec97fe02aa4..55f0e8afa29143649e868a02edc19d920e10c31c 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -51,7 +51,8 @@ struct spear_spics {
 	struct gpio_chip	chip;
 };
 
-static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
+static int spics_set_value(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
@@ -68,13 +69,14 @@ static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 	tmp &= ~(0x1 << spics->cs_value_bit);
 	tmp |= value << spics->cs_value_bit;
 	writel_relaxed(tmp, spics->base + spics->perip_cfg);
+
+	return 0;
 }
 
 static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
-	spics_set_value(chip, offset, value);
-	return 0;
+	return spics_set_value(chip, offset, value);
 }
 
 static int spics_request(struct gpio_chip *chip, unsigned offset)
@@ -138,7 +140,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	spics->chip.request = spics_request;
 	spics->chip.free = spics_free;
 	spics->chip.direction_output = spics_direction_output;
-	spics->chip.set = spics_set_value;
+	spics->chip.set_rv = spics_set_value;
 	spics->chip.label = dev_name(&pdev->dev);
 	spics->chip.parent = &pdev->dev;
 	spics->chip.owner = THIS_MODULE;

-- 
2.48.1


