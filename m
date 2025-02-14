Return-Path: <linux-gpio+bounces-16037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C129A361A5
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 16:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E779616BD8C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 15:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D32D266B72;
	Fri, 14 Feb 2025 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rTXIoPjH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8872815749C
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546813; cv=none; b=ETfSCcEbLHqbgy8GKgoPMYKKBO5UT0DeCK1yZwELYx9yvcj4B7nI78ja8uDmCpMq0aNZimVufNaaHnA6HzQrMLDUGTguDSveEIKXoaWRs2Uk+5rZr7klj553EXVEmOVEgey09FnWEMq4l1wPerPCGu0eNYQXU472rgF1WihEmyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546813; c=relaxed/simple;
	bh=0LxUpI37n9Ty+9Pp2W9i6XsDKp/K+emkn4l7dIJVF4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8KBIpExaZjuZvYPBTPVuqppkVABY2qm3bN5HNavuj7S7wNHbzRYs2or6uzlhrgAPXh1I5uMn7BkQTic4BBdTr3oC7P2UJva0iIMB/r2LvutoAe4WcBahryOu61BtImLDecAQ1R0QwYggHrX4niQh31t44qbkI3qSde/02TcCMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rTXIoPjH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a823036so23339495e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 07:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739546810; x=1740151610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oTRfEW2yWn9zerW5a3NIEU5Z05XOKgCl0U2kOQmvH4E=;
        b=rTXIoPjHJZ/xKNsMODPPdaS1aktKuKyVmNRGg6MJFEaN4NSDaZHqQzdZnSLUcfCtAe
         FJarqNBpprsG0JilxGfzGV2U8eTXZ0lEQOqDTDUDY+xuZyUv0GnexrZECwhFES3Axcw0
         pv7ftpfQRAJLEo+QGuEoXMffKFIGAgnHnv8EKbdP1SRje/Hkm/hTbwCur80dN1V578uf
         6JHQcOmwbwaqFyNe0gJ+P3Zowups0aKvjwsLk0VmPqwyk2YgfzJ5RlmyYJDwuiQDDQCN
         ACS/AgDoI29d5Ldoe2BMSAZK7AmNHMq9/BAFF4UwRXpjy78hIMSYxqbZ4lhNZPnaOj5z
         98rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546810; x=1740151610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTRfEW2yWn9zerW5a3NIEU5Z05XOKgCl0U2kOQmvH4E=;
        b=PN3BglycvOlO4jRZPB7T5PHR+rU3M9+jJD65yhbpZy1PDZlceoMfEV6Ko9BZFkSY8b
         lCldlndIfBdR2FzAB7R4SAld78o3Nu4oCGIHPeOJLUPKis6aQk9EolywGo5z/NjcnFaE
         t0BEOZt4Z6iD8FQHMA6loc7y8zhCtqwnPbsD0VHLKMyyObG5dM36pW541VF5zifmn5MD
         3YdfP1n983IKVQqh6fKvMVgUL6pRwpFEyWk91X/iN1EaoRwt8hVKcU/GIW/UueeAOwb7
         FdiCCuTFs8z2sPvvlRK1vbh8M7Mow8VckuApHCx0OMPNc8+OzUzyIclXNSgNcAsXB3Pq
         DWvw==
X-Forwarded-Encrypted: i=1; AJvYcCUUDsv3J0IHa0+gkIO1uKJDu1CYDXHwOPO0bzswd5mvr1QlxLevJQ290KZqoJqS0JYLizigCZmowc41@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7HI8UkUOdQ8xvDVYkRAkaaFNQOwFD7jA5H4IPqDZ4ezhMdtC
	ulPqPOirKeBTE0UtULSCzgIvK9jUKHl3aykSbuYyBmn69uUTOaxrIEPLMr/0FwQ=
X-Gm-Gg: ASbGncs7NxbE8V+IbiGjv5UaOoVOsAwMHEAYd9cvbbZbRwG0YMfxkJig5A70L6fm1gM
	06BRNzAnONn6G0C4eA0kv5WxmjlUF5bTYqqxfysWFxNYN2AFAXqk3078TSBXaUc9mBlG535KZmp
	eLlIZQDKxMcrj4yfQI/tehaBGzxFbvCFCasvRzegE6FZht+bsd6GxKHTLUjHqHTKpeAdZzYtAP/
	k063c6MZ3zJBO1x3zJ/zjNBW/L7kmiVCW/qsbBv5PFPPa1g1b+YMVsfmZTD+ybNQnYz0nyje9lj
	t1Wmw+r6t+wb5g==
X-Google-Smtp-Source: AGHT+IFONZH8iHIvDAz5kPlqIVC2dTox3doanunplFJvfkohj4JLvMnOuxYGgtIrhnV5tFQrR+RNyA==
X-Received: by 2002:a05:6000:1f88:b0:38d:ba81:b5c2 with SMTP id ffacd0b85a97d-38dea2f875dmr13554012f8f.47.1739546809688;
        Fri, 14 Feb 2025 07:26:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62cc:da7:7c42:97ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5efdsm4814051f8f.43.2025.02.14.07.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:26:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc3
Date: Fri, 14 Feb 2025 16:26:42 +0100
Message-ID: <20250214152642.90363-1-brgl@bgdev.pl>
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

Please pull the following set of GPIO fixes for the next RC. Details are
in the signed tag. We have fixes to drivers, a new ACPI quirk and two
fixes to GPIO core.

Bartosz

The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc3

for you to fetch changes up to e47a75fb5b139233bdbb889995edda4dffc3f0f7:

  gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set (2025-02-13 18:53:01 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc3

- fix interrupt handling issues in gpio-bcm-kona
- add an ACPI quirk for Acer Nitro ANV14 fixing an issue with spurious
  wake up events
- add missing return value checks to gpio-stmpe
- fix a crash in error path in gpiochip_get_ngpios()
- add missing SRCU protection to the code path getting/setting multiple
  line values at once

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: Fix crash on error in gpiochip_get_ngpios()

Artur Weber (3):
      gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
      gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
      gpio: bcm-kona: Add missing newline to dev_err format string

Bartosz Golaszewski (1):
      gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set

Mario Limonciello (1):
      gpiolib: acpi: Add a quirk for Acer Nitro ANV14

Wentao Liang (1):
      gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock

 drivers/gpio/gpio-bcm-kona.c | 71 ++++++++++++++++++++++++++++++++++++--------
 drivers/gpio/gpio-stmpe.c    | 15 ++++++++--
 drivers/gpio/gpiolib-acpi.c  | 14 +++++++++
 drivers/gpio/gpiolib.c       | 54 ++++++++++++++++++++++-----------
 drivers/gpio/gpiolib.h       |  4 +--
 5 files changed, 122 insertions(+), 36 deletions(-)

