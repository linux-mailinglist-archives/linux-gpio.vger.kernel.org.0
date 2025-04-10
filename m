Return-Path: <linux-gpio+bounces-18653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85EA83F46
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7112719E5560
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D6726B0A1;
	Thu, 10 Apr 2025 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oQLls0Yh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A66256C9D
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278372; cv=none; b=Q39vKB5WNV1c91m7rzFS5F2fy5selfhqYnP57hIBnHT7yB4PqOYeGTxWGJEdrtQku9zKb8nuvzQeMI3VvjkALv5RmRl49I0TQMtEdpGImYUFMvenCS+AQRF4CnXCfDupC3qX6UdKd//fFLuEuSaYdamw2EH9D0gmhkB6BiVgMCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278372; c=relaxed/simple;
	bh=pI3vfIbLqPbWsDOQuTX/utAtCX0Ma5Hr4cLa843LCc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGRnK2seWKTyfVZ86UQgWPNUAgQ6NrBhzuSa9Xaeow1x/dVtWj8RVr+SWsfKRcXD6U/NyXHDqkCLmnkHO4m4aEAx+N1ENTLD70nrfdpfH/gbjTFQteN+d+KzQp/dZQX2kF1hMDrB+eKsBNQjgFo8H6d3fO8/kyiJr7nN7/8MX+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oQLls0Yh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so4878615e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744278368; x=1744883168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyPa6ldlaK56MEPUp6to8FxZZbTIhKB6rIkU4vhMvLs=;
        b=oQLls0YhBKowCzaJDD9qfB3e6ic3+QdPpO2U8z+RfRjnG6CtR/LOfEVc4tYT6TR67I
         qdl8I73vhCLlI6hR0vS+x9zN4co5XKwFgn08IBinhQs8JVaKEQzzzqHiTNOW7sB69EvS
         +Z3UycOc4c8oMCVkzlMwxZMsN8d9bwjKgoYYCE5IMyQDaWfP8DIqxTXV4ujPKiahYpLV
         sz0TyRwr3p9WbBN5pW2x3HyiM9EPwh+NTrsqhGYx6Q45qR6am3vieYdAXjQuU24N2VDO
         Q62rp+r9r+aNeMYCGd0qoWUA2fgsmslCPZ7tqkVw6uoS0/0E79TvIU7BArgu+YrVQq8a
         QSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744278368; x=1744883168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyPa6ldlaK56MEPUp6to8FxZZbTIhKB6rIkU4vhMvLs=;
        b=QA+VUK8yFrHholj5pt8pblX0qo9hRL4iM7zJZBxyCUw+E5dR7A4q5tIPPE4xi3To+N
         gi2wog3Dv3s/SBrwAOgJedr0kFgwd1Cu/YDOsvpqvq6wJzvmhP/T3Xx4x7KNmpOw/+Dr
         b9eZjO3PlsmOa+EBMA8VjX4rfabqGnCxYNhz8RsgnNVrKrwZdijoI3CLhtgq8zyCWSDx
         LsTF4Tb7Ixo4JO4H40FE/w/hf4ZKqecULBG3CiXkY7JrqKhhTJCdRdX58QFPLpQ+PgwW
         mrON9Q1o7DkjXQy/USu99pZHrAiVdy6RZzVRZ50a2l3Vr5wws0pZu7AXMOCiXz1jxqCD
         WP4A==
X-Forwarded-Encrypted: i=1; AJvYcCVs3CB1priYj3NjMZOnVzEormvL5eIAPMwDHsZ9T8XoPmyb8zvSvLM09SPOI4ups/xYS4n5FTKBr/Fg@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZDiM3enPDiS3E1NW8FOLnW61JMWEk5s4cDD4JhntTnWSWt8u
	7sS/BUi8v1YFlj2UGv5V+xGnnMdSwJxHD9E808hBzrZ+YjQaRXaWKkXg7hzGaNk=
X-Gm-Gg: ASbGncta5cS2nwov0TKREH5188OxT4alFdUvvB/MTX0q/FphA9QDQu2haswpwUU1ZMI
	Uo22bOpVVTNpfcnnJVMZLGpoRKWnU8v8kWukpcrUkUImPNX/PIq5tOBrt8TsVRa0jEL7+kMTw3G
	8QLncOrQPknSC5aNOqVzWh8eDi/Q5g9CoP39fzQasaQWgqUh4hursELwDvP7Aey1ggOHaHfv0Iq
	WgyKE5vY6qCavyXdMKg6xc1ATNBQYifk4InNDXGBz1pYUAKp06jdAg3kJsbLPQrknNTy4LOHNr8
	3YdO6UbWYzCKe6wswcxMIy+oCcGBixJKaWFMk7X0
X-Google-Smtp-Source: AGHT+IHVdnD6pkQJ1mtCB+lyukhVO9gye/40iBh+MDKdPiJJHPaca88NCEFrQ3Hp/AwTWVnFHC9fGA==
X-Received: by 2002:a05:600c:3ac4:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43f2fdcd138mr16185205e9.4.1744278368045;
        Thu, 10 Apr 2025 02:46:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2a13sm44847075e9.10.2025.04.10.02.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:46:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.15-rc2
Date: Thu, 10 Apr 2025 11:46:05 +0200
Message-ID: <20250410094605.38665-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of fixes from the GPIO tree for the next RC.

Thanks,
Bartosz

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.15-rc2

for you to fetch changes up to b8c7a1ac884cc267d1031f8de07f1a689a69fbab:

  gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment (2025-04-08 11:06:45 +0200)

----------------------------------------------------------------
gpio fixes for v6.15-rc2

- fix resource handling in gpio-tegra186
- fix wakeup source leaks in gpio-mpc8xxx and gpio-zynq
- fix minor issues with some GPIO OF quirks
- deprecate GPIOD_FLAGS_BIT_NONEXCLUSIVE and devm_gpiod_unhinge()
  symbols and add a TODO task to track replacing them with a better
  solution

----------------------------------------------------------------
Andy Shevchenko (2):
      gpiolib: of: Fix the choice for Ingenic NAND quirk
      gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment

Bartosz Golaszewski (4):
      gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
      gpio: deprecate devm_gpiod_unhinge()
      MAINTAINERS: add more keywords for the GPIO subsystem entry
      gpio: TODO: track the removal of regulator-related workarounds

Guixin Liu (1):
      gpio: tegra186: fix resource handling in ACPI probe path

Krzysztof Kozlowski (2):
      gpio: mpc8xxx: Fix wakeup source leaks on device unbind
      gpio: zynq: Fix wakeup source leaks on device unbind

 MAINTAINERS                   |  2 ++
 drivers/gpio/TODO             | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-mpc8xxx.c   |  4 +++-
 drivers/gpio/gpio-tegra186.c  | 25 +++++++++++++------------
 drivers/gpio/gpio-zynq.c      |  1 +
 drivers/gpio/gpiolib-devres.c |  6 +++++-
 drivers/gpio/gpiolib-of.c     |  8 +++++---
 include/linux/gpio/consumer.h |  1 +
 8 files changed, 64 insertions(+), 17 deletions(-)

