Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E30B61AA99E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636549AbgDOOPq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:15:46 -0400
Received: from mga03.intel.com ([134.134.136.65]:39590 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636535AbgDOOPl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:41 -0400
IronPort-SDR: pv14rx9FLTLeBjXDjjimu9uoX9ZDZoHc/Gnb0bhmc3p6ic+TRsQara8Bl0bkLzYMXyXdAhAk7e
 gAP+T/0sTycQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:37 -0700
IronPort-SDR: Hv8l1cDWPXG67pcgBJ9gOvUalqCpGCbXRa9A+wuLhNgCcNpJges3sAyAx/UEhBacCvdbnRSV2Z
 9ESt2DImEpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="242316053"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2020 07:15:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 818BC19C; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 00/14] gpio: dwapb: Clean up the driver and a fix
Date:   Wed, 15 Apr 2020 17:15:20 +0300
Message-Id: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that GPIO DW APB driver wasn't touched for a long time. Here is
the fix for long standing issue, i.e. missed module alias to make the driver
be loaded automatically.

On top of above a lot small clean ups here and there.

The series based on the v3 by Serge Semin which he sent earlier.

Driver has been tested on Intel Galileo Gen2 with AT25 SPI EEPROM using it
for a chip select.

Changelog since v1:
- added Tested-by and Reviewed-by tags (Serge)
- split IRQ refactoring patch to two (Serge)
- update hwirq variable type to be irq_hw_number_t

Cc: Serge Semin <fancer.lancer@gmail.com>

Andy Shevchenko (14):
  gpio: dwapb: Append MODULE_ALIAS for platform driver
  gpio: dwapb: Refactor IRQ handler to use bit operations
  gpio: dwapb: Use chained IRQ prologue and epilogue
  gpio: dwapb: set default handler to be handle_bad_irq()
  gpio: dwapb: Deduplicate IRQ resource management
  gpio: dwapb: Convert to use irqd_to_hwirq()
  gpio: dwapb: Use device_get_match_data() to simplify code
  gpio: dwapb: Convert to use IRQ core provided macros
  gpio: dwapb: Switch to more usual pattern of RMW in
    dwapb_gpio_set_debounce()
  gpio: dwapb: Drop bogus BUG_ON()s
  gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
  gpio: dwapb: Split out dwapb_get_irq() helper
  gpio: dwapb: Use positive conditional in dwapb_configure_irqs()
  gpio: dwapb: Amend indentation in some cases

 drivers/gpio/gpio-dwapb.c | 205 +++++++++++++++-----------------------
 1 file changed, 79 insertions(+), 126 deletions(-)

-- 
2.25.1

