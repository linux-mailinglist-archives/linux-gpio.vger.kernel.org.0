Return-Path: <linux-gpio+bounces-15268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52927A25A92
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46D7B165D9B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46ED8205E24;
	Mon,  3 Feb 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwpWbNHv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6779320551B;
	Mon,  3 Feb 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588517; cv=none; b=aNt47ljswjqiKZq5VrxxSpjCx3XfTrc/tDlpf5IyV/AztSsYmdFhrLyYptnO7rexkJDRTXhSLQCVq21N2hW/LwwcOBhW82GANI50GO/VijLnhCSIRVY7OVK4sdPEJuufsWPmitPR/D39milYtnEYiEYQ+6YhGSXUnQCKCKL4z5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588517; c=relaxed/simple;
	bh=xe1zv0tzk/GSTJsUigGdLZtpoCH8O3sHDtIzPXb+VL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hY8Jf1DgEK2r8C7V5Oqnx9VOvsimVaUhwE1gInXf6Eia2YlxCiWcHHADaZ3tmVGTZny5U5+FBhdcnygLeGYBbTgjub9sQKmC944joXd7a9K8MHqxf+H84xR/k4ko1DmLRVRdkqEDUJdX7ai9Gm1GkwA2o5MS0AVUzNE5xKE9wmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwpWbNHv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588515; x=1770124515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xe1zv0tzk/GSTJsUigGdLZtpoCH8O3sHDtIzPXb+VL4=;
  b=PwpWbNHvGnxNuzQmSGcK0FsNOAR1h5YuxoVSeIttYfrM4vW5vd7bWtyY
   /SX6EuFp9PHKZGylMPiB2rnK6RMr4S3g+yj/sdP+a2WiG4KUkVcXjoa9x
   EPtivkeTPGpCPFfZY/7Wcu/TBMk3uTrt9XpOsB3ckfpTcsH0sYpvGaqIA
   WlRVi13xVGBPN9koIPoTwosoQM3XgNnTHQSL3zdHJHSDPsWRa9I3fE5Ie
   eHbSJ3sW78hesfBlPgrUul75LD+T4t8pv+iJ5knF+Cngc+GE7CEhz674W
   tFeMfjbR9J+YczP2dVgABPsU1mHcdiLhZyInlCD2O/6cqof1lKQDsmKlt
   g==;
X-CSE-ConnectionGUID: c4LAdA3kQqK5X/J1IE4c0w==
X-CSE-MsgGUID: kDxkuxfwSC6f8wbhhxocuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39217693"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39217693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:12 -0800
X-CSE-ConnectionGUID: pBfBV4VBQTaqf0soQX8MTA==
X-CSE-MsgGUID: j6rSZ+yaTAWu7m0sY7i1aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115287401"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 05:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0F4FD5E3; Mon, 03 Feb 2025 15:15:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 09/14] pinctrl: cy8c95x0: Replace 'return ret' by 'return 0' in some cases
Date: Mon,  3 Feb 2025 15:10:35 +0200
Message-ID: <20250203131506.3318201-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When it's known that the returned value can't be non-zero,
use 'return 0' explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index cd191cb1101e..e02cab05cbfc 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -517,7 +517,7 @@ static int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
 		regcache_cache_only(chip->regmap, false);
 	}
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1286,7 +1286,7 @@ static int cy8c95x0_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				unsigned long *configs, unsigned int num_configs)
 {
 	struct cy8c95x0_pinctrl *chip = pinctrl_dev_get_drvdata(pctldev);
-	int ret = 0;
+	int ret;
 	int i;
 
 	for (i = 0; i < num_configs; i++) {
@@ -1295,7 +1295,7 @@ static int cy8c95x0_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static const struct pinconf_ops cy8c95x0_pinconf_ops = {
-- 
2.43.0.rc1.1336.g36b5255a03ac


