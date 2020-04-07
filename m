Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 120D11A1328
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDGRwu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:52:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:9786 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgDGRwu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:52:50 -0400
IronPort-SDR: 4SQJUA3na+pqgwk5XUYmGaRSO9JNyF3ZiASmJC96FYHnhfIX9nfhoOT31WBhUHOnPvFAIhNbc6
 KK57ibxWvBYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:52 -0700
IronPort-SDR: ptWvvvZoLwYZOIxwpTuEgv2iCmcNpZksdj4ugXDrvqa/BDsZnxk1adYcxdkYCU5dB5+hiGbWwJ
 0nZqe5XMsbcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="275174106"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2020 10:38:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 716D214F; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/9] pinctrl: mcp23s08: Drop unused parameter in mcp23s08_probe_one()
Date:   Tue,  7 Apr 2020 20:38:44 +0300
Message-Id: <20200407173849.43628-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The cs parameter in mcp23s08_probe_one() is never used. Drop it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 30a5b6bfbb86..513864c74860 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -581,7 +581,7 @@ static int mcp23s08_irqchip_setup(struct mcp23s08 *mcp)
 
 static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			      unsigned int addr, unsigned int type,
-			      unsigned int base, int cs)
+			      unsigned int base)
 {
 	int status, ret;
 	bool mirror = false;
@@ -741,7 +741,7 @@ static int mcp230xx_probe(struct i2c_client *client,
 
 	mcp->pinctrl_desc.name = "mcp23xxx-pinctrl";
 
-	status = mcp23s08_probe_one(mcp, dev, client->addr, type, -1, 0);
+	status = mcp23s08_probe_one(mcp, dev, client->addr, type, -1);
 	if (status)
 		return status;
 
@@ -1009,7 +1009,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 		if (!data->mcp[addr]->pinctrl_desc.name)
 			return -ENOMEM;
 
-		status = mcp23s08_probe_one(data->mcp[addr], dev, 0x40 | (addr << 1), type, -1, addr);
+		status = mcp23s08_probe_one(data->mcp[addr], dev, 0x40 | (addr << 1), type, -1);
 		if (status < 0)
 			return status;
 
-- 
2.25.1

