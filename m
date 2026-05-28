Return-Path: <linux-gpio+bounces-37605-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLk+DyGwF2qiNAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37605-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 05:01:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D095EC082
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 05:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA308301A721
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 02:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5912FB632;
	Thu, 28 May 2026 02:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjZqr3oU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2E2EBBB9
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 02:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779936990; cv=none; b=NT0RYovWKAyfW+Tjr/qk0BD9O3ZvCh2jHEKXt4HerI34roGz1ll1P75ye9mimZCybws2Gpl29/53icKfdCtUT3YBaE4a6K+H6jRi0A8vZ9tQ0VDqUGRK2WSxmaMyQ8iV8CX9byzdx9P3oxOqM9doKBhtO2ZMJNvGtHLdEXmSjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779936990; c=relaxed/simple;
	bh=RtKJTZmldIjbaeHHkSvGI7P+ztIeiydU/gRlT46TJm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3u1kRjIb07eB5x4P8NE1YGtCRLjdzbyVfMYge0/3X3rMzq9s3XTF5yLqJBZ5N+bVksu+PN9F2JVV2CTzsDM24SSDz6Sknqz+tP8tgsseYPnbdsFVpl9wIzApOoGAbP6e1JP36rAkwJsKJDqIxu4x7jpS0+lhzszZAzn6msf6BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjZqr3oU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b941cd869cso80064805ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779936988; x=1780541788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++y4V+PCFusmclNoA0SYoxyTSV13piJXd/yLDVj40Rs=;
        b=AjZqr3oUoWvZg3WNN+2iZcdv8gtyxjdPabEsg/uPs1qM1KtAgKuk5GrvilwIYidHBH
         JKI67tCjdEdHhupeKEfnSh2BzjC+rmeNhoEt05uJgNFgPV1CVwOlYFgl1dzg3/EZ5x1H
         YNkSq2iUTKoEgB4FPloJwVw5JzZh19VVzjlZWsJyKFXmcspFCSWKnWwjA95QifMq/v5z
         8/76Enb1rvNypgGqRaRkxNrQUvQUD3ouF+2E7EH7uiS8dIzqxznjAkndQi1khwY4Uj82
         nVcq3cihmGElLhv/QwGa/tNmi9LS85jeanWj74tuulTn8w3DZV7ImIHzBxtnWBbiMCTK
         Xowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779936988; x=1780541788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++y4V+PCFusmclNoA0SYoxyTSV13piJXd/yLDVj40Rs=;
        b=q+S/eduL5UBC324M4XwXVw8A4/Fk2vzYphUMiVHrdz9lSjrCQ7YORzpCxbLTbfQyyk
         DjMBMqTE6/ubJCSXLg7N7mbRBu2hO7rZhuBDt3BlhoZIeLmnV2VytsdOvo6uyyx/uldC
         ZOMCuqp+5lt4CxKvHdyjC0jm1TyDoYGht1+f+NAf3zLFqPm7fCV2d7vHTRTpGL7RrV78
         aCQ0TZcSB73q/WTWEqUKqpxSYG/yGs1w0GshbUwJ5Al08ssdxFbpe1qOHnrBgA917vvb
         Gme4kYKEaq4OXGhyqIOtO/aILVTnak0BiPy/GqKF5nU9LT+voUdtbSJDZW2RnGlwqhVT
         eWFw==
X-Forwarded-Encrypted: i=1; AFNElJ8FhAgkUFyQ/8nR35TqvmfOwmPqdtJ1iEWRf7KbQoDST4CLY+a4BjtrxpDSuD1dYolvizHCH7+SwkX8@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8PhCa+wL2K+kziWQ+3RZbpRGfCIVLNQOXUqvtJdwCiu2xD7q
	uG/PpYB093NtnAflx98HR2jFGbPL2PZNK6KxJxoK7dfk9rmQxRbg0RoB
X-Gm-Gg: Acq92OFMUCWA+z+KJp6/w/wBfEtfLjz21bbx7wqwyzswrampCSpVecGx0hAXPp1ErY1
	FoKj4FRL+jyaCtEdKYPzet8WM3pvyDMv7TT/etS3IUaLQyIeq8yz5FlKaFAWFO1ebze69p0IL1b
	99MjJnR51c9nRyAqpEfPT9liTgx+6OGMmqBfs4Hu3VlB42zEYgU3O1bqYj5yMeZjbyhltu5DXXa
	MMpoFMWQrPJqmQZ23Gt2Qmybk2pMIgMfXwldIwCMIKMGox5oVv3wnMfcVee1pGFxwduy1G4cS4c
	pjD+uXZnXJ6sg2IVGZHirI4p1vmgce6pN4RhSX1NA0Vv84jrw2Z4UVJoJCACWSxLLpd3h2DIAB5
	vm78544ZOpEKg5SBVLAkvd++JggKlOYAdUBmcD5Et21Wrt5GHt3JW4AAav2OCFV2H24W6/UdMtf
	SQ8+KHBphJZWVmBHOn9SuYImjYVQ34QsW5SBLwY32byhXBQSUHxsJ152z3USMhWspbPXIevtwRi
	TVn88bXpYqX+mmonM88i/TIbUzLWsXdM78WW/udULQddQ==
X-Received: by 2002:a17:902:db0d:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2beb0698547mr284042265ad.24.1779936987896;
        Wed, 27 May 2026 19:56:27 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:b235:9fff:fe2d:7319])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c49b2sm160080275ad.60.2026.05.27.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:56:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM)
Subject: [PATCH] gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
Date: Wed, 27 May 2026 19:56:10 -0700
Message-ID: <20260528025610.713514-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37605-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,disroot.org:email]
X-Rspamd-Queue-Id: 91D095EC082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the ppc4xx gpio driver out of arch/powerpc/platforms/44x/ into
drivers/gpio/gpio-ppc4xx.c. The driver has no architecture-specific
dependencies and follows the same pattern as other PowerPC GPIO
drivers already in drivers/gpio/ (e.g. gpio-mpc8xxx, gpio-mpc5200).

- Renamed Kconfig symbol from PPC4xx_GPIO to GPIO_PPC4XX
- Updated ppc44x_defconfig and warp_defconfig to use the new symbol
- Marked the new option as tristate (was bool) since the driver
  supports module build via module_platform_driver()
- Added COMPILE_TEST support. Needs PPC as clrbits32 is in use.

Assisted-by: OpenCode:BigPickle
Signed-off-by: mangix <mangix@disroot.org>
---
 arch/powerpc/configs/44x/warp_defconfig                    | 2 +-
 arch/powerpc/configs/ppc44x_defconfig                      | 2 +-
 arch/powerpc/platforms/44x/Kconfig                         | 7 -------
 arch/powerpc/platforms/44x/Makefile                        | 1 -
 drivers/gpio/Kconfig                                       | 7 +++++++
 drivers/gpio/Makefile                                      | 1 +
 .../platforms/44x/gpio.c => drivers/gpio/gpio-ppc4xx.c     | 0
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename arch/powerpc/platforms/44x/gpio.c => drivers/gpio/gpio-ppc4xx.c (100%)

diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/configs/44x/warp_defconfig
index 5757625469c4..380fa15af68d 100644
--- a/arch/powerpc/configs/44x/warp_defconfig
+++ b/arch/powerpc/configs/44x/warp_defconfig
@@ -12,7 +12,7 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_EBONY is not set
 CONFIG_WARP=y
-CONFIG_PPC4xx_GPIO=y
+CONFIG_GPIO_PPC4XX=y
 CONFIG_HZ_1000=y
 CONFIG_CMDLINE="ip=on"
 # CONFIG_PCI is not set
diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs/ppc44x_defconfig
index 41c930f74ed4..57a7342232d7 100644
--- a/arch/powerpc/configs/ppc44x_defconfig
+++ b/arch/powerpc/configs/ppc44x_defconfig
@@ -22,7 +22,7 @@ CONFIG_GLACIER=y
 CONFIG_REDWOOD=y
 CONFIG_EIGER=y
 CONFIG_YOSEMITE=y
-CONFIG_PPC4xx_GPIO=y
+CONFIG_GPIO_PPC4XX=y
 CONFIG_MATH_EMULATION=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index fc79f8466933..150813cea945 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -227,13 +227,6 @@ config PPC44x_SIMPLE
 	help
 	  This option enables the simple PowerPC 44x platform support.
 
-config PPC4xx_GPIO
-	bool "PPC4xx GPIO support"
-	depends on 44x
-	select GPIOLIB
-	help
-	  Enable gpiolib support for ppc440 based boards
-
 # 44x specific CPU modules, selected based on the board above.
 config 440EP
 	bool
diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms/44x/Makefile
index ca7b1bb442d9..179468a00f5e 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -15,4 +15,3 @@ obj-$(CONFIG_FSP2)	+= fsp2.o
 obj-$(CONFIG_PCI)		+= pci.o
 obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
 obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
-obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317..b87d2329900b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -584,6 +584,13 @@ config GPIO_POLARFIRE_SOC
 	help
 	  Say yes here to support the GPIO controllers on Microchip FPGAs.
 
+config GPIO_PPC4XX
+	tristate "PPC4xx GPIO support"
+	depends on 44x || (PPC && COMPILE_TEST)
+	select GPIO_GENERIC
+	help
+	  Enable gpiolib support for ppc440 based boards.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b267598b517d..192242988ecb 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
 obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
+obj-$(CONFIG_GPIO_PPC4XX)		+= gpio-ppc4xx.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
diff --git a/arch/powerpc/platforms/44x/gpio.c b/drivers/gpio/gpio-ppc4xx.c
similarity index 100%
rename from arch/powerpc/platforms/44x/gpio.c
rename to drivers/gpio/gpio-ppc4xx.c
-- 
2.54.0


