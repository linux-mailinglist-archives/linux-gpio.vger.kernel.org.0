Return-Path: <linux-gpio+bounces-15651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17FA2EA10
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F031678F0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E171E3DC8;
	Mon, 10 Feb 2025 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VgIXrlWf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8AE1E0DE6
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184735; cv=none; b=NCcfQ8A0D5l3hjqUzE8yPMMZr/+Sz9QOvGO2L3yaiT2aYcihM49nrvOzsSlHYqEat5CKCNiCHP9PSIY+dcPAIIdN45IBudhaBEKNtji18ifNLahBIPjF5VA8a20oEtLq96rY8ALLATjstxFTV9at2kbMHX3SiX3APZegrr/QvH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184735; c=relaxed/simple;
	bh=V6WoqRuA4KI05FV1+v4Oy7g4HufVg8Bs8TaRncykJPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQ6A2k0+WGlzHe2jgIf1oz7ONQC0Id+8HmLX3pfcu3DEolyoWe4yyk6NFq77KtLdXrtiGsyYXsLVl8qfIzgnN/XspwUtj+ZnGAAUvff1AI2kj7c/TF2mdPh3ATN/OAZDDcXMX7xT/xTtDSS/89MewB8GRLC8Z8E7ydY/EZfzylY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VgIXrlWf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38de17a5fc9so229412f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184732; x=1739789532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LENKvGX4vcq9UheVuJ0AMEOpXRzUqJjB/uWgFb41XbQ=;
        b=VgIXrlWfT5IAZfuqHO8Tx74JYjImtjYpLJdAaL5kzcGpHR1jGE8Yw43LNgu0tiHqL7
         R0tE/595Ae+JJ0ieIxU+lI867V8/wPDuQWuOu4tRBlSqOy69EjCJtYhVyGoWhyP4vqbg
         m+ETKwGHKmDhfbsniJ6LlHSihuhTFJXzGMEpjx0+ZtJecyHg2V/qu7DdDzgqvATXySdI
         3oLKxZ5HBI/W/Yy+fGu4+SfLmgnt7j+YXirvJoldB6TDUh20oDozmKW+taVhTyaChG9Q
         /lP79wWkxbCATIRer8KXKepu2POP4MPT/vqpUsy0lbR7aMv0RcfWEqH+ujv0MIRg3pGG
         Mt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184732; x=1739789532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LENKvGX4vcq9UheVuJ0AMEOpXRzUqJjB/uWgFb41XbQ=;
        b=i2+jxuv4l/pYNdDEzEm1vZXOw4xjLcY3eMOIjd6k+xX6xfaBcAk4IlVU8CthG33NVz
         1q8IvdKpJPqa7iE7GQKLZ9QHuiJaEQIsF2TvljI0nAKfYz1b2o89M5v9P1BeTqU0Z0yV
         In0a+eVnaWDv42w7R/WUsU4fHOESRLJIJYP+zHoSME7Z9kpUdAqulJWW86qsGa8/1fW7
         /QsdKOb4ai1zMIC0uvCV/v5s44I28H1tmYDELXC8V/tCJbT1ZFiO0hoJA7+amPBW9dTv
         2EnPZVmIuxjkKxE8uUYEQcb+AZxUALXixmVNqeTnz/LneBCOb/p6qtDolB8VlY9ltBYY
         8KeA==
X-Gm-Message-State: AOJu0Yw7D5m5RJ7Ozqey9NgxJr5zJrI/9XDYwwst02KgLb1oueKEkoPj
	YrOVALCI9nztNVHfKP98VSVsYXUr240wpoHaPo453Acna3yPvgaZ7oj1oFvMiFc00+5aOn/Q4JX
	GjRU=
X-Gm-Gg: ASbGncvKfHy3h7njWCIfbefaftRFznTEwqU4g1w5ZL1zn1tjpC4hJhX+whhA1ZWZR0u
	JYc+rxtzGyhd5qb6OzXcBMpukQ7e6esrbHfaUhX8d7AhbjRHfOv7bEqa6lUTqKSbz0PH68cQzsd
	wcMc3vwzDixO5EPkjLzx/opW1tFGySR4qUL/GS+GNBgNCz4CD3wkk426h/61daNv0HqNaVZR8HO
	Snu0XAWMLQGIgLH64xHiNXxc1mz9FOO8u/ZeZKWgXptJImwZ5H4eYsPOnzDjqKRin374R0bDbXc
	UpVM5f20
X-Google-Smtp-Source: AGHT+IGcts0QLUB4a77mWTRAzfoRCt4VM8k7qsgfMeWESQ+XzkXt5a40ga/6FmpFrd0x0OUpy75nFQ==
X-Received: by 2002:a05:6000:4012:b0:38d:e378:20f7 with SMTP id ffacd0b85a97d-38de37821c5mr46131f8f.41.1739184732183;
        Mon, 10 Feb 2025 02:52:12 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:52:00 +0100
Subject: [PATCH 6/8] gpiolib: sanitize the return value of
 gpio_chip::direction_output()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-6-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=v5PaGseLV+iX53DOub4sqpS1V3bIng/nrHtGLctVVdQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpT05VU7QlrO9fymh6SdG4wxJ+svHmCP6bdk
 bYTEogd8/6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUwAKCRARpy6gFHHX
 ciQAD/0Y/GW+31oLwGIVNlHfLMDdu64zc6BxN76j5jU+SUqFRhYTXjvnrhNEj8N6eYT83mfS0xI
 EUpIOfTnApVbqXF9er69IkYITWOrB7kdv8kdlk0KYSJEVVkthBYzgwHDppdNjcMRqrGzoO7/SOP
 Jfcjb6h1eFVONFj7XIvPRaBwMKVoZsp8f/eUHanFvdvZBnuOQkQspsyHRcZNNTI2gt3dEHi/Sr1
 Ao+CAANEx8bc/t322NflWuhwEyL7hjV6juc4soB5MuAEvjL3rmri2mXfHG7Qqm0tcFmSfKMqGMY
 v2p7w0MH8lwpsyKh0EyUuFXx6LiB8lmTulv+5mSSBkZBOseUz2uSoNCT578EwS/GmJLGltrGCUd
 12e79Jdzg/YHg1FR5PYRrj1N5/23swbeqRiQXUXI5ZXCEwHr21y6XRwvTfuX+fUbYkamZlSgJb3
 R8dnGO5rJ1q7J6QARkgrZsu50cRgelpXBdxhp9Jdpvce2S5enJQK0VGDoew3c6a6Hf4FOc9wfGC
 vc9jIaUdd+xumNRLcl+N5ZM0elXqBSPYYGFxxmjt+bGyp+Ae1YMKthq4qkRTPsIFJGOIHPwsL8V
 EUrF3Flnm3EdT4yFKIcP10LQsbU3i2pgZWxugBzL7BXHOB2HtKlKmgIfcVsQCIZiW6dw2Wr+VtV
 cy7E2gz6ZN2Zb7Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The return value of the direction_output() callback may be propagated to
user-space. As per the API contract it can only return 0 or a negative
error number. Add a wrapper around the callback calls that filters out
anything else.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7255f4df6a8b..1f75ae6e208c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2683,6 +2683,23 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
 	return ret;
 }
 
+static int gpiochip_direction_output(struct gpio_chip *gc, unsigned int offset,
+				     int value)
+{
+	int ret;
+
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
+	if (WARN_ON(!gc->direction_output))
+		return -EOPNOTSUPP;
+
+	ret = gc->direction_output(gc, offset, value);
+	if (ret > 0)
+		ret = -EBADE;
+
+	return ret;
+}
+
 /**
  * gpiod_direction_input - set the GPIO direction to input
  * @desc:	GPIO to set to input
@@ -2780,8 +2797,8 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	}
 
 	if (guard.gc->direction_output) {
-		ret = guard.gc->direction_output(guard.gc,
-						 gpio_chip_hwgpio(desc), val);
+		ret = gpiochip_direction_output(guard.gc,
+						gpio_chip_hwgpio(desc), val);
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction) {
@@ -3433,7 +3450,7 @@ static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 	if (value) {
 		ret = guard.gc->direction_input(guard.gc, offset);
 	} else {
-		ret = guard.gc->direction_output(guard.gc, offset, 0);
+		ret = gpiochip_direction_output(guard.gc, offset, 0);
 		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	}
@@ -3458,7 +3475,7 @@ static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value
 		return;
 
 	if (value) {
-		ret = guard.gc->direction_output(guard.gc, offset, 1);
+		ret = gpiochip_direction_output(guard.gc, offset, 1);
 		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	} else {

-- 
2.45.2


