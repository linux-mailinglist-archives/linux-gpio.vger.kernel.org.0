Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACC32C1CD9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 05:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgKXEhi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 23:37:38 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:49765 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbgKXEhi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192658; x=1637728658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
  b=JfVGuEFlXoKtia1QfTD2g2YlFBWQlbUBjaYkdAWZUYdF+byhiFnGCOq/
   w5Rhw3JpWECw7YzfCRRjA4LMKj1x54DgYFSx1KjA1FamzR90IVh6fSyxH
   oLihAV5kMfy1vBfBr5Lcs5dgpu+MzKfYmWpA/vbbiLIPDWnI/MFYTtrKv
   /MHDvzQMYIY8PS++vBYBkzO/L2t7btDi3fy/gPASMeCZfVbhJNyCKBDU9
   INYlQ6b8YO60CNye1lCqXvQEGVqXdVJsluo92vjAF5qWYu2Q7W55mZV2R
   0UDpiChMRTxOwgOVhWHSM2DelumqOYUVA4Jd+gmt2rPdms+u8NxJcTTQ/
   A==;
IronPort-SDR: 7UM62cI4wsMePOhUsrODVMRCwSW5oYLEmvhgWt6w0FCfH7Pq1/WKLDLs1Wam3ukebYVeSecLeR
 YHOfDIlcChHgSMgY89cjRCXWxCb2ehzyMWkMeyM3UmxW7j8UQPBPHsODk3y7rbZXixca5ApXoS
 TKcVWBzU2Owhtxa/8MZQFj799v3xZonogvbLzYC7E/mDMk9TXduT+TrjU1ePLP3v4FHBsA7u9O
 xGuCYfqme1gMEKagyFintrTwrpPJuGnGqS+r7RxGpZo7db972ZX0fl258uHF+08ar8VIYt6SYn
 FHQ=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498155"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:38 +0800
IronPort-SDR: wo+K8saWNLoavR/WWDF/aZVUGu/sC32bHh2kZHW77xi1wwCXhDK3RBNsHH1Pl552MyaXFcRMJU
 VeeVjbPMiKzLIS4FbwPcVSV4TYM6lnZ3w=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:22 -0800
IronPort-SDR: +GJRS9u0nUxBOguxN99UNrglnLx6r2UfTkUb1JzQQ1VXyKr+GFadfoi1Ket/4sgvocApic1KjT
 0GXKWXTHUbTw==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:35 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 03/21] riscv: Enable interrupts during syscalls with M-Mode
Date:   Tue, 24 Nov 2020 13:37:10 +0900
Message-Id: <20201124043728.199852-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
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
2.28.0

