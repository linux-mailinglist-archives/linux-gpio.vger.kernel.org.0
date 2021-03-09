Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1FF332A96
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCIPfF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhCIPe4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 10:34:56 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EA6C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 07:34:56 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so6852920wmd.5
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yzsw0t26e6RgC3Z//6/tf4qdzaRYRX8gCuMeUSGPexc=;
        b=f0NjAAtkPD27dyFd/dyrvExuFHkunfaEkLs8LRY9YGOYfqqatBqUwXjgNrK9axhn6z
         xwa0YP0K4IQqL/n4oYpJGZ8OnVfcF76CMDiURPJMtndV74YtZle2dLALxDY0LsKx/Llj
         tsG3Buj/Ibdw4qpCNxy1lcl8A1cB5I5UVm9lG/+9jZKExzOMnHGag3o0iwOZj/4euEcn
         4+2Mnng0HiniwIsGSGElcJw7npmS7nEB+6zhL5nRKvCE6y7Ty46rdOgJhidmWyIqWIl/
         YQ5KCwL/y7OzMiM5Q6Nfj2veWAQU4o8+uIIpziIUObNq3PBRDGy6khLDHc7FfUSXeKPT
         Hz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yzsw0t26e6RgC3Z//6/tf4qdzaRYRX8gCuMeUSGPexc=;
        b=c1/WwfI0S6IdMkQw203q4juBX9hyUoCXPpgjud50CfQCSUGMRTSJouy42xOielzo8w
         9cegWgp4PHWjLZPTWxMKMhafVuymHTv5UVsCorFCs0UAkWGrv6hJPl7tui90eQ8jboCK
         MuGH5eH1qrOVmdvUar3aG5DX3WxHg5TL91irZiPd9xSbEStvWs/csrFxQzlL2PgQ8yLC
         rg5sw3/dkJKNVTUmH5AvTBqG78YQWvpH9XEyoBQ0c/7z0t7/3MulfFSvhtqoIcJxYDAa
         Ez10om3KktdSC7t8XLHmQ8lCPFRxXfyewq7vCgxIv8YI5rGdiCjpaH7/cTBpnkSMJqOF
         UbPQ==
X-Gm-Message-State: AOAM533x1FqLQFzGqRXy0jKOstdsBjS7EuK94LO3Jhcdqp+GN1lQCuO5
        /OuXJ7Mp7ZSSUA8FhFfZCkYaew==
X-Google-Smtp-Source: ABdhPJyvtARdrMCqNLvCKFczKedLboQLlk3AyeGPSQfdcBppgkMEvuwgsGJiyeyCfpeqWSD6PWSoRg==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr4651344wmi.132.1615304095057;
        Tue, 09 Mar 2021 07:34:55 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id b15sm4915530wmd.41.2021.03.09.07.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:34:54 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.12-rc3
Date:   Tue,  9 Mar 2021 16:34:43 +0100
Message-Id: <20210309153443.16647-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Here's a bunch of fixes for the GPIO subsystem. We have two regressions in the
core code spotted right after the merge window, a series of fixes for ACPI GPIO
and a subsequent fix for a related regression in gpio-pca953x + a minor tweak
in .gitignore and a rework of handling of the gpio-line-names to remedy a
regression in stm32mp151.

Please pull!

Best Regards,
Bartosz Golaszewski

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc3

for you to fetch changes up to b41ba2ec54a70908067034f139aa23d0dd2985ce:

  gpiolib: Read "gpio-line-names" from a firmware node (2021-03-08 11:59:17 +0100)

----------------------------------------------------------------
gpio fixes for v5.12-rc3

- fix two regressions in core GPIO subsystem code: one NULL-pointer dereference
  and one list corruption
- read GPIO line names from fwnode instead of using the generic device
  properties to fix a regression on stm32mp151
- fixes to ACPI GPIO and gpio-pca953x to handle a regression in IRQ handling
  on Intel Galileo
- update .gitignore in GPIO selftests

----------------------------------------------------------------
Andy Shevchenko (4):
      gpiolib: acpi: Add ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER quirk
      gpiolib: acpi: Allow to find GpioInt() resource by name and index
      gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2
      gpiolib: Read "gpio-line-names" from a firmware node

Bartosz Golaszewski (1):
      selftests: gpio: update .gitignore

Johan Hovold (2):
      gpio: fix NULL-deref-on-deregistration regression
      gpio: fix gpio-device list corruption

Yang Li (1):
      gpiolib: acpi: Add missing IRQF_ONESHOT

 drivers/gpio/gpio-pca953x.c             | 78 ++++++++++-----------------------
 drivers/gpio/gpiolib-acpi.c             | 21 ++++++---
 drivers/gpio/gpiolib.c                  | 19 ++++----
 include/linux/acpi.h                    | 10 ++++-
 include/linux/gpio/consumer.h           |  2 +
 tools/testing/selftests/gpio/.gitignore |  2 +-
 6 files changed, 58 insertions(+), 74 deletions(-)
