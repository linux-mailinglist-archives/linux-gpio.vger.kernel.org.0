Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03899475AB2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 15:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243388AbhLOOdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 09:33:33 -0500
Received: from mga07.intel.com ([134.134.136.100]:26314 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234528AbhLOOdc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Dec 2021 09:33:32 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="302611786"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="302611786"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 06:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="614720004"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 15 Dec 2021 06:33:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D1F2AD4; Wed, 15 Dec 2021 16:33:11 +0200 (EET)
Date:   Wed, 15 Dec 2021 16:33:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.17-1
Message-ID: <Ybn8pxv5xPgc5nGz@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Approximately a dozen of changes for v5.17 against Intel GPIO drivers and
GPIO ACPI library. It has ben a while in Linux Next without any error reported.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.17-1

for you to fetch changes up to 9d5f0f6644b1404f40266a2682add712dc9931f5:

  gpio: sch: fix typo in a comment (2021-12-13 13:29:09 +0200)

----------------------------------------------------------------
intel-gpio for v5.17-1

* Don't set type for IRQ already in use in case of ACPI
* Drop unused call from GPIO ACPI library
* Clean up ML IOH and PCH GPIO drivers to make it closer to each other
* Clarify use of register file version in DesignWare driver

The following is an automated git shortlog grouped by driver:

dwapb:
 -  clarify usage of the register file version

gpiolib:
 -  acpi: Unify debug and other messages format
 -  acpi: Do not set the IRQ type if the IRQ is already in use
 -  acpi: shrink devm_acpi_dev_add_driver_gpios()
 -  acpi: Remove never used devm_acpi_dev_remove_driver_gpios()

ml-ioh:
 -  Change whitespace to match gpio-pch.c
 -  Use BIT() to match gpio-pch.c
 -  Cache &pdev->dev to reduce repetition

pch:
 -  Cache &pdev->dev to reduce repetition
 -  Use .driver_data instead of checking Device IDs again

sch:
 -  fix typo in a comment

----------------------------------------------------------------
Andy Shevchenko (4):
      gpiolib: acpi: Remove never used devm_acpi_dev_remove_driver_gpios()
      gpiolib: acpi: shrink devm_acpi_dev_add_driver_gpios()
      gpiolib: acpi: Unify debug and other messages format
      gpio: dwapb: clarify usage of the register file version

Bjorn Helgaas (5):
      gpio: pch: Use .driver_data instead of checking Device IDs again
      gpio: pch: Cache &pdev->dev to reduce repetition
      gpio: ml-ioh: Cache &pdev->dev to reduce repetition
      gpio: ml-ioh: Use BIT() to match gpio-pch.c
      gpio: ml-ioh: Change whitespace to match gpio-pch.c

Hans de Goede (1):
      gpiolib: acpi: Do not set the IRQ type if the IRQ is already in use

Jason Wang (1):
      gpio: sch: fix typo in a comment

 drivers/gpio/gpio-dwapb.c     | 10 +++++----
 drivers/gpio/gpio-ml-ioh.c    | 52 +++++++++++++++++++++----------------------
 drivers/gpio/gpio-pch.c       | 42 +++++++++++++++++-----------------
 drivers/gpio/gpio-sch.c       |  2 +-
 drivers/gpio/gpiolib-acpi.c   | 51 ++++++++++++++++++------------------------
 include/linux/gpio/consumer.h |  2 --
 6 files changed, 75 insertions(+), 84 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


