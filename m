Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10B02D8C20
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 09:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391442AbgLMILb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 03:11:31 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32107 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731962AbgLMILb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 03:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607847090; x=1639383090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AeXALpcFI2zXhzG/wZi1dKZAPJWbKG/DcS+NIXfB8/U=;
  b=g/jGpvqmN6T45mtxb5e+EOxszD3cvtf/JNm6Bb7fUzdIxagptmZDM3sA
   lYBowViTfQvZWJb1m0kKDjO4190PrMy4YuTxrX4ko2TSB+oVxksU39dCj
   2FgvbtKGuUg5g8To+z1LfeUw3GNhHlCgX/6dL5EjV4k/EkjV+YrzznKCL
   0NRMWe2axGNUWucg53dO5PTVKyJf+03A14BsnlxiWdwQ69Vumms9WlzpH
   acNNId93CkddCv6B6NhH9MJRV8NgZAU+c/6nA3DF5FIsyuZgvSvm1GWyE
   Ct7AXXoZ6CF/ZntAFdB6/85/M8R2Tsm9Ys0ZOlzf6ZdvA3EMKRGK4x+8q
   A==;
IronPort-SDR: RnkWiJo5xK1rl0Lur50uCPQe+EuMCwkquVI9sZ+HEBDMEJSRtYEtv1k/XaMmkDxmYX775s4GJQ
 vm+PVw/48mxbBMOI4vX+MS3JPKS8bPnVlf5NwSYJi1HvyGXH/ZbyrAxb51Uy5auOiLe6T0/kGN
 YJTJl+2MnYiMxcB0r/0QxZoBUwBn8WG3TuZgTcBaoIlqGoqEtwAE1RP4a3WH9RoEJjuB4sAziU
 RcWgvPdJeYRqzYe8axCn9W02pFaz8wZSyDnliqdLYWZfanWIOxdQJUgPXDrEPgBcRTC83fq5mh
 aNI=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; 
   d="scan'208";a="265208161"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:25 +0800
IronPort-SDR: RQ0i3ilqOcLgthAGFNNpV2KZte0rJrzTY0zOPVtgsJ+FTazaAPVXYrER35Rl2ZQYkeLT5Xk+La
 ASJDi48KyznOFVVgRS1q1YagFjurcny8thVDwIYRQA0eb84T4NGTEBHLKbyBh8fHsbkvVSs47M
 MklwdF2tBEWcd1V/dfQ/lHobFM6yKCYvijbBrMuuwZVKPDieamyaG/RYRYwke+S2Jq/WrMvm9u
 SPxHM2deJ8Uo3sIFdSHLFQItVFoc+pEQFQ+CdTkhoKL38ylHeqhG+aPG3fD3Hh+lBVs4KEwrnt
 UAGXi2BY+Q0myd6sFYxkboE6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 23:55:46 -0800
IronPort-SDR: wEKjSUXxUeuWWffbNyplSQMPzKvNIVkiXiYpz7jctDt7DMQH8StyK7A1Jp8QcEBGqe1u1i33Ak
 4wrRdUN0HuVmFki8qmY0HWFRXBl8LdHxZ1+g2G06aYBbqmUN2QeRVaMCtjZenshm8pgTsKz/gq
 qYDxfYbuFP8HMLJOWG1qem1eDHt/h4zzn4ZPuVn1WS/rpxHgWaYByA1HKILr9SZMY6gnxuibvH
 RezyDUq5pwKEymYwWhzEM2+iyupcSBesu29nFb7Y6zX1UZBKaXFhiZTLKSW+xej/z887Er9chC
 Dkk=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:24 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v9 02/22] riscv: Fix sifive serial driver
Date:   Sun, 13 Dec 2020 17:09:56 +0900
Message-Id: <20201213081016.179192-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
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
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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

