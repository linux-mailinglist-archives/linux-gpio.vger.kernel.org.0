Return-Path: <linux-gpio+bounces-1821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8550E81CB3B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 15:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CAB71F27257
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 14:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081E41CA9C;
	Fri, 22 Dec 2023 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IExblT51"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6CC20B09
	for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d4aabc620so1642295e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703254796; x=1703859596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXQFp/gck9c6Nmkzo2Y6NIEQ8C8P8Yu/6/nlDIHiGXo=;
        b=IExblT51C4YfyV+awzjbtr7su33ZkxIZeTbZ3TD9NU8z+puoh/bi64unNqJCyZNtZI
         L4w0A4c8Ei/DpkwwyaV1m4zD6nppqoVvb6u0zELFL6qT703RhxgoEKgx3srhIm2Pj3nn
         iJBdrPbNMFcPzxxQEqZqUN0H+Lzz0l9x5Wa/zJuqa/cW0bUICc1t3IhNFS3KbBMoaPYm
         Zv1OK0aND1kW51SBtH4Flozo7Uc+zqyOncQBSwsF7SAU+xt08skqmJ5PkFAc11kh+Feg
         IuKMed9b/VL9AeEfu0r5pNGMaEBi6LECeDugzWKlL2gINQBj6ADPzUjHYMVfWbTfRKCQ
         40UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703254796; x=1703859596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXQFp/gck9c6Nmkzo2Y6NIEQ8C8P8Yu/6/nlDIHiGXo=;
        b=LRpxRFd/bXVIHCZKv0KD1vm1e/rRSB3VnQJ6GDG9nDb3JnQiuoJaUvGw12hH7bWQXD
         nmW0bvm9Tw9VeQnI/0J2d8+VtfYDblp5Ai6OTNVYfgy1T5+HnTzkG67Ph3DbOiQcM3h4
         G2mOwnVj1NNvXHCLWnUZtBXZUic/2OdT0/ImqWIXk5f6hKg9Xcg0mVmqymVzPmlAURfK
         Vc4vUV2KhFLKmVhYJ67JHESd4EH9r/e+JxdEvNzfqLZUqZBKSSsrFLhsFMy+Ly5DMjoW
         JJallwL7KEUdcvpqmRPsegc5f6Hkaz/z8fc7N2o0uMZ8G9CT3UCQe3JOZnw7iLVnaCqj
         86aA==
X-Gm-Message-State: AOJu0YzQs8DFff3fghVTYYpL+op07j5ee88TK1yHZXcM0IHoGaKT99IU
	pb295dxagWebft/8Zre1uJTpomfhiKE3hg==
X-Google-Smtp-Source: AGHT+IHUOd3iMWO2SfxiJZKIp226vCNzdenWdF/W1sfjX4uslziVsJnSdSoZj79/dbeWSGIxfrg2PQ==
X-Received: by 2002:a05:600c:1994:b0:40c:6d4b:2fa5 with SMTP id t20-20020a05600c199400b0040c6d4b2fa5mr850837wmq.63.1703254796389;
        Fri, 22 Dec 2023 06:19:56 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8792:dee:938e:1ecc])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b0040c2c5f5844sm6991395wmn.21.2023.12.22.06.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 06:19:56 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] MAINTAINERS: split out the uAPI into a new section
Date: Fri, 22 Dec 2023 15:19:52 +0100
Message-Id: <20231222141952.16254-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Kent Gibson is the author of the character device uAPI v2 and should be
Cc'ed on all patches aimed for it. Unfortunately this is not the case as
he's not listed in MAINTAINERS. Split the uAPI files into their own
section and make Kent the reviewer.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9104430e148e..2867da6e233d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9006,8 +9006,6 @@ R:	Andy Shevchenko <andy@kernel.org>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
-F:	Documentation/ABI/obsolete/sysfs-gpio
-F:	Documentation/ABI/testing/gpio-cdev
 F:	Documentation/admin-guide/gpio/
 F:	Documentation/devicetree/bindings/gpio/
 F:	Documentation/driver-api/gpio/
@@ -9016,6 +9014,17 @@ F:	include/dt-bindings/gpio/
 F:	include/linux/gpio.h
 F:	include/linux/gpio/
 F:	include/linux/of_gpio.h
+
+GPIO UAPI
+M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Bartosz Golaszewski <brgl@bgdev.pl>
+R:	Kent Gibson <warthog618@gmail.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
+F:	Documentation/ABI/obsolete/sysfs-gpio
+F:	Documentation/ABI/testing/gpio-cdev
+F:	drivers/gpio/gpiolib-cdev.c
 F:	include/uapi/linux/gpio.h
 F:	tools/gpio/
 
-- 
2.40.1


