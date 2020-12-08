Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9522D2475
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgLHHff (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:35:35 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58688 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgLHHfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607412934; x=1638948934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
  b=bbe2XwF85QEgK+L/FJjcooopgwDxmPR0GzvhxH7gqRL7ZSShqyrRqEX8
   /+c7dccRjrk3N1Odm4CHFywY9qoZ95T0q6QZT4A9mbb0WHh4RwLkarPo0
   bL//4C3lZo5jzhx6yQVgFlhCd1H30EHo7rrcaO9Iu22gdZGQYruH89LLR
   3IGDCFE2bt5NjmOKcn0jyQFA5sF1D2dBfuiUbzXwwNANZzJGBAfcXeMNS
   I/XoEh9AU0WAWnWScuZxxNmIXH5m/G8bzegLNQuMzb+oVECqlldrvqZxE
   brAgva4Jzsm/gRI1w47VfQ5cb2LDq0c6/vHtv7dfOezej7jpDtEV/FBph
   g==;
IronPort-SDR: a07DSxolWud7AOXfQYdroct8RVT7wuQe4ivs9HoWuiZLHOwcwOCduCD+whiGMmc8RlXShFvVx2
 DirmIMPf2v5XzE/Jz4A8u4+3wtupP8czTpeJeVOh8qB2HeC2pW4dI5gZ/QnrSYu0I3crydpC+6
 hxr17o5tKDLsl7UaO9LA9OhlZrpERGjyeE/CA1aNg93SoFSWWbo/TWblhkEcAmOKbz7xJFAl0t
 s82bQRogkYk5Y3rthuJFRVPVDrOzE3Sd2XRFqG2MXyPUlcz4wT6mlYjdSxC5uRMYd3hwOo1ZF9
 He4=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876627"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:05 +0800
IronPort-SDR: d5XhX/Dla9lEp1dAGG1Y3BLq+nar/y42tbH/XutA+aVS1WSCQPql0tt6Tmk4mzYh7I6gFjGSw6
 /GNEtqTzt/jOpiZZCCf2NJITYJmy/RrY4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:05 -0800
IronPort-SDR: tfRYJrKm89mRd2QjHO/mOmexsW7M0LEZHE5kTlIbGsdDzjkchyCeZWx/YgHIYXFKPepbarIsUz
 KMMkLGiPeYxA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:03 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 02/21] riscv: Fix sifive serial driver
Date:   Tue,  8 Dec 2020 16:33:36 +0900
Message-Id: <20201208073355.40828-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
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

