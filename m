Return-Path: <linux-gpio+bounces-19298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A6A9C2BD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FF321BC02AF
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26A0208997;
	Fri, 25 Apr 2025 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZZK9c1k2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70F23AE66
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571670; cv=none; b=kBDcPYpAvy6cJQoJKBkH2j1q8n9Cy8YBJ6j30jahxXGuPCUE6XqqimIeFHQy/YaGnRdCuk+v+E5+P8hueCzNH7cD7jc7dIn0MNGkYn/uXWxxyg8FQVfOCJnS92FBMQ0IqsEkj7ckmlZJqZQpfNxR080u/Riw5jhnzWEf/lAk9i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571670; c=relaxed/simple;
	bh=Lg7SIXa0ie0LybxnwabcVg+h7GXu/NKorvK1sVySxcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnfqamFcdjSDSLyhV/ZMd73S0uz6YOhgWczgjNkLrFiBEQ7hwrPPXhGG8FIVmkM0BPPZtpzm27XidcD2NepmBvwGyDwmID0SZ8kIGtY8JrYCIFK8We8E9UzzsLOJW0rYoabk64X87PVIm9dvvRPgexF1bWElzcux0sM1+OAvdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZZK9c1k2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso1257993f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571667; x=1746176467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZB90erWf+Gm+Y0GtLErqGxR/pE5/v4Z/PlOKc5IF8Kc=;
        b=ZZK9c1k2GpIRHpaiYjHGfTkfd1bluAxmhM0YKsfWg6lFA7aG1w2lznLj5CSIpLodCY
         A0K0dvRJ8L4X70n0V/+YrMw3nN4Af9OZnvVRECkuQLEX5KSjtfl+Omu9pcxM2OPZ039S
         /upDGy8jEQeuMqXT4WSxeH+ofguqk8T8/Tf0wIfUda3Lh+6+xJoEnoCP6Ksta6gP47We
         JjtAQBwY6ByTyxtVAguQ6Tz349UAT3QwpsyQEyZKk1nkbgtDmMOk0HxkUS7KLE9NCyGK
         u72uJb4cmvWeaTWI3qUzlDG1uIFPGF+BnICzPykMQL+VhmruGFXyEfKBOfo/BXDeIIbL
         SrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571667; x=1746176467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZB90erWf+Gm+Y0GtLErqGxR/pE5/v4Z/PlOKc5IF8Kc=;
        b=V3U10bcdxAHkS1czxiEY9Zu5FwIgUJKAg4v5P+5bOs3BthXGOQwoRhWBQmicbFatAf
         EEycjLQwf49XtFiUbv8aVEspj7kej947pM9I8bD2nCoPThoVkEtB15FPE1VuJaZb1xQr
         GnMGe3t3KXMVXQFSoLj/V9D0DR+5y1Pcew8jCoOyJS8sXnC2f4frJ4Tj/AYXFzKRCbgH
         H70JJOhVj8Rg7+UCWDvyJKP7Gk+RDuQAgGJfOceZpO4hFMv76mxCr9M2tXB3GnHfwphs
         vk7IH0YiOBjJt5wBDKY3gi9pJmg4Q+TuLXsslU1YRQ84ctorVn3viz3bNajVfWCj8eRx
         Lidg==
X-Forwarded-Encrypted: i=1; AJvYcCVu7O251JEQyCFs3ABBOw2CLHpnImabog8yJeB2Bi9X5e3NLHob4WzU3LjUsuGGQieb2i+R1pcHBKFH@vger.kernel.org
X-Gm-Message-State: AOJu0YzHM3N2qQ7TUNjKpIg0vsEWmkZgI6SedjWBoW7q2N4KwPmR0/gi
	u5thlZ9bjbLy2NAkHjx80RqNlIIF6zfOLxjuapBR31DMmizu3wti//ic+myK0Sk=
X-Gm-Gg: ASbGncupYnpyojLjWlhT7C5VcjuHrD25wCc21xZ8dBHeZLxFQNafbQ/oVHUYxN5GbBR
	HSX5M26dZusTBPPPHAP52+7afE8ikHvU0f/DEn9w6BLFX4gB0ihzA+rOk6PNZDin+NPEhOH6LJO
	8u/uCkrTAEGW509r1krbCgWWJx5KIQ78V2WNGLjY36pdzky2aYebeysLHdGJ5DH4jOpmtQGUen1
	fR6tRKb2vrghxMMHZ7dK2Ac7I/ocfDVWQ0UfM47rYtai3rMO71XzUTgoQs12yfQZTRw6YpNHcNX
	NKMVs6H+0a10NWlbsjQhrcP4/UUnRBzn1Q==
X-Google-Smtp-Source: AGHT+IF0m8rX5UMES4nVD0erCZ4KstVSP6VZhmeff7Jfr6OuosoVYyYD4igGlIuV4D5i2BVa1x4EkQ==
X-Received: by 2002:a05:6000:1a88:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-3a074faf4b3mr1205781f8f.56.1745571666825;
        Fri, 25 Apr 2025 02:01:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:57 +0200
Subject: [PATCH 1/5] pinctrl: mediatek: airoha: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-1-93e6a01855e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uaHOfJ94TFx8k9XlThx6lSkpYsN9+1e6SW0WrRZmuoc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Pjw/np8UeS1ttDZIlSftl0HIaXAVQAcTl+
 qHDg6ttNnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPTwAKCRARpy6gFHHX
 chLhD/429DgRXwmTcgjG7Djz7jHNaXG0YDQCs3in+FxM1KrmgZ7nENGsnYdogEPNSvdYBfsUhwf
 JSQNi2Z47oZ0and5Yvmmv3FnmvnBUpbtPa4O++YpL8TVUq7teVZIBYCPkxG6uWpbX339RqRVb4Z
 Eu9FEoXAE5JRDGSRUmJDfaRHGeGq4apiYTNBsQpo9cnQN5L4m9pDIlRoM7+e2tYyrEzG6/v8egd
 OSP1y6+t9WuoDPeH25a1e9Ta1ehj2ViYsD9E4pQE7gM7EPm0OsJqxT007wmerUBuqvCq4rTncQ2
 0EQP7ORGcUfUsLT5R/cBcIYlUFbhziuNBpeBaKginbJoYLu8wfb+ospruKX203GPKzCFPtSSRQj
 9TyWwf1wV+kQYa/OkcDoCC9ScRxvDE6V7FTE4KzW54hNfzl46gZK8JoJKj1+7yQQgjVnY4AqENs
 Pt5WUaDQWxdfQotValBICHCN1jMnaWl4dDMso+xs72ErbEvVrbB5xIWWPoFuBGdazfWDfMDjyaI
 teZVW4YCDH9O2N30eJRp9/ON2MYaliiSvfVZDr6YcXTCzcmsLIIgKqrvexUxntmwoYebcguTINs
 SGM+230tfxLUtpfvpwqrxYPrpsv28wSCb1BlDuLaLdh+bHvGajSdqgZlxAAN8qwALpRkoR4o/K8
 rSv4Yz4yX+so0eQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5d84a778683d..b97b28ebb37a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2247,15 +2247,16 @@ static int airoha_convert_pin_to_reg_offset(struct pinctrl_dev *pctrl_dev,
 }
 
 /* gpio callbacks */
-static void airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
-			    int value)
+static int airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			   int value)
 {
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
 	u32 offset = gpio % AIROHA_PIN_BANK_SIZE;
 	u8 index = gpio / AIROHA_PIN_BANK_SIZE;
 
-	regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.data[index],
-			   BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(pinctrl->regmap,
+				  pinctrl->gpiochip.data[index],
+				  BIT(offset), value ? BIT(offset) : 0);
 }
 
 static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
@@ -2280,9 +2281,7 @@ static int airoha_gpio_direction_output(struct gpio_chip *chip,
 	if (err)
 		return err;
 
-	airoha_gpio_set(chip, gpio, value);
-
-	return 0;
+	return airoha_gpio_set(chip, gpio, value);
 }
 
 /* irq callbacks */
@@ -2419,7 +2418,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->free = gpiochip_generic_free;
 	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
-	gc->set = airoha_gpio_set;
+	gc->set_rv = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
 	gc->ngpio = AIROHA_NUM_PINS;
@@ -2715,9 +2714,7 @@ static int airoha_pinconf_set_pin_value(struct pinctrl_dev *pctrl_dev,
 	if (pin < 0)
 		return pin;
 
-	airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
-
-	return 0;
+	return airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
 }
 
 static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,

-- 
2.45.2


