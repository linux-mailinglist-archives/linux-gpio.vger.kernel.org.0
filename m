Return-Path: <linux-gpio+bounces-15373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FDBA28703
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7BED188A183
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCA822ACCF;
	Wed,  5 Feb 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epLmuozv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A622A7FC;
	Wed,  5 Feb 2025 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749172; cv=none; b=F+/mSMyR/cynDqBZmRX1WAh40ZrpVgXcl3eqaZr0aRaDDbzhe//UPpBy4Siz0N5QmkEvDBhvsWr61fZYOktPVRYkWyWc/prjVL9ypulZTuAUEKEGY34TqhpppjfiUjE7vnpFT/h+C2KcX2mISJ99C+b2jewwB6YYqh9e7TB42WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749172; c=relaxed/simple;
	bh=L0Mwe6DQAGdn7OC7tFDCP8gYeLBNzoodU0fyoPrg+WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ic1qkmsGen4it1IO//CzZJ0O2Qk7/92Z3cE9idFbn5KARRxbDg8e/z6i7kTx0NjwuCTvRpkDMGLHoX4hslGCZeiVZYNAcXu1+k78E9RdrniqprQdk8CApSJZ7ta8ugU5rrq5M0Al2kN2V+mjYVanEJsesBx/0QrufOxC6c9gemo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epLmuozv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749171; x=1770285171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L0Mwe6DQAGdn7OC7tFDCP8gYeLBNzoodU0fyoPrg+WM=;
  b=epLmuozvLQ1SwZPQhMz+9+7zRig5bxm7CHcYMQWspAlq1bBiFSA4CXbU
   EaKWcd7WGbimlCshUxeAGAYU+ovEUHwkIKSmTla0KsiBj9SRV8VKgj/l1
   IOi0qNvvjiNsPsgrXIWmzJO7aKeti3dRzQ0aY2ILofNUgnf1h1oggUBfM
   K/IY627oUCesKKyUBmDKiq5ftDOo+rS29Ya9TaWpLG8ADnMnsz/V/Grhx
   jNa0vL0wuzXyvWei0a9IGGszQonhhVUgvDDFT3OBrX486gfEu2n+sVYHq
   yWE6ritklVwxGxBooyzVX2vGob7G2lOeFJcPOQdv7i0Muxj+XaLDqnNGn
   w==;
X-CSE-ConnectionGUID: JXdaVpm8RSO00jWBU/MY4A==
X-CSE-MsgGUID: YmlNl2uUS1yuddVviMqeqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38512589"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38512589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:50 -0800
X-CSE-ConnectionGUID: Ohft9cOdRd+H1eJCcv4XCg==
X-CSE-MsgGUID: /xXOjKF6QLOCQrWMFhczVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141744566"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 01:52:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D8D143B1; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 05/10] pinctrl: cy8c95x0: Replace 'return ret' by 'return 0' in some cases
Date: Wed,  5 Feb 2025 11:51:15 +0200
Message-ID: <20250205095243.512292-6-andriy.shevchenko@linux.intel.com>
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

When it's known that the returned value can't be non-zero,
use 'return 0' explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 04b534b950d0..19f92ec83871 100644
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


