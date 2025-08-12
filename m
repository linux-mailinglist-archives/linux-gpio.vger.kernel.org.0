Return-Path: <linux-gpio+bounces-24286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F8B22670
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96A0B17370E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8152EF677;
	Tue, 12 Aug 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VHg0GuDW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56FC2EF662
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000774; cv=none; b=WMBJBL6e9fOTkxVXSjda+e3I2TQQnX5cknUxBSqLQmLOXrFNn0NjUXWBUOkE+I5/jqXHplSdstSah6ARTCWa1E4I/W0UkAqumLSpzQE5bPQbKFuLN6QQUyWxf7QLtiiYis9YyPkVAktkLaWfEeffkm5J91mZTS+c4V6arKFxwI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000774; c=relaxed/simple;
	bh=ufruTN/rsMjpZogkg1bX/2fwukSGxpr2NY77MLQ1ScE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mC2rfSNY9z7+fS0OPL7EzBK79KZo5WMaaDyVLEz0nKMV/dZlpJBshyb5+sQPu67BlP7nOwhBBY0gJNrroSkxv+4WXFbpwfCpRIrGCMVT19r7uVeo4kfCaLwGo7/vx7JYsFrq1WTFQpuOEA13uaVHhEiNijNYN1HjbEuO/MEfwXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VHg0GuDW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so52950915e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000771; x=1755605571; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=;
        b=VHg0GuDW7vkCLR3aBnFdS+Hb8ddJ69DTgnq/knrKwrBaKlwMYdA6k5N2XIefgvQbRg
         FLZH0eyD/Bjgd5fAftGIWx2yhlqLq+xq2GoBnnlctHTcbDE3f4Ylhnzzb6WK+1Cdc9qe
         Kh73Khe3GCTGZsHJiF8sg5sYHbZPXlkAxs17zdM8AOdmgC8kSmMVpAEbU8Gf4pcFk5wN
         7QQQ5ikeiAf9uVGOCRVSeQmAZfzosyYJeOCvYf2XCTOKMGTJyE51svAhJQRLtS777oAk
         HkV0cezupfRsLIMv3rNu08QTC3myb5AGj6va7oDQOkynE9dMxAp99ibQ3ZnB5BMze6pk
         dQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000771; x=1755605571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=;
        b=tOfiLNw0ChWWPOiO6h2jyJ1Q4TL7/ahTzX80Q0LKwNOzCCRZETHOa+Cn+5jK7UusbQ
         DQjWS/HWWC/KZbDr1yRa7M9g/D+cZmVHdD7mGnVRpz0Iqy8kF5s2yRFs8kuXkiHFh/le
         aEmiYNcRONUGN6VXQRgUv0V7YORi09EfNNZvwWqMcMJf1uVsmN/QpV7wmKGCgILBxOwu
         o0WlxrHtC3WT4h0nYrXIEnJbnmBugAOy1ah48jUmXdsD7Tf2PJ8+dcNiv+p1BUXbEndn
         t/Ds78ebGoJkeNsAIhBJMwUeCyqO7de4jmzyCuXOT890JmGmx/oQtQsyTdir6dOZc0Lf
         Zdkw==
X-Gm-Message-State: AOJu0YzESt7TtFn9A10ErQqWCFJ6Jiyik2+Nbm3NdF5IKa83Tm3Ba0UG
	/BQ+TKXf+JOmSNElrlthhzdPaKpBxPWxb+IWjLhCd3EKyvFq1gEuR9EKRHeoFiIpRkQ=
X-Gm-Gg: ASbGncstynC6If5I/aBIUwm+OQYCsCO9uZOzn80JUzArg+gLZQQM6Jr6JyMxy1mEymJ
	uCXza4rqVeJj7p+C8t16KCbMdHRnaB6rYnuXKgrM9zR9xT4denPKJMtSj1Qef/j0mzUQYD2WZYA
	gyyO30ziiyQmED+y9wkj1AetUviofmeXkRrWK44HeFSY/x98OE92k4wRUOYL8aHwdzYUFXdekVx
	eTes5gj4hAPCndCWFZUU0k08fMozKyFVrWuENhTN1uCcORjgltolVVKS1TlwJ+MRsn3FdqiH7sW
	NGmHce+Z+aOj4tieJhzxdgIQsEHVp/8oa2guhOdobv19AU6G1WbMUazE1omrfMne+Yt1gfHggOU
	1xtr1rCc5Gi275pU=
X-Google-Smtp-Source: AGHT+IGrKlosN22orMav7f+vJj0S00uwK1i7LZju2ODkMixHCeR7FanAHC/Iu6OLgDLOv4uYkqeKQg==
X-Received: by 2002:a05:600c:524a:b0:456:1204:e7e6 with SMTP id 5b1f17b1804b1-459f4f517dbmr134199135e9.11.1755000770984;
        Tue, 12 Aug 2025 05:12:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
Date: Tue, 12 Aug 2025 14:12:42 +0200
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALovm2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyML3fSCzHzd3FwgAWYl5+eV6ZoZGZsamicbp6SZmygBdRYUpaZlVoB
 NjVYKcg129XNRiq2tBQA5H9IJbQAAAA==
X-Change-ID: 20250728-gpio-mmio-gpio-conv-623517c3df74
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ufruTN/rsMjpZogkg1bX/2fwukSGxpr2NY77MLQ1ScE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy++n89pg/9ESyGDJ0sRR4xk/Cmg/ARiF1xR9
 QgmE1/ouKWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvgAKCRARpy6gFHHX
 cjOxEACZJpWWPGUL9CfHiHTHVE1TDp9GRb5oraK1gn34WFUDtudWF/KwjDYDi1lguczQxt+c7Dd
 IqnXpHRgrc8ncZmbUskDlzhu54x85mdlun89rTwhTrS0Y3bVQcGyagxVBep4QkzBoCOvdzeWbgi
 9jBraop/CGfr8bbZc96GBP4A1eyAdt6zINaWqHZOWG90ylNJWRAacUiWAVedcG9X/gA2+eX7tnr
 yTF1LmdMVJjAubARxEO5T4/lgevQtBxvlUtNqRoI5IK9vk8wG6l457u4JPHby2jMYoNfrsjZttO
 KSaRdBBT5VzDKOJxcysnZkTvww0zewKCemWKXsF9MFDb5znPOjg9824NKyw4JB51Fc9aRa++JUm
 qbvsQq5skDcO1O+8L5ghkDriXZaHeYxOFnFlDjrax63RTwb7V71bksIhrdcjsf/r/pxy7o/5/nZ
 rXvn6JM9dDW7NavxZSoA9cfPg/7mftwO6rfrGdUOoh2IQye4X/3JLo5Gy2hp4kau1fSPH+GrSz0
 1bPijJE+EwbMLxdmUmse9dB+Mv8FYgEQlQhmqijTAL4KC2cnURSWoMMzvInCJ/y0fPkfJI0mDXS
 FfN6KDFWdmXgI50RWaslZYkunzL191aZUv4ZQNGjUawpagr7W/s5nlQKNDo0q8ua5lcCKC33OtM
 NnksUq3oJlC07aw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

I hit a network error when sending for the first one, retrying now.

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


