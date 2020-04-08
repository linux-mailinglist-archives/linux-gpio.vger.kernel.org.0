Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B641A250D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2020 17:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbgDHPXx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 11:23:53 -0400
Received: from mga09.intel.com ([134.134.136.24]:29771 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727990AbgDHPXw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Apr 2020 11:23:52 -0400
IronPort-SDR: UN1LyN1YZGXhMJ9/FqYT9vD4Km77IyntR5fL6+tnr32BsLCzuwUADegnQ+MTFAaXriaTGETO6i
 d3x+0Sv1bgpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 08:23:50 -0700
IronPort-SDR: rirwB07BKL1zZYGas10Aez2Ok5+7WtGCqY8QMBzORYUxpwOWoM7K+KqYSX5fCmSeQXbN7ubXrf
 gwC0d4O9Slfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; 
   d="scan'208";a="251588973"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 08 Apr 2020 08:23:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D74EAD2; Wed,  8 Apr 2020 18:23:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpio: merrifield: Better show how GPIO and IRQ bases are derived from hardware
Date:   Wed,  8 Apr 2020 18:23:46 +0300
Message-Id: <20200408152346.59718-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408152346.59718-1-andriy.shevchenko@linux.intel.com>
References: <20200408152346.59718-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's a bit hard to realize what the BAR1 is for and what is the layout
of the data in it. Be slightly more verbose to better show how GPIO and
IRQ bases are derived from the hardware.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 1f0cf909ea40..cdd782a186aa 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -443,8 +443,8 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 	base = pcim_iomap_table(pdev)[1];
 
-	irq_base = readl(base);
-	gpio_base = readl(sizeof(u32) + base);
+	irq_base = readl(base + 0 * sizeof(u32));
+	gpio_base = readl(base + 1 * sizeof(u32));
 
 	/* Release the IO mapping, since we already get the info from BAR1 */
 	pcim_iounmap_regions(pdev, BIT(1));
-- 
2.25.1

