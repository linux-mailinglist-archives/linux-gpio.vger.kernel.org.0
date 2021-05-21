Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF79038CB36
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 18:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236972AbhEUQnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 12:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236889AbhEUQnL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 12:43:11 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4453EC0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 09:41:48 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso7079844wmc.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OLxd9YqwRbx5TAGpuwAdW+dDcsysFyUkXYIgfcZaWGs=;
        b=gvBm+bAPQJhIJkIPOpTN+KeA385rCs8o23N7ZLIpgz2N0UIEeEmFRKRIid8GClx02G
         uXdiryJMyuMK5PQL5I8LkD8AylRYmto6bOSH3T3uItp0Hzfa0EXhJcrlcoKp1EM3G3yc
         sz/GesrbNn45upRo/U4KirwtmthyAKg/AmglaHcZktFtqlpHb6bCJ/MWL42Dog1pXr61
         vbUIGw3ywbVSiu6rBLmafBzhRqWSA9EXs7daCO9H3RvP6dE5r1veSSW4/m3edo/x0Fvx
         R6kxEbIMcl7K7OYc16kaIhvYMkkUyxTV3rRkq7gSsJ5xxOG29RehcVhYMPUxS0WHXzx+
         8ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OLxd9YqwRbx5TAGpuwAdW+dDcsysFyUkXYIgfcZaWGs=;
        b=XxXwfbMvo3G35hYv5+YnsTZNAVjvmU1TpPo/G3V0WbvUxiLqXmMBZtlwl3SXBdxvnz
         0rGBXXieMqPfRZBH99WBYsfouZjnwCXW1E2sexu3QeNwpLXHoVh5atb3Jln9toG9kc0r
         X1n1iJOk5Ji0w5/fBI1HD+GOirWvXKeCXc+ufqbtySKXYzpUbW5TyDA2pm9lN+wfjLOt
         9q2lNXNWOUYAkeElO4L59AI428M7Rw6+yaBP1DLWRoWIRdIS1gNd2BbJzHrpQjliKlIm
         MA3ZYpjHEXZZuimlPohvPd0hLD1mTap4s19dkkena/uUjnRhvxaQdxCWqOJntzye7fMD
         okSg==
X-Gm-Message-State: AOAM531zpfgt58B947wmHM52Z3oN3ZFdxR2GQXJqe+5sPIu3agwu6fZN
        j2kStyLg+K/FEH87c//xPTuWOg==
X-Google-Smtp-Source: ABdhPJzKat2eJCvNinu9ngsupD0zvKZM+O7J40OVu7kqwVW2AFI2slPVZ76+AQOyI8zKX9ElikBWaA==
X-Received: by 2002:a1c:b003:: with SMTP id z3mr10116748wme.7.1621615306863;
        Fri, 21 May 2021 09:41:46 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id g11sm2662072wri.59.2021.05.21.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 09:41:46 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.13-rc3
Date:   Fri, 21 May 2021 18:41:39 +0200
Message-Id: <20210521164139.25088-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

please pull the following three fixes for the GPIO subsystem.

Best Regards,
Bartosz

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13-rc3

for you to fetch changes up to bdbe871ef0caa660e16461a2a94579d9f9ef7ba4:

  gpio: tegra186: Don't set parent IRQ affinity (2021-05-12 13:56:43 +0200)

----------------------------------------------------------------
gpio fixes for v5.13-rc3

- add missing MODULE_DEVICE_TABLE in gpio-cadence
- fix a kernel doc validator error in gpio-xilinx
- don't set parent IRQ affinity in gpio-tegra186

----------------------------------------------------------------
Andy Shevchenko (1):
      gpio: xilinx: Correct kernel doc for xgpio_probe()

Jon Hunter (1):
      gpio: tegra186: Don't set parent IRQ affinity

Zou Wei (1):
      gpio: cadence: Add missing MODULE_DEVICE_TABLE

 drivers/gpio/gpio-cadence.c  |  1 +
 drivers/gpio/gpio-tegra186.c | 11 -----------
 drivers/gpio/gpio-xilinx.c   |  2 +-
 3 files changed, 2 insertions(+), 12 deletions(-)
