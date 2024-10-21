Return-Path: <linux-gpio+bounces-11723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B209A72BD
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 20:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C345B1C2172E
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 18:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A4D1FB3D4;
	Mon, 21 Oct 2024 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IVyWo0Ud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42961FB3E4
	for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729537046; cv=none; b=GIka6LmFWLPKb0OdQcX+kaJTvjh2HeD6Uvn2RESO9rzcR6sCGPWYPr8j+w5qWhzni1/9Gtn9FpmwLAjA3y9671HnrVwVAn4kkK11en6xvhsz2nTk62Y6hRiLM1E7exzbVTvNh/38M6OiH0m67NI0UOjbUENO1LWYAfkRnyOmuRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729537046; c=relaxed/simple;
	bh=TxxzcHfeKLyU3QcpuXY3KcGqjJ+YUrGmR6mLM7IqNDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGAP7VsOZgwWR2F0XlBC3+pvrluyQJk3a/LIgSwm+rR2hLKHK+7OD3XYD0cyc4m5QehSN8Sl6F7FIZDAC+G6mMW+EEdngovmP7F1rVOIuaZ0gHVcdo9WoZ/8FPGXWkK29lTCwj3C3zzCTtxBj2TjBivDYqhxha9BPtZkzaP6leY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IVyWo0Ud; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d50fad249so3714350f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729537040; x=1730141840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zc3aJSlNwgLYQEkWHVoE01BInGeXq8mApkPce6TIXVQ=;
        b=IVyWo0UdlzVypra9dBEUbtvhIbWQCGTlnDjQRfgHespWRj8zUM2sdMyUaGeXu8l0ek
         7rUW9jxzKPgcsrXuhPV4nkYjNTS15giPoFC7GsTG8l9nls0hpv3QAVgqjqFyKS0IVOLC
         pwzIN0JZ/ptQyo5S0lWtPhJaWBshVhGrqeTQD2DvOJpYPWBxlLz2WRWh8eYUZiqKQs9B
         qtTJapuIyOWzl/NllzaBFOe2oSNPL5OvTJ5SZRAKvbH7wfNQSd1gIyyf3Cf1yLnZUjjY
         ihO+6NujKSwnYNvymFLRZ5Ep9pn+kcI3uCdEn2rac+mNIukpiC/3I6yJADPrcAcNy4/p
         0oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729537040; x=1730141840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zc3aJSlNwgLYQEkWHVoE01BInGeXq8mApkPce6TIXVQ=;
        b=aLcxM7YBSNm/QPaw8aWRnl9fmKSsCU1IgI9J/G2oDPQ+lTx+15dI4r22wiOrlDlHBx
         xwCLsqXnrNz8UAzmQMpyjT57zpyXrKU/o3aRiB30D/ppdOtzIJEjpS6e9q7efLN4x89s
         tHoCnUGvKKtT5ZpD6Byqw6d8M8dkF5CeGRpLZc8mhrU5TXaBK+mbkPx+J4Wh7i+WxR1T
         KKMIyyaSu+iWv1d+a/FWeYTu78XlSOCqqnWt0VXlCfsP5gq48fcvMQiB6cBMciSWosil
         wdB/v/SDI/wnQirdmM3X8xkbVBVJK4AvySWqFYpwLQcgLiTvPoCRGncQNLkMUAPjjGhS
         6ymA==
X-Gm-Message-State: AOJu0Yy5gprBfbPS5Qbo64Ekhq+hkCcQcdUB+j0EY8aHrGTfGZ9RtPcP
	/jRZxG6MTUbHhdGqP+q3uDEmVrEFEXyzPc+3JiRjP4y9IC+GNE2lZ5pZ85qtq9c=
X-Google-Smtp-Source: AGHT+IHe/+/xVRAydjufypdlwdZKA9GsBvRARbH2mlwwo2P9kIO/bFlSmnAGVRMo1gib+ySAkeHhvg==
X-Received: by 2002:a5d:46cf:0:b0:37d:45ab:4241 with SMTP id ffacd0b85a97d-37ea21ddfe0mr8816730f8f.12.1729537039865;
        Mon, 21 Oct 2024 11:57:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b40b:61e8:fa25:f97b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bcc8sm4919411f8f.107.2024.10.21.11.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 11:57:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sysfs: demote warning messages on invalid user input to debug
Date: Mon, 21 Oct 2024 20:57:17 +0200
Message-ID: <20241021185717.96449-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We should not emit a non-ratelimited warning everytime a user passes an
invalid value to /sys/class/gpio/export as it's an easy way to spam the
kernel log. Change the relevant messages to pr_debug_ratelimited().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 0c713baa7784..203fc3394afe 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -463,7 +463,7 @@ static ssize_t export_store(const struct class *class,
 	desc = gpio_to_desc(gpio);
 	/* reject invalid GPIOs */
 	if (!desc) {
-		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
+		pr_debug_ratelimited("%s: invalid GPIO %ld\n", __func__, gpio);
 		return -EINVAL;
 	}
 
@@ -473,7 +473,7 @@ static ssize_t export_store(const struct class *class,
 
 	offset = gpio_chip_hwgpio(desc);
 	if (!gpiochip_line_is_valid(guard.gc, offset)) {
-		pr_warn("%s: GPIO %ld masked\n", __func__, gpio);
+		pr_debug_ratelimited("%s: GPIO %ld masked\n", __func__, gpio);
 		return -EINVAL;
 	}
 
@@ -520,7 +520,7 @@ static ssize_t unexport_store(const struct class *class,
 	desc = gpio_to_desc(gpio);
 	/* reject bogus commands (gpiod_unexport() ignores them) */
 	if (!desc) {
-		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
+		pr_debug_ratelimited("%s: invalid GPIO %ld\n", __func__, gpio);
 		return -EINVAL;
 	}
 
-- 
2.43.0


