Return-Path: <linux-gpio+bounces-1115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A73EC80A07C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 11:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429101F216F3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 10:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9CE14A98;
	Fri,  8 Dec 2023 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DQtsWe5G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D38A170F
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 02:20:26 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3332fc9b9b2so1759258f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702030824; x=1702635624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LI2cPVtpfspTOTHLatTsMeq1yG49Tg1pPBonSn3WXmM=;
        b=DQtsWe5GEiwk/RGOgQYa3ghTQuUTZMxpZU4aeKBhZ6SbyDqyqHeuhICCiw4jh9zzuu
         Bss6YXFC0jeH8X8ubeH4y7FUlxgzaMIeV+kJBus3T1t9MUf3nwalqlb/n4eQArBFQC1u
         CT+dgvRUCo4AJj9btZNMTmBi99BXgtma7c6D/mQzDdR3H3H6H1fK16wmdhxVDK3mEmia
         PwbueeesmwpnQWmELFQm5sNL+Hp8VNYPPQ8lcyZ3vIA9k1CXuJSFQoIT03Goo2tfWe1j
         JIdFZ/xqf7Qgj1u/emIY9JOq9eJoox/nxQkJhLW5RmrvYVPyMk2SJu7l/fi4OFXzk9bN
         Mfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030824; x=1702635624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LI2cPVtpfspTOTHLatTsMeq1yG49Tg1pPBonSn3WXmM=;
        b=qXC1Np99Z5f4/4fYKKFc3KC6dCw4bKEQ7lyEMXmyky5OaA9clHWl49niMdYE0+Nhqi
         OblSEO8amE6FFoq5j3JjlA3mruP8qwApDB3pZdndD1+r5VjnmA+kokuXp86H8z5NP46F
         HSKlCRmoOBdBqhgeM2OBzrZruwsRCKYPXiVfapXM5p1i/KrRkN/bIa8N879o+7n7gDKR
         b4jycZWQJqasFHkJFvKnYtp//J7HOoKDXuT4qNVnULKLwEHpXN7G5Rune1/ewjiqwemc
         PP3OvzD2pW+lV1uppqTIiMKe3hlQbbFfQS8O50Vs58+ZRlkvdKDYr+V00nl+bySckn6O
         MIFQ==
X-Gm-Message-State: AOJu0YwVtlsc0SAfaCcPBf7GYKHSmJB2KPbKYgB/elzdoS5LVouH0fAb
	+gRSxarMV2sHc5FMUGrKE1o99YQF7Dqi8cquYuU=
X-Google-Smtp-Source: AGHT+IFbM56mrm6YbDUOYY9EVLDFpuMqLJIZtsfB6U2sCK+rI8mTcbMUA4dKKEC0PeuK17ZtFrhJMQ==
X-Received: by 2002:a5d:4145:0:b0:334:bc62:4b32 with SMTP id c5-20020a5d4145000000b00334bc624b32mr608180wrq.224.1702030824459;
        Fri, 08 Dec 2023 02:20:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b162:2510:4488:c0c3])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4850000000b003334926fb81sm1678026wrs.90.2023.12.08.02.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:20:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] gpiolib: protect the list of GPIO devices with a mutex
Date: Fri,  8 Dec 2023 11:20:18 +0100
Message-Id: <20231208102020.36390-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I figured that - since the descriptor locking is going to take some more
time - we should at least start the conversion and protect the GPIO
device list with a mutex.

Patch 2/2 here is actually a v2 of the original submission.

v1 -> v2:
- add a patch renaming two functions
- protect the list in gpio_device_find() too
- coding style tweaks

Bartosz Golaszewski (2):
  gpiolib: rename static functions that are called with the lock taken
  gpiolib: use a mutex to protect the list of GPIO devices

 drivers/gpio/gpiolib-sysfs.c |  26 +-----
 drivers/gpio/gpiolib-sysfs.h |   6 ++
 drivers/gpio/gpiolib.c       | 166 ++++++++++++++++++-----------------
 drivers/gpio/gpiolib.h       |   1 -
 4 files changed, 94 insertions(+), 105 deletions(-)

-- 
2.40.1


