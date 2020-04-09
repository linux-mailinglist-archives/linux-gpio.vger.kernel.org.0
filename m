Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 990A21A3579
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgDIOMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:21918 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727079AbgDIOMd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:33 -0400
IronPort-SDR: 2PQcQw0q0n89UFE7UNAEHljoFcVx6kcqum69jnsjuMKZRuaoBbsaoQvkutPFMdaWcay96h4hHl
 k/cbD0R7EzwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:33 -0700
IronPort-SDR: PYAXGXGXiFsK/n2t7C3e+Q5C4yzqNSyPMvVe/LeqbKxobZUgF1jAOT2MStUxsGQdFouZUSqSFH
 hDo7YASZFVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="244327336"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Apr 2020 07:12:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6035E1FD; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 00/13] gpio: dwapb: Clean up the driver and a fix
Date:   Thu,  9 Apr 2020 17:12:15 +0300
Message-Id: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
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

Andy Shevchenko (13):
  gpio: dwapb: Append MODULE_ALIAS for platform driver
  gpio: dwapb: Refactor IRQ handler
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

