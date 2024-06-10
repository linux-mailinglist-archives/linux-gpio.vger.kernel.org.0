Return-Path: <linux-gpio+bounces-7313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B590239F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6FAB1C21971
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 14:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5A513DBA2;
	Mon, 10 Jun 2024 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0oaAQD0e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC383139579
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028361; cv=none; b=aB8tifvSLeexD/+mykFHbRiSeKiMH0nzPU3AZdFOQXXm53sWPtIlb4zS7mDT59/VTB8+CZ9QZGyZ9h9V2bVsRkLTkZAn0MJbjYqymE/vzp98B70cbCdH1nCmBSFaU4nC1Mqh9tOG+CMO/h/DvX6+zVqdwfVv+7kn1Ow8CqAEMtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028361; c=relaxed/simple;
	bh=lAjgY8dLuGdGC6Fq7V7WChrbFC9MFhsTo0rHF9YQN0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeYhfIxqLF/yjXbT4P6KFBZM8sJegGwLcwys7obe3UKEbRpEkVx4Fyt7Eh3tOTXwfluXHCeu3Zt/A5cJQKKBipjotoQIN3JnmmmAL7BVaTNr11F9u1y4qtIMuOfIc98EMppYTpmdn7NyfBgcMbl/tLZbO4V5ptj3RKQUI2GPo5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0oaAQD0e; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4218314a6c7so10038345e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718028358; x=1718633158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVPCkYxQUdy/Awp1hNg9f0j2vh3RYT3ZP4TiIfwhU08=;
        b=0oaAQD0eFm2O7LnRHGPb2u9UP93GavrJIzEEEPv9bzPI+V0AWIfBfulSdSWR5QO4ae
         FUyt3BZrp+j1w9M+AZJc0AkZkjli6lhcDVPW0quMj8r/bARCnM3+VSFRfKGCbGQIu2lC
         FAi5aHiMO7ox9c5WAhBf8BsRvvA71LJXron23d8Q8hyp0QloDG2GW2fRTjsah5Mfon3B
         U4ACjiwZMeO/xWFsiRyxAvJIp3Elxw8tlt9+XfBKsO0YT9iPWREuBTvoxXgq70IBUQWq
         iLVeVEsCbeZR8RFh99g+wmCm/9djs2zFZw0rVRC1alfJjLMXMYc2kziest0U3cZXF+jE
         QANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718028358; x=1718633158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVPCkYxQUdy/Awp1hNg9f0j2vh3RYT3ZP4TiIfwhU08=;
        b=Yi2B6PYR7Fn3c41QnzDEIxZ0uqgU50ak1C5jyt9TcsKpUvLP9AOTj/TsyCmOgG6Yh4
         xn0szJd+yOmDGDXAYiMJZQFtp5YXeS/+BwGIDThnNlwp4mH0i7qo6kbyaTgl+cJXJAmr
         CSrJ7eCZb6kH01isTAiQhj8SrEFG0hwMt3ldgXVJZu8/F9EHzsaSrwmC3Lk16MMufitt
         NBmCIabnoLtVGmWpq7Qlz6+8zi5iPuyccGZl2IqjvChHCa7a4rVy1dzzGoOy4YkGwnFP
         tEiOUtPFOgXXFG1Ft1eBq366/h8Jb/QBb5LrFk1kdO33LKxVE38BGE4qjVPYPIoaOwdh
         8rXQ==
X-Gm-Message-State: AOJu0YzJHPT3JvW/TPK+aSwfLG5wbWsUgMcuNlM2TexICRjzayiYgumX
	olYu6RMdDq+f/6o1dOQiwB6n1BdeFt10e29N4rpAO2RQsY6+GgnWrKk5to4MHG0=
X-Google-Smtp-Source: AGHT+IHD7s8aUeZFgQSwLCIb0ucUJW0RSs7ARnvz7bG/avi15niU4ozU0w+/RzMjvzMj2Z/DM2dJKA==
X-Received: by 2002:a05:600c:19d3:b0:421:1165:f240 with SMTP id 5b1f17b1804b1-42164a368fcmr80385025e9.36.1718028358448;
        Mon, 10 Jun 2024 07:05:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:b790:b49b:9038:8e99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42217ff4302sm11113845e9.31.2024.06.10.07.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:05:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 2/3] gpio: sim: drop kernel.h include
Date: Mon, 10 Jun 2024 16:05:47 +0200
Message-ID: <20240610140548.35358-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610140548.35358-1-brgl@bgdev.pl>
References: <20240610140548.35358-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We included kernel.h for ARRAY_SIZE() which has since been moved into
its own header. Use it instead.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 278bb0c54636..21ad8d87ef04 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/array_size.h>
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
 #include <linux/completion.h>
@@ -20,7 +21,6 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
-#include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/lockdep.h>
 #include <linux/minmax.h>
-- 
2.40.1


