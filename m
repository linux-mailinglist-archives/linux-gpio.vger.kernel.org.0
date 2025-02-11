Return-Path: <linux-gpio+bounces-15722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC95A30B41
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2B267A222A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DADB21CA12;
	Tue, 11 Feb 2025 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lEoUAoGy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F0F1FF7B7
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275811; cv=none; b=Xty5N1YSPvthq4DZXQARbEuW94K4oLJOGk9i+0IZmsRuejpbj8RPUs6gdnFIDUhL/D+3NQvlRXLF2/tHNCHIlEIxqVb2pVHARbuVRzlPJ1MmV7cyZqcsToSeSuGyisED2Tap7MKWh+YX7+4QazbSaOYaq1F8Efhgo6BSu6L/WQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275811; c=relaxed/simple;
	bh=zsSWhWJja5bjynEs4UeWrPkKMTggjfp9Yk48/oxvSbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdWODS7bYGahFJZtKqsKCnDWWAiXjpefTSECkFLzhtMDTJmK8O/maMJW5pVEEzDdj2Kd6ScLUyVcIIc1bnR82bKxjEyGCqYVv69aSm+54Z85LyIBhkTjNHRc9XTLR6WEcfoXdMUt0ITqi31AiV+rUlgcJumMQzncsnylJd5UgxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lEoUAoGy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2849422f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275806; x=1739880606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flGMeg5VushkPeMvEbQ8kx2w4d/f13NaDyOkOchHg9U=;
        b=lEoUAoGyb48BIo27r8qgfQKsPF48/7OYnHiIp5q941FoQRIpAplVsm67wGtgOJ1HDo
         dDUJyBKzKwBrZhEkFcrPH4w+WL/mzy9XBwgIbsQgGxSRf7SUEl+7Pq7k84PPZ0b+H6nK
         jJ/sHJRA+74FYoOBmVAu8/bo6NTP8NkzvSzlN4Ufkr/syZJ67f8kag7DYChrZ1kT//Ln
         DDO9Nff+w/o8oY+ngl7uLzUoF5kcSe3fndC191TGV3RVPkK56VLVaI3PPOXLQaoqOEh6
         OvtsSv8ndlnsNwMPf9KZppOcwA5/Cw8Yjfid2GGHq7QiKzK6778VwHxhh8niydlOetds
         ABJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275806; x=1739880606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flGMeg5VushkPeMvEbQ8kx2w4d/f13NaDyOkOchHg9U=;
        b=f+CWIgxVmloSvrbR3Wu+oUi1pYGDGNqAo22w3Q3uydDK8QQMQlGYLdRUYi4xgEzIvm
         3d2Lx47rBX+K/OLONY54wT1glFuFnMJ86OwGpAJ+J4SKCipebIh5logfCJlLdDeV65wB
         Zzc1VLX7VSmuNxZoTRk9/jOfNHOFq1p4hPry9OoS6o3h6GdSR+OP+fWgr/z7+4fqokrI
         ejMMcH9IBKv9sWEReEnlSF6uFHC/pdQizb1oN3hM0BAew0P2K+uFXYXWs1Mt2KKE8Es9
         PuukX31PcUIyTu89dunSy2hn2znhUphyAmLegncXnlP8I8h4s3GU3S40y88+ixYDEmnT
         NxlA==
X-Gm-Message-State: AOJu0Yyy2c/Lixc5s8EhVuUZW59Her/mdGmnJ98MvUK3DNRUnL6eJK+o
	ZiBjPWi0JtuYWS8wkc4uF/nuswst/DTFpMspCkRVxqvKRmg+D9U5PSHmklhepSk=
X-Gm-Gg: ASbGnct/MwL4ItIAS9TU4kU3X4fNo2fnJWmnpWyftxLoLAHVUxJqWrrRfbFP3do5zag
	3ceat8lWB8Q9FOUAL4DNqnmYk3f53o5iUSsbXJ+O1d3kuv6KyiFv/J9BsrKIT6Tw8cTh2Pzgh7l
	dgNwfZFQ/5dAF/DoF9+zI+sTrP8YM2hinP+AQTsBGItDuQpfJV/asnPFLt7BwsEB/UnezgX6GOF
	pZUcvrS5xBawtlHZVBtq8DG3OyhQPzZaWM4i1+jAeRpO9bLdR91kFvM5nHtu+G8QuTkkMhsVgse
	MY4qFHo=
X-Google-Smtp-Source: AGHT+IHTtUOjwp2MTisEoq2qXc8kpIkQePo/nqKya2pkK2EtTcQmJ7kE6tNedkI1/cyWmwMVryFVRQ==
X-Received: by 2002:a5d:64af:0:b0:38d:d0ca:fbd5 with SMTP id ffacd0b85a97d-38dd0cb6a75mr12035035f8f.22.1739275806467;
        Tue, 11 Feb 2025 04:10:06 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:39 +0100
Subject: [PATCH 05/14] gpio: sim: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-5-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qgip9bWI/vEDIjIxM48q+Vgy3ZpuucV2NIkQXo3Sfzw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4WLpbRPKvx2jxe9bpfi1dULTAbOwUCmEDdB
 m+aroirElqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FgAKCRARpy6gFHHX
 ctTsD/9hMGs8OBSM9c9QKMIU2N3W76nYowAseouI1RyUA+FmKsmnaU3/CjwEsNWSIRf2x2yciiz
 Vm97XxNXAsA1okzFjOPiKohXvzs5Ky0icjQZ0YNa62rWPGkDoHxukLyBpo6wJB/zZ0y2yiEML9z
 QRSZqM2RSVlJTnMLkF4anwAzg1M6fxekE/7LCvRLVcLOEEdDJvqZxT2YJcnsTWROiLDitisSejF
 zzVo+ez96hnJ5EKZitr8wZtpdiOMDDbwxQ0H6uiIKxaFspsTKqhDym2FhIhuOs43+MjgDT4iGeD
 rLpGRBi6feGA6xeG21X7XDzt3KtTGTWn3q5cpFwesaQ1cnYU64wMNlMZnu5NHPA56S4HAyUeisN
 b3w3ghuwseF1cPCygDHekCzQ5aSP8tfwaMou8mxUTJEL1CMfnqyoHzoxr5b8k3CPhAsgFhaiHSW
 dc5kQvu1a38iNssF11z24EqtRaw21yUZiMS2s3M5spL5RVJPtui4eqFX3+HK3IGIbKApgZU6sNP
 OHGZ/+mnO1nPcum/PvH+a2YjJlZiQwThnPXvMh3fWadt9K2RaUcG0BZfd5dWuPg9weH8wQXLK7N
 E5U0pdUYhRA2/nLG1s4Tsr93VxyxYXC1gw2lXCIoej+/rAj8INQgbfTNDFoZbXRlCGHLRZVT/yL
 dMcI6BRNXB752mg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index b6c230fab840..b3baa7e872bd 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -119,12 +119,14 @@ static int gpio_sim_get(struct gpio_chip *gc, unsigned int offset)
 	return !!test_bit(offset, chip->value_map);
 }
 
-static void gpio_sim_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int gpio_sim_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
 
 	scoped_guard(mutex, &chip->lock)
 		__assign_bit(offset, chip->value_map, value);
+
+	return 0;
 }
 
 static int gpio_sim_get_multiple(struct gpio_chip *gc,
@@ -138,14 +140,16 @@ static int gpio_sim_get_multiple(struct gpio_chip *gc,
 	return 0;
 }
 
-static void gpio_sim_set_multiple(struct gpio_chip *gc,
-				  unsigned long *mask, unsigned long *bits)
+static int gpio_sim_set_multiple(struct gpio_chip *gc,
+				 unsigned long *mask, unsigned long *bits)
 {
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
 
 	scoped_guard(mutex, &chip->lock)
 		bitmap_replace(chip->value_map, chip->value_map, bits, mask,
 			       gc->ngpio);
+
+	return 0;
 }
 
 static int gpio_sim_direction_output(struct gpio_chip *gc,
@@ -481,9 +485,9 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	gc->parent = dev;
 	gc->fwnode = swnode;
 	gc->get = gpio_sim_get;
-	gc->set = gpio_sim_set;
+	gc->set_rv = gpio_sim_set;
 	gc->get_multiple = gpio_sim_get_multiple;
-	gc->set_multiple = gpio_sim_set_multiple;
+	gc->set_multiple_rv = gpio_sim_set_multiple;
 	gc->direction_output = gpio_sim_direction_output;
 	gc->direction_input = gpio_sim_direction_input;
 	gc->get_direction = gpio_sim_get_direction;

-- 
2.45.2


