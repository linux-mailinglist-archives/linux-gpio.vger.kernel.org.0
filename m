Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44A62D8D65
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394697AbgLMNwr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:52:47 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:35036 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbgLMNwr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867566; x=1639403566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=muoLqIq9oUwVuEYLXSApkgkU2WvgA1DCXiwKKEwbKSU=;
  b=gGByGt4SvL44jxmbf/rbl3fib1modgVZ98ZsH+q2+JUl2V4GQBymtBev
   LIjoHWUqVnYObeFC1iTOjfrXYEzrwcIAwNHi6uAQqAr6DM929Fc95MjFw
   KhVdbKUcO349jZbUAtDXGGD+OkeIhVBP0Z7L8UuYWUCrPXXesfFgC8WAd
   DozGDzKAfnUaX3oMG2nDXOJ8wI+8Wd+XMlerG1zwY3TJGPpU7Cb1EkCLE
   r3zjPhFinUldpt9xI5rLp07pQUT/NZpsXjAhjFv2m0ktIC5UgJxLzoatq
   qDpn+f64GIx/l3ybwycvZEfYNof7Nnq+hn39+PuKQL7atqdDmi+Yw9Vyr
   w==;
IronPort-SDR: fJJYhwX0mPz5QgDJiPDLxLfHhjBbGxlEmXSVeVimEh5fQLQTneKIOJKh0xNgwLdM9u/JAMDCpB
 poZf/uQd4KHaRqQbt9xzsd/4v+S5OOGGrhIJJBb88w0shWnQqIbT4ZTWhfWkMfXLb7JWuWXj7W
 G7kmwQDyuO/dlMrrsNtCLl0MhK+xCo63t6TnKIiOqjiIkvYskyLNm/HwWFluIo07r6SJG26Bz3
 yXwGiZ4W4sIMqEdmbqQuxT0UQChj8wsItQArsArt/FM4aI0zXr8r8QGjAJqwUn1fldJagtJt7y
 v/g=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494582"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:06 +0800
IronPort-SDR: qLQwcDS5Q1vbR7P93B8/LF9xcp9O5ahMMytuKILkF9hNus/QnELK1RRKeAoEhfOGGJysPD0nlg
 L5jbYehPKgKP8ImyNmNv+CNODr8+KV7tKaLGTs2uwUFJ9q4CSyqR8PbXkayWDD/w73k7f/BWEP
 OKmYNkaj46iBmHLZbM2vL5U+N91v3pogRDclvzqsEgnPxUeK+jtdb9X2+mGdhfZeQT75RUZthY
 khwAXuLDTYdOxj2Qpw9qRl53JO6Rs5DEqt1O3vSg6G4bBHH4nbVSjabC/c6TDGEW/ANMGAjme2
 ouqUIPsDVgvBAo7rL24DXsZA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:34:51 -0800
IronPort-SDR: bRDipNHKqEL0s4xlUO9/ssQBxqhIMyPNGyUZNKHEg8JMBPhv/nFcK8Hoe8Vnl3JtUmm0vZI3X8
 8xfE8RrAVFb+FXsip/awUQx+nk79J/1m/WIvkalToNHQZHfGZqT450xqz1kp46sQMDj+yweG+l
 GbHOBRbjR6QPJfxQNIVofUNSj1SAeZ0m1/FxpJeXMp4LxS8ZPix8jCCPQ5CY1e//VWCmCdPOYc
 Kus1TAw5dsw+D/urE8r6icoH1FNdc9qocyjGWFGWRhzyUlV9YWWpu0Cic3eEymVzPMPoOFl8jg
 kcA=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:04 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 03/23] riscv: Enable interrupts during syscalls with M-Mode
Date:   Sun, 13 Dec 2020 22:50:36 +0900
Message-Id: <20201213135056.24446-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
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

