Return-Path: <linux-gpio+bounces-14946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB9EA16E43
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 15:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E47C1889B08
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 14:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4681E0E0A;
	Mon, 20 Jan 2025 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="scZCuBwa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DF01E515
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2025 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737382645; cv=none; b=qh+ZnnQoG1bgifAwlnlxqnhL/BvB5KiUr2uwnp3W6xCRuBEdQRQ1+5urWbx48RT+DSAPgj0TPg/Zij4Dia0+DD387xloE/R14PoSxyTDeoZYbCOYeiEs36+zl76gIyXCUQjv4yRAPx5lWlLFkCA1O2PWgpKF5mu2Kfop2SIe+Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737382645; c=relaxed/simple;
	bh=OPpKtYSb1Cy7c4OX0qOiA8OaUUijqIClYobv9UVC2xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uEIQL64atixbdEk2wwrQevPCuQ98StGNSal0lH+RSMz5AYwr3IYTjLpqPxyXhrXJWjkHm92lnCfFW3nby21koOpbMQt8BFr8tOJTpxFC5UjFQZ/ODDNSxD70arEGnXpu+vR848ZL8Y9vqoap0AZGJIGZrH1AwMpaySij8uVDKWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=scZCuBwa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361815b96cso31248875e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2025 06:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737382642; x=1737987442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPzc2cHCUsOgr5cNjKJfbuppxSeFh0k+XfLt8CnA8VI=;
        b=scZCuBwaA36JTTUrW08o0aCewk4rwcoC0c3EOLuGUlCOjJlCjY4mT7SAFRnDiV/zTC
         3KunjV0fZFZodcZdQgNwyYUe1+J9eH5NhCOqXjyzU6uNAJEyQx2PxIn8OyB/DoT61Sm0
         AFy0y/2JcYwytLCUM1ptG88MBH2ZcgPO9tmZ5iBBZ4mqpD4Um57Cv0oHe/nN652iXs53
         E9U+c56tErIzcFtfblteAMALfDXrd87YwJXV8jSpY823nduF9WG6wvetC+uBYkxhTHpz
         IeRw6TwEinzJHFrY3Gb8NupFgt/HUYS/4ffSufmPIWMDGiUVcBFbu+rJcv6TZUotyK0K
         bW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737382642; x=1737987442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPzc2cHCUsOgr5cNjKJfbuppxSeFh0k+XfLt8CnA8VI=;
        b=cjMATKZB13ADXHF1fwatdzm+3ZXTvOZtqOd+DvGzEOSBAnhfcL4krE2J3n3dtP0Gm9
         RZ0kxWfKGKhZiwITTHbjXcU3LmTYPSVSI3St4qvjfwNoy/bc64DCgrwizXCgt7tu7H4E
         rKpVypkIRZkWPLJ6FytUo7aQ/83gcI6Pepv6XGZ9rdDvKS+Rw0G1Ybf5LvPDIkV2nC6F
         zvdtHtcqorjW4oOTyYwBtZBmtoecS3q5O14dvo7rwvK3zkwhJwSGHzgSoIjxs1pF7w4z
         DGaw7I9ogL/dw0F4mKBdX+hhG1UISiIDHY6Iv9Mi4N+gJNY4pWNvHhwaBxUdyYCcwrsA
         f/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX8fDd0Z89AzhHVhWeVDu5wTpWMZEplDvmqaX8rF3cITptGvmBjrlMdD+0XP6EwEfFOkNC+pNft67j4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/KVp1UvKRHDpu+HsyUrMSIDW0uCDQwZ0Z12aPUMoeLn0TDXQX
	3lACI9SJsv5KB8qQsXNdjVEulrpMBtWm6CtdBsItlcKYyz3pvN49PMmBHNkMOb0=
X-Gm-Gg: ASbGnctTXQvPDkaItvP2cq4DM13KWw5KkE9tIR4fxDO9EIuA3cWFA5Vb71wRlWA+kB1
	Pv/rKhU+JkGh6WZNe69cX61MoIl1aARVZRFgKAMuZOf84VAU7A1a1dc/4bBPpv9fLYe8hVdaiuM
	eVg7SEC1GORTnOBy2v2vIRK4ouCs3fXVj4r2V7I/XLZD4qP8qGngqnorY+7CaraJV27IovyneQW
	Hqcpt6iuE/wlQdBC/bIc4p6ipt3cYkYMUwNsAVJyCgGHf4gaFD4QfMgP8iFaF2Dccd5/w==
X-Google-Smtp-Source: AGHT+IFkZNToEgZTRCIB8RdJ81C/axao23VMMSB0C4P+toKaF0hefOy0kRgccnadxOVKDFE/WBUeUA==
X-Received: by 2002:a05:600c:1f10:b0:434:ff9d:a370 with SMTP id 5b1f17b1804b1-438912d1d49mr133599235e9.0.1737382642016;
        Mon, 20 Jan 2025 06:17:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1e6f:aa81:b243:8253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c753c60csm197829235e9.36.2025.01.20.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:17:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio updates for v6.14-rc1
Date: Mon, 20 Jan 2025 15:17:17 +0100
Message-ID: <20250120141718.329518-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
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

Thanks to little activity in December, this PR is really tiny. Just a few
updates to drivers and device-tree bindings. Details are in the signed
tag.

Please pull,
Bartosz Golaszewski

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.14-rc1

for you to fetch changes up to b0fa00fe38f673c986633c11087274deeb7ce7b0:

  gpio: regmap: Use generic request/free ops (2025-01-13 09:20:25 +0100)

----------------------------------------------------------------
gpio updates for v6.14-rc1

Driver improvements:
- support a new model in gpio-mpc8xxx
- refactor gpio-tqmx86 and add support for direction setting
- allow building gpio-omap with COMPILE_TEST=y
- use gpiochip_get_data() instead of dev_get_drvdata() in gpio-twl6040
- drop unued field from driver data in gpio-altera
- use generic request/free callbacks in gpio-regmap for better integration
  with pinctrl
- use dev_err_probe() where applicable in gpio-pca953x
- use existing dedicated GPIO defines in gpio-tps65219 instead of custom
  ones

DT bindings:
- document a new model in fsl,qoriq-gpio
- explain the chip's latch clock pin and how it works like chip-select
  in fairchild,74hc595
- enable the gpio-line-names property for gpio-brcmstb

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: omap: allow building the module with COMPILE_TEST=y

Dave Stevenson (1):
      dt-bindings: gpio: brcmstb: permit gpio-line-names property

J. Neuschäfer (3):
      dt-bindings: gpio: fairchild,74hc595: Document chip select vs. latch clock
      dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,mpc8314-gpio
      gpio: mpc8xxx: Add MPC8314 support

Luca Ceresoli (1):
      gpio: pca953x: log an error when failing to get the reset GPIO

Matthias Schiffer (5):
      gpio: tqmx86: add macros for interrupt configuration
      gpio: tqmx86: consistently refer to IRQs by hwirq numbers
      gpio: tqmx86: use cleanup guards for spinlock
      gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
      gpio: tqmx86: add support for changing GPIO directions

Rosen Penev (1):
      gpio: twl4030: use gpiochip_get_data

Sander Vanheule (1):
      gpio: regmap: Use generic request/free ops

Shree Ramamoorthy (1):
      gpio: tps65219: Use existing kernel gpio macros

Uwe Kleine-König (1):
      gpio: altera: Drop .mapped_irq from driver data

 .../bindings/gpio/brcm,brcmstb-gpio.yaml           |   4 +
 .../bindings/gpio/fairchild,74hc595.yaml           |  17 ++
 .../devicetree/bindings/gpio/fsl,qoriq-gpio.yaml   |   1 +
 drivers/gpio/Kconfig                               |   4 +-
 drivers/gpio/gpio-altera.c                         |   9 +-
 drivers/gpio/gpio-mpc8xxx.c                        |   1 +
 drivers/gpio/gpio-pca953x.c                        |   3 +-
 drivers/gpio/gpio-regmap.c                         |   2 +
 drivers/gpio/gpio-tps65219.c                       |  12 +-
 drivers/gpio/gpio-tqmx86.c                         | 206 ++++++++++++---------
 drivers/gpio/gpio-twl6040.c                        |   6 +-
 11 files changed, 160 insertions(+), 105 deletions(-)

