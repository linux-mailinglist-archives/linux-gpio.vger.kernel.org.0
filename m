Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7FF31A1326
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDGRwr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:52:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:20658 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbgDGRwq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:52:46 -0400
IronPort-SDR: ToP5QXRsse1hSbIVgGpTtBx9K339y/VB8jzbsAz3vdPd4PMKNH0jKlltTx9Ci/Op9nO5kSWbQl
 ETgPUbRaUBSg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:54 -0700
IronPort-SDR: Velk0JED80ERc9OM2nV48xOnGNdF0oVTQMNHPeumLllyluRXPLUjQkG2KVmepzM2hFvCVS5voj
 5Wn4yx5bIpNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="240024065"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 07 Apr 2020 10:38:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 85FDA1FD; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/9] pinctrl: mcp23s08: Propagate error code from device_property_read_u32()
Date:   Tue,  7 Apr 2020 20:38:46 +0300
Message-Id: <20200407173849.43628-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Return error code from device_property_read_u32() as is in mcp23s08_probe().
While here, drop status variable in mcp23s08_irq_set_type() which always 0.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 07b69242a5b3..515d1aa32732 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -485,7 +485,6 @@ static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 	unsigned int pos = data->hwirq;
-	int status = 0;
 
 	if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
 		mcp_set_bit(mcp, MCP_INTCON, pos, false);
@@ -508,7 +507,7 @@ static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
 	} else
 		return -EINVAL;
 
-	return status;
+	return 0;
 }
 
 static void mcp23s08_irq_bus_lock(struct irq_data *data)
@@ -964,7 +963,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 				"mcp,spi-present-mask", &spi_present_mask);
 		if (status) {
 			dev_err(&spi->dev, "missing spi-present-mask");
-			return -ENODEV;
+			return status;
 		}
 	}
 
-- 
2.25.1

