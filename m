Return-Path: <linux-gpio+bounces-21326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A63AD4C9F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0E7418869C8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 07:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED012356A9;
	Wed, 11 Jun 2025 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="efTa7A1g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D8233726
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626886; cv=none; b=SHeoUh7kS/BIzrBHjNf5LWWCVCJQ2I8QDmj2smUDBMqUsLPVEzhntXqkYFFMlvr8t3YLNQBW2Y/x+JEnzxSBtCeoM/VufvZdcNWRL8YJ5j5eFIkHj7Mrhn+imi6rHgx3kF/CGv/wCg/JjlbgSW4XwTGZjZ8X0ivJa7a9RiwNsyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626886; c=relaxed/simple;
	bh=ZMckEftaur0awqo/yKW4VecLuHYo3Jj+Dpx2jIF7DDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2tI7ENMVNM2XfGsnJMtZN0l8ztkBhc538Ye1+vmTgdeA4VAHjUeJ9Ra4CsgDUOYMrvYqdh0SNk7viV9Pk+OA+72XZozCxnTmsZx4Ctv5bx22ys5MphHJVK37CfzV1D9Rn34rLYDwUgwuJrQcorgpZDsC2oFPK4MRAAQMcOdpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=efTa7A1g; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so50416945e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749626883; x=1750231683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fz5ZJtTWraCxO84eZToYsMCR6vkVrOOU3h2l01GftKA=;
        b=efTa7A1gXjZbLJ7NIyHtT8ZrBKckenDEJsn/wl27wBQM1eKPmT7cncdgrfoEu1/WBt
         3jbb/1aHuX0xF1M5CHCE8eOX9PMlkONRDwhW7E4+9GWvGySIHkQUQiS0HSeV/GI4IlVS
         IuvPlEu4CA1ex0lNMLv/1Nj+xI7B8eIZ1SvwIV/bULxTtIx2Yvj8mlHZIu9ToJYQWVv1
         N+Rgc13ycgWlAo4Lmgy3m6DtROf4Cvz9qOnITAWaXzN6B8DkqM5JdRXZPhn8Izi9E+6r
         7gxQbGATN6BO9GORHCzP1fK3EVLQQUIF7Lz20L3el/kysfZp4S6rMGmWJKACDEiTQo69
         SYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626883; x=1750231683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz5ZJtTWraCxO84eZToYsMCR6vkVrOOU3h2l01GftKA=;
        b=rlthZSAQqiB0paLRuFfYOOMTsniu/4+5zG7kuszzn4WzgiSgybtrI+f14laFDCtJGa
         tT94lyDiB6txa9Z13lG4LAWRjHrA4PI+DTsB2upCBwzqJDDRVmA4vFjjH4CqibVJ1/pX
         9i3tYhTxWDpVgizJVAG1EBJ0RKBWUU+6B7ZgMf54N9R1wgpjc2C8BqrMgSaY6TzSVYHS
         sfXXRuDpnpXXaHGw0/xjwmB6TED0tVVDmMMQII9FSzMKRLLiKYRLuoh6jqIqzBhPM2Ak
         /s8r/r+MVyVSXo5D/MnvaAs84g66jFuvJIt89x1T5KDKZ5lazSkoB/CcW10iN2EwI/wo
         monw==
X-Forwarded-Encrypted: i=1; AJvYcCWsSdsETvTgIqKDiIMq8bvqJMVJoSj/gPO1Sn15a0g4s5VJABFH8CtiukH0umaa6wt2RLfGXXrBsW7o@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+Q8iWyqVwdsFQDowpOOekGrl3y8KtZ1d9LLsqCSZuPizZPiz
	0Lqvrh4DzgkV76SF/6ed9jGIPvRwQBnTT2eK3qHOdScruiUndytmGLhLB9cDWaT4rhk=
X-Gm-Gg: ASbGnct12WLwmMdYNvqz6BRN+1OsZh6rqfZ1ZGhggU17cTCsGYApe+STrMc5xstaJ08
	1ieyRUP6d3aLcYYcn7ssvcWjzvxNnjFUaGKHOs1sy/1NXt/kVoTzJiTi+ruWi6Tqu1434nEH93s
	X/6Mz211I2ecG6GDl19a1X2gZBEFNDxdltCW6dibd2hs93b0YtsZxyNFXeMKrmuobYOT4EG9KtG
	FqzCltFJjPkyVBM0OiZAo4PMkZDPrtY/Pn/PpVAx0E7k3UOYjqdGsSk7svsMbJLCkStR6m4ZSg8
	IrCa7GwxXb1ZyBT7LVPNhXiIC7T1dI9dQtH7bv845i7tuEiU9LEAdWzC
X-Google-Smtp-Source: AGHT+IHqWcTXTC99slfypNY0J9/R51fSuHI2YW+gpFEROt5HmX5Uek+3vp75fg822snEUAb4UYU7yQ==
X-Received: by 2002:a05:600c:154c:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-453248b0ee1mr19824435e9.10.1749626882786;
        Wed, 11 Jun 2025 00:28:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463e11sm14572552f8f.90.2025.06.11.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:28:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Jun 2025 09:27:55 +0200
Subject: [PATCH 4/5] pinctrl: rzv2m: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-4-ad169a794ef0@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4WbKIM0oy4jYhp0GxcNLcfPlrGEmjN+KK2bG6xszgaA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSS/94JhCtS4qT2pc9oKKMLm7V6mr5W1LPvI+L
 HrCCwC4EgWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEkv/QAKCRARpy6gFHHX
 cg68EADPjlzfffAjS9JziCwkMELfjtNZrm68yRRW4u6BaMBuFpQ7bmviRD7VISXRGQ3eRyTlgRu
 2eJvyX8g6hrCG0RVFyHG7TzWTk5gReiV7oAl1fK7ufi+m3hSIn08JEP7tv9ybZYJ4Qhnr4iYNSm
 GpXH4eXdmCPhQ2m4QnYWItQTGv5b25tLfYYJc39PJs8y/oHBGvyDOxCzAdu2KSP3sbIG1KKzuva
 sQPZngx9vz8JyPfLVCJrwhkbhmQoowNzJxyt78dE7AYBMBmbIQLhlolZkgkWMZ9nhvNpsSBPLwW
 G5a5aiIDMrCTsq33Yy3S+sXf7z1pJO5h/p1D9cAXoKLEhc+ox8VbaLa2O7m5Dy8KocrnbgwQBBw
 A8LOBOxQk4Ge5uhdiY8CEKm+9VkiFCkoTK2NJV/Lg3jQxDlNJQ22AucvH9T2rRar73KS/gUE4Z6
 CQFxrRdHWbFcpBUU6dwLh1YgjrZA+4jhmjHrckjgXMHqWeexo75Ld6RuYrQAX1uNZpIU8EHHt6t
 OVTxj1Pp7FsBZG37ZU4+apTO7hvzn97y3I6aAs/1rJu5bvXf7faLk902BCnB+I6AqJMWTU1sBon
 wPdEjA+izWVPoNVMg33DatFFsRkjOd5ZSRir+jRm+sU2aIF3uztPu1XD/iV8eQCf2i+lmJA3OIs
 W8aaDT/xF26HjoQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 8c7169db4fcce6144d26b963dfd3b11bacd66d80..a17b68b4c466e2ca91cb26a713a088e309d5e167 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -790,14 +790,16 @@ static int rzv2m_gpio_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static void rzv2m_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int rzv2m_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct rzv2m_pinctrl *pctrl = gpiochip_get_data(chip);
 	u32 port = RZV2M_PIN_ID_TO_PORT(offset);
 	u8 bit = RZV2M_PIN_ID_TO_PIN(offset);
 
 	rzv2m_writel_we(pctrl->base + DO(port), bit, !!value);
+
+	return 0;
 }
 
 static int rzv2m_gpio_direction_output(struct gpio_chip *chip,
@@ -955,7 +957,7 @@ static int rzv2m_gpio_register(struct rzv2m_pinctrl *pctrl)
 	chip->direction_input = rzv2m_gpio_direction_input;
 	chip->direction_output = rzv2m_gpio_direction_output;
 	chip->get = rzv2m_gpio_get;
-	chip->set = rzv2m_gpio_set;
+	chip->set_rv = rzv2m_gpio_set;
 	chip->label = name;
 	chip->parent = pctrl->dev;
 	chip->owner = THIS_MODULE;

-- 
2.48.1


