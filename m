Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CFD2D519B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbgLJDlx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:41:53 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39156 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729808AbgLJDls (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607572418; x=1639108418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y2U65G64UeShjGJVOnYVAq9kfdKwB51xvYK09lHldEg=;
  b=DA8bAAY7XROlcSREzYM3WA0EZ0tQT4aR2rNvlDo7UxnMUgazM8kKP8yd
   6FZIsIMPYhf3YjXbRXvfP8oaGSefiwPFOtCwNl39dC3vZkfgH0U/HXNha
   muafbDVNk9cQmeG+UsQeAGkrIGg71BUvy4oOK+I/hjfCf6pd4lcmfaUH3
   AAfU72ZxJNZcesOksPDI5q1YlIyZF051C6E08rGPZQWru1/C+iGo7jbgm
   gY7iTv1wuk5CQztJm6EUhbEa8XJXG5PLrempyYBoDX+TdCjaMhrI3bpeu
   e+45Iskzo8GVu7hS3LtP/2vwmdOCSAL5+VoEBy6LW8s6fxuUdCGDyilTr
   g==;
IronPort-SDR: uUYU5dx4fgP5R/MvfF0lznD7S27n2cpICWB+XS1kTETTK+l8OT4dmBo7N+9MKU1HNCkMpaqmJr
 d8Cd/3wTqQ9gD6hsP7McdP362wRUyYT0tM4gYhq2oY96Vb7QvEj6T+OCOKmTsQ2xHhUj2ypSSJ
 PVM4a1i9d9g0t2mGxfTjuU39PYf883CfAOvXl8fXlVn1sSDHLnCegKIzwHYwrq3SUT8wgJgBWU
 W7OQEJodIeKGiG0EsGGev5EZInW0CGdsxILEpJMZeyphNcNyUbfxKHb0t7sGsCl53OeABDOk5/
 i3I=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; 
   d="scan'208";a="258551197"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:51:22 +0800
IronPort-SDR: Q9H4hdyPjKVAPlz/4JvB7OG7VCeIMS9PhVkfEst3+Nqy+N96ppzEoqaZLTFvTyEV2E97pktq18
 M41Y3AHrbvNrpeqnKAT6Y9Xow5U4EuVFo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 19:24:13 -0800
IronPort-SDR: XxOPwkiQzXQt2vNqM9234LBWN3pWe2e5lq0AG9XMnlSwKVWdN0LOK2v3aC+jzH7/9NGYbvct7e
 /0v0UqUcg3uQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:15 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v7 02/22] riscv: Fix sifive serial driver
Date:   Thu, 10 Dec 2020 12:39:43 +0900
Message-Id: <20201210034003.222297-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
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
2.29.2

