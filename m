Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2932D3AB8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbgLIFhE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:37:04 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:15306 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727475AbgLIFg5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607492216; x=1639028216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
  b=ajxP6CyMhxms+DHFooIF1XhCVlLefT+jmb+0FgMdVRJ6lhJSb1ZdGWrw
   ItOczqBz4rIcHMQVXBGZJsFon6F4F91TuzwGOhs78pfShhze5h05yssti
   GVjCZYk6PimZuSYQraoShkpy34YwlwvZ5shCA6fqvHdSCAlLJDEpEFqTh
   EB7b96sH9QCH9phnNKTrtrqUW6UCuxbQ0sO5fk3uUmLk53EzJG2KMll+L
   DdFM1W8EV0NZMCnTRccQfUpkE82FycmActmN8C1fXakhw6EzAbIx6FEEP
   +c5jgLPwmSTw9rbXUSbyV9+MHpUrjoR6UuJn8cU6fNwNEj3fN8BZv6M5V
   w==;
IronPort-SDR: 1BMNufRIsU0+/KPjWSd+XpQwEqtOBEQz4UlcG89vZPTn4KUSTwKD8MwfcFaVWhAWuyn87okyez
 2/GDN28htlKF1zuGlWKC/H3bFneCUfepx/NfhuGPHLxnfuG0oZNfSyKn8Y6FNednwRZhXWrtSM
 Fzp6UDC856PJwbDF+WDsbXPrUU4cPdgmIMkEcX65DHL2ku4NG5I3/Ct7jJP9QE6xT1cIN4Xgo3
 vAit9a7mjWZXHC6x3/rDUAvvoBS32JGcyz0EzGp5RLCwOOJO1Y49qd+YPQoZXrJZ6teiIBHdyw
 6cY=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="154735880"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:35:17 +0800
IronPort-SDR: vbS9p1yGhmWnbbcUx9ZMD+GGq+67HFFWWcH538UwBO8F7EUxkFKtgbUfbpHcVk+PqRZ9P2NG83
 aK/Vzx3fQfNmFVAHyDXStYImp59r2S88s=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 21:20:43 -0800
IronPort-SDR: iu6zfrJ1Xxa9LJ6UMRH605p9zx2AKacZzxHV6epO9ppGgRlNxGjRn47Weu3fthLMtKE72CWvgD
 CNOoWUT6M0KQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:15 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v6 03/22] riscv: Enable interrupts during syscalls with M-Mode
Date:   Wed,  9 Dec 2020 14:34:47 +0900
Message-Id: <20201209053506.122582-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
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

