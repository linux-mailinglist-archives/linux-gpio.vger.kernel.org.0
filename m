Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6596D42F219
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 15:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239407AbhJON1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 09:27:25 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34023 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239400AbhJON1Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 09:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634304318; x=1665840318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ztoqgqQaf0S6laz4BagIDcZq+SkBeBXQipu6xdcNRDM=;
  b=L/k3dWoGED277KhLJZOrvpUkbJJ4JCpk1q+i9OLvBiH3vCP78i0cL/Ii
   Lj6zzKJbpzCqudT8cs6eZ3wfimtKfzJtjTETivwyq1HW9FJyas0NSDTN7
   wgapWwp6Xgivbl9XDgDI3hZG+FqMfcghswnNP+GMoypjuoBOWdKFwP37I
   Rt8xdIM/l2saYqVtgcUXajvYyZBVvOhgegQ7YpYZIV4bi3I2WBqqx1HFJ
   h1oeZAy/LdVU35lg/4lJpFRDM1UsxC8HwNRwykWumdX+IpHixFz7Y1VfW
   6sz2A3Rw+Tqtvn4y+fp7sA8w0fprXEk2dmZko7gTPmSuawm4iihm9YsTa
   w==;
IronPort-SDR: 6jy7qIJYIv4MHZN6f7DhDOJLfn8aniG64iZCZJ4S0Y9ZNI3L3MYyqZJ14RlvYit/y6HCIvnLqH
 TH7w7jKG+qEl626uB24XkkL89sqzX7JdxLNVqpfC3iSAybbkSqVy+wCGzME4Nftmsb71CNysVh
 YX4LAYbuwyG16fl3R4NxL0CN1XjTE01E9tphd0W5KZn5cS+1vWkW3MhPf7T89CoqitYek4s0t7
 ReavjlwEvSd7YGbEyLIn+lMU/84sDGefrGt3wZwTdnTrUnwSoeJTE+31UuD/k6xNcnTP2CUzcS
 Qyt2vmMWTc0tSqHPNoiOj74/
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="73075277"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2021 06:25:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 06:25:17 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 06:25:15 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v4 2/2] pinctrl: microchip sgpio: use reset driver
Date:   Fri, 15 Oct 2021 15:25:26 +0200
Message-ID: <20211015132526.200816-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015132526.200816-1-horatiu.vultur@microchip.com>
References: <20211015132526.200816-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On lan966x platform when the switch gets reseted then also the sgpio
gets reseted. The fix for this is to extend also the sgpio driver to
call the reset driver which will be reseted only once by the first
driver that is probed.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 072bccdea2a5..23f5a744edc4 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -803,6 +804,7 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 	int div_clock = 0, ret, port, i, nbanks;
 	struct device *dev = &pdev->dev;
 	struct fwnode_handle *fwnode;
+	struct reset_control *reset;
 	struct sgpio_priv *priv;
 	struct clk *clk;
 	u32 val;
@@ -813,6 +815,9 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 
 	priv->dev = dev;
 
+	reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	reset_control_reset(reset);
+
 	clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
-- 
2.33.0

