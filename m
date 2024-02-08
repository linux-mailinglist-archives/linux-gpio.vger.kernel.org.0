Return-Path: <linux-gpio+bounces-3066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CD284DD73
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D55E81F236D9
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 09:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AE16BFDD;
	Thu,  8 Feb 2024 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VpWNlkdO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05CE1E86C
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386369; cv=none; b=rZYHz7nTAjCES5tEwZ5/S5E6RVnpf7EkpxAN283HPNyp1sk19IY0zlYu2/tPLDTmJej5aR9djfGRPOsYLcHtFMpYvJeueEb2KvqQQ1IYiKtaXl492LHxII6OcivZ5wgH8003NMJiM9SGe8KPSvk13hgkhJRSTEWBSfmPKopVEr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386369; c=relaxed/simple;
	bh=+Ss7g1Q+M1n3ay/nn1AcRxxyBtMcx0d9c+XnTtYI7Vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eO7GX13R7uwWDIfSyun7xjdFkVA15hYrhV2TyUOFlJMVw+EuJqJmC9W9Rpur4dMGBNYE6DHXoTEGXr1ElFHEuktsD/JONWzCWiEyN/wbMuP5/Tl64kEyWzI4Qa1ArlUR4kR5Dwl571LWiHerI3NPJULzS5dNib8O7BPNsMTgdHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VpWNlkdO; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511234430a4so3302487e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386366; x=1707991166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDUCry2Ee0Jo2HX42bMKv3Osof9GnrEPJg5LNLj2gpk=;
        b=VpWNlkdOZDjifcfdBS8VBheS6VOqVe/HyS8XJf6gZZd18G4cJbz9jvnWTrpoLRaulU
         O5xI8PqcMuuybJDBj0DDWQh+b6GeN3y7ioRT+XCGXr27Ua4ISpU616RaVvBubZrliu9a
         Pm6YR1auSgR0Ev+RQ2K2/Wq4xM3ABbfwoeGe2JUzeJWRvq+i7I3zj/KQXEjJWKV2yB5C
         2ad9tkpgVkFR5K3WJm7rHe/vmnjbiAXe5D3Ft8Qlnx/HC1xj+Mj/NEjyT+3wi244O7YJ
         vgG3zDpa/r13gEeTeSK/9DxCSbY9taANc+vFH5Nmb45V1VSGrmVgB6uLravPiPeei8ti
         l8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386366; x=1707991166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDUCry2Ee0Jo2HX42bMKv3Osof9GnrEPJg5LNLj2gpk=;
        b=gyN6PS9RYwIwt9hTXG1zy19zOR+401QbTuV52aFzgAt7bZVcyBfxAwFit4M48RH99+
         Bxrx8Imz2KnY80SFbbRXNudxX3B/b2mFvNHmsOYVhrHvScBwLBuDSPaYdIJlgEnxE08I
         Gqx4GyN/i0DS7luMaq7IQ8XUJjkHOPaPgyWWJ75Sk9/hDw2BIt2mk/uy32P9CI83fM3n
         mOt25iMfCr/6e5ar8iOPg0P634lq6Ih2yX6wcmDwDwb20gxjWjpeQYZuHHWGaBtogKo9
         Uo8jR9Pu29jJas8qiy13VotWqwk+scOso0tz8YYuI15xcWCjCWcPxmKybrWWeZ5leSV7
         OieQ==
X-Gm-Message-State: AOJu0YzexZGAuiY62BUwsRl/x8y9RoCF5omBqtxgok0MDFnbrQlxjU+n
	uzKDuH4i2pgm3EX5XcnwEZ7cJ/8aOmqSt13DsQPW9ooxsIGIni2QyqbUh09F7tg=
X-Google-Smtp-Source: AGHT+IFGODtvf1qpI4uxdqb9PV/R5VCejCqZFqt4qZ0alrOHrKUQFGc2GoUo7DsnnC1h5l+wQdsy/g==
X-Received: by 2002:a19:5e57:0:b0:511:4f1c:ef43 with SMTP id z23-20020a195e57000000b005114f1cef43mr6013903lfi.10.1707386365532;
        Thu, 08 Feb 2024 01:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1P93si7DcQK8qO4BiG4d5foY1sFuFeKKhUkfksvRkpjCahJa5sQgDvMBJq21WbEtD/hkmmVCWgON7/O784W8ovnl7IZ3Waa7mpC2h7HnD8eWnvEWyUOUWZajeKzlRk94JOG9KaVYu5lx+4QB6mz3HlqxVD2Ucl31iQUMJUwSIJgA6mIuRqTaNUko74EzQ9AoSBEHjYn5yVHBdDXBtWiBh779IINtrATfDEn+1BITJsIKq39yequrBQ5jpsGy436cFgjQkpuN1wy5GJkPgOHMFq7aM/xA+T885U5PI0EPg3wt2qwD15zNAGpMwroNkddNIxzY42zaAkoes79jt0X5EUf5WYO86hg==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 00/24] gpio: rework locking and object life-time control
Date: Thu,  8 Feb 2024 10:58:56 +0100
Message-Id: <20240208095920.8035-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a big rework of locking in GPIOLIB. The current serialization is
pretty much useless. There is one big spinlock (gpio_lock) that "protects"
both the GPIO device list, GPIO descriptor access and who knows what else.

I'm putting "protects" in quotes as in several places the lock is
taken, released whenever a sleeping function is called and re-taken
without regards for the "protected" state that may have changed.

First a little background on what we're dealing with in GPIOLIB. We have
consumer API functions that can be called from any context explicitly
(get/set value, set direction) as well as many others which will get
called in atomic context implicitly (e.g. set config called in certain
situations from gpiod_direction_output()).

On the other side: we have GPIO provider drivers whose callbacks may or
may not sleep depending on the underlying protocol.

This makes any attempts at serialization quite complex. We typically
cannot use sleeping locks - we may be called from atomic - but we also
often cannot use spinlocks - provider callbacks may sleep. Moreover: we
have close ties with the interrupt and pinctrl subsystems, often either
calling into them or getting called from them. They use their own locking
schemes which are at odds with ours (pinctrl uses mutexes, the interrupt
subsystem can call GPIO helpers with spinlock taken).

There is also another significant issue: the GPIO device object contains
a pointer to gpio_chip which is the implementation of the GPIO provider.
This object can be removed at any point - as GPIOLIB officially supports
hotplugging with all the dynamic expanders that we provide drivers for -
and leave the GPIO API callbacks with a suddenly NULL pointer. This is
a problem that allowed user-space processes to easily crash the kernel
until we patched it with a read-write semaphore in the user-space facing
code (but the problem still exists for in-kernel users). This was
recognized before as evidenced by the implementation of validate_desc()
but without proper serialization, simple checking for a NULL pointer is
pointless and we do need a generic solution for that issue as well.

If we want to get it right - the more lockless we go, the better. This is
why SRCU seems to be the right candidate for the mechanism to use. In fact
it's the only mechanism we can use our read-only critical sections to be
called from atomic and protecc contexts as well as call driver callbacks
that may sleep (for the latter case).

We're going to use it in three places: to protect the global list of GPIO
devices, to ensure consistency when dereferencing the chip pointer in GPIO
device struct and finally to ensure that users can access GPIO descriptors
and always see a consistent state.

We do NOT serialize all API callbacks. This means that provider callbacks
may be called simultaneously and GPIO drivers need to provide their own
locking if needed. This is on purpose. First: we only support exclusive
GPIO usage* so there's no risk of two drivers getting in each other's way
over the same GPIO. Second: with this series, we ensure enough consistency
to limit the chance of drivers or user-space users crashing the kernel.
With additional improvements in handling the flags field in GPIO
descriptors there's very little to gain, while bitbanging drivers may care
about the increased performance of going lockless.

This series brings in one somewhat significant functional change for
in-kernel users, namely: GPIO API calls, for which the underlying GPIO
chip is gone, will no longer return 0 and emit a log message but instead
will return -ENODEV.

I know this is a lot of code to go through but the more eyes we get on it
the better.

Thanks,
Bartosz

* - This is not technically true. We do provide the
GPIOD_FLAGS_BIT_NONEXCLUSIVE flag. However this is just another piece of
technical debt. This is a hack provided for a single use-case in the
regulator framework which got out of control and is now used in many
places that should have never touched it. It's utterly broken and doesn't
even provide any contract as to what a "shared GPIO" is. I would argue
that it's the next thing we should address by providing "reference counted
GPIO enable", not just a flag allowing to request the same GPIO twice
and then allow two drivers to fight over who toggles it as is the case
now. For now, let's just treat users of GPIOD_FLAGS_BIT_NONEXCLUSIVE like
they're consciously and deliberately choosing to risk undefined behavior.

v2 -> v3:
- fix SRCU cleanup in error path
- add a comment explaining the use of gpio_device_find() in sysfs code
- don't needlessly dereference gdev->chip in sysfs code
- don't return 1 (INPUT) for NULL descriptors from gpiod_get_direction(),
  rather: return -EINVAL
- fix debugfs code: take the SRCU read lock in .start() and release it in
  .stop() callbacks for seq file instead of taking it locally which
  doesn't protect the entire seq printout
- move the removal of the GPIO device from the list before setting the
  chip pointer to NULL

v1 -> v2:
- fix jumping over variable initialization in sysfs code
- fix RCU-related sparse warnings
- fix a smatch complaint about uninitialized variables (even though it's
  a false positive coming from the fact that scoped_guard() is implemented
  as a for loop
- fix a potential NULL-pointer dereference in debugfs callbacks
- improve commit messages

Bartosz Golaszewski (24):
  gpio: protect the list of GPIO devices with SRCU
  gpio: of: assign and read the hog pointer atomically
  gpio: remove unused logging helpers
  gpio: provide and use gpiod_get_label()
  gpio: don't set label from irq helpers
  gpio: add SRCU infrastructure to struct gpio_desc
  gpio: protect the descriptor label with SRCU
  gpio: sysfs: use gpio_device_find() to iterate over existing devices
  gpio: remove gpio_lock
  gpio: reinforce desc->flags handling
  gpio: remove unneeded code from gpio_device_get_desc()
  gpio: sysfs: extend the critical section for unregistering sysfs
    devices
  gpio: sysfs: pass the GPIO device - not chip - to sysfs callbacks
  gpio: cdev: replace gpiochip_get_desc() with gpio_device_get_desc()
  gpio: cdev: don't access gdev->chip if it's not needed
  gpio: sysfs: don't access gdev->chip if it's not needed
  gpio: don't dereference gdev->chip in gpiochip_setup_dev()
  gpio: reduce the functionality of validate_desc()
  gpio: remove unnecessary checks from gpiod_to_chip()
  gpio: add the can_sleep flag to struct gpio_device
  gpio: add SRCU infrastructure to struct gpio_device
  gpio: protect the pointer to gpio_chip in gpio_device with SRCU
  gpio: remove the RW semaphore from the GPIO device
  gpio: mark unsafe gpio_chip manipulators as deprecated

 drivers/gpio/gpiolib-cdev.c  |  92 ++--
 drivers/gpio/gpiolib-of.c    |   4 +-
 drivers/gpio/gpiolib-sysfs.c | 151 ++++---
 drivers/gpio/gpiolib.c       | 791 +++++++++++++++++++----------------
 drivers/gpio/gpiolib.h       |  86 ++--
 5 files changed, 635 insertions(+), 489 deletions(-)

-- 
2.40.1


