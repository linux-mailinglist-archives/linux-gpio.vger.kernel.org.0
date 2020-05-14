Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42541D2D7F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 12:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgENKvu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 06:51:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:65156 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727853AbgENKvu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 06:51:50 -0400
IronPort-SDR: EyzXz+qXYeo46IOmEk1qCERJGh3G7SO7Qw7L7dqq6oBqS4pqxhPu2RBNctN3lIuUWF6TbuaSSY
 pQ0SdHm71LYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 03:51:49 -0700
IronPort-SDR: VK8zcU/xDOL5QhdnLq70ZOZzYcwDJZHUjW2Edbw02NJUc/eQujgr5zMjioFwJKyx2QVl/G0bNI
 9uS2lFidTJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; 
   d="scan'208";a="251625379"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 14 May 2020 03:51:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 714D6287; Thu, 14 May 2020 13:51:47 +0300 (EEST)
Date:   Thu, 14 May 2020 13:51:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.8-1
Message-ID: <20200514105147.GA44595@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Collected Intel pin control drivers for v5.8 cycle. It has all previous fixes
that doesn't appear in your for-next branch, thus, duplicates.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.8-1

for you to fetch changes up to 6d649fca349155698ba4b8858b258a62003c5c54:

  pinctrl: intel: Move npins closer to pin_base in struct intel_community (2020-04-22 14:20:00 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.8-1

* Introduce GPIO driver for Jasper Lake
* Fix long standing bug in Sunrisepoint-H PAD locking code
* Enable pin configuration setting for GPIO chip for Baytrail
* Work around race condition in Cherriview hardware when handle IRQ
* Clean up Cherryview code to be closer to other drivers

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Use platform_get_irq_optional() explicitly
 -  Enable pin configuration setting for GPIO chip

cannonlake:
 -  Use generic flag for special GPIO base treatment

cherryview:
 -  Add missing spinlock usage in chv_gpio_irq_handler
 -  Use GENMASK() consistently
 -  Re-use data structures from pinctrl-intel.h (part 2)

icelake:
 -  Use generic flag for special GPIO base treatment

intel:
 -  Move npins closer to pin_base in struct intel_community
 -  Update description in struct intel_community
 -  Add Intel Jasper Lake pin controller support
 -  Introduce new flag to force GPIO base to be 0
 -  Introduce common flags for GPIO mapping scheme

lynxpoint:
 -  Use platform_get_irq_optional() explicitly

sunrisepoint:
 -  Fix PAD lock register offset for SPT-H

tigerlake:
 -  Use generic flag for special GPIO base treatment

----------------------------------------------------------------
Andy Shevchenko (14):
      pinctrl: sunrisepoint: Fix PAD lock register offset for SPT-H
      pinctrl: baytrail: Enable pin configuration setting for GPIO chip
      pinctrl: cherryview: Re-use data structures from pinctrl-intel.h (part 2)
      pinctrl: cherryview: Use GENMASK() consistently
      pinctrl: intel: Introduce common flags for GPIO mapping scheme
      pinctrl: cannonlake: Use generic flag for special GPIO base treatment
      pinctrl: icelake: Use generic flag for special GPIO base treatment
      pinctrl: tigerlake: Use generic flag for special GPIO base treatment
      pinctrl: intel: Introduce new flag to force GPIO base to be 0
      pinctrl: intel: Add Intel Jasper Lake pin controller support
      pinctrl: baytrail: Use platform_get_irq_optional() explicitly
      pinctrl: lynxpoint: Use platform_get_irq_optional() explicitly
      pinctrl: intel: Update description in struct intel_community
      pinctrl: intel: Move npins closer to pin_base in struct intel_community

Grace Kao (1):
      pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler

 drivers/pinctrl/intel/Kconfig                |   8 +
 drivers/pinctrl/intel/Makefile               |   1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c     |  10 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c   |  58 +++--
 drivers/pinctrl/intel/pinctrl-cherryview.c   | 282 +++++++++-------------
 drivers/pinctrl/intel/pinctrl-icelake.c      |  30 ++-
 drivers/pinctrl/intel/pinctrl-intel.c        |  22 +-
 drivers/pinctrl/intel/pinctrl-intel.h        |  27 ++-
 drivers/pinctrl/intel/pinctrl-jasperlake.c   | 344 +++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    |  10 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |  15 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c    |  32 ++-
 12 files changed, 573 insertions(+), 266 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-jasperlake.c

-- 
With Best Regards,
Andy Shevchenko


