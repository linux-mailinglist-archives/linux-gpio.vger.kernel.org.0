Return-Path: <linux-gpio+bounces-26371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4ECB891C8
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 12:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDECF7B3F1B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 10:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DDD2FFDDB;
	Fri, 19 Sep 2025 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="loTfuTkN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13C244668
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758278541; cv=none; b=cFKvsnXDCb3HFv7x6ROi1Rdv5Wbq3UwiS0sfY78kj3LNHIGBeFwbC0cliPh/QPTBF0T2jvxVLZn1SMYRt94sOG89gwkSWe9iU/KjFZI5Cj6/Nms/0ZUdvfRNS1f5IXYOQ3mccYpxyPx8WbclOWcr8WPrZlGgdB8NYix31tsc+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758278541; c=relaxed/simple;
	bh=jQXvMZjv6Edr2qH9SjMN5M4CusQBUUx0PIhxNpGMICw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D0uaNL12HsludVU8MYjdoUvZ3ZXQtA+OMhIyKhKLGxCv9d8wLTShtzbUO0ABJp+zAwU/6XeRJd/XA74A23V34/aiJU2R7WU1WLjyVtPEgZXBEvDEJjFTHoB4xMKF5ptRxVuWjSGpzTXg6txiW76r/nJyUadOiQMZwIXx4/aQD4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=loTfuTkN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso17548965e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758278534; x=1758883334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZnqa1SU8lQJfD5y4JuW7R4+r0Si3vRytmUf4T9ZKy0=;
        b=loTfuTkNqJuoCTuyTTGWVAbR5/EaRxaWHdEowYhi4SNkaHf2Rqwym1N1wMwkv7+Jy7
         7pdk9rn19RqNihBKO+EGfF9XB1s0L3gJ4QcYnY6Egd+Dke/XdLxUs57MneEeTggiBgqA
         ndzu/71s9Fi2EqrFgpY+g3/iF+LaVI2tcZ7Z6XlKRBaXs4cARZnd7GlofxdxI0VUEmXl
         oc78xpmZxGlg00Q579SB4ed8E6JBgIjX/l3rqSNibfq7730HwiunvZmnLBEq+iFZ2Sy2
         BXxQtbAb2jf5dBPo+SjtEHop99+mqyi3zi1GZct7m8UP8mrBziARGI/nUYWKvzNueea2
         spUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758278534; x=1758883334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZnqa1SU8lQJfD5y4JuW7R4+r0Si3vRytmUf4T9ZKy0=;
        b=BEOOUi0RLHrlQQ0FZvC8MBkg3XIg3ntUQUNZ1+CsHo9HmSC1WU6xm85MNsc4YRui/D
         QiWPyU7JqlkEh/v/a0eBAEEh5thNp3dLNIv+HBTpkc2RhfCM29velPpudmnB47XrSutV
         mdFz1feBtG0NAqq4ms1pM8s7wXVpPDnAfAeSwmhuKxfOr9ApK75hg+ITuysghF+EieS9
         Bx5VFDJzu8GwR6gSrGmoARn7ingXHW3n6++IXUxNhFF79FIEBmbTaoZz6HFWNqO0J1T8
         t6CC+xmSg+wZ/uExH3jtQ/3cGWvfQXuTdX0/1WCXKKu0YqsMaacI7uvTfltPFvs6SKaH
         TWGw==
X-Forwarded-Encrypted: i=1; AJvYcCXBTl8QPZhzUtxhbrpQzm9lz70qGukn0cK5FX8il0z2xXvOI62lIhwmsiUUksOLypvLkxlzCBsSZtkr@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLFqn4piqr8FImDGY52Y5ho5PJXhGrPmDPeg/FXK+Z8vUEDoh
	OkfoU8ys78dMc8CUklxJx9esH2s6N4Dz8U0uItZgL6q4QtKn9zQUYY+c0ylUMBDGYT4=
X-Gm-Gg: ASbGncvVIjRHCcJdNODy4MYMTmhYbaGRbaQ+jKQrdLUOgAo44XDBbzB35D8ldiyQpmt
	rHDQXV5rmJpihjvn7gPHMjauGSKCPfu/C9w3vTWQ5U3/lQ2Cwh/EpuvVo2bbJlxYSZ2WVjjIbQ0
	RDn8JM+3BJT0+1X7qZftfyYD/LQEJeaZk2O2+11iFKf7EGCV32b2xd4s7rW1DXzwQFS8Y+dVLnb
	hza9T6idk2zzI4w+NJZLV7/YY20n3cn8H8jwujF8+hawW9/wBJw9Gug6XS8F8643xyu2NzXzbsX
	Nfm6CsDkT+Px3QkjMFwxFxC3ubY2330r/w1oVMBMEurgDWE5qirMQ9zt7EkCJ8PN1Ct111yPHak
	C8i1AfR87qeprri4XNFM0MFHbMAyxdsDogq7vElSl1xhY
X-Google-Smtp-Source: AGHT+IEAutEX6cCJ5RT3z6cecGeAtmxpSE9l+42jszbvN2PBstnHXR4wbNXLRrgUosHl/xzwuJNBYA==
X-Received: by 2002:a05:600c:5250:b0:45c:b607:ea95 with SMTP id 5b1f17b1804b1-467ea89da6cmr20722855e9.18.1758278534225;
        Fri, 19 Sep 2025 03:42:14 -0700 (PDT)
Received: from brgl-pocket.. (147.163.185.81.rev.sfr.net. [81.185.163.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee1095489asm6754942f8f.24.2025.09.19.03.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 03:42:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.17-rc7
Date: Fri, 19 Sep 2025 12:42:07 +0200
Message-ID: <20250919104209.9264-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of ACPI GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc7

for you to fetch changes up to 2b464fd599c583e53fb35dbdc3b4851e30895ff2:

  Merge tag 'intel-gpio-v6.17-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current (2025-09-16 11:36:37 +0200)

----------------------------------------------------------------
gpio fixes for v6.17-rc7

- fix an ACPI I2C HID driver breakage due to not initializing a structure
  on the stack and passing garbage down to GPIO core
- ignore touchpad wakeup on GPD G1619-05
- fix debouncing configuration when looking up GPIOs in ACPI

----------------------------------------------------------------
Antheas Kapenekakis (1):
      gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-05

Bartosz Golaszewski (1):
      Merge tag 'intel-gpio-v6.17-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

Mario Limonciello (AMD) (1):
      gpiolib: acpi: Program debounce when finding GPIO

Sébastien Szymanski (1):
      gpiolib: acpi: initialize acpi_gpio_info struct

 drivers/gpio/gpiolib-acpi-core.c   | 11 +++++++++--
 drivers/gpio/gpiolib-acpi-quirks.c | 12 ++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

