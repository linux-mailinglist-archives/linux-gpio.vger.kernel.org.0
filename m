Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4947D3CB591
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 12:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236579AbhGPKEW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 06:04:22 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:62519 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236106AbhGPKES (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 06:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429684; x=1657965684;
  h=from:to:cc:subject:date:message-id;
  bh=ls7oURwpV0//ET+SF706k+xMGsecondMa6oT89lNxdc=;
  b=TZlW2igIiBYVl9LGinfOf0R1M70ui4DDbKJliwG6r8XXm4gtWFxS820D
   ch4icS3jaZOad0RCTBoFg/hgqkeG+ZMkKOB9m6Yu2wdtjF3kcyrRr0AQO
   XSWR3G1lWmxj6hrYFY6WoEdQjOO+5UdvQrown0xqAq1mXmjRUuoefDo5n
   3RU+X22QPPSpATFzvtZqndgtospl81BB5QFa3QPmW4Qnfz9+Xqn5k9rCc
   /DUvR2uTNRKzGvhU60TMmfEEUum2gYGkma6oNBtYTwYI5NW8F5rGrtG9b
   fVGgA7c4puNu9s2OgCJ0e8fPAf0WKjf6RHFWMQLv3wNA9/ZW5ZeRZmtZG
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492078"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jul 2021 12:01:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Jul 2021 12:01:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Jul 2021 12:01:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429679; x=1657965679;
  h=from:to:cc:subject:date:message-id;
  bh=ls7oURwpV0//ET+SF706k+xMGsecondMa6oT89lNxdc=;
  b=L9Y2BUsb5aLwTPbHVYGAcUMot9izXC3KsVHWnLaDUJZ6009aKDjxTvCF
   pdKOkR9gUI/Z6CFnzvNAZMbJ6yK0B5YyuTElYW/78G4cuKsADGpzfx4ku
   4LpvQWEf8Mic86dcQnvVFD6gqusNRvM5VQPBvvUlDqzkX2FYxOsOHG3w4
   ymtZDej2Tji6ufnijeGkDYOsH273hIkbTBf0ATt2iMd687mJcm4ymXJUI
   CnGIAsXn1V4xSg+EBbUsHLSpitWF1RXGMkz4V10OhDGqmh9kHMpgcBzUe
   bltYqcoWPBAKiZC13kNb+KDCyMZZC9yTWfBigZyk3b7Wx0d7RnqqFU9kd
   w==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492077"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 12:01:19 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id F3473280075;
        Fri, 16 Jul 2021 12:01:18 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 7/7] mfd: tqmx86: assume 24MHz LPC clock for unknown boards
Date:   Fri, 16 Jul 2021 12:00:53 +0200
Message-Id: <1af8d8ecd5beacb9d202494acea8fea2e350bc45.1626429286.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All future TQMx86 modules should use a 24MHz LPC clock. Warn about
unknown boards, but assume this is the case.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2:
- Separated from TQMxE40M support patch
- Add warning for unknown boards

v3: no changes

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

