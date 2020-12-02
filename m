Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4D72CB344
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 04:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgLBD0h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 22:26:37 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:25510 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgLBD0h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 22:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606879597; x=1638415597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I9FRj9UJZUXbJ36h9NtK7sWhZkQHQ9GoiFFCz8CrFtg=;
  b=GqBGfoh7YMF7hXM2P/LXaCIz6XGFqRcraU5a+mSwEmaVvkrzykLuF1ZR
   DFuv3A+hZpZ/aQVigdxqYzocmWhFGXi2stZk8mTkXvd8Sc8wQpKqtV2KM
   iQoJp628f9Dnm3EobokQ3Wyu4TCR4fZjrooNZUmhKGJA3ky+1WgaEC2gK
   KLaSgpVTrHIv3nDl49na9fBZomWtrw0q50xIvlqvPCmfaCYYkkfymxOJq
   S9Js9vMx8/DalinpBBoSTnxMnMBBJfhF3SoVmbe9UsKC9lz2PsmMJyUXI
   Ry8eZblnkkxQrG4NIbmYyr56ikMctoZxrF7xEgAVRkYOJGYN3SUYe2bS1
   Q==;
IronPort-SDR: pp7tXXB6e3g97ZXkuZhPiEPJO9sSOggbAYz4512f8Ug+ORz1zbB86J2RYfh2Wt/FZz2KI+jm+1
 W2VlmgwjS9Zhb7ht6vFgdxPkE6gNBLNr76xUFL1ImvxasfLanTA+w6Is4liWsUBhiCLhTfon0j
 n3J2AhO4hDdYr1732YWsTIiQPGYE9yQmiwlDptSzU/3ROmb8ReIlbUNN69HrnCI8V8Nfh2Yb/D
 stj9cOoPZPFPfYGfo/5nsZkqYT8IOdiFD/GbA/1scnEqsVPVS73hLrkP1MvjFkWKk/OKMMNa+/
 RFE=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; 
   d="scan'208";a="155183510"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:08 +0800
IronPort-SDR: 7ZNmpz4+JLk6Ls9HsA4i1SRsJJXb4ngjcTcxPDa/trtcu4Ct9IcGGn5p7DZxdPRhjd0QO6I5vt
 rApGqb/gDkqgeHg6qHMOSh1FIzywAC2yo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 19:10:42 -0800
IronPort-SDR: 7sd3gTVHXv7tMnXz394AGVVdZYWJcyOfWN53dQORzp35UoArP8SSg38alO68OBdwstDWADBR6P
 Os2kxqV9AVNw==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:06 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v4 01/21] riscv: Fix kernel time_init()
Date:   Wed,  2 Dec 2020 12:24:40 +0900
Message-Id: <20201202032500.206346-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
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

