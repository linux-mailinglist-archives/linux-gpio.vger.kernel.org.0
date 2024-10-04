Return-Path: <linux-gpio+bounces-10860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FE99067B
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 041D1B23CDE
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63922194BE;
	Fri,  4 Oct 2024 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KLeHX49V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFBD21BB03
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053022; cv=none; b=tD9x3sKEW/IWfi6IVXdwGyzDbMyiutyIDn9x6glL7LkCkDVTTph5AmhTDoMlENR0lePMNNcRMArnMaoVPjezSneZAuQvxYPezZvlOPnwOP/ZEX/kV0qzdv3aWRmE0whbjuJvYrV3Ftf3BYz3kS2sVbZCr0EXtv43D+UquPxR6Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053022; c=relaxed/simple;
	bh=vCyqKCwfy1nt5e7v08lKAFzg/0ovYPR6Dgie6Fnihdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQW+DGMTKB9iDNhOZi+xImOKUKG3EM06NtDtqrpDbQZhUtv0Y5hhULUFaQOfBgcr/xvB/fa1aqEVIiDTbQjcF+voNk3lNujUitckUldlxhDTOBjb0w1V8aslRWM2uv8nf9uGyHU3FGRwhmVBYTy9tP5giiCnaHUTWKYUlTvXWDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KLeHX49V; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37cdac05af9so2096874f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728053019; x=1728657819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKjMW5FAvExn1X1rKYf/xNSPWWy6xqM+i06DErztFe8=;
        b=KLeHX49VYxPGZnOBc51S5XTNH55kfQ4UlquGMx8FykucQq9p67ye6zYRG0b1BTFO4j
         g7sYFItwBLhadqf4AsN+Btuv1QfoTBYdl7nqH/GDCLD3w9zm0ndlDI6kNTP2WQChaInR
         Ti7HxRRQYCil1/f5UWGunMMJ0vHf3YTZl16xv9YJ1tQr1CSJFgvuBprkPwCvtCD7Ucet
         yeXGpaPFZNLScJ0Uhktd/yxFzfA8nzU/jSmNvs6GM0wM0QbAK+NmeVOArIFkMH21EUGu
         ia9ItckXXYbl4Yj5UFI4zJTy01wyBLZ7hxf4fR5+T260My6PSvAVKihfrmu+1PJX8yQZ
         Lolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728053019; x=1728657819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKjMW5FAvExn1X1rKYf/xNSPWWy6xqM+i06DErztFe8=;
        b=JfIwtfN2ZvYwWWFTuu6f+0QEduaBbWltD8VsILMEp07H4aUFrhcdbL4rWkU7JA0ur+
         D6Ce5XalbwVly+gVLXhQcR48VF7q2wLzTCx5ooN7stXyzAUJFR7EjpoqGs1cnud1ERm4
         GSO2rbN+6T0nMJKKpFAjbmSFL0V0GLRUQHWUBo9uE71wlvswnXjQyuRXLhWiqzJRo4lG
         /p5OUiWILHaX/pfLRSZBPmbDGYSTGs6ot4vgSqkU0LGJQm2TzYMc4HCYP17h4U4Aq9qP
         3fN009EkCWqMGlPq/Dq42ZSBeE2uH+g0/nDOMOJcR69mTXqF5jXo0gkJb6ifMHcNqo7R
         yfbA==
X-Gm-Message-State: AOJu0YyzPFNDe7YKOYnFkrcvBcHrqmHsUTaRp8IGTin1tLlv/G7pALjI
	PP916xTg+DIA52yscn4gKAEj9w3LWBbYxXNvSo6m/pT+kdG9+bttPAkU1QkMVr5QY7/6fjXE16U
	n
X-Google-Smtp-Source: AGHT+IFm4b6vsKZfWNFphHza3MvykaI1856ZzfmQ9nuQoS0XnuGTmf8heUYonTjvbrf710Vr568WzA==
X-Received: by 2002:adf:f58c:0:b0:37c:d507:aacd with SMTP id ffacd0b85a97d-37d0e724b97mr2745035f8f.14.1728053018674;
        Fri, 04 Oct 2024 07:43:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:80ea:d045:eb77:2d3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d20bcsm3361370f8f.100.2024.10.04.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:43:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Oct 2024 16:43:25 +0200
Subject: [PATCH 4/5] gpiolib: simplify notifying user-space about line
 requests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-gpio-notify-in-kernel-events-v1-4-8ac29e1df4fe@linaro.org>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Rj60/yZ4gwl7HOw1XZWCqUwfUu0FrUco9KYhnC3+nbs=;
 b=owEBbAKT/ZANAwAKARGnLqAUcddyAcsmYgBm//8VC6Tw0qUqhumeXIZLVVKV/gzX6Jg6TeoDf
 Cv8Tb91hT2JAjIEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZv//FQAKCRARpy6gFHHX
 cokHD/Y1dTlGBuGjnh34+xOD4dNiEXGgmW/phkq5Z2CArTeC4p1OQWmdBvyMPgvU4oEQJFle+0h
 35dvy4nvSwVJRILKHkR5O3mZGrJUx71JsoOIhrrW5Y5ojDRVEC11KBe5Z9FCdpeLaprJ4K/P9XY
 /NEoE0/rZISjQHStAPGr6Eugqs15fpAiftfMjIIJQQH40Y4WC6KB+CBxJp3vCjBUsfNCBw6BMcB
 YWv7DzDxqDZPYoxA+O9XLt95I4/YteHThJzvdh1iNhabb6fR1YN6DSHdA8f42EI2DA41p/FcHsV
 qv7n92zA3CKx0BXaP7/WNiVu2m4xJ7vLRyxzmItodwR4XGfNkMXqVfJIYcOztB4CHXHNyUQihMa
 lRX++daLYWtAkHdnu0eM8kEth6wK7czDqvCfE8AiuQNZVK2u6AbMX0t2ZLtOuPmD4xmmWNQdxh3
 qT90mBvuwtzv05nclkF35Upb3TqjItNrnwHxsofRBowzxolC4a0TnpemdFeCyv4mqGKlWg8HB4a
 tSQlWdYkoWcRVoRLYOCv7xok+6OhCVOfXeVWwxGAnDtPPjkWqHTXc0j6FZYjKcqdWPzsvw/tAVD
 NyaLyh0zhPx8GCbo1lcncH7x6Y0N/ielIXePHIvCFhj8S0csekaCDHZjiLQWfb9/pRbbGEA0k5W
 RmEWk5AehbEgk
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of emitting the line state change event on request in three
different places, just do it once, closer to the source: in
gpiod_request_commit().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 6 ------
 drivers/gpio/gpiolib.c      | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b0050250ac3a..f614a981253d 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -372,8 +372,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 				goto out_free_lh;
 		}
 
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
-
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
 	}
@@ -1842,8 +1840,6 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 		lr->lines[i].edflags = edflags;
 
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
-
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
 	}
@@ -2234,8 +2230,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		goto out_free_le;
 
-	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
-
 	irq = gpiod_to_irq(desc);
 	if (irq <= 0) {
 		ret = -ENODEV;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 97346b746ef5..190ece4d6850 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2345,6 +2345,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	if (ret)
 		goto out_clear_bit;
 
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
+
 	return 0;
 
 out_clear_bit:
@@ -4365,8 +4367,6 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 		return ERR_PTR(ret);
 	}
 
-	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
-
 	return desc;
 }
 

-- 
2.43.0


