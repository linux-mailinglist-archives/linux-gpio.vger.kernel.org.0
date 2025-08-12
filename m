Return-Path: <linux-gpio+bounces-24252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450AB223B6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BDFB1B61F55
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F70A2EA495;
	Tue, 12 Aug 2025 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vI/pYkMt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7B2D3748
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992341; cv=none; b=nZawoOadTvAwVaMAXUpD0yK+SdNKIuuPZ03Ya5hzyL/BeM9mL6AiBE0oMeJr3ag99UhCEpT/0ukAfDrgio/X/UB87Z5j+YM0Sg54zoyXl8ZzGEN/quqrIsdOhUx1CAbKh3iO5DmkahbjlPnikTQchzw3m0tdbvNj7HbC1gr8wCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992341; c=relaxed/simple;
	bh=F4i1WoIbOr27g2E4zkKyu21uLi8iliLJPw08fn/pqu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ng60nruvIEPrAR63gAGioEt6ljybK1ma5C6QFF+/BORYC+jfwJ2uodNkJXLrZ6l6JvmDAO/tbk4uQLPf+figwAY6rzNXKJIqJ+ql5VUTGBY9w55PNZauLNuxORDaD2QMLN79vM+/qEYFpJLLpzPi9l9IyjhTswaoBla7q/TJttQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vI/pYkMt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458ba079338so40706215e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992332; x=1755597132; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RB0uz3KhCKwDWAd49C9Ih5QwxR0kHWB+azypPaZag0Y=;
        b=vI/pYkMtF6ugkDsmI74xO26R+kz6CY+Th5PgEt2myX0vjEit9G8UFSWg7kyqP2B9fk
         ZYAuxRIxm/c/oIgZRmgE4mfyDWqKri4GdRz4WCHRWM/Kei/H2r0Gkz4or3b7fg3ynxAf
         nWqnPIUYQXxbGJwu9AUnCvU9Yap+cHhs6VHsBHshmHon6t2Kmm8VtkadlIAywCD5MrKH
         jW4MsQ+apr4EKRmSBhiYNjKcI1rkm623hTaM1CuhV1anNwvO++f22tL24BhqoWhIy8NK
         MEs0tjlTx32VqlMVCrVmUP/IzyoR2BhcH4ApeRgwZ3G6RiqtQuxVfPzXh+xjBQZNhRmX
         btgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992332; x=1755597132;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB0uz3KhCKwDWAd49C9Ih5QwxR0kHWB+azypPaZag0Y=;
        b=jpFKCjaUil3aC8qCxRn4GcQQCKfXK1qyTmHHm1I4SmJzpj8FwtdSA12sBzTqLuP7AA
         Cr11/uz9TIkshP+Hd163GBqPUgLUzIFYssfIzXUIwJf/J68xUrhp56lq3AaFuOyClLcq
         2PuF4luuJgtJpbQiNJd0pm2Of4FHLBrrAnEGaWiSjlUqpxYWptBzeaX9mrHdvVMS7CpM
         42NtiLSPHXt6fHhEgU2a0QtfYJ76PuHdEl58JgvAxdUYpgBf/ysF5zBgNaAf1IKKw6oO
         uIN0RiYwMN7VKGJkR6pZA8zZ8mtSadwGKRqb75mIkxIQ05Tm1ghuM5YJgVGkNdDypoTL
         wHJw==
X-Gm-Message-State: AOJu0YyyJn6hujAFMlMlna9jEMysWSGJ523JtAsQ8vrZTHUigtFmVdaL
	pCynWLWlJ1n5IQKofpH7OKtVTh0GfiGlLOcyHxZVbkXK5dFe8i8ye357TAvmxxNK6LjCf2CRbQD
	4BuWl
X-Gm-Gg: ASbGnctOeVlch77tpAM+Lu2YpahAf1HbbibMkqJ6VlJ0zy2JuNpmkR/fT/o/vEnGXAi
	yLfsZissK9ZXqlVFo3MSNuh48ig9iT58LzCcD573J5NKwrroIsUHBFdhlxUbEUbmX/bszgD8zgv
	2ydJRwVSkPArifcHxO4+z2WSjVz1G65U67UDbkBZIW5OH9OkkFCaPA4dHEKXUSN0C7mfuPYfcJX
	3xP+oGsUL3432QSbkqAm6xjD5e+OBe/DzRtPJa7jf+PfsFgOdMUuCEwTLOcX2F9ONxNQJjlVOrR
	4nzDEEm2IMixN8qcZaSM3IETv4JiaSw/mjdXCR4Q0juxKfV+sUKYz57H2iyv7uJREsjn4jZhutu
	iCwzbIkzAFzYQ4GI=
X-Google-Smtp-Source: AGHT+IH3eIyt3nJktWsUpR2rtIuEOtr2r5n+aVM2Npgzbb588pn0LgFEddNRASkqSyELBdNKC2O6rg==
X-Received: by 2002:a05:600c:358a:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-45a138bb40bmr10760705e9.3.1754992332417;
        Tue, 12 Aug 2025 02:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
Date: Tue, 12 Aug 2025 11:51:57 +0200
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0Om2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyML3fSCzHzd3FwgAWYl5+eV6ZoZGZsamicbp6SZmygBdRYUpaZlVoB
 NjY6trQUAr2S982UAAAA=
X-Change-ID: 20250728-gpio-mmio-gpio-conv-623517c3df74
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=F4i1WoIbOr27g2E4zkKyu21uLi8iliLJPw08fn/pqu4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7BLkgGIqyWoUu3WVXqVHrRnFIT5ZstC4FCi
 C/2n2j8EniJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOwQAKCRARpy6gFHHX
 cvvHD/9Dfdy9g9z1jpIorWAGa5Qm0jhn9HoktvxvStWvOBPChhMiLufNHTDPFqZ329Y0vvkhuza
 SRf/2Diask/hwJhkZKgTTZlhweDLyt8vMaw7ObD46qB8sLXv6uT59qBwmdLOYFSAYQDeNW8aiLf
 C26Dia64u1oC/+ddxiKf/1TIzge47j4Yevu38YKhRn9jt+vjBLWojDxIQGkKOKxwyhVVM6mR7+V
 Tlng77GUWHZaHjNVdfCvIaxmkIIj/7feZRE94W5x8/ZyGJHwSl74LOM/1whmKeCm1G9stkUL2Ca
 ZrchpQh11IZ0aFsgrqCcnzY89fim2hHdPwSsqfyodrLc4VbYeDPGumnvw7W1k32PWES9YyFkwmG
 aP+z+n9mtH8U7gNWfTHZ1B1fBYfZt8mqOxuDQX15NBn65lm7jZAOmdiBAkvBxbI32aLFdKr5Z86
 V6eSxEcDlEyYJwBZGCyVmpXOPTCqWCVFU8uaZFONf104XhwC9WZCQD8eM3Oy/jO+nv1ttgfzSob
 yPIN/Pne4Soesp1BRY7hPKeX8iYnduIUlngRGM9JJ29v/sXBa42x2spiSsf5myl1IMIgqolzkPM
 p5T2HoJgQ08zcwQyxb+OmWqkEOkNFVdspJo3gQd05RZuLTtrtXeVbll1YztO6grYMrSddXcyqle
 6kyfg8u/BjC7ZVg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This is the first round of GPIO driver conversions to using the
modernized variant of the gpio-mmio API.

While at it: sprinkle in some additional tweaks and refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (14):
      gpio: generic: provide to_gpio_generic_chip()
      gpio: generic: provide helpers for reading and writing registers
      gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
      gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
      gpio: ts4800: use generic device properties
      gpio: ts4800: use dev_err_probe()
      gpio: ts4800: use new generic GPIO chip API
      gpio: loongson-64bit: use new generic GPIO chip API
      gpio: dwapb: use new generic GPIO chip API
      gpio: amdpt: use new generic GPIO chip API
      gpio: rda: use new generic GPIO chip API
      gpio: grgpio: use new generic GPIO chip API
      gpio: mpc8xxx: use new generic GPIO chip API
      gpio: ge: use new generic GPIO chip API

 drivers/gpio/gpio-amdpt.c          |  44 +++++-----
 drivers/gpio/gpio-dwapb.c          | 160 ++++++++++++++++++++-----------------
 drivers/gpio/gpio-ge.c             |  25 ++++--
 drivers/gpio/gpio-grgpio.c         |  87 ++++++++++----------
 drivers/gpio/gpio-hisi.c           |   3 +-
 drivers/gpio/gpio-loongson-64bit.c |  42 +++++-----
 drivers/gpio/gpio-mpc8xxx.c        | 102 +++++++++++++----------
 drivers/gpio/gpio-rda.c            |  35 ++++----
 drivers/gpio/gpio-ts4800.c         |  39 ++++-----
 include/linux/gpio/generic.h       |  37 +++++++++
 10 files changed, 337 insertions(+), 237 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-gpio-mmio-gpio-conv-623517c3df74

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


