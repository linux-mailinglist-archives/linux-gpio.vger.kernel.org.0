Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E978A2D5CC5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389835AbgLJOE3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:04:29 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5149 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389841AbgLJOE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607609066; x=1639145066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a9lIXSkXmm1JjHCFgZUF+EI1D5ZXZRRfkRqwz5LKPsE=;
  b=qtG+kOR7CX+sciK66noFPKxwQ1YlJLyH+yLmaL2PBex70Vx/Sc3xE9NU
   ze1YxO0A4+nex5Qf+n4HikSkfTIDgcjk1iVDmTjLGRhUyQ14KiLnjt1/d
   EhLvZH2mQCcwqqpu6U+V7cZmicg+cjDpdxO24dSMt3y1eIilO4JGMnbeJ
   Rcei2dt6u8q9jaoIeQSB18Aea4Li0j4jSn6+oP7ZhwVREvP02DGX5pP4h
   k2ZK9qeDXOjSQtxrgCHBXgzAtMpoKjJAhPDF/FHOWjvkYrUK4oSWkVSv1
   KMOUxLlbqI/qxg/A/KwT173WPZ5bjQQ42Oq13A5oOgTMtEswGD2+isb2f
   A==;
IronPort-SDR: +wP6XV9kvFAwKT8TXPQYbmtIZuDil8W87bEb/Qgony9ioJlqe5lvguhUMjgImA/vK7zPxeVVFu
 an8lvK6dbahETPx4yehZw3j7Z/2uGZ1+0b8V8L5MvOp/mrXuXb4Z25VYy+vXd4gs2495sMs7Xv
 J9p/iriR+KCVytxyFX8Rw0cdFipnRvezpAfbLoydxld/J+uRZ7HL++uFc6+BQEYLwd0zNjNzX0
 4Z4P6XmGRKxqz07HRTb5bDDEa6+j3rDPGfBbM0vAhFqlL0H/RzkE5PjfXtpGS6p78yFNj2K6ib
 weU=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="159316683"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:03:20 +0800
IronPort-SDR: uVr5c+/+OUd+ObU2tOdE3mgQ1mMjtpV0Fw0mKy8RHapbuoWqKBbjMkAJWeS3KmgZGodX/F3api
 fXqFmfWn2WIpQ/bX96lMfV3J4nIzN9IgQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:47:12 -0800
IronPort-SDR: AYIs6fKaxtHsLAssBV6+qL+slKYEegOBU1Hy83epkwHh6hmSUUPiHJC1HWDsM5dVzAgNS4OPZx
 pq90cn8uQTcw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:19 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v8 01/22] riscv: Fix kernel time_init()
Date:   Thu, 10 Dec 2020 23:02:52 +0900
Message-Id: <20201210140313.258739-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
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
2.29.2

