Return-Path: <linux-gpio+bounces-18845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8760A89B97
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05DB044057C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1531291144;
	Tue, 15 Apr 2025 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="houx5ImR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9E928E609;
	Tue, 15 Apr 2025 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715559; cv=none; b=hSKca1g2P+mMUJv+Ui5DcbCOVAZeqmqxdx8pgGR3DnBnrGOO8/UvlvmZ+VI/KbC2cW+TJSRABH3enUeEC6/1R893yTfrc0FtYnEp/ucaH86U/rRlv074nsJP8Vp9/eMAuCymojVNUnY1JTNKl4LCAS+ceI7mqmjnnPkYeTGZaHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715559; c=relaxed/simple;
	bh=gB8yrvSA/Ovks1vLezMGhbV76PrOeLE5o74xpf5wfbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8PJfBj10SqlyNsqoa8hsAvtcE2JxtwoqxFVpB2AO1dxm/URwcPrKKxJs9AG1boNZQJdx2yY7E1RUzvfZUdcxU5WuQGlkSBEyfI83tQNHo1jggnPeSTJTqa8v18aij+fLtSX1MQYZD8wUpNwk1QeQuGFLsxyFB0l0Ke/1pv2fEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=houx5ImR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744715558; x=1776251558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gB8yrvSA/Ovks1vLezMGhbV76PrOeLE5o74xpf5wfbA=;
  b=houx5ImRSK6Pck0HAdc42opG6Ydb+II6gAEn1w5Q9O2pPKD1se8XcSZ1
   /+oBRIyv0e09yvptMIXSF0UurjqmZbGohFC/A2d67wC8sAT/knWtoqU9R
   mQPj2Cds+NrSkyVh7eQlNB+oYA0ucziLFS64py9NVvi/6BPYV3sgrUyX/
   Z9QzuUuDfzw5qzE2qZ/EscCSIUzFZNpM+rHa1JxmHQNN+pyZbTR6rlpmI
   N2dIDWWGRLqr5wCbFmzPh701laj4hfwLh75cBAy2sWLbIozdN1nC/OvVM
   I9MVhUjqoE3rTtfDF46fiJd0n/IBMb5NvHhjgQF0E2n69DfsjVT6lAluA
   Q==;
X-CSE-ConnectionGUID: u4r/CQ1IRiyD2jkexUFDOQ==
X-CSE-MsgGUID: G5icWeb0Sn6l79MTKUy5XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57601856"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57601856"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:11:29 -0700
X-CSE-ConnectionGUID: 31tnkVkfTvqRcAogELzw4Q==
X-CSE-MsgGUID: a8x0+hsrQfCne1w0ySI/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161071611"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 15 Apr 2025 04:11:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AA57517B; Tue, 15 Apr 2025 14:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/7] gpiolib: Print actual error when descriptor contains an error pointer
Date: Tue, 15 Apr 2025 14:10:00 +0300
Message-ID: <20250415111124.1539366-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the actual error when descriptor contains an error pointer.
This might help debugging those rare cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eb94428af6c0..0089745b381f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2445,7 +2445,7 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 		return 0;
 
 	if (IS_ERR(desc)) {
-		pr_warn("%s: invalid GPIO (errorpointer)\n", func);
+		pr_warn("%s: invalid GPIO (errorpointer: %pe)\n", func, desc);
 		return PTR_ERR(desc);
 	}
 
-- 
2.47.2


