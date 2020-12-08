Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5432D2476
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgLHHfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:35:47 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58712 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgLHHfq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607412946; x=1638948946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
  b=fGRCMl/yjEwze3GtBjPBf02O3E1VqPi8s2iNr+A8V2yUHer/8LLK760N
   x4lojSkiHxcw8j8nODEFkklJaJmVGPP+CBu/QyyUC9Bh42fdb28ZSs00p
   YMJUxkUWySZvb1b22FyBjQ7696lYShc4HgOBmBUQVNL+uUMKdvOSaG5dX
   y/j/O8LIC03/XEjJuRkCpfM2QmTlL/ydYJxmoEuOXU4YA7uu0OppzFTyw
   G45QqHXDWnawwEtDMUwMIsKtVPA5HJialO0xRv9nV+Ao8spRZZYDgi6TS
   NLPR35UFkLYdoqmtkFrx8Nt/2DxLlOVjhxhqn6L8grBHZogQR2jODJRLJ
   A==;
IronPort-SDR: Iqg5g4FQckSsY7MYdQyBSy+XIlmQ3AdukAXopuXvDt42ytpQTVgBtqntML2TSWfXotP6DN0+aY
 ngbme+LfwwIfmgNN7b0iXLEW8jbkNk04lFSFnLXvvRECkB0uRMYWV6pDG5r4EnSkx5lmyxAj6E
 GNNWULqZBAi+5zWF7MKO1kqXCCb+8+r8wMWC0Hw3NFdE/lf1XNZqU6LJTfOpyg4Pk/ytSV2UR8
 SaFaw5G0a3YBHvYf3jVxEXIJPHkD2hJiNc310SArjFC7cABL0jRs6lLU3DpJRsGn+72cZCgdxz
 rTs=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876631"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:07 +0800
IronPort-SDR: hzVpzasS3onyc3Z8I/YQWxZ9PeIz4QgBs0tDa/Zb/hCIHujB+gOs1oyhRbwVDzg2G+CwZi9fF6
 7lmOQH5ZXnDnLpWiW2v/AGT9+r06tIVZU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:07 -0800
IronPort-SDR: sGfnrbNomyJN+r99NCkMNBFtPemtnagjUpamcF3oVwnFEZVKZ/C36EnezUmMBHWUMHtHm8DHCp
 xEbw0WO2iw/w==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:05 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 03/21] riscv: Enable interrupts during syscalls with M-Mode
Date:   Tue,  8 Dec 2020 16:33:37 +0900
Message-Id: <20201208073355.40828-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
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

