Return-Path: <linux-gpio+bounces-15378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E3A2870D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D69B7A5C92
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEEF22B8DA;
	Wed,  5 Feb 2025 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2ccaXfV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D20C22ACCA;
	Wed,  5 Feb 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749178; cv=none; b=RFc99IBQCH2TmpKtxX6LFXSg5m7vILbJaltCxMEX8lxlylLy6CAKtkFtQb6RSqpwW/SYYlxinYvZw4FKUplbj8O8zeYlQi0MQqMMyNO+14TVdWq32t58nWHrPTXnU43YLIGkI5BMDaVHEROUxcKHJ1GvuTnK02OXkVTwXEX98ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749178; c=relaxed/simple;
	bh=0MoEI0eBIjLxlnT1eDS9MskS78jdqEckyg9PwNiDdyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdZ0gioNvTYKFfRJNGMMjtmtsoKYpS3O9O0BzOwbOx6JO39JEJY5ZQdEujH3aRSjJj8Cg2o/bEVWRY8EcKE0FfTxxI0JA8D/fgyA+/IjeoMhj+L1mbz+TLK3X36p7wQ6LbVBUpsRBvdWNWypu2923JJplvBzaorIcytwPd4xsVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2ccaXfV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749173; x=1770285173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0MoEI0eBIjLxlnT1eDS9MskS78jdqEckyg9PwNiDdyI=;
  b=O2ccaXfVCPusRIu0bfxVqe2YdtXNPa5rxyg9BTk8c8B+9i6W9pfAVFUy
   SOZ8NoTc/98WDjIn2qEUYhi896KvassYMuM1EOmsX1mQmiOeb5ggvNQ9I
   xN50PhJ4ccB1oXJFxQ9Q7xbkbyZhhLbONKiDFOZf9SZG3YLSnP/n6pTqB
   tsxVbEPjzUJpjktD21B2vQxbk72JkEALTGkKz06Hq4R5IEO77YWoI3r61
   CfpH9F+23xOlMP9BtDrH2fRfe+dvFCf86gKLGeJn4F5BvX8L1qzA8tBLl
   z7tweHZ+UizWmiInv8GkHRnGBJoOEnjpcJLutM3zHyVNcYICR0Ke+gO5W
   w==;
X-CSE-ConnectionGUID: yzGJrGCQRwCBpq2PR/oS5w==
X-CSE-MsgGUID: 96SNR/MJTn27oikFsSHiUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38512596"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38512596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:51 -0800
X-CSE-ConnectionGUID: z6b4VcBfR9GeLAkm1hXeog==
X-CSE-MsgGUID: 8hgW7p/rRjCbTY2HZXW+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141744570"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 01:52:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 10C3663F; Wed, 05 Feb 2025 11:52:46 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 10/10] pinctrl: cy8c95x0: Fix comment style
Date: Wed,  5 Feb 2025 11:51:20 +0200
Message-ID: <20250205095243.512292-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
References: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One comment style is not aligned with the rest. Fix that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 6a2c7343bf55..3cfbcaee9e65 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -502,7 +502,8 @@ static int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
 	if (ret < 0)
 		return ret;
 
-	/* Mimic what hardware does and update the cache when a WC bit is written.
+	/*
+	 * Mimic what hardware does and update the cache when a WC bit is written.
 	 * Allows to mark the registers as non-volatile and reduces I/O cycles.
 	 */
 	if (cy8c95x0_wc_register(reg) && (mask & val)) {
-- 
2.43.0.rc1.1336.g36b5255a03ac


