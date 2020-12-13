Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FE92D8D6A
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394730AbgLMNwt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:52:49 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:1980 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbgLMNwt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867567; x=1639403567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9HLLil2FdLt0C+guCFzM2bWksJSdqkJONJJEOtFGzT0=;
  b=c/jFk96PUlVFAbbSasogcWU3lhoVbk/K3DGdqhQtySrQu4HFrp3y0Y1K
   cfhBw1nEc5PS/1/+jYH065++4mcaBYt0rQe+gonlNmD4jSbB3VG1/mHlQ
   kB37k93PhcVb6WPv+/SlqNxoFioa9hLfPIXpAwcq5FM6Ir8WkOtmNhGzG
   CL1tYZoWo5abnRaGMwLw9iTqrIIgfJkREhyTu6HBwlvxvEu3dIyyjA6yd
   Ne6bRTTLz0QXd5fDM4FsmfmhvabUvWuy0Vng3v/407TH9YqNbZtL3Rp09
   4lIMamgdldXWdggkv7tyD0c2w8jpEWyj+tqHIBJaxn5cbNhaWXAPev1tv
   Q==;
IronPort-SDR: KvcbsvRvOLmONTux+cjQGMjzWQlmYPlZ+xwx2bYFTJT+m65tiOyhS09NhU/8Xa6lxHcnM8Dmn9
 MV/8f2kXPSosHKwcd0PXz7sc2ZD7sh2Qi2OASmbYhOcFUukOvZiyANKwwJlCJibHVOS+huLL1p
 23hBD8xGJQmXoHEybPM+PEQ9elq/XkWKY4B8tXLb5EDeDWxdf0Ul+DeagvZ7QQ11Erc/kx6X/C
 rWeb2wCmgyhpPQ9WTQ+LJgCPqcNSOdFi7uQxVSDQznFu2IcuHMEWlKMhj/HSeYEkqOqFTv4bf8
 WGU=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494585"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:08 +0800
IronPort-SDR: h46ASN2VpZuJWh6dcl20cClfjIVaJOrhiFPde8VOtYx1QsnP6iKuk68pS4eQ2Mo4ExTSwwL8Oi
 7g67g9AzlBHPvRMbQ6iBKjaw2JQuI1Ob3asrV4R7oRMh4pqgt44OXmDbwOcMGttjxE9QurPW3p
 YKlf63vNngI9lT/XZaCgu8hfD1EvqEQPISwSl72/AZx0AJs1nwGMl9OEL89cMH1+dCPLpAt/8o
 TddNZMy+jxtaBJGkzKNmMmipQGhTPjjaPEC3wANSiHc8BjOtPEJGOaWQMj/FGeTTu6hUne0qa6
 e/4FTSqcYzhwSI1KD/rM+v9P
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:34:53 -0800
IronPort-SDR: H+SacK5nIi8lFtzH7ZmjMJUoYuxEI3juEYSsIcEbcE0sEwG99bhP+kcF63NO9o3FYPwdkizyqL
 4qjnmg3WHrWzDwLEIfe6Amhemlxxor0tZvdXAxM7/hFzg1+mTSb5Jz/c0HAQZsr21cjkksJxoO
 eQZmaKeRZUJsgITwgLr4cOxNo7VCRSfimiqSRMc2F8uIbp/5Z861kYQLa7eVU621iRlmTaWUxq
 xRAYFRuA6V/LLk5gx2mRLmBCHU7BH7/UQgPW9ADLXDX0wBX7bpOC2CgusdBtxwiI0c04lv5Hak
 O9s=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:06 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 04/23] riscv: Fix builtin DTB handling
Date:   Sun, 13 Dec 2020 22:50:37 +0900
Message-Id: <20201213135056.24446-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All SiPeed K210 MAIX boards have the exact same vendor, arch and
implementation IDs, preventing differentiation to select the correct
device tree to use through the SOC_BUILTIN_DTB_DECLARE() macro. This
result in this macro to be useless and mandates changing the code of
the sysctl driver to change the builtin device tree suitable for the
target board.

Fix this problem by removing the SOC_BUILTIN_DTB_DECLARE() macro since
it is used only for the K210 support. The code searching the builtin
DTBs using the vendor, arch an implementation IDs is also removed.
Support for builtin DTB falls back to the simpler and more traditional
handling of builtin DTB using the CONFIG_BUILTIN_DTB option, similarly
to other architectures.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs               | 19 ++++++++++----
 arch/riscv/boot/dts/Makefile          |  2 +-
 arch/riscv/boot/dts/kendryte/Makefile |  5 ++--
 arch/riscv/include/asm/soc.h          | 38 ---------------------------
 arch/riscv/kernel/soc.c               | 27 -------------------
 arch/riscv/mm/init.c                  |  6 +----
 drivers/soc/kendryte/k210-sysctl.c    | 12 ---------
 7 files changed, 19 insertions(+), 90 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8a55f6156661..0bc3e28581f2 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -32,9 +32,7 @@ config SOC_KENDRYTE
 	help
 	  This enables support for Kendryte K210 SoC platform hardware.
 
-config SOC_KENDRYTE_K210_DTB
-	def_bool y
-	depends on SOC_KENDRYTE_K210_DTB_BUILTIN
+if SOC_KENDRYTE
 
 config SOC_KENDRYTE_K210_DTB_BUILTIN
 	bool "Builtin device tree for the Kendryte K210"
@@ -42,10 +40,21 @@ config SOC_KENDRYTE_K210_DTB_BUILTIN
 	default y
 	select OF
 	select BUILTIN_DTB
-	select SOC_KENDRYTE_K210_DTB
 	help
-	  Builds a device tree for the Kendryte K210 into the Linux image.
+	  Build a device tree for the Kendryte K210 into the Linux image.
 	  This option should be selected if no bootloader is being used.
 	  If unsure, say Y.
 
+config SOC_KENDRYTE_K210_DTB_SOURCE
+	string "Source file for the Kendryte K210 builtin DTB"
+	depends on SOC_KENDRYTE
+	depends on SOC_KENDRYTE_K210_DTB_BUILTIN
+	default "k210"
+	help
+	  Base name (without suffix, relative to arch/riscv/boot/dts/kendryte)
+	  for the DTS file that will be used to produce the DTB linked into the
+	  kernel.
+
+endif
+
 endmenu
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ca1f8cbd78c0..21e3905f1c44 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-y += kendryte
+subdir-$(CONFIG_SOC_KENDRYTE) += kendryte
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/kendryte/Makefile b/arch/riscv/boot/dts/kendryte/Makefile
index 1a88e616f18e..83636693166d 100644
--- a/arch/riscv/boot/dts/kendryte/Makefile
+++ b/arch/riscv/boot/dts/kendryte/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_KENDRYTE_K210_DTB) += k210.dtb
-
+ifneq ($(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE),"")
+dtb-y += $(strip $(shell echo $(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE))).dtb
 obj-$(CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+endif
diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
index 6c8363b1f327..f494066051a2 100644
--- a/arch/riscv/include/asm/soc.h
+++ b/arch/riscv/include/asm/soc.h
@@ -21,42 +21,4 @@ void soc_early_init(void);
 extern unsigned long __soc_early_init_table_start;
 extern unsigned long __soc_early_init_table_end;
 
-/*
- * Allows Linux to provide a device tree, which is necessary for SOCs that
- * don't provide a useful one on their own.
- */
-struct soc_builtin_dtb {
-	unsigned long vendor_id;
-	unsigned long arch_id;
-	unsigned long imp_id;
-	void *(*dtb_func)(void);
-};
-
-/*
- * The argument name must specify a valid DTS file name without the dts
- * extension.
- */
-#define SOC_BUILTIN_DTB_DECLARE(name, vendor, arch, impl)		\
-	extern void *__dtb_##name##_begin;				\
-									\
-	static __init __used						\
-	void *__soc_builtin_dtb_f__##name(void)				\
-	{								\
-		return (void *)&__dtb_##name##_begin;			\
-	}								\
-									\
-	static const struct soc_builtin_dtb __soc_builtin_dtb__##name	\
-		__used __section("__soc_builtin_dtb_table") =		\
-	{								\
-		.vendor_id = vendor,					\
-		.arch_id   = arch,					\
-		.imp_id    = impl,					\
-		.dtb_func  = __soc_builtin_dtb_f__##name,		\
-	}
-
-extern unsigned long __soc_builtin_dtb_table_start;
-extern unsigned long __soc_builtin_dtb_table_end;
-
-void *soc_lookup_builtin_dtb(void);
-
 #endif
diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
index c7b0a73e382e..a0516172a33c 100644
--- a/arch/riscv/kernel/soc.c
+++ b/arch/riscv/kernel/soc.c
@@ -26,30 +26,3 @@ void __init soc_early_init(void)
 		}
 	}
 }
-
-static bool soc_builtin_dtb_match(unsigned long vendor_id,
-				unsigned long arch_id, unsigned long imp_id,
-				const struct soc_builtin_dtb *entry)
-{
-	return entry->vendor_id == vendor_id &&
-	       entry->arch_id == arch_id &&
-	       entry->imp_id == imp_id;
-}
-
-void * __init soc_lookup_builtin_dtb(void)
-{
-	unsigned long vendor_id, arch_id, imp_id;
-	const struct soc_builtin_dtb *s;
-
-	__asm__ ("csrr %0, mvendorid" : "=r"(vendor_id));
-	__asm__ ("csrr %0, marchid" : "=r"(arch_id));
-	__asm__ ("csrr %0, mimpid" : "=r"(imp_id));
-
-	for (s = (void *)&__soc_builtin_dtb_table_start;
-	     (void *)s < (void *)&__soc_builtin_dtb_table_end; s++) {
-		if (soc_builtin_dtb_match(vendor_id, arch_id, imp_id, s))
-			return s->dtb_func();
-	}
-
-	return NULL;
-}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8e577f14f120..c32ff32cf9ab 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -601,11 +601,7 @@ static void __init setup_vm_final(void)
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
 #ifdef CONFIG_BUILTIN_DTB
-	dtb_early_va = soc_lookup_builtin_dtb();
-	if (!dtb_early_va) {
-		/* Fallback to first available DTS */
-		dtb_early_va = (void *) __dtb_start;
-	}
+	dtb_early_va = (void *) __dtb_start;
 #else
 	dtb_early_va = (void *)dtb_pa;
 #endif
diff --git a/drivers/soc/kendryte/k210-sysctl.c b/drivers/soc/kendryte/k210-sysctl.c
index 707019223dd8..4608fbca20e1 100644
--- a/drivers/soc/kendryte/k210-sysctl.c
+++ b/drivers/soc/kendryte/k210-sysctl.c
@@ -246,15 +246,3 @@ static void __init k210_soc_early_init(const void *fdt)
 	iounmap(regs);
 }
 SOC_EARLY_INIT_DECLARE(generic_k210, "kendryte,k210", k210_soc_early_init);
-
-#ifdef CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN
-/*
- * Generic entry for the default k210.dtb embedded DTB for boards with:
- *   - Vendor ID: 0x4B5
- *   - Arch ID: 0xE59889E6A5A04149 (= "Canaan AI" in UTF-8 encoded Chinese)
- *   - Impl ID:	0x4D41495832303030 (= "MAIX2000")
- * These values are reported by the SiPEED MAXDUINO, SiPEED MAIX GO and
- * SiPEED Dan dock boards.
- */
-SOC_BUILTIN_DTB_DECLARE(k210, 0x4B5, 0xE59889E6A5A04149, 0x4D41495832303030);
-#endif
-- 
2.29.2

