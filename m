Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D68C2D8C1D
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 09:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731759AbgLMIL3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 03:11:29 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32105 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731962AbgLMIL3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 03:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607847088; x=1639383088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0B+kwvrbaYpEs4CIb2Eoho1O+FgaDjaWqzP4OVlKPRk=;
  b=Tu54g1QRHNMGXqRDmud6lacAEvL41MSbt20qGWEy7PiLljcNAkXEoxmi
   kC0anfi76X0Ng8PNIBuKwGn1XXmGALa7e18FxCHkqweqBPW/N+tJqKefO
   AkFNXJ+2qv8RTMVvwqEFGzuENXaeA8Z/jAC19k0VdRCHp1RJ+Vmlm0P3F
   GULbug5RZB8YBxcQeaevjqikyWdkXzh3u0n8uzX2Bq6uyGHMQCCGWZdWZ
   JX+0zGngvs3MxnfpokxN2LI9zgzJuVSbSdAZ6cvkA6znhHSSWwZu4/m3l
   VB603JMvnWDydSoxOpYk5wsH7bjk48+g0KpEqYCnnjJiA4KxGirtDyPlO
   Q==;
IronPort-SDR: /+ilvE3VcN2yuHkeVQ4pMYB7QgyNAwOO7OyfiGXBbUwa7ir6FPu0ROd6AdrELlGi81V6TpEcx5
 M7k5LRN/Q/vTrDPcokxpfmNyxUhCruBgX85o4U+wmAnvtaKXXSwDzp+5DOBCaxbvbAewQV2Wrh
 MFypGFj9wrkbG/WNF2m1lFGDC/27UZh5rtrDBPs4Nb4QUDRKbHvgmZ8o826pfCxZ5jQkfvQTID
 mIWgIsdoGQ5LaMp9XYOIS3048bgYANML/fHVz1dDiPJBwBWhrhAMrmsEIEBnFyBJYl6C/NbgOf
 kX4=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; 
   d="scan'208";a="265208158"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:23 +0800
IronPort-SDR: FSF0LuIhe1N5Catz0jrmu/GUpaM7D96dKpYMFf0D0+4Srfw1OzbdSb6Qu+ByDtVOM5DLt6nQOV
 EOqwp6iWcFh16aJQOigkjn9RligGFd6KO0kWxwBxYynIcg9ooKwtsGUBZJ00+nHvlIBgV5at/y
 zQjv55T+dwjeUaUG7Miyq5QzO0DHf5FsRBjbXjp9dkXJQmecbAR+7UbjG7/PPlaxTCaV8eohqB
 iNcIZZdVJ958uBtvd8mkndbiwy5eAeDTzDnyO7RX//5vStlGWkp5fVEj6ZoMMlBXyCHDT+YR9F
 Z/K07tTLlT7GfUzMqIAL0Hu4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 23:55:44 -0800
IronPort-SDR: phBnnk65PusQ0bwYwHH9+1T1Su+s67k2QsMgEdULSzGcS46Ubk65GjC09S0GUpan0PLhM98qJX
 Mw2y6BJaw40FRuEobVcLRYyZvvur6PgWZM5VVenS9u4OpZ4p7VP0KUjDRaCF/TBj+tAGHwROda
 qGoBbM97pDs6xBuDvmqD37xB5vGO5pDnvyzQneI4beRCy+fO7OphgI3dh6Pc2OQWgG3AFve1r2
 zggTnck7PY15M/teoEl6cQC9tJYVcDpPRlGjIhzZlF1CDUVl7RYIRtDN085aJOtKRy9saaru2o
 xRc=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:22 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v9 01/22] riscv: Fix kernel time_init()
Date:   Sun, 13 Dec 2020 17:09:55 +0900
Message-Id: <20201213081016.179192-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
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
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
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

