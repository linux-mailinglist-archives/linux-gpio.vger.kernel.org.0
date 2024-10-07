Return-Path: <linux-gpio+bounces-10943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC199294D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAED11C22CC0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 10:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8411CF7C0;
	Mon,  7 Oct 2024 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XEGeSGfG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B118C013
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728297290; cv=none; b=mUb0X6B8PBrgNCrw8ZcoOjJfogBxTVkQUwPMBs6qMSjoRZ3yXVJP5q2j29ZKHa9p8Jssppfpkr2rHPv41XdSN0nXvIag8FObWVqxu4sr2oViKe5xusWxnGC1LzxlQrK2wfm8G2nRSz7qpHpDtN8y7rMNme+aL8fEC0+LRt+eqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728297290; c=relaxed/simple;
	bh=1qPlnzcMGjfYtKZcC+y8Ac/zKIwCECeIicdIk0nKk6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s+sCECiIukdVGzYFmJ4oLFX+gDZ2381FAnyq5V3UtRxnfyPTNeYztakwJaMThQPUHBVtrjO9OSWnXULP+vGcR32MZL3k2hgiKGrgod/dVEe1ghVqlTmYKdyBSLWXWXaaY63qU1XIPRhNwyHHbhsSPC0Xfvd6tRAyqAb2/MpCXUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XEGeSGfG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so43311475e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728297284; x=1728902084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRttM15lACyttOFmnb/OMbzHtGbNczmJy3XXf3scjPQ=;
        b=XEGeSGfGFy45yePMJxURX8fuFQvwbC7iiQmwT1n0WVmkyb+9t4i3fy4bEF48njHXba
         772s49sRzVJb64BFViZl7jBfVq79NNTI8GOpiaQuLkwlMDe/iR17mtZ1Ej2LFvIDGG2I
         kS6oT5AHfKCOyUiPdgGq0GqHIJxp840Pna3z2hn+pU2IfmOX7ntLlqfiZMgGFMAWe4BM
         9RHDXA0vrDV0lMShKesijtjI8FX5I5KLM+eTJc7thZThectK1Kl5oS53R1FmuLaLFq32
         w+hS+3E6jbcPqB7U0JAw8JoU6bzmSwKWbhfTni4v/GSBqyrzztQvwp/H7qovt4aVDVD/
         kf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728297284; x=1728902084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRttM15lACyttOFmnb/OMbzHtGbNczmJy3XXf3scjPQ=;
        b=uc5y/1/Ph9a5f0UUOR5tSWTkB+Qv5IgGzt/hP/BnFqiWSe7ynbHCv0JSPhxGRxetyv
         jlCxep/oDUKLjo3x6SFjyfz4YHK4xR9lWWHaGiQdiGbibpax0usc08lviwT3Aom2U16H
         DdvnCNTmL+elLkwPpASxyG69ZSrmfWbHaVRAqTz9oovb8KJSsbgewE8KZZowpxZaqko8
         C0En+MTt4WQo0c4gqzUhFtliq7DmSmaoh5wfzbFthGfSdpbMZPLisbdnFUPzNj0bQ0jC
         x2Gh4hf8nDYiVlZz6u4V3WI47f3NnYdArB/dMmYj7hxxhSN6uOX2++du6elRucFrBkQ7
         s6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWjkwDwnYTBNdgLs+EGf5X6ZLFcGONl4gzsaHjJCZenBoctYigrLTt9GGP/uHCvQBYyM21ZpLoe5vPN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkjv52yMnv5Xlouar9XCLs2lCZYwnnIPwE/gbpsUqIsUwXqLuL
	w1NrXgGkXIxBUTzAQgg1kL5jj5rkL8ktFsURhaizO0AM03kZDK2NpIkNR/HLGUo=
X-Google-Smtp-Source: AGHT+IFbZ4vVupz3Z0AyGdqcEjlQyrpqCoFOFGurA7FovfZmkUQIYEZk+qKenthhIBMvVS2W2Ec/1Q==
X-Received: by 2002:a5d:598f:0:b0:37c:cdcd:68ac with SMTP id ffacd0b85a97d-37d0e8f74e6mr8254107f8f.52.1728297284165;
        Mon, 07 Oct 2024 03:34:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16973c2asm5423555f8f.111.2024.10.07.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 03:34:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] gpio: davinci: allow building the module with COMPILE_TEST=y
Date: Mon,  7 Oct 2024 12:34:39 +0200
Message-ID: <20241007103440.38416-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make it possible to build the module when COMPILE_TEST is enabled for
better build coverage. Stop using of_match_ptr() to avoid build warnings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- stop using of_match_ptr()

 drivers/gpio/Kconfig        | 2 +-
 drivers/gpio/gpio-davinci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d93cd4f722b4..54770c917638 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -243,7 +243,7 @@ config GPIO_CLPS711X
 config GPIO_DAVINCI
 	tristate "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
-	depends on (ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)
+	depends on ((ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)) || COMPILE_TEST
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 76b58c70b257..1da1d7c7ac2d 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -662,7 +662,7 @@ static struct platform_driver davinci_gpio_driver = {
 	.driver		= {
 		.name		= "davinci_gpio",
 		.pm = pm_sleep_ptr(&davinci_gpio_dev_pm_ops),
-		.of_match_table	= of_match_ptr(davinci_gpio_ids),
+		.of_match_table	= davinci_gpio_ids,
 	},
 };
 
-- 
2.43.0


