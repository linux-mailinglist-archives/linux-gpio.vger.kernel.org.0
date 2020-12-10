Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DCA2D5CC4
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389873AbgLJOE3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:04:29 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5152 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389162AbgLJOE2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607609068; x=1639145068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y2U65G64UeShjGJVOnYVAq9kfdKwB51xvYK09lHldEg=;
  b=NxtUUVTE67MVpzljzc3tgRsoXq3PDf+n12ojeUK2amBIphoER+KiegYd
   ZUejpsUc44zDJea1aoPIul2oDWBnhG0N8SZOjRRn7TIICZDUrOSZQtBtd
   VF9qJcrR1CORgkdYhFGdflQVOYK7hBFdDxaDDt9/ZaQqEwwy+OH4I/2Rj
   noIjZZIalprzH861QXUKHdZqnGq3tSydfZ7YXTC1jIHA400jCEEbH0ZVv
   CEBPLEy4+3mzAUZNy4cCD3m/wvggHyASCaqfbfYzgqXxfVTXZOniHrRLO
   meRlktB5lnKtXQTgPzCen6DDVKlYLcw32STefneTr0yyenGZV0O/9V/M/
   A==;
IronPort-SDR: E27lcFLhuz8YWSck2XE+VskV9QRD8yRZihxJLUwvUymT8SmNuYoItSSrPEAbK3Rv2iATbrwmAf
 i1StP92uEJOVVn9p0Z8QlqalykZwyrlsWy94hh3kp/VB/HEj/1Ll6yY87KR/hO06XfOR5HImf+
 MADa4809X70sEFrk4CXAGRIByz3wgrkssC78DBp3HUs5PR0B6WgZB9bmlPaS0oMa0nD8XagaEu
 TpiozqP7lyUFmIOnbs/FdiGM109K9YVq5G1vmwA7FjUxDvGbtOcaHEAt1H4CKaY+vKsMc79C8E
 YCI=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="159316687"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:03:22 +0800
IronPort-SDR: M1jKLDzhQALXLBBWTn1U3FBVPktqlqgFZM0dVeVxwjfrSI3JGOg+T4KmrVOuGjt4w5E/k6vnlv
 Wyg3qPEBDk2uKzJ6K0Omn6Qp0GwrPPz0E=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:47:14 -0800
IronPort-SDR: 3KOYBEqWDjPYS5ulc0RGyfISjQ9CYfVrRXXiXGVJHAw2GqQkAugmAXJu4WfLgIZgsT3p+pOtki
 mDXwzJ1AcNGg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:21 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v8 02/22] riscv: Fix sifive serial driver
Date:   Thu, 10 Dec 2020 23:02:53 +0900
Message-Id: <20201210140313.258739-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
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

