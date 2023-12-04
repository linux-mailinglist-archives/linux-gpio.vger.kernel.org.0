Return-Path: <linux-gpio+bounces-936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC5802EAD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08C0C1C2099A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC2C1A726;
	Mon,  4 Dec 2023 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h83xtGQv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AA1103
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:13 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3333224c7b9so2279221f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682512; x=1702287312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bI9Av4U/SVdm3nbgC/vm7JEvEONt6G/9k0MCILqgaHw=;
        b=h83xtGQvBmHn3RyU8j9D/9/H+d1CQ9WEs3UAbKrLTFu5Ad5zc2pfD06kOjfKwNWEjs
         pVHdOvAo1u4NGyRoA8xY88aqF+Q+X5Unc8/+qxODmkVEk/VHMPIPB18RXdRMmlqcbUh4
         9L9UDL5y1eGb67DB3rFQzfGEF3LB6vGlqW2yuh33bPcRcpCfmakWTMWv0224AzqyXAzN
         SXWscdwIwT/KVxaXX6ySPuhWv3Gwf+YomYX94bNSyw9hr1sUto0qV3tdhNqxTN8Zl1Nc
         rpqxSRrCeA08RWQ6Z4/iatW1Bm4UnK22IgksDs9CYU2H6yGFlcP1Acxu4ifaT9EVyonl
         kBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682512; x=1702287312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bI9Av4U/SVdm3nbgC/vm7JEvEONt6G/9k0MCILqgaHw=;
        b=oF9FIDuL3IJW4TDnsPRr6jH+OsPsnMPP+C7ZTcl13wAoyFHXnCutZKw49GLOPNkDnU
         wE20JCkW3vXTyIGPCYl/0274mQF3ikdJZnieoBpxKaZ/aFIpG3Ngko2RdvJnMWCiFPGy
         SkQFUAMZ9PHlUPZy3pV5RbzSnlrkahs8vDrQXPJI04aNqwk3cEALrH23o7rZq3f6IbQL
         Rsvrsa0FdCPlgs3O2l7Kjeo0PTcwVN+6PaPR8XC4+8Czv83WBPkhsSsyuW9ZpI6co9Nv
         fGi/GNsF3y8XIBV+gAeOlxnhq3g2RPDtW0arRDWrCxG1WJjuN/HRo7i4kLsMwer94qsU
         jEUQ==
X-Gm-Message-State: AOJu0Yxhpe1LN5nkZ7fOyahEKc64CaqCsupDM/9+X6p3Uy33pjIWUFTD
	aYzJN0J6tzIGh8uZbJXHQzEo7g==
X-Google-Smtp-Source: AGHT+IH6x9tPhUGJ5LtE+rCyQCa941oA93WQ38y3dg3gU8kA7Mer2Q8w53ySrKx6EYMT6c64/gTSDg==
X-Received: by 2002:a05:600c:1912:b0:40b:5e21:e263 with SMTP id j18-20020a05600c191200b0040b5e21e263mr2205541wmq.80.1701682512138;
        Mon, 04 Dec 2023 01:35:12 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 00/10] gpio/pinctrl: replace gpiochip_is_requested() with a safer interface
Date: Mon,  4 Dec 2023 10:34:59 +0100
Message-Id: <20231204093509.19225-1-brgl@bgdev.pl>
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

v2 -> v3:
- rename a local variable cpy -> copy
- use unsigned int to loop over GPIO lines
- use an unscoped guard in patch 10/10 instead of the scoped variant

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
 drivers/gpio/gpio-wm831x.c                | 14 +++++---
 drivers/gpio/gpio-wm8994.c                | 13 +++++---
 drivers/gpio/gpiolib.c                    | 35 ++++++++++++--------
 drivers/pinctrl/intel/pinctrl-baytrail.c  | 11 ++++---
 drivers/pinctrl/nomadik/pinctrl-abx500.c  |  9 ++++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |  6 +++-
 drivers/pinctrl/sunplus/sppctl.c          | 10 +++---
 include/linux/gpio/driver.h               | 39 +++++++++++++++++------
 9 files changed, 96 insertions(+), 47 deletions(-)

-- 
2.40.1


