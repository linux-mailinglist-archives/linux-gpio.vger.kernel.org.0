Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730682D5CD1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389916AbgLJOFX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:05:23 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5199 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389511AbgLJOFJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:05:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607609108; x=1639145108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WZEv6fldcIfyPLrkGFKpdtaHk67JtLplADjR9GiPnjU=;
  b=En6S8yg+QqcOopW0K6v5Dxa3KtUr3JgZp9pAcRcnvnutQXpYTQhkFL3t
   RdZ6AIAZ5/bCVk8cgdPAnqTwgC8ORtWR6NNZxCO2MpnN6cLppwAGSR5fR
   8yTwu3RHczGHySuqb3DUHR30Rvjhax9D8Og7wLaWWyfprCJm07qOkXJ4W
   swLJy1Xnzxu/8MLe4Crt7gsqJTbai+JRGaHyw9lzW94LACGUSKEoZLDhH
   oTTzKq/IqjYMsolkL2x/9zObiqcfhl9d03WaEGDtRI8lqRnUrStJ/G3oI
   bMrJ6c1yYmor5YFFxKGEbKyKTd83LFl9Xgquu/Z9H/Kba6oCCZ87uxqgt
   A==;
IronPort-SDR: iiY6rQXk8i4uusjyq/sbQ030QeX5iwc5ldxbS6/3HROHh+waLWWPUhSx0/hF366Avkg1pZ742N
 Ye1/WMOjL+ZTMcMoiGOQEEO6iyykWR+jRaAn7RAOOuumAvnXfLKyUynoZyq+HqA+SRttzF7zdt
 /ijhajpNj1eRw4Sq/fs7Q4Haeg0CKFlg4BSRz/NeIFRxeHnmcj+PA7ddGxYDApUsyjGUaFRwvf
 3+Dep4gCnSMzQ5ZL68Jf2qi9jaN+3BQLp5pg7zHnmzy2eKz/0cQILqahfRu/KWpS2tNSHeGODp
 yYo=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="159316691"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:03:24 +0800
IronPort-SDR: ByiGhtDOTADJfNUxdBqaJKoIhKKVAVcCsbxux0E+f8B+GZ66/kiyxlQ5ZlgVcnEste/CMJ325B
 KCJKYr/660G1Mb5go0ZDT1DGv3uTR5evo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:47:16 -0800
IronPort-SDR: IOS+pg1LeKBlKFWi0ugz5lr9e0jpEh3Pqr+r27y2sT3h/PteAqmHhQViXx3eGkBThmeQM6p9wo
 2eqznYo+dOpg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:23 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v8 03/22] riscv: Enable interrupts during syscalls with M-Mode
Date:   Thu, 10 Dec 2020 23:02:54 +0900
Message-Id: <20201210140313.258739-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When running is M-Mode (no MMU config), MPIE does not get set. This
results in all syscalls being executed with interrupts disabled as
handle_exception never sets SR_IE as it always sees SR_PIE being
cleared. Fix this by always force enabling interrupts in
handle_syscall when CONFIG_RISCV_M_MODE is enabled.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/kernel/entry.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 524d918f3601..080eb8d78589 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -155,6 +155,15 @@ skip_context_tracking:
 	tail do_trap_unknown
 
 handle_syscall:
+#ifdef CONFIG_RISCV_M_MODE
+	/*
+	 * When running is M-Mode (no MMU config), MPIE does not get set.
+	 * As a result, we need to force enable interrupts here because
+	 * handle_exception did not do set SR_IE as it always sees SR_PIE
+	 * being cleared.
+	 */
+	csrs CSR_STATUS, SR_IE
+#endif
 #if defined(CONFIG_TRACE_IRQFLAGS) || defined(CONFIG_CONTEXT_TRACKING)
 	/* Recover a0 - a7 for system calls */
 	REG_L a0, PT_A0(sp)
-- 
2.29.2

