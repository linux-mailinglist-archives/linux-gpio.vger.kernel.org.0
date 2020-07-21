Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEAA2280CA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 15:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgGUNSd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 09:18:33 -0400
Received: from mga03.intel.com ([134.134.136.65]:12687 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726971AbgGUNSc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jul 2020 09:18:32 -0400
IronPort-SDR: 8/Bag7fORvqyYl0kKPg6BnvUd8WYPzen7VNFVHSDCtB206BLYsLyGSzUuPrLu5a5Ik0cepP1t0
 pQHCGZFGVBtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="150107356"
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="150107356"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 06:18:31 -0700
IronPort-SDR: BVmw29QKyoXvxx+MVL0V6Gf77xsNM5OviLYbzVu1i0hU0d27dBfpBCHHoqTd0+tua8rNRVW0dA
 NTLi0gLBilNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="487609739"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jul 2020 06:18:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B538B119; Tue, 21 Jul 2020 16:18:29 +0300 (EEST)
Date:   Tue, 21 Jul 2020 16:18:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.9-1
Message-ID: <20200721131829.GA67334@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Intel pin controller driver for v5.9. No conflicts found, no build / other
issues. Nevertheless it contains one fix that has been already applied during
v5.8 cycle.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.9-1

for you to fetch changes up to b4f2fcb534875e2e57c96a0358267f2109d68004:

  pinctrl: intel: Add Intel Emmitsburg pin controller support (2020-07-21 11:44:21 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.9-1

* New driver for Emmitsburg
* New driver for Tiger Lake-H
* Part 3 of Cherryview driver clean up
* Fix a glitch on Baytrail platforms

The following is an automated git shortlog grouped by driver:

ARM/orion/gpio:
 -  Make use of for_each_requested_gpio()

at91:
 -  Make use of for_each_requested_gpio()

baytrail:
 -  Use fallthrough pseudo-keyword
 -  Fix pin being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH)
 -  Drop no-op ACPI_PTR() call

cherryview:
 -  Re-use data structures from pinctrl-intel.h (part 3)
 -  Convert chv_writel() to use chv_padreg()
 -  Introduce helpers to IO with common registers
 -  Introduce chv_readl() helper

gpio:
 -  xra1403: Make use of for_each_requested_gpio()
 -  mvebu: Make use of for_each_requested_gpio()

gpiolib:
 -  Introduce for_each_requested_gpio_in_range() macro

intel:
 -  Add Intel Emmitsburg pin controller support
 -  Make use of for_each_requested_gpio_in_range()
 -  Protect IO in few call backs by lock
 -  Split intel_config_get() to three functions
 -  Drop the only label in the code for consistency
 -  Get rid of redundant 'else' in intel_config_set_debounce()
 -  Make use of IRQ_RETVAL()
 -  Reduce scope of the lock
 -  Disable input and output buffer when switching to GPIO
 -  Allow drivers to define ACPI address space ID
 -  Allow drivers to define total amount of IRQs per community

lynxpoint:
 -  Drop no-op ACPI_PTR() call
 -  Introduce helpers to enable or disable input
 -  Make use of for_each_requested_gpio()

merrifield:
 -  Add I²S bus 2 pins to groups and functions
 -  Update pin names in accordance with official list

tigerlake:
 -  Add support for Tiger Lake-H

----------------------------------------------------------------
Andy Shevchenko (26):
      gpiolib: Introduce for_each_requested_gpio_in_range() macro
      ARM/orion/gpio: Make use of for_each_requested_gpio()
      gpio: mvebu: Make use of for_each_requested_gpio()
      gpio: xra1403: Make use of for_each_requested_gpio()
      pinctrl: at91: Make use of for_each_requested_gpio()
      pinctrl: cherryview: Introduce chv_readl() helper
      pinctrl: cherryview: Introduce helpers to IO with common registers
      pinctrl: cherryview: Convert chv_writel() to use chv_padreg()
      pinctrl: intel: Allow drivers to define total amount of IRQs per community
      pinctrl: intel: Allow drivers to define ACPI address space ID
      pinctrl: cherryview: Re-use data structures from pinctrl-intel.h (part 3)
      pinctrl: intel: Disable input and output buffer when switching to GPIO
      pinctrl: intel: Reduce scope of the lock
      pinctrl: intel: Make use of IRQ_RETVAL()
      pinctrl: intel: Get rid of redundant 'else' in intel_config_set_debounce()
      pinctrl: intel: Drop the only label in the code for consistency
      pinctrl: intel: Split intel_config_get() to three functions
      pinctrl: intel: Protect IO in few call backs by lock
      pinctrl: intel: Make use of for_each_requested_gpio_in_range()
      pinctrl: lynxpoint: Make use of for_each_requested_gpio()
      pinctrl: lynxpoint: Introduce helpers to enable or disable input
      pinctrl: lynxpoint: Drop no-op ACPI_PTR() call
      pinctrl: baytrail: Drop no-op ACPI_PTR() call
      pinctrl: merrifield: Update pin names in accordance with official list
      pinctrl: merrifield: Add I²S bus 2 pins to groups and functions
      pinctrl: intel: Add Intel Emmitsburg pin controller support

Gustavo A. R. Silva (1):
      pinctrl: baytrail: Use fallthrough pseudo-keyword

Hans de Goede (1):
      pinctrl: baytrail: Fix pin being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH)

Mika Westerberg (1):
      pinctrl: tigerlake: Add support for Tiger Lake-H

 arch/arm/plat-orion/gpio.c                 |   8 +-
 drivers/gpio/gpio-mvebu.c                  |   8 +-
 drivers/gpio/gpio-xra1403.c                |   8 +-
 drivers/pinctrl/intel/Kconfig              |   8 +
 drivers/pinctrl/intel/Makefile             |   1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c   |  74 +++--
 drivers/pinctrl/intel/pinctrl-cherryview.c | 418 +++++++++++++++--------------
 drivers/pinctrl/intel/pinctrl-emmitsburg.c | 387 ++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c      | 192 ++++++++-----
 drivers/pinctrl/intel/pinctrl-intel.h      |   4 +
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  |  28 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c |  50 ++--
 drivers/pinctrl/intel/pinctrl-tigerlake.c  | 358 ++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-at91.c             |   7 +-
 include/linux/gpio/driver.h                |  16 ++
 15 files changed, 1215 insertions(+), 352 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-emmitsburg.c

-- 
With Best Regards,
Andy Shevchenko


