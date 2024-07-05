Return-Path: <linux-gpio+bounces-8073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C52B928A77
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 16:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC40328691B
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 14:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FD416A94A;
	Fri,  5 Jul 2024 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mJAu40VO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C841146A69
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 14:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720188954; cv=none; b=mwzMoZef1C8CCgcV1WA9dmE7ehwSc85ML5WkjlHqudqV6re5JRxxEolGbhTBcHaixHQKZqJTkxOLefAKuaj21Who3818e/t1x26/EK7ET9Xz//qLyfo8TDzsaXQB6YL4z6sOnPH9d+y9YDOhrq9t8c3idOTsDgNxyf6D4VLUgK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720188954; c=relaxed/simple;
	bh=csMbNIXYbDs8teffXzD2GvgCq5Qy1ZwmaOAcEOMsHVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0eKOl/a2KXQmGBBqw7jFTUQ5wYBWNo0IuthUpmKEdG+nP4el/nhH+5levzSY/bdl1Ex+kv19rG2jIN3OXBNswHt7No+PX4OGyX7tj1IPISa1s7aCtinZm1E/WbxMUlok+QLA2P+2x8WL1p5Jq8L2GMyoNsbIvKEEubKToIdSSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mJAu40VO; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee88c4443eso19641981fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 07:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720188949; x=1720793749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vB+CDmf4yU1/047AzwbsEow70avL0EmzWRISr/VcnH8=;
        b=mJAu40VOb5FmxRqjtCmVTQz43Tp+ETykR4DnpdARa12BsgOkyRVepMN7CNFTP2lfEY
         tvQLwlNEUzKUDKBH6G1JM+1enmZETp+0eXKf0Rv2PCKfezGYbAcBiQuZX7jawVZvKUBP
         oYoLtISfmsTHemU0aw3jeYPaHNmfkl0aRrlOASqMpKFQgjUMzVi39Y2Kk4I1xlvdV2O1
         y5QrHnO2lLlVT30NYVobJxLu6vWXtS6+SX7NJr6vPv+BBQZ2S1ndvUFm/JfqjyrUciel
         oxKYYtIaCtmuQq2C+Q9SaTgLvlrB73ky8RsqpOWKjs8tZEhW9c3Q8BVNFU/nTjq+ao0F
         kErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720188949; x=1720793749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vB+CDmf4yU1/047AzwbsEow70avL0EmzWRISr/VcnH8=;
        b=kPod7xBk21S9td9xtVgWVco+K6bzgDUDhykT91+RmiDAGG7xiE/y23sBJ6RR+Hric8
         yCfYN3Q8uAQm6TPYfoqa8BHCmd0HL51OUvoz7nbZrYXmGUemByA0y/i6uwiXP+AVzvNe
         u7YbjxF/gaFqItWB8cT8r7LDwpaqasXq7alBwuIujXs9Eg1HbXSdBarYeKfm+vkoYwqS
         yFs8Nlfa7FYz0TaOldAKNRwKAr9MVqC7XD1eCLNjYbcPJJzVe897X7W1nhcHxu4chBVP
         a4oFZochL6MApoFOAmxhcuKi/H94X9ME4V3Jg4OUtU8JD7LlPtGa4MR0ps5r2iTczDPX
         wYtg==
X-Forwarded-Encrypted: i=1; AJvYcCX4zSvjTjywoNjXYyOQJdJ+cQVEHlGhWgerkmJcl5KrUJSI8A5o7D8GcWrivN4TRGruha6au9xKnDUE2T1b1gxs/+aWMs6NYujUsw==
X-Gm-Message-State: AOJu0YyPNdowg6cAPZt2MhUTDJoEE6sEVitGwxD+FdKEtt9NTwVbfj1k
	GSobUU8FzObK1yTyjxNePdjV4AMUjp+qTKNiKWakwNIQM/iioApVCqCd9GQh0Lg7DtoMgRKqzee
	C
X-Google-Smtp-Source: AGHT+IH3FYEYcatWMaLhI+Grsy+GgqRs9QH35DHFk1d7q1MrhiTUsoNESzzybKPztgIRAGXv5IONAg==
X-Received: by 2002:a2e:8656:0:b0:2ec:3e02:9737 with SMTP id 38308e7fff4ca-2ee8ed69b9cmr34232481fa.2.1720188949395;
        Fri, 05 Jul 2024 07:15:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c688:2842:8675:211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678f41116bsm8041805f8f.116.2024.07.05.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 07:15:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
X-Google-Original-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.10-rc7
Date: Fri,  5 Jul 2024 16:15:44 +0200
Message-ID: <20240705141544.20101-1-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please pull the following set of fixes for the next RC. There are two OF
lookup quirks and one fix for an issue in the generic gpio-mmio driver.

Best Regards,
Bartosz Golaszewski

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.10-rc7

for you to fetch changes up to f8d76c2c313c56d5cb894a243dff4550f048278d:

  gpiolib: of: add polarity quirk for TSC2005 (2024-07-05 11:00:45 +0200)

----------------------------------------------------------------
gpio fixes for v6.10-rc7

- add two OF lookup quirks for TSC2005 and MIPS Lantiq
- don't try to figure out bgpio_bits from the "ngpios" property in gpio-mmio

----------------------------------------------------------------
Dmitry Torokhov (2):
      gpiolib: of: fix lookup quirk for MIPS Lantiq
      gpiolib: of: add polarity quirk for TSC2005

Shiji Yang (1):
      gpio: mmio: do not calculate bgpio_bits via "ngpios"

 drivers/gpio/gpio-mmio.c  |  2 --
 drivers/gpio/gpiolib-of.c | 22 ++++++++++++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

