Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90740116D98
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfLINJa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:30 -0500
Received: from mga14.intel.com ([192.55.52.115]:15026 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727268AbfLINJ3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:29 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="244440730"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2019 05:09:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 26FB0141; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 00/24] pinctrl: intel: Move Lynxpoint to pin control umbrella
Date:   Mon,  9 Dec 2019 15:09:02 +0200
Message-Id: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Intel Lynxpoint GPIO is actually half way to the Chassis specification
that has been established starting from Intel Skylake. It has some pin control
properties we may utilize. To achieve this, move the driver under pin control
umbrella and do a bunch of clean ups.

The series has been tested on Broadwell Ultrabook where Lynxpoint GPIO
is exposed to the OS.

It has a dependency to patches in my review branch [1]. That dependency patch
is supposed to be submitted soon as a part of Baytrail clean up. In the
mentioned branch the patches are represented in the correct order.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/log/?h=review-andy

Changes v2:
- fixed ordering in Kconfig and Makefile (Mika)
- finished conversion to pin control

Andy Shevchenko (24):
  pinctrl: lynxpoint: Move GPIO driver to pin controller folder
  pinctrl: lynxpoint: Use raw_spinlock for locking
  pinctrl: lynxpoint: Correct amount of pins
  pinctrl: lynxpoint: Drop useless assignment
  pinctrl: lynxpoint: Use %pR to print IO resource
  pinctrl: lynxpoint: Use standard pattern for memory allocation
  pinctrl: lynxpoint: Assume 2 bits for mode selector
  pinctrl: lynxpoint: Relax GPIO request rules
  pinctrl: lynxpoint: Keep pointer to struct device instead of its
    container
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

 MAINTAINERS                               |   1 -
 drivers/gpio/Kconfig                      |   8 -
 drivers/gpio/Makefile                     |   1 -
 drivers/gpio/gpio-lynxpoint.c             | 471 -----------
 drivers/pinctrl/intel/Kconfig             |  13 +
 drivers/pinctrl/intel/Makefile            |   1 +
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 975 ++++++++++++++++++++++
 7 files changed, 989 insertions(+), 481 deletions(-)
 delete mode 100644 drivers/gpio/gpio-lynxpoint.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-lynxpoint.c

-- 
2.24.0

