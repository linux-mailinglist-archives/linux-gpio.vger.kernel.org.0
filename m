Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9827A2D8C22
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 09:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391219AbgLMIMJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 03:12:09 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32104 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389656AbgLMIMJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 03:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607847128; x=1639383128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=muoLqIq9oUwVuEYLXSApkgkU2WvgA1DCXiwKKEwbKSU=;
  b=Pqs+3WTTTNwCFf/o2KfeJ/oqynLjnZWsq6Oy/eShjj/rI9xmgReyEdP7
   cGGhUMcW4kQYPm79l+Cg7LjesCv+TQ3VuMf4T8xXZlvZciv6YL02pBb3I
   6u7INGUld/zJQ1NPdSWKJvfgZvxE10ReND7f86D8NxUdOLHXPdo69ZAdi
   NYOhuQB5+05t+Hdy4lGQIOZZr6t8coQoGkqhqcrGE1UkpNMLdO9SD+/sM
   PNiUdwhSZizP/0xbBLelo0OelbMUcjiHg24P8V7hdq1wCE9DJ2hG2/WHW
   aTQzKpnt/O2nOFC8moZPAzZbj0Me2xMpAwfDzo3CbSVXAITuBygflCvWB
   A==;
IronPort-SDR: wi84FFn+wJ8QCDMD/jycXvDgsn0CFWdV/N/XXKRl5Q0dYTu2ZzwPTUiD9YcfldCuVMHXFCFzZS
 66ICmnwfmD3JgXPGF2S2RhhlMuzPPUmObcOuTY/9VMjv2U+wYqyUBz0Bg6wixl3vp3rd5NiKjc
 3W6ChOMihA65TnjvW5Y/O1VUTVjx8mswW3OXdeWwUL2W2IKQZMHCH+GP1YpxpTuDlkTtpidKHO
 sq8R+jRtbd6MtvfXWGBRGFTf+ZQYbEfjJACBGfWBE1yvfPu7V/DBDMtitJo03Af3mqTJGv5uJG
 ACQ=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; 
   d="scan'208";a="265208164"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:27 +0800
IronPort-SDR: sB1dxygWV6hFikk85xLrHrxXT3yZkK3fk8iDghLRiy/BgRUFCLk52wFgIMWWbb36xrsM6+n+Eg
 aIJhd8xfVTqcrE0ozNdaQoFuLysrnndLiv8KQX5R5lxN30ymvMjhOjsON8f+Tz3tIYSwWSrWkv
 rANFseB2GLY0Rb7N0TRB5/mD8tXW4VQjvGdIleiEfuOVDI9B1JZAurhutxuWwSB1IJ7K2PVzqe
 d7REYyJU4utwLC0Uax7mte6IvPI0udS0uIPlWoKKXePhgcZ7KaULgPkyMrPew85P7WBvGtOWO/
 kIOjdm7Z8xYH4MwZxD+lk7tN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 23:55:48 -0800
IronPort-SDR: JNYt3tKikLR+31qmHDtIbo5dDeSqHeVtS19c9DBzbMhE1f0aiK1UpEoNaT/7NfnRIxihfR1D9U
 l8wHqO7xh7V4j/W5qzweqpRLk9Sy2JRJHYZYR3ZN00PF/QQ9fOa71it5Ykg5iGP+wpI+CwLzPg
 g8y18DqbH5xLMX9tj5rhyqZHwMByZtOId4L5BBmBzNyq5RIaRDrVHjN6cFbcprI80l+qULzLGX
 HS6Coe8gwCabV/Z/0gGgl3vM6ix6KF2uy85UTsXeMDoWPHlIiVyoncOgEZffc5OzcnvqL3batN
 wZ8=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:26 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v9 03/22] riscv: Enable interrupts during syscalls with M-Mode
Date:   Sun, 13 Dec 2020 17:09:57 +0900
Message-Id: <20201213081016.179192-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
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
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
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

