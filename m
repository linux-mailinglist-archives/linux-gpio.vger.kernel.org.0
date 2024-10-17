Return-Path: <linux-gpio+bounces-11559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7C19A2619
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 17:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9166E2818F2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806951DE4D3;
	Thu, 17 Oct 2024 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IDkS9FkW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383661DB956
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729177724; cv=none; b=jsOAxPA7VnmGk1gM1aRWJssWbQc1OMTcVUKslSNKFH+eA6nt70nsJcE4mPO0ykGy/L4w054xDc97G+OT16J0AtYEuELp0jFl57EiZnlNp8e92a6GmlFDuXSSIK1T8qs2sTmhjzrlTvMydB6UxCpWAElQdpotMQ7LxCwpi5obtYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729177724; c=relaxed/simple;
	bh=bYxrg/kZoAAa+n7YrhEXhQrh2GUR3qqKt0lQD9KKWFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDc7S6gTwKK4TAXb5AjWdYdW6UeWi2L352FcIDYnf3rYgWhUpg619pbpDZjpmO1xnx6ECO+yU218qbWbTtIjH3oCIQFAE0U4REvZgGaVF3iUENZx5I5G/ieAQ13evwe1JEjh1ePOWa5mJu6Cj2hGGjM94HqbSKErCntBBJRFUCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IDkS9FkW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d5038c653so746818f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729177717; x=1729782517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5Rzm2SctSx8M+Aj5G3T9Np9fOCdYF6YWUNZMHc53Mc=;
        b=IDkS9FkWI+o11ZJMLyOYr2zKoPSqmwjILvWju+rmqa3tEsDUvlXzW1qre8leX272FE
         jRzV96vMW8ZJynx7G9HsyUjE2VwNj+DtCFceboddYe9VDvl8t5d4ml7NgOPDhqbEbh4U
         53O/CXMZ7fACyuMpvK2H+FLO1Ykld7uIkj6e43vyH9Wh6zzZxb+JwWqUyKq44duWHwhd
         +TBXwd3lbo8KiozI7gtASTSq5xM33lo3iIb419JoiZTLPCMCbWCKVDazOfLaVk98mnjx
         Mm4s5GCkFRRf1zlBg0OWFJCvU7hheaCJjvbMHA4JGudnFFigpmuFmaXSt+EFG6DoVRsy
         LPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729177717; x=1729782517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5Rzm2SctSx8M+Aj5G3T9Np9fOCdYF6YWUNZMHc53Mc=;
        b=OI33Q4m6X1F9ryyNtVo5o4zuKjxMKfPRrSiuau2stQN/K5G7RF/3XHvNHTpoDjKGyV
         ToClGGo0eoMII8Qhbcr1vMFx3FSZTlTFst/sAMc2uUZTvexPQu6dbQ9TOZhxXER5hYVP
         h5RgzNyRTPaEjPHvlyfkCE7EPWQyNQQFZXYCqQPbFIMZDaSBN7PHU+IYCIF3qI39hCjN
         7mmqIfkbl94tm9UJqXLpRsep4uMToOTl8XBBXrJgM1vEzQ0Dd6u0ieLv6ktWC2rZGicH
         Q/3oFPYdTWKw3bg+R2bObIcyLg2crehPMemuEYC/JRJXcWq2XdiTi0ciFkFJ0ZP0AuYe
         q77g==
X-Gm-Message-State: AOJu0YzwUVGkLCmQ9r1GaqFEYDlQqAf4BvZQAbVXtw0u1AJ61mrQGqgq
	5xgl1iK9qO4xi2hUoZjGYiChpW0BLixdzxNh+5QRz5qmPv5/p4RAfemmgzarMUc=
X-Google-Smtp-Source: AGHT+IH+q4HZLHosS8VQN8UfaYGSyuRYVzKPyzy0hkDMdVbG1ZXKGA7oDI6nkH6TRh0oO5d6oloNZA==
X-Received: by 2002:adf:e44c:0:b0:37d:4f1b:361 with SMTP id ffacd0b85a97d-37d551fabc4mr13795169f8f.25.1729177717395;
        Thu, 17 Oct 2024 08:08:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa882acsm7516635f8f.38.2024.10.17.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 08:08:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: 74x164: shrink code
Date: Thu, 17 Oct 2024 17:08:35 +0200
Message-ID: <20241017150835.105676-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use managed helpers to drop the goto label from probe() and shrink the
remove() callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-74x164.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 753e7be039e4..fca6cd2eb1dd 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -143,24 +143,17 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.parent = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
 
-	mutex_init(&chip->lock);
+	ret = devm_mutex_init(&spi->dev, &chip->lock);
+	if (ret)
+		return ret;
 
 	ret = __gen_74x164_write_config(chip);
-	if (ret) {
-		dev_err(&spi->dev, "Failed writing: %d\n", ret);
-		goto exit_destroy;
-	}
+	if (ret)
+		return dev_err_probe(&spi->dev, ret, "Config write failed\n");
 
 	gpiod_set_value_cansleep(chip->gpiod_oe, 1);
 
-	ret = gpiochip_add_data(&chip->gpio_chip, chip);
-	if (!ret)
-		return 0;
-
-exit_destroy:
-	mutex_destroy(&chip->lock);
-
-	return ret;
+	return devm_gpiochip_add_data(&spi->dev, &chip->gpio_chip, chip);
 }
 
 static void gen_74x164_remove(struct spi_device *spi)
@@ -168,8 +161,6 @@ static void gen_74x164_remove(struct spi_device *spi)
 	struct gen_74x164_chip *chip = spi_get_drvdata(spi);
 
 	gpiod_set_value_cansleep(chip->gpiod_oe, 0);
-	gpiochip_remove(&chip->gpio_chip);
-	mutex_destroy(&chip->lock);
 }
 
 static const struct spi_device_id gen_74x164_spi_ids[] = {
-- 
2.43.0


