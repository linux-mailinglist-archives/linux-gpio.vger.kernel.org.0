Return-Path: <linux-gpio+bounces-25842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E412B505D6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 21:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C3E91BC064A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 19:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC747303A0F;
	Tue,  9 Sep 2025 19:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDvXR8Km"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7273009F7;
	Tue,  9 Sep 2025 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757444686; cv=none; b=kwQHy7i3Zmk8wVAa0yVPwyr/E96uacP05qxEsMBhcDUTzRbehxTC7EkrS+NyHxxjxlZG0O0p01L1NsvaDkhXAccsvKXf8E3rCUEEhwxJ51etrsZThi3egu0nG/MmoW72rAqmkKOw02w3fv2BAp0ujU2+91HwlFjrI3QJUMaPQuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757444686; c=relaxed/simple;
	bh=9fXxQpn5wuAg5aR/rkNAmhWdIsYeyhcJcYmeZKN86S8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wg3Z7C0zvPDb9lHp7+f/WKL99gxzjXZyE0breAAHiOPzLhNafKNMx6iEKYUJ7M2MEvqtV5IPC3qBTHknYDXUaBrHk0iOG6/FmcKa+3xEcZpt9E+lBONnB6bWoDHTJReNWUaL/9kwTv46Z7ud+uF+4fxCVKTOX1IrJ1gRAVyCdwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDvXR8Km; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so38427905e9.0;
        Tue, 09 Sep 2025 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757444683; x=1758049483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GhzB0OEro6C+Ab4zuDnjl2RgZNMG68c3vMDXlukcxy4=;
        b=hDvXR8KmUmbuyFS4U9dHdhrgbvrwVKuw4b1f+uR4Wl1MLygDTqD8J1ZbzPR252RoJ7
         xQjndxMagxDQkjjJZBSLOcZ2TEN2ECjqznw2CFbNcqPg6rUy9UdvoTwFwC8uTVrrdQXS
         bt0GHkTT5LiaOm6KGlOM5qwNPLo3u/82j0+KVuQw+xK2L4SCFyYxdR0W1rctJ0r2mUap
         x6be1WzWrWZxshAgueL/OO1Ykp06rHPHmFU6uEc+rRlPaRxLzIwlJvJRbgg5BFpsChuw
         zKFcT9nrkU1p0x4LtZopADVzAYwdxn6m9/1vKGBZkNLvEvPXZ1a6YrRDNzrwDKXZkYG5
         KNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757444683; x=1758049483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhzB0OEro6C+Ab4zuDnjl2RgZNMG68c3vMDXlukcxy4=;
        b=u5e6etS0HPxi0U2sMwM0OhVLTBBfEiWOK/jnBn94P0lrM41sW6Rr0CNQxgcsFl7eLy
         UZjZSoZ8rBqNR3Y9t7mlYLBBljVTRUwTZHZjMj5m6d+LWbAvhEX3ug0JemXTpkbX7pkg
         XGSs1RLz5T+AC0+27shPGJ1u8ayjOXgbDSqsilgMMsYSrT2qW/McG0nrpfnefmo5hdEP
         KpLSlUwpYz+vSIMmF3Qdmd3BMOYiyPx/3TR7tkFmAhiVSEgC7KckHoI/GEpP3e3HsdF3
         5EKF0Y7Fa52EzVTCRmpvuh/WEuWt2T0RPSglUtmi93hXHZ0pedHs+HYGvEJi2CvL0fZ2
         WT9A==
X-Forwarded-Encrypted: i=1; AJvYcCVZIhtl/uonMNOh9QG5RHpHuamRzYToEx8q7893Hae+7ikmO7bINAHsnZTtulFVim4GFFrhyL1UUAV1CLbq@vger.kernel.org, AJvYcCWtsouv42lXd6eDFMuCRUDo4DRugChsVMs37s9vRqNtn0jN463QKacnr4KiA2+JCzz8jBn5d9I0kOKs@vger.kernel.org
X-Gm-Message-State: AOJu0YwYkXzAh3YyAtvqD5snLYKOdKaiDIZW4y7uHAJxdJjWHuZrrVCv
	P6UTErLQ37vJ3FkgIsHwApG00NLgg4/1PQvxJKznzPBzq8hF+OxzreIz
X-Gm-Gg: ASbGncs/IdkEJjh1YlG8VtEAkkLFuJ/e25Gm/K+WCP+vp2x9SoUBDEwgSkLA5eMoWn+
	LX481/2TFC8PPreap1SoGd5T8u0fJgeAErF+EOzIdmFnnzldQ5URxbCrLqb8YMjSZRI3HkAdlxy
	wo2wJWWgmCs1cvFrxu6CQsN05qAI9xjYyFKXnXSjCYQjFfedPxw6qmU2BaFu4ouDEm4KFyHtW1b
	XCbOYlMr5plA+MQI8nwfLJrzsiK3eTgKq4k2XLhTO2t1cXros+Kk5nnHTu4UO6ysSK+H6OCpekc
	eEmhbw1IEQVxBfaxNLUXj6HwhqY4euBtA6WWBpiSzlrVVUz1xJEZp2aIBviwSmxTLT0Ouar+KXi
	rCy3ZVyZlze/QDBt//eh3UIclOzP4Q0E=
X-Google-Smtp-Source: AGHT+IFofAuec90G176pP3cVIJSPBy3FefJKT6bJWv1ZoNX6Vi2TQc94eQQIy9PbJQunocF67lSoYQ==
X-Received: by 2002:a05:6000:290b:b0:3e7:492f:72b4 with SMTP id ffacd0b85a97d-3e7492f72e0mr7764781f8f.42.1757444682901;
        Tue, 09 Sep 2025 12:04:42 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45d468dbf48sm259596245e9.11.2025.09.09.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:04:42 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Yao Zi <ziyao@disroot.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] gpio: loongson-64bit: Fix a less than zero check on an unsigned int struct field
Date: Tue,  9 Sep 2025 20:03:56 +0100
Message-ID: <20250909190356.870000-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently the error check from the call to platform_get_irq is always
false because an unsigned int chip->irq.parents[i] is being used to
to perform the less than zero error check. Fix this by using the int
variable ret to perform the check.

Fixes: 03c146cb6cd1 ("gpio: loongson-64bit: Add support for Loongson-2K0300 SoC")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpio/gpio-loongson-64bit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index f84f8c537249..24b7219db34a 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -267,10 +267,13 @@ static int loongson_gpio_init_irqchip(struct platform_device *pdev,
 		return -ENOMEM;
 
 	for (i = 0; i < data->intr_num; i++) {
-		chip->irq.parents[i] = platform_get_irq(pdev, i);
-		if (chip->irq.parents[i] < 0)
-			return dev_err_probe(&pdev->dev, chip->irq.parents[i],
+		int ret;
+
+		ret = platform_get_irq(pdev, i);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
 					     "failed to get IRQ %d\n", i);
+		chip->irq.parents[i] = ret;
 	}
 
 	for (i = 0; i < data->intr_num; i++) {
-- 
2.51.0


