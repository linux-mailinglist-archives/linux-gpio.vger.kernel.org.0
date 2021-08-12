Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C1E3EA5EB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 15:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237723AbhHLNqz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 09:46:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:56353 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237277AbhHLNqz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 09:46:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="212239559"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="212239559"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 06:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; 
   d="scan'208";a="639503416"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 12 Aug 2021 06:46:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8C679F9; Thu, 12 Aug 2021 16:46:27 +0300 (EEST)
Date:   Thu, 12 Aug 2021 16:46:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.15-1
Message-ID: <YRUmM1E80OTIrApK@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Mostly DesignWare changes, but really small update for v5.15 for the Intel /
ACPI stuff. Has been in Linux Next for a couple days without any complains
from bots nor people.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.15-1

for you to fetch changes up to 5111c2b6b0194b509f47e6338c4deeeb4497bda8:

  gpio: dwapb: Get rid of legacy platform data (2021-08-11 16:01:06 +0300)

----------------------------------------------------------------
intel-gpio for v5.15-1

* Rework DesignWare driver to use software nodes instead of platform data
* Drop duplication of forward declaration for ACPI in consumer.h
* Get rid of legacy PCI PM code in ML IOH driver

The following is an automated git shortlog grouped by driver:

dwapb:
 -  Get rid of legacy platform data
 -  Read GPIO base from gpio-base property
 -  Unify ACPI enumeration checks in get_irq() and configure_irqs()

gpiolib:
 -  Deduplicate forward declaration in the consumer.h header

mfd:
 -  intel_quark_i2c_gpio: Convert GPIO to use software nodes

ml-ioh:
 -  Convert to dev_pm_ops

----------------------------------------------------------------
Andy Shevchenko (5):
      gpiolib: Deduplicate forward declaration in the consumer.h header
      gpio: dwapb: Unify ACPI enumeration checks in get_irq() and configure_irqs()
      gpio: dwapb: Read GPIO base from gpio-base property
      mfd: intel_quark_i2c_gpio: Convert GPIO to use software nodes
      gpio: dwapb: Get rid of legacy platform data

Vaibhav Gupta (1):
      gpio: ml-ioh: Convert to dev_pm_ops

 drivers/gpio/gpio-dwapb.c                | 56 +++++++++++++++----------
 drivers/gpio/gpio-ml-ioh.c               | 49 +++++-----------------
 drivers/mfd/intel_quark_i2c_gpio.c       | 71 +++++++++++++++++---------------
 include/linux/gpio/consumer.h            |  6 +--
 include/linux/platform_data/gpio-dwapb.h | 25 -----------
 5 files changed, 84 insertions(+), 123 deletions(-)
 delete mode 100644 include/linux/platform_data/gpio-dwapb.h

-- 
With Best Regards,
Andy Shevchenko


