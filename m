Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767C12D3AB2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgLIFgq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:36:46 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:15290 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727475AbgLIFgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607492204; x=1639028204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
  b=h1X8M06RL527dRmdGeI57gTs3obF3j9273t8pBsAZfhXzDOQpGVYNb9M
   vGDtxJWe1O9Q9DjUk38506AWg8BAzL60XjeCq/dz+fdTnUXg/uhjbaijQ
   LuZ0Z5C//r0FJa823VeTdSYkjDQLwBzX6MYZZyx2x1n0jbUhfRFHNoSIs
   r+I16h6fiFTITZGJkMQY5L72H/hz3L/9wEuNUGql04Re2BO7CBO4jcj0X
   CWzbkbzFYQCMZ2js/I5RmKJGV2TU2xkhFAE+rp88yMr6ENuAiILwPxN34
   sjsYeRsIaBHOgstuBQQL1q4PleXNnTaS5W9V/xkebhIYzGJsCo/3sPW2Z
   Q==;
IronPort-SDR: iOnUIzhtCFnWhxaTYQ3+7709PKT5qk13LizUTAXB3Q8+wUzvVTQFm3V1qtb+KPjPSQcdMm3P/G
 5UmFlRq2efbBGVLarNUBtnfPSAIU7ZnsWdhrUACMapBkeSnoKWd3FSxjZ2u2y+vXJ+GqS8Eh1f
 /ZaLvrtqt4KQMkxDgM7eQQ8xmT+2iIE7v5qTAxqOrljFsXL+lkgmic3QwdlY1pS9kBctPvdFUq
 uAtI/kubgPwPg7SPxgvivc+nRFzC3/xkRF/YO+X5GeO4hqnbfuwzZml3j91f1HuYvU6AZV5lq8
 crA=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="154735879"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:35:15 +0800
IronPort-SDR: toM2LW7PW64K1YDzYaXO+lBX/29Zev+M41WC9GxAcY8isX/5mtfxlNHaNeIt6JoWTcU1kl68Mw
 0fkP2eW0LFq1aJXQmHlPwNoQFSLqKkfGw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 21:20:41 -0800
IronPort-SDR: 15cYU6A2oRjFuy3GCprP+FCHXABwML/5n5KQefjjThFxQaJZQ2FX23SertLS+fiBV6pV1g4ASx
 iu4r2H31itWw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:13 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v6 02/22] riscv: Fix sifive serial driver
Date:   Wed,  9 Dec 2020 14:34:46 +0900
Message-Id: <20201209053506.122582-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
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

