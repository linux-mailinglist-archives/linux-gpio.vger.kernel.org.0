Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964FF2CB349
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 04:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgLBD0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 22:26:40 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:25514 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgLBD0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 22:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606879599; x=1638415599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
  b=kWQ3ayIh/eFmDDvBoZdHfbUMx9Tg5jxN3taRK9eFdu44URz9mZ9yPPVN
   BmPutAZrs0H1Jt8gi2fShUNxpWyKKRYQ7Prj5lWckB1J7kqsgPfdZl84p
   pbDjJTHs4Lm217pYOH62AEvKPjtoLC9otlKbCTPWF+x7PoVpU6f6DtxF8
   /Xtzh0YfqusE7sMsA0l/INrtqX6EKPoGMR8GBW1z3wYdi5n/jvJfhhufL
   cQWcgIQsF2oMz9Q997dsbeEhGdsmRCID6HE75oXPnVvI1uucypvCQ4BSZ
   HxGg4hVcmsQvVCfZOXc64r/ZdWsiLJtKs0fqDc6gJvQVM5w38EQWUcPEX
   g==;
IronPort-SDR: 0YKN10/s4bCty7iS5xOIOQU1Y+yICGq+aj8H/Qh0tYeEnZ7B3UIYbGkflMDKNKbHm7ZDSK7tv2
 zIAUTLZYJ8qDK47c1w8vcE9WGtYyKwL0n/sPWO2dBbdB9nOVbSc9Gi9NdfWwm1cKA4PE4VvGqB
 Y1BgCFvwdJc6gIKzjz7MR6+gcVSnWMXIq7ya2KtvWwVT3W+2g2FiMZBiq5FwaYXVuLBHnrdw6v
 koAuv6h0i+1eVGjUoB0n3QP1UXKEqf35SDpyim5tWZ2UQXpMKEHfbwwiiPnbA6lbQcqfNMySZC
 WNQ=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; 
   d="scan'208";a="155183519"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:10 +0800
IronPort-SDR: hd/ThcLGbUzmHelBhdqnWibbX/TEtgXs6WHDP4EY9TycrzSetAJSu85gZFQ9vvhm8ue1AKKAy7
 fuidlRTHbBKPKVKh5RAmYAVraWsd9Yd4c=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 19:10:44 -0800
IronPort-SDR: I3OdHxgW/Xufe4ntS3IGjb42XrHqe7fTZCUvf9jnVp0cV0J/Ml8XfguuInQs0UVSdL3HyeINPn
 VQSmItbPyScA==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:08 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v4 02/21] riscv: Fix sifive serial driver
Date:   Wed,  2 Dec 2020 12:24:41 +0900
Message-Id: <20201202032500.206346-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
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

