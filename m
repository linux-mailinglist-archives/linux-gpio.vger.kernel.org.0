Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FDE2D8D63
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391635AbgLMNwe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:52:34 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:35019 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729465AbgLMNwd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867552; x=1639403552;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0B+kwvrbaYpEs4CIb2Eoho1O+FgaDjaWqzP4OVlKPRk=;
  b=HcAftB8/4CrzvBDo96RflDA4TBlASRjgqIjxQ43S2HBr08dY10g4gvTn
   O3hEm5Xj78ZIVuvi8EkHLnVFbflWR4av3n4o6kiCRPwsPSe6sgII3t79+
   ZemPn8SzsqtYadO1P8lW4mnz1dZ5FbsiQ7Ay2+QXVh2fk6FgBj0q6RDl/
   3WZUKBT/FYejF3S4B9sP+DksnWiSfG2Jg/Sfm6QEUw1kZM+vRWfzBTrQS
   05xeyoIVdeimEdNEkOg4meb4xJg7t4FiOwKMOBGmB47/9za/ndTkdPWv0
   4FJmF/u/ATHBiFCN3CD0M07OiEtMDXzFJKKX7+7geUK+RgeoTsc/+Wz3q
   w==;
IronPort-SDR: xWDN4CcqTceHp0coXtPYfDitRzhcI1n/PhDOzaRt268V2J/aoFY63snfIahqY5UobgA9bPlOeS
 H8a8obRRdW2RG9G4MTJuhr+3YUMar9+fQsr5K/lQX/rBMryQTjIoy66SwiOAG8y/Sc1U0Wi5iZ
 W0qjg/C01fmHDk4JngS+4gzQiowGbsZJ1FZlL9dTIItK/5VNO0A/iNUh7lXQ7y9BT6+If1gM2g
 DyRu87QhZyQPVu5winWuxAxRd//EWjw/zA2ec0rs21vQggJaCtekFF6szbJWQAV2JocgfjYgGT
 Bjs=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494572"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:02 +0800
IronPort-SDR: hooZAUrY1VF1AGE1AwdufNLrGeSV6ImtsMdyv1sE/eK90YVW89G+lOYxnQYN6xRUGDq14Ceet9
 /eDmeI+OXzcXIkUINNEADLeCBa7+Qk9XAFCPS2Sy0mbEPX1hLjALv5xFeDvMMCxc4v7AhCa73R
 DPo49lvorhSLSMecZ7YAZ3RuKnOEER8bmxzeBrsJz9rjj/2MzIG6SOA8DepW4Ajs7Xr/frdi2U
 hc4lbJXbP9PhQYQqn5tIAm765EHmjUAEy0W9MCUa+pv30FwdsF9+QtECp6TT/k0S8zOJlCZK+B
 qLYLBH6dWXipT2QhQGXyfhjC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:34:47 -0800
IronPort-SDR: 0/LgnlutHKxtwb+pbBl3o7Ls1rFecKaGRoWvO0RKPF3+TFxWGaq0BBzTIVTYJ/BlZQa76Nj8Ff
 Ghz2Yp5unOhqlEKeg/LU1dqh1GiQLgFSHv4YUS925vBDOKOeb0V1mxkRZnVe7GYQ4lDDo7cjzr
 Oo9OqBoFpBTYrX79QHkNQAHdJvNnCZgQrF28rxxOuELpPyUFc1jKGzr9MPMWlY/OVcyu7EuaBl
 +L4joXnki/19If7Uqt4UwVCtxu+kFf0mWcWrcbGx7oQLhCOl1oY3nFi5arNrX9aZX+a2Dkviyu
 PKU=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:00 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 01/23] riscv: Fix kernel time_init()
Date:   Sun, 13 Dec 2020 22:50:34 +0900
Message-Id: <20201213135056.24446-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
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

