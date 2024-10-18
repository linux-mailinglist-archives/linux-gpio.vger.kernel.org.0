Return-Path: <linux-gpio+bounces-11642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD999A404D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B54A1C23C3A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D114F1EE022;
	Fri, 18 Oct 2024 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JI6Ly5Gd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA81DED5B;
	Fri, 18 Oct 2024 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259161; cv=none; b=jqfxtxELrpsLt8Xz6xxQhAVMUQM5jopgiCKNl+50aQcEc5KuzUwa77JxNiQixPj0El+i+vcWkpt6ahf9db8bDqMmLKJJw+R3eI/Psu+1JqcGF2ZjzzpgQj3qtONBvAZxsWGY35yT6mRy6Kq+Lcg52Ilxe4DPWauRDuUniHbYDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259161; c=relaxed/simple;
	bh=a1pikMagtZ3E4LGz3brHL96nlJ188/vghvozaR6VDL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9tKUdEezyyPoueVIDTEIGxZR/2ljRYB6HHdg7KlVH+AhbberHqbOTs9xniP1n145VUprqGkAaoBgCmTZzu2p4IsiZ29W1jHcZPXbVJN5nKeTzZUNfYH7fe5MINBvZRNhi7xWCLk6wXLNKjtgPpUq3x+mlWan9VGaGh2KUNoGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JI6Ly5Gd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729259160; x=1760795160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a1pikMagtZ3E4LGz3brHL96nlJ188/vghvozaR6VDL4=;
  b=JI6Ly5Gd/e767Zlwcay95CE3DHobK3/3sfVscttuPngcPf4505FAOndV
   8fvASPDZ//Kin5LlHYHQ9gXGgtEoyGgWoBsxSAVcDNC7Chn/3jVwg5oaU
   zLTHwuTZowuPHTOiZIHGeR/qmbcWsBFRLxEGYMRFLF6VGvbbwSSgdmkr6
   DX0ErsV/QqK+MKoelv8JjNjJ1e6UOpyJvNoEkK1sR00aFjDM8lIE4wUeC
   jSb9b2jeHrJwssN+TOJYM/g5rCq1mpeOiCtxZzOmOaHk01vGZwUe7/tnQ
   UrSAWA1iYvKu21y4iZgaRikT+YKQB6SYZ2A6+lOuNjjBIKb7qO9NZ4D49
   Q==;
X-CSE-ConnectionGUID: kBQZ6Is5Tfiui9065DMnLw==
X-CSE-MsgGUID: 7zyUa+XZT9yppcVY16NKCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251813"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251813"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:45:57 -0700
X-CSE-ConnectionGUID: 0pfg0omXQ2Ca9TGecB6Dlw==
X-CSE-MsgGUID: He8DiI5iS7Wd62rS46RMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83936182"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 06:45:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B81553F0; Fri, 18 Oct 2024 16:45:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/4] gpio: xgene-sb: Drop ACPI_PTR() and CONFIG_ACPI guards
Date: Fri, 18 Oct 2024 16:45:01 +0300
Message-ID: <20241018134550.2071101-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
References: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
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
index ae592528001d..64184d4bd894 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -304,20 +304,18 @@ static const struct of_device_id xgene_gpio_sb_of_match[] = {
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


