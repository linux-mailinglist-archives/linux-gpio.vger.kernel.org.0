Return-Path: <linux-gpio+bounces-37771-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMvhC8djHmrCiwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37771-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:01:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8926284C5
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6864C300C336
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 05:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37752C0268;
	Tue,  2 Jun 2026 05:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1BXafDc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BDD24EAB1
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 05:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376516; cv=none; b=Tod01JZL8sZPwWdhfSR72bOGyEyAF+QiwrRVITzvXwTrzCP/t8cFwRWCunkuZcBiY9xnQJWgxxmLzIvVgocB/vJYGShSx8h9W/mDF5S+FmnysE0k2Ar1rp1q8Zeb0+6ykqb2YYZeRIQ5OkZAtYpixy9VmMDyI60kQ9GEQSWCQ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376516; c=relaxed/simple;
	bh=Rt3qyAEsfIkqikUW7PnMXRyV+OkDzZSUzNZRyxUvaVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDaVHIbQfce3nv90pfPq0eA/pgjl4PdMCVFpkXtfMHNfu0Oz2j1ijFhI6kZCTnO7wJwBiO95PrMAc3YvLrd67j4qSjRyp9c6pNNWEIUq85oIeEkNjdD0FMv6B15kDs25sSA7WNXWamwZ3acvYu5tSCa0fAD1XTroWzZ+aF/bVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1BXafDc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8585cd8400so941563a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 22:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376513; x=1780981313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGFxNfjzZNv84pjFOZFMUu5zdOh74zYkDbHbwTMiiog=;
        b=b1BXafDc0fGK0hWa7kK4Chr1gfgsRTIG2XDPEs5KaFkfrQV6QXwI7vyqRa+UHZGK90
         /OHk5oZIfj4mif57conuc+h9+VHC3IutRjgjdLA23ZamIlONvUKmGvTNlGF2dHeJlHHA
         cx/gu8+jGjMTGYy0KJ4qlmU5EaVxFipU951IQqjt/sO7yonyJHQmeU4U26MX3GG2sFgC
         WGdBBFYtNFGDv0FIO80kRsUoDfZEYm1kuzsAMdYISxbDfUm6q3W3HIQ7YNQcpBbFLaPg
         w7U1FkXZIoywEjIEOaPczHpp9+nmkoUVu1gKPuUUTe5LrvBF33qfpu55w9H/8fZAkj8V
         PVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376513; x=1780981313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wGFxNfjzZNv84pjFOZFMUu5zdOh74zYkDbHbwTMiiog=;
        b=dgRmQO1Xvdh3HDaxWSg7RoVbCwpDQGVw3BAX/uDINN0xE3d0GYob9hP1YIsNpHheE3
         ZFIZl0aiYLlc5kohUJFyiifxwdSo3YGXU5E6tkNHuMs3Ch05c05Y7ctR16stSbPQasEz
         dCuzrk3Ve3NciyzHhCgKf/ID8YO/PqmB3t3tu2KcA8B5WFileEXXLzYqMVQo4fgOYnfT
         v9AwUPRRkSBywVP8/kpPnJtjF7IwumjRlduFgWZaJyYMyGeHNau8ML4UMA9/Dlxi1/KL
         Uswe0ebX0Dlr6jAWOt90uyL1qXCjCnz35zoyxZICVIXpjMbo41sforv5fWqqAQDKaiDJ
         HqGg==
X-Gm-Message-State: AOJu0YzREFLUR7zptWMAfsjvlicz4IuUYaGOJxzHenS9ZHK4i/gDZbhj
	LlnrQWUFKcH5bLpUe8wPCuzv6oCF81ELkOd4p0MruLCosA4r66l1ZYXmApUx+zRI
X-Gm-Gg: Acq92OE8QflocMsUBWItPENmKsMP1qOBqe7HP99g4ZjN8CrYwRLm3Jy1o7DHonHOXFj
	Ak5usXUJ6MxLeEF+eAYGaoHupyfzdcqQQsofkZqdXGb36vg/Vsior/BGO0+JHNsyvFAkmFk7sBF
	bEXIqIUyOVsZCxT2lEC+AYT0+PmCwCxjorDlEAACDiP9AUrhDRyvQneoCF1WYGrm0wSJ4+2U7n1
	qBde7AIagqSt9l5xYU8e8Olh1W6w70jaJmC9ykWwlP66eGZqfYimW8S9lBYBSd1ybmS3prp04fq
	JByA2e7EXFukpGvTyENyWr8T589PdEKYS1bF7TlyAM1hCtk7Hip7RIdIdPDFU0crStR5L7rp77e
	ZiXobUdnEVA0ukSIYllxU1GxIO3om6vlYY7GTD5eQck9TCOjwIitUT5wbgM1n03X3MJtDdSV3FB
	XkpxSoN5+HJdbOOS6MITAk8NjNWplq1y89XRzY7EpQA6WZyNSlh8jngTsjQ0VJXQfUsDUC62P40
	W6EyJPEXO/ykZeD/F7ZDj8N4kTd3bwssCyBuqdobfhbug==
X-Received: by 2002:a05:6a20:da11:b0:3b2:9360:4598 with SMTP id adf61e73a8af0-3b427e62c76mr16236422637.7.1780376513384;
        Mon, 01 Jun 2026 22:01:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8589d055c7sm8958467a12.9.2026.06.01.22.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:01:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/7] gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
Date: Mon,  1 Jun 2026 22:01:25 -0700
Message-ID: <20260602050131.856789-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602050131.856789-1-rosenp@gmail.com>
References: <20260602050131.856789-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-37771-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BF8926284C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the ppc4xx gpio driver out of arch/powerpc/platforms/44x/ into
drivers/gpio/gpio-ppc44x.c. The driver has no architecture-specific
dependencies and follows the same pattern as other PowerPC GPIO
drivers already in drivers/gpio/ (e.g. gpio-mpc8xxx, gpio-mpc5200).

- Renamed Kconfig symbol from PPC4xx_GPIO to GPIO_PPC44X
- Updated ppc44x_defconfig and warp_defconfig to use the new symbol
- Marked the new option as tristate (was bool) since the driver
  supports module build via module_platform_driver()

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/powerpc/configs/44x/warp_defconfig                   | 2 +-
 arch/powerpc/configs/ppc44x_defconfig                     | 2 +-
 arch/powerpc/platforms/44x/Kconfig                        | 7 -------
 arch/powerpc/platforms/44x/Makefile                       | 2 +-
 drivers/gpio/Kconfig                                      | 8 ++++++++
 drivers/gpio/Makefile                                     | 1 +
 .../platforms/44x/gpio.c => drivers/gpio/gpio-ppc44x.c    | 0
 7 files changed, 12 insertions(+), 10 deletions(-)
 rename arch/powerpc/platforms/44x/gpio.c => drivers/gpio/gpio-ppc44x.c (100%)

diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/configs/44x/warp_defconfig
index 5757625469c4..d6014b9c5708 100644
--- a/arch/powerpc/configs/44x/warp_defconfig
+++ b/arch/powerpc/configs/44x/warp_defconfig
@@ -12,7 +12,7 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_EBONY is not set
 CONFIG_WARP=y
-CONFIG_PPC4xx_GPIO=y
+CONFIG_GPIO_PPC44X=y
 CONFIG_HZ_1000=y
 CONFIG_CMDLINE="ip=on"
 # CONFIG_PCI is not set
diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs/ppc44x_defconfig
index 41c930f74ed4..b0c7ad8c6d9b 100644
--- a/arch/powerpc/configs/ppc44x_defconfig
+++ b/arch/powerpc/configs/ppc44x_defconfig
@@ -22,7 +22,7 @@ CONFIG_GLACIER=y
 CONFIG_REDWOOD=y
 CONFIG_EIGER=y
 CONFIG_YOSEMITE=y
-CONFIG_PPC4xx_GPIO=y
+CONFIG_GPIO_PPC44X=y
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
index ca7b1bb442d9..4598d8b89bf4 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -15,4 +15,4 @@ obj-$(CONFIG_FSP2)	+= fsp2.o
 obj-$(CONFIG_PCI)		+= pci.o
 obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
 obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
-obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
+
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 89c77ec6c205..77991da43ec1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -593,6 +593,14 @@ config GPIO_POLARFIRE_SOC
 	help
 	  Say yes here to support the GPIO controllers on Microchip FPGAs.
 
+config GPIO_PPC44X
+	tristate "PPC44x GPIO support"
+	depends on 44x
+	select GPIO_GENERIC
+	select GPIOLIB
+	help
+	  Enable gpiolib support for ppc440 based boards.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 8ec03c9aec20..9e8c9ca1d3fb 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -146,6 +146,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
 obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
+obj-$(CONFIG_GPIO_PPC44X)		+= gpio-ppc44x.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
diff --git a/arch/powerpc/platforms/44x/gpio.c b/drivers/gpio/gpio-ppc44x.c
similarity index 100%
rename from arch/powerpc/platforms/44x/gpio.c
rename to drivers/gpio/gpio-ppc44x.c
-- 
2.54.0


