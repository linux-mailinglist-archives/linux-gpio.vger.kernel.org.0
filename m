Return-Path: <linux-gpio+bounces-22887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD4AFB59E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35E717A2664
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 14:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41172BE052;
	Mon,  7 Jul 2025 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="noqxNW+9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189452BE027
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897603; cv=none; b=gCjlhuMphXY/DaccVtJkbHV33IMR8LNTSmEeB8wXqYj5hZrblsB9mOmDUCHZo5VnxvsZa7AWkk2O2OcwqNLrlAdQVmYWzJnh4M6DBn0XqqpHE6MfvEZp6Ei3TC711bwtosezYPo0oz6wVXdZ7ZvokXmLumVcxHbb3VIpRzd9HUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897603; c=relaxed/simple;
	bh=6QVie9epf7DQUA+KY0cAKJiPyJXVBSPrBDVruRHiee8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XyElswfKq9VnPZEAIJvWWZy8Z3LSO0DWjJlCS0J6p0SSovrg2kJk1/oQ26zLeoRReE3KeSzy7gdCVyfA04Jh63mziuYaks4jDW8prkwPmRu9d3/gUaA6unEUfvFd7fG34iaFHOm93Ai5wFZSO1FAeCSuuvOIvicP3MT+fmbf1RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=noqxNW+9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d3f72391so32480215e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751897599; x=1752502399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUQUb0cdytPcEYjL71jupPDYAPz94y/HVGU9AuIPXok=;
        b=noqxNW+9V7iFfWt+Uvva8a232/ODI6fHvKhjn1yT/Tye+ZenR4s3CZCnXVOLOi/0VS
         E6Ok9va4M3bYJcY5PexfJerf366fq7Q5mehzKwG1nropt7Wn44/4s21n4hzBiHB7S+6I
         vN0aDC4Fi4lbL2N1NCN8OX+xPBDdc5R4ntNUzACCoBpEMEsxRBM9qYf99Cnjzujjkx8o
         EF+TN1LI4Ktw0d1VceERvYjAu20nOiDkruAF+uZxfGVASboyh97a05Bsx6bqeXlqFbxh
         pndAGgyHC//8pgLh/VM69TRgZClNal/u/RHVSbq9vCLkKcJCH49R6Xk5vt0dH6yN+7Je
         BuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897599; x=1752502399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUQUb0cdytPcEYjL71jupPDYAPz94y/HVGU9AuIPXok=;
        b=g3wFu0P5FcgCffWss4t6co4uyRJGw9CnOmVH0fYgL6oW1SC6KE8Rc5XWR+t1PIEh0h
         gENDYiOn8ZcYofugU/GmLVNM5dHDtkoqbbgRLUVjHPgBj42oyXrl7tZ716FGPMxIfEPP
         qxIr5LrivZEk3/W7yQx3EQfmkhE1KIjEOExYRPuHhUtpjlvHXdyHUkkRClneduZiPzsV
         3Z4c+/8zwc6qQH978ObYuFg6yXWY9wl/fdjzSy6PI8e7sQGJ3kPFaKXfwYYEy9UYaH1m
         nOTFVlbGmqN9mUap+G5grQ1WdcWqaoMMnVSZJCaPyeYtuv8Av9YwR3irNUi0QbD6uMvP
         F75g==
X-Gm-Message-State: AOJu0YzIMP3y03w2bFjpmPAzOeUeB+MXz/e4vkqXyAI+yZ6pZsLFyxyu
	9ItCRI/2KLxigict75Nbt/2qAz+dKsmNHoq4hXwj+UxldmEwtUX4MEslOpaIEUlkzmQ=
X-Gm-Gg: ASbGncsNISykezF0SqqrrNNfv0UP14SGQXlS0Pyj81rmZ228xiXScii6NKWqplygXg6
	tY/BXOlzAciNLCvaeburb37CrmeyQe8BIWve5lNXV/uLrcQnUZG0s8nZY3R7A0rU1UD170gJqjY
	Yy0bY2hDIzhmRSTaDwqUMPyqYOUkNojUeKttxMyCMc8FaiiQxr+LNhyZH8SmeXZDxjiqk0yzW8/
	+k2F0veP/L7Z8LZokXc6ibd5VxS7iiMQSWJl2peyuYJkHqBTkTi/Cr7CuiROmHkimKJtsA0yxQE
	5LD+/TeN26RI6h5x7tGUFMDqp0Tl1UeuheFAkGcSq9md3ES7d/svVdPYZl9dmiY=
X-Google-Smtp-Source: AGHT+IHCBHtw21niIsxOw8o5fZDzoZwsU6HTQSFKd59x1lgdKTm6Vg2cYVrpiS4hyCnwCJl2y8x3PQ==
X-Received: by 2002:a05:600c:64ca:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-454b306a15fmr133174785e9.3.1751897599170;
        Mon, 07 Jul 2025 07:13:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454adc71aadsm131670845e9.25.2025.07.07.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:13:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: don't use GPIO global numbers in debugfs output
Date: Mon,  7 Jul 2025 16:13:13 +0200
Message-ID: <20250707141313.73169-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

One of the users of global GPIO numbers in the kernel are the debugfs
callbacks in GPIO drivers. Before converting any custom .dbg_show()
callbacks in individual modules, let's first make GPIO core stop using
GPIO base in debugfs output. Use hardware offsets instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7b2174b10219..62694ec12a0c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5234,8 +5234,8 @@ core_initcall(gpiolib_dev_init);
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 {
 	bool active_low, is_irq, is_out;
-	unsigned int gpio = gdev->base;
 	struct gpio_desc *desc;
+	unsigned int gpio = 0;
 	struct gpio_chip *gc;
 	unsigned long flags;
 	int value;
@@ -5339,8 +5339,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 		return 0;
 	}
 
-	seq_printf(s, "%s: GPIOs %u-%u", dev_name(&gdev->dev), gdev->base,
-		   gdev->base + gdev->ngpio - 1);
+	seq_printf(s, "%s: %u GPIOs", dev_name(&gdev->dev), gdev->ngpio);
 	parent = gc->parent;
 	if (parent)
 		seq_printf(s, ", parent: %s/%s",
-- 
2.48.1


