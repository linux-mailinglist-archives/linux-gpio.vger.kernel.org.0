Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B326AC49C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 16:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjCFPPZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 10:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjCFPPU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 10:15:20 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255142B2BD;
        Mon,  6 Mar 2023 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678115714; x=1709651714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rKQuh9h196n6Xnhs+CHc4rwkxt9Wy3guLd/Pq8bxo4Y=;
  b=D5I+rtqKXT/WQndEl5iMT32cXX0g6qcPxouXlfMt7Xz60FyUVU1+aIvV
   gUe82VHoJ4xTdeFnpWvLiSEknUt1XjitufeXICx/1/eLfzvYsmDkiuocb
   s8Nbh6NU2uPSpzAKPvD3rXT7Ii5xrbacbMxs/bV0ojT+1/tgDCKhTAKWp
   y9u+1fKzpY7xHIMMYp4NBiAqdR0HwC701t6KJlRtJesTHJNoREIKbGug/
   jLG+iGlkKRCweZzNrYtYpxyHJqgVvxXe6hPHHTdM3Ro5EEo1p50gznlo5
   QxIj9r3rnokmCaLvZ91MFRE3Bk9Y+iXssvVALDgKfpRJzsH3BZsWdTWb6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="323884948"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="323884948"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 07:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740361332"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="740361332"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2023 07:09:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D5651143; Mon,  6 Mar 2023 17:09:56 +0200 (EET)
Date:   Mon, 6 Mar 2023 17:09:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [GIT PULL] intel-gpio for 6.3-1
Message-ID: <ZAYCRPsKR8Je6LOW@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO maintainers et al.,

Combined series to clean up headers in the GPIO library and drivers.
Along with it, drop a few unused legacy APIs.

This tag is immutable, enjoy!

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.3-1

for you to fetch changes up to 380c7ba3923c6e471aff0f951a6cf42e8dec2c79:

  gpiolib: Clean up headers (2023-03-06 12:33:02 +0200)

----------------------------------------------------------------
intel-gpio for v6.3-1

* Remove some of the legacy APIs that are not used anymore
* Clean up headers in the GPIO library and drivers

The following is an automated git shortlog grouped by driver:

aggregator:
 -  Add missing header(s)

ARM:
 -  s3c64xx: Use the right include
 -  orion/gpio: Use the right include

gpiolib:
 -  Clean up headers
 -  Group forward declarations in consumer.h
 -  Deduplicate forward declarations in consumer.h
 -  Drop unused forward declaration from driver.h
 -  split of_mm_gpio_chip out of linux/of_gpio.h
 -  split linux/gpio/driver.h out of linux/gpio.h
 -  remove legacy gpio_export()
 -  remove gpio_set_debounce()
 -  remove asm-generic/gpio.h
 -  coldfire: remove custom asm/gpio.h
 -  remove empty asm/gpio.h files
 -  Make the legacy <linux/gpio.h> consumer-only

hte:
 -  tegra-194: Use proper includes

reg:
 -  Add missing header(s)

regmap:
 -  Add missing header(s)

----------------------------------------------------------------
Andy Shevchenko (7):
      gpio: aggregator: Add missing header(s)
      gpio: reg: Add missing header(s)
      gpio: regmap: Add missing header(s)
      gpiolib: Drop unused forward declaration from driver.h
      gpiolib: Deduplicate forward declarations in consumer.h
      gpiolib: Group forward declarations in consumer.h
      gpiolib: Clean up headers

Arnd Bergmann (7):
      gpiolib: remove empty asm/gpio.h files
      gpiolib: coldfire: remove custom asm/gpio.h
      gpiolib: remove asm-generic/gpio.h
      gpiolib: remove gpio_set_debounce()
      gpiolib: remove legacy gpio_export()
      gpiolib: split linux/gpio/driver.h out of linux/gpio.h
      gpiolib: split of_mm_gpio_chip out of linux/of_gpio.h

Linus Walleij (4):
      ARM: orion/gpio: Use the right include
      ARM: s3c64xx: Use the right include
      hte: tegra-194: Use proper includes
      gpiolib: Make the legacy <linux/gpio.h> consumer-only

 Documentation/admin-guide/gpio/sysfs.rst           |   2 +-
 Documentation/driver-api/gpio/legacy.rst           |  23 ----
 .../translations/zh_CN/driver-api/gpio/legacy.rst  |  20 ---
 Documentation/translations/zh_TW/gpio.txt          |  19 ---
 MAINTAINERS                                        |   1 -
 arch/arm/Kconfig                                   |   1 -
 arch/arm/include/asm/gpio.h                        |  21 ---
 arch/arm/mach-omap1/irq.c                          |   1 +
 arch/arm/mach-omap2/pdata-quirks.c                 |   9 +-
 arch/arm/mach-orion5x/board-rd88f5182.c            |   1 +
 arch/arm/mach-s3c/s3c64xx.c                        |   2 +-
 arch/arm/mach-sa1100/assabet.c                     |   1 +
 arch/arm/plat-orion/gpio.c                         |   5 +-
 arch/m68k/Kconfig.cpu                              |   1 -
 arch/m68k/include/asm/gpio.h                       |  95 -------------
 arch/m68k/include/asm/mcfgpio.h                    |   2 +-
 arch/powerpc/platforms/44x/Kconfig                 |   1 +
 arch/powerpc/platforms/4xx/gpio.c                  |   2 +-
 arch/powerpc/platforms/8xx/Kconfig                 |   1 +
 arch/powerpc/platforms/8xx/cpm1.c                  |   2 +-
 arch/powerpc/platforms/Kconfig                     |   2 +
 arch/powerpc/sysdev/cpm_common.c                   |   2 +-
 arch/sh/Kconfig                                    |   1 -
 arch/sh/boards/board-magicpanelr2.c                |   1 +
 arch/sh/boards/mach-ap325rxa/setup.c               |   7 +-
 arch/sh/include/asm/gpio.h                         |  45 -------
 drivers/gpio/Kconfig                               |  19 +--
 drivers/gpio/TODO                                  |  15 ++-
 drivers/gpio/gpio-aggregator.c                     |   9 +-
 drivers/gpio/gpio-altera.c                         |   2 +-
 drivers/gpio/gpio-davinci.c                        |   2 -
 drivers/gpio/gpio-mm-lantiq.c                      |   2 +-
 drivers/gpio/gpio-mpc5200.c                        |   2 +-
 drivers/gpio/gpio-reg.c                            |  12 +-
 drivers/gpio/gpio-regmap.c                         |  12 +-
 drivers/gpio/gpiolib-acpi.c                        |  10 +-
 drivers/gpio/gpiolib-acpi.h                        |   1 -
 drivers/gpio/gpiolib-of.c                          |   9 +-
 drivers/gpio/gpiolib-of.h                          |   1 -
 drivers/gpio/gpiolib-swnode.c                      |   5 +-
 drivers/gpio/gpiolib-sysfs.c                       |  25 +++-
 drivers/gpio/gpiolib.c                             |   9 +-
 drivers/hte/hte-tegra194-test.c                    |  10 +-
 drivers/input/touchscreen/ads7846.c                |   5 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c            |  10 +-
 drivers/net/ieee802154/ca8210.c                    |   3 +-
 .../net/wireless/broadcom/brcm80211/brcmsmac/led.c |   1 +
 drivers/pinctrl/core.c                             |   1 -
 drivers/soc/fsl/qe/gpio.c                          |   2 +-
 include/asm-generic/gpio.h                         | 147 ---------------------
 include/linux/gpio.h                               | 104 +++++++++------
 include/linux/gpio/consumer.h                      |  24 ++--
 include/linux/gpio/driver.h                        |  31 +++--
 include/linux/gpio/legacy-of-mm-gpiochip.h         |  36 +++++
 include/linux/mfd/ucb1x00.h                        |   1 +
 include/linux/of_gpio.h                            |  21 ---
 56 files changed, 271 insertions(+), 528 deletions(-)
 delete mode 100644 arch/arm/include/asm/gpio.h
 delete mode 100644 arch/m68k/include/asm/gpio.h
 delete mode 100644 arch/sh/include/asm/gpio.h
 delete mode 100644 include/asm-generic/gpio.h
 create mode 100644 include/linux/gpio/legacy-of-mm-gpiochip.h

-- 
With Best Regards,
Andy Shevchenko


