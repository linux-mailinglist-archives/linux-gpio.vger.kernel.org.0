Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017FB2B492C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 16:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729499AbgKPP0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 10:26:30 -0500
Received: from mga01.intel.com ([192.55.52.88]:31316 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729467AbgKPP03 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 10:26:29 -0500
IronPort-SDR: NEf5mSV3Hdc+/llGSPZhU2iomMV/vuFIIkHFdWZbgoGj82B7/2QhqS/2WS8IQsJnUtgIKZao5Z
 LHTLEr+IIo1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="188805698"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="188805698"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 07:26:28 -0800
IronPort-SDR: zcO4V+xiY6ljCCLy52xenx6gBqRcOKsbV/IDtqZ6J5R5LD1nVYoOiSkz8E0upCdI2IUtU3xS52
 qzy5cXRmxixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="329711201"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 16 Nov 2020 07:26:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D0B401F7; Mon, 16 Nov 2020 17:26:25 +0200 (EET)
Date:   Mon, 16 Nov 2020 17:26:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.11-1
Message-ID: <20201116152625.GA20187@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

ACPI GPIO library refactoring. It's based on recent gpio/for-next.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b72de3ff19fdc4bbe4d4bb3f4483c7e46e00bac3:

  gpio: sifive: Fix SiFive gpio probe (2020-11-11 09:53:09 +0100)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.11-1

for you to fetch changes up to e709a7b5a066362b697d65dda90edc71f913df70:

  gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work (2020-11-16 14:14:35 +0200)

----------------------------------------------------------------
intel-gpio for v5.11-1

* Refactor GPIO library to support bias and debounce ACPI settings

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Make Intel GPIO tree official for GPIO ACPI work
 -  acpi: Use BIT() macro to increase readability
 -  acpi: Convert pin_index to be u16
 -  acpi: Extract acpi_request_own_gpiod() helper
 -  acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
 -  acpi: Set initial value for output pin based on bias and polarity
 -  acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
 -  acpi: Move non-critical code outside of critical section
 -  acpi: Take into account debounce settings
 -  acpi: Use named item for enum gpiod_flags variable
 -  acpi: Respect bias settings for GpioInt() resource
 -  Introduce gpio_set_debounce_timeout() for internal use
 -  Extract gpio_set_config_with_argument_optional() helper
 -  move bias related code from gpio_set_config() to gpio_set_bias()
 -  Extract gpio_set_config_with_argument() for future use
 -  use proper API to pack pin configuration parameters
 -  add missed break statement
 -  Replace unsigned by unsigned int

Merge tag 'intel-pinctrl-v5.10-2' into HEAD:
 - Merge tag 'intel-pinctrl-v5.10-2' into HEAD

pinctrl:
 -  intel: Set default bias in case no particular value given
 -  intel: Fix 2 kOhm bias which is 833 Ohm

----------------------------------------------------------------
Andy Shevchenko (20):
      gpiolib: Use proper type for bias enumerator in gpio_set_bias()
      gpiolib: Switch to use compat_need_64bit_alignment_fixup() helper
      Merge tag 'intel-pinctrl-v5.10-2' into HEAD
      gpiolib: Replace unsigned by unsigned int
      gpiolib: add missed break statement
      gpiolib: use proper API to pack pin configuration parameters
      gpiolib: Extract gpio_set_config_with_argument() for future use
      gpiolib: move bias related code from gpio_set_config() to gpio_set_bias()
      gpiolib: Extract gpio_set_config_with_argument_optional() helper
      gpiolib: Introduce gpio_set_debounce_timeout() for internal use
      gpiolib: acpi: Respect bias settings for GpioInt() resource
      gpiolib: acpi: Use named item for enum gpiod_flags variable
      gpiolib: acpi: Take into account debounce settings
      gpiolib: acpi: Move non-critical code outside of critical section
      gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
      gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
      gpiolib: acpi: Extract acpi_request_own_gpiod() helper
      gpiolib: acpi: Convert pin_index to be u16
      gpiolib: acpi: Use BIT() macro to increase readability
      gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work

Deepak R Varma (1):
      gpio: 104-idi-48: improve code indentation

Linus Walleij (3):
      gpio: Retire the explicit gpio irqchip code
      gpio: stmpe: Fix forgotten refactoring
      Merge branch 'devel' into for-next

Vasile-Laurentiu Stanimir (1):
      gpiolib: acpi: Set initial value for output pin based on bias and polarity

 Documentation/driver-api/gpio/driver.rst |  67 +++++---
 MAINTAINERS                              |   1 +
 drivers/gpio/TODO                        |  49 ------
 drivers/gpio/gpio-104-idi-48.c           |   6 +-
 drivers/gpio/gpio-stmpe.c                |  10 +-
 drivers/gpio/gpiolib-acpi.c              | 138 ++++++++++-------
 drivers/gpio/gpiolib-acpi.h              |   2 +
 drivers/gpio/gpiolib-cdev.c              |  24 +--
 drivers/gpio/gpiolib.c                   | 256 ++++++++-----------------------
 drivers/gpio/gpiolib.h                   |   1 +
 drivers/pinctrl/intel/pinctrl-intel.c    |  40 +++--
 include/linux/gpio/consumer.h            |   4 +-
 include/linux/gpio/driver.h              |  71 ---------
 13 files changed, 235 insertions(+), 434 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


