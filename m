Return-Path: <linux-gpio+bounces-15653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E33A2EA12
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EF04188BC6A
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0239C1E5734;
	Mon, 10 Feb 2025 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nyFzsGLg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA21E47D9
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184739; cv=none; b=V14E3Ws+OwOus+CUsHnG1iY8WU+7Hn31gT6iFdVfpUNvJoDcwO9Vfi2up+5IXciXWEeg1xbKXC0BjqFbznGhgX8g1vR3x/wULvWqKoSGzWKDS1HG1wmF/3bQQOsuWbNzBQUvYJ8bds5yrgWQ4BuKJv6SuViBFJicEogwVQAVBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184739; c=relaxed/simple;
	bh=COgSGy9olGzNPwhRD7Ivun1jBH1Om1X5+XQKQJmEmoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUXa/THukXp0PcpyooDxC54uOuxQrEZpjXdFPjtBCXPO5e3j0N7F3Q1ffNQMnRDdYAa1LSSUcGQKzeDTngBnXUvmTkvBO3mmAlLhrBENYfsJ4+qbH8hXFPJivSWwFQygwpLjHMqfpBOA0NqvAuEK9Kkex79ZKq0MXuNrQjSG5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nyFzsGLg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so28122755e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184734; x=1739789534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0/sW6H/bmkXZigeRuuijEq0ngfaHSABgKK2stXVqho=;
        b=nyFzsGLgxQUyQzDJczAhpuVG7WCRyJpZOAsMUI4pMHFD1cUuabUett+RWYwqQ/Mdzq
         iHjfXwISkAAPIMCqiHZOlcoc46erkE6/yfcjyVqhNl/PKaC7dfI9wze/xc+/IpdvaTsd
         Bn4nw0j0DeIedCW4JgH+Go03yCgdCeEMXKpN4q70Ld5gQLdE54/rfCxKK7+aMAY8l6aW
         eYD/qo3LD3c0QnNyoLmeHt9SzYUwmsgCrm2DRavzCho/i5LhumLnnghVlX8XMsC/MXsq
         FXKVYP6HNdHIAfXxNPTxyWRaRZamSrLQEROre9kwJ0eVNeBqNGeVnsGFHk32fjUHVBZM
         SsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184734; x=1739789534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0/sW6H/bmkXZigeRuuijEq0ngfaHSABgKK2stXVqho=;
        b=YTvZanEupasW/ANV8nCgArV5/02XA5X8Y8nU0D5eCM0YOk6i1B3w718uILCVN6st/q
         O73277VQt/ErLbk3RDVYgpxKTI/JF8NKDjxIojAX3Xz0PiAk/Twb8JVlbzFksihmopkW
         TD7iyYpMlGQ1s1XgKM7NOQc7yw0pD1PEmdpBowoptEzlm+eOWTCXgJcuDqMM6BntfkUY
         H96GzM+SPGdCq/zbxIWR37v/tzlEHlhO6i4wf7RYD/j8DDaP4YZ4iYEaY+4zYymEMTFk
         HFux9c08Y9ZqojqwFxB2gd/wOyXcu8WbLPlFACPxXp7n69EgRXunHBvI++Rp14wcWGEa
         Up5Q==
X-Gm-Message-State: AOJu0YxcHtcf0p0C31yNhpqRcPjXWUpbAkc2ZTwFOZwAIUYJETIrrWWS
	/USju1Rkv6cEwS3DwUYxb6JeCS1P6c7odH6xNXmP2yFCkksyb9Tj7CceLudaAB6clk4KOMZj3lL
	ZiNQ=
X-Gm-Gg: ASbGnctX8g00IOmWuCCcz0lJxHqOFHOZuc0O3bZ4b8TCYmsLlkA3/tp5Wk+bd+gpUOF
	RtdG+iui/uujyHf0WJGkZ+m4Oy3pEKFbTigf0r6B7UoZls+PDxiYOSPmZc9ixglTPvj2qHXSJxT
	0zORxEOnSINOn2/T4EAfZl2HvY0wEWGnrlw4Xon5ASF5dMi0KV+T2FbMPOxFEI1OYF/+mjweXbU
	Qs6L/+YVnvhhIBiU17XKVKl3mWRiMrXmYKNfmKRYreH9juJTjZgTtPfqiuSS1FSACp0LexqRUKE
	Py5nZDQv
X-Google-Smtp-Source: AGHT+IFBMafOIJZOhE6ova2QrfOmITLX2hGvdoIMAqytoVBhRb0mjwMuLoWCZbIRz9oCE1M0IxfgHA==
X-Received: by 2002:a05:600c:4f90:b0:434:fd01:2e5f with SMTP id 5b1f17b1804b1-439249b2a77mr113896705e9.29.1739184734552;
        Mon, 10 Feb 2025 02:52:14 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:52:02 +0100
Subject: [PATCH 8/8] gpiolib: sanitize the return value of
 gpio_chip::get_direction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-8-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=odzeSyQqR+d/IE3LqbI4s+DJaeStILeldUjQZftzBGo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpTAseynSVPGOyZXsIdGv+COuC2m4YKbY4VO
 v6aBvQju4CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUwAKCRARpy6gFHHX
 cpIWD/9OFLX/Q3ohOtl8qp/j4xwAioTU/BcpGSOdamRbQPOjdB6zN5ZxNVr1WxMwn7lKbR7Sfv5
 8oL7kx9oADBDK5Uv4i1b/JMYOqJqhWHa6wKjyYmIQiN8fmLrqViQXDVX5uxBASVRI31AlosbPyr
 s5wKhIc3HJKVgweR+nEilBYPLEVozG/EMl/DfQ+9oXZMzzDuTObO/2R/XntJWTJktl+A8AUo0M7
 mh7rQOd2QhBCRV6rPGzcZD0oL7qtLTttzTH6u8i8cb0sW3QlQk+NyWqijkC0nKcrcXe0BzDI6Lr
 vPYyTsm0a/spZ4M1v/kTWgaYlGlAlTI0nVUpUzfCyQJ9Ct34BweM7gejjnqnWn+54NXh4MLAJsy
 A81zsE4XL7g7799J3Jlyahr5VhMALAgHZeG889f9HO5A+jhIKURQKcf+qnYcvPRxvs3tbh5c/Lp
 KuKy5HNOpPOzsX+n4Ai0wJUuXWRykiYKFWutj4NvlYdeU3pDqvASfqdeyTbZY/csTVt69nfgwlD
 A5HedZXqLIb941ECLj6oX4zoM05l6qsMIuJh0XkqEb47/wBq1YUsBWBm4d9t2+7eKwBDG4GKeoc
 aZj9krEwHJYCngnBWLnWiFm+VXstyosJUyaEmaw5NMZKBNHOobckgvX+TR5n16jywUIDvIoOy1q
 2C0HJ6+h0+BXYkQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As per the API contract, the get_direction() callback can only
return 0, 1 or a negative error number. Add a wrapper around the callback
calls that filters out anything else.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 683a03d237c0..7f2aca9f81a1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -341,6 +341,22 @@ static int gpiochip_find_base_unlocked(u16 ngpio)
 	}
 }
 
+static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	int ret;
+
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
+	if (WARN_ON(!gc->get_direction))
+		return -EOPNOTSUPP;
+
+	ret = gc->get_direction(gc, offset);
+	if (ret > 1)
+		ret = -EBADE;
+
+	return ret;
+}
+
 /**
  * gpiod_get_direction - return the current direction of a GPIO
  * @desc:	GPIO to get the direction of
@@ -381,7 +397,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (!guard.gc->get_direction)
 		return -ENOTSUPP;
 
-	ret = guard.gc->get_direction(guard.gc, offset);
+	ret = gpiochip_get_direction(guard.gc, offset);
 	if (ret < 0)
 		return ret;
 
@@ -1057,7 +1073,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		desc->gdev = gdev;
 
 		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
-			ret = gc->get_direction(gc, desc_index);
+			ret = gpiochip_get_direction(gc, desc_index);
 			if (ret < 0)
 				goto err_cleanup_desc_srcu;
 
@@ -2770,8 +2786,7 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 		ret = gpiochip_direction_input(guard.gc,
 					       gpio_chip_hwgpio(desc));
 	} else if (guard.gc->get_direction) {
-		ret = guard.gc->get_direction(guard.gc,
-					      gpio_chip_hwgpio(desc));
+		ret = gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
 		if (ret < 0)
 			return ret;
 
@@ -2818,8 +2833,8 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction) {
-			ret = guard.gc->get_direction(guard.gc,
-						      gpio_chip_hwgpio(desc));
+			ret = gpiochip_get_direction(guard.gc,
+						     gpio_chip_hwgpio(desc));
 			if (ret < 0)
 				return ret;
 

-- 
2.45.2


