Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE6D2A33E2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 20:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgKBTRy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 14:17:54 -0500
Received: from mga07.intel.com ([134.134.136.100]:17567 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgKBTRy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 14:17:54 -0500
IronPort-SDR: rLorNOI9KrgQlANDhJs661G7b1oMyMicoX215WACiftmrJTp9jVL2lTQNY2Dfq6BzZDvjZm9tR
 mrOI+NMRY0DQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="233106475"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="233106475"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 11:17:53 -0800
IronPort-SDR: I2SQYFoBbPOK4ri2eQ+r+OalfEBflq12UmM0v0hHKQY5Jui1nZtIXl3EOxRA0dW6f7XOpjtWdv
 YQXqjyGeZSpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="526777974"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2020 11:17:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 20CEFD2; Mon,  2 Nov 2020 21:17:49 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 0/4] gpiolib: acpi: pin configuration fixes
Date:   Mon,  2 Nov 2020 21:17:18 +0200
Message-Id: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are two fixes (and two small cleanups) that allow to take into
consideration more parameters in ACPI, i.e. bias for GpioInt() and
debounce time for GpioInt() and GpioIo() resources.

The first patch highly depends on Intel pin control driver changes
(for now [1], but might be more), so it's probably not supposed to be
backported (at least right now).

I think the best way is to collect tags from GPIO maintainers and I
can incorporate this into our Intel pin control branch which I will
share with you as PR against GPIO and pin control subsystems.

I'm also all ears for alternatives.

Cc: Jamie McClymont <jamie@kwiius.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>

[1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/

Changelog v3:
- dropped upstreamed OF patch
- added debounce fix

Andy Shevchenko (4):
  gpiolib: acpi: Respect bias settings for GpioInt() resource
  gpiolib: acpi: Use named item for enum gpiod_flags variable
  gpiolib: acpi: Take into account debounce settings
  gpiolib: acpi: Convert pin_index to be u16

 drivers/gpio/gpiolib-acpi.c | 23 ++++++++++++++++-------
 drivers/gpio/gpiolib-acpi.h |  2 ++
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.28.0

