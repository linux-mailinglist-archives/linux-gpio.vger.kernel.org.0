Return-Path: <linux-gpio+bounces-16058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E7A36CDD
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 10:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 534213B0F09
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 09:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2577C19DF66;
	Sat, 15 Feb 2025 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kudGv7dj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7B219DFA5
	for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739611515; cv=none; b=ija7WEAwIeAx9UMcp22RCCQbWm4bMqFRRuncUOR/en1pO4ZliQcwpZegQyUHlZ363pfTKJWBwPfqTBOLqxQsHrW7/P3sV+LJEA9s10kbYMHZvIeYTyl1uLGu1tMuIDMvliZhyh6uyk68aeosxfYnw/PfKQgsyL4zrL8Mq0+Q4O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739611515; c=relaxed/simple;
	bh=fUEhJUJqOaQ6kqDr/ymTWQoQOscJJR6mrSLqxVNnVhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dSDP0VVouNxZWw/U73mjZ3Vx851v3t8PP2NpThCLfrqyIYd1EXWSQOfI38Z1urGx3VG7VaVH4fLCRyBpRiiF1XpD5j9mB1WU4CoDrz4uw7WH3238wJZ8l+1MNI/hmej4RPXzbxScX3QwQJUQU3Vg/1W4Vc0QJf28z9OFhvln1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kudGv7dj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so19984545e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 01:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739611512; x=1740216312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KbpcipICDHXuME30jOt6GpmvUkIPw+/TuJhtLOZoIJE=;
        b=kudGv7djwhYMRO3Ou4v/47TcrnQk6Hgr7X9RPe6o2yWg/wOQ+nLh0apMEmcMa7M3f9
         sqNguNOtInbQpL8oHKtTVtbigdEv9bmpNU5kaUiOj9WzUuaezgsCaTaCYc7iaWYqXOPZ
         Z/4XRgslioiPTzktxOtjAOpNIUvBKHMR/oGSGhv6gOHGWDl35VQxaxtSkrZ//uOsqERm
         agolgOaUZyKpg9uVbtkiDL4qw7kl17DRaf++i6RwNIV0EwkRSB6FfGljDwhyNqPPBU/D
         GvoJXY/En9vBmbBEvSwec6BcVj3RptnHX9PgJPHevyx+Bn6hVg7HyjfPsDzbZeWE2+4q
         A5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739611512; x=1740216312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbpcipICDHXuME30jOt6GpmvUkIPw+/TuJhtLOZoIJE=;
        b=hU4dLr/eJ9PcnFf5Bxk6We3sWw0liC8VLahmHr1CgH1xzBYSW/7+vQyssSh2AcvIft
         XTrqOyYGC8IoSGLSSBW/kPrNXBD7kuSmOslwu6A9KKuCOQ2x1MyGTuYIjmr0wsaneJh+
         XUHELSGTIkSD/d8uFpgejXKrImF5Zvzro9wLvYjoUZkXAfofECt+TG2Btl3ql0Cky4Hd
         YZc28i1kVcw4wtzU0FN7r52ndFwqIYRMcXcMp++fkrv2ZeQ7eT24lAYmYdvduvuk40Kp
         ELBvzj43ql7qrhnbPJgJqaIPdcFZ6nAkWOC/9kCCrZoqrePjDlCQYnjZqhlLFoylicrA
         j3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCX2q4SfEIkRxSK9fdvxcODrEQ54qeYf/EIeZhcXfWgLh+eKO9PUGo8m5lZYOe/mZjUKUe3tTme2GwkD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpvk6niYP2qWROvDB/OjLoTNqewQUxmFaQF2OK35FUuhtBUom5
	GeILh0nGJ5yPJJ6lv8hzkCXaVOWT39c/GUOWWj57UVjW3pdkCk9QD2JXlWV7z3A=
X-Gm-Gg: ASbGnctJc+M/aWKIIez7c2v5vu09+gj47PfpQzkECVbJ//BdDrxl3KMs6USFYMK1KJU
	q3sk3ZCrnMo0ghBlZD07y5O9f3bsaRyT7jHHIfO7Q25S8Ut4xsLJlMU8OUj5qOn5uuTqb3wp8r5
	wWCQas1n+IuRnIVZqI0fTAYgxiuZ51vPp0RgHdkq6brMzjPG0xl/qCEpFowRcVV9XnNgGTBAjWG
	W8jwohCA8vllACoYyrFGg+bHGo2WTN+kpCFXL+SVr0QyOecfPwdze6LeLc92o/QbWegY+HD+wLH
	Rf63u+f4YV2o
X-Google-Smtp-Source: AGHT+IFkUX2lCfN6as9yUxvWctb2+wcKM91fqinvxlY72zNbgOkS02wV6iv5kqX++4LIwQqaOdaE+A==
X-Received: by 2002:a05:600c:4fc9:b0:439:564a:6503 with SMTP id 5b1f17b1804b1-4396e705d5fmr28556145e9.18.1739611511767;
        Sat, 15 Feb 2025 01:25:11 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de0:6b3:d799:3d4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04ee2fsm95776445e9.4.2025.02.15.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:25:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc3 - take 2
Date: Sat, 15 Feb 2025 10:25:08 +0100
Message-ID: <20250215092508.5849-1-brgl@bgdev.pl>
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

Here's a second attempt at the PR with fixes for the upcoming RC. The
sparse warning I mentioned in my previous email turned out to be a false
positive - the "offending" commit wasn't the culprit - but I removed it
anyway and will send it again next week with the sparse issue fixed
separately.

Details for this one are in the signed tag.

Please pull,
Bartosz

The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc3-take2

for you to fetch changes up to 7b4aebeecbbd5b5fe73e35fad3f62ed21aa7ef44:

  gpiolib: Fix crash on error in gpiochip_get_ngpios() (2025-02-13 18:51:39 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc3 - take 2

- fix interrupt handling issues in gpio-bcm-kona
- add an ACPI quirk for Acer Nitro ANV14 fixing an issue with spurious
  wake up events
- add missing return value checks to gpio-stmpe
- fix a crash in error path in gpiochip_get_ngpios()

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: Fix crash on error in gpiochip_get_ngpios()

Artur Weber (3):
      gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
      gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
      gpio: bcm-kona: Add missing newline to dev_err format string

Mario Limonciello (1):
      gpiolib: acpi: Add a quirk for Acer Nitro ANV14

Wentao Liang (1):
      gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock

 drivers/gpio/gpio-bcm-kona.c | 71 ++++++++++++++++++++++++++++++++++++--------
 drivers/gpio/gpio-stmpe.c    | 15 ++++++++--
 drivers/gpio/gpiolib-acpi.c  | 14 +++++++++
 drivers/gpio/gpiolib.c       |  6 ++--
 4 files changed, 87 insertions(+), 19 deletions(-)

