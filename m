Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6DF20F32A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 12:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgF3Kys (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 06:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732591AbgF3Kyr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 06:54:47 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE62C061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 03:54:47 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f18so11587612wrs.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLFGuFYNX9qKG48KdRYSPfvQX3QtmokVEXBY7Xhm3tg=;
        b=Ulgim/j1Zkc4r+XF69T/niVkpvP+9eA8e5BTMsmp9RmR7EUyJ4X4QN3sjDoz+7hKFS
         q8/9599Jhk2VlFjwMx3doOVrDvSA3sSj5rRr+qCMQzjbAXD3Hf5Cp4ChyKBHkLt30SKC
         lwBG3vAHWyrTcnrtP3i1rpCwVhE2BEo53eWlnjg7OxZfesQ8bqkd6HviA3yzm7W6/l4R
         UvE14CZj/B8w7SqhPv8smCwTgZkv0Kjcfi+jk51x55B2cO05JCVBq8doknbiw3UgOXRW
         Dr0l+CLoIHvEU0hQvyNHGc4+qPlQiiH7gvu90Fl1cvEx5tUDUFsndb07G9y2gS8uaXdR
         d4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLFGuFYNX9qKG48KdRYSPfvQX3QtmokVEXBY7Xhm3tg=;
        b=maWTYH634WrTMuD/HwRD/vC2YeZDd+dPs1MyyNWxFMap5oSASaaHOqOdSL5TehT1DK
         1sZ8iCyxKPNRLN15C+CmAmbwwg9ghxyxH+T3YEKqcw/roCbtulN/+TZvDgBnkbSwiDkS
         kwI3WcZNbwUv/VqrvXSHxpPPol42lhkadSVRkb5ieeY3qVjoRxQnWho34/9UVCy+jALP
         G/fnSgIS/1NkzgOOk4Ty1oXiy5GPw6n+I2eLtJTJWMW6Xp7XAGMs0lxicSC9fDjJzUfD
         9L3oR89MM7tNg2PEJRaXE5YNcF3WMQRNf8rCycLMx/aJZv3ZGWQLy8CRAR+NYjvank86
         RM3w==
X-Gm-Message-State: AOAM533XPs+3iP1gcHKDrbgUPADgZcLLlv6c6Zub+Rt0zhJ053ftuuM0
        l6q9yNPoGWRs9JQ//7J6ZBmMpr08OHY=
X-Google-Smtp-Source: ABdhPJzAG3/3+Z7C9A/hcaqoOq+jSsjQIRiy4owuUK+a+xfqAIfjO7NR7sfOpSWyhlUXo9rIMdtl/w==
X-Received: by 2002:adf:ed02:: with SMTP id a2mr20986348wro.110.1593514485745;
        Tue, 30 Jun 2020 03:54:45 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id c2sm3356397wrv.47.2020.06.30.03.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 03:54:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.9
Date:   Tue, 30 Jun 2020 12:54:43 +0200
Message-Id: <20200630105443.29954-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following changes for v5.9. I'll be on paternity leave
in July, so I may be less active during that time.

Best regards,
Bartosz

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.9-part1

for you to fetch changes up to ae66eca000cfef3ef0e31842102e17b1b660b1ce:

  gpiolib: Deduplicate find_first_zero_bit() call (2020-06-30 12:39:14 +0200)

----------------------------------------------------------------
gpio updates for v5.9

- use kobj_to_dev() in sysfs interface
- kerneldoc and documentation fixes
- relax the interrupt flags in gpio-mpc8xxx
- support new model in gpio-pca953x
- remove a redundant check from gpio-max732x
- support a new platform in gpio-zynq (+ some minor fixes)
- don't depend on GPIOLIB when already inside the "if GPIOLIB" in Kconfig
- support PM ops for suspend in gpio-omap
- minor tweaks in gpiolib

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: Deduplicate find_first_zero_bit() call

Gaurav Singh (1):
      gpio: max732x: remove redundant check from probe()

Geert Uytterhoeven (1):
      gpio: Drop superfluous dependencies on GPIOLIB

Glenn Langedock (1):
      gpio: zynq: protect direction in/out with a spinlock

Jan Kiszka (2):
      dt-bindings: gpio: pca953x: add nxp,pcal9535
      gpio: pca953x: Add support for the PCAL9535

Kieran Bingham (1):
      drivers: gpio: Fix trivial spelling

Mauro Carvalho Chehab (1):
      gpio: driver.h: fix kernel-doc markup

Shubhrajyoti Datta (6):
      dt-bindings: gpio: Add binding for Versal gpio
      dt-bindings: gpio: Add pmc gpio node to gpio-zynq
      gpio: zynq: Add Versal support
      gpio: zynq: Disable the irq if it is not a wakeup source
      gpio: zynq: Add pmc gpio support
      gpio: zynq: Remove error prints in EPROBE_DEFER

Song Hui (1):
      gpio: mpc8xxx: change the gpio interrupt flags.

Tony Lindgren (1):
      gpio: omap: Add missing PM ops for suspend

Wang Qing (1):
      gpiolib: sysfs: use kobj_to_dev

 .../devicetree/bindings/gpio/gpio-pca953x.txt      |  1 +
 .../devicetree/bindings/gpio/gpio-zynq.txt         |  4 +-
 drivers/gpio/Kconfig                               |  4 +-
 drivers/gpio/TODO                                  |  2 +-
 drivers/gpio/gpio-max732x.c                        |  2 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  2 +-
 drivers/gpio/gpio-omap.c                           | 26 +++++++++
 drivers/gpio/gpio-pca953x.c                        |  2 +
 drivers/gpio/gpio-zynq.c                           | 66 +++++++++++++++++++++-
 drivers/gpio/gpiolib-sysfs.c                       |  2 +-
 drivers/gpio/gpiolib.c                             | 10 ++--
 include/linux/gpio/driver.h                        |  2 +-
 12 files changed, 107 insertions(+), 16 deletions(-)
