Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D09C30D932
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 12:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234383AbhBCLwQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 06:52:16 -0500
Received: from mga05.intel.com ([192.55.52.43]:13808 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234380AbhBCLwO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Feb 2021 06:52:14 -0500
IronPort-SDR: +DfdmeH5WsENUYlwf9DAxVcJK7t76gzldFX+lV2eeIfABb0n5EFknjIX8AARL+yc3iX2noENsb
 Fjq+Zo9DqUBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="265861048"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="265861048"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:51:33 -0800
IronPort-SDR: qbZZ1+RYMkcGQ9Tu6paB57VwtXrYiNGWQYNoh7EzAxBpAdXwE7JHxF/juYBNqZXU/vD9vk7NPA
 wEdDfSu4W8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="575871586"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 03 Feb 2021 03:51:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3E766212; Wed,  3 Feb 2021 13:51:30 +0200 (EET)
Date:   Wed, 3 Feb 2021 13:51:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.12-1
Message-ID: <YBqOQpaTpUbDcdKo@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Non-traditional bunch for Intel GPIO drivers, because it includes an aggregator
clean up with necessary libraries update and test cases. Besides that, it has
nothing special, except removing couple of drivers from the subsystem. In any
case this PR is independent, but would be nice to couple it with PR of
ib-drm-gpio-pdx86-rtc-wdt-v5.12-1 which I had sent couple of weeks earlier.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.12-1

for you to fetch changes up to c5318e248f527fc8753e361bb61439f4e0c6d745:

  gpio: msic: Drop driver from Makefile (2021-02-03 13:05:56 +0200)

----------------------------------------------------------------
intel-gpio for v5.12-1

* Use generic parser of the ranges in GPIO aggregator driver
* Clean up Whiskey Cove driver to use new APIs and drop ambiguous casting
* Remove couple of drivers for deprecated platforms

The following is an automated git shortlog grouped by driver:

aggregator:
 -  Remove trailing comma in terminator entries
 -  Use compound literal from the header
 -  Replace isrange() by using get_options()

intel-mid:
 -  Remove driver for deprecated platform

lib/cmdline:
 -  Allow get_options() to take 0 to validate the input
 -  Update documentation to reflect behaviour

lib/cmdline_kunit:
 -  add a new test case for get_options()

merrifield:
 -  Make bias configuration available for GPIOs

msic:
 -  Drop driver from Makefile
 -  Remove driver for deprecated platform

wcove:
 -  Split out to_ireg() helper and deduplicate the code
 -  Switch to use regmap_set_bits(), regmap_clear_bits()
 -  Get rid of error prone casting in IRQ handler
 -  convert comma to semicolon

----------------------------------------------------------------
Andy Shevchenko (13):
      gpio: merrifield: Make bias configuration available for GPIOs
      lib/cmdline_kunit: add a new test case for get_options()
      lib/cmdline: Update documentation to reflect behaviour
      lib/cmdline: Allow get_options() to take 0 to validate the input
      gpio: aggregator: Replace isrange() by using get_options()
      gpio: aggregator: Use compound literal from the header
      gpio: aggregator: Remove trailing comma in terminator entries
      gpio: msic: Remove driver for deprecated platform
      gpio: intel-mid: Remove driver for deprecated platform
      gpio: wcove: Get rid of error prone casting in IRQ handler
      gpio: wcove: Switch to use regmap_set_bits(), regmap_clear_bits()
      gpio: wcove: Split out to_ireg() helper and deduplicate the code
      gpio: msic: Drop driver from Makefile

Zheng Yongjun (1):
      gpio: wcove: convert comma to semicolon

 MAINTAINERS                    |   2 -
 drivers/gpio/Kconfig           |  14 --
 drivers/gpio/Makefile          |   2 -
 drivers/gpio/TODO              |   2 +-
 drivers/gpio/gpio-aggregator.c |  40 +---
 drivers/gpio/gpio-intel-mid.c  | 414 -----------------------------------------
 drivers/gpio/gpio-merrifield.c |   5 +
 drivers/gpio/gpio-msic.c       | 314 -------------------------------
 drivers/gpio/gpio-wcove.c      |  65 +++----
 include/linux/gpio/machine.h   |   4 +-
 lib/cmdline.c                  |  21 ++-
 lib/cmdline_kunit.c            |  56 ++++++
 12 files changed, 120 insertions(+), 819 deletions(-)
 delete mode 100644 drivers/gpio/gpio-intel-mid.c
 delete mode 100644 drivers/gpio/gpio-msic.c

-- 
With Best Regards,
Andy Shevchenko


