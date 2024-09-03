Return-Path: <linux-gpio+bounces-9671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB096A31F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4806F1F21C5A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34ACF18859E;
	Tue,  3 Sep 2024 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ILa+gD0F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C216262A3
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378342; cv=none; b=ptn8sBM3H1JrwVQjY+ZCXBf11nKr37Vi2b0NQucVTNNrsqwhGhuChGu67zYj9AqWr3lEArSW5P89qu6/P1T6wEUOXgQCHtSQ9uN9YuSu0h4BpwoWhskjoHDwhQFFi5MTw0Wa2SKS+8F5nFnmu3aGZ8YlJUykd/xhfC1phecyZVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378342; c=relaxed/simple;
	bh=7TGt3UVPR5EKU3qIHcGrhDfIOHmcB3omprSj/24NcHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n1C1menq/Ttm8je0uJw6nigU9cHsFtLfFZOJSyFYPrnZ0r1T2YgehMTcjvLabogbF2UZGh/vstR/hSyY98Xw/jN1pv7HSGYZsMg1vnVL7qljJu81KvaN9ahhhp/tGTGQpRNvejMbykmrUPDqDUXf7kESjjQ4xbgMczMoEWbQoaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ILa+gD0F; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374c5bab490so1618136f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2024 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725378338; x=1725983138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYFzd5wGbdUTzxf7kedk64DnlzYKL/ERNfiEExLtyL4=;
        b=ILa+gD0FcoLnXk7+D9bTvQHMH9oQ13Ekz3Zm8a6R4Zn+YzKoeJNx9kYNwKxwkhUAmT
         t+PrFsxq0LNe3KW7a1zmH+rR7oAgZB0sAn7yWzvFljv1YGmLF9WRzC07Gp2ZpmRL51RJ
         SjyLeL2fV1qreKbM8Fp/DTXYdgV1vInExkwXZaoWcr63rj8VOXAtCnlJrrD5KI/UMdVt
         tpadBjUYCR9bcrtJHt0TuiJoYJOOyl9ZUXUKaKuQneg1vdUD4PdkKAcmGLLGjXGPmtmB
         lSkEW+GKyrE/0B+/FTbpYtfSHPj12z2pEJzsvOKp7AeyyYiJoflOseYs+0jQFwXXe6oE
         +uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378338; x=1725983138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYFzd5wGbdUTzxf7kedk64DnlzYKL/ERNfiEExLtyL4=;
        b=BTkk9A5+AOc5pX9dWwF9Fm/l01NKaEuxm67eHhCCnxKAi3sAvPKxTRZNN092AjtXFw
         AwrScI1K3hKD7bUe9b5RcoOJnIXKv6RQ/6dUNvfFbDDTocj/I1taqRtOZvmN6iBp0IK4
         7gxLTAYs+4dRXFH9Ko7dyNmkztg0pS79QHVGEz1KQIQZtkCrFImrctufTXt0DlFf5V8Q
         lZtjsItiGoGkutGJ3ZIXhS9apvAsnjLbwNrNkNjZBDA1PjCc/vmFFO0KzVf5fS+usGNb
         Ajg7hO9t9XKvwij9JL+cz8RUcVUsgEBPIjwzyJexvul8t4grwa5+6lBNHM9m9WUFZU1A
         Zb1A==
X-Gm-Message-State: AOJu0Yx7s9fYgZx/CVgXx3oV9HsHXQPjaTe6nTviGdOwMb1cCXOzpmBx
	ZqGTDehwzeqbzy3j/WKxK0uafsv7ZXqMQbAGNKMELYB4dpLFqotRSyRLgb8I84Q=
X-Google-Smtp-Source: AGHT+IEW0aC2qwad1ogmXE2GwNM6XKUxHfftr2VPi/LGhbsi0QB4I7TotNYbuNGJrqQfw3bYVMeTvw==
X-Received: by 2002:a05:6000:2811:b0:374:cd3c:db6d with SMTP id ffacd0b85a97d-374cd3cdf08mr4333632f8f.6.1725378337099;
        Tue, 03 Sep 2024 08:45:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6a50:a260:3846:9065])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0a42sm172256465e9.11.2024.09.03.08.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:45:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Martyn Welch <martyn.welch@collabora.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: mpc8xxx: order headers alphabetically
Date: Tue,  3 Sep 2024 17:45:32 +0200
Message-ID: <20240903154533.101258-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Cleanup the includes by putting them in alphabetical order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index ab30c911c9d50..e084e08f54387 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -7,19 +7,19 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/spinlock.h>
-#include <linux/io.h>
-#include <linux/of.h>
-#include <linux/property.h>
-#include <linux/mod_devicetable.h>
-#include <linux/slab.h>
-#include <linux/irq.h>
-#include <linux/gpio/driver.h>
 #include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #define MPC8XXX_GPIO_PINS	32
 
-- 
2.43.0


