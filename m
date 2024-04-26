Return-Path: <linux-gpio+bounces-5898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A68B3E7A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 19:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77AE728112D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 17:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B673D16C688;
	Fri, 26 Apr 2024 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jSdXXEwD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8095115E5C9
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714153265; cv=none; b=EFaWnWD2Gr+ayqxOJHI7aCqiyXq9t4GeWx2FdcS4ukgkCq/87eyDVBzPXCZjG+28zDXl4E064B6P8lI90/SiqD7RT1ZkYdh06OQH4/VktXbxpLWXRfQMTh8kabH3RU47eh9Ca1ylXQ5nmK6LILToYb0EbR/X1hImmwZUwpIzQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714153265; c=relaxed/simple;
	bh=RoM5VpMMXDPm1Y0xVkWWiqBrvylnuOo7Us4sceqfdqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eyE44HuR7vHMWW6WY36/u+KKpRgdRSsipv6qyNis9WJ9dQvsNBmIu2nywLg2m6duUNJY7aiP5P1JtEuAfGIy3bXdFq75UrgTIIPPKYdEJ2LlLh+RzhsqWZvdGegmm1Hif7Lza3pfsrA74Auawu+zrz8FYXQog8+rhk39rthZ5eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jSdXXEwD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343d7ff2350so1806270f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714153261; x=1714758061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U19fSV3SqZRYsjSjrsfNoLQoeYCl1riey6XKra83UY8=;
        b=jSdXXEwDm1NeSceTY3VNKHPHcoIXaz4UcOedN7TRhFDDC9nSh2ebQZuyoeAA+27zUZ
         my08f3Sw8lg181/fOHvWlFt1x/o2q0WsK0CsTw3SjefRDdvML6hGAT6tQAWAolxIXA1W
         xc80xQSkJ4FemZOuQ2+WbD+X+QWirxu9MD3T7c2sm+BeBjLjjQDjjwundGlcCb0Yixtg
         i+BGCfe5V0Zqrt7+mX6JpbdtjwXTU9u6IvFOpmQ5tURocwrfrySfkF55rVPQBd5+ab8b
         z9divMCA0DmGgFu5NhX9Bo3t6wU5YWon7GFzW7CLp0dKlk7WHgC3t04iQHSK++l2C71F
         ZFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714153261; x=1714758061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U19fSV3SqZRYsjSjrsfNoLQoeYCl1riey6XKra83UY8=;
        b=JPtR19EWQo/g4R9M0KKChKA5zvyXmVWjg7nDOMohbEwehVVEh1HvzHKQBF+ts1pPe+
         amw2x9zouNu25E1PX3Qn7CnRwvunm8SA3a6M+j5597NgxMGOOIZdk0dbOrWHC5FLmUYi
         ThS5CahL52gWFP7606+JKR0xUwpbAsDIx3ctnwJlTSxrlvvJc/nTdSHPHaUazLRGWAQc
         2HhJuROvuKONBtf/ofDNtBDit7CsEaMzRNLXroaxgeUHuvqYrNI+qAOJTBCjZOoCzdm/
         fTV8Etc4KNdyduDR6DGV3l9bwc8n7f94w2Vjw3Mulbe1EBzqJ7r6MkvnEcCH/Jfj1NxI
         UqCg==
X-Forwarded-Encrypted: i=1; AJvYcCX/q9TOySsL4/uGswU/sPFdF5tBq36uDq7nzbuoIFK//hPZLmPpNoY9BesUsr9vTlVuEu8tKAHTBk8uw6sP1Az/1h4fs8hBOi2+Fg==
X-Gm-Message-State: AOJu0YyHcgMh+1fzYm43GjpE+pzXgWE+ilSe9ASoGfwGXE1E7qcOTNJO
	5ivwTI/RKPpbABlA8IOk6OSR2CbrI0n7WZdhR94VzDCnhtb/HwXvlpOmBPqqU3A=
X-Google-Smtp-Source: AGHT+IEO0cldG4YPC251ajgLzX8hYxA5L0sBy9e3dvah/s13N8RrVN9se/hqbI+RQ47SSUM6b+M8bg==
X-Received: by 2002:adf:f8d0:0:b0:343:9feb:25af with SMTP id f16-20020adff8d0000000b003439feb25afmr2604825wrq.56.1714153260681;
        Fri, 26 Apr 2024 10:41:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e63:d6ed:67ba:fbe4])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b00343826878e8sm22867439wrq.38.2024.04.26.10.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:41:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.9-rc6
Date: Fri, 26 Apr 2024 19:40:58 +0200
Message-Id: <20240426174058.28301-1-brgl@bgdev.pl>
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

Please pull the following set of fixes for the next RC.

Thanks!
Bartosz

The following changes since commit ed30a4a51bb196781c8058073ea720133a65596f:

  Linux 6.9-rc5 (2024-04-21 12:35:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.9-rc6

for you to fetch changes up to c714fcdf5b75f63ab27cb5071747194e5ada2433:

  Merge tag 'intel-gpio-v6.9-2' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current (2024-04-25 14:35:55 +0200)

----------------------------------------------------------------
gpio fixes for v6.9-rc6

- fix a regression in pin access control in gpio-tegra186
- make data pointer dereference robust in Intel Tangier driver

----------------------------------------------------------------
Andy Shevchenko (1):
      gpio: tangier: Use correct type for the IRQ chip data

Bartosz Golaszewski (1):
      Merge tag 'intel-gpio-v6.9-2' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

Prathamesh Shete (1):
      gpio: tegra186: Fix tegra186_gpio_is_accessible() check

 drivers/gpio/gpio-tangier.c  |  9 ++++++---
 drivers/gpio/gpio-tegra186.c | 20 +++++++++++---------
 2 files changed, 17 insertions(+), 12 deletions(-)

