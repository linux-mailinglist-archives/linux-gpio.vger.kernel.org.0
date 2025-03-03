Return-Path: <linux-gpio+bounces-16932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5113DA4C1AE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA9663A9885
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C65213E8B;
	Mon,  3 Mar 2025 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uyMXxpVX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1332C213E8C
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007930; cv=none; b=uni3VdAkyL3mqzFZnUZHSww9nJ0D+6jyx73IvR3Ud8+owm8llRA8RKBSL8UdY7QA4IIEvZEhoS3nBDhRzrmqSSLcfiIDY0CRSOLVKTKkgdthRq0YVaHqQJhz9WQEeU+PR2qOn3y5iIWCufEasKudHXjMRY4xC52bW9PQkFBksqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007930; c=relaxed/simple;
	bh=pNFZLswBAGvHZgnszFpzGA3Zwifb9QpDP0WoiQWGE14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tqzVApJTXYMxnQ3WRNf6/52kwB9tklV5TOn5HDy1citLLgPfSDlAc2CaDQumXuNylgBL5s6JaMnML5dFqAk+m65nXFvVyfpd8ek1mGkuMtxcgNdr/ql3f/dY/1/BWB2qISKktsRq30yvwb3t0Gir1kP4Xmm6fVQSBebJp8kIndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uyMXxpVX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43995b907cfso27906455e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007926; x=1741612726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r0MuZTH6RnCwiU0BqdZFY1e9Cm3LvOPjQ1muaLpSVA=;
        b=uyMXxpVXvID0PXrjwZjYyxx2FfGD+4e/p68FyjiCRpx7Nl5X5YTO/EuMYUEdHNiIdL
         mZb198mI5SsJfSF8NvLq1eg5XMRDBv24y+Mrf3BpIGiPr6jG6WhduXqVMei0wKbBOlKB
         7MRcMJd5dJSbUg8sZdo0qNgHIg+e3c8Uq88raTYa+6uKvUMXVGnz9o+BW2PMZffXCn86
         5/ODKa/9qW9sj4IAOv4DelvX0WZ224Q6wcs7orc8y/2zGsq/0GhbKfpYuX+f5ihkxW1Y
         9TRqm/7S54qi1aCTmOhJxojkln0VpheuTRxL/XWcTvDK9eCUxUnFrO3rZSk1mWQYKxvi
         LSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007926; x=1741612726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r0MuZTH6RnCwiU0BqdZFY1e9Cm3LvOPjQ1muaLpSVA=;
        b=q8dmnIFKnwyfciSLG/El/Ik3+olQHfPNcPSfbfebKv0Lkc/RDrNSGJdfA9XGeHpe0U
         ddr8hJln3IMfiGmyK0Pfs/A6/y4erj9tAwREm0j+dbSPPTRX+758Fkl0VNcdwvga/kY5
         vwMWa1ASe04CZVj+Q5B6JfuuWTPuJIrtISSX2jsQ0U0aBPFVD2I29U9RumaeBDZy3Yqc
         XcEobASS2YmevtO1BvysjoG5IcksrCJlqgBrNxNUP1h2tZGBPgM52GCQgkCKL02Gg3/1
         KdoEIz0BZzkZU6tIWi0ljEPHmMxI7d3hvfrPCEHaBn7E4CAuQ5V6vCClZtxQ7t84+Own
         dVAg==
X-Gm-Message-State: AOJu0Yz0qBjy2viNIm8YEaOde8Zna1FcC5RSnaqjLQC7+npWL8wvwNQb
	KkXAgumEtmhlCfGbsPyo0vfNX9awNID840NJb0pASZt3LfVVCx3LPbxWEJh6Q1A=
X-Gm-Gg: ASbGncut23ObFVrT4qibLfF9XGl+VFI8jaNZgpo89DrA1jFddtF/+GMavdzj54jmZwJ
	NK3vdXpaYdbI89i4/rq3g0WkRCrNbEZH8chWcr8jPFswMbohqh+K4b7gV397asKD1Lqt6di1ANV
	AQMXwfDqiLpJHoOOwYlYTEt74HFt+ecbbBBJ7y7iedvKC61PJTGTiY/JmGnp8BvNH63IEkh932v
	xJwBqcM/bGQIplX84ur+LClFsHCtTAEiWhrSdztU7sv8aIeDRy/ZIOz5vyMbtSomFDnQ4M5i5fm
	6n5o15ZLJCAIUgxgiOu6Xv+nR2vQ+lwUEDtJoQ==
X-Google-Smtp-Source: AGHT+IHm6EaYBn70SJkUBa0sIwAoFeDNkswqub4neNrYccFomXUwUOGpuKJlkXEU0LDo4dNArOpzqQ==
X-Received: by 2002:a05:600c:3ba9:b0:439:9828:c425 with SMTP id 5b1f17b1804b1-43ba66e0a61mr112280175e9.7.1741007926409;
        Mon, 03 Mar 2025 05:18:46 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:33 +0100
Subject: [PATCH 08/15] gpio: altera: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-8-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SMOq2xgstETx1JyBNH5vYamCTElxv0DKa/FsWx+nPds=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawrqlWF7E8xNzhaiQDDre2OcEVZwl9/RTexY
 M26Lfz22DaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKwAKCRARpy6gFHHX
 cmqwD/4phcgUzCpl6mKnD/IdnZIH9RNk3LmcqASY0VFf4EbXRAfUJVTaMQeDgSgk24dtEjEosuC
 bpBw1QzXfAFamKZKIQDyNKjXPzE/Hoe1EDCF34rZuNHNHPI0UBjmxJ1HQiXsaiOvcp6YuN90LqU
 IruTx8dSh8NomvJYZNovzKeon6/LRWzKlWb+uZYczW7uUFTXZL+T5oLS7DO99kqZsTCTfVU6Ul0
 3OFRD6NQ0Ihy9l2k1V7lqCDuH+qJyDeuUNq2LtUBuuX+2I8AY3ESBJp2i+MBGELCLWfwR6b1xxT
 LeM5r6nSFUOHN/2f46OZqPlXo+/06oFEI5JqVGow8tZdNrM6mq6cPa5erpnMrWDBhkLZOUeMhCt
 DWHujIwH4kTX+GRjsbuNjNbgHqGEDhX4l7xuIqaQFgkjS5/dRaSQ62lfMxG5PRYtYAOb417XaMv
 6t9tvs9wnV8Sijw4pvvP23BSDop9+n7LfOH20zHB8z38ZXbJcRKZJoWG+Brj5qdvrQmskwcQC0u
 MK94saNiUr6TGH1b7JaI0RM1SXCnT+wdiP5hdJBrPc9ZvTC7wVF5ruvBjzyMXjf9DAdh/hou8W1
 S4LR1Rq4rbXXTZk3VddxFwUqAmWQKWmlpqvYKvAjKmoq6Au2FAByQj/JHUPyd3iJAIjpfvDLzrN
 e1HgWPF2h6MAoxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-altera.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 17ab039c7413..1b28525726d7 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -113,7 +113,7 @@ static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(readl(altera_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));
 }
 
-static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int altera_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -127,6 +127,8 @@ static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 		data_reg &= ~BIT(offset);
 	writel(data_reg, altera_gc->regs + ALTERA_GPIO_DATA);
 	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
+
+	return 0;
 }
 
 static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -257,7 +259,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	altera_gc->gc.direction_input	= altera_gpio_direction_input;
 	altera_gc->gc.direction_output	= altera_gpio_direction_output;
 	altera_gc->gc.get		= altera_gpio_get;
-	altera_gc->gc.set		= altera_gpio_set;
+	altera_gc->gc.set_rv		= altera_gpio_set;
 	altera_gc->gc.owner		= THIS_MODULE;
 	altera_gc->gc.parent		= &pdev->dev;
 	altera_gc->gc.base		= -1;

-- 
2.45.2


