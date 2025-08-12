Return-Path: <linux-gpio+bounces-24253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1176B223B8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605A8504F48
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F0E2EA73F;
	Tue, 12 Aug 2025 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GxfG4X95"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22D296BDC
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992342; cv=none; b=gRkJyj7/P3Q8wuporK5KTg6aVHlZxQgk1RFt/cpS1ToOgKDOhmHtUXG5G0Z7zLOfSpTPGwrvG4NhiGsb2WnWpuP36g7bBvKfcR01pyNapimqperO+k9G5MV7KnafpHZawq/R5RIHWmqhHLi94EbDp6vefQY17bfXEik6/mlpe8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992342; c=relaxed/simple;
	bh=weXYtvOJal0gfVKqkBOQyBy266M+SxjHRozHrgmLGEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3cNfD+ewZP3WvmP5VRu8aFL9e+i/VgLEbqpCF7gjocNH1IhXAyRinihegDgquMeVgWhq8fJ2WWnq8OGbUv6AtJDfKwMSpmiAJpMt35c+3zqpuDnZuJz6shmFSVCV1+lH7UQwI2CWNy6MXdPzdZzDjGr6vO4X3/qHBjUgJ2K4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GxfG4X95; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b7892609a5so3045450f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992338; x=1755597138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=GxfG4X95Hk8shEG24aBKG6mb0hqK9C0n8HorxVjuQNG+4lzVJJTYYM9QfQSrP0tQLd
         v28pOaeTeSTHP9Mj2ajvUo+KG94zK/ArGE13U1vIZ38/jVJG+LrxvV6WQtwXh91vxX9N
         rnFvPrQT86+G9jRIojdgTGqzRl4I9BdPxosPky1NXkg6bbO+MxzgY3dwULx/Zdb9XfSO
         WsiF3eE/mdbdE8k6ejQh0IsHv1w2CxgFdYHbfYJ2am6S7o1o9nZR7CYDZqLChxDntKdE
         +MokUkMrjVeFMIai15rRpmm+cAWslQ65Z/4YrTK7YpDK1+OvmPrtSutgOrDMcBHDeYT1
         3dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992338; x=1755597138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=QNyMBAS8OgvzgLmVdvRHRrB8LxQPe2a2dQQ1nXmt/JdpERUPXvMcW0MjtFBTCSc3xr
         kH8PwfkdKY4TXKUipbjAmYy6c/TeTSDtBFMOp7dRxWVEijc9rlTzlkx1Zi+7buwaiGl9
         rYUW7JX6wqfD89ybWvGcNnU+UKuLdWe57dEbqx9yc+Jp2k413fGGBWnkuTuKZjj3Ea3n
         zTTuarXPO2VCZXOeE64+7DVXh4USmo55geyUpNtAyBfBjXNJmMbzvIuvpwMukY6KopCH
         HTCeZYWN3rk7pTiEPvRz91zGK2iPy1j37BrM6giBEwD/ghzh+2cuUE2LBopW2yRgrwrM
         p7lw==
X-Gm-Message-State: AOJu0YydzB5L4CTISzRXLZBRatPCsisUKQC24qcxxq3NAWpssHzyf5LS
	8f6UJTuzJBZj/XQXctji0AzjL9ybx95tCoaD2MK6i1vpb6RjgCw9NwWEmeHEKC7QovNCkBayzmF
	m/P6h
X-Gm-Gg: ASbGncuh855mzGrAnNnHnQrNNCXj5+Vh5W2MWmnyCZdfo0NOP4ZUhNuAp+wJ6Z9+pZu
	GgOtqONIzlwxDgci+yJ0pZEvSc/CyTgeidvRS43+wSSc5rE9snFgMiQtfBpG5Md+M8AcPgnCf+o
	dF5HyfqBnx43iC2YZZ4j6air2BUApVM4vdj1I3HiUJczG6UqH5gubpNSAG4lr6IYr8I1bymzh2F
	kH4BP9i+PXqlE5UeowJL8daFH+6Erf9DJiFJG7+uIZar5UyT/+oAjm2slqc08OBEyQyYxbWcbLU
	tEtLQ2MUzC90wQiulZMHNBbGWSPdKD63LMdfn9kT8VEj2pyalv0d47hJ/vy1yQZZrRaY9gWFpUI
	NPzDloZ0DSojAxyQ=
X-Google-Smtp-Source: AGHT+IEDkb2zYaOQh3qOMcQ7k9tD4E03pa0Qq/HtC6R2/6gV+8zZkb6gglZn1kajQMc54hiPXB8tLg==
X-Received: by 2002:a05:6000:381:b0:3b8:893f:a17d with SMTP id ffacd0b85a97d-3b91100f0a1mr2413378f8f.49.1754992338055;
        Tue, 12 Aug 2025 02:52:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:51:58 +0200
Subject: [PATCH 01/14] gpio: generic: provide to_gpio_generic_chip()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-1-9f43e95dea98@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q7IZHV9NOU3n+seY+p1AeQbkCwKHTjI/3z6Qnen62yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7F6b/sc3xyJ9g01VwsG5+SMMxU9DyL9YZqI
 VZzjg+ppbiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxQAKCRARpy6gFHHX
 cp7xD/9OaD6zx8qjk4ksBh1Tv9mnlo8kv37xfmX8Jlr72gj0e1Vnv85wGsZx5aOIosq52KdJmfh
 5P3ZIzyWm1BD7s0FIJiqruiIU5+AHeA23FQVWIFB+DDqXcFGaenms/cityggjNSL9JzLdFLMZ5I
 rY4C2MeUvpy6erMNED2GRhLvehwwvno9P01KxHqw7YJGkn+hYkET7YZbmp7okNxIUtcUmS8cALS
 x10LykGNyEX6Kt0AeCyj+VaFTCtAD1Hr+yoP2EpAQmo6PKMrQO0vIlM68rv7mAd5LyL6TiA1XZ5
 yJ/l+zKY+tmOZiUTcakNlFccF8qlqPCa9CiBjjoQ5QcT7H6RX3EPzYzlq7RcSA4CJV/bhPls8i4
 MYp+qqty3toPkf5rsiWBOMQRk8Ma92Tow0U33eNjUhz/nbwAq4zra2A6/e8k3eOZ3bmvPIk0fzl
 fjdAZMmX8Sx6Sf9rpZmcYnxAkoWh/7Gs72mq+TTLy5PGVUUFPljdug8wr0XklE/6VviOIhFNRON
 EQbsn13LaAFgcEfk2vxkWbdu/PsKG8JhJkEwM9EafQaklDSZLEWIQQyBIKNU6kP86Jpa1cDvChI
 0QbwJcLjkLpTO1asQ4eiUnwBTbExico5+jZwkVslMW1qzcxdNblPm/nVJI+P4IW9kl/fo+yQ9sp
 uC7NZ1+J+aFd/IQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a helper allowing to convert a struct gpio_chip address to the
struct gpio_generic_chip that wraps it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index f3a8db4598bb59f1dba4fbebace24dc10be44ae4..5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -55,6 +55,12 @@ struct gpio_generic_chip {
 	struct gpio_chip gc;
 };
 
+static inline struct gpio_generic_chip *
+to_gpio_generic_chip(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_generic_chip, gc);
+}
+
 /**
  * gpio_generic_chip_init() - Initialize a generic GPIO chip.
  * @chip: Generic GPIO chip to set up.

-- 
2.48.1


