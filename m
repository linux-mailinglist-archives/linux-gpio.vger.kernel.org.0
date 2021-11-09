Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0ADA44AB1C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245127AbhKIKFB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:05:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:60984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhKIKFA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:05:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B5E961167;
        Tue,  9 Nov 2021 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636452134;
        bh=ui2E4K1SAqfqBcQkhRszhSJbnk4ch4RwvUhXriHue1g=;
        h=From:To:Cc:Subject:Date:From;
        b=qi1aLG6b3a9xMaa83NWs9xtjC4mZA1g7JKfE+mFVqGVqblGL9OLMFrl+EACDKaPz+
         K9IbAtz0AMadnrb6ozyTU+XmiFBCk2GDOWq6SboqHk8pE88406oAs011YsaPWqpVO8
         RJ1rB8Lr8DgyXWv6TwSMowsVtAWKmvd/nN2sH61oozzhdSFiEM97dKFU4Mf4/OGouw
         645Lz6zb2Jkd7/SkIb2BbfOcz2K0h1SbTGf4eC60xj8WkfpjRupqFOkeQOSUbrL/Sp
         GWjzakeKnGYjFvJn7IWyOeVKJetHM2bBvhWpau1vyG8H2R5QdRWST1ohkJBJvxEfxr
         Bx+3HvJDf/uoA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] gpiolib header cleanup
Date:   Tue,  9 Nov 2021 11:01:59 +0100
Message-Id: <20211109100207.2474024-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

I got a bit carried away after posting the first three patches, so
here is a somewhat larger rework towards simplifying the remainder of
the traditional linux/gpio.h interface, removing some of the rarely
used functions, and dropping the inclusion of linux/gpio/driver.h from
linux/gpio.h. This makes linux/gpio.h mainly a wrapper for the consumer
interface.

There is one more possible follow-up that I did not include here:
As there are only around 350 files[1] remaining that actually use the
legacy interfaces, we could rename linux/gpio.h to e.g.
linux/gpio/legacy.h, and leave linux/gpio.h as an alias for
linux/gpio/consumer.h until we remove it entirely.

       Arnd

Changes since v1:
 - incorporate feedback from Geert Uytterhoeven
 - remove asm-generic/gpio.h
 - drop legacy export interface and a few other functions
 - stop including linux/gpio/driver.h

Arnd Bergmann (8):
  gpiolib: remove irq_to_gpio() definition
  gpiolib: remove empty asm/gpio.h files
  gpiolib: coldfire: remove custom asm/gpio.h
  gpiolib: remove asm-generic/gpio.h
  gpiolib: shrink further
  gpiolib: remove legacy gpio_export
  gpiolib: remove gpio_to_chip
  gpiolib: split linux/gpio/driver.h out of linux/gpio.h

 Documentation/admin-guide/gpio/sysfs.rst      |   2 +-
 .../driver-api/driver-model/devres.rst        |   1 -
 Documentation/driver-api/gpio/legacy.rst      |  52 +-----
 Documentation/translations/zh_CN/gpio.txt     |  26 ---
 Documentation/translations/zh_TW/gpio.txt     |  27 ---
 arch/arm/Kconfig                              |   1 -
 arch/arm/include/asm/gpio.h                   |  22 ---
 arch/arm/mach-davinci/board-dm646x-evm.c      |  28 +--
 arch/arm/mach-omap1/irq.c                     |   1 +
 arch/arm/mach-omap2/pdata-quirks.c            |   9 +-
 arch/arm/mach-orion5x/board-rd88f5182.c       |   1 +
 arch/arm/mach-pxa/lubbock.c                   |   2 +-
 arch/arm/mach-s3c/mach-h1940.c                |   1 +
 arch/arm/mach-s3c/s3c64xx.c                   |   1 +
 arch/arm/mach-sa1100/assabet.c                |   1 +
 arch/arm/plat-orion/gpio.c                    |   1 +
 arch/m68k/Kconfig.cpu                         |   1 -
 arch/m68k/include/asm/gpio.h                  | 102 -----------
 arch/m68k/include/asm/mcfgpio.h               |   2 +-
 arch/sh/Kconfig                               |   1 -
 arch/sh/boards/board-magicpanelr2.c           |   1 +
 arch/sh/boards/mach-ap325rxa/setup.c          |   7 +-
 arch/sh/include/asm/gpio.h                    |  50 -----
 drivers/gpio/Kconfig                          |   8 -
 drivers/gpio/gpio-davinci.c                   |   3 +-
 drivers/gpio/gpio-ucb1400.c                   |   1 +
 drivers/gpio/gpiolib-devres.c                 |  25 ---
 drivers/gpio/gpiolib-sysfs.c                  |   4 +-
 drivers/input/touchscreen/ads7846.c           |   3 +-
 drivers/media/i2c/noon010pc30.c               |   5 +-
 drivers/media/i2c/ov9650.c                    |   4 +-
 drivers/media/i2c/s5k4ecgx.c                  |   3 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  10 +-
 drivers/mfd/dm355evm_msp.c                    |   3 +-
 drivers/mfd/htc-i2cpld.c                      |   1 +
 drivers/mfd/ucb1400_core.c                    |   1 +
 drivers/net/ieee802154/ca8210.c               |   3 +-
 .../broadcom/brcm80211/brcmsmac/led.c         |   1 +
 drivers/pinctrl/core.c                        |   5 +-
 drivers/soc/fsl/qe/gpio.c                     |   4 +-
 include/asm-generic/gpio.h                    | 172 ------------------
 include/linux/bcma/bcma_driver_chipcommon.h   |   2 +-
 include/linux/gpio.h                          | 123 +++++++------
 include/linux/mfd/ucb1x00.h                   |   1 +
 include/linux/ucb1400.h                       |   1 +
 45 files changed, 133 insertions(+), 590 deletions(-)
 delete mode 100644 arch/arm/include/asm/gpio.h
 delete mode 100644 arch/m68k/include/asm/gpio.h
 delete mode 100644 arch/sh/include/asm/gpio.h
 delete mode 100644 include/asm-generic/gpio.h

-- 
2.29.2

Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

[1] git grep -wl  '\<\(gpio_direction_input\|gpio_direction_output\|gpio_get_value_cansleep\|gpio_set_value_cansleep\|gpio_get_value\|gpio_set_value\|gpio_to_irq\|gpio_request\|gpio_request_one\|gpio_request_array\)\>\|\<\(ARCH_NR_GPIOS\|GPIOF_DIR_\|GPIOF_INIT\|GPIOF_EXPORT\|GPIOF_OPEN\|GPIOF_IN\|GPIOF_OUT\|gpio_is_valid\\|gpio_free\|devm_gpio_\)' | wc -l
