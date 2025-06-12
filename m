Return-Path: <linux-gpio+bounces-21462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD90AD71B8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998871C21666
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB5125E460;
	Thu, 12 Jun 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SkRfxQcO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCCF25CC61
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734149; cv=none; b=L5yRc3LIKpMmczfXkXYrhs5Mlj089c8gYkcCzH3M9YpHTv9Yv5CtckPkZziuhYzHn332FrSVwfwgC7BE8dsQGGIEF9EHxr0Vl7e6mXKA8iTFHLpe8jxIgYY1A+Da0TKVE74h8FQVaQohFWFJr+H9TVMJvM0DRHmz7wtKOqguw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734149; c=relaxed/simple;
	bh=5pAhRcgO1+EuPNUIzj/fNOn0kIQ0uu1BHYpfqb2hKXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2lJ3yR36+1ujYH9+ENMZdp7yjnJmuyNCy07QHnf0zN0pI/FrntIKLkVOkyX3wxwU6J+i90KJhjy42+QDwo2f28naV5wNgnAufKAaZDoE9C8Dg9m3ZwM3tPXJemw079BaZvUh9aQwrJyyEIkaKF5/Xr/UrY3S86sWT5UcXrVFKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SkRfxQcO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4508287895dso13339225e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734145; x=1750338945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=;
        b=SkRfxQcO1N/t5cF5Y+AM3MYCuN/m0UyqrouPoxAvqKBtRV/jr719Qt/rh+NDUWuSPd
         z7kda4YcRP/rHxhv042q4ThNUWI3HFa9fgIpWmRSulpAL8T4UhQofhBzdU+ZnQtM+FBa
         /WGBjNkcg2HKOgW1JGLXVpHbKFwLwi+AJ+e8mjE9JPD1QctuI6wdQ6dP+aHeXmPOFeuz
         Tt63j/SgbLlnHie3yKYPXgCHMB7ubWfZJFWBYZh/rmjEN8RtEY3SG/1sNR+5mUdt5zlm
         8QnlOHT/7h911rDwMWfSRxSZgEbElPkutSJsIcSMDRHgTTVaMFvZJvhvOD88SMa9QCMl
         zTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734145; x=1750338945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=;
        b=PlqlBkNd3kXdEbbpmyaiHqNFjDt009f1hmi35xg+amLtveJ8dRcLL4fr2LQG85JW6K
         tXabTRvf1cey8N0ssY2bbfY1XycJhe/0cecLfQDP2BFFXv/VRbGVOP7S4gUdKtQpjcba
         Nj1rkgspQQWq93385FHdSIKWyyjvyX9iOMmhKA2o06EiATRtHMfH1O1RXacnHtCpFRQx
         uv8+ydbohfoCvJ9aycOBMjU1lNvX3fwDvMDM/QssI0PEAhP6WUMnqG94yM9AgtdluBQh
         oYfAFCtgeUQG8cQTT8HpBfS5IlW87/Z5S23p16e93X0aV9YJlRmdYYSmSqO0sGny5bIh
         WixA==
X-Forwarded-Encrypted: i=1; AJvYcCXm63UtsYFoo/BdPnKtY87p7a9KiFb2q2N9QXSGJjrW5fPjuuQGE/o5Cy0McJXYUYZ6IC2m0E4nVRb5@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXCkpFUwsjE3PoDKQUNNoAScRY8/3imW1SdBF1WFzBRKNRlui
	Z34LV3yGQWMWBmu2DrtfY9qmsDhV3M69g6G5WLvXXIqEi65VgPGLEOSTpUCN0VV+JGo=
X-Gm-Gg: ASbGnctQ+1znEqhXgK7yWSGWh1ElUje+NSpWy3RTJaxOMpxVcPmGZr3YRJswABYgeOF
	6Z8pvi4mEaLquu0iLlLEx7vcsXDrSZACyVZ9/F4DaiQrd56OBkJCpP8+rQePALMa+4WzipUpRx4
	OqONatxKgZTY2v2zp6NoohWJWiiqEmdm59xbXVXqRI+R5S5lpM+Wa4ZJr/7Q+fqibyN6Cdm/+ED
	c6XE06WUNJflvz3pQFz/VjWSK81l3csD6iodsNbMelDIkbmYoGNI0eloNSDn4iRzcwDOjPczNUe
	WThPGpSAFsefwqR/rsnto+TXcM7hn7v86vu889U2r5HG9tYjN03J2NU=
X-Google-Smtp-Source: AGHT+IEnpJ6Q4AZ8oPyYmaUzcDZGuReMq7lbniJezZBAPId2TYPV/p2NnMGPvdWDp/pysd3sY6Avhg==
X-Received: by 2002:a05:6000:1acc:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a5607fa6a9mr2707038f8f.16.1749734143769;
        Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:25 +0200
Subject: [PATCH 16/16] pinctrl: amdisp: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-16-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ME7t3PhskqpuTEodGS0joNb0JvX701e6DVecRBqhzik=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLn8MZgPfXtIzTahad3jneTgIaic/QOkZGyI
 SGVy3H/f3GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 cmoRD/0a+ixlOlllZnxdQ3IwiZjofhYGTNWzylVmVuilwkjx74Ac0WhwgNOgk5uCmmF2NGn47Lz
 E435pD4buRkFabuolt2o9TL8wMz/0RDBg32C9bjwz9fezuo6zTgzSwOjEh5cRd647C84rRl0KWc
 YHu+TOoz2o4uLlV75o3nQTqLM3l1jFVZ3+VSt31kn1Zavk6/31+PgUYiSjgTIsxlT/Gdps4VRtH
 wa/aiQgsQsiFHtCM7iv1U583mqmt1fyy3DcZukPCRuIyWOIBMDvi/gqk9leFU29A9h0srxVog+b
 2atd0fQ4ad1OubxK41SjP79dMWtYCixfFespdF2IrwaZrVN03CtyobPyUeIkzlYqy+j+XcVocDO
 NjjWKIYMEYJkruZsAOCp6RnA720dgwIaPMSHCb9EL/t1FuLODewQSnenP5FeWSZaiw/y0s0HNWE
 u5xsj/scBHbfLBGmsXxgSr7mOO9hzjyNxYki8z8+PdJQHiEWRq0F1D+FoXcIHUqQ4YrQK5Dawhw
 aQuOGjzWqV36vIoUCA26atb3hiQS/pIePKqxAtnWOg9w2ghzZB8deMzBPTGDg632LEnQYGzr5eV
 2jZt4jkSxcUYLzAs2RNnPoiDh546HzSIvkw36qrNT2LHX7VrBQPLJOJDSZX0Wb2L7MnN8xnEan/
 UkQWDDMnqWN8GnA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-amdisp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
index 9256ed67bb20e9eefef6c6574f1b60d71814cdc0..2e706bf8bcde0536b9e09614665d46130e12c406 100644
--- a/drivers/pinctrl/pinctrl-amdisp.c
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -117,7 +117,7 @@ static int amdisp_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(pin_reg & BIT(GPIO_CONTROL_PIN));
 }
 
-static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	unsigned long flags;
 	u32 pin_reg;
@@ -131,6 +131,8 @@ static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 		pin_reg &= ~BIT(GPIO_CONTROL_PIN);
 	writel(pin_reg, pctrl->gpiobase + gpio_offset[gpio]);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 static int amdisp_gpiochip_add(struct platform_device *pdev,
@@ -149,7 +151,7 @@ static int amdisp_gpiochip_add(struct platform_device *pdev,
 	gc->direction_input	= amdisp_gpio_direction_input;
 	gc->direction_output	= amdisp_gpio_direction_output;
 	gc->get			= amdisp_gpio_get;
-	gc->set			= amdisp_gpio_set;
+	gc->set_rv		= amdisp_gpio_set;
 	gc->base		= -1;
 	gc->ngpio		= ARRAY_SIZE(amdisp_range_pins);
 

-- 
2.48.1


