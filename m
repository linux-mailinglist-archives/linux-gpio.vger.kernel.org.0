Return-Path: <linux-gpio+bounces-11637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC89A4034
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62CA1F299A0
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259EA202F75;
	Fri, 18 Oct 2024 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DY2QMddy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA41F4265;
	Fri, 18 Oct 2024 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258897; cv=none; b=HpbG6u9FEto6JMf7vu+6bNaDqocNTnezIeFGGjKp9qpu9fXlVtpeTZesqPsenvmAgpdgAfjAVuIb94ULJVOmKg08AEkXL428eyGPhS7bhqKuVJtTeVh9guilkZ+mqCuaxdVloEvuX4OGM/ktkeEWGcjOkQTL55ps3i6eAdg4txA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258897; c=relaxed/simple;
	bh=BMKOrCU5z2rmEQgUEoHRlV/x9cOoFl97PDC+MzdSL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxeJZjMSmi6n7mpGQpndWbiKZWKLBl7zXkCXIv1njMcwgX8qsPXYlM4M7mzNdJ34hx9ayHoqaVdd+v2aLBJRQErjAH5loeheFj/O6B/ET8ob1za+Aer5MU/WabTbkH3sqMlNoNh6GMRNHey/3IqccDltkok5FsqKKxzwYYC7Bv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DY2QMddy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729258896; x=1760794896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BMKOrCU5z2rmEQgUEoHRlV/x9cOoFl97PDC+MzdSL7I=;
  b=DY2QMddy/lBFle06w8ZtK4p2j0fdXx7bGqMry9obw1EXfsuI2rnOTuP5
   stWPhs2vRb6L7xwhkV7VtGzntdqsLsvNynlWrwW0XANeRSWBccrpNdPXq
   ymi7vsXK5WRplCs0GoSfjTaiMlBeWydAHya7FiEfaTZlcImx6M8l4RZWK
   SfJpqtJ/nxZ9M0LcHMBOa4EBqIzQ3X9157MMOJRggLWDKDMRZ7Y7XPTz6
   mpMFxLf5bfa4PQ9CvXMhThVYxLNt7WRroKwoto2ynsJ8a/oI/YPWByqhb
   c2wywdawlzsCYLDKnY8Cz5TKpQIg6WyispSIY0V/ipUmM8uWel5z5pbNv
   w==;
X-CSE-ConnectionGUID: IZdl7NxqRjKt8nOh/zY+Gw==
X-CSE-MsgGUID: l0rt+2IJRLy0+OOGLmoT1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251454"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251454"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:41:33 -0700
X-CSE-ConnectionGUID: 34YAGRVcT92LgWs0LEtLug==
X-CSE-MsgGUID: JMM3dTlJTRqkT/MJVPSerQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83935283"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 06:41:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 38FDE5C3; Fri, 18 Oct 2024 16:41:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 4/4] gpio: xgene-sb: Tidy up ACPI and OF ID tables
Date: Fri, 18 Oct 2024 16:32:35 +0300
Message-ID: <20241018134129.2058068-5-andriy.shevchenko@linux.intel.com>
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

Tidy up the ACPI and OF ID tables:
- remove explicit driver_data initializer
- drop comma in the terminator entry

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xgene-sb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 0ebe3b215634..48b829733b15 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -306,14 +306,14 @@ static void xgene_gpio_sb_remove(struct platform_device *pdev)
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


