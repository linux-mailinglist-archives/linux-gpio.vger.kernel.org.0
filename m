Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1562C930D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387457AbgK3XuJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:50:09 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7901 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgK3XuJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606780615; x=1638316615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
  b=PgeFyySAtEgReTsBuIPUDF69/VfA1+IloR3Q3aJ2Za7YMy7FKNM9i6qI
   kpaHmIWYvyWeF2Poh1e91Yw7kv5Yn3y6EhoeVZcQYF2toBBRcYzkmCQiB
   bAkzLhrNLSA+diiiVgOxFbqBbQwPHDij0VAo4ulx5ARkfXKcBwlRZ0RaF
   XiQjzOmLW3yMn+vLWPQhtbEh8gpPyBK2t1celWQGjdiQiDC874LL3hznD
   tndh7VJp6628nfnrwKgKzxP/r1IeS1q05+HUd+vwZ+3uPJIGvrRxAWWTr
   D2qPKadUUhLhYyvrP/oazb3nBROfO1yJgRtxiO3dOF01r67izAUwb0NKe
   w==;
IronPort-SDR: FoGIgIWzgI5FSggKLijvj3fCi+D+b0AWrQsSyvlhASLKyG0hEJuwRm2LbyiesrU4w5oDFqwOhu
 iCcy5Dje1NCt4WlFKDHGNJblm+hDySIjCuMZfE+Er+0mO0Sm5yZ+gIpLTCE19N1OlB/T3Gfq/q
 M6YeqkhS1hacI/qWL2CYrU/9D7qeFBZmzR6IW2+Z9Ps98LutOLitSLJXVqTmHzy4WE/akBvrha
 0GgoQmha+a3iamgJyq2hR2njX157h5tQAgtBWsvESWd0bliv0qq25+01HDCwyIefMQmrpPEjY/
 MGM=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="257538290"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:54:39 +0800
IronPort-SDR: dByqXgyzLt7OQMXwmaUmC0C5j4lhddyoosdAnEqbHDoixiLOArVP7pZ3XljhavBbms23fRh/+V
 eTHcddcSXPUh2ZbbCn9Dn1I8SzfljXOVs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 15:32:52 -0800
IronPort-SDR: hvlVHOz/0iZEszrhwcyWuIEJSllGkMd+V3vEMq+WXKp89gnOJeJho2LaYZJzaROy55xSqC/Skl
 V4t6JqLqXw9g==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:37 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v3 02/21] riscv: Fix sifive serial driver
Date:   Tue,  1 Dec 2020 08:48:10 +0900
Message-Id: <20201130234829.118298-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
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

