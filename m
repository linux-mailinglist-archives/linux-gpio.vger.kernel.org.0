Return-Path: <linux-gpio+bounces-21934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF596AE1B51
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 14:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1596F7A5D2E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 12:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E80B28BA8A;
	Fri, 20 Jun 2025 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwwelMaY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2C4289350
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424291; cv=none; b=rRaO0l9P1Uc5onqCBKhkQuLQy3DoZ3TC8SVAs2R/hb+K6eKD9/zJ/yOZipO+nUQk5yvoUB0Dcequn3T92c6PD/ehO4oNhJJRs2vcZWETado/5yo5FP0O1OnjkMWPzp4Ry7fZ0zQUfNbNrvKxlkcHixdNlKgBqNQC/i5OdmovjT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424291; c=relaxed/simple;
	bh=facWMRMUl1Oxqe3P5tnVHkTcPnUhYcPpFABgGU/Gan8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bhx2yqFRY6X+tz59WhFBe87dLYlqf3+xM/5S4shKQmAnGLNXWVa4cO3WSwfgoqCz4HhzCTy4uP9BU+IchJD6P54FcngJGJn2Bn8JbBDp8dYePKuJspIo3x4ocJoLyyDiySpSS/0IUaEE/BkW5S8jk0bkYFrUD8+S9SMsQLf//Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BwwelMaY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so9438185e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750424288; x=1751029088; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VBFAz+VW8+azvZgdQGOtzkTpOKEqgZL3Yhe+StdtMMU=;
        b=BwwelMaYkdSl8lGOd6D8NpVi/2+gTKuHsy8qFzZe1flHEEhyuyuAqpi8PYyBAgp1+s
         4r1yhoLGyKJ/7crPE4lxJ1ff1YtJ2PnpKmi8K7G2nxz6zvBmphTofHzUTvndYVdOICxe
         Ek5sAtZ49swhi/xLkQX6+y5rQd6HZhK2ozC2zSnAU9/o1adGuuoLHMUhAlc/VOkHekaA
         JM38mFsLtGJNbAthKu0GKE8u4fE2kzQ7hy6p48VpakLXPvMsJ1YZy97zcPucWhcMET8V
         DKKrP5y1CfAduNveM4nIViJ0HCqUGC/PVgEELTmsafXwz7X6zLqUO5lR9YQ2bBSHLG5A
         61GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424288; x=1751029088;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBFAz+VW8+azvZgdQGOtzkTpOKEqgZL3Yhe+StdtMMU=;
        b=w+mpRthEpSVyRV/JR8TvmrGOEhcExxgDc6CX2rHYD/ONOg5LB6j5iloWlclCVE+Ej6
         WKfU1HTbdZ1p0cWdr0K0BnF+kBAUAHmWfkbtxESXk/l8wo7dgLrJuk4NeQtfcWB9tfgE
         QHSkq6O9DWUflFOF5fWQc8Y2Yu8xgfK+OBWTxoHJuTxmX99gC/HLQbPlLpopULU04Au/
         BaZtAtVcVHbLXR4ODvkDWwe3G3hUBtahbp6fxWGx/AKy04R6KZCVehx4QIrHcR7pX1Qg
         YkJF244g3ZAhqvTd1HTrVNVcw6mnAux3jJunnGVTE5zKNKVqWqXjn8acg5KL1Z0YL0PF
         nhzA==
X-Gm-Message-State: AOJu0YwXd6equLgCO2ERTWb31uQNVkYypMkswFd0kjCFMozKJayr2+NM
	kah01hz/0tfrM9tjZUuLdly2wgWEBqyD0vr4pfmp9xVC8C8Y8PNwubdm7G7E8ZIdr+yi/BdL67h
	FyiTuE50=
X-Gm-Gg: ASbGnctmHUlwvWPWgW8bBzS3nyrP2oA3SuP3bmSZWSu8z6KdBR27a4oM/rh+MtTLlDD
	2SyMSuPUy9XhQ82IPkM8FITEjNnVcdLq7dtOgfEz8d2IvLzKjJ8Dp1dsWJ3P7xToTxrjS2ypAxs
	45ghrvAW+sCnRjP5fUdJ3T55ET/bCsQ36SW7ni/XFY8saBB34nJ5en/GlvNrvCh92lHr3dRTLt4
	qpUGiWEJBBl3GpMu6mFC4U0HuzKZ2HPa/BGZON9vX/SyaKyOyJZe+kLjqzcBCBU0FFgJ0JlyDo5
	WEkLJFqdw7Gg7Rz5J/8MoD7X8dOZlBmIFpZWBW9Fh/hBW5Y+ZD/bDthH
X-Google-Smtp-Source: AGHT+IHa4eT6Zh9OUoVWuhNQucbNwcjnsqvJg/HT30kBlCA9HUxTf51e9oSipBLZqjqcK4a5/lrZ3g==
X-Received: by 2002:a05:600c:4fd1:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-453659c9fecmr25945265e9.12.1750424287864;
        Fri, 20 Jun 2025 05:58:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535fdf82f9sm50522975e9.29.2025.06.20.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:58:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpio: improve gpiod_is_equal()
Date: Fri, 20 Jun 2025 14:58:00 +0200
Message-Id: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhaVWgC/x3MQQqAIBBA0avErBsww6CuEi1EpxqotJEkiO6et
 HyL/x9IJEwJhuoBocyJw1HQ1BW41R4LIfti0Eob1WmFS+TgkRPSedkNeY8SMtpuVn1vqHXOQGm
 j0Mz3/x2n9/0ALDmvymcAAAA=
X-Change-ID: 20250620-gpiod-is-equal-improv-a6f0995e3cc5
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=682;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=facWMRMUl1Oxqe3P5tnVHkTcPnUhYcPpFABgGU/Gan8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoVVrbmsB4k9eFPTgOVdibKSkySpffvRusgoe+3
 8DgSFmC9LiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFVa2wAKCRARpy6gFHHX
 cjxYD/9Qh4Ze4uoE3ASOfe5hy4CVVmRhntOXkTlWqe1tLEHkeeLRis+1pmbrh0aJov3MAyvjG34
 Nwm8dMfZtICD9vVo2LkKc1FB+2aXZLFbkQOcQaurPAJfJqrErZZ8TBq+oGelBM0r9tIqWpJKtIn
 wUORix4AIuLXepFll5czbOi0BkSQLD+mc5EkS5mdf7MXgEaLaMZzZ4T9YZSlLdXR2SGI8lDaiDA
 avWQJq5rOcA5u3Br+nJQWBLjFUMWq0zBPg8d2Pw/E3CDK8BaXuR/e0whw3VvrpQ8nA/oHngiGj7
 wIjKFU4Dq3TSKW/eDTFtH0dg6KiqLCHE4EQVHWkIAthogmZrjQ/YCO/QZkIKWB3dPbNfguRXjWu
 emq0KobqoB2Q09wyrPQalrKeg18XUHmVUH3qobML3kcw1loehmXze2AW1b3yOXAV3xaHc4K4xiB
 RMc0Su+blLeAt+YvQcgohi3pjPaGScelDcb1CGvgpum2zl3UTDH+h/Ya1SylkWh39zQjc+NotXu
 M/zyj6272XH0Y1PInqNBInyefhdGrhNNkpMGbKapfbUNsgIXUuWiki4oRttC+YQlUDQOK3OrHXY
 IV/MKR2sR7pPxPgHcC4zbdOqGXFAgzPt6VtE1HoCZPH38Bxg8mJRRkEYic51IatKB/AMTO+zRm3
 JAuCp01Wu5jVzWA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This short series contains small improvements to the gpiod_is_equal()
GPIO descriptor comparator added last cycle.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      gpio: constify arguments of gpiod_is_equal()
      gpio: make gpiod_is_equal() arguments stricter

 drivers/gpio/gpiolib.c        | 29 +++++++++++++++--------------
 include/linux/gpio/consumer.h |  5 +++--
 2 files changed, 18 insertions(+), 16 deletions(-)
---
base-commit: 2c923c845768a0f0e34b8161d70bc96525385782
change-id: 20250620-gpiod-is-equal-improv-a6f0995e3cc5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


