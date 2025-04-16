Return-Path: <linux-gpio+bounces-18941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93AA8B638
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 721003B9360
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AFD245033;
	Wed, 16 Apr 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROlvuxnt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D2238D3B;
	Wed, 16 Apr 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797425; cv=none; b=Oa9+08X7pLqFbOVmlo7oIdShmVO6FV+WS1qEOzpZWtKKOKfPCFdgw5BTszuqRakuLAudZV8nz0Y11ebKwpdPgNtqt5t79hh1nA8dRigX5JB/WPiNMK6WkgA/4X7Bep7XFFL6U3a0LL8qfBcJSVXxmXLHKhw8iIOV9Ye4HpEfeAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797425; c=relaxed/simple;
	bh=mEAJfKTxnmGzJXvHWnS2NYncYtqJHnPpta/r+gzwIPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyk2uINgb31OUTmpLCuORX3tsBTcYCSuHSNZZnZ77IGH2BtDYvl6XPvCV6Lnv2M6IX567b+Grk0aWlFWVLB0LK3EwME9entrWkNewpXi3N+x9ERabkI1vfFbyc0DLyLXElf7a0ApLGD/BwfNfUFEUtChQ47LMSlWijhe9+hvkkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROlvuxnt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797424; x=1776333424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mEAJfKTxnmGzJXvHWnS2NYncYtqJHnPpta/r+gzwIPs=;
  b=ROlvuxntvXKSL1/hiBq3W4CyZQgoLGqWgT4CFZq4VTqDGl+o2ch70bC/
   YA5B9cMotIn4svwTYJtdnzVDGqAQaErWDHrd/kCCiGSxBNnC7L9dBZuwY
   s6HFgQkVDvcBkQB2tY+/I3n1B0htPzQJIa/K6E7iHsCt0g1AJvzHiqhhG
   dpPE2+j6pkWDZ6QdAjRcbvtRoZPZybmQtQvRsbBeylsynTnFvxh/IDMpi
   gi7dhqlSHwE1zTB75wuXT8i138DYVtFwfZ27NMtBJCbJRl7crni8NIWLj
   zzCSbGdkXLRCe3OZOYUvsU3YT7M6kdvfXCt7cin9G1ctplLKIJbX7Olr1
   A==;
X-CSE-ConnectionGUID: pSiP2UXTRpSAtVIH8QebFw==
X-CSE-MsgGUID: 6/bqMS6jSj6kF09SWfw8DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50144312"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="50144312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:56:50 -0700
X-CSE-ConnectionGUID: yBzS+E0vQfC69+F+OVYF6A==
X-CSE-MsgGUID: A8m+Yg6oTR2Gza+q5loj5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135259304"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 02:56:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 09339481; Wed, 16 Apr 2025 12:56:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/8] gpiolib: Print actual error when descriptor contains an error pointer
Date: Wed, 16 Apr 2025 12:55:11 +0300
Message-ID: <20250416095645.2027695-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
References: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the actual error when descriptor contains an error pointer.
This might help debugging those rare cases.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d6a161dd737d..7f8e8c33207e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2443,7 +2443,7 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 		return 0;
 
 	if (IS_ERR(desc)) {
-		pr_warn("%s: invalid GPIO (errorpointer)\n", func);
+		pr_warn("%s: invalid GPIO (errorpointer: %pe)\n", func, desc);
 		return PTR_ERR(desc);
 	}
 
-- 
2.47.2


