Return-Path: <linux-gpio+bounces-16934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5509EA4C1B3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A31973A9B8A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562CB214A60;
	Mon,  3 Mar 2025 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zFJ/jA11"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3132144C2
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007932; cv=none; b=eimiGmWtglvLSjozSGsgWWRssTNFlljKPI9hpCEXlDNkANFBYZcO7FsyNvd6xjU+i2T1LVmxwnhihuDLHGFJBAtfQvVCHbGshnjkhF1aEv2sYsI4tNyShfRv30TVoOj5Nida5rlvKIKuz1ALQgtvSQwcd5tQA/UFibhrcVduSdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007932; c=relaxed/simple;
	bh=deE0/c2nEjbtQwMnECm+JYV28arpOqWDFy92uiuE1c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqmkjMTvI49RPJqIa4kPITUz3fvkfsra0nYPz60MDht9LE1X+58lqQUay5IfeIakqHxDYNTXIYlRDvSxmWDyTkxEl+xp+W0efqujIdvXBfo4q2F9F+Ccwr5n5B9HwE7N6yGZBQ4MpsJuPPhk+eSfDT6yIXlrLY4OiYTKCw+W9pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zFJ/jA11; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390d98ae34dso3620081f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007929; x=1741612729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcjPMcYJBZ0o2cTrKN4oQq7L05UvaqKLS11WKTvT3CY=;
        b=zFJ/jA11BAupocACLe709UHenndWXTMx/+hw5lKkrGyLV9ZZ34iSJxOScwr7JDh+y7
         TpP9Ttzr6QAFZk9evQYthW3HGZmbpmkToHRLeIChot/j1HOdgBDdOl4UUC6d4ue9EZOI
         g04OL9hOhcc4uzXCrFUAKHAacef8FbCut7QN+HMcdrhtjSS0S2U8HqcNivdXjJkRbpLG
         5UsZk9RN5VJ+tTP7fRAHmXwzB57MuBtaNfxrVt/+aXMvDAgIFlTPY7+yblv+dHddlAhe
         /MEX/o3c5shRuzUIQs46AWUK08iBwnwl6INoFhE4r/vBYEYx8CnMxZnaVtC8aixw1PN9
         St0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007929; x=1741612729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcjPMcYJBZ0o2cTrKN4oQq7L05UvaqKLS11WKTvT3CY=;
        b=sep1Q1ER+SrHDqV9pETLU6eIvEcwX/r+OQYlxz6aFfjpradBApsSTx+sk9q4mtPpvS
         Anx1QrNlao70Av1mjonh5BemAv6XySC9syedLiQE3H5HNZgyVZbXNj7ZtMUtf9YxnDtN
         rszHGUi0rfzR1Pk9gExkIHeIXZOhLQIzFUoxLt/TxVUuRJcNb3RD7d+Xh671VsW2VZeQ
         16ubzuWlav2NBwTb9EREccIZYYQ8jvoEoAgbFd/ClspUsXgtdrvaNAUL84V70X9Etc7W
         mllUKkifAKjcT/b5H8Kugaf7Sq1bo9lY9PmR8I1QmfaQvmsZpzV/mTBhaHy4jxFreEEc
         kggA==
X-Gm-Message-State: AOJu0YwOH5zDz/39gx/iRq/2Bvc5iBdJvzjXBd0My+N71eOdMBnUmBuq
	3pfZpM2CG1GVt7VB/5JUYWS4o1/YrjtuSBLYfdHB8a+4h0PuPJezyZqbTXJFvJM=
X-Gm-Gg: ASbGncs9IG7o05Bwe+IckcLkrxsmKhelFS43OwwkjMsIOGUUHIfQoEzWk9NvFAjKT7w
	C4KNCrbL94iS2m+0mmMBSdwgBrLd445vQb8mf4EZvQ8i5xta1fJSqcUF66VvbgvlfqgoGhz8ugB
	yYhudXanio2XPqQgBBc+EpaD63oH4XJUnQl38z1aBEGytpnEsQ5EZxqZCHOxSpjf/V9WXw5izjv
	ExrwrLgIqKPENWSTvQd/aunxtzascDDy2YAVINA4IvI6fV0OqXxULt++FglCPSBppaTGv9K2LR9
	sSUe82ytUvJzKXdREJb1gCGIIavMVaQd1afx+w==
X-Google-Smtp-Source: AGHT+IFhho4idDCteO0g9jy+tOrP6KrDeOVzx+yLtKrh7942wsW3Cz+EGc7Oxn5Z+QFnIfxYQ2MoJg==
X-Received: by 2002:a05:6000:402a:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-390eca815a6mr10808948f8f.50.1741007928914;
        Mon, 03 Mar 2025 05:18:48 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:35 +0100
Subject: [PATCH 10/15] gpio: amd-fch: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-10-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9eVt33K4IbRQUOdQWj39q7CiV8Th/sXfepGKt9kNNRE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawrbxiPGpQVYAB1cWmhKX+ZK1p87IdH7rSqD
 6Mm+ENK85+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKwAKCRARpy6gFHHX
 clwvEACG9rCLcmUYrp6fcssfEz6AE2R/ukaohKncxCYYbAX/rW2pV6g+qY6GaJWEFP/n+qRUCca
 ImG6zhs+hxyTBrKTa/UlVdYUJMjn4SC2ZsshH4eCzDYkBTiomLn58bzkxBStRBammI+K8qAMe+W
 dCldrLdfZs5rcbotRVzZ5euHIH8eaxeLOcc7+h/rjfEPxvoo9Q9OW1xkuXDdlGC84fhe62YuFQc
 WXdlZUhLBFXpS592viL036bqrGlAxbLiyeipEndPdG55Gjf4PA4N5d+gk/7CTfBaKVfogJoAJpn
 HXL5h4V2j4ZYkhM162i/zGVjbCjPAAGyLXeXM0iKK2WsHFw7YK85chRrCfeNR27SL+KAggdJFDG
 x6Sj/xaJb5rI2J6b3G+kLy99d58hPQyaUVABsOxZHbaz1Y3gn+esMOnlMvCmFY3t5/8CQBoaZSz
 6XuVOZi5+dPUcDuKWKd7+lUtYO6o6qxcDz0ihzBmZTZHvZ9C/UjaPSGEyWqFZA5uEsY+M/BxYn3
 OmTsQWqVYC3khOl1eGCcdDsPjXVl/JBSdtQkwkLTm43s+Mrcn3DM/Z0y0qbEhYFDmcFbEnhvF9A
 w55Wpdx320FOGUTebh6MXxEg24zWayCUlfM9fuESpR/+LoXYGDpe3LaVTd+KG6tcYr0WqBZEuvy
 9Imns1QzMQEPTcA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-amd-fch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 2a21354ed6a0..f8d0cea46049 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -95,8 +95,7 @@ static int amd_fch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
-static void amd_fch_gpio_set(struct gpio_chip *gc,
-			     unsigned int gpio, int value)
+static int amd_fch_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	unsigned long flags;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
@@ -113,6 +112,8 @@ static void amd_fch_gpio_set(struct gpio_chip *gc,
 	writel_relaxed(mask, ptr);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
 }
 
 static int amd_fch_gpio_get(struct gpio_chip *gc,
@@ -164,7 +165,7 @@ static int amd_fch_gpio_probe(struct platform_device *pdev)
 	priv->gc.direction_output	= amd_fch_gpio_direction_output;
 	priv->gc.get_direction		= amd_fch_gpio_get_direction;
 	priv->gc.get			= amd_fch_gpio_get;
-	priv->gc.set			= amd_fch_gpio_set;
+	priv->gc.set_rv			= amd_fch_gpio_set;
 
 	spin_lock_init(&priv->lock);
 

-- 
2.45.2


