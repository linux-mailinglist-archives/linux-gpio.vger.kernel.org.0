Return-Path: <linux-gpio+bounces-21847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76AADFFD7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D75619E191A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A102E2676DA;
	Thu, 19 Jun 2025 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w404o2Rd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBAE266576
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322015; cv=none; b=crZaF6VOONvMMbb2rqyIbZOYjqmOQ6Y76UpHRiLtPbTacAwRvJOSQpdJYMPbCVtG4wqApAxNnUcLoJZHx9g9T67YpFFPZGBdlaYw9eVJIA0gsVxvIKbBCQKI+FkAt1OCiJ1yxGIEtywFSYDuDEw0cqaHlaneQ+NxMtRwN7KsIX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322015; c=relaxed/simple;
	bh=TIbLTydFbIxMUGka9nMFS3KxZgZxnuWfV2GjJh3DcXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0EGp5O0V6Kzf6I35on/pTBwyUmwtwToKK2+NCNYocAuDfGUYVqc5bH0c1SyVMP1GKp1po9IZMe1Y3xKs96FpQBDlMHWR/BbVqg5SZWlyVtD0OMiwdI11ppvF+9CesycIwIgpGSt5q9UvD2hW2RaI7S+OQ+0sOZ88TiIHe4LgG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w404o2Rd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f379662cso467008f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322012; x=1750926812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBA3kzrSkCDXqL/qmFtpqMrbH8iiG3hu1F80uNaFdYQ=;
        b=w404o2Rdw9ogjqnCotYQj+d6y+yVH1spuMQmioGW6/jmlBqPzG40Z9PBtr5bq5xmOm
         xpXARWBwxohPuBuHr5iUoGORrkBnpYNdrsiHqeqHcvLillM/2cDqQZv0Tl/MkbN7Jq8s
         orD+j51Xdl/8PxrPytos+BSb6su8VO3SI9V+CIMjtBCkHlt8x0d0oFXUhlYoB/jkxR7A
         UKEEYnpc0oQxOOMwgBHx1f9t27mJJ/eF36v1oy7Q3omZgWoVc6actGUxaDr9B4e0sSYz
         NYOU6oMyKtClJTz2vKBChIay5ouY40KAA3Tfz2GEQgwGhu+NaAQ78Ag8YNMPwjR9PGS+
         oxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322012; x=1750926812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBA3kzrSkCDXqL/qmFtpqMrbH8iiG3hu1F80uNaFdYQ=;
        b=EZFjziwCBPZMb1+mXisyr9uThYgCKfD5N4gUIbwmyqECa3wswZcQwasx06cod536ib
         xdc2xPuypwl9i4iUBcxC6pdLWt+8BM/c4CMvKlYN2makdSnI+gc61blwMIB981LKhMkO
         nBbUHZajNyHPjMXi5iTfHhDCV3urUc9t1xDuZX2yP1E0ohTQ1cS2Ioy4vngg67aLFx3+
         7XHDTUxKlxdS/jKEmTkMCVWL26WCXCPimZwwgS/z42zi5dqcBvxt0KvLx6JCbBWYn1AG
         zvHoG1DLdJsfnjqMog2OnfqWIdB5WIAuxnf8pr+seHzM7OeJT4cZeCm4hhA1JSvBYSYp
         9y4w==
X-Gm-Message-State: AOJu0YxzrzvyQt1mYLlVvwxXgyNsehJQB40v3B6nO1L/6mYoHRmNyfx3
	30tWkWSWJQwxWLFtMm9UwhyUWIBiwJ/GqxQaz4JS5fIGTMTsp8z+aaiysf+oAMQdiEQ=
X-Gm-Gg: ASbGnctZ+J1pSZX8e9DoWn4b5OQhfc1cyhCaNroTPa+2Ds4yGvl5/OaPeThTkuM8hxj
	L1E6hdlVGzNKH2kmH9wAI7n6j7OKD4c+9tb1wAjVcZj3kUYuJr+TTjV3dKG7TLpu4oix3+XPF7W
	0qmnlZKFJgNqf5s6dn31wSAFskDIg1P94Q8oGUpAlFvMRW9kuyrOSNK4Sna/fjSaYiyqi0+dRWG
	wYYFCVHsvAOf0BfBLMcBh472KIFHa+m+54dxrtFLf30aeWsyt99lm+3q7EL6nOuU/EgHRiIKMT/
	09Bdhencqp+tsbbF9uf4QZkAQ3K3RlFog69lA2ecFEriQ4lRvIEQ86uF
X-Google-Smtp-Source: AGHT+IExSetU+H/G46+A+Kv2pCw5w5XlUszs48CCHuzCg/K6f+lzMaSm5DYdy7QwosUzPYCH8ueY9Q==
X-Received: by 2002:a05:6000:1a88:b0:3a4:f41d:696e with SMTP id ffacd0b85a97d-3a5723a397bmr18021776f8f.27.1750322012064;
        Thu, 19 Jun 2025 01:33:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:19 +0200
Subject: [PATCH v2 06/12] gpio: pxa: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-6-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=B+Qz2OspKJ91xFNTEdAqgmxdOA/mnHzp8sm3HNk30eo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tSTMyIqQjS6A96KtIVo+22ennHEyY/653Ay
 ufgFq0L+7eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUgAKCRARpy6gFHHX
 cllAEACcTO62jc9A4KHYc55XCch/hQhSLs8RmhzwqrMdUvC1ddw8nhH0A5xoRW7xEWXvE+sXZ4y
 UvEwwrLPzhzblUr1IHw8dpgT/Mj1pueQnCqvymJOCanv6KzE3uOVN0/wf7n4hxuxsnu980DcDNz
 zmKel/hACORSUcnaBH6uyxM8KoSSNFbSd20XvTomvekETxI1Fto5MQw5RnP3gFE64fIgREer+Ov
 W0DMQdlYgzmmzTc2r+8hc8qLmSuFbQGteSRIjwC2Ij8NvACWdhAXzDyePkew6+3h3m5MMl30mA7
 oBtzhuNgW6iBNQlQAvYHEj+9B8w1sHe1dfD72vX7/Xc4GJsBAGKVAoIRQsspQup0+3NeorznGaW
 SDfYRh24udQ44UNa7JRqMsdcb6NXbX7AWgN0XKNj+U0X6GCgAuBQKnh5nt1hrqSPYwv44ZmceKC
 AZ+QsImPGESHhsHf0p62cKZmi/eyOJUewON8F8Gt7Sb3MrK5fRBn/jxJZ3zlhTEIJjPqVs4mUd9
 GTOWmqFnR8FecCfio/EwJA/lOrk9VT1ZnC8dFGR12c7HkarYXRxHg7FOidsL5lsUlCuUiVQI1O3
 r9RNAta3xi01R2CPUSH/VPytL8EZSavtDAfQSW3GcMxshABy92XhhIEPh0i5Iqf0ZvSX2tw4wH+
 HkgTHlO2fFlRi8Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pxa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 131ab79ebce7555313fd93b3ebd80582d1b9327d..13f7da2a9486428bb8d1d44d2caf9f21f82cbca5 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -315,12 +315,14 @@ static int pxa_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(gplr & GPIO_bit(offset));
 }
 
-static void pxa_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pxa_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	void __iomem *base = gpio_bank_base(chip, offset);
 
 	writel_relaxed(GPIO_bit(offset),
 		       base + (value ? GPSR_OFFSET : GPCR_OFFSET));
+
+	return 0;
 }
 
 #ifdef CONFIG_OF_GPIO
@@ -353,7 +355,7 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio, void __iom
 	pchip->chip.direction_input  = pxa_gpio_direction_input;
 	pchip->chip.direction_output = pxa_gpio_direction_output;
 	pchip->chip.get = pxa_gpio_get;
-	pchip->chip.set = pxa_gpio_set;
+	pchip->chip.set_rv = pxa_gpio_set;
 	pchip->chip.to_irq = pxa_gpio_to_irq;
 	pchip->chip.ngpio = ngpio;
 	pchip->chip.request = gpiochip_generic_request;

-- 
2.48.1


