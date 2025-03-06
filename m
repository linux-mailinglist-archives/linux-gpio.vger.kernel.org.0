Return-Path: <linux-gpio+bounces-17171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEFEA552C7
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 18:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E97C7188BE8F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 17:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE9825C6FE;
	Thu,  6 Mar 2025 17:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gxnL4gqf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D424325A2AD
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281577; cv=none; b=f4Nc2ClAC0Xzse8MoXxkEhxzTlyQ1kUq8dgdmYAuhugy83PKlkmEWgsW+7GsysuW0Lk0FLdBo3VfrolbMwuaZfRU00+nBQH4qcl54DxoFbXDql1swIiZo5B19AU0fJc4+Zwha+vUUnBCtJrF/Y0fjX6co+Qk29cm8CPQzYmo46k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281577; c=relaxed/simple;
	bh=ixY4PejMMZtUA5hmuTM/167BABiTW7t/1/VLGcG4eog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXVQkj0Mw9lzuhLsStbSt8vh25igfA8SyPAkss658VXhUMhioLiY2s7deDMxhCqMiYsrTuB7etDIl/fcS83HYwwGb3f5CBUUTtjkfm4VQxRN92A4DsiV+zBiQm1MLk/w+Jldfj3Uk7pq94PxAUntWrQvK5Qchza1oS3d0b1DpKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gxnL4gqf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bd5644de8so11235515e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 09:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741281574; x=1741886374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx8yCwjlfJWbi+YkfKj0GwUL5v6roJxklVaUA6QCI24=;
        b=gxnL4gqfGgxJB+IIs6o8eAeoFfuyHepcht8O+S8wCqjjWO5qJ88qZhwZtrExzMBtI6
         xYEe1VIVXxqdiZUXREW+ovADMjemEqI138HVuT7RTMbvvqJ/sY4NduYErDZcGXJm5Vqw
         mBNyypy56CbXzwEWrC/ygI3wauUn0KZVAJGDRr+hQEB3BFfTAg/0VDSrm+wP8A77TFG5
         S01Kqt0ouseTHAn6lgfey7MWusmPzswdfM5NJ6iCaK3h6xyxNXAAFVS0sYDNlUoIMJ5P
         EWi/e++1P4h+2LY7wTfatsybO8okmr4lsgV5ttxMvr15YW1g2jjjtAiMS9hwgGTP2h5y
         JE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281574; x=1741886374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx8yCwjlfJWbi+YkfKj0GwUL5v6roJxklVaUA6QCI24=;
        b=FN58An60+PfH13Lx0R5SUuQ66HBBq0ypRChBrTOge2LeCLWJQA6Md4cKOGJMiLa54z
         FkhfIe8brIAtFKC3nuFratl79v3dclt2aWY2YyTKeIff8+tUHo4RSU30K4jQuvosM+mL
         3MXMzdEFm0y2sjpoQCtheiL5bVLuI4A4xdxnoDXmg7olEFT2yQ/zk1ZkdNi7M9JxgQVe
         CuZ0vmfy0imD1RLSb+860BnD8fr3mNnWo7/c8fotpQeFvjoqiZx8jSU7dcJ1VNXNYuKR
         OTdQ0zOa9b4l6HwCiGZZa8S7nFmGuLSQ8BOhfn2NWnXqLvUKVOwrvtB9WiSM3eWOgtHI
         GEeg==
X-Gm-Message-State: AOJu0YzzEg/cNe4y+hsg0WhQQgU/vpQ1AciFe9s0/JLaI2mbCQDLgsHR
	ay6YKgxEjosONtd7s8VmOP3C5FDWKgXzoCHg2LzIaE6aXLaKalisIaf6n9XcLqM=
X-Gm-Gg: ASbGncvzRdSWv3IBJXk6NVI80w+urf/z2xyQCOkAg5avSJhJoF15+h5KRxqOIghHqEG
	XxKK71nQ+oEjaDjNje40HOiRPc08eaYtnT8OoykojT155v7sPYZd7OeQ1YNtZaugHwlfBVWsfus
	khvRM5JOkQ7LdDY+avoiW2CgbvaNWhPU9JJoFiFtLRm3TRR+FF+vqGh9iNB6Arh4pdITJ2ddP+K
	ZFDDkf/okYytV9/jdFIb7PsYCTUTeyoYe5R/uJJRIFeFWAH9wO9l47Kgb9Qt//Cdtm7fSFdF+L+
	VFd+UqsG+r5MgqeEvHlJLh4TdQYEewt/YLn6
X-Google-Smtp-Source: AGHT+IGUPWY6AN9BFXit551FZKWsIAZ+W1o4+07loxl75Vilx4Zyvot1xJAS79uyhHb2ydaHYZKtvQ==
X-Received: by 2002:a5d:6d0f:0:b0:391:2f2f:828 with SMTP id ffacd0b85a97d-3912f2f0b6bmr2599336f8f.29.1741281574064;
        Thu, 06 Mar 2025 09:19:34 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ce13:b3e4:d0d:c6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426c33asm57673915e9.3.2025.03.06.09.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:19:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Mar 2025 18:19:27 +0100
Subject: [PATCH v2 2/2] gpio: adnp: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-gpiochip-set-conversion-v2-2-a76e72e21425@linaro.org>
References: <20250306-gpiochip-set-conversion-v2-0-a76e72e21425@linaro.org>
In-Reply-To: <20250306-gpiochip-set-conversion-v2-0-a76e72e21425@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5d9kkXzwjjh7zWJs4AQdNmAVBZkHMbb+pdJCg/YbIuk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnydkkiaradFFrcYMqrDRBjVQt0XqBEA9inh0cF
 anmiHFbBK+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8nZJAAKCRARpy6gFHHX
 cofrD/0Tb1kJm8Z4kVxN6t7DWZ/vY4Hj0HHgK2/F+RF3fre5kkW/vn7CdJSGRVGg0qhGV7AuIVy
 5lCT5eJDUGsee8e0S3v9BcaGwE6NBufRo3HceqHhhhh0f6u2Z2x2CPZFhNjcRozM0M1UNt5132M
 1999BniBLN9kIWw4i31nzEbQ/4Z1SsJgrE8Wva9SI/GAmxDCI7Ker8E4VXTJVNDsInWvhpmG5bV
 nKxvpsDoOanvLJiIh6hRb40uQPuPIL5MENDysl1Gfu7hHjQ+sqMXLFsIV/4KTj0an+sDMP1VXcx
 aTQl/9HLexVTUlla9dHKFx9834h7c63fRmDrMJkhTQdvL4Ov7mrhYGuh9TspnJ6Jo6ZtqDuWHUT
 khZgRCLqXb7Is0F/s9OLLkg8AC1sdJZYnOtMU9XvVBXyD0pla0tS6OT8Uk2gpktEjYO9pOgMzgT
 ACeeR3wZmLX2AzSlSuyKK0s+gqPCYsYcNmXDgx1XhI++jfCqfuAmsQWlE/xxauH0WSxMyPJft5z
 q+pGXszxwuQdPVUfvQqrth7OqVDBC87KMwGGD3gXWngwRyPGrGJRRO27tdJyALM75KQxUbFVDyz
 eapGd5k7BV2kQNXMjXXKEr+xSrOZ5wUAZbyxFi6LiMe0uRLX1fIJ9i+6Y8hOkLG/ci08PfFbpZP
 iQMwLYBBHP8Yq+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-adnp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 1a282cba8489..df2710fa2a1a 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -79,7 +79,7 @@ static int adnp_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (value & BIT(pos)) ? 1 : 0;
 }
 
-static void __adnp_gpio_set(struct adnp *adnp, unsigned offset, int value)
+static int __adnp_gpio_set(struct adnp *adnp, unsigned int offset, int value)
 {
 	unsigned int reg = offset >> adnp->reg_shift;
 	unsigned int pos = offset & 7;
@@ -88,23 +88,23 @@ static void __adnp_gpio_set(struct adnp *adnp, unsigned offset, int value)
 
 	err = adnp_read(adnp, GPIO_PLR(adnp) + reg, &val);
 	if (err < 0)
-		return;
+		return err;
 
 	if (value)
 		val |= BIT(pos);
 	else
 		val &= ~BIT(pos);
 
-	adnp_write(adnp, GPIO_PLR(adnp) + reg, val);
+	return adnp_write(adnp, GPIO_PLR(adnp) + reg, val);
 }
 
-static void adnp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int adnp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct adnp *adnp = gpiochip_get_data(chip);
 
 	guard(mutex)(&adnp->i2c_lock);
 
-	__adnp_gpio_set(adnp, offset, value);
+	return __adnp_gpio_set(adnp, offset, value);
 }
 
 static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -429,7 +429,7 @@ static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios,
 	chip->direction_input = adnp_gpio_direction_input;
 	chip->direction_output = adnp_gpio_direction_output;
 	chip->get = adnp_gpio_get;
-	chip->set = adnp_gpio_set;
+	chip->set_rv = adnp_gpio_set;
 	chip->can_sleep = true;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))

-- 
2.45.2


