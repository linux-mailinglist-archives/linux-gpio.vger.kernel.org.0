Return-Path: <linux-gpio+bounces-23156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D2CB01B77
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 14:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61263B0212
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A83828BAB9;
	Fri, 11 Jul 2025 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iUAplJom"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5FA1F4C8C
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235573; cv=none; b=ao7ZMJMTwxMf7+ZAYvu2Rd00nOAHTFm1fz4qnP6PKNds0NOK1FgS7guDS0vEeeRL5rvsuoo2LBeBXcyOO/AXMHai/VJq8mNFs0WplVnp+7asxk+J6MsWI5tEErNZYGCOwtzr3oKxsAuMdKpeK/nlRCuPNEF/+W+z7PJME523ClM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235573; c=relaxed/simple;
	bh=iXtRVSFIUUjljA4kn9rwLXFz7FGravzJIwIhjSeRfeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AS3uaqeYZ3Kn5saFFKT3OmxOFnu73j9RGtZ0/tDi9UTYLGe0NczMmHPuq9Wni23l16xQkNC15evLtm+Pf9LqD/MScnwSdGqJEAtNw2EE94GopuxJfHbjA6scpqAvhrvtpYr2pQYDB+nLIXG4HppdaY/aEXqNceqfTlCLZwGmqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iUAplJom; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-455b00283a5so2831135e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 05:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752235570; x=1752840370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oED7Lfq/NpJ0WUfIln/mD9ee8FsPDCEL3Wuv+V8YXkM=;
        b=iUAplJomIucPemGwlB6iWiPWU3F44zF0h+ICy7fXdpA1rjz14pHx6ryTGtpOgf+a71
         2Vy8boR3Rqyg2Tg54Fl1ckJkNbXjGmeRyf6v6dB74i/J2XcEY7MpaFOhv1SAosEHBEDi
         Kll4VyGkzDQIQ8ZBl7cjYoaHvhWpicXaTbXGV9vsY5D41Hx8OFmm+nLTRAyJjxUhb57N
         HT5PleSr4pr+IXTztomOhiDNtS2H84PwW6riN8urKNEV54RH/PBdhnajnE2vrE5Ldxr1
         dQFh1lmMc0kBULgtrZ/6nLR1nS8pyv28hIZBF4rbYD68pBZUckAXhCmX6UkV1ULbybrI
         gy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752235570; x=1752840370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oED7Lfq/NpJ0WUfIln/mD9ee8FsPDCEL3Wuv+V8YXkM=;
        b=DELHtX9wINBZTPVW6zbR5VmtyIY66xEqIE2hYhHRsXLfuYkyNdWEM04Icm0VH4Elbf
         /CgpEBEh5nD7enMX3oEyQ5yZma6/DFqd4V5XS5tc6nSPJ0huMUM9rc4UsEkiLZTjKXEs
         5+N5+HgvPlayogw8HSYHlipKzLAQ7lDnWHyyA1o+O2w8vvI/yZFmiv4DAYxfEdCxyY4s
         PVlYVsNq6PNIJWfr7CElbdRhLskeI05GJXabPHRsy032gWqWM2wmE+tYyJ/8j412c5x7
         8awRkkdGYSbdzOzHXdY22FmkMgTUXrFPefeuAKjqzi3IijoDCAlalJcMJYO1yN9HOdYi
         2IZw==
X-Forwarded-Encrypted: i=1; AJvYcCXgmjWSDayuLyMsUcW0TG6yjha7B7xEbEGS20jz+mb1RMrlBP6LrrRkoRpMV2XGtSovuUuXFWn8DoU4@vger.kernel.org
X-Gm-Message-State: AOJu0YxJhzV2AOnEg6Xot6AqvlX6WvXr8jEY3mAyUKrY1WOpqYT/AuhR
	imEUzV3oTGoRf1cuySFNQ6g8kcDMphhqBaQdOQitOw/1RIDRHjZGJNDHec5yeFacz3A=
X-Gm-Gg: ASbGncsOSAx9tITZuatqMlCW5Ju6KB/eb0ilOCVSSZDWOQaFwtAoI4cr+istWgk0wSc
	OOnV2KbowELCiu5Yti1a9AYzJoYkA3ghuCi4t4bAjoEcW66n+GACzRlHj9hiTVcWRTKmArdX1Ye
	8IPkdP/wTyVGS4glnWL/f6PWm6hkOPydFZRq8x5bE7ZWsBKfOUDMmabtOvUUYor/uG0BzTdlb2d
	djiuhGbre3hD3luzl5Wi5hqBsORXAP2S6kosZb3D6W3UBuAyzfZVX/vwgZgVV9rmrEpBVGjhh24
	o5XSmu0y7jnYT26UaJavdraFP1b82r2BgA5vuqvdEzhuCcBzJ0dHaaQXfqRgeP1vgzNs34/jEBF
	Zt6NhRFfpbBA7JX9woukQlEkJcdV5lvFK
X-Google-Smtp-Source: AGHT+IH59o8j32HAN6vi4aVy+86VCRWAaFR6A/Rh0zriGcYaCtlPFOT5R9qF6Arv1QZ5dGltkfqpsA==
X-Received: by 2002:a05:600c:1e26:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-454f42792eamr28892975e9.31.1752235570051;
        Fri, 11 Jul 2025 05:06:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4de1:8724:bdd:326e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f222e4f4sm4910185e9.10.2025.07.11.05.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:06:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.16-rc6
Date: Fri, 11 Jul 2025 14:06:07 +0200
Message-ID: <20250711120607.56044-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of GPIO core fixes as well as an update to
MAINTAINERS (drop an entry with a bouncing email address).

Thanks,
Bartosz

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc6

for you to fetch changes up to edb471108cf1477c44b95e87e8cec261825eb079:

  MAINTAINERS: remove bouncing address for Nandor Han (2025-07-11 09:18:55 +0200)

----------------------------------------------------------------
gpio fixes for v6.16-rc6

- fix performance regression when setting values of multiple GPIO lines
  at once
- make sure the GPIO OF xlate code doesn't end up passing an
  uninitialized local variable to GPIO core
- update MAINTAINERS

----------------------------------------------------------------
Alexander Stein (1):
      gpio: of: initialize local variable passed to the .of_xlate() callback

Bartosz Golaszewski (1):
      MAINTAINERS: remove bouncing address for Nandor Han

Hugo Villeneuve (1):
      gpiolib: fix performance regression when using gpio_chip_get_multiple()

 MAINTAINERS               | 7 -------
 drivers/gpio/gpiolib-of.c | 2 +-
 drivers/gpio/gpiolib.c    | 5 +++--
 3 files changed, 4 insertions(+), 10 deletions(-)

