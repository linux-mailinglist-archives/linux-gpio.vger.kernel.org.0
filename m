Return-Path: <linux-gpio+bounces-10554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC54989DB1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 11:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D381F21AD6
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 09:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5C8187FF7;
	Mon, 30 Sep 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a8kKzjjI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04A6186607
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727687482; cv=none; b=UiEjrfuxDR7/570rs8+lcG8i8jwuG+rt1r/fsGEHu/JT76cnSMK3FTcTeJNYUVWTw5y3VieTM6TQ5lQqzG5WcFL8mxq+TyyaPEX6lU2MTAkW8Au+6TVL4GfQVQ7wK2z7dUxd5GMD2AOpVff0FbU5XD/hWmkGSg3tm4K4sX9vpYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727687482; c=relaxed/simple;
	bh=j9EAIuMKyTrCqRpm9ftCatgw8ZDHQY60UwldKloPxPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpbP90MzP1LzafOpVjX3GjGp6QEP05Gv+P5hpZq/EAPxLbetqt+QCe7upvGjjuSIb7Cxh86ImqWTkc0APzSEs+0lOMnwEHrbGDftAnr1l5bFuc4mcSQ8HZgD2LSZPDdxIWiCkUUmGWFQuOj6pAse6pIrERKU9lJfirlxPm8H3C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a8kKzjjI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so32498275e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 02:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727687479; x=1728292279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8TgzjEbxQmEBqcqNz89bUaMH73B/lho563HHj9DR/A=;
        b=a8kKzjjI7fKQjo9EW+xZjsIhavRzIBuuh1InNdMLOHmtM+Jr0PwUuT8kgTHL7IZ8gn
         4N5emYq6e26922zD09aWFvYXu/hzyTz3BH8o8n7JWjdeMpmGEPmfFU27tMZnBKlyvCpS
         AS66qQe+mj9zLZtULcIIFOlbcofW2N61QUj9LdfpdbF5Z0CsYKTr5ezVAswV2V5vh9X+
         pSeBMPi9QBiznsMuOPZZzNmw8w467QR8o9wwfkM6XGN8MqaU4zjyZMHieWN1HxOWEofP
         MEdEHdv8kmQHaXqnjaRbJP4EqlukSziH7njZZtbI28s2EkYuGnjByBWov++TOk2K/t9d
         aGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727687479; x=1728292279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8TgzjEbxQmEBqcqNz89bUaMH73B/lho563HHj9DR/A=;
        b=eGZ6MKorgIS1P0mNWPSFizRVXzy36vjP2fQT1uw8JTL+VVp/djislPbsdtah6bOyei
         X40OF1fe1VEpfjI9FmozS+7z7oH1isTMJ+w6n/GzxQyjN6n1/TLg23njA4rsiBM9OgDA
         1OKdwd2z/JIBOXCqc+fayWhMkjazD2L2ZjqZmV91ZQajc1RW0/peINLrF1BwT8ZSYG1X
         uJ+y4yNurm4Uf+zIMF21Kr44Ta3He5tNGNlJTd4WW4FZ3lM6M+xFew0Mnq3SynsMsjPz
         +ND/8xmNeBpHc86tKAZGsyaFwOMMeTGcIe4xzgBDKgim3JvzcFwLBtwfdLmwxo0xZXCm
         t1iw==
X-Gm-Message-State: AOJu0Yx4tYOrN2wJjAVY5m1pn2S1Aio0hSNLUeh2mWozU4JNqGwhzCbi
	0xoWqpsHROVlL/obUheMC0+Ds19niAjqjy11QUV03N5OG4Zb1mdj7GJhWaehPJlaL3QkqBnpuD0
	R
X-Google-Smtp-Source: AGHT+IEYHlUOLizDws4a1V++OEulQgUTHwux4Adu9sDvknTQxwE7wgb6Uyq6xvXcmx3wSEs7BY9MXg==
X-Received: by 2002:a05:600c:4f84:b0:42c:af06:71b with SMTP id 5b1f17b1804b1-42f6bec79b9mr10394105e9.28.1727687479348;
        Mon, 30 Sep 2024 02:11:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dec169sm97231595e9.21.2024.09.30.02.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:11:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: mvebu: use generic device properties
Date: Mon, 30 Sep 2024 11:11:11 +0200
Message-ID: <20240930091111.32010-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930091111.32010-1-brgl@bgdev.pl>
References: <20240930091111.32010-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

OF-specific routines should not be used unless necessary. Generic device
properties are preferred so switch to using them in the driver code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 8cfd3a89c018..5ffb332e9849 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -794,8 +794,8 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
 	u32 set;
 
 	if (mvchip->soc_variant == MVEBU_GPIO_SOC_VARIANT_A8K) {
-		int ret = of_property_read_u32(dev->of_node,
-					       "marvell,pwm-offset", &offset);
+		int ret = device_property_read_u32(dev, "marvell,pwm-offset",
+						   &offset);
 		if (ret < 0)
 			return 0;
 	} else {
@@ -1106,7 +1106,7 @@ static int mvebu_gpio_probe_syscon(struct platform_device *pdev,
 	if (IS_ERR(mvchip->regs))
 		return PTR_ERR(mvchip->regs);
 
-	if (of_property_read_u32(pdev->dev.of_node, "offset", &mvchip->offset))
+	if (device_property_read_u32(&pdev->dev, "offset", &mvchip->offset))
 		return -EINVAL;
 
 	return 0;
@@ -1147,7 +1147,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mvchip);
 
-	if (of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios)) {
+	if (device_property_read_u32(&pdev->dev, "ngpios", &ngpios)) {
 		dev_err(&pdev->dev, "Missing ngpios OF property\n");
 		return -ENODEV;
 	}
-- 
2.43.0


