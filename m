Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037172C9316
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbgK3XuV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:50:21 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7930 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgK3XuV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606780634; x=1638316634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
  b=KP+nOg8ayL8kNwrVUO7pcuGARDQoETFi2ldCYmfscnP96+akfxH4djXz
   Gs5CfLe9L/pb4pvOhTCDObzNeE6UCilMVmH1bHCpViv+lGz684ZFy9XSF
   5kP1Mb86O+5ZQ/Freoxl3WUuPhRcUnRx9sO+1cdEZPDnMTzvlnw9VsoYF
   uOBQrHnUWWI9vfZ/LyNVWLTEhNhkuiLDUaKeojDkoF65X0Xlg3OyaCPdp
   m4pfqovXfxGgjoo71qQDLs0WBoSA4lEmkPAzDoE/tAOIx8kpHqLSE2Rtq
   lxhdk8si2VNQ0xWTBwEXsbwMRrqbitvYlDcm4CAyv65ru9lDLZmIxPATD
   w==;
IronPort-SDR: nPqm0p+iXTaXmHqkMevD/mbc9/i2aa3xyYoyKa963pJ92NLOJzln/P0azO40dNR6EJu0Kr+FjS
 PsEjlOqK3nyujxeIM6pUjGSCPmGaMLJBTfoYy2M5b0sU2BdTProbs5OUmdkQ7rN+h9SpjF5MB9
 MU4CxZkRZEFuwdnciGHhILsIwRW86tfEHmkSN+yKpuzAyKuofkcI/8sCOKSl3HBL9Dtdiugmex
 gDC0e5TUBWrT17v7u0tzenYuHEVmlKXgu2g5iQQcs14ENVxgOsmjA+kMB/4ggIuH+GzhzPDppJ
 hyE=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="257538293"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:54:42 +0800
IronPort-SDR: 6sYpR+XGSzxic7Bkjyko5Yqv9LOHV2Zq4Di4u+MXVfP69yIQ1bbctEFgcWV/8ZsYbas5l9t49B
 AmxnsylARswOdBM7OXelWiDlXn5uq4piw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 15:32:54 -0800
IronPort-SDR: KzFqzqX8anTpMG4dXaErAu2yqFBePyUg/u1I+TFU6bGUPJ+WYJdzcngfK90Ceo5pZ7J4nNcqTG
 KkB7x/dGM4fg==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:39 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v3 03/21] riscv: Enable interrupts during syscalls with M-Mode
Date:   Tue,  1 Dec 2020 08:48:11 +0900
Message-Id: <20201130234829.118298-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
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

