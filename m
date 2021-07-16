Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA0D3CB58A
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 12:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhGPKEP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 06:04:15 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:62519 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236053AbhGPKEP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 06:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429680; x=1657965680;
  h=from:to:cc:subject:date:message-id;
  bh=QUh+Fuhg1h0WDvDhcefMi6WmAvqvrckg//HD+67X8Us=;
  b=FiQUzLEum204vNpJMkhP3dJzbuZgP2KfhawLH4FPhSi2uk144iUI3RNJ
   A8c3SjTioQfSh6Iq6hWkj7tzuDK1WmoAO8qUoTdqtV4sUPtRi45d84G+g
   nDP2aA0rDmo6u0GDUFqZTkj5oF1jMPVikPiMcoAyxOuu4xUClInsHCnEK
   3I7Arsryzgaar9Zr81vccFVXg88IcpWR1vPEyFcCg8+h31iFJX/8O8XaR
   buRTiDV3Vl5tY8UhRsGkZbuHKFcjqZEP5iIkb255KYW8pWBlq78evID5E
   m7Gl+voNfgPCoOwy/Hd/KinQDklGTxo2QfITl7OM4+Yqie8z2XYols0QR
   w==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492068"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Jul 2021 12:01:18 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Jul 2021 12:01:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429678; x=1657965678;
  h=from:to:cc:subject:date:message-id;
  bh=QUh+Fuhg1h0WDvDhcefMi6WmAvqvrckg//HD+67X8Us=;
  b=cBiGZdGSQsyJIGlJbauz4vDBQmFaZv+UFoWc6A/hpx56bVRqFJg7Shyq
   /h79lfNGhpPHSQZRjO7UkSWvZ2AbQrhBEpVO3nX/aUXuNmbRx7gRIveSg
   V6P0trf/PDgJ21aBoucKl0AZ5D1jLjpK8pqjHAI3RuwN3LYnjGj+NyZSL
   OBhKAU5jW+FDhMhwenfhJqLG2UM12UH+b9hcnbvHNWazTuHagPhZehB4S
   uIh/Am0CpRVDCIHW93AUiW+iy+MP6ZiZvnJ8nsG9//7HhP898jnl+owHk
   LKpUu30j+S1sOuclFqnPnOVG2Q9y/uvWUs38vVXVdDZ5UxNx//UrMyY46
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492067"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 23722280070;
        Fri, 16 Jul 2021 12:01:18 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 2/7] mfd: tqmx86: clear GPIO IRQ resource when no IRQ is set
Date:   Fri, 16 Jul 2021 12:00:48 +0200
Message-Id: <65f9787ebd6725e90fad9ea7f936ee0d5712da94.1626429286.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver was registering IRQ 0 when no IRQ was set. This leads to
warnings with newer kernels.

Clear the resource flags, so no resource is registered at all in this
case.

Fixes: 2f17dd34ffed ("mfd: tqmx86: IO controller with I2C, Wachdog and GPIO")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2: add Fixes line
v3: no changes

 drivers/mfd/tqmx86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index ddddf08b6a4c..732013f40e4e 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -209,6 +209,8 @@ static int tqmx86_probe(struct platform_device *pdev)
 
 		/* Assumes the IRQ resource is first. */
 		tqmx_gpio_resources[0].start = gpio_irq;
+	} else {
+		tqmx_gpio_resources[0].flags = 0;
 	}
 
 	ocores_platfom_data.clock_khz = tqmx86_board_id_to_clk_rate(board_id);
-- 
2.17.1

