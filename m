Return-Path: <linux-gpio+bounces-4062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E586F00D
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 11:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E911C209FB
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 10:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959F7A92F;
	Sat,  2 Mar 2024 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZHT85v9D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9766AD6
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709375696; cv=none; b=GkIfAZKkNJNYQ1Z3rLp1M7atYUlfaIrNJm7H7NFNfQ6SPe5MR1ef5sgWEd31KE6NRxaRXfNanDPyGeq4FI2Gilag7bs33VX4kRWk3mMCPkDuULLdWQmScLAcntGp59tIxaQKtdLrzbqj2Wr0Hi+UQ3bA1V9e8OwR4CM97Z668Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709375696; c=relaxed/simple;
	bh=sU/U+dcrbZ8tDTKuLknC7zmr+3FgD7Tp9JetO2YQS64=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YMDtx+ntGyyLCEg2pECJsaQll79cS4FV7xTMI5l8uYjeckDrrbv5JmkN7KjCOOrGNkRwMoWFQvqYjDsnQ5q449pLr7n3Rks+OSmXJJ+3l+Z7H1dh90imZUGYQcJgtzUhA3ycwSGWLgBgSdQhw7Mvuo/725weKZKRsPCHE2u/9lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZHT85v9D; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5656e5754ccso3999563a12.0
        for <linux-gpio@vger.kernel.org>; Sat, 02 Mar 2024 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709375693; x=1709980493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6x3G/447xYYzN0a+qHQfs0du3vAWnXkAb+OXnYJ4404=;
        b=ZHT85v9DDnHtmTfCZ2zAHb87v47vcHsqlvxQBDwETX+ftxCy45Qs32TMZ75YvSEvYa
         R9OOUwbCTNgcuMIDr3Muc7c15CVZ2URJpCKjJgpquLaTLfBf4A+AwfICAbMELYpSPah6
         BYtYolcd6CmMOAG2+B7Zx3qKcs+DF1fpMN2KypJKZpV2vpmCN/G2/w5XEoR5zsmXQqG9
         Zy1I0raqzChLAn95Meb5+cY9hP0YsvZCZG/hHDMeWE/2ZgJKGxZClP2D8F6h5av/xU41
         M7Ud4zXh1RuEUSnZFot6VHRY3HV7E7uol8leAtepPkUSxt12oC/bHKTkl6EZRoRhJll9
         VrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709375693; x=1709980493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6x3G/447xYYzN0a+qHQfs0du3vAWnXkAb+OXnYJ4404=;
        b=KLP4KMaKBWuBXkxRZRH9RjSiM4XsvEpojvLOGBGOESpaDuBf1GI+0+Wn/zCnni6wwZ
         nsvp2sSCUbuN+XWGlhaoD6Z+7VKJyGvdRJFxThae5NKR6X45Aog/R6l1IoBmdAfudjFz
         OPoOF/huZY//B25/0cUPWpXrQ/gsZRy+6AMiOVCZhjCi85upOBwAJavaIfROMu64MzUg
         G1/UBFeA/ggwRhn4FgHgA86mCoA9V7zxHO6gm9105vlizeOjzDYq7NLKWr01SxL7ziGv
         74qY0Qn1kY2IMbSak/FE1TElCEzeXosgT7D0BWwUxz3JWdz95saPao/MdUzYejkj6NVW
         Jp6A==
X-Forwarded-Encrypted: i=1; AJvYcCVwjddP/gfndNT9AjgY/gKuebqyR+QOV+e8rehM6ahpYwQ0IRZi2+lgde3Ato2N7aDpTZb0LCMrsXdmHyYSIrCOkCKoI+seXn3rtQ==
X-Gm-Message-State: AOJu0Yy0QpTyuPo7t9Inm7fCw72m04j5LdBslIMl5hiyW69oeBPgDWmI
	xxLV/jKZrmItugxiW1tulS5aDFaIpDwYEEnUfjxvablySfoIm26Wa1MNXankR/M=
X-Google-Smtp-Source: AGHT+IHDZTuNbAQJK5yevt/jXaXNIVmhn4m5ZxLyfB5h8uOTtDaQyZ9IKc0wfSRV9/+mjbfVWlSklQ==
X-Received: by 2002:a17:906:8da:b0:a3f:ab4d:f7e3 with SMTP id o26-20020a17090608da00b00a3fab4df7e3mr3529849eje.0.1709375692641;
        Sat, 02 Mar 2024 02:34:52 -0800 (PST)
Received: from brgl-uxlite.michal.lan ([95.214.216.87])
        by smtp.gmail.com with ESMTPSA id cw5-20020a170907160500b00a444481e031sm2479520ejd.210.2024.03.02.02.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 02:34:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.8-rc8
Date: Sat,  2 Mar 2024 11:34:49 +0100
Message-Id: <20240302103449.4313-1-brgl@bgdev.pl>
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

Please pull the following fixes for the next RC from the GPIO tree.

Thanks,
Bartosz

The following changes since commit d206a76d7d2726f3b096037f2079ce0bd3ba329b:

  Linux 6.8-rc6 (2024-02-25 15:46:06 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.8-rc7

for you to fetch changes up to ec5c54a9d3c4f9c15e647b049fea401ee5258696:

  gpio: fix resource unwinding order in error path (2024-03-01 09:33:30 +0100)

----------------------------------------------------------------
gpio fixes for v6.8-rc7

- fix resource freeing ordering in error path when adding a GPIO chip
- only set pins to output after the reset is complete in gpio-74x164

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: Fix the error path order in gpiochip_add_data_with_key()

Arturas Moskvinas (1):
      gpio: 74x164: Enable output pins after registers are reset

Bartosz Golaszewski (1):
      gpio: fix resource unwinding order in error path

 drivers/gpio/gpio-74x164.c |  4 ++--
 drivers/gpio/gpiolib.c     | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

