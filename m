Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E257ACB08
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Sep 2023 19:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjIXRXm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Sep 2023 13:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjIXRXl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Sep 2023 13:23:41 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5885D103;
        Sun, 24 Sep 2023 10:23:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,173,1694703600"; 
   d="scan'208";a="180780922"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Sep 2023 02:23:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D111E402D0AD;
        Mon, 25 Sep 2023 02:23:29 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/3] pinctrl: mcp23s08_spi: Simplify probe()
Date:   Sun, 24 Sep 2023 18:23:19 +0100
Message-Id: <20230924172320.15165-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924172320.15165-1-biju.das.jz@bp.renesas.com>
References: <20230924172320.15165-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simpilfy probe() by replacing device_get_match_data() and ID lookup for
retrieving match data by spi_get_device_match_data().

While at it, replace data type of variable type from 'int'->'unsigned int'
and declare variables following a reverse christmas tree order.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2->v3:
 * Added Rb tag from Andy
 * Reordered the patch.
v2:
 * New patch.
---
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index ea059b9c5542..caf528284d07 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -143,22 +143,17 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
 
 static int mcp23s08_probe(struct spi_device *spi)
 {
-	struct device *dev = &spi->dev;
 	struct mcp23s08_driver_data *data;
+	struct device *dev = &spi->dev;
 	unsigned long spi_present_mask;
-	const void *match;
-	unsigned int addr;
 	unsigned int ngpio = 0;
+	unsigned int type;
+	unsigned int addr;
 	int chips;
-	int type;
 	int ret;
 	u32 v;
 
-	match = device_get_match_data(dev);
-	if (match)
-		type = (int)(uintptr_t)match;
-	else
-		type = spi_get_device_id(spi)->driver_data;
+	type = (uintptr_t)spi_get_device_match_data(spi);
 
 	ret = device_property_read_u32(dev, "microchip,spi-present-mask", &v);
 	if (ret) {
-- 
2.25.1

