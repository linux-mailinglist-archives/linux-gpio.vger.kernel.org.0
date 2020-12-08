Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F332D2470
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgLHHfd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:35:33 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58686 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727293AbgLHHfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607412932; x=1638948932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EAsgY70FjzgQvwdP24wPIY3ZkM4SKpRDXaMvRy+2s84=;
  b=HENAHxkuZXJROuadXA63NndZVLhrqFuTUfuKm0XaX9fv/nh5IbCr8xIM
   8Ae58OHfSSjrPm0xMejcTNTzBeuWQ4aPLKExZa3p0+U3HdJLJQgYg1at5
   +dgdR3owcLCk7xgDlD82QrnhbkI7LPnfAhhrvAnet6S0EV+KOWTvVIj8o
   3znXApZtbdF+ARVZKkQQv4c16HRbNvpV4J+DSH7w/GFTEdPZmakxtHlqI
   1lRxz5bUkFJESqeH8e0r8rnpshZ4Dp4hIfNT+VFJcDdQhQ/PKqM281ipT
   9iJsX0T+AZDP/So2ZJSIynVjXMvoA26gXbLX4G+3ar9095aMiIB/JURUj
   g==;
IronPort-SDR: uSSM7HM+p4pSeYECfsJJif/LVcjI3WY58hm3WgT4KP16fZfJ875DAAn5qnOxLqEH+YorOH3fHf
 0N8WLiqKA0Xbj1uVqpBBsDPLiNWTyiTKfv5yiRS8AjmJUrRavZU3gwbJq0ThlYLfS8iQhchwV/
 IVdh38sQYwRFnCpe6Xy79Ra/OaMLWPc2kDGPync09S5LNeS466HFZFd1WxRqgfROlI3E36dC1T
 F8TXQAezJUAyqN2W+T60i/e4jEh2a1jwpMee4Q3gQQM5g5TG3j1w9r5upMNNEBuDeK1dYbJyaZ
 91M=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876623"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:02 +0800
IronPort-SDR: yHJVT5Xj9iXQ0vtvy91rIzmvJn2HSzntDCEShL1LUFs9PmoxI217Z73nTuZh7uVMQ0BSHXoG/N
 F7cLaNVZqnMCg2ubpcis4R3eo6BW2Yv4o=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:03 -0800
IronPort-SDR: eWr/RwVIt5JY/4HEWKoubTNTXERr7r9JzXM5dmkLUZPAD9BYIEygiQIGC42pccotnhRthnIvFZ
 brgkVJfctjvQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:01 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 01/21] riscv: Fix kernel time_init()
Date:   Tue,  8 Dec 2020 16:33:35 +0900
Message-Id: <20201208073355.40828-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
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

