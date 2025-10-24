Return-Path: <linux-gpio+bounces-27584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C15C06267
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 14:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CACDF1C00C05
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 12:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6315931327E;
	Fri, 24 Oct 2025 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FAr0OUgF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DECC2AE90
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761307413; cv=none; b=dmcYDxpwQAo53UrlIeQcsmN3bo7uXYw1L6qOGiMdk14bgV/lzFUIqBJuQLI218UsU3o7Gi6Z1JrXulrCqK8iiRImFIYnX0wh6KhLBVm91f2ABn1MgK+yXuVsfpgZvgqCk6bZaZuutF1ldlpnGFh8urriiONqhfY0oI4vUbx+5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761307413; c=relaxed/simple;
	bh=Men9/wmG/ZUUgBBI72/KEQEc4VGPzum8/bYIlfv7Ops=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svE/wLYqfpUT5HFyys8szYUXcbUEbnOrvL8Ang9o4TljyiQdDPIW1X0xxvdZOqFvU4T+YZMtcoSbLdHZmtLhHUA5QMMXWiE0Ffi+LaDFav4yvnQ1ja5cazjmMreEqX4vmA6F8XWZDRJySqA9rv0KAX8Q7ztC2GBbQSq4uF4as4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FAr0OUgF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so990217f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 05:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761307409; x=1761912209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPV5ihUnHr8u4lnMxWNUS59GCM6jDnONUSLo0YK3wR4=;
        b=FAr0OUgFlkAkDbdHemYPcLFoMPCHOolddCr7AeeC9ZGHjtXklnrXvzHrgcj8u69sQ+
         F9/5HaUrJ3XTJkO9HpTyMHzA5pxAVgAXVhYHIc/fLniv4BuUGsJQHw8RhcqrUNsKQ2zt
         trARhMm0lXTEdn54YFdtGNGoTsbCNUVsc5VYzBAO1Z3bYSSHmNoW81Ol8wB2QtIaNl6g
         ZQoi5ux5wCVm+CLZV7JendX2wf8OOs2k6jznTSOXsesuSpn40MwZEpmMkiKjUnkC0mCp
         oP2QXrcOLfZTNg38dZRi2IO374wdLH16pjQxY3O8xMkmK07r4XVvZ2xxVlBrYSghGKSe
         kf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761307409; x=1761912209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPV5ihUnHr8u4lnMxWNUS59GCM6jDnONUSLo0YK3wR4=;
        b=A3KSFg+UET71y1SUISfHNifjZtPOm+wE9rRKtQlrUwNKPaAgRxq6/gMGODZfsbcVDU
         E9uiBLQnil2IgB2tcQQ4N1BYB9vcRAsw8dA4z6QT72O9cbhJBqG5HELXmMo78ChCq1bm
         hK7cYh2xJO6awp5A+DMOj2Sz3iy4T3SiJpr/T+8Yfv47KmXZZMHeM+Wkfp7qL35tEovd
         7bndiOrowLBGnlqFTM2+eBbV3P22EoYJ9DQJphTUDEETj6osq74orc0DA+HEbors7cx+
         OgKk69CiXgsDC+DJZfysJPcZcDsj62OB6Ii5/is05IibiEnc74o+3QN30Pvk6eeRVSCy
         +rNA==
X-Forwarded-Encrypted: i=1; AJvYcCW5CEz7BQo3IJY0ELFNKr5wJRMGwEsk5sescwTtalN3GNZTk66M7HCS+JbHknYAoj+iyB6uF7GbEake@vger.kernel.org
X-Gm-Message-State: AOJu0YyCmzOKtuQpFDVppmsf3Y/k1TPNXDFxIamYMIF7pXP0XSP4ED3T
	nOr1ZVLmRbAnSd1zs0S90KAs2hA28G+E3jt3J6Fklfi3Axb+ehnQn4hk1ZrLt83IRDM=
X-Gm-Gg: ASbGncuUwMtvehKGHd8f/DvVK6OJsG5nPVw38IgeIMVn8KBtVfxwBB1D2zPHHzDz38r
	rH6eT8dBb8d4xDz+pqBADVwefvPzmRoqgzPjyF5wM8WN0bTTQeW079KKihe2UbZEJNjx3GEjyAk
	b8Ek61JgqGg2FEyNMIGOLdVV9h6WZL8zR5/UUT37+2o/UWVE9IGenUJ4Yv55lHFp1Jnrf39NnHi
	ZIzt0Wa+NSuss5ACJNN7J7a4nc+OVfxpDgONZouvtUH1thhCM1BAPHDA23Xz+MkeuWb5OYY79SO
	7AVpUGJemypK/eZNCwHOeLO9NiW8ct1hRsq4AuRFDefymdfYKAz1RSU+r9uHzBKZNzNY3QJTElb
	THedNsnGGy2XUXfYFSsFGyiLRXrnD2pkUUgQwa7RRyzFkriBQ4W//Rb/nOn5DV2ryOfwgc9N2l1
	Q=
X-Google-Smtp-Source: AGHT+IHzLJMr2J1r+wANIYV3joHu+TXVlgpo7zfV0xKNG+Ayhr2mf56CMgyvBQhzNYKPRT/tLgXu/w==
X-Received: by 2002:a05:6000:26d1:b0:427:45f:ee2a with SMTP id ffacd0b85a97d-42704d49857mr16223381f8f.9.1761307409258;
        Fri, 24 Oct 2025 05:03:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7ac7:4d3b:a7b2:b32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ec1dfsm9094123f8f.43.2025.10.24.05.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 05:03:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.18-rc3
Date: Fri, 24 Oct 2025 14:03:26 +0200
Message-ID: <20251024120326.48028-1-brgl@bgdev.pl>
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

Please pull the following set of GPIO driver and ACPI fixes for the next
RC. Commit 00aaae60faf5 ("gpio: regmap: add the .fixed_direction_output
configuration parameter") is technically a small new feature but it's
required by commit 2ba5772e530f ("gpio: idio-16: Define fixed direction
of the GPIO lines") which fixes a reported regression in LTS.

Thanks,
Bartosz

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.18-rc3

for you to fetch changes up to 4c4e6ea4a120cc5ab58e437c6ba123cbfc357d45:

  gpio: ljca: Fix duplicated IRQ mapping (2025-10-23 14:30:11 +0200)

----------------------------------------------------------------
gpio fixes for v6.18-rc3

- fix regressions in regmap cache initialization in gpio-104-idio-16 and
  gpio-pci-idio-16
- configure first 16 GPIO lines of the IDIO-16 as fixed outputs
- fix duplicated IRQ mapping that can lead to an RCU stall in gpio-ljca
- fix printf formatters passed to dev_err() and make failure to set
  debounce period non fatal

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: acpi: Use %pe when passing an error pointer to dev_err()

Bartosz Golaszewski (1):
      Merge tag 'intel-gpio-v6.18-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

Hans de Goede (1):
      gpiolib: acpi: Make set debounce errors non fatal

Haotian Zhang (1):
      gpio: ljca: Fix duplicated IRQ mapping

Ioana Ciornei (1):
      gpio: regmap: add the .fixed_direction_output configuration parameter

William Breathitt Gray (3):
      gpio: 104-idio-16: Define maximum valid register address offset
      gpio: pci-idio-16: Define maximum valid register address offset
      gpio: idio-16: Define fixed direction of the GPIO lines

 drivers/gpio/gpio-104-idio-16.c  |  1 +
 drivers/gpio/gpio-idio-16.c      |  5 +++++
 drivers/gpio/gpio-ljca.c         | 14 +++-----------
 drivers/gpio/gpio-pci-idio-16.c  |  1 +
 drivers/gpio/gpio-regmap.c       | 26 ++++++++++++++++++++++++--
 drivers/gpio/gpiolib-acpi-core.c | 31 +++++++++++++++++--------------
 include/linux/gpio/regmap.h      |  5 +++++
 7 files changed, 56 insertions(+), 27 deletions(-)

