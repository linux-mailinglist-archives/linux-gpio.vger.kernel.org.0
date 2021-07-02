Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842783BA057
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhGBM0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:26:46 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:42419 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232206AbhGBM0l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228649; x=1656764649;
  h=from:to:cc:subject:date:message-id;
  bh=i1B2hVnhFg7bXOdNCkdVmlZaSpi0oK/SS9yg7qx3A4Y=;
  b=j6YGRFIUALAuS/ogy2sHvjrk+s0hLwGnxqOQSsup9nHWb6n9HwZnKE7A
   xnH5Ne8VBKiXMY7NGB2M6LLj/bGya8edytkiUIR3DCPEpVjJX3kMEJ5Y/
   eLYTb6iaiXi3Jodo5lpWDKgIFSCQTwnFFaxiUYlIYSBNTaoiULRyKkaaV
   BjbDSVvhcbUcZ+o0ZWjR/Q5VvDpB6PpZ9DGJIFUYgg2mM4dsfPG+4iAUc
   kRE+toxR/bdROXIVjvo0/CrkllTuSNxwAcDS/tOH2n74RmF2js1HhWaSJ
   yoDHTCqAVO+ybuo7qTogvCgmOHeL5Pdy5WmSzKUCb9bZ2RA0phjSDedjp
   A==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252580"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 02 Jul 2021 14:24:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 02 Jul 2021 14:24:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228645; x=1656764645;
  h=from:to:cc:subject:date:message-id;
  bh=i1B2hVnhFg7bXOdNCkdVmlZaSpi0oK/SS9yg7qx3A4Y=;
  b=OMi/e2jR0tdf7cBKo/jTWQo33bPt0jhJSY/ZPfVLTJOvYSWq2mwthGV+
   2U4x2pa95XVo2zCbKCT07F1Azcq6wwoMuVx9acM1JgHoCXFTGoUMz7X7A
   i8va/uFBOQHBWnDvr6fAQS8UVc2OskZ1AhYb1gVCEvXXNBCzenAdSxsBB
   1UFmPaiCugpMpHldM3c16ksdb2xKRRhB0DMKJzzZ0RK+GtyoWIIpi13er
   11lvXqdKvLJjrD/fNdTRloQIp5byPfhBpPIiUbvMxA4uJBY/P02YS7wcc
   Jx3HTaasQS+LKTRexcDRvHm1eQDdKKHoFOwBaiFwP80NVDHWXsb0HyoEj
   Q==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252579"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 7E5F4280075;
        Fri,  2 Jul 2021 14:24:05 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 7/7] mfd: tqmx86: assume 24MHz LPC clock for unknown boards
Date:   Fri,  2 Jul 2021 14:23:53 +0200
Message-Id: <384f4c0070fc95e4e688731876178f9299861aa7.1625227382.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All future TQMx86 modules should use a 24MHz LPC clock. Warn about
unknown boards, but assume this is the case.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2:
- Separated from TQMxE40M support patch
- Add warning for unknown boards


 drivers/mfd/tqmx86.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 58f35c8b5a45..7ae906ff8e35 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -147,7 +147,7 @@ static const char *tqmx86_board_id_to_name(u8 board_id)
 	}
 }
 
-static int tqmx86_board_id_to_clk_rate(u8 board_id)
+static int tqmx86_board_id_to_clk_rate(struct device *dev, u8 board_id)
 {
 	switch (board_id) {
 	case TQMX86_REG_BOARD_ID_50UC:
@@ -168,7 +168,9 @@ static int tqmx86_board_id_to_clk_rate(u8 board_id)
 	case TQMX86_REG_BOARD_ID_E38C:
 		return 33000;
 	default:
-		return 0;
+		dev_warn(dev, "unknown board %d, assuming 24MHz LPC clock\n",
+			 board_id);
+		return 24000;
 	}
 }
 
@@ -229,7 +231,7 @@ static int tqmx86_probe(struct platform_device *pdev)
 		tqmx_gpio_resources[0].flags = 0;
 	}
 
-	ocores_platform_data.clock_khz = tqmx86_board_id_to_clk_rate(board_id);
+	ocores_platform_data.clock_khz = tqmx86_board_id_to_clk_rate(dev, board_id);
 
 	if (i2c_det == TQMX86_REG_I2C_DETECT_SOFT) {
 		err = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-- 
2.17.1

