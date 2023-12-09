Return-Path: <linux-gpio+bounces-1151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9B80B61F
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 20:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC74AB20BC2
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 19:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFE01A594;
	Sat,  9 Dec 2023 19:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f8MhGJ79"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF512C8
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 11:33:24 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so3103021f8f.2
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702150403; x=1702755203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ax+CPYD5K6wJgz6USaugtPEpPJWFUdkJAyYQN6dMMgM=;
        b=f8MhGJ799saqtLyJd5olrI9yl10hVHKqa69thfkv6M7pafTfHUnD/V9wNEMt8Gq1Ir
         X0BrPjWBUZ7Ga3eZaIhQSOZLTjG8++MrPU/5pq18WDEfdn/YlIzRy5xQZpA4ir2GabfL
         hz3S7GK2rP4tlRsDFfYKZ4S1JyVIrhWvlDw8PH1pmnd2Fg6cfgCg+2qgqjJchtumuKyN
         fJNR8KfOK+xbdl/9yxnaAesHdEmSwnndborAp/9rdS0xzk17XN3tOq16eSvSJIUHVKmr
         0UHap2bNFkSb7QAZcJHfH5NG1frpjfFKQKZad3Hd+XCPYGn9Uid1aSAyNJHvGimnj8GK
         4Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702150403; x=1702755203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ax+CPYD5K6wJgz6USaugtPEpPJWFUdkJAyYQN6dMMgM=;
        b=fNqtq5OD94bjxEbGwqs4XnMOLm7AKF5QYaEC64rgx5jPfErGRZAjxKCJ4XoJNqU8n1
         s2Glw2HGXGYdC32JxC5wXlXvVanK13+2GHVufJyVHLSaaDwmMe6OGocSOQgvR6gKSkh9
         ivVYHEd948ztoAjjUskTUzV+lMAC4RYCAuBJXhVmXzlO8gzQ6YGW6oeHZ436NfHvgckS
         /cqjspCapwmiqZMV3LpZuX3mg1STO9Dc3DWj01MsEohIVnkSY28mJJEQpoP1/iGtKUP/
         FfSnBS+6DdYqBrFHLE/tJQ0KF0hvFmwvInQ+3nmimwnadMabf59lcKDNvQwtXb1Vz+Pg
         SP3w==
X-Gm-Message-State: AOJu0YxCAtqLOYOJMjXr566ITKL13d/KmvDWLMBkZx/NEUO0xkeew4Hq
	MTsrdTax4ct42hK3w9POiD0o1A==
X-Google-Smtp-Source: AGHT+IFkfgyL7bQt7RSB1bDm6so44YpOdEBhAMoQy7baymUbWWbwUaoFuYE9l9kDKb8M742mNtnMEQ==
X-Received: by 2002:a05:6000:194d:b0:333:e8d:99d8 with SMTP id e13-20020a056000194d00b003330e8d99d8mr1008539wry.36.1702150403043;
        Sat, 09 Dec 2023 11:33:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e0c5:4b67:54c0:c971])
        by smtp.gmail.com with ESMTPSA id l16-20020adff490000000b0033343b1ec1asm4926726wro.26.2023.12.09.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 11:33:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.7-rc5
Date: Sat,  9 Dec 2023 20:33:19 +0100
Message-Id: <20231209193319.6993-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following fix for the next RC from the GPIO subsystem.

Thanks,
Bartosz

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.7-rc5

for you to fetch changes up to 95dd1e34ff5bbee93a28ff3947eceaf6de811b1a:

  gpiolib: sysfs: Fix error handling on failed export (2023-12-01 10:44:48 +0100)

----------------------------------------------------------------
gpio fixes for v6.7-rc5

- fix an error path after a failed export in sysfs code

----------------------------------------------------------------
Boerge Struempfel (1):
      gpiolib: sysfs: Fix error handling on failed export

 drivers/gpio/gpiolib-sysfs.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

