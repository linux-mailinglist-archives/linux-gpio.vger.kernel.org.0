Return-Path: <linux-gpio+bounces-21698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4465ADCB6A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441F81893DFE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA902EA46D;
	Tue, 17 Jun 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CvaVIS4J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC072E88A7
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163094; cv=none; b=R40F8NtS96l0VMci1HpEf93A1IxbXBxyzOngdAJYSepd/KFOWbucnPqrfPx8HYLSaaCt43uX0A5IJGhM5sZaJDQYRVpz6HFDBBZ78BuTWy8gJYxwOFZyEY6kp7MpDW+EcEJzDimwccVTJoF5bTv1QGcpfEuWrXI7qTRUEHmwwcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163094; c=relaxed/simple;
	bh=k4dHPZZ4gqkig6Focr6bfb2InwZS9T5SYeSgNocjwKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVCY4ebkXZEVvaS2hO2O5/jh2EUeHnwMMsQNNYQJhFnrOA1qZF/1CXSs6SwZr/Y4WPewbiUzoCyIBYOW9SBL8Wn/im8qtpEn3V0BydNF1it03xYocgsbO0MGpeQSSXb8aCtpDskjh7e/YGcB9GxzcbWbjnCMTWDqpOeTDAjWDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CvaVIS4J; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4531e146a24so34689435e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163091; x=1750767891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKQWt4//oHPqdwtyW4DHzL6S4FclhuKp/qxVZV3GJA4=;
        b=CvaVIS4J6DyTJJuQ9ekrpzT/1gUNtHl6g/+rszZWJKaV5iwaDKtve+0Ow69TGo+Qv/
         0XrM5gt+qVp2trU7QDPPAzj9aaE73E94jY78TvN7Wrm/LB7eLJ4aW+6yPrqUtyb9FiIa
         bWtq7FyubYt7BRP43WjLH/V8YHM1t0eludAKYf4rkOb8OQX0GV9foFGx9jV8qVxOItZS
         6O0kcHcr04j/4uLtHm4GH7+A5WasGsaemyGYfMA+iB18xzYZo3XZ9ces0K/V5wGQYmgM
         qQSC8olW+u0Yxp5gRUoMv5lexAasK6nQqk/Na0FCjhIx8YyK2Arj16akFMCgDPULuK14
         llAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163091; x=1750767891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKQWt4//oHPqdwtyW4DHzL6S4FclhuKp/qxVZV3GJA4=;
        b=PFiaFXUTC3kufp3sDz+0i3COwX+oofPw2HgReCJK/PDhX78Mm8qgB+T13XaEWWnf3R
         AdG6Qp4oo1FvT0a0vTEVSKN5VsuNRbCAZzTqgQaS3sso3w7lgCHtXzW39PqSKjmS4V0k
         /SkPElOppcHlyqZYqjiygcZV7PiIn3zwCWUtZl5yRNSSAkKnFxXRpSxQe43MOW44ZOOw
         osUgKS4r1o9e652ebabMZKwcOHfLL01qPs/FTyE6yVX1aB+Y1Lpg6eD6YjGYC1az6n6h
         6gXRu0qdLYbdCDgiFeGW4NIjqwdZO7cXpwx19TIJR4aSV+hn+0jCPIq0/0zp9Tit8ShT
         uCnQ==
X-Gm-Message-State: AOJu0YyhYDr32dc38QaMTCo062YHJs0RJFmVlVxSA34yCnPa7s9h6sLn
	CB4HYAUH8hOj0/pdjLgTo2dzPWZgq0jayK/ZLlxQ/PAWwZk+qcPypDLxSzbbJOcifkU=
X-Gm-Gg: ASbGncsFvtNAfY02dcTr0NicRLu1megGWGIG5Sd6CJqLgmrOb1GLpNe5E2g352J5+4X
	JbLI9SUTYOAeZvbs2f3WqGkAmos6LY/8WGyzkaqY0n/c9qg1o21g6fLjVA78bud1156X/F2P5xt
	ZuFye2BgEoDvdEnyhomweeHFSnIj2OOuftehuq6HdLshwWKk9gSxqTrPuKr2XR2zeK7Q4o578XV
	IO8M1qVsPo59NQsuPVGxjlZRmMerBNidriXHyLhtsKDO0fV/a69D1nYt5xZDzZwTh5CWzF66LR4
	8dNDj2jzhBepcaQrCDS4FmFtF+rsRRZ02zsyfmr/ZCHglMZaWflqFTyh
X-Google-Smtp-Source: AGHT+IF6eYsaKpvLJvmiUt8QAE8cQozg8YKi52ZOS1NW0clbxh8hC/2bJbDvUtJBCX2vBadvgAd1AA==
X-Received: by 2002:a05:600c:5490:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-4533ca550e9mr126976755e9.9.1750163091328;
        Tue, 17 Jun 2025 05:24:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:31 +0200
Subject: [PATCH 09/12] gpio: reg: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-9-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2vGuNGgCgh0pc+4hsP4u+sm/9GXFZBWpDEWg7HI60YI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6IRA8tyBhHC37R2KBIo+pHJI7AEfyKcsRQq
 WM5zs1FSCiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeiAAKCRARpy6gFHHX
 ci99D/4hhJaBJIevMhmTwG4mOMgBexZpMsXQOU3lkV3o0lyW7sCFFoT4RAxJkgHQb3UY4BdCzYR
 hsuVsjmoiLXcB24EATcTHXDb+I4MldGSrUNljZkUqOcM2wOGt1cT658ZCdGGoH1vlNWLNHOVT6/
 2sL/BZgYNCi2AH3VGnf8a00O6kLdiRfcwLZC+PUzfsrpKn8gF1Ix3Mkbsa7OLF84038LJq6bI1c
 c2VRA2dqE9Gt+iutb+pLDOys7jK/e7YtrEvr6TVipW7t9rd+wfSGx6VjRRdQOzpRg1eu+J+Xi8T
 AYWthV9MGLhyJPDlQWECWxURTOjIym45RF7cVhwDCcsUKTj5xSOxGX09IUdOZYJR0VGfLcJPnbb
 8BddmRCCqi8QUywmi0PQdgTEK7df0vHiAsu3qsbCUCWv/gGbWZLFJNBy/KO5u554GAGHkJBg682
 j8YI40oL+nnf6nrN9JftBHs1Zd1kU2plsmAdp1w09XQCrJHaFQY3rUn6NEacZyxNZh1mzMfxSNZ
 G1fQZCb+TzEfZ+NGQJGbHU+7rf1b/xGILFLDqr+ip8XKYSSu5+No4Mauf3r9NKCxcIYvTtPMDBf
 uQx3IwCLQdPUqNBmuCpK8CrCHmX66eULZioJiClL3IJoMf8EKjEJF0epLFCIxutnFYCk+3O0QSk
 07I77UmQH5zfvzQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-reg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index 73c7260d89c083a702b1d914ddca7a573a37de4a..d5f3d8f18b405d124b17c338d79846214f9e97de 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -57,7 +57,7 @@ static int gpio_reg_direction_input(struct gpio_chip *gc, unsigned offset)
 	return r->direction & BIT(offset) ? 0 : -ENOTSUPP;
 }
 
-static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
+static int gpio_reg_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	unsigned long flags;
@@ -72,6 +72,8 @@ static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
 	r->out = val;
 	writel_relaxed(val, r->reg);
 	spin_unlock_irqrestore(&r->lock, flags);
+
+	return 0;
 }
 
 static int gpio_reg_get(struct gpio_chip *gc, unsigned offset)
@@ -157,7 +159,7 @@ struct gpio_chip *gpio_reg_init(struct device *dev, void __iomem *reg,
 	r->gc.get_direction = gpio_reg_get_direction;
 	r->gc.direction_input = gpio_reg_direction_input;
 	r->gc.direction_output = gpio_reg_direction_output;
-	r->gc.set = gpio_reg_set;
+	r->gc.set_rv = gpio_reg_set;
 	r->gc.get = gpio_reg_get;
 	r->gc.set_multiple = gpio_reg_set_multiple;
 	if (irqs)

-- 
2.48.1


