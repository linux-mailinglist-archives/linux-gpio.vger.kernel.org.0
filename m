Return-Path: <linux-gpio+bounces-17221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A78DEA55FE6
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 06:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A3F189240A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 05:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C0819DFB4;
	Fri,  7 Mar 2025 05:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtSl7cvB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0CC193409;
	Fri,  7 Mar 2025 05:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741324988; cv=none; b=E39zaF959JxeSG98CeIaMbaatmP/Xwk+zKBDxCRz1hSbfaiP/PdSG/ahLfNUVY8i7wMGaDb1JKWeO8/MrFMVCbIcy9+quwg+6FGD1Rzi1u1MaNQJKnDXaln3PPM1GoRoOMYnw7KHC/LCELvCVZ197FopE1Xe87nZ6vA6jPiifW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741324988; c=relaxed/simple;
	bh=yRACNcqql97q+efeIS5QfsCUY4jQh++OfyCum2WBK0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gsdqTSkv9WZn+Zd/t2Bpwl92qsjbCQ8CuzYSLi5vpXByYCjrjy5V9J6bHZK01sz+aMXBlEzeBp6ilYuj+ZDq8CFaCXCYjGjL8sRaZC2LPjxxG995KMnNrO1jVWcsVfgzmztasU9/nH+Va7ZX54xwAetC9XPfHV6wi9WxppEkP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtSl7cvB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741324986; x=1772860986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yRACNcqql97q+efeIS5QfsCUY4jQh++OfyCum2WBK0A=;
  b=MtSl7cvBmnE7tV3sO950CtfBBq/JpZE9OMRT26ngrw7MYJKcgzzQCoG3
   HkBGFmbN4xuphKfaUNy5Kla9wzKOXuRcpHjBjkgIzwY3aQj2R2QGMSafT
   tz4c8oW9I+D5yjA4ny5NxbtpPRE4Yw6qMp73htkNtSOjzFknRmnohG9fw
   cJQA0CdYwIgd2fi4/D90/iWry89JgR0JcbVlmDNleKfl1eSvvXZtB9g+n
   5HUy8QqUo9WHheJnhA/gwOyH0r0kSA6cxx1mx/7nSuGWgI3qnFm2b210x
   JCcUiMDw6GlHeX3WSUIeWVUhjpvkImyXLgZRUs0PXIODxqPhiI+oe0v0u
   Q==;
X-CSE-ConnectionGUID: ZSATlldmSw65pA8XP8pjGg==
X-CSE-MsgGUID: CDGAnqwbR6eMAdc06XZAfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46292963"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="46292963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:23:06 -0800
X-CSE-ConnectionGUID: KFZj6rGqS0+RorPTls+kaQ==
X-CSE-MsgGUID: wh4osHZlSeaf1+qOrRfr4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119232193"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 21:23:03 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 5/5] pps: generators: tio: Introduce Intel Elkhart Lake PSE TIO
Date: Fri,  7 Mar 2025 10:52:31 +0530
Message-Id: <20250307052231.551737-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307052231.551737-1-raag.jadav@intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for Intel Elkhart Lake PSE TIO controller.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pps/generators/Kconfig       |  2 +-
 drivers/pps/generators/pps_gen_tio.c | 17 ++++++++++++++++-
 drivers/pps/generators/pps_gen_tio.h |  5 +++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/pps/generators/Kconfig b/drivers/pps/generators/Kconfig
index b3f340ed3163..83aada693ad2 100644
--- a/drivers/pps/generators/Kconfig
+++ b/drivers/pps/generators/Kconfig
@@ -33,7 +33,7 @@ config PPS_GENERATOR_PARPORT
 
 config PPS_GENERATOR_TIO
 	tristate "TIO PPS signal generator"
-	depends on X86 && CPU_SUP_INTEL
+	depends on X86 && CPU_SUP_INTEL && MFD_INTEL_EHL_PSE_GPIO
 	help
 	  If you say yes here you get support for a PPS TIO signal generator
 	  which generates a pulse at a prescribed time based on the system clock.
diff --git a/drivers/pps/generators/pps_gen_tio.c b/drivers/pps/generators/pps_gen_tio.c
index 6e3a4b198259..a2a23cdc2568 100644
--- a/drivers/pps/generators/pps_gen_tio.c
+++ b/drivers/pps/generators/pps_gen_tio.c
@@ -231,6 +231,14 @@ static const struct pps_tio_data pmc_data = {
 	},
 };
 
+static const struct pps_tio_data ehl_pse_data = {
+	.regs = {
+		.ctl = TIOCTL_PSE,
+		.compv = TIOCOMPV_PSE,
+		.ec = TIOEC_PSE,
+	},
+};
+
 static const struct acpi_device_id intel_pmc_tio_acpi_match[] = {
 	{ "INTC1021", (kernel_ulong_t)&pmc_data },
 	{ "INTC1022", (kernel_ulong_t)&pmc_data },
@@ -240,9 +248,16 @@ static const struct acpi_device_id intel_pmc_tio_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_pmc_tio_acpi_match);
 
+static const struct platform_device_id pps_gen_tio_ids[] = {
+	{ "pps-gen-tio", (kernel_ulong_t)&ehl_pse_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, pps_gen_tio_ids);
+
 static struct platform_driver pps_gen_tio_driver = {
 	.probe          = pps_gen_tio_probe,
 	.remove         = pps_gen_tio_remove,
+	.id_table	= pps_gen_tio_ids,
 	.driver         = {
 		.name                   = "intel-pps-gen-tio",
 		.acpi_match_table       = intel_pmc_tio_acpi_match,
@@ -255,5 +270,5 @@ MODULE_AUTHOR("Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>");
 MODULE_AUTHOR("Pandith N <pandith.n@intel.com>");
 MODULE_AUTHOR("Thejesh Reddy T R <thejesh.reddy.t.r@intel.com>");
 MODULE_AUTHOR("Subramanian Mohan <subramanian.mohan@intel.com>");
-MODULE_DESCRIPTION("Intel PMC Time-Aware IO Generator Driver");
+MODULE_DESCRIPTION("Intel Time-Aware IO Generator Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pps/generators/pps_gen_tio.h b/drivers/pps/generators/pps_gen_tio.h
index 4329b6dbd598..509bd2633dfb 100644
--- a/drivers/pps/generators/pps_gen_tio.h
+++ b/drivers/pps/generators/pps_gen_tio.h
@@ -18,6 +18,11 @@
 
 struct device;
 
+/* EHL PSE Registers */
+#define TIOCTL_PSE			0x00
+#define TIOCOMPV_PSE			0x04
+#define TIOEC_PSE			0x24
+
 /* PMC Registers */
 #define TIOCTL_PMC			0x00
 #define TIOCOMPV_PMC			0x10
-- 
2.34.1


