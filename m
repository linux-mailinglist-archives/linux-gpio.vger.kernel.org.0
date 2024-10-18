Return-Path: <linux-gpio+bounces-11643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C599A404F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942C41F29E4E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495A11F4264;
	Fri, 18 Oct 2024 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOnjZezO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E2C1EE016;
	Fri, 18 Oct 2024 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259162; cv=none; b=g6L0pzYoUTWtvGXvr0+u5RqfixPKB4ZXssab94YrtOZQomfda6Gb/40+nvB3CpHdxmWfchWrxbCIjjZyesKVTpsGTzdHXLcELwaWIG1YKc/QO9X2qmxNLKYbD5gN0CFkH4voYGNG4mXV6keaodX4VsG7fasVSc75cz9pQogjYkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259162; c=relaxed/simple;
	bh=URaH5r+2Z/EBWxDLUST/cFlypQmTjNV8T42g/XdctBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6dWxgAm6cGPfS2A3OBYfYiZwKj99GYg3tKuQ548Nwd4lwILzSAiUy/kx9p7PLZcjRDG5qUB9Zm0Y67Eg92Ag4WYuj2YYP9zs2S3+4XC1YocB7qn3IpAja8w0sVOXg4e2XJ8twxfVwsa4K6OxoTUcb02PO0nBAV00lVxI1oS6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOnjZezO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729259160; x=1760795160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=URaH5r+2Z/EBWxDLUST/cFlypQmTjNV8T42g/XdctBA=;
  b=gOnjZezOla/7rV2p9vUQVoAHdeG87vZwTtmi5sfrGiYh6DIRJiezkN8J
   +VqmQchP48wi7AH5ROsjeIcKkC1o4NsJKEE9tQgRFHdc8Gvh5SejJn50d
   ok/9Xnu1kRJx528SqhfNxFEEzCG4nRSGpkKAakrkvTgnFH1ZOEjqgnh3r
   YPVCGYN6gNgSe4DIVpCo1959xYBrHGKy5uTqJSptwvqsBfwLIuumNXuui
   xUitK+RdP4CEfmOudT5rNzzmJ5a3G5mYscB1Bkr+UkKReq9iwjpe8M2g5
   DW1YwnVIUd8P9z6hXuCUb/ojVswb3iVuvQf1y0+LV42u+1MD2uKhw4n52
   A==;
X-CSE-ConnectionGUID: suxrvL80Spe98KzXENPuWw==
X-CSE-MsgGUID: a3cEoxgYRzSY/WAMD09arw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251816"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251816"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:45:57 -0700
X-CSE-ConnectionGUID: zfb3BTEGSOyWsAoWpWLJ5g==
X-CSE-MsgGUID: tLiMKrHeQ4+JnWgLyiMBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="116330956"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2024 06:45:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C3B6F50A; Fri, 18 Oct 2024 16:45:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 3/4] gpio: xgene-sb: Tidy up ACPI and OF ID tables
Date: Fri, 18 Oct 2024 16:45:02 +0300
Message-ID: <20241018134550.2071101-4-andriy.shevchenko@linux.intel.com>
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

Tidy up the ACPI and OF ID tables:
- remove explicit driver_data initializer
- drop comma in the terminator entry

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xgene-sb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 64184d4bd894..206f03a7a7aa 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -299,14 +299,14 @@ static void xgene_gpio_sb_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id xgene_gpio_sb_of_match[] = {
-	{.compatible = "apm,xgene-gpio-sb", },
-	{},
+	{ .compatible = "apm,xgene-gpio-sb" },
+	{}
 };
 MODULE_DEVICE_TABLE(of, xgene_gpio_sb_of_match);
 
 static const struct acpi_device_id xgene_gpio_sb_acpi_match[] = {
-	{"APMC0D15", 0},
-	{},
+	{ "APMC0D15" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_sb_acpi_match);
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


