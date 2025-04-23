Return-Path: <linux-gpio+bounces-19174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35EA98054
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9B4F188559F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD3D26A1AE;
	Wed, 23 Apr 2025 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nANj4de8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684DD26982F
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392529; cv=none; b=lFjpgZjBMsWlSQuXJvhAAi5J2u9B1CwVWb25s9zJd43fyW+rDgl8mDdjcub/708JGTygIXBpgiP7pcHX8PdqJP8/x84W6ycdcK13Y5cYjjM2B6PxSdQ3jfWZMlJqH4mR2qGbYNVzL3Ixd19QCLIBqvnGGpi+Mp78D0DnDNxh4Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392529; c=relaxed/simple;
	bh=dRmgJRa861MmI7blzQlLwpGi6JFHMnyAWY0K50sqM2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9+g8Im2hbgr439CgzZ5uQlpv18oTi2lA1Dsf/JLq+tnLTutbpV32d9+YkD12GQ6Q7mkERfrMQHn9+GwU0eDUnLud3/Rfi8xts9+VeFttw3bj2uyvAeHqV0Xe7XEr8eYxuzrIJFARIzjP6m0FdyOAWsk//Shn2Tm3yt/D6jwqoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nANj4de8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3925844f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392526; x=1745997326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=;
        b=nANj4de82SsjnCkhPuDL7SHPTXUSjaVsPwVhpcApbskINOGTGOra7rZ/kW/0xeCJIc
         30RrWf/4woyVQm95rPt2TqepHHBltrPg4TZWQQSD49AU2HCnSqfMdNga/z67FJSnWcgo
         +Y030nBkiJ+8DP915XbWfdKGb2zpIUPff0tVpgUOb2HP5jUyCapExwT3RlfNq68A/8ba
         KRgEs+tiMT1NyL/6WCWcafXazVtUcAoAJOS6FIdrfoqVV7RHrbldbJs9/5QT0AWhQdoa
         gbsp3wSEQa/eyYC5eYD0kkKu2AqNn8A3CPcf1qgsFGvtyIBbuVc4XVf7Nunf0cAcCxWl
         HwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392526; x=1745997326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=;
        b=BM+6Lr3VbGsgVMvmNMF5+vCHF25auBAM3kwbKCbD1DnIUUItLiGRHMXofVBJArsjzN
         yqn8MZgUJrZlcxA6G4QglU2M4tMIN34mqMebs0GWGqYnlQSIvklHbR8l3l1RRSlrbhEI
         UZ37OdRTv6AXMc95XY3nGMLiYpb+12r3Fs5C4dsOI5dOUQ4/K1GYS+UZD6SPx1qkC1KR
         t+rLUXD3AzeW/7BBn01//MwLou+ASqJ/3nnOXAO7ANDVkOLPmAEGn3JAQXN4OVZ6C/Nw
         bDuAkfRVHKyLNGPUq2Vm1yNcBOoeJl7m4mB0cWw51WE8YiJWPhQkK5a9vrJyCn/jXKU2
         44KQ==
X-Gm-Message-State: AOJu0Yz1tEOIlrM8e+c0nxBiaUoWU1EtRWEWX1OzeqwA4eoOW8n6vKgT
	JaE+uynVyrFdOAI+tCn2d1HMvxJ2SUL3UfZy1VB5IT/7pTyR7MBYJQ3g20oAcXE=
X-Gm-Gg: ASbGncvztuMUf3Gzv826kZOru9n6HpcK3tZkX+PYZ6BsS1K0to6LDfSgxADkLjzytQ2
	TLS9k+aCi6tckh2Sus40CwjIRl4HOGAAkID/Cq8BB6lIZCyOg1qTHAwsV+BWbjXoSX8lMgV7IXo
	NFu4PgIhpFcYAM11pOUTWSgt4evVlr70f3gQ2ktIcVGUNmB4LwQm6xf1pgSMXViWhFweG9mNmYP
	xi9pHOK2XbNKJjIjRCcyzWtE89l7Pcgr9oMPBsts7KpaLpOZjTVMF+RI2HgbZKaKt0+/v7RUPD/
	FryfeKm7uhscj997ssA70I7WTa//RQ//cw==
X-Google-Smtp-Source: AGHT+IF6SVfs8RHa2BnADJcSY6J1I9halvCK1KnXR67dc661aBEXTvglED7nQaJPJMMIX/l2j+WJCw==
X-Received: by 2002:a05:6000:c08:b0:3a0:65bc:3543 with SMTP id ffacd0b85a97d-3a065bc358amr1886761f8f.35.1745392525708;
        Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:11 +0200
Subject: [PATCH 09/12] gpio: logicvc: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-9-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uEXyapUiU2zuU+gAX/AtJAOANlE8Iy85z/xFY4aI4tc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCCFWE0JSqUtSesVr7mzuU1M/ku4tksaurU
 rUbPU9KQmOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 cmecD/oDvN3BKxrxrluO97/IgXHtepSYXO/eBzaKqLSk46iZdLfN1ELs7wHsUUCRmq2Hcej463z
 TxWtZwr07ZL908O8pz8zRVVcnJO1yFup+nI+BE7cZ4T7/Pj19/VGw1ho5Th1IVliSLTPDxKv3wE
 UV75Y1wlMk68b6hXi8hM23v4fz6OXZgdEVCnYPAxYhtntLyBaB4BtG+ThkjKk6d4ss+PUJ17Gdk
 EyPqUiuMp1mEwIusQp7OsSs4yIpAHNJhCDzNJ/uRmyPQ1f2yXkEz2FVHWApJJxXonw1VRWvpFLq
 ZG8F8Bk+K0XoBf++3dofAzsCvMyggHSEyAewsW0QmB8skAO926oR8QpVD9gstdjpzKls8ei2q9W
 Xg9m3Lcquv19Yw9wnZFpRpnNn+XtgJ4cj+83IztRU33NvxcbvFbB9Z9XMNcBj9sz0iAgA6txYgw
 h5wILlAHqzeoFU7ibGssNASTrg8bH0JSP0ViL5PctN/ye5/i1xGUryRXb650M4S6KRQCSjgL/VK
 i0RmEiBUqd0Dvr2K5qGV16O1j39J7oVtu60wglI9huydbBqbJG3pMQvi8Bae5FR1Zdj6/a+GLdJ
 Lcqd053up9xLuw11VFAGN9he49iS8D/z83e2oMdox2G/EHa7hq+p5yQKWQz9+oNDKRmkWne24k1
 NSW65Qz796zVw2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-logicvc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index 05d62011f335..19cd2847467c 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -61,23 +61,22 @@ static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(value & bit);
 }
 
-static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int logicvc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct logicvc_gpio *logicvc = gpiochip_get_data(chip);
 	unsigned int reg, bit;
 
 	logicvc_gpio_offset(logicvc, offset, &reg, &bit);
 
-	regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
+	return regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
 }
 
 static int logicvc_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned offset, int value)
 {
 	/* Pins are always configured as output, so just set the value. */
-	logicvc_gpio_set(chip, offset, value);
-
-	return 0;
+	return logicvc_gpio_set(chip, offset, value);
 }
 
 static struct regmap_config logicvc_gpio_regmap_config = {
@@ -135,7 +134,7 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 	logicvc->chip.ngpio = LOGICVC_CTRL_GPIO_BITS +
 			      LOGICVC_POWER_CTRL_GPIO_BITS;
 	logicvc->chip.get = logicvc_gpio_get;
-	logicvc->chip.set = logicvc_gpio_set;
+	logicvc->chip.set_rv = logicvc_gpio_set;
 	logicvc->chip.direction_output = logicvc_gpio_direction_output;
 
 	return devm_gpiochip_add_data(dev, &logicvc->chip, logicvc);

-- 
2.45.2


