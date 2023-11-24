Return-Path: <linux-gpio+bounces-493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2937F84CB
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 20:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF8DB1C27449
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 19:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACCA3307D;
	Fri, 24 Nov 2023 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ux+2bQwC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDCB1B6
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 11:38:23 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b2c8e91afso16562955e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700854702; x=1701459502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oo29Pg6VNXcoZW2fzTe3Exl4UruvYkYsRFBRPzTu39Q=;
        b=Ux+2bQwCt6O3XZb+roPLnnpioroTIGqzNBkZVJ/dbl1IIv5fQTWg+tBIpBuealOs+4
         3jWxmcWADfpQ9a2l1/MkW/F92BSwbOk3QFW8w1Fm2J6+cSfcgsZ9kyWdxjpd1oZJ3sru
         ldebIBLFmaemjB0qgOS6sbxKoeC+Z23fWMVAidqIhMa/Ll0ArF8wV0ZxrXbp9dvcDtak
         Jz9Yiri+MH1SeHnBGilVlXDj6td+88CPp0GgWad37Vm3YTD7u4ubCayagVeVU3F8ttU0
         dFpnODiE3Ez8V7iZYC3A3mn4ZVG8iTTZ14OHyyiMJyDC54wtmprXMiQDLIicNgB1WqMj
         hYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700854702; x=1701459502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oo29Pg6VNXcoZW2fzTe3Exl4UruvYkYsRFBRPzTu39Q=;
        b=YbRWZyMMhyVWbxZwro3kclrBB0xoKdxsoogLtBuNjkf/rN+dSfIOECuDchi59LL8Cg
         62IoYtn/Djo99N7AQJRbu/d0A9OeoUlhmttfCQukvAGvjRonPQbCm2cQg5fpziuq1fBE
         U/2PdgDNJbvf0LChzptvUR3H9kw68/DUcK0ZEAig1XMKxlnmTa7bpm2EMnLS8N3HBZ3K
         HRJUOlxnj+QRBZStNv09dDwar4xwT2hsB/agRVW4BZl8HDcn8758YOnZXOul9k8Bfi9i
         MhN+3nQGmP3uiEdrTxBHIJH1lNVaP3PdRLYqgqbVAUBYN3NZGGIcoAXVL641r2oBJ5gL
         v8gQ==
X-Gm-Message-State: AOJu0YziWoiUJN2L+rSNQdHc1kZPdSIb3qJQK25iUVP6H0YTwX6HX4pk
	fFFtDG6IlebvLHf1XqA/3P5LVA==
X-Google-Smtp-Source: AGHT+IGfl+OyZpDfH2xQ9iX9WVmKJbwY+46/sluTw97DybZiS6lCSpXeGR3tYuA0CS+9zYqPo+CwoA==
X-Received: by 2002:a05:600c:1384:b0:409:19a0:d247 with SMTP id u4-20020a05600c138400b0040919a0d247mr3176861wmf.18.1700854701875;
        Fri, 24 Nov 2023 11:38:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e3fd:5fc1:c04:51df])
        by smtp.gmail.com with ESMTPSA id n28-20020a05600c3b9c00b0040772934b12sm6599320wms.7.2023.11.24.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 11:38:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: immutable branch between GPIO and pinctrl trees for v6.8-rc1
Date: Fri, 24 Nov 2023 20:38:16 +0100
Message-Id: <20231124193816.30412-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here's the immutable branch for you to pull into the pinctrl tree that
provides the new gpio_device_get_label() getter.

Bart

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-device-get-label-for-v6.8-rc1

for you to fetch changes up to d1f7728259ef02ac20b7afb6e7eb5a9eb1696c25:

  gpiolib: provide gpio_device_get_label() (2023-11-24 20:27:37 +0100)

----------------------------------------------------------------
gpiolib: provide gpio_device_get_label()

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpiolib: provide gpio_device_get_label()

 drivers/gpio/gpiolib.c      | 14 ++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 15 insertions(+)

