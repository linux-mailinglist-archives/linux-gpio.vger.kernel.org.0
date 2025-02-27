Return-Path: <linux-gpio+bounces-16672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F7A47782
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F5F3AA2B5
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 08:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AA421B9FF;
	Thu, 27 Feb 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcZpFac2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B9129A78
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740644247; cv=none; b=nPeiVADVIXiHVbj1YoHzgTL8Avd/ggvpHL31jH219HBprmX/QxJoNxUcWaG8HR2w4cOV+VjJ+mVjBEukKbPus/zxS8YRoL6+YQMqtFPg1dCOCcqDyVuNAGdBmtVFue0eHPHM/oXYD3OLyzHgQd2w4AVCb2ds/eJwQWafueQVNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740644247; c=relaxed/simple;
	bh=HUyNiTnU+aOLznnW1m5zi/UsNeJTOoxstXeUp0gGLAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSS1TJuHuvW6wPdtWluFv+UWbwVtyoDuMhISXeBQN2+ksBrIyvD6IHa20aJRtpImeden+wPbm5A1gj+oUyO1lmR2vh7TUE/i75OVISvjP789RyZpW/R34Tu8xXgqm0dhBvRIF74V96x5iXtd6NRCvGDYxKAcwhoLLKBQXGxtgJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcZpFac2; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so968740a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740644243; x=1741249043; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m83FfewmrcIOWT4jSZsPTdpYjRVnsXVlTkxFr7lMkMw=;
        b=gcZpFac2mBRYJwPOBxppBLyuJjhrXtCrdPelDZTJjGDvOsHlH8Sg/ntcvyTJJHm22U
         syCep4pFQOMh5J45+L5QztpU2gT2C9jZ591qHymtIAc50US7xutGGk33FjoSgVZM/Z+t
         ZfrDydo9LGP5Gdz6mZFyeV7zr6D+15C6tgmxAbxg12q8gfrfUY3thp2Qzks2MgfYB9Om
         HiXEhPxu+iZgUCeEY92CM/muKEX9qhQLaJoyknw3TxV3O34gnSxqaiom/rry+lp6pYFV
         RMFMplno8x9g/XEMuZYgMsKO02h/Alti1XMVXq5e/b5wLuwLI8tqlXT3SvirrSJE2YRk
         dBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740644243; x=1741249043;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m83FfewmrcIOWT4jSZsPTdpYjRVnsXVlTkxFr7lMkMw=;
        b=PxnJgVzQcvYHXXAkA9tXTEeLtG2mXPJz0av3E3ks3/NswxCcBlbAgeCXQg23xFAwEd
         4GBO0YOakH96JM9+pyaM+gu2HO7qD1RxC501lgE5O/ZCy1YCeA9Qh3Gx+oaxkuKdaU/M
         PRSqNe0RlmcZGpqW6EFqqXh8hKiYoC+cJWgCDG+xmWc4Q2YMCsSOgv7aEmI2nGgXEddE
         Es6QPHle9JxWYRagUwi++k6NyUmMl7bmNLNENZ4ByUbUMjyA+a8BD8pDqGZtXk1ssrpW
         VggATASk9/txbOXHm1k/bhUPeoR/opEcy6JLsl1oJV8d+iSovPHoKmaaL8bm8bePl0/U
         HvYA==
X-Forwarded-Encrypted: i=1; AJvYcCXcLvIKIB4Ti71KpdHUZD61UVSnG/IYkwUTVACIVVS3LSZSfg+jQzQyJshm9ZtGs04V+c9tQKM8uuUy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsfn3aOn0NH5UaBqqIO9T6XSE5oRtHDFvrrYac3mBL8Q0y+8yE
	G56XCzaBxrUwif7KVxM1Zl6T0Y83B9r/QgQYMZfJVzU5MeH4Z2yYgjdCz2vstq8=
X-Gm-Gg: ASbGncvV/6al12XhlSy5huOKttFvaS3Te+KajyDUys3hiDkF2J0tiC0PDunQ21h1Tz/
	IfPnSdLq7qumaqeVaGZgtKDCplH3+orU6H0eC34eiKWu8i3W8f+B2HEdMYpcaTiR7Z2nYK6nREv
	N2n0PnbEzSdq4bNUhrHbDLiAP9yOytqzp+ed6sdaHaVf/+WBQd0UdIgKBj/sd6S1t0fnV2uftqN
	c0uH+XJ9cC6zyo6cbj20fq730KwRrVHFEX93SXyUhiNQlXyage8okxbSmysuFmSgdfbGgL+IG1i
	NO/tiwCcsttFHdHxNYcogQ2onHd5R3M=
X-Google-Smtp-Source: AGHT+IEbSrUluaN/703N3zoDpsqy6bXDIk3HAXQAYyzGSL1JmFS4898+4YMi9izrmbhfSu0hCLM0BA==
X-Received: by 2002:a05:6402:5285:b0:5e4:97bc:6577 with SMTP id 4fb4d7f45d1cf-5e497bc65dbmr10126655a12.20.1740644243331;
        Thu, 27 Feb 2025 00:17:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c3fb4384sm740341a12.49.2025.02.27.00.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:17:22 -0800 (PST)
Date: Thu, 27 Feb 2025 11:17:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] [PATCH] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
Message-ID: <0f3ea3f6-8ae3-4352-b790-de0642edc4a2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The gpiod_direction_input_nonotify() function is supposed to return zero
if the direction for the pin is input.  But instead it accidentally
returns GPIO_LINE_DIRECTION_IN (1) which will be cast into an ERR_PTR()
in gpiochip_request_own_desc().  The callers dereference it and it leads
to a crash.

I changed gpiod_direction_output_raw_commit() just for consistency but
returning GPIO_LINE_DIRECTION_OUT (0) is fine.

Cc: stable@vger.kernel.org
Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpiolib.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8678a6c82ea..d41812468e1c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2804,11 +2804,13 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 		ret = gpiochip_direction_input(guard.gc,
 					       gpio_chip_hwgpio(desc));
 	} else if (guard.gc->get_direction) {
-		ret = gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
-		if (ret < 0)
-			return ret;
+		int dir;
+
+		dir = gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
+		if (dir < 0)
+			return dir;
 
-		if (ret != GPIO_LINE_DIRECTION_IN) {
+		if (dir != GPIO_LINE_DIRECTION_IN) {
 			gpiod_warn(desc,
 				   "%s: missing direction_input() operation and line is output\n",
 				    __func__);
@@ -2851,12 +2853,14 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction) {
-			ret = gpiochip_get_direction(guard.gc,
+			int dir;
+
+			dir = gpiochip_get_direction(guard.gc,
 						     gpio_chip_hwgpio(desc));
-			if (ret < 0)
-				return ret;
+			if (dir < 0)
+				return dir;
 
-			if (ret != GPIO_LINE_DIRECTION_OUT) {
+			if (dir != GPIO_LINE_DIRECTION_OUT) {
 				gpiod_warn(desc,
 					   "%s: missing direction_output() operation\n",
 					   __func__);
-- 
2.47.2


