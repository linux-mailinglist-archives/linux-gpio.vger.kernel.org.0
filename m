Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99FB56D7CFA
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Apr 2023 14:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237602AbjDEMxs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Apr 2023 08:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjDEMxs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Apr 2023 08:53:48 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA3E1FFE;
        Wed,  5 Apr 2023 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680699227; x=1712235227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9RREiQXXstMZSmb+k61tk620ydm2/SSYbZmimxZoplo=;
  b=InSpP32FKJKRqJ7GdZsBteGeKPrEj3ARYD8i5vHFPMXNxWJ+xeRTyNrL
   4fPoK/C/mLdf0PUMsskXId9P3EcwOEpZO4R6+GoMqYL5Ed14dAxnBvxrK
   CpIzj385TCBOCF0rnYSNwvjeQqYr7aXhglznQON30Q6SbwOm5m2g743lU
   FpUWWAPSPloYvWSJVb2ncGK/LACqYxFyN6yT0fezt08NDfAH9D9+LHEQh
   fSdfQ/+j0ChdcdGFR2Pf0z9qh9LZWLsWfgAb3ovsWlU5R/32NE1suPLlO
   lJYMDtaGJd+MGAKwBU+L2LltWJvc+0O7hYpt3CI/YGvP2W3Vr2p4WHAiT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342460116"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="342460116"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 05:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="1016453008"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="1016453008"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 05 Apr 2023 05:53:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D26531D5; Wed,  5 Apr 2023 15:53:46 +0300 (EEST)
Date:   Wed, 5 Apr 2023 15:53:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [GIT PULL] intel-gpio for 6.4-2
Message-ID: <ZC1vWkY52ggGxem8@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers et al.,

Here is the second PR for GPIO subsystem that contains some treewide fixes
against previous PR along with Intel GPIO related stuff. It has been in the
Linux Next for a few weeks without no additional problems being reported.
Please, pull this for v6.4 cycle.

This can be treated as immutable tag, in case anyone wants to go with it
separately.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 380c7ba3923c6e471aff0f951a6cf42e8dec2c79:

  gpiolib: Clean up headers (2023-03-06 12:33:02 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.4-2

for you to fetch changes up to 782eea0c89f7d071d6b56ecfa1b8b0c81164b9be:

  gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU (2023-03-23 16:22:18 +0200)

----------------------------------------------------------------
intel-gpio for v6.4-2

* Fixed suspend issue on Clevo NL5xNU
* Split a new Intel Tangier (library) driver for current and new platforms
* Introduced a new driver for Intel Elkhart Lake PSE GPIO (see also above)
* Contained a few fixes for the previous of_gpio.h cleanup
* Miscellaneous cleanups here and there

The following is an automated git shortlog grouped by driver:

elkhartlake:
 -  Introduce Intel Elkhart Lake PSE GPIO

gpiolib:
 -  acpi: Add a ignore wakeup quirk for Clevo NL5xNU
 -  acpi: Move ACPI device NULL check to acpi_get_driver_gpio_data()
 -  acpi: use the fwnode in acpi_gpiochip_find()

ich:
 -  Use devm_gpiochip_add_data() to simplify remove path

merrifield:
 -  Utilise temporary variable for struct device
 -  Use dev_err_probe()
 -  Adapt to Intel Tangier GPIO driver

mips:
 -  ar7: include linux/gpio/driver.h

mm-lantiq:
 -  Fix typo in the newly added header filename

powerpc/40x:
 -  Add missing select OF_GPIO_MM_GPIOCHIP

sh:
 -  mach-x3proto: Add missing #include <linux/gpio/driver.h>

tangier:
 -  Introduce Intel Tangier GPIO driver

----------------------------------------------------------------
Andrew Davis (1):
      gpio: ich: Use devm_gpiochip_add_data() to simplify remove path

Andy Shevchenko (5):
      gpio: merrifield: Use dev_err_probe()
      gpio: merrifield: Utilise temporary variable for struct device
      powerpc/40x: Add missing select OF_GPIO_MM_GPIOCHIP
      gpio: mm-lantiq: Fix typo in the newly added header filename
      gpiolib: acpi: Move ACPI device NULL check to acpi_get_driver_gpio_data()

Arnd Bergmann (1):
      mips: ar7: include linux/gpio/driver.h

Benjamin Tissoires (1):
      gpiolib: acpi: use the fwnode in acpi_gpiochip_find()

Geert Uytterhoeven (1):
      sh: mach-x3proto: Add missing #include <linux/gpio/driver.h>

Pandith N (3):
      gpio: tangier: Introduce Intel Tangier GPIO driver
      gpio: merrifield: Adapt to Intel Tangier GPIO driver
      gpio: elkhartlake: Introduce Intel Elkhart Lake PSE GPIO

Werner Sembach (1):
      gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU

 MAINTAINERS                         |   2 +
 arch/mips/ar7/gpio.c                |   2 +-
 arch/powerpc/platforms/40x/Kconfig  |   1 +
 arch/sh/boards/mach-x3proto/setup.c |   2 +-
 drivers/gpio/Kconfig                |  24 +-
 drivers/gpio/Makefile               |   2 +
 drivers/gpio/gpio-elkhartlake.c     |  90 ++++++
 drivers/gpio/gpio-ich.c             |  10 +-
 drivers/gpio/gpio-merrifield.c      | 453 +++---------------------------
 drivers/gpio/gpio-mm-lantiq.c       |   2 +-
 drivers/gpio/gpio-tangier.c         | 536 ++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-tangier.h         | 117 ++++++++
 drivers/gpio/gpiolib-acpi.c         |  26 +-
 13 files changed, 825 insertions(+), 442 deletions(-)
 create mode 100644 drivers/gpio/gpio-elkhartlake.c
 create mode 100644 drivers/gpio/gpio-tangier.c
 create mode 100644 drivers/gpio/gpio-tangier.h

-- 
With Best Regards,
Andy Shevchenko


