Return-Path: <linux-gpio+bounces-1788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F4E81BE63
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 19:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CEF8282BAD
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 18:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EA164A99;
	Thu, 21 Dec 2023 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="swi0vRw4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D2D64A98
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d41555f9dso5478215e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 10:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703184201; x=1703789001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9prIx0x75i3yA19ZQlbyqFnaDcFcCc2+BwEJ02WTlZI=;
        b=swi0vRw4BYWxBvG4KVUVF+pRpXWJUCHJqYbvM3OhOyroLd9AwqwlkX24Dy3ivMJDjP
         n9d/2Wk4Ah/R1qiIndPYOaQZZ9ONEpOMiIAHmlpTtFdm+YPntTq5hcbtmP8HoYzlDpGK
         2y9qcB66beC2P0fRIunfbNLR/8+GcNQYpt6TMimf0QO4lAkM/ObVfMzhjDZvZxiVr1P7
         Rfcaog3tspiwcuECzE5WlnUSlbgivnefmMtGonvaQ60pluwRplin3pSK2WliUsQl68QB
         1EFgBiuZOgrmNt/IyOiB7EazmbNMnWKYgWs7ENYR7aR75ePXxUNPtdJv+wDf7HLPf0yQ
         JHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184201; x=1703789001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9prIx0x75i3yA19ZQlbyqFnaDcFcCc2+BwEJ02WTlZI=;
        b=KVRgoYDf+WIvruBHHq34ULWTuNBDMKu4zHx4bcqLLtWbeRgObhgXsR2kUVzofKZPBT
         EuVOK9ph4iBpLJo4W0CpCkQgNqd/Q73vT9uNlkXO1o70fr+w5LNjT4U3vqwZtUk8MsS4
         hDbh+n25VPrtjic57uV66ed6xc+2IpwK276QRbtefRUMm/rbgEp4l72GVRI5fLimX+3K
         pxlCV+V3uSa/HJQgqnZuTa9EzbEiBRIkqjxF3acytp0Ch/T6QIPVsNm9C5pBI6RNqrqB
         VmwCMU4jkg23Dr4xLq42rdtTR40u957+Rq5HiJ8plwgq5qOE/tlLG2j4HKMKTmgZBXWV
         JG9Q==
X-Gm-Message-State: AOJu0YwLaU1dKyOBNGNPK5SaKpgT6ZqNtY9BMqPueMV0ZC8kfn1aSRAl
	Hm5Kcq4pBakk+bDR5M1JtlBewT6N5VQC5w==
X-Google-Smtp-Source: AGHT+IENwuUJNj2XOxqxCyvHYBTsmnIiHVSSUIF2AWbnh/BX9XLROMGAiuFxSqTFiAO1dLE6ZWcuWg==
X-Received: by 2002:a05:600c:4d92:b0:40b:5e59:e9fa with SMTP id v18-20020a05600c4d9200b0040b5e59e9famr78090wmp.153.1703184200735;
        Thu, 21 Dec 2023 10:43:20 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7701:a2c3:cba4:74db])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0040c42681fcesm4188059wmq.15.2023.12.21.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:43:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/2] gpiolib: use a read-write semaphore to protect the GPIO device list
Date: Thu, 21 Dec 2023 19:43:14 +0100
Message-Id: <20231221184316.24506-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm still figuring out how to keep GPIO descriptors coherent while
(mostly) lockless. In the meantime, I found a potential race-condition
during GPIO descriptor lookup and also figured that the correct way to
protect the GPIO device list is actually a read-write semaphore as we're
not modifying the list very often and readers should be able to iterate
over it concurrently.

Bartosz Golaszewski (2):
  gpiolib: replace the GPIO device mutex with a read-write semaphore
  gpiolib: pin GPIO devices in place during descriptor lookup

 drivers/gpio/gpiolib-sysfs.c |  2 +-
 drivers/gpio/gpiolib.c       | 58 ++++++++++++++++++++----------------
 drivers/gpio/gpiolib.h       |  2 +-
 3 files changed, 34 insertions(+), 28 deletions(-)

-- 
2.40.1


