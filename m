Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5665F1A12C7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgDGRiw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:38:52 -0400
Received: from mga04.intel.com ([192.55.52.120]:31713 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbgDGRiw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:38:52 -0400
IronPort-SDR: 2uqFRSva0eoy8kVcyvfBmd54RYNpmYAtaxyPid9ekzJAHM/wGjIrwK1+IScAx+YU9/E6YX8IB7
 xILN8NWtp+NQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:52 -0700
IronPort-SDR: k6mazVhuKW/ZrZnt8ixl2sBoXusB7ZHJ6aSk5dnQevcPUJTOLntZmojokoZs7+/tXQPA9W63RQ
 lZtHQB++K8Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="452509352"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2020 10:38:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 56A5355; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/9] pinctrl: mcp23s08: Deduplicate IRQ chip filling
Date:   Tue,  7 Apr 2020 20:38:42 +0300
Message-Id: <20200407173849.43628-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In both cases, SPI and I²C, IRQ chip is filled in the same way.
Deduplicate this by moving common part to mcp23s08_probe_one().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 2c8b8c45b70e..e05219d3331f 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -669,7 +669,14 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 	mcp->dev = dev;
 	mcp->addr = addr;
+
 	mcp->irq_active_high = false;
+	mcp->irq_chip.name = dev_name(dev);
+	mcp->irq_chip.irq_mask = mcp23s08_irq_mask;
+	mcp->irq_chip.irq_unmask = mcp23s08_irq_unmask;
+	mcp->irq_chip.irq_set_type = mcp23s08_irq_set_type;
+	mcp->irq_chip.irq_bus_lock = mcp23s08_irq_bus_lock;
+	mcp->irq_chip.irq_bus_sync_unlock = mcp23s08_irq_bus_unlock;
 
 	mcp->chip.direction_input = mcp23s08_direction_input;
 	mcp->chip.get = mcp23s08_get;
@@ -921,12 +928,6 @@ static int mcp230xx_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	mcp->irq = client->irq;
-	mcp->irq_chip.name = dev_name(&client->dev);
-	mcp->irq_chip.irq_mask = mcp23s08_irq_mask;
-	mcp->irq_chip.irq_unmask = mcp23s08_irq_unmask;
-	mcp->irq_chip.irq_set_type = mcp23s08_irq_set_type;
-	mcp->irq_chip.irq_bus_lock = mcp23s08_irq_bus_lock;
-	mcp->irq_chip.irq_bus_sync_unlock = mcp23s08_irq_bus_unlock;
 
 	status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
 				    id->driver_data, -1, 0);
@@ -1029,13 +1030,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 		chips--;
 		data->mcp[addr] = &data->chip[chips];
 		data->mcp[addr]->irq = spi->irq;
-		data->mcp[addr]->irq_chip.name = dev_name(&spi->dev);
-		data->mcp[addr]->irq_chip.irq_mask = mcp23s08_irq_mask;
-		data->mcp[addr]->irq_chip.irq_unmask = mcp23s08_irq_unmask;
-		data->mcp[addr]->irq_chip.irq_set_type = mcp23s08_irq_set_type;
-		data->mcp[addr]->irq_chip.irq_bus_lock = mcp23s08_irq_bus_lock;
-		data->mcp[addr]->irq_chip.irq_bus_sync_unlock =
-			mcp23s08_irq_bus_unlock;
 		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
 					    0x40 | (addr << 1), type,
 					    -1, addr);
-- 
2.25.1

