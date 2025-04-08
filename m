Return-Path: <linux-gpio+bounces-18441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF20DA7F680
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63149171C74
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108B026463C;
	Tue,  8 Apr 2025 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DxPvCY+z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3209326460E
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097798; cv=none; b=UTSmfHd8PzihYo1/kagkakUIa5evY9F+SX2qvUjDCBGHbUqr6rxmIrcQ0Pakp3wnX90lOqIgaed6ZFEL1+E8jTr2CoKpEl2Ggfm5eXMhpOXjNcsUB+oM4XF5A6lR+8zEX0awpjwfEgl0vunEnAyLZxhl4csxjt/13KgGK9UB0Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097798; c=relaxed/simple;
	bh=05zU1Ccr9yOLMj2iUNDMrlJo9Ujt7vNHa1DQZ+YdkO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nEHtgNaXDIUXQnfpcN68nAvoMpPQLrngFifdPSWEsz0vstnsvidfAzvhn5xS9RolbQOSmf9QIaFG/lhxiicFYvV2gBdHR9lG/TEXt0qqR/9YlMR2bbZHa6MMjnfNUmrcSVcaA2O783zH7N1ExkplwOpC0V0RerHsRd6yBymhNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DxPvCY+z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso32768065e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097795; x=1744702595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kM096SgLF/xDM5ehediIIVzZvU9OMbppluTe8DVRK4k=;
        b=DxPvCY+zw82SJfXyxD4GU16qqay1Rp68SQB3hNSfawfTNfyIPntS3hlb70HXYGpf/K
         ykQJRNHjdQBeGVXH+ptB/k/wOnmqCR/9bSh9zEDFDI3u3cJ7mmCZ6G9WLOiiE30JFODl
         8aY1Lxf61BgxGz7/j5gs0r3ALJ0F6HifnXCsVzdJ9OUNya9fxjP9DZvbck4AV5rHJTOn
         oSCVf288LJWpF/x+vs1OALsvZTj/euVg8iS50abvnVUfHTDNVcIo0s9P08UlMb3MofiC
         fITX1TRo8UNI5Z0iHM+6PFmxyrdc9YqN4xi97WvUsKZkkqwCsJs3a7azsyLYWrpZfSh9
         0RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097795; x=1744702595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM096SgLF/xDM5ehediIIVzZvU9OMbppluTe8DVRK4k=;
        b=UPBoYJqh9Pqkv6AAavoxYWXzFl/Cj2RNE2+AKIGaUy/mnv/H3yOT72Gk2g/BYN1mpa
         4B/tNJJyxUktEyD0XHlWIhP1+sGQvcK9GJXU5UvvpbNhYA40Rp9/9ytVz0SbZ1VnQYiK
         JHFO7XDBgFHkHUBZKUk2cBmRgnmNVJqSvt5Q6WTw8xcFVKO3Ux99z10rHv7qR2TClUqc
         RGEDkYpKp3yrF5wCDc4xXGIeFo+okH3zD5/to3iNCmDzQUylQT999aRQsikZbz7jrW3h
         SSTGP+HyvK9qEPHzoYa5VFI7BHiVmlp0eDOo3/Bv0S9EFzaKXSW71FUNcSju2fpohTPM
         FOzg==
X-Forwarded-Encrypted: i=1; AJvYcCVkgdGhinkKxetSKH9BZ6yeJRt1oHkoSdaUFhFdxvBR2DfSRKnivb8xeSWgKTZIBmYHq+Ejtg+VTSS9@vger.kernel.org
X-Gm-Message-State: AOJu0YzbVlXLgG0Vnxi2rVb9KDn8yWWQSEwP9SbXoZIrLI1/CmRNjU7e
	TIH3+umVxGcUUV4B0m0WixkHbuOTHs9/xj2BjHS97vo8kk6dDDrp1NOWoy8cNOc=
X-Gm-Gg: ASbGnctmvIhyOWSB0f1+eUiu+3kK9yjw8KwBqSreOZA3QTnwbNLsoiNP1AykeWgYBoj
	ndVKyfsARB3FZckGBtWW+dGBGulL6Q3P7AHJkojDAfF9a40+wOOvHVixnwaf7UzGUPLDnHA8Qoy
	XPaHCRGtMAyOsB2+505je2sjcEu/UhLO9U/Q6iFbgXjlutMNfs6bq5QITUpHSSBHfCh3v4F0jub
	Tip7Sj2uA+XQqSpadpkuw6PhllSmLObO5IQj7H+PZq1B7XbhDowura6+Xo5T4mvRLgidpMEWy6K
	x2bl3xh63vGF2FiIgu6QQOaI+M/1aVl9O2JPPQ==
X-Google-Smtp-Source: AGHT+IGqAZNwvkkT66aidmtMFAuZ998J7V83w2RRytOg8jUYiK+eL0Qx5YxjhhMuBaNCr8BVDL2iRg==
X-Received: by 2002:a05:600c:6a8e:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-43f0e4169ecmr17353035e9.0.1744097795460;
        Tue, 08 Apr 2025 00:36:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm14287627f8f.61.2025.04.08.00.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:36:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:36:31 +0200
Subject: [PATCH 4/4] regulator: rpi-panel-attiny: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-regulator-v1-4-a18b6154b31a@linaro.org>
References: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tGoxqy++nkqQRXjGhwwXyr6+v2LydOiiKnIqwmxDNvw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NH9ULUrSeUEZg78nVRcumLJX94S2Ad77IrOO
 t0AeKHmR1OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TR/QAKCRARpy6gFHHX
 cjziD/wNd0mAvA0YYUakqeiIb5oRbeS/vBhhpnkYDPNtzT/+nGw7l1BWGaMFfhRiRas8BwKvLuv
 n99DWRXcxYdY7NGxE7+4mXz4URzMgHztn0FHb9G4Gedhl6tj3jo0bO8FBAXdfvDKsiXEfC5HFU2
 yVhAHKQAEABPwuFnhLIVKREohBTkLskPsoZUrT8Vq014TT1TYpAE5qn2N3q6JdTFS0z5qtVRzTE
 yFftUUlpiH2Dl36GbTtvoJoCWg6QRMxC52KT42nL+7FV2SufUr0ouTZvNBwIwMG15JJN1yYn0Mp
 YQzSBTiRpmzew/SR4xbvp6vxMsKQtMpyRKOEhRQCNqPNGMZygBftmKJCfZYVQapED+keq2eSf7d
 lMWMzDAia+/CYAOeyRH6d0L8yxNzSt/Hj0DBdLPlgQa7h+qMhBHkQapEEZTnVXkQRuTZpACA1ON
 WFhdXL5acJaqjYqMdg7wENAbQrXG7hXdfCOcgXtLPaMc/8R4goa/9ZK2y8Hbgo/5xk9hHM9Nu/W
 8IPnlOH+52WE/ctkRfIYMqxynqm7pScYKX2YRO3I5urf08n7AfUYPzzdu2oHVkj1ROUxhMfLtE7
 Hbg+JkkNoGVEPtcpnMSUP7TiMrlBk/0V0Tg4kJxSA0Eiu/hVB4J+Hn2g9RSWF7lHpe3OyKgp8fz
 2vWBI/S9O9bMJWw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index 43a7c4737cb4..58dbf8bffa5d 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -205,7 +205,7 @@ static int attiny_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
+static int attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
 {
 	struct attiny_lcd *state = gpiochip_get_data(gc);
 	u8 last_val;
@@ -232,6 +232,8 @@ static void attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
 
 		msleep(100);
 	}
+
+	return 0;
 }
 
 static int attiny_i2c_read(struct i2c_client *client, u8 reg, unsigned int *buf)
@@ -349,7 +351,7 @@ static int attiny_i2c_probe(struct i2c_client *i2c)
 	state->gc.base = -1;
 	state->gc.ngpio = NUM_GPIO;
 
-	state->gc.set = attiny_gpio_set;
+	state->gc.set_rv = attiny_gpio_set;
 	state->gc.get_direction = attiny_gpio_get_direction;
 	state->gc.can_sleep = true;
 

-- 
2.45.2


