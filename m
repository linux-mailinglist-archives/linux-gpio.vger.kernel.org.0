Return-Path: <linux-gpio+bounces-672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63A7FD93A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 632BDB20F9B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B72D3065D;
	Wed, 29 Nov 2023 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HCSsw1pE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B5FDD
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:23 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b552deba0so4031295e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267862; x=1701872662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl/Yt40SJcnA5LWZls34vPbbDSVAM5mPdOt7hL6FpRI=;
        b=HCSsw1pEypV0Hu2l4QCZqQAta1w2V1vy47SO7s+08955+Oz1OmNTzj275Ntln/437j
         ShosRgFQqbfYYC5MOf4ka5HcJuVLMPT1tCBZ3HykvZG7f62zZVg1zjC7Yzlzb7vGEoZG
         MSB5352k4Tbvf5YRPjEjYNzBrV3i1ecyakGWjIc/b/VHeQ/DIPJPLqXJGCYcuAwawcwO
         DzmPhk4Zv281btsZfsqig3nTPTW5d8okJVpfn6WYlPc/g0ScwHSbjzrXvWLpNN+taaql
         2HMw6kLjezUGJCEubPw9oV6gP+U8hA+Xa6U+7eysYBl8InXp9TF8zk74HJZM5xHW0qps
         K7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267862; x=1701872662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl/Yt40SJcnA5LWZls34vPbbDSVAM5mPdOt7hL6FpRI=;
        b=Y/9okJd4LHSB5jE5sAAOWdMxisrW92WEUo1vSiGVeAZ23sNaJ76aa8kRw7DCM/8Zp1
         OyWDnZmLbS0mdBR01Qlzbaf4ew1nuDWCk6XJhnJ5fLshNhZXzcGShhIbFPuCNfb6q9mm
         wmOe/ut62yVx5HNd9WCV0psXY5mXdrxFZ7ureV1n26hX6b9n6FOEB/15YxdABTLWmrjq
         /08TVsId3J3vlgxPqXL6F11AolCu3FZ5rqTU9ri5WD3rb/S2hcGBYmUZj694htOygzXC
         5NxpNrzmZ1nmdc17MqH+iooWR+zEtP8feBs7M5Ew14oyL61zX0tJ82NB1RB5dyFNVbEV
         FMcg==
X-Gm-Message-State: AOJu0Yz/GIeyIMxRu3vwukjPurAa7Bf14ClOnfAOnowtoYnA7TK3D0wm
	I7jjteZQfkko1lISm/xqUoQRwQ==
X-Google-Smtp-Source: AGHT+IG35WsLjeaZLdy7JZyPLZGHiE6KYTksm1nO/QmSfxKHydUEVLI3pIvA6iYQXeqVDIuRIRSKZw==
X-Received: by 2002:a05:600c:3b85:b0:40b:3e7e:af4d with SMTP id n5-20020a05600c3b8500b0040b3e7eaf4dmr9959596wms.19.1701267861770;
        Wed, 29 Nov 2023 06:24:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 00/10] gpio/pinctrl: replace gpiochip_is_requested() with a safer interface
Date: Wed, 29 Nov 2023 15:24:01 +0100
Message-Id: <20231129142411.76863-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While reworking the locking in GPIOLIB I realized that locking the
descriptor with users still calling gpiochip_is_requested() will still
be buggy as it returns a pointer to a string that can be freed whenever
the descriptor is released. Let's provide a safer alternative in the
form of a function that returns a copy of the label.

Use it in all drivers and remove gpiochip_is_requested().

Bartosz Golaszewski (10):
  gpiolib: provide gpiochip_dup_line_label()
  gpio: wm831x: use gpiochip_dup_line_label()
  gpio: wm8994: use gpiochip_dup_line_label()
  gpio: stmpe: use gpiochip_dup_line_label()
  pinctrl: abx500: use gpiochip_dup_line_label()
  pinctrl: nomadik: use gpiochip_dup_line_label()
  pinctrl: baytrail: use gpiochip_dup_line_label()
  pinctrl: sppctl: use gpiochip_dup_line_label()
  gpiolib: use gpiochip_dup_line_label() in for_each helpers
  gpiolib: remove gpiochip_is_requested()

 drivers/gpio/gpio-stmpe.c                 |  6 +++-
 drivers/gpio/gpio-wm831x.c                | 14 ++++++---
 drivers/gpio/gpio-wm8994.c                | 13 +++++---
 drivers/gpio/gpiolib.c                    | 37 ++++++++++++++---------
 drivers/pinctrl/intel/pinctrl-baytrail.c  | 11 ++++---
 drivers/pinctrl/nomadik/pinctrl-abx500.c  |  9 ++++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |  6 +++-
 drivers/pinctrl/sunplus/sppctl.c          | 10 +++---
 include/linux/gpio/driver.h               |  8 +++--
 9 files changed, 72 insertions(+), 42 deletions(-)

-- 
2.40.1


