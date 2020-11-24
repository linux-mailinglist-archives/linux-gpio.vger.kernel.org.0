Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB4A2C1CD3
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 05:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgKXEhf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 23:37:35 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:49765 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbgKXEhe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192654; x=1637728654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I9FRj9UJZUXbJ36h9NtK7sWhZkQHQ9GoiFFCz8CrFtg=;
  b=YKQQ3sNbq9KwRtzG/DWS4FQtY4PwHRTW/jjdVTBdjo8im6rJo8TzzLfY
   ckrQwJsQRj3JtlD6veSPriWc94488nBUR99BDKJFJgfZ4spJGMozuj96p
   keJvoX8F8cf2tcFvhrt35oN3iH+Zcjh6T0FYjI3lBdu8iWjZp0GX0RqMl
   MUsSEWvcinlnZlJqLAOKtP2ZBpeQS7lcvkK+CPBe40np5WzQJ4X8soK67
   K7iV1DoYHgPlYuVGFU9mEZ4iqi2+w+DSHv9Ck6gO7noQbdVUkahNSjc7q
   nEZL0yQBz6wCD1wUnBZtl7tAeDwDfs3yKOWOO0JyN5Od1NlcDjD11AWwm
   A==;
IronPort-SDR: wuYgUM8eChUiweUcGg1CJ6pOog6fIOMI7caH+CcgT4kOwF83E+8b8lHglfsH4bz0fIHs+5j7tX
 MDi6Ko4JvP6g/X2L8QPHIKVM3JYtZNkSuEnf2nnOmsSEgQfsPSg5b4dR7Tsg1tSDyGyGLJ8BvY
 T20Dyj5bra1RMhFtwJov+3uP2dggjB1jwikPlTPWgSIR+Jlq/ap3V4wXBDyb/rZNN1vOAY5b/z
 D5M/YbJl3ast4qxm0JlquIRGomhW7bWqOW3IbUjDP3VVtZZJ+hAMFiLXeDXiP4PAGKyHgQXNbG
 JSU=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498149"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:34 +0800
IronPort-SDR: v3A0SiDwEZIHkhToglL8USzHQOZOJ1ojRQOAJ4AA8ikm/dA9wUulIUE9DkyrNH7/3gsmNFytF9
 1sTfUoZ3e8PQPWqHRZnCZuFWkkpVTfgFQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:17 -0800
IronPort-SDR: 0crCT+yJ371+gYzb2Mk1eOSYv19iS6VK06GKdG/n5pPXxtKSo5m/+hJsQrj0KSVAPd/ZlwwzTL
 VrtM/3jBOwLg==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:31 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 01/21] riscv: Fix kernel time_init()
Date:   Tue, 24 Nov 2020 13:37:08 +0900
Message-Id: <20201124043728.199852-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
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

