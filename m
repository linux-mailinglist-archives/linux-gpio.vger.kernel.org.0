Return-Path: <linux-gpio+bounces-11635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE59A4031
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7454C283B9A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBED1EE03D;
	Fri, 18 Oct 2024 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCRJHyix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE5E1DFDAC;
	Fri, 18 Oct 2024 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258895; cv=none; b=Jgxo+oRI/+Cu/tUpSJengZrR9FbIHU40/Ro5wbMfATDfzR4OyQcYyXokRig2j8a1cWZEXkEAKCiWkWaGZs9zH7/5DyRDJBwL0MSUAZuyxxUctUO3f8/DgckhLAxPXlRZ0PGtTsEUKYlGw67j6wu3VbCrHLGnJ8oeYisihJXctlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258895; c=relaxed/simple;
	bh=L5LBOWRbs6RQyopASyxlp/rwUvKWPtIoKIfUqFcMlhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKfOvo5e8M2hRfOXY10oV7Zdj1D3imNdeX1ude0jGKXsdsaEBCleKlp5EOK7ljxHEo6+/TLeGu2hVMRiCofjSRgCfAYovvi5DtgNpTyAjxWoENHHAYa1zT+tqMtEIpinbpB3TeNFE57OCCn62j1LwRZrYK4p1nMMYHt2QhGyQcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCRJHyix; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729258893; x=1760794893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L5LBOWRbs6RQyopASyxlp/rwUvKWPtIoKIfUqFcMlhI=;
  b=fCRJHyix//Qedbi1mm9kSsUFgaeUgX34ZGmtl5FLcrxcJVh1SrifNXbQ
   Bci8POZsyufLG64QQdQ+ROmo3yysMlZsDoCdbEANQgUboMlhz+cJJyxdU
   yeWMirm3ReanvXUFwadgEIpcgrGwB4hWUVonfhMSiImFQ/fs8HmY9ZkEb
   0Pdxh+9Ew89cCxBHQgzzcxzEdWq9MLxP0CWtifI8aDCcq37Dsh5jHNcYk
   UWJZESbsNbutAPI4l1tQAXxnIjB/Mphs3MskMP0rKeHZIIA3ypdf4wk7+
   FxBsRj3FQvhTI/V2XlwqXFgm3jaoU3rkEhBA2h+VfDugx8Cohr4AB1mzw
   Q==;
X-CSE-ConnectionGUID: E3rvXA7tRJS66hgYvE8Bag==
X-CSE-MsgGUID: LDZ0YgZ1RnCIHTpbM/LLKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251447"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251447"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:41:32 -0700
X-CSE-ConnectionGUID: 3CDAcyrCTpCcu9jpJNI0tQ==
X-CSE-MsgGUID: KwAS7hqsTrSZAbt/N55Oxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83935280"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 06:41:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2E0A75A7; Fri, 18 Oct 2024 16:41:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 3/4] gpio: xgene-sb: Drop ACPI_PTR() and CONFIG_ACPI guards
Date: Fri, 18 Oct 2024 16:32:34 +0300
Message-ID: <20241018134129.2058068-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
References: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The complexity of config guards needed for ACPI_PTR() is not worthwhile
for the small amount of saved data. This example was doing it correctly
but I am proposing dropping this so as to reduce chance of cut and paste
where it is done wrong.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xgene-sb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 69faf9b8d460..0ebe3b215634 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -311,20 +311,18 @@ static const struct of_device_id xgene_gpio_sb_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, xgene_gpio_sb_of_match);
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_sb_acpi_match[] = {
 	{"APMC0D15", 0},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_sb_acpi_match);
-#endif
 
 static struct platform_driver xgene_gpio_sb_driver = {
 	.driver = {
 		   .name = "xgene-gpio-sb",
 		   .of_match_table = xgene_gpio_sb_of_match,
-		   .acpi_match_table = ACPI_PTR(xgene_gpio_sb_acpi_match),
-		   },
+		   .acpi_match_table = xgene_gpio_sb_acpi_match,
+	},
 	.probe = xgene_gpio_sb_probe,
 	.remove = xgene_gpio_sb_remove,
 };
-- 
2.43.0.rc1.1336.g36b5255a03ac


