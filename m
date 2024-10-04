Return-Path: <linux-gpio+bounces-10859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E469D990679
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F86B280DA7
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE7C21BB19;
	Fri,  4 Oct 2024 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EItN/f4B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8023121B44D
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053021; cv=none; b=FZ2bTIbO6uVlxo5ndiMwRAivKDu42G8dw0JZA76WTtJDDPWZxhI63KZqdDWt+e3DxODyWRM7HuoRb0PdGnU2fel1TtL1tc6Ty/tLNAHgdtVB+aD8JbRNjI2KMxXmtP7jen5b3HPIVj1BC48SfCWPriDWy61wmafSJbZZ62cm7cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053021; c=relaxed/simple;
	bh=nILLEVrSRUMuX39lz3JI49M+Jl9a8uMyMqPKy0crlCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECE+5pYEicZeBgpdyCSzf/YlFHiNqnj22xrX7fnan+ftzYhSljw+BnmAc8ZtB/SHLrO11bK9aVZpy8yMKimYKasV5FeLn/0A/SfltJApdyAkxVPXIepNkVb2yCYY7de4TSgRaGVsY5566wi0I1NDdRL0UKkOIMa2w9Az/B1cFVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EItN/f4B; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cdb42b29dso1458821f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728053017; x=1728657817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vd/1ALFEEqvJdDJR8cRrUppctjGlEDDTBM1Pkd8mDw=;
        b=EItN/f4BbjUFjWx0V+78y3vY59KMvFPWzPr+qKXhzXKH9+LlFmXX7y3S5bnObewRlv
         vw242fLULvAlHWZ3OhoQHUEfyO8MogUdw1p6X+7J5Yi00VC3Syu/PngG7po/1Xm3ueC/
         KyfjsMdLap1cpOIykTzOW4r5GHCETwSS9ejvGjGsxBGRT1iDNAR5bv6LaPj1a48BY3v/
         r1FhjscJPIf2xoWwqY/ZxLfjSdmof2ifWpnWSbk8tpRPIWb9PZCXjSXVVKhfj6tzoVpz
         PSMnHWxT4FBqqH9QPnQ73xCDBRsL4AVePdVyywhGjish80/WzWnIVY1N+CnLj7KGCpt2
         c6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728053017; x=1728657817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vd/1ALFEEqvJdDJR8cRrUppctjGlEDDTBM1Pkd8mDw=;
        b=HKiWpK/wdvvqPH44dJ221up+tfaeRiVz6gAvJFRlQvyxB3NEwJRx4xWaBSIVK6xKNX
         e6pD1Ub/F07KTtvleLrdwPYrjaG3n6SuvqLLPMXubl3vvkRigzGLhJ20itlaV7rt5fQA
         +HMZUwz49fmWkJG78BxudAEDGZ3JL49sHYpa0E16WVCHdqn0tMONZ1U3nktEe+uxQUUX
         D1kbIUvxwjhrjdh26TyZNO9/HpcaH11xSnocYUBdDcUtVzu/m5bL37ZG8V5VnmGfuxI0
         ugEZvz2v3nkgYFJyZQ+u6OM8WoGQiKAC53m8dQoupBnXA0QnFOTCGpc7300IeU0YUQ84
         kBDQ==
X-Gm-Message-State: AOJu0YzD0EHwBSX4wtMcywwHd8DEum2mWijWYrWWd5sHcHHKGgGVzPZ6
	cUR/I3XXaY2d/rjh48nLN5DlxRG5uR8DQ76PxhYgEPsVgDz0MwujPo3+EtCiDGgLeFjhJbfuVng
	5
X-Google-Smtp-Source: AGHT+IFOlwf1L/29DI0sE6sorIwM4sUuGpUATmRbKu+GBttC3o9DZIPg8ltKyasMoo4j0Kx5Yx9quQ==
X-Received: by 2002:adf:f00a:0:b0:374:c3a3:1f4f with SMTP id ffacd0b85a97d-37d0e76fdf2mr2048119f8f.24.1728053017382;
        Fri, 04 Oct 2024 07:43:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:80ea:d045:eb77:2d3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d20bcsm3361370f8f.100.2024.10.04.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:43:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Oct 2024 16:43:24 +0200
Subject: [PATCH 3/5] gpio: cdev: update flags at once when reconfiguring
 from user-space
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-gpio-notify-in-kernel-events-v1-3-8ac29e1df4fe@linaro.org>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4291;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ki9bnqoP0GYF3msoNU816SMbodAflXGpvokYWavz7z0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm//8VT5dAQQkkclXy52MS05gZoxyh4AYz3vXS/
 UATzlpaS5CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZv//FQAKCRARpy6gFHHX
 cjdGD/4+BHr0wq0zQIbMTrE1Eou3YpR0GQ6BZUcqFZERUcQuTYuRFR1kPDR5Cu3MkzhsZzM0Zlj
 gNqVo7YLSOSnxigxPMLM/xreqSkPdQymbxDIFGw6xnbd34+tNAlj3a9L0dagOAcJsS1d8heMnF4
 dbEz1ZcDjgoEV+xJMzI5uIIrqxEOV6lJfnLSSUzvDFKPDJ0VjTl65H3zidrTzHS+Emob0YdH7QP
 kWL3GgRuM9YEh8W859HGLYaEYV/HaI++C9h8rFb4Sk5+B2iPgFKRCXwoUGd5LBJxh2Ju7G46faF
 TemMrKEId23sslmQKBrE1idevshk5kIbufaZHvT/EnUa+NOEupeQ8GdfkdXnNrfz2yKHmuVjYIX
 dGoO5+x11gX4S7KXmS2WQugAK2hQjBWhBzaTl+5r55kDT24m5qFfHTvIduByU7hOJS2wgOy7g8d
 +yIwGfkpCxD6GoM1X1yU0YnuysWe/U1ps8ew+eJGvffBSRVwVHx5N+LF/DogBjq9xwr+k5wyCLn
 3vlRZQofvmJwWKBZK/K7MbwXRSzJkkoY/MGBgVKqZRib9QPr86vZ9OQSUbCnMNMqj9iz+xE10Sj
 XI3o6mNb+x4GMzEv4Fjp56Vjh5epTPmMTwyMZseibo+AWTPhtVIbpMuH1UjPMn26GrQIN7DFBhJ
 6ph4KijIn6hF9Og==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make updating the descriptor flags when reconfiguring from user-space
consistent with the rest of the codebase: read the current state
atomically, update it according to user's instructions and write it back
atomically as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 70 +++++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 6113a283c34a..b0050250ac3a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -143,18 +143,22 @@ static int linehandle_validate_flags(u32 flags)
 
 static void linehandle_flags_to_desc_flags(u32 lflags, unsigned long *flagsp)
 {
-	assign_bit(FLAG_ACTIVE_LOW, flagsp,
+	unsigned long flags = READ_ONCE(*flagsp);
+
+	assign_bit(FLAG_ACTIVE_LOW, &flags,
 		   lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
-	assign_bit(FLAG_OPEN_DRAIN, flagsp,
+	assign_bit(FLAG_OPEN_DRAIN, &flags,
 		   lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
-	assign_bit(FLAG_OPEN_SOURCE, flagsp,
+	assign_bit(FLAG_OPEN_SOURCE, &flags,
 		   lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
-	assign_bit(FLAG_PULL_UP, flagsp,
+	assign_bit(FLAG_PULL_UP, &flags,
 		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
-	assign_bit(FLAG_PULL_DOWN, flagsp,
+	assign_bit(FLAG_PULL_DOWN, &flags,
 		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
-	assign_bit(FLAG_BIAS_DISABLE, flagsp,
+	assign_bit(FLAG_BIAS_DISABLE, &flags,
 		   lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+
+	WRITE_ONCE(*flagsp, flags);
 }
 
 static long linehandle_set_config(struct linehandle_state *lh,
@@ -1348,38 +1352,42 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	return 0;
 }
 
-static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
+static void gpio_v2_line_config_flags_to_desc_flags(u64 lflags,
 						    unsigned long *flagsp)
 {
-	assign_bit(FLAG_ACTIVE_LOW, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
+	unsigned long flags = READ_ONCE(*flagsp);
 
-	if (flags & GPIO_V2_LINE_FLAG_OUTPUT)
-		set_bit(FLAG_IS_OUT, flagsp);
-	else if (flags & GPIO_V2_LINE_FLAG_INPUT)
-		clear_bit(FLAG_IS_OUT, flagsp);
+	assign_bit(FLAG_ACTIVE_LOW, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
 
-	assign_bit(FLAG_EDGE_RISING, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_EDGE_RISING);
-	assign_bit(FLAG_EDGE_FALLING, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
+	if (lflags & GPIO_V2_LINE_FLAG_OUTPUT)
+		set_bit(FLAG_IS_OUT, &flags);
+	else if (lflags & GPIO_V2_LINE_FLAG_INPUT)
+		clear_bit(FLAG_IS_OUT, &flags);
 
-	assign_bit(FLAG_OPEN_DRAIN, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
-	assign_bit(FLAG_OPEN_SOURCE, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
+	assign_bit(FLAG_EDGE_RISING, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
+	assign_bit(FLAG_EDGE_FALLING, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
 
-	assign_bit(FLAG_PULL_UP, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
-	assign_bit(FLAG_PULL_DOWN, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
-	assign_bit(FLAG_BIAS_DISABLE, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
+	assign_bit(FLAG_OPEN_DRAIN, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
+	assign_bit(FLAG_OPEN_SOURCE, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
 
-	assign_bit(FLAG_EVENT_CLOCK_REALTIME, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
-	assign_bit(FLAG_EVENT_CLOCK_HTE, flagsp,
-		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
+	assign_bit(FLAG_PULL_UP, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
+	assign_bit(FLAG_PULL_DOWN, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
+	assign_bit(FLAG_BIAS_DISABLE, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
+
+	assign_bit(FLAG_EVENT_CLOCK_REALTIME, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
+	assign_bit(FLAG_EVENT_CLOCK_HTE, &flags,
+		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
+
+	WRITE_ONCE(*flagsp, flags);
 }
 
 static long linereq_get_values(struct linereq *lr, void __user *ip)

-- 
2.43.0


