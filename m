Return-Path: <linux-gpio+bounces-12401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE2F9B83EB
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 21:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 338CAB20DA4
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 20:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431B51C9ED4;
	Thu, 31 Oct 2024 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1aFqk1k/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA18C1487E1
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404925; cv=none; b=GYzKg8eqIyOEgP3qUCqSV+Gwrvpxvaym42E694TO1FyWejx9Ye1LyVmOwDI2+VmKu5kvS8HOpYJT2gNe5t6f7700zUzk12hVZwHC0Y1z+hf23t1/c0iVHF8xzd106nuJ+6+KCMAU4+JdLohnKJHtsaH0LddcbSB1fwWZajWx2DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404925; c=relaxed/simple;
	bh=qxbmIB2837H8qrLnSe95Ux6ennyfvXtwA0OFnYRkLvs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bc//3KtWkhUA07F9v5cf+ULaCJ8t9R2cyLotE4jfIOKX/T0aXMrqdWdFgNmnUdxwOSun4ZYDxjpFAMFZJt6HLg9RyF++VCRUfxNoIzkzCtFYsJwvOoMgkqAkmiCuKeKX5XvuHf7hbmC39rYM5d8GkQB494iyWjqKrDgjWvIdfGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1aFqk1k/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d533b5412so813665f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 13:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730404921; x=1731009721; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6j8cZykRmFGwmulqs2LykVsQ/aIy8AeVYklYfK3peyw=;
        b=1aFqk1k/B+X6DB5vLhg9jlcqOAgb2NSMNn/JhQuA1Cjhlb51yPdSKmu/5aUpggXYbc
         tsZJRJQyTWA7VLJPhM63FDsOaDdAF/jQBw4WfMhRq/sC0XIvNHwR4+f32i49MCkm3xHT
         l1C6LQGSFIi03Q83pcOS7OFUR0AhoGOLBUWlEwq4MIsHq4suJT5MGxAtNBP6CANLfghP
         8iN+PXUWRvxXSdZ2ntUKnCco7/iIMN2fRm79nQzDZuBH2XWTNJR2MX4ItOA3tdkaS1+3
         CRvEzBg7ukmrO1nTfZWgZX60sV6aZZpbTSHVPMCrnF7azVn/lD3cbzf+rNKyQ7aNFhvd
         f/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404921; x=1731009721;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6j8cZykRmFGwmulqs2LykVsQ/aIy8AeVYklYfK3peyw=;
        b=orL5ijXdIwlii/gpthVsHUBVm/WKmQDaYmo2u9oSkN40G18YkiKi2k7uGP6KuHWB6S
         fZ4IU596QYjanikKIrCfyF8yedSXIA6Xze9Kv5euMsvXO72eKqevPh3W7f7wRanpSHiM
         M1DmKOh6grxeXm8NQFKkVAEWyuMva8DolbbyJSND9mLDsAIyjx7Rb6pPRmVqCAKB8FWD
         oOM7MV8Pxm0+F3blOTQ/EQCYg78AzkjjWiK+vdkybKKVUH83RbC2k4sNvVdaznQTvOU3
         EgsBCL3jyY9XIxheIBIvvp2RR7R3cDOtC511RoBkTWFuVc7cp8tlS3NenE1XN8w0daJu
         sDvA==
X-Gm-Message-State: AOJu0Yy4MY7GbLZuJo7ChBPgnDm6hpAjuz+kSKNHxuDlTV80ohNPBhkA
	e9Mq0y4A82ciplKxIjmlZpboL0Yx5Ot+CfzIanVQXANBkpd+zQFJJLJulH8/02nR6yabhuVRsqN
	o
X-Google-Smtp-Source: AGHT+IGheJlSvcAzK6q13fzt7G1Onug1tc2dmLYoshhnduEuKT0Lktz5rPc9MnInrr7WyHpGQ9JKhQ==
X-Received: by 2002:a5d:6902:0:b0:37d:4ebe:164f with SMTP id ffacd0b85a97d-38061200d23mr13358601f8f.46.1730404921008;
        Thu, 31 Oct 2024 13:02:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f39e:5519:d578:740])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189123sm3003993f8f.115.2024.10.31.13.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:02:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 0/5] gpio: sysfs: send character device notifications
 for sysfs class events
Date: Thu, 31 Oct 2024 21:01:50 +0100
Message-Id: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC7iI2cC/23OSwqDMBCA4atI1k1JJj676j1KF4lJdKAYSSRUx
 Ls3CgVLXf4D880sJBiPJpBbthBvIgZ0Q4r8kpG2l0NnKOrUBBjknAHQbkRHBzehnWmYgw1UKK1
 tY9pWNpakvdEbi+/dfDxT9xgm5+f9ROTb9KvlJ1rklNGm5haqSpiqLu4vHKR3V+c7snERjkRxR
 kAiCqW54oopYco/QhyJ8owQiZC6thwqzcH+frGu6wfLUSJsOQEAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qxbmIB2837H8qrLnSe95Ux6ennyfvXtwA0OFnYRkLvs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnI+I2emzdWrBOVH5+EIZyjUCN+vGX+8Aix8V5D
 WwFfc5uccWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZyPiNgAKCRARpy6gFHHX
 clxsD/49ML+9W9D6AcuIGJ0IKiedXv2FsGcIPameW8Hs3XVlcUm3Lcc9+fRvmWwB6ZNTMuCFV2R
 FToyQvh7MRVwiuHsPXg+Tq3kig0DYqpk01u8PTponWJIeaEWAiIsuY3qsM8lpzwqsOgMEuc6foc
 JulMso3XtNqDQWN8an17GpB442UTpeKIUdlygETlDSrS45mEgYDWJ6pSw/bNyzkE+WKIlOFr6K/
 CdmgdqcGhcybD5VLK/TVAAf6cFGyve/NyevcoP9DoOpX+Gtum0AXqNb0GQSVqy2OWmx4n9W+f3K
 qvrn6fNeLjWMVHTFwWIw6nzfATnHrXQVELOH1kVCHJ93U1KpsF3uXr2NTFLGalJ3goCU9Bar9g8
 nUX8XSwFZUS1hb2xgUirQ2C2w76FN/KTzWY38Z5dAbu03D+Y9opET48hhKMw7mYB6UOJc03WfM2
 CixEU08S9xVMe9mVLwA9p+YYcqbTpqxwFukVxhq82gbe/gM7taOILNtFHyCtm97fCwigxJqmb2Z
 8Z03czO1T6G7dUPonbXbUPffE2/D2pO/azccJUbfT65hU2mThV8LvUvp260GWOyq+kro56PzlI6
 nIVUPKCZTV2xK11WwQRnOkhPnEqzn3de4oC9gT/OF3yjDN1G89eEQ+gZP/RChzmi1DUfj+3m/En
 PBO3TSDMsyRozQQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This may be a total corner-case but for consistency and completeness I
think it makes sense to also send out line state change events on actions
triggered from the GPIO sysfs class.

The first two patches use cleanup helpers in sysfs code. The next three
change the code to emit notifications on line export (unexport is
already handled) and active_low & edge changes.

One last thing I considered was also notifying user-space whenever
gpiochip_un/lock_as_irq() is called but that doesn't make much sense as
it's largely independent from the GPIO core and can be called for both
requested and available lines whenever someone requests an interrupt
from a GPIO controller.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- don't use __free() in patch 2/5 as it causes issues when we jump over
  the initialization of the managed pointer
- Link to v3: https://lore.kernel.org/r/20241026-gpio-notify-sysfs-v3-0-ad8f127d12f5@linaro.org

Changes in v3:
- Keep the unusual order of operations in value_store()
- Link to v2: https://lore.kernel.org/r/20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org

Changes in v2:
- Streamline the code even more by dropping unnecessary return code
  assignments
- use normal guards where scoped ones are overkill
- Link to v1: https://lore.kernel.org/r/20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org

---
Bartosz Golaszewski (5):
      gpio: sysfs: use cleanup guards for gpiod_data::mutex
      gpio: sysfs: use cleanup guards for the sysfs_lock mutex
      gpio: sysfs: emit chardev line-state events on GPIO export
      gpio: sysfs: emit chardev line-state events on active-low changes
      gpio: sysfs: emit chardev line-state events on edge store

 drivers/gpio/gpiolib-sysfs.c | 161 +++++++++++++++++++------------------------
 1 file changed, 72 insertions(+), 89 deletions(-)
---
base-commit: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
change-id: 20241022-gpio-notify-sysfs-3bddf9ecca9f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


