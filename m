Return-Path: <linux-gpio+bounces-773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C47FF08C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29DFE1C20C9B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EC5482D4;
	Thu, 30 Nov 2023 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ACQlgKEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36571709
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:36 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b54261442so7786405e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701351995; x=1701956795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3aC6tvFROLQEKABOisLsa75C0gCr6RDOPC7pNb7PmE=;
        b=ACQlgKECBbmNJ5SZR2JUaKBP6q8LPWRFBCXLf9qwXUbxQ+cUnTVBlO/KS8IxOMR9Rp
         YB36nIHEGwVNb7ueBffSdUTjzA7CG3wHz6/kURsyV0utro+N6VBEDYgXCS0wftSJnQ1e
         z++V+ERzaNzk3JLvzVInXkEqHDUsZ+bsigBb/gr7xKOlMeAuD42h3wtIZ+3d1JVzbhFM
         B39pNiE7AptF3A2xXvCcxU+7geEbvFvQR84MoVBBa74Lab/lCRxT1Psip+nG5RGQsYns
         EmtU+ltkUdeNUYfFFdZc71+PK03fjHEVn+ghjqRNrVbY6jRntLFKYArPOVjBPo8t5P8R
         qqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701351995; x=1701956795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3aC6tvFROLQEKABOisLsa75C0gCr6RDOPC7pNb7PmE=;
        b=dL8fvMpA/rIubpn4pzVlSncI1IlEB9vIm2JMcfbSAz9FkjGb0HfIQew2+cY3qFjZG/
         +EgB8Fy396xeLQZHhA2nPDB82mZWHPwAS/VNw96RX346APrOwWNxWTnngpwirgqeAexf
         4QJ+nm0hATdV+iTwzwdajTcOGKVrr0EPTOmSNTdDTo274b+RTlYWVpOfh0Jzee7+oer5
         gNh1lAlUCvmbMhCK6QqtZtJLBFPJHA/c/3W6NoDU9mAEa03OCCKQcqMRJRzcYDWz9XCS
         N4jYaHkRvCgtMKLSrYDzI3fVUiOQFJYRpdSa6mAhEwv0g6rT6uhImJPxWrm12nMLI9S7
         iiFQ==
X-Gm-Message-State: AOJu0YzQhcUSnJqmF6Oa1M72AaI0RSsn/eMnVu1Y/0lT4vA7Sq27gZe4
	UJzejjwV8I7n8Bl2ALPG732CxQ==
X-Google-Smtp-Source: AGHT+IF0bpeTIeKNyhc9pCzTWiQOgUngrn/XA8xT5i8FJqEN5xPoOohKNHf9xpHxhWtu7nBsx4Q2Ow==
X-Received: by 2002:a05:600c:310f:b0:40b:387b:1135 with SMTP id g15-20020a05600c310f00b0040b387b1135mr13398281wmo.5.1701351995242;
        Thu, 30 Nov 2023 05:46:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 00/10] gpio/pinctrl: replace gpiochip_is_requested() with a safer interface
Date: Thu, 30 Nov 2023 14:46:20 +0100
Message-Id: <20231130134630.18198-1-brgl@bgdev.pl>
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

I plan to provide this series in an immutable branch for the pinctrl and
baytrail trees to pull.

v1 -> v2:
- use DEFINE_CLASS() to register a destructor for making sure that the
  duplicated label doesn't leak out of the for_each loops even with
  break;

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
 include/linux/gpio/driver.h               | 37 +++++++++++++++++------
 9 files changed, 95 insertions(+), 48 deletions(-)

-- 
2.40.1


