Return-Path: <linux-gpio+bounces-16892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8AA4B73E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 05:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593281888E84
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 04:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5DA1E7C32;
	Mon,  3 Mar 2025 04:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbOTC9QV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92541E5714;
	Mon,  3 Mar 2025 04:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740977283; cv=none; b=qZDouUakLpjL+UM71i4JD+GQtS5qooY50emPzID5TRFrFeUlfoJ5Dke1ledn2cGijDXiNqh+ORrI/QsPgruEua1qJXV/PS5eLITVUqp+LwjOlWUxQDBFM/DVF2MVVgwywBMup3aLMf1pzO8rUwUUrMmcv5U6euL9f9+ywzzmJMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740977283; c=relaxed/simple;
	bh=yRACNcqql97q+efeIS5QfsCUY4jQh++OfyCum2WBK0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xjp/EU3cMviRNsC2l0iKUigjWvYhsJ/l8cozFmGxU1r6HNZh2eRmB7qH7S8xWcBjgyN1kRKTFFufCphhumgSL099YLzzfopCHXpZ4YQ0E+OHv6Nd44gFb7mb8CUxzHNlgKuQvHfEAPbSo1eU+UFiRChBbaXbyGOkpTuRYMgZlH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbOTC9QV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740977281; x=1772513281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yRACNcqql97q+efeIS5QfsCUY4jQh++OfyCum2WBK0A=;
  b=EbOTC9QVfp3FyfmeOf3PqOd8OghrWD6jM2/+m2L3kL7qPcNKsu8L8xXH
   ZvCYKG99vluz2ueQjeu/iflZ0TFmtLdgQpMbx3h/YIKE8HEoSV4lXK38B
   CKxrp904GlKqyrAXaNk1FDrw+z4mv0SZWTkXaMp4XbaA3dLVErzKWywOx
   PVCgJmGNhbZ9MLTl/mng9Tc5JHd+mluULhbY/T/L5CvSGQwmI+hIeApi+
   VXefMGDGRuHry9sK58Q9CVW7W9sGgHntMhlI9Loq5oQgjaS0MMBFi77hO
   5DOW4TJGhLhrKn138n5tS15LeS3rWYj/xAxX1PZbdx0jatMKMf/a1x/xe
   g==;
X-CSE-ConnectionGUID: WJCQsNdoR12bpFPFP7Yg9w==
X-CSE-MsgGUID: 2BCNiu2QT1m4D5BQSBsYPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59382092"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59382092"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 20:48:01 -0800
X-CSE-ConnectionGUID: zHKP/mAXRAO72IJRguYZDg==
X-CSE-MsgGUID: C+lMtO/6S8CkGHObHw5qwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123123972"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2025 20:47:59 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 5/5] pps: generators: tio: Introduce Intel Elkhart Lake PSE TIO
Date: Mon,  3 Mar 2025 10:17:45 +0530
Message-Id: <20250303044745.268964-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303044745.268964-1-raag.jadav@intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
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


