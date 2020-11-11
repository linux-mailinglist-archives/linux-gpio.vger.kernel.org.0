Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0952AFB3E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgKKWUZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:20:25 -0500
Received: from mga17.intel.com ([192.55.52.151]:63860 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgKKWUZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:25 -0500
IronPort-SDR: f6UOH5lQul12Stjb7f/je25vhz1mMbA9k5vdJtWsEP/CiuVYm03weDOH/VfssMjsEk2lSOsl1u
 BJdzF4KUTC2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="150077415"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="150077415"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:24 -0800
IronPort-SDR: VhPwuFAKRNEeYUNBKYb7jlUxl5cghs+tjUGbW/oLx42bkT0N7MrBaasFHWOjl0dFIDft59NJGG
 z79gIyia7LtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="354991153"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 11 Nov 2020 14:20:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 19532B1; Thu, 12 Nov 2020 00:20:21 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Vasile-Laurentiu Stanimir 
        <vasile-laurentiu.stanimir@windriver.com>
Subject: [PATCH v7 00/18] gpiolib: acpi: pin configuration fixes
Date:   Thu, 12 Nov 2020 00:19:50 +0200
Message-Id: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are fixes (and plenty cleanups) that allow to take into consideration
more parameters in ACPI, i.e. bias for GpioInt() and debounce timeout
for Operation Regions, Events and GpioInt() resources.

During review Hans noted, that gpiod_set_debounce() returns -ENOTSUPP for
the cases when feature is not supported either by driver or a controller.

It appears that we have slightly messy API here:

  FUNC			Relation with ENOTSUPP

  gpiod_set_config()	 returns if not supported
  gpiod_set_debounce()	 as gpiod_set_config() above
  gpio_set_debounce()	 legacy wrapper on top of gpiod_set_debounce()
  gpiod_set_transitory() skips it (returns okay) with debug message
  gpio_set_config()	 returns if not supported
  gpio_set_bias()	 skips it (returns okay)

Last two functions are internal to GPIO library, while the rest is
exported API. In order to be consistent with both naming schemas
the series introduces gpio_set_debounce_timeout() that considers
the feature optional. New API is only for internal use.

While at it, the few first patches clean up the current GPIO library
code to unify it to some extend.

The above is followed by changes made in ACPI GPIO library part.

The bias patch highly depends on Intel pin control driver changes
(they are material for v5.10 [1]), due to this and amount of the
prerequisite changes this series is probably not supposed to be
backported (at least right now).

The last patch adds Intel GPIO tree as official one for ACPI GPIO
changes.

Assuming [1] makes v5.10 this series can be sent as PR to Linus
for v5.11 cycle.

Note, some patches are also depend to the code from GPIO fixes / for-next
repositories. Unfortunately there is no one repository which contains all
up to date for-next changes against GPIO subsystem. That's why I have merged
Linus' for-next followed by Bart's for-next branches as prerequisites
to the series.

Cc: Jamie McClymont <jamie@kwiius.com>
Cc: Coiby Xu <coiby.xu@gmail.com>
Cc: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>

[1]: https://lore.kernel.org/linux-gpio/20201106181938.GA41213@black.fi.intel.com/

Changelog v7:
- sent correct set of patches

Changelog v6:
- added tags (Hans, Mika, Linus)
- dropped temporary variables in couple of patches (Mika)
- dropped "Add temporary variable to gpiod_set_transitory()..." (Mika)
- added patch to move assignments outside a lock (Mika)
- added patch from Vasile
- due to above rebased accordingly the affected ones

Changelog v5:
- introduced gpio_set_debounce_timeout()
- made a prerequisite refactoring in GPIO library code
- updated the rest accordingly

Changelog v4:
- extended debounce setting to ACPI events and Operation Regions
- added Ack (Linus)
- added few more cleanup patches, including MAINTAINERS update

Changelog v3:
- dropped upstreamed OF patch
- added debounce fix

Andy Shevchenko (17):
  gpiolib: Replace unsigned by unsigned int
  gpiolib: add missed break statement
  gpiolib: use proper API to pack pin configuration parameters
  gpiolib: Extract gpio_set_config_with_argument() for future use
  gpiolib: move bias related code from gpio_set_config() to
    gpio_set_bias()
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

Vasile-Laurentiu Stanimir (1):
  gpiolib: acpi: Set initial value for output pin based on bias and
    polarity

 MAINTAINERS                   |   1 +
 drivers/gpio/gpiolib-acpi.c   | 138 +++++++++++++++++++++-------------
 drivers/gpio/gpiolib-acpi.h   |   2 +
 drivers/gpio/gpiolib.c        |  98 ++++++++++++++----------
 drivers/gpio/gpiolib.h        |   1 +
 include/linux/gpio/consumer.h |   4 +-
 6 files changed, 147 insertions(+), 97 deletions(-)

-- 
2.28.0

