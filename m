Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FA92A9DE2
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 20:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgKFTXL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 14:23:11 -0500
Received: from mga14.intel.com ([192.55.52.115]:17627 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728034AbgKFTXK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:10 -0500
IronPort-SDR: TGLB4hUkW5Qbbh//Z3B2PUL7NOxgLXhDxupbBtIEyoPxrPDKZ/qvdtIh7QPOABIkHAVnP4c3lb
 hKGViS4V+hFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="168807652"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="168807652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:10 -0800
IronPort-SDR: V38zo1Olxtb/+teY/Z8VhLzNauBIR8uUgDxdOy5J9Fkih6a1oon6oRXViREo9nlKuF59SdORtP
 JD2rculbduMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="321694103"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2020 11:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 799DFA7; Fri,  6 Nov 2020 21:23:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 0/9] gpiolib: acpi: pin configuration fixes
Date:   Fri,  6 Nov 2020 21:22:55 +0200
Message-Id: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are two fixes (and several cleanups) that allow to take into
consideration more parameters in ACPI, i.e. bias for GpioInt() and
debounce time for Operation Regions, Events and GpioInt() resources.

The first patch highly depends on Intel pin control driver changes
(they are material for v5.10 [1]), so this is probably not supposed
to be backported (at least right now).

The last patch adds Intel GPIO tree as official one for ACPI GPIO
changes.

Assuming [1] makes v5.10 this series can be sent as PR to Linus
for v5.11 cycle.

Cc: Jamie McClymont <jamie@kwiius.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>

[1]: https://lore.kernel.org/linux-gpio/20201106181938.GA41213@black.fi.intel.com/

Changelog v4:
- extended debounce setting to ACPI events and Operation Regions
- added Ack (Linus)
- added few more cleanup patches, including MAINTAINERS update

Changelog v3:
- dropped upstreamed OF patch
- added debounce fix

Andy Shevchenko (9):
  gpiolib: acpi: Respect bias settings for GpioInt() resource
  gpiolib: acpi: Use named item for enum gpiod_flags variable
  gpiolib: acpi: Take into account debounce settings
  gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
  gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
  gpiolib: acpi: Extract acpi_request_own_gpiod() helper
  gpiolib: acpi: Convert pin_index to be u16
  gpiolib: acpi: Use BIT() macro to increase readability
  gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work

 MAINTAINERS                 |   1 +
 drivers/gpio/gpiolib-acpi.c | 130 +++++++++++++++++++++---------------
 drivers/gpio/gpiolib-acpi.h |   2 +
 3 files changed, 81 insertions(+), 52 deletions(-)

-- 
2.28.0

