Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43F72C1CD5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 05:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbgKXEhg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 23:37:36 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:49765 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbgKXEhg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192656; x=1637728656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
  b=iVzlIGxE3gGCCct84m/tOu/PE9WbbLEWTobfUn1YUXxU505iyZAZZlzh
   MVmSGkzoOHT2LL55sCkAFXK8glr+9f0KZ9w8Ef/6L/H4And0TyN9hVQ7K
   q61kNGVGDPIWh7UdOVnluVr5B2LQES8xAffE8qZc9RIE7IJle5yoRtiII
   v+fuXsWaojxIszSesgOcWeNCut/EMIbF6yytDUK2qug0yjwsmvCGs9oAS
   v11kvxPBzejVfvzew0eULsDJdDokvlWOt+Vs5wEuWrr/L8cQF8D0NwiMI
   C0sCR2TdBr8xJeerc6WgsmDK+uCwwiaPvBIigwu7+wjns3fY7r4sP+3C9
   Q==;
IronPort-SDR: 7QYis11VcM2gtszg8zb4CqnmATpBEItulzcJr90VpBcWmTbtT3UpgPhNcovibqSlhQ0f/V+cvr
 XAuD8b30bzAtBW2u1Xj9hiFk8Fuvsp88YQo/BtaJd5hohI4Yt/8D1QimFxovOsOnnXazmsnEaz
 AouSmDUfx8ZM5CNTW8npxE3TveIwqj2hCLM7JkqD3jcf8aX7wQQIeBgDmD72wqxlHIzR0ldDYa
 NYWOouY4s6Yis12GIyCagkGtJySYJ1EYrYwzBQ2gdc2o6gF8aBAk+lSVhIfLqt64SA1NESTSOg
 tf8=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498151"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:36 +0800
IronPort-SDR: jaKIiJX3/+QWbq326kdJec9b8J8oo26cvbV1Wf7PKTM+xvS1wCVZFg+jK+ALmIV89zt0RAa7Te
 ZXgcSzVDfuvlaie9DKa0tBlZ9GQcUaU/A=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:19 -0800
IronPort-SDR: 5mthMKwGuxuDh6aVUWhJyePDMo4o4xfFoEKtf+jrB75v3fZ5wZFNkyVrWe4TljFiJKs3lAeCXj
 nj0fFfzhElLQ==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:33 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 02/21] riscv: Fix sifive serial driver
Date:   Tue, 24 Nov 2020 13:37:09 +0900
Message-Id: <20201124043728.199852-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Setup the port uartclk in sifive_serial_probe() so that the base baud
rate is correctly printed during device probe instead of always showing
"0".  I.e. the probe message is changed from

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 0) is a SiFive UART v0

to the correct:

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 115200) is a SiFive UART v0

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/tty/serial/sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 13eadcb8aec4..214bf3086c68 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -999,6 +999,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	/* Set up clock divider */
 	ssp->clkin_rate = clk_get_rate(ssp->clk);
 	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
+	ssp->port.uartclk = ssp->baud_rate * 16;
 	__ssp_update_div(ssp);
 
 	platform_set_drvdata(pdev, ssp);
-- 
2.28.0

