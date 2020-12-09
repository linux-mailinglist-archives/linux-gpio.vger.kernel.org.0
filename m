Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD812D3A9D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbgLIFgn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:36:43 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:15280 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727475AbgLIFgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607492202; x=1639028202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EAsgY70FjzgQvwdP24wPIY3ZkM4SKpRDXaMvRy+2s84=;
  b=EmEX5As2B0bscdOFLwszCt/iVV01o9tIhhvni6tVApwjg8byNULy6Lvr
   beH04scaKapX3QPcTzZXRIIMcG9HVfHfQAZQr2FGrdExqddbZr0wPMkXO
   XShjZY5mKjAACaJPmdryawJTKwdZheVhe3RpQ0ZnotRV8jcOW7DiCY4nG
   UDvPtBPQK4ZuopgMb5qwIYGu7gMBh41Cpjyr5SZ+NxrFKEdlaO5///mEl
   ZHwlQsd9GiDgVWJFETOrK30R6u2jM+dWfn55UJYOhNITCOSOPfcMAmxUw
   SlgGbPqtIn65KV+HmVBZP1lIRZs0Op+xd2Zu58A4VArdYTEiNBt0U38Ai
   Q==;
IronPort-SDR: ZE7pdEaUVB3uWK+HWrJ8QeG9ZXUrZdfpnZfhkskoia4dVzRPJj/3H/M0r7d6qAesYhvjxKXeKm
 MkwwWaRth25vACcN4xWYKqB6XL+ezBsKlFDDk7MgmEHVaix93iZlWPPZHop3UlIebgvhvar7aZ
 gBl+M66OLhwHA3s7CKNuvGU92RsN4rl8lU70djCCNw5XUDsaxZb8zap1RxnlSkknErXOcVYeg9
 Tly0/tnbT0yt9RTMN8VHV58GQuOEmDMp8a5tLMnqqPxv+tbkXqmx49m3DofCg1BMIoLd0HI6tF
 7Os=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="154735877"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:35:13 +0800
IronPort-SDR: Zs+6jRV7JXj5FjQoPePRVRQDYoJ4RY9Fgc5pPrijGX0boXv1tC7gHHXFRiMQKVLHjK7cEpjJUd
 jI3VjmDbkRvaGEZt3lb7FaMBOovoSZpV0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 21:20:39 -0800
IronPort-SDR: 4uVy4+tmfwhiyOcJGoLJ2t844A1lXmKlNHQYogYXcY0+htmUicyDEHGhihOFKRXtUX72PQt70q
 Ng//O7QT68IQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:11 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v6 01/22] riscv: Fix kernel time_init()
Date:   Wed,  9 Dec 2020 14:34:45 +0900
Message-Id: <20201209053506.122582-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If of_clk_init() is not called in time_init(), clock providers defined
in the system device tree are not initialized, resulting in failures for
other devices to initialize due to missing clocks.
Similarly to other architectures and to the default kernel time_init()
implementation, call of_clk_init() before executing timer_probe() in
time_init().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/riscv/kernel/time.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 4d3a1048ad8b..8a5cf99c0776 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/of_clk.h>
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <asm/sbi.h>
@@ -24,6 +25,8 @@ void __init time_init(void)
 	riscv_timebase = prop;
 
 	lpj_fine = riscv_timebase / HZ;
+
+	of_clk_init(NULL);
 	timer_probe();
 }
 
-- 
2.28.0

