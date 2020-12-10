Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB30D2D519A
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730518AbgLJDlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:41:52 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39153 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729157AbgLJDlp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607572415; x=1639108415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a9lIXSkXmm1JjHCFgZUF+EI1D5ZXZRRfkRqwz5LKPsE=;
  b=cHn+8qzcD/CZ9oJK0q/ARWJduvbgzSxBd4pgvpua4VxPY4rrvqD0JRsK
   rKNGh05UVz9kUbOl04pjBoWIVx2ZIQVr0RHHjDsSFRuzs36RglvDXiA5R
   wQtfRVSbY2+/GdvCZdWoNypIj0gGxc5hAFoY2HPzCOce+6Iv7LmWpqpI3
   kaoiIFjG6L66k5pHj9iDRRyw8eWWNXQFOk9zCWZKoJrJ6sQQEkiqgoqf2
   V+VwRMxblWAdB5irD7vRryxMUMdNq2mzUmbJvYbbH7rmpuCHRbdBEc2ah
   jvRw5BgYPNb27reAetC8h/g+eB1d480w+mRggoFU9BEp05QI751RPNJZC
   A==;
IronPort-SDR: QjneR23yF5V/8XqdOau8FzWmGuUtyPHy1eYVthnPxlvPno3FXfaFxyLI51dXh3BaAwoo9q5JIf
 MfTvypwcqhRV/MoaMSpis99X9m5rIOx5myuRgiIRRDeaNMVPrORb7AxtTrpulLcKdkNq2hAoFD
 tUxpCD1yv+KkGiimei97xE6pCla7YUa6ayzfmMLuYkCGM6IBL92Hais44hJvNpG6KPzvuKY6fV
 afihfi3FlnZ5ArZc5jzpbHuFXvjhH0RkY4R+wb7b0J1xUe61scUR566IYxA5gGbXfdTJnnjLo3
 GSw=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; 
   d="scan'208";a="258551195"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:51:19 +0800
IronPort-SDR: qMIyh9hsdQ2GnyGw5MWi+Xhizfpr1PBKrjKLcmamUrHbObMSdkcpu9xwse2wV5a9AypZlQ9wS3
 BVXGMn56A8jjCKj5wgZ4FsrDxf6F0/wxY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 19:24:11 -0800
IronPort-SDR: wEESJt/qlZsFQNbUANYLhzB3DFbaaogp712R+AZekxpejGOdxwjN6Bsy93ahaUlPn/GLf1HPKs
 ThW/3HsaZpfg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:13 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v7 01/22] riscv: Fix kernel time_init()
Date:   Thu, 10 Dec 2020 12:39:42 +0900
Message-Id: <20201210034003.222297-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
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

