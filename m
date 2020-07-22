Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3711222993F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 15:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732250AbgGVNbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 09:31:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:10906 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbgGVNbk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jul 2020 09:31:40 -0400
IronPort-SDR: u5tNGLtW98Zb4nOFoIqbTkm/odXEIRn6IvaJTUsBEK+zmmSYSadgDa3raIiS03gI30pTwQ2eLZ
 5UG8iwYWv/Ew==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="130405734"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="130405734"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 06:31:39 -0700
IronPort-SDR: W7bJI6XI41L1ye8oMCbs63emEO7IQTJ/WTN1e1w9QkMts1vPLqr/PWnly3YIInnYfecyYsMfZb
 /xrBEPi3PohA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="432378378"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 22 Jul 2020 06:31:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4337617E; Wed, 22 Jul 2020 16:31:36 +0300 (EEST)
Date:   Wed, 22 Jul 2020 16:31:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.9-1
Message-ID: <20200722133136.GA45594@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Bunch of Intel GPIO drivers update (legacy platforms, PMICs) for v5.9. It
includes for_each_requested_gpio() development as well in a form of immutable
branch. This is no-op for merging.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.9-1

for you to fetch changes up to 4941b8dedb3f33dcca5c6aef919ea518ff8947ce:

  gpio: sch: Add a blank line between declaration and code (2020-07-22 16:00:27 +0300)

----------------------------------------------------------------
intel-gpio for v5.9-1

* Move GPIO PMIC drivers to use IRQ chip template
* Introduce for_each_requested_gpio() and convert existing users
* Replace unsigned by unsigned int in few drivers
* Fix an issue in kernel doc that validator complains about
* Move to verbose debug level the IRQ status message in gpio-pch

The following is an automated git shortlog grouped by driver:

ARM/orion/gpio:
 -  Make use of for_each_requested_gpio()

crystalcove:
 -  Use irqchip template
 -  changed every 'unsigned' to 'unsigned int'

gpiolib:
 -  Introduce for_each_requested_gpio_in_range() macro

gpio-ml-ioh:
 -  Fix missing ':' in 'struct ioh_gpio_reg_data

ich:
 -  changed every 'unsigned' to 'unsigned int'

mvebu:
 -  Make use of for_each_requested_gpio()

pch:
 -  Add a blank line between declaration and code
 -  changed every 'unsigned' to 'unsigned int'
 -  Move IRQ status message to verbose debug level

pinctrl:
 -  at91: Make use of for_each_requested_gpio()

sch:
 -  Add a blank line between declaration and code
 -  changed every 'unsigned' to 'unsigned int'

wcove:
 -  Use irqchip template

xra1403:
 -  Make use of for_each_requested_gpio()

----------------------------------------------------------------
Abanoub Sameh (6):
      gpio: pch: changed every 'unsigned' to 'unsigned int'
      gpio: pch: Add a blank line between declaration and code
      gpio: crystalcove: changed every 'unsigned' to 'unsigned int'
      gpio: ich: changed every 'unsigned' to 'unsigned int'
      gpio: sch: changed every 'unsigned' to 'unsigned int'
      gpio: sch: Add a blank line between declaration and code

Andy Shevchenko (6):
      gpiolib: Introduce for_each_requested_gpio_in_range() macro
      ARM/orion/gpio: Make use of for_each_requested_gpio()
      gpio: mvebu: Make use of for_each_requested_gpio()
      gpio: xra1403: Make use of for_each_requested_gpio()
      pinctrl: at91: Make use of for_each_requested_gpio()
      gpio: pch: Move IRQ status message to verbose debug level

Lee Jones (1):
      gpio: gpio-ml-ioh: Fix missing ':' in 'struct ioh_gpio_reg_data

Linus Walleij (2):
      gpio: crystalcove: Use irqchip template
      gpio: wcove: Use irqchip template

 arch/arm/plat-orion/gpio.c      |  8 ++------
 drivers/gpio/gpio-crystalcove.c | 34 ++++++++++++++++++++--------------
 drivers/gpio/gpio-ich.c         | 26 +++++++++++++-------------
 drivers/gpio/gpio-ml-ioh.c      |  2 +-
 drivers/gpio/gpio-mvebu.c       |  8 ++------
 drivers/gpio/gpio-pch.c         | 14 ++++++++------
 drivers/gpio/gpio-sch.c         | 23 ++++++++++++-----------
 drivers/gpio/gpio-wcove.c       | 30 ++++++++++++++++--------------
 drivers/gpio/gpio-xra1403.c     |  8 ++------
 drivers/pinctrl/pinctrl-at91.c  |  7 ++-----
 include/linux/gpio/driver.h     | 16 ++++++++++++++++
 11 files changed, 94 insertions(+), 82 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


