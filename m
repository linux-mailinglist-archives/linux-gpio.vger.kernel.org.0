Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C0E2C930B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgK3XuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:50:07 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7900 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgK3XuH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606780612; x=1638316612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I9FRj9UJZUXbJ36h9NtK7sWhZkQHQ9GoiFFCz8CrFtg=;
  b=kBzqQhnu4pk320FZpAYAGrlhALtbwkXK/9yrEPTngJOM5x1/SFERD5xc
   8AqecGgJObxuLkvInx3FUWpyLj+QsXeIpCigahqszs0PHVDBs8FNNyD3P
   Wx5O2cj3Ie/0xufMV9bkkVYtSdPmeY53Y9OOftDyZ9ftoxlv4S2SujE8L
   IbdjbDnHgnWJgBiZ1BdeLBwgFJWApbpqm1E1eTZf7hAbhMdbjYwcPIDSc
   KmGQs/upbZEr5+KWcVNmqIKrlLzPfZHNePfZ7oMloVcInAuzJF1rmNG6p
   kcn3nM/S9SmQ4/XR8PnUhL9ucriP5qgf3RQhIFo6t5tpYlOL2pbBAzyI5
   Q==;
IronPort-SDR: EaU0puhiEfsL4ruKJo4NqJjk+lpG9mQdTBNI2A8zz9mV4gFgiyLGMaSYD89uikl6j9EbI6bXVH
 Q0RuhBmLVundBKakqoQXb00k31mqAP4nQhuHKBWb8ofAhBofYzQwv9zr4/4BLHxUF/y/9Fx7Mp
 hkhhoWd/s8cTMCa+FqPH7YQClaPGBocwVjEQKs6jF/5YJsvW/4jxf0BIOBW2yMOsh1d5W6JkrH
 OyuCAsReAd2Wj+9PyzSBbee2SzDv+18ap5mUjleOw3+y0sjqLI44PzPuupiTYUCxgamV7jadts
 pbo=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="257538288"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:54:36 +0800
IronPort-SDR: V5VG+07o/dNMpwFHRZda66/W4yfVl12YPFce9nux3EC+t0hJt5jnYEkvzcn50C+BzAq5cp4FAk
 1bqEtepSwmiKeXn0cfMy2EqEtw8/qynoE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 15:32:50 -0800
IronPort-SDR: +ptkU0/Y8NRXbHNRrzVT9Xa4Y3qmDOAY91yo5bnhnR6tzgrfDf6fVym+qn6N4XM/f/sG9pGyXP
 5wnhHyjWa4Ow==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:35 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v3 01/21] riscv: Fix kernel time_init()
Date:   Tue,  1 Dec 2020 08:48:09 +0900
Message-Id: <20201130234829.118298-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
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

