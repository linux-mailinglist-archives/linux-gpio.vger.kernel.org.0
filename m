Return-Path: <linux-gpio+bounces-19299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF6A9C2C1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA98F1BC02F7
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5232405F8;
	Fri, 25 Apr 2025 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EYnj0Hxi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0D238C19
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571672; cv=none; b=aH8//VyCMdxIjHvXFwYBnZfSTWzthvA390RmCQ47ZVkhs9jH34kk4kjibEWj3S32DXU2GdUo8kwApy1G3x6MAIjWCw0oTUeMe5UMDrBAkXHvUHffw9JLDpdPG8W+HbS5CQKsW7tTK9yQz+b6JJZdtZ1THfXv4Tf8UlQ6RJHfRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571672; c=relaxed/simple;
	bh=phhWviKKhhzzjzPDil2DbjlngOzuC2xCXBD1aK0WBVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3O44sqWKC1AfT53mDhOUoDOsBPoVvwQ9AeGRJpZ4AG3LeFfi0NZzW4Ckh1ECzTuQQT9Den2V3QYndvGGZ+nd5nq7KcsoS8jsbkvpfhCyZxzaYdORc3ErfHOkF25aIMZ48uFjh036EdgETK5wGlEJ+2tlButmaH3nBQeE8GOgTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EYnj0Hxi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1163896f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571668; x=1746176468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=;
        b=EYnj0Hxi6pW4zADwpWaOo3NtQwbi0vT+6Hk+dxRI21HdXhQrg+F2r/uAcsJWHRbrYK
         pW2OOIgmEZs0gktiK94MCgPEOLud5BwOTeoBdCLQqlekerFZCzSI+9A9JG96uqtQoaiS
         e4SYx9dg25qQjdKXQhqLtRlWA5iQxdRqLe0uBU0l9JNU2GU04elS0OCVSEFD4JPFJRuO
         brTs5DQzxozWyP5xoPAK2y8uaIDXXM/hlvIAR9OPPc0QkTOxlmwp03bWeP8FSq3hzS+K
         ATYpHlNyt7wNzUiYibGon8VZ00bEM7cswU1WbqD1QtIq9bDWgNcgeYcZX5/KO03IE1Hy
         DmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571668; x=1746176468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=;
        b=snndeIvm3R9iJ1W908OQ6oLlp5yVhqqrhyLA2+Wx0VLigcCkAJqhSx781YCZQKII0n
         5QLSvtmB9IzMYNAz5bKJWhg3aU2iq83vrnpM2jy7WwU0e8WC7H/d077AmzOJTnaKkNV7
         TWnNaQTEfRMvFVcL+oATQra6YlCyORZMNU6RnbcmqVDXDXYh48EQcN6ME6ig62ZdI+LO
         k2gwI3RNsZVCMzhxJt8RZPYyg4TU5laEGaOWtizDt9dnaJYCdt4ZwKBJzM+GIifCzemp
         ZLTkeoZQPZ+7etnCSePiVhIl+9WZ6tQKVO3czFw3LeCRqXwv8OHmu7vk6oRbIwXAGvav
         9IQw==
X-Forwarded-Encrypted: i=1; AJvYcCXEFeVDHm+pRK9HTensQMrAHu0X/8kcK/3rSCOuAlQ63xI7kT/qhfoYBS1DvNqn0J4pOQVtAngXwR8K@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7EwNBQMJ2orW1UY1muZkfd+6ei2VTzCVDrz3mxoe1aVeixz3n
	oLbZ0BRJYNHjOd1i6upbWWoPVGg9FoaMu48VPh7iWmd/ypZRuPI+aQCZjDZnptQ=
X-Gm-Gg: ASbGncu2N88NVzmcq0AWtcdCTTSI2cAiQwDf72UTbIn1MFC9JAQahppnXSHDP/LmIZy
	q5MUR13LaejhvxQPT0cbtxyHpuQTFuiTwFPPN+c3t8n8F+S0ljLIvL6S1Cj4PnR9yQzjUMQRqH3
	t38c1p4Qf0TMEvxBwPqNN/TLsZ5grWngr/eaeDxeAraa/dES1gshAjC7YUix0CfWEhgPV/zkRNC
	3rHQvvhPap6hmq09V6axZd9EVtKCvj2AfaQ3/lPFRzl2expz4QCedhGcU4y0d0ElEsnoJ+SJiHF
	quvsyTXtssIokQ89tbObaoFg46jPaWclWg==
X-Google-Smtp-Source: AGHT+IFW7oHQT2iQkXG5/oplsgKCVuoYvLPqlkf0fWIPHa0BO2c6LkQgBuCA2L7Ixcx9kcJza03b8Q==
X-Received: by 2002:a05:6000:1ac6:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-3a074f4853cmr1080551f8f.51.1745571667902;
        Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:58 +0200
Subject: [PATCH 2/5] pinctrl: mediatek: paris: don't double-check the GPIO
 number
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-2-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nUKaoN4taOpveP3nc3OVuJSxVohaZIGpFohuQJLAScE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09P1im4kKMb6U7RG39p9G/VrnbdkYWFGjboY
 3bmo1dLQC6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPTwAKCRARpy6gFHHX
 crgtD/9is3Kf21qiXzq1VSscbgtqKAJ8hb/XCsd0cS2PtTKxYDWP1SnTIL4KX7ofzZY6+UNXOZp
 dy+D4aO7WNZsFR0/IHIeqWBWEk3rmMlSGkbfrIVDhpWvtIo6opyCQxql8Q5LViq0LRe6JEPRdoC
 Lor1QT7DRjA92oRtQppJ2/eJZFWLujiVsYYPLfXICUinmpUOHk2wHZ7Juzozwht7N/RM8hDQi5w
 Tq5I9jApIX7HuFwuRuILD7KrOPs3yAIkxg5EIl9t/8uEheTZAUl8gjFrt2oXh1d8QjiG6UIsnQ0
 FCxUF6W7Qt3yoXvJB7BVE+lfhs5yJuhuQiBz7jSQOmUCnEpPC+rnlE6PEgqlrlB4S3UfQMyfxXu
 TkZGAWz6/V/ricSCTfoPbWxtHT/fmyIr/PoIil6NMgsEtw2lsTQZclPoBCEjv8FSHBZaLlZp21M
 QjWftw1cUSxo+sR0S6FDFFCo3EdAN3zIgltKS6I3KlaRXzygoM+OsakxjcXFba51INkzT5w7nD9
 EsU0E0Z17ILt6kloAzswTHoIJKQM1NeKw/qUNa1zMq4sLMkRIadcAf8J8lFYGsqLQt+KrRyjmQN
 85NWWLYzuxDF0gYe0/Ci8Zos6oglGyM6ff6HvFfXZwh0zf1/igURjsYJ8qyXym9CZlTm2F6YJGx
 sWnd0wD08yn563g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core already makes sure we don't pass invalid GPIO numbers down to
the driver callbacks. Remove needless checks from the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 87e958d827bf..852ce0ac7ff9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -840,9 +840,6 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	/*
 	 * "Virtual" GPIOs are always and only used for interrupts
 	 * Since they are only used for interrupts, they are always inputs
@@ -868,9 +865,6 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
@@ -885,9 +879,6 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
-	if (gpio >= hw->soc->npins)
-		return;
-
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
@@ -895,22 +886,12 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
-
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	return pinctrl_gpio_direction_input(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
-
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	mtk_gpio_set(chip, gpio, value);
 
 	return pinctrl_gpio_direction_output(chip, gpio);

-- 
2.45.2


