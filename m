Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE0A2D51A0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730556AbgLJDmD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:42:03 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39174 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729808AbgLJDmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607572437; x=1639108437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WZEv6fldcIfyPLrkGFKpdtaHk67JtLplADjR9GiPnjU=;
  b=fjCb8o16Q3y1dgxlp09vYBxC20K3RoZYcHq2ARNSUmfQiam7RmjCHQeh
   LW12tjttuI/AylVkD/QFUVf82v/HELXTQTJR8wVU8opfj4fAhxfUYPtJD
   kekUUOGWhSA8uO8gj3D7HJ05NEQxG4+06e4JSTgS5QY9LceTG+kKjl+bb
   GXzeCZbjmX+PWIeZ+M46yWwyh+E5TkDjxUD/4jNkAnN/ClNx2tpzm3ByQ
   dm1MkRZWI3JNlPuuTFhe/16FF605DMLhwTBGfcvWsFWOGETzrEmQzC4Uc
   0iyDi5GwfCzurZXnJbwNFT0C+MJZhplrJhx2ipZ6E/wkreLqxiA8yH6Xj
   w==;
IronPort-SDR: d7/EZXNvBaUoeBdxcP7ioQaiqdIJfiRVEheePAc1Bg2kaFRpt5G8kdDTqbhSn2vxxMA5plgifZ
 zUWIAnzt9CvYLmfyZ1g7cL/iXehu7O9rwINRn+0T4XRjv1MaOC9anJFGbpaNnYr1dR4adnoc1C
 1dwE/k37RwuNhgVH3rYgK0bynO/9SGDk7nlHSPAqnN0Ui7d8YAUe8TD2MF763RF+S8LSWOAer0
 2Eqvf53r05xzywxaFwBLfuQqPBReIFGXcnuKnkQy0bNCGV4zvwC1BlLFbCwIqBIc7IDYr9vSkH
 cSA=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; 
   d="scan'208";a="258551201"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:51:25 +0800
IronPort-SDR: 8D03xNfStsirNo7OrbDUfYlqzehE91C7/F+a6SYnXZtqjnfRZ9huXSfTzMrcdHgSZ4MBMeStI0
 24+IKp2iek3EdMK7ntyi+k5ajciAP8lVQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 19:24:15 -0800
IronPort-SDR: Uo0Xgk7DJ98jUm15Zhyn58dKXxaczTnqsiYrumv5dYcjM4xtQbV7Z3FmF1Z29FDAO/9MZS9sIG
 bUwP4Hjn4FQA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:17 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v7 03/22] riscv: Enable interrupts during syscalls with M-Mode
Date:   Thu, 10 Dec 2020 12:39:44 +0900
Message-Id: <20201210034003.222297-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
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

