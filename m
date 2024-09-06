Return-Path: <linux-gpio+bounces-9882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1793896F0B8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6B441F25013
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 09:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818141C8FB3;
	Fri,  6 Sep 2024 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XDtgz1LS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C089E188A31
	for <linux-gpio@vger.kernel.org>; Fri,  6 Sep 2024 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616762; cv=none; b=BU9PSCKOB8KZuI2Efbo2Ji6sAKIX4JQFIAxR/OUgBlYXglonGsAqXNuc8ooc1uUCgtoCN5zxGeD/kzPH//GAk0MW7/rjq7n5fJshoQKxz30XNNVqkmPYeAmI3PZqcUoQENuBLTXrj07omcMD/h6F81dMn0E5M8ZlLkEq+iAE0A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616762; c=relaxed/simple;
	bh=jfPauIgm35Mgr0/342bdH7eavZwk4IXdaSMhtaCsJYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rtveiuj9Uj6H6hFGJGVvqOvh277uWi1Z26B9J8Y9xz/0S40Y03SgvOFYQLHKU5gA4a7AP3UBVJM6SXCgavQVVSrxAWysSyQzDzwXKxPAUpzR6696E+Inl3fAxe8sUGzvOVimSMQ+hMg5dfHFZK1/BRklZZoB60k19bmZmSlWah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XDtgz1LS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so15646505e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Sep 2024 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725616759; x=1726221559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sDY2K/Ehe621MYsmv35PXlKGXJNhtkfCPhIF93OEdss=;
        b=XDtgz1LS0KQ2EGHgy9v7AC2pTk/xNULjmXaMtfYJQaQyCq1e5jy+o0XPVnEJ0QFjwu
         XFlTUb9gr8OJpSwiJqHmrDU1G/3uhNRkR1R93VOYDtwcNlqwRqqueJZDQ/FCVGQsK7Lz
         c/JoGL5J7gT4mkJYLU34MvEELCwebQNuMWcsdCAzO4ci0nb08XXUk+U+ZZpxl9bLdTAx
         PfK5wpltUYCOawoGq0ZpJsGCZvuplRDx+wsZQMN8QDASGtcfP88jjf2oSiDATPMNyWYu
         BIPNiKbO5FURV3Ji+cqcVYIwJcBV7EmJI3iXgXM8DgEJ59au+E4+DQR81ILDEWov0aOY
         8XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616759; x=1726221559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDY2K/Ehe621MYsmv35PXlKGXJNhtkfCPhIF93OEdss=;
        b=F2NFliTajC4gEQpOAlTDzf0DOiidCFKtPPUI7gb1JIa8wdiB/Ky8b0dMPsphfaGNVE
         3HE8QDvn0KWmZqUOT6PlRkC/jUf6iVrcBDdRZSZAKJ6uBCIcxd1USvW73eo0wkvqumAI
         /UN7apkPIu33zG6hJ5th88jx2hCgCcpaK6sI4QOHAZiNql4AFUN7QFeHRa0WuM8G7due
         074XwJPCaV+Keq+E7nskDZnw0cf7w0/HKsCW5FOKPcpSCcIYRCWl3J6HtXEfvr38TMNk
         eU5Z3xYE7GjkO2BaiGHe13IIngnaf1VshbWIbJAxE7SYfYPAwBxB70gN4uxO+KDWZ5Rg
         Ia6w==
X-Forwarded-Encrypted: i=1; AJvYcCXVUpr72Y+UZoybYJCsiWCoMdguUc9xxUxubBWchQqouRZqNO3PkkanAu7KG/VZSu4qHu7Zz/0zrex6@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUk1HbvSF2KVZBNv9cCOQAmrptCQg9hFFkv8JKH8VPZOLPEgY
	jtn0AJzised6LfAyJo5+H+2FKvl30MPx7mTEm26gChqh4xhKz0FdAYWb4bGtjl/IWidrgeDkFXt
	I
X-Google-Smtp-Source: AGHT+IFUSVHytMlXKw43UNEnH/AOn/39njfMRj1Kbl++ABSRTySQtSq9qLjUgj3T5mU+sYEN30n+4g==
X-Received: by 2002:a05:600c:3ba6:b0:428:e09d:3c with SMTP id 5b1f17b1804b1-42c9f9e19demr12634525e9.33.1725616758114;
        Fri, 06 Sep 2024 02:59:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b9fc:a1e7:588c:1e37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca743bc15sm3972665e9.46.2024.09.06.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:59:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.11-rc7
Date: Fri,  6 Sep 2024 11:59:13 +0200
Message-ID: <20240906095913.15772-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of GPIO driver fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 431c1646e1f86b949fa3685efc50b660a364c2b6:

  Linux 6.11-rc6 (2024-09-01 19:46:02 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.11-rc7

for you to fetch changes up to a5135526426df5319d5f4bcd15ae57c45a97714b:

  gpio: modepin: Enable module autoloading (2024-09-02 15:00:53 +0200)

----------------------------------------------------------------
gpio fixes for v6.11-rc7

- fix an OF node reference leak in gpio-rockchip
- add the missing module device table to gpio-modepin

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      gpio: rockchip: fix OF node leak in probe()

Liao Chen (1):
      gpio: modepin: Enable module autoloading

 drivers/gpio/gpio-rockchip.c       | 1 +
 drivers/gpio/gpio-zynqmp-modepin.c | 1 +
 2 files changed, 2 insertions(+)

