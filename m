Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FAD2CB34A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 04:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgLBD0w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 22:26:52 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:25543 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgLBD0v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 22:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606879611; x=1638415611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LAnvTxuCrxiYwbhYLblxFRB980/m85EFlvtWJ9EMVlc=;
  b=aA28cVEPxFQxpr7QeGX2zUGIIsFNs7uV4xfzn/73/1vSpU1fIOMhlN4X
   I+K71OM60Jy0oV4s8e2GlrMIGjZJdKtEpJqDTWG1Wg59RH66ecjYCyr8M
   3AP/YhQJjerXq1/fkCykFq516p9xh2BfiCXiU+UrtCdzAKPym9U0gNsPq
   K7R+k3/ylj16Y8RLpV98cKqfjrdGFvDM/QuB057u4jPHeJP78utRl/YNR
   utaP+yaL3wBkqr5aDpxJolYQ+A/elCpePVf3v5melBuDNr89+5hV2loJB
   8ByLYFNkJajdnyB82yw0O1GZs8zstZXGaqyCjfMR10hawjxZ1vrhu52jd
   g==;
IronPort-SDR: drMACpjoqSF7OHIS4OiliWuIqcNlXgQRcKKPd4w+EfN9e06wFfNUpzf/Dt/n1A46zqahH95KcA
 2gzmY+BH0MM0xGI0lBXywQyokBQMv5QeLtlCY0UVQgsPhHVMZUlbga98rJ+OH8o4XHZJsI+VLy
 UBujfmDSxTygKoc/GiQ3TMnnLWhhgqvi2JKrEdY8iE8ciQM8lPxmOfKuo10Y1tebeymtg3xErc
 FHYCKrXHV2u57XxfZ+A3EZj8xD4u1AJs2O2WAwyQ8n4EZHE7AnMXN9aAEXfiSUO6EzLP8aDqHV
 EDE=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; 
   d="scan'208";a="155183524"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:12 +0800
IronPort-SDR: dXymfrNggBXXWIhMJQrFGn1DuVlyC5yS5RmHECWfEqCD9CzjyIuoRgXzAtg5NBV6I30UKtvYdN
 JcrJEM5jl+1NDUAVeZoZjj42ynH8rPHC0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 19:10:46 -0800
IronPort-SDR: n5i6KqE45ld2pSJaXhVwDF7/c8Spaaxd2zdfidNYfLOL7tvCwWfYVRyGsV+LCKcDPUnHgrmOSz
 FwOBaRt2mAZg==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:10 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v4 03/21] riscv: Enable interrupts during syscalls with M-Mode
Date:   Wed,  2 Dec 2020 12:24:42 +0900
Message-Id: <20201202032500.206346-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
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

