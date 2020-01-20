Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E14E1427E9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 11:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgATKLB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 05:11:01 -0500
Received: from mga03.intel.com ([134.134.136.65]:53056 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgATKLB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jan 2020 05:11:01 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 02:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; 
   d="scan'208";a="244365687"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 20 Jan 2020 02:09:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6EF0D202; Mon, 20 Jan 2020 12:09:57 +0200 (EET)
Date:   Mon, 20 Jan 2020 12:09:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.6-1
Message-ID: <20200120100957.GA11113@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Intel pin control drivers update for v5.6 (next release cycle).

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b9a19bdbc843abd659e8ec6b1b3c32ae3a2455eb:

  pinctrl: cherryview: Pass irqchip when adding gpiochip (2019-12-09 12:55:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.6-1

for you to fetch changes up to cd0a32371db73d0b50536a7ca4f036abddff0d1d:

  pinctrl: tigerlake: Tiger Lake uses _HID enumeration (2020-01-16 13:30:40 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.6-1

* Tiger Lake appears to have _HID enumeration, thus driver has been updated
* Coffee Lake-S has the same IP as Sunrisepoint, thus ID has been added
* Baytrail has got more clean ups and bug fixes, such as direct IRQ handling
* Lynxpoint GPIO has been converted to true pin control driver
* The common driver now uses IRQ chip enumeration via GPIO chip

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Replace WARN with dev_info_once when setting direct-irq pin to output
 -  Do not clear IRQ flags on direct-irq enabled pins
 -  Reuse struct intel_pinctrl in the driver
 -  Use local variable to keep device pointer
 -  Keep pointer to struct device instead of its container
 -  Use GPIO direction definitions
 -  Move IRQ valid mask initialization to a dedicated callback
 -  Group GPIO IRQ chip initialization
 -  Allocate IRQ chip dynamic

cherryview:
 -  Use GPIO direction definitions

intel:
 -  Pass irqchip when adding gpiochip
 -  Add GPIO <-> pin mapping ranges via callback
 -  Share struct intel_pinctrl for wider use
 -  Use GPIO direction definitions

lynxpoint:
 -  Update summary in the driver
 -  Switch to pin control API
 -  Add GPIO <-> pin mapping ranges via callback
 -  Implement ->pin_dbg_show()
 -  Add pin control operations
 -  Reuse struct intel_pinctrl in the driver
 -  Add pin control data structures
 -  Implement intel_gpio_get_direction callback
 -  Implement ->irq_ack() callback
 -  Move ownership check to IRQ chip
 -  Move lp_irq_type() closer to IRQ related routines
 -  Move ->remove closer to ->probe()
 -  Extract lp_gpio_acpi_use() for future use
 -  Convert unsigned to unsigned int
 -  Switch to memory mapped IO accessors
 -  Keep pointer to struct device instead of its container
 -  Relax GPIO request rules
 -  Assume 2 bits for mode selector
 -  Use standard pattern for memory allocation
 -  Use %pR to print IO resource
 -  Drop useless assignment
 -  Correct amount of pins
 -  Use raw_spinlock for locking
 -  Move GPIO driver to pin controller folder

sunrisepoint:
 -  Add Coffee Lake-S ACPI ID
 -  Add missing Interrupt Status register offset

tigerlake:
 -  Tiger Lake uses _HID enumeration

----------------------------------------------------------------
Andy Shevchenko (31):
      pinctrl: baytrail: Allocate IRQ chip dynamic
      pinctrl: baytrail: Group GPIO IRQ chip initialization
      pinctrl: baytrail: Move IRQ valid mask initialization to a dedicated callback
      pinctrl: intel: Share struct intel_pinctrl for wider use
      pinctrl: baytrail: Keep pointer to struct device instead of its container
      pinctrl: baytrail: Use local variable to keep device pointer
      pinctrl: baytrail: Reuse struct intel_pinctrl in the driver
      pinctrl: lynxpoint: Move GPIO driver to pin controller folder
      pinctrl: lynxpoint: Use raw_spinlock for locking
      pinctrl: lynxpoint: Correct amount of pins
      pinctrl: lynxpoint: Drop useless assignment
      pinctrl: lynxpoint: Use %pR to print IO resource
      pinctrl: lynxpoint: Use standard pattern for memory allocation
      pinctrl: lynxpoint: Assume 2 bits for mode selector
      pinctrl: lynxpoint: Relax GPIO request rules
      pinctrl: lynxpoint: Keep pointer to struct device instead of its container
      pinctrl: lynxpoint: Switch to memory mapped IO accessors
      pinctrl: lynxpoint: Convert unsigned to unsigned int
      pinctrl: lynxpoint: Extract lp_gpio_acpi_use() for future use
      pinctrl: lynxpoint: Move ->remove closer to ->probe()
      pinctrl: lynxpoint: Move lp_irq_type() closer to IRQ related routines
      pinctrl: lynxpoint: Move ownership check to IRQ chip
      pinctrl: lynxpoint: Implement ->irq_ack() callback
      pinctrl: lynxpoint: Implement intel_gpio_get_direction callback
      pinctrl: lynxpoint: Add pin control data structures
      pinctrl: lynxpoint: Reuse struct intel_pinctrl in the driver
      pinctrl: lynxpoint: Add pin control operations
      pinctrl: lynxpoint: Implement ->pin_dbg_show()
      pinctrl: lynxpoint: Add GPIO <-> pin mapping ranges via callback
      pinctrl: lynxpoint: Switch to pin control API
      pinctrl: lynxpoint: Update summary in the driver

Boyan Ding (1):
      pinctrl: sunrisepoint: Add missing Interrupt Status register offset

Hans de Goede (2):
      pinctrl: baytrail: Do not clear IRQ flags on direct-irq enabled pins
      pinctrl: baytrail: Replace WARN with dev_info_once when setting direct-irq pin to output

Linus Walleij (2):
      pinctrl: intel: Add GPIO <-> pin mapping ranges via callback
      pinctrl: intel: Pass irqchip when adding gpiochip

Matti Vaittinen (3):
      pinctrl: baytrail: Use GPIO direction definitions
      pinctrl: cherryview: Use GPIO direction definitions
      pinctrl: intel: Use GPIO direction definitions

Mika Westerberg (2):
      pinctrl: sunrisepoint: Add Coffee Lake-S ACPI ID
      pinctrl: tigerlake: Tiger Lake uses _HID enumeration

 MAINTAINERS                                  |   1 -
 drivers/gpio/Kconfig                         |   8 -
 drivers/gpio/Makefile                        |   1 -
 drivers/gpio/gpio-lynxpoint.c                | 471 -------------
 drivers/pinctrl/intel/Kconfig                |  13 +
 drivers/pinctrl/intel/Makefile               |   1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c     | 311 +++++----
 drivers/pinctrl/intel/pinctrl-cherryview.c   |   5 +-
 drivers/pinctrl/intel/pinctrl-intel.c        | 101 ++-
 drivers/pinctrl/intel/pinctrl-intel.h        |  44 ++
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    | 975 +++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |   2 +
 drivers/pinctrl/intel/pinctrl-tigerlake.c    | 547 +++++++--------
 13 files changed, 1479 insertions(+), 1001 deletions(-)
 delete mode 100644 drivers/gpio/gpio-lynxpoint.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-lynxpoint.c

-- 
With Best Regards,
Andy Shevchenko


