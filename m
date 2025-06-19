Return-Path: <linux-gpio+bounces-21853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D56ADFFDE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADF3D5A258F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3181727F72C;
	Thu, 19 Jun 2025 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1TgBD8O9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8238127EC76
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322024; cv=none; b=HrmijAbKqx9FmKkk2ne3Iztt6CTYlrjB6vCVMHjaNIxU56M10ClMjqodJ6dc9pijzQUQuTpBl3VXaTkupj8pLlcUJuKoeVSLSgTy+WCruNh4ZtLopLHQE8FgOKgLQ7Ho03FheLDnpiI8Hl2FjKg2ZjdOXtRZjXRQifc1nt8i1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322024; c=relaxed/simple;
	bh=eEv9Rs9Ob2RKbLYMX17232517BahJV9MYVei3h7Ywh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCKOAcpBNw7NS+xl2UKm5qN8u1TtK0XXQFLpE3Ct0fIj3uI7ANU4Eo76fI2x7Ctu5NYoEy7TCHUO9LWqFjoihgvLJZfDDmu0sT22v/21dmYpM1GyD6NEHk9VqkpgEI7LefeIl/iObQU0t+4PqHpNOUflsVudNv+74F1alCFijKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1TgBD8O9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d7b50815so3533855e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322021; x=1750926821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=;
        b=1TgBD8O9f+nmGuddO/r6hPYgMInFQ2VccdDhoPpCX//lDmLWefeju8wvqLEoHNoEqH
         Cou3R4ZB1zpOIh7b/CUq/aDPa/ZOt2jAd24Einc/Z03KYLd5jJC3AgxeC8mwiq/hNOX9
         OzH2rGKS7w1siE5RjFLaef5YOqXqYT93dLAVT6QO+f2NrR4RE0NP5Z/XlgfJIGcEcwpm
         /eTJYQHab+v+MUMhiR08mV8QiWKHn/oo0r1LntqxYKPl3G+rLRNrTajVEmEgzQk8/3A1
         xGLwdkaChAud+Lc/Y6Uo8kjwCIvWxP7kRztDjtwW+W83GE5TB11w2Nd36BAgtZ9p2ke1
         eOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322021; x=1750926821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=;
        b=RkZ8P3d/qzEGDWMJs7DWeJCKMeOygam0evrHbQ6zTaqqRVjWvc2BfQMVq42+GIXW20
         KCWXPgNDEhkZ/rq4bXAChQSB1E13/b+Lrd2ptPY4li6rk4ijMt1+RyEJ9LFwiigHaVzC
         oSh3s2IwtfQTDjKyoSboN6xOHoHqSFS74VyV8Ci+PAayRnI4opoQzTioe0QlXN9DKS9h
         FgGa7bMRk2W0Rp27/0n9CS1HAMi/5/9f8yGK1X8UU6Ihz3YSHQNkY/sh3nAIbu/ws/L3
         HQOXweyrIR+h3u1YBLRVgkYgDSKbeYWcuY4GZLU+0oMTFgqTlOeG7ZjempCcEvwsrP/m
         eWsA==
X-Gm-Message-State: AOJu0YyyX8q4vi4PIlb9FCVaFoL7LwuJyUnQ1YGTKrQuuw11dCvUnolT
	C+5tbCT6VF0d252ekULL1ph/P03fCr9d0A1dEBjUswnATeBpD1cmmA+s8mXFqhQOI/M=
X-Gm-Gg: ASbGnctmkKwmXNxHcq0P3fXOCVxq13oXvV9WrQDzh9Cc8qYjr+TpdxajreAai9WZ1dP
	L18dNs/p8Som9t7Gsuqfu0xO5NMLr3dAEbm56I9PD0Vf7S14EPiFsCezgYovrPra9nDnvWUxYJS
	YQVLWL1X0+yggDvwbiJ9cSXMSMJN1aM4iIkidgUAcdlq9mCKHKehnDl43kQyQCLn1GwX6x6PcnE
	oOLiJMUexy9pye0iH0N09XBNxTP1XuL1baeU0f484vU60vMMVdPuuSDMVSonJIfpVknhPX9m/0n
	l6gHbBA0Wok6bYKjv9s12frbP8rpBEQstQ1iCdkc7YL8RfffQBbDbNj8SUkjlCJgYBQ=
X-Google-Smtp-Source: AGHT+IHGQZUCpU4EKwN0pDb1PR+66z4H2pK14lR6dL/m7pgvVM5j9STX22YLKDyKpdUEu3zyNckJVA==
X-Received: by 2002:a05:600c:a218:b0:44a:b9e4:4e6f with SMTP id 5b1f17b1804b1-4533cb3bd5dmr123193585e9.16.1750322020849;
        Thu, 19 Jun 2025 01:33:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:25 +0200
Subject: [PATCH v2 12/12] gpio: sa1100: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-12-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=c4Isjx61IsXwy1L10lydMFlqZBELu3z3ba+yBwH+QRc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tTJRS7HeQsESgIvXXZ0x6YdiYTKomdEfEZK
 n1HshL3jCCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUwAKCRARpy6gFHHX
 cuxYD/wKuuPZarmVQqOx/roO55GiDf7bp8izUkbVjw6CzO6my9TiQR/eHWWX48I0yMgBKqPffnx
 zz1IrAto5nMAQ9A6KTBIzHaSpr4xG1/HW2hsgFHfyyLQNlPaBpCoN/Hkew24KLU0l0XtlRFPCv+
 jLqU/XGI4V8cnRhpA6BT3W0PdIUNbubJn9Kui8m80DQH7IIHbqm7dOQQUrqdVLPXIfgdxk+oHKh
 bB/X5SGihn+BTWJANOm2/1GLHx3nR/5yj1RqN7W7JQt2QpLWy3Q1YBphABxr1vmYFrK9SiPq0c6
 ONeePjzonJ+6ypaoelJfD2fitGseIAKwp5B6mgBAuOFtZcCbO7viJLjnYgvI46LZkMGuoBbaJJm
 TXeNli/gceQzcOM2wUGI9XcjSet8NGq1ix+8QCot5tPEXRmbecZ4iuoA4c/OY9JTvXhzpv1MLw0
 kFo9CUCEY48J4FsizkRXgqW8IiOlaxqwD/duhHiOjeu7uMFnVkab2kppAP7UiF4K1tNBKxbsM5N
 y5kihu7nycPMXAWE64hLLk87yc1BirJvMOxwsWg/d6kHOIUgxUs+JIG2R7v+2Cvp1Ms+20pdKG2
 MmRu61iKy9tJmqKBqX+5x2zmfjfNiqX8c4jV/THDywyPZ160KYDr1iHXefZdq3yYKRZftPLFamQ
 jqh0yd0/V0Gc56g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sa1100.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 3f3ee36bc3cb19a7baf530def0575d2ff09dd3c5..e9d054d78ccb8485b9f662fcec385fe0d0edc0d7 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -43,11 +43,14 @@ static int sa1100_gpio_get(struct gpio_chip *chip, unsigned offset)
 		BIT(offset);
 }
 
-static void sa1100_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int sa1100_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	int reg = value ? R_GPSR : R_GPCR;
 
 	writel_relaxed(BIT(offset), sa1100_gpio_chip(chip)->membase + reg);
+
+	return 0;
 }
 
 static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -96,7 +99,7 @@ static struct sa1100_gpio_chip sa1100_gpio_chip = {
 		.get_direction		= sa1100_get_direction,
 		.direction_input	= sa1100_direction_input,
 		.direction_output	= sa1100_direction_output,
-		.set			= sa1100_gpio_set,
+		.set_rv			= sa1100_gpio_set,
 		.get			= sa1100_gpio_get,
 		.to_irq			= sa1100_to_irq,
 		.base			= 0,

-- 
2.48.1


